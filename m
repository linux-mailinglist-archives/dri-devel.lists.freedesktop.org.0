Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0884C1AE8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 19:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7883210E140;
	Wed, 23 Feb 2022 18:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0109110E140
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 18:25:28 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id p14so54150143ejf.11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0LRbA1gXot0INJs+Otu1KgbX3YpzjjYajCrr+quEoLQ=;
 b=ZKWN4BXtdA8114US0fta2m3OaulmM1X+0u0IF5kvK9W9cc4hFePOKnWszY9ReU4p9q
 YaKQcx6gk4Byr1Y11DL5Lgl4AAtIWtrilGF58lDf0oLOuEiVpnChAp8fOmPgG9JGuli7
 18cnTFyXtkZKXDvDPTgMR8+kxPslnLmDC/nGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0LRbA1gXot0INJs+Otu1KgbX3YpzjjYajCrr+quEoLQ=;
 b=TimZvROWh9uOrjn3LLhJOYIxqz0l4RK2mWRGtl568KfHzzYjEqNolcAzC61W8f/V+l
 1sm5u/8SDE4IoJAXB+uyby9OJhgCXO9a/SL1VrWia3jMgCw8eBNXxELwnWWzyUTXpHPk
 TKSpznuCO6vPbkTtBTYjX1vN9z1N4zmUvGPpmvbuw+1vE5rDZBh71JeO/GWM/IrLp5bT
 VHNw6InV+b3Dy2ItFcjUSsV+XUUlq5KE9wDhFcUrPi3BdvZNZUDP+sKQwD//hYL4cEtO
 HbCbrX23gmzhAVeX5nT3XZalpJpb0LMticxYpxqUsxesp329pjAuSM0b8efP948afigb
 9DAg==
X-Gm-Message-State: AOAM530g3kwjiNx+/L1O9tg9fxPK5pjbQJurkwK5IuoeilXth48U/k/B
 nha7BPvGoMDLj9Gq/xMSluh2l6TTTPz7RdjCtgM=
X-Google-Smtp-Source: ABdhPJyAz7AB0Ex5zeyJh4aBm93xpx984fI5Z4ELkQRxnYYaRN16xsprqrXltO8cJ6wDnHn63p7Naw==
X-Received: by 2002:a17:906:a1d3:b0:6d0:80ea:2fde with SMTP id
 bx19-20020a170906a1d300b006d080ea2fdemr714160ejb.344.1645640727092; 
 Wed, 23 Feb 2022 10:25:27 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52])
 by smtp.gmail.com with ESMTPSA id o21sm162682ejh.114.2022.02.23.10.25.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 10:25:26 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id o4so4279018wrf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:25:26 -0800 (PST)
X-Received: by 2002:a5d:5112:0:b0:1ed:c1da:4ad2 with SMTP id
 s18-20020a5d5112000000b001edc1da4ad2mr673550wrt.342.1645640725787; Wed, 23
 Feb 2022 10:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=XeUbw44OZ0H6hJhS3Pb7LgknVpKynHFxWpPx_qPQ6+QA@mail.gmail.com>
 <YNPDAyODcvlWtxpj@pendragon.ideasonboard.com>
 <CAD=FV=W6npK+NhethhY8ghtt7gwDHYfpX00w07nHE82anqx5aA@mail.gmail.com>
 <164563818901.4066078.3221991328451321918@Monstersaurus>
In-Reply-To: <164563818901.4066078.3221991328451321918@Monstersaurus>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Feb 2022 10:25:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VxOOhZMjVWzXHbEV_EZKRLxtuKgbko-7SUFMsj7upz0g@mail.gmail.com>
Message-ID: <CAD=FV=VxOOhZMjVWzXHbEV_EZKRLxtuKgbko-7SUFMsj7upz0g@mail.gmail.com>
Subject: Re: [RFC PATCH 11/11] drm/bridge: ti-sn65dsi86: Support hotplug
 detection
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 23, 2022 at 9:43 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Hi All,
>
> I'm working to respin the remainder of these patches, now that I have
> IRQ based HPD working on the SN65DSI86, and the (non-eDP) mode is used
> for Renesas R-Car boards.
>
> Quoting Doug Anderson (2021-06-24 00:51:12)
> > Hi,
> >
> > On Wed, Jun 23, 2021 at 4:26 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > > > @@ -1365,7 +1384,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> > > > >
> > > > >         pdata->bridge.funcs = &ti_sn_bridge_funcs;
> > > > >         pdata->bridge.of_node = client->dev.of_node;
> > > > > -       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> > > > > +       pdata->bridge.ops = (pdata->no_hpd ? 0 : DRM_BRIDGE_OP_DETECT)
> > > >
> > > > Checking for "no_hpd" here is not the right test IIUC. You want to
> > > > check for eDP vs. DP (AKA whether a panel is downstream of you or a
> > > > connector). Specifically if downstream of you is a panel then (I
> > > > believe) HPD won't assert until you turn on the panel and you won't
> > > > turn on the panel (which happens in pre_enable, right?) until HPD
> > > > fires, so you've got a chicken-and-egg problem. If downstream of you
> > > > is a connector, though, then by definition HPD has to just work
> > > > without pre_enable running so then you're OK.
> > >
> > > Agreed. It's even more true now that your rework has landed, as in the
> > > eDP case EDID is handled by the panel driver. I'll rework this.
> > >
> > > Should I also condition setting HPD_DISABLE to the presence of a panel
> > > then ? I could drop of_property_read_bool() and set
> > >
> > >         pdata->no_hpd = !!panel;
> > >
> > > > I guess then you'd need to figure out what to do if someone wants to
> > > > use "HPD" on eDP. Do you need to put a polling loop in pre_enable
> > > > then? Or you could just punt not support this case until someone needs
> > > > it.
> > >
> > > I think I'll stop short of saving the world this time, yes :-) We'll see
> > > what to do when this case arises.
> >
> > How about as a compromise you still call of_property_read_bool() but
> > add some type of warning in the logs if someone didn't set "no-hpd"
> > but they have a panel?
>
>
> Would a mix of the two work well?
>
> What about:
>
>         pdata->no_hpd = of_property_read_bool(np, "no-hpd");
>         if (panel && !pdata->no_hpd) {
>                 DRM_ERROR("Panels will not function with HPD. Enforcing no-hpd\n");
>                 pdata->no_hpd = true;
>         }
>
> That leaves it still optional to DP connectors, but enforced on eDP?

Yeah, that's fine with me. Nits would be to use "warn" instead of
"error" since this isn't fatal and use the non-SHOUTING versions of
the prints since the SHOUTING versions are deprecated.


> > > > > +                         | DRM_BRIDGE_OP_EDID;
> > > >
> > > > IMO somewhere in here if HPD is being used like this you should throw
> > > > in a call to pm_runtime_get_sync(). I guess in your solution the
> > > > regulators (for the bridge, not the panel) and enable pin are just
> > > > left on all the time,
> > >
> > > Correct, on my development board the SN65DSI86 is on all the time, I
> > > can't control that.
> > >
> > > > but plausibly someone might want to build a
> > > > system to use HPD and also have the enable pin and/or regulators
> > > > controlled by this driver, right?
> > >
> > > True. DRM doesn't make this very easy, as, as far as I can tell, there's
> > > no standard infrastructure for userspace to register an interest in HPD
> > > that could be notified to bridges. I think it should be fixable, but
> > > it's out of scope for this series :-) Should I still add a
> > > pm_runtime_get_sync() at probe time, or leave this to be addressed by
> > > someone who will need to implement power control ?
> >
> > IMO if you've detected you're running in DP mode you should add the
> > pm_runtime_get_sync() in probe to keep it powered all the time and
> > that seems the simplest. Technically I guess that's not really
> > required since you're polling and you could power off between polls,
> > but then you'd have to re-init a bunch of your state each time you
> > polled too. If you ever transitioned to using an IRQ for HPD then
> > you'd have to keep it always powered anyway.
>
>
> Hrm ... that's precisely what I've done. It's not IRQ based HPD...
>
> So would you like to see something like this during
> ti_sn_bridge_probe()?
>
>         /* The device must remain powered up for HPD to be supported. */
>         if (!pdata->no_hpd)
>                 pm_runtime_get_sync(pdata->dev);

Yeah, seems reasonable. Probably you'd want to add a devm action to put it too?

-Doug
