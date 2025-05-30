Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70CBAC8987
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 09:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C09010E7CA;
	Fri, 30 May 2025 07:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7FE10E7CA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 07:55:51 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-87de47585acso1216568241.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 00:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748591750; x=1749196550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ok4r17T6ykjtgTAKGiGjcQeNcSghR2j2d4lkyI3DeQI=;
 b=ZX/H86hACnkoXOhLW+TTXAeVSq/v59hCEt8RO4nPJVjzB5ROFYLQaXU3LN8dXG8FDk
 m9OOwH7JMfdpIG4UEDoTwqbW69RwRu27jHvY5G3US0F7H1iHpizfJsCF3l554rweh1nc
 nuGv56qwPPaHlFPSgmJz+ruUP7qJXidOyY2ZIlLv88rHmnONJ1wYdbYCBWWmJwXmeCtW
 EE+BheUGDySXxZ1MSln3vvPUxPrPA9QpsuoX3YuUQscXuOo+Y/0DKKa9IZa1zLD0CA5c
 cGtRed+HtmbCKbG7TIiYhp48inO1kruSogI2/fN+/9L/6gvdpWV1QrTeQ4BooE72TI0Q
 +YdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx1mIY3TQ52ID5GNz3uRqWDc485o5InFA3Naa/cIBFwCNLqAMVkGW1VWIN1Hc4PAx64SDUl7K+Wno=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLe0Ea6WpDQgMfsgZZFnYmjhf8F4PPzQ2AF1qybJTkovwj1csx
 jbTm/1k+gJ2iMo2wiUDC9peOUNrBMZzwvrrtOKI40WmxcojOxlsLDEG57aXp1fIU
X-Gm-Gg: ASbGncv5OVoyJmrBgsLXc+Jdm496vM/A3P+Ztioy9GhUyNTbDJFivYAr9TvQqg3f0IV
 t8kfaaBDz9bn9Xt5PJZ4wOlGLborE5Q6fLEuZhC9CxwgCCe+fbA0vKsKBf41BVaU72o+7dRcHXy
 X2IGe92rH7uBupl3KHWr80ngPtAoqe+0RhSyt+uBlaqwaCwntIUBk/AJMd7JWW4W2RY45Gd4BFz
 FfstY13uVixCe0ft7V4MAaRRLcH1HLYv31iP9JY9JEGlH32HkcX5mfgL7UtZI1cYiF0gwhuR8HB
 TZ9j5IrFMtiJpVC4B47Cvj1nL5EX/Qljgtwu52QxXlEzdjBbbNRUZZDhcWJHHEEJUp6b4jR+Xk9
 LQHqNmG/SHdmEMw==
X-Google-Smtp-Source: AGHT+IE4z2MosHEnvmI0bbyjEKuQ13GqUZV25UDcRWBvIUJ1Wkqqau2ByBPKZp6yKX4NkoLGZkB3sw==
X-Received: by 2002:a05:6102:4bca:b0:4e6:f3fa:bb14 with SMTP id
 ada2fe7eead31-4e6f3fabfdbmr221798137.12.1748591749578; 
 Fri, 30 May 2025 00:55:49 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4e644467c98sm2375965137.10.2025.05.30.00.55.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 00:55:49 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-4e5a0ec639dso1110474137.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 00:55:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXhS45A+e62sartFLlM090/u7wlwmibmW/FmXGQEIBab7an4r09f0G/8n2gquj+9n/gDT7XsIR+rgw=@lists.freedesktop.org
X-Received: by 2002:a05:6102:2acf:b0:4df:4a04:8d5e with SMTP id
 ada2fe7eead31-4e6e40f71admr2518734137.8.1748591748944; Fri, 30 May 2025
 00:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250529110418.481756-1-j-choudhary@ti.com>
 <2baf3c31-3edf-4c26-bd44-1d0560134871@ti.com>
In-Reply-To: <2baf3c31-3edf-4c26-bd44-1d0560134871@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 May 2025 09:55:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUi7pf1YfKRjMv_7VuKwjR5XekRXfcEzuPScGzHraGjyQ@mail.gmail.com>
X-Gm-Features: AX0GCFt7oJH7p6mCJm1bY-0aqdw-heaNTVCV9PIi-1gerZa683Q1Oz7IoT6_--U
Message-ID: <CAMuHMdUi7pf1YfKRjMv_7VuKwjR5XekRXfcEzuPScGzHraGjyQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: dianders@chromium.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com, 
 max.krummenacher@toradex.com, ernestvanhoecke@gmail.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 kieran.bingham+renesas@ideasonboard.com, linux-kernel@vger.kernel.org, 
 max.oss.09@gmail.com, devarsht@ti.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jayesh,

CC devicetree

On Fri, 30 May 2025 at 04:54, Jayesh Choudhary <j-choudhary@ti.com> wrote:
> On 29/05/25 16:34, Jayesh Choudhary wrote:
> > By default, HPD was disabled on SN65DSI86 bridge. When the driver was
> > added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
> > call which was moved to other function calls subsequently.
> > Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
> > HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
> > state always return 1 (always connected state).
> >
> > Set HPD_DISABLE bit conditionally based on "no-hpd" property.
> > Since the HPD_STATE is reflected correctly only after waiting for debounce
> > time (~100-400ms) and adding this delay in detect() is not feasible
> > owing to the performace impact (glitches and frame drop), remove runtime
> > calls in detect() and add hpd_enable()/disable() bridge hooks with runtime
> > calls, to detect hpd properly without any delay.
> >
> > [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
> >
> > Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
> > Cc: Max Krummenacher <max.krummenacher@toradex.com>
> > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > ---
> >
> > Changelog v2->v3:
> > - Change conditional based on no-hpd property to address [1]
> > - Remove runtime calls in detect() with appropriate comments
> > - Add hpd_enable() and hpd_disable() in drm_bridge_funcs
> > - Not picking up "Tested-by" tag as there are new changes
> >
> > v2 patch link:
> > <https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com/>
> >
> > [1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq/>

Thanks for your patch!

> > This would also require dts changes in all the nodes of sn65dsi86
> > to ensure that they have no-hpd property.
>
> DTS patch is posted now:
> <https://lore.kernel.org/all/20250529112423.484232-1-j-choudhary@ti.com/>

On all Renesas platforms handled by that patch, the DP bridge's HPD pin
is wired to the HPD pin on the mini-DP connector.  What am I missing?

Regardless, breaking backwards-compatibility with existing DTBs is
definitely a no-go.

> >   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 +++++++++++++++++++++++----
> >   1 file changed, 35 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 60224f476e1d..e9ffc58acf58 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -190,6 +190,7 @@ struct ti_sn65dsi86 {
> >       u8                              ln_assign;
> >       u8                              ln_polrs;
> >       bool                            comms_enabled;
> > +     bool                            no_hpd;
> >       struct mutex                    comms_mutex;
> >
> >   #if defined(CONFIG_OF_GPIO)
> > @@ -352,8 +353,10 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
> >        * change this to be conditional on someone specifying that HPD should
> >        * be used.
> >        */
> > -     regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> > -                        HPD_DISABLE);
> > +
> > +     if (pdata->no_hpd)
> > +             regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> > +                                HPD_DISABLE);
> >
> >       pdata->comms_enabled = true;
> >
> > @@ -1195,9 +1198,17 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >       int val = 0;
> >
> > -     pm_runtime_get_sync(pdata->dev);
> > +     /*
> > +      * The chip won't report HPD right after being powered on as
> > +      * HPD_DEBOUNCED_STATE reflects correct state only after the
> > +      * debounce time (~100-400 ms).
> > +      * So having pm_runtime_get_sync() and immediately reading
> > +      * the register in detect() won't work, and adding delay()
> > +      * in detect will have performace impact in display.
> > +      * So remove runtime calls here.
> > +      */
> > +
> >       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> > -     pm_runtime_put_autosuspend(pdata->dev);
> >
> >       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> >                                        : connector_status_disconnected;
> > @@ -1220,6 +1231,20 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
> >       debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
> >   }
> >
> > +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> > +{
> > +     struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > +
> > +     pm_runtime_get_sync(pdata->dev);
> > +}
> > +
> > +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> > +{
> > +     struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > +
> > +     pm_runtime_put_sync(pdata->dev);
> > +}
> > +
> >   static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> >       .attach = ti_sn_bridge_attach,
> >       .detach = ti_sn_bridge_detach,
> > @@ -1234,6 +1259,8 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> >       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> >       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> >       .debugfs_init = ti_sn65dsi86_debugfs_init,
> > +     .hpd_enable = ti_sn_bridge_hpd_enable,
> > +     .hpd_disable = ti_sn_bridge_hpd_disable,
> >   };
> >
> >   static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> > @@ -1322,7 +1349,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
> >                          ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
> >
> >       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> > -             pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> > +             pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT |
> > +                                 DRM_BRIDGE_OP_HPD;
> >
> >       drm_bridge_add(&pdata->bridge);
> >
> > @@ -1935,6 +1963,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
> >               return dev_err_probe(dev, PTR_ERR(pdata->refclk),
> >                                    "failed to get reference clock\n");
> >
> > +     pdata->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
> > +
> >       pm_runtime_enable(dev);
> >       pm_runtime_set_autosuspend_delay(pdata->dev, 500);
> >       pm_runtime_use_autosuspend(pdata->dev);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
