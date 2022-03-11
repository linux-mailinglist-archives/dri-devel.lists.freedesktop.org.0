Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 097834D6482
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 16:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D361D10E0AD;
	Fri, 11 Mar 2022 15:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F352510E0AD
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 15:25:08 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id r13so19845107ejd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 07:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zwx2dquPgXqVb9I6BHmiQ+yT5s0mktYKdstbqhp11lo=;
 b=LZw05L5Lr1SXFIo6n9NicjBiQs9xio5ncAzPl86VwNojgxdv5FPbVwMMXuEcJz2S20
 ot3tgRK3A5u9pbBVwcgTi2rS4v13JgC5uYbnVZmyUnMWKjqhW5TNSobrzT5CLci/ll6v
 VKRbsmHUHjxAMKGUnVtLcdXXgpKMegfNZ1Xz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zwx2dquPgXqVb9I6BHmiQ+yT5s0mktYKdstbqhp11lo=;
 b=2E2b3MaSEORKGpIe66vMHuduu9EVY7okJ1kt720L2v6jwN+lcXhywzknTWt1K0snUp
 fW8l/g3WjgiMKGayeXDsmDYyeo5C+v2YACdSByBthUCSF0v6+EVUa6lOlHleIqf+YoV/
 7+N0cb101s4kZK6gL2V1T6D7O+MKTmh0IQCl+QEV0q0rwJ9W/9bIOpaDgJZUdiKkbPO/
 Ehpv7kgzl12DCJQoJ7e9ZLDe900ROE4rFwLpJ3kMwY7whBVhbzOVIJQ6/HdYRR4FwPpl
 L/6ulHqBOcMz1/pNr9yIIdPwjMs7B9KTuf8A429qj2k0oe2fNcy1jBWzw07gyHEC5qYb
 LUQw==
X-Gm-Message-State: AOAM533E6EyVK8NcPnLbPINvx6/nPwPaxJkd/Q8rxJtImelnUo6eV25j
 eCpB5gFpi4Qm7T84/R/4He9YypQhAim6cZb0Mko=
X-Google-Smtp-Source: ABdhPJyyj5arbMoYA3LUq4L6rqIjGJp7V5hAG58/uWayYfXUseu/ZKVZ6sHV4vhyw4mrv3ZtaeiVvg==
X-Received: by 2002:a17:907:7f9f:b0:6db:720b:1232 with SMTP id
 qk31-20020a1709077f9f00b006db720b1232mr9204273ejc.355.1647012307015; 
 Fri, 11 Mar 2022 07:25:07 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 gv9-20020a170906f10900b006d7128b2e6fsm3077397ejb.162.2022.03.11.07.25.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 07:25:06 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so5573540wmf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 07:25:05 -0800 (PST)
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr15836065wmc.29.1647012305467; Fri, 11
 Mar 2022 07:25:05 -0800 (PST)
MIME-Version: 1.0
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
 <20220310152227.2122960-4-kieran.bingham+renesas@ideasonboard.com>
 <CAD=FV=UqTh-FLDyXvH=ED-4cbJ6ggDLsTGqhTeqNMsKDphbzYA@mail.gmail.com>
 <164697764297.2392702.10094603553189733655@Monstersaurus>
In-Reply-To: <164697764297.2392702.10094603553189733655@Monstersaurus>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 11 Mar 2022 07:24:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U6+VdLL0UM_j++fc5Wu7akm9LyJ_Ac19VCqbgPZiw3ZA@mail.gmail.com>
Message-ID: <CAD=FV=U6+VdLL0UM_j++fc5Wu7akm9LyJ_Ac19VCqbgPZiw3ZA@mail.gmail.com>
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

On Thu, Mar 10, 2022 at 9:47 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> > > +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> > > +{
> > > +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > > +
> > > +       regmap_write(pdata->regmap, SN_IRQ_HPD_REG, 0);
> > > +       pm_runtime_put_autosuspend(pdata->dev);
> >
> > Before doing the pm_runtime_put_autosuspend() it feels like you should
> > ensure that the interrupt has finished. Otherwise we could be midway
> > through processing an interrupt and the pm_runtime reference could go
> > away, right? Maybe we just disable the irq which I think will wait for
> > anything outstanding to finish?
>
> Should the IRQ handler also call pm_runtime_get/put then?

I thought about that, but I suspect it's cleaner to disable the IRQ
handler (and block waiting for it to finish if it was running). That
will ensure that the core isn't notified about HPD after HPD was
disabled.  Once you do that then there's no need to get/put in the irq
handler since we always hold a pm_runtime reference when the IRQ
handler is enabled.


> > > @@ -1247,9 +1342,29 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
> > >         pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
> > >                            ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
> > >
> > > -       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> > > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
> > >                 pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> > >
> > > +               if (!pdata->no_hpd)
> > > +                       pdata->bridge.ops |= DRM_BRIDGE_OP_DETECT;
> > > +       }
> > > +
> > > +       if (!pdata->no_hpd && pdata->irq > 0) {
> > > +               dev_err(pdata->dev, "registering IRQ %d\n", pdata->irq);
> > > +
> > > +               ret = devm_request_threaded_irq(pdata->dev, pdata->irq, NULL,
> > > +                                               ti_sn65dsi86_irq_handler,
> > > +                                               IRQF_ONESHOT, "sn65dsi86-irq",
> > > +                                               pdata);
> > > +               if (ret)
> > > +                       return dev_err_probe(pdata->dev, ret,
> > > +                                            "Failed to register DP interrupt\n");
> > > +
> > > +               /* Enable IRQ based HPD */
> > > +               regmap_write(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN);
> >
> > Why not put the above regmap_write() in the ti_sn_bridge_hpd_enable() call?
>
> I assumed the IRQ handler may get used by other non-HPD events. Which is
> also why it was originally registered in the main probe(). HPD is just
> one feature of the interrupts. Of course it's only used for HPD now
> though. I guess I could have solved the bridge dependency by splitting
> the IRQ handler to have a dedicated HPD handler function which would
> return if the bridge wasn't initialised, but went with the deferred
> registration of the handler.
>
> I can move this and then leave it to anyone else implementing further
> IRQ features to refactor if needed.

Sounds good. In general the pm_runtime_get reference need to go with
the IRQ enabling, so if someone else finds a non-HPD need then they'll
have to move that too.
