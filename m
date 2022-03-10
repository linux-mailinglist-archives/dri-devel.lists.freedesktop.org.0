Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D094D5513
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 00:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F0910E172;
	Thu, 10 Mar 2022 23:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79BA10E172
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 23:10:29 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id s10so8959598edd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 15:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XTE9rVnkuj0LMpq7vU2LRlI4AFYhtjIA8F1mGbD5ltU=;
 b=c3ixXJGaiHRNX5hUWR2fAaOhNH1oY3csULtltMrpIqFAz++28BEFtjoaWM8eULXtd8
 n42vvgEgHkHw02bkBUiRN/KKqskZFiaWyb4b9QGGCLlwPHmJXuHKDqaukcMmsEneUHH/
 H8XtQhxleMXO1GBeCldLEqsziE+l/81y9MxWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XTE9rVnkuj0LMpq7vU2LRlI4AFYhtjIA8F1mGbD5ltU=;
 b=xs5QC1m0KuGhxPe5cV2EFxM2lIoW8kANCv1xamX75w7/tXztg/0IxcroVc8yAe+Sf3
 mekLJZ0Xc2I1eKKjOdiWXI7uMHsCViM7rcvJzgL6gN5qKhVrmOYMhlhbGVp/5k9xqAGf
 8mMd0TO1ES7NE4oEd4YsuPEZKsYqrNyDQxQgreQznr4vLLxWw4MM+EUCzS1iobw9JSAV
 hZERjKs8aPoGn0C0/HEy/0RBiaX8tne/VifodeUM1xOV+9euyMg5k2DCG+qs0jK4dp7u
 nG+7E9RKv2iQtMw6CVHWN3oPctSnMFaSpN3sEXvsVO1iJsryUYvxxRu9s6YgfmP5sVLg
 Og/w==
X-Gm-Message-State: AOAM5307IAjFRxFSz98A08VfKa3Yt20l1mnyAjfMktBTbyW9Q5+/Nc4N
 85zorg2BTZ9GhaMCzW0lk0RFsTZomZNdhifM
X-Google-Smtp-Source: ABdhPJxhbwOR4l46ZFbgrFOCooecpNjpHoKVlmzrEpiAPfv24Nau70emT7XcBh5jCENOkn4TADKeYA==
X-Received: by 2002:a05:6402:5304:b0:413:8a0c:c54a with SMTP id
 eo4-20020a056402530400b004138a0cc54amr6515499edb.172.1646953827707; 
 Thu, 10 Mar 2022 15:10:27 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 l9-20020a056402254900b00416b0ec98b5sm1266085edb.45.2022.03.10.15.10.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 15:10:26 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id i66so4171888wma.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 15:10:25 -0800 (PST)
X-Received: by 2002:a7b:c042:0:b0:389:7336:158b with SMTP id
 u2-20020a7bc042000000b003897336158bmr5455866wmc.15.1646953825247; Thu, 10 Mar
 2022 15:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
 <20220310152227.2122960-4-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220310152227.2122960-4-kieran.bingham+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Mar 2022 15:10:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UqTh-FLDyXvH=ED-4cbJ6ggDLsTGqhTeqNMsKDphbzYA@mail.gmail.com>
Message-ID: <CAD=FV=UqTh-FLDyXvH=ED-4cbJ6ggDLsTGqhTeqNMsKDphbzYA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: ti-sn65dsi86: Support hotplug detection
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 10, 2022 at 7:22 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> @@ -1135,6 +1161,36 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
>         pm_runtime_put_sync(pdata->dev);
>  }
>
> +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +       int val;
> +
> +       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);

Don't you need a pm_runtime_get_sync() before this and a
put_autosuspend() after? The "detect" will be used in the yes-HPD but
no-IRQ case, right? In that case there's nobody holding the pm_runtime
reference.

Also, a nit that it'd be great if you error checked the regmap_read().
I know this driver isn't very good about it, but it's probably
something to get better. i2c transactions can fail. I guess another
alternative would be to init "val" to 0...


> +       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> +                                        : connector_status_disconnected;
> +}
> +
> +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +
> +       /* The device must remain active for HPD to function */
> +       pm_runtime_get_sync(pdata->dev);
> +       regmap_write(pdata->regmap, SN_IRQ_HPD_REG,
> +                    IRQ_HPD_EN | IRQ_HPD_INSERTION_EN |
> +                    IRQ_HPD_REMOVAL_EN | IRQ_HPD_REPLUG_EN);
> +}
> +
> +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +
> +       regmap_write(pdata->regmap, SN_IRQ_HPD_REG, 0);
> +       pm_runtime_put_autosuspend(pdata->dev);

Before doing the pm_runtime_put_autosuspend() it feels like you should
ensure that the interrupt has finished. Otherwise we could be midway
through processing an interrupt and the pm_runtime reference could go
away, right? Maybe we just disable the irq which I think will wait for
anything outstanding to finish?


> @@ -1223,6 +1282,34 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
>         return 0;
>  }
>
> +static irqreturn_t ti_sn65dsi86_irq_handler(int irq, void *arg)
> +{
> +       struct ti_sn65dsi86 *pdata = arg;
> +       int ret;
> +       unsigned int hpd;
> +
> +       ret = regmap_read(pdata->regmap, SN_IRQ_HPD_STATUS_REG, &hpd);
> +       if (ret || !hpd)
> +               return IRQ_NONE;
> +
> +       if (hpd & IRQ_HPD_INSERTION_STATUS)
> +               drm_bridge_hpd_notify(&pdata->bridge, connector_status_connected);
> +
> +       if (hpd & IRQ_HPD_REMOVAL_STATUS)
> +               drm_bridge_hpd_notify(&pdata->bridge, connector_status_disconnected);
> +
> +       /* When replugged, ensure we trigger a detect to update the display */
> +       if (hpd & IRQ_HPD_REPLUG_STATUS)
> +               drm_bridge_hpd_notify(&pdata->bridge, connector_status_disconnected);

How does the ordering work here if _both_ insertion and removal are
asserted? Is that somehow not possible? Should this be "else if" type
statements then, or give a warn if more than one bit is set, or ... ?


> +       /* reset the status registers */
> +       regmap_write(pdata->regmap, SN_IRQ_HPD_STATUS_REG,
> +                    IRQ_HPD_STATUS | IRQ_HPD_INSERTION_STATUS |
> +                    IRQ_HPD_REMOVAL_STATUS | IRQ_HPD_REPLUG_STATUS);

IMO this regmap_write() belongs right after the read and should be
based on what you read--you shouldn't just clear all of them. AKA:

a) Read to see what interrupt are asserted.
b) Ack the interrupts that you saw asserted.
c) Process the interrupts that you saw asserted.

If you process before acking then you can miss interrupts (in other
words if you do "a" then "c" then "b" then you can miss interrupts
that come in after "b" but before "c".


> @@ -1247,9 +1342,29 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>         pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
>                            ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
>
> -       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
>                 pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
>
> +               if (!pdata->no_hpd)
> +                       pdata->bridge.ops |= DRM_BRIDGE_OP_DETECT;
> +       }
> +
> +       if (!pdata->no_hpd && pdata->irq > 0) {
> +               dev_err(pdata->dev, "registering IRQ %d\n", pdata->irq);
> +
> +               ret = devm_request_threaded_irq(pdata->dev, pdata->irq, NULL,
> +                                               ti_sn65dsi86_irq_handler,
> +                                               IRQF_ONESHOT, "sn65dsi86-irq",
> +                                               pdata);
> +               if (ret)
> +                       return dev_err_probe(pdata->dev, ret,
> +                                            "Failed to register DP interrupt\n");
> +
> +               /* Enable IRQ based HPD */
> +               regmap_write(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN);

Why not put the above regmap_write() in the ti_sn_bridge_hpd_enable() call?

-Doug
