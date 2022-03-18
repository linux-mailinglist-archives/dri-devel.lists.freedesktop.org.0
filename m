Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 081DB4DE3CF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 22:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0BA10E295;
	Fri, 18 Mar 2022 21:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6233E10E2D3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 21:59:13 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id j15so5401379eje.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 14:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nZ+Qd2I3q/p2XGXq/Yxj9W7hoeC6AUT40y63snQyKHs=;
 b=ZfJPEh4fkbO376ESnnE3WZyND+Cx3bDFfiJz4yylIK5LuqgAZNfQh/hqfaUtEb0l/m
 7Im83EsCAa97Oly8690SRQkKrnl7MkhvICo3wfjtg5VBPzVBnm9/1hj6WwhsGQ9xYrCr
 BQi8c8QIvAVHcDwh9v61SiQON6Ho1SnpDNogw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nZ+Qd2I3q/p2XGXq/Yxj9W7hoeC6AUT40y63snQyKHs=;
 b=l3xuQxtLDSmzcF2TMN/qqnbj841UzrJx0Ii8qLm+9vOz9HZ8sBd175hfvBx/S2sKUe
 wkN61fxO75/d41c+XeQn20RIXll9eBUm3MbwkGw/XO0T93a0qvpBSuB7ry/82WVKW6CS
 1uPZIIjy7gxGjN3rlj594xpHe1jwlFHaFaMMjnifPVBf/fjf2GMxjnzgXPtwBp2BtEWO
 oebDO+Xcxl92HO0dbNdDt1I//tKiq1JMKbIFjpf8amV7h6Uizk+HSZho0tkXZbF759BR
 iv5gi1TYJKhVmk1RzQcS0SEQtoRKAF/fJ9ugRdb3nVdUsnUfFkHHaAqStXdqlQpuRUjK
 dW8A==
X-Gm-Message-State: AOAM5312EnDbXcVCcTqGFNboQwib149R3Jx2Y7IN/EpMq5XSo9kAat+a
 9torA86iXmfXU3iNVwkWcwIqLeRvcCU4UyEjG1Y=
X-Google-Smtp-Source: ABdhPJxdBc0yoYYs2Qmrnzje8CU0uWzlx7ZCWtdOHE5FRgQMfS83orfLKbSVQo08N1tCI3zlV6vTNA==
X-Received: by 2002:a17:907:c16:b0:6da:7d72:1357 with SMTP id
 ga22-20020a1709070c1600b006da7d721357mr11040163ejc.251.1647640751164; 
 Fri, 18 Mar 2022 14:59:11 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 20-20020a17090601d400b006caff964e30sm4243607ejj.19.2022.03.18.14.59.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 14:59:10 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id t11so13415521wrm.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 14:59:09 -0700 (PDT)
X-Received: by 2002:a5d:4491:0:b0:203:f63a:e89b with SMTP id
 j17-20020a5d4491000000b00203f63ae89bmr4159173wrq.342.1647640749326; Fri, 18
 Mar 2022 14:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-7-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n520pQKM7mFSE_00ER+F9RKUPrN+y4U8fmsxi7FoFMyOrA@mail.gmail.com>
 <CAD=FV=UWF8K9JPJXFSGMRK-HmCi+2jM3aN6Uy7hyDSu1_azF+w@mail.gmail.com>
 <CAE-0n53U=bqPTGtPx2Ho5axtO6EL6WtOtmFisxSufC6OZERV1Q@mail.gmail.com>
In-Reply-To: <CAE-0n53U=bqPTGtPx2Ho5axtO6EL6WtOtmFisxSufC6OZERV1Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Mar 2022 14:58:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WaK8VFC-BvsFpnUv3mW4svGggQTw1hh+zRCEhGvbgYMQ@mail.gmail.com>
Message-ID: <CAD=FV=WaK8VFC-BvsFpnUv3mW4svGggQTw1hh+zRCEhGvbgYMQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] drm/msm/dp: wait for hpd high before any sink
 interaction
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 quic_khsieh@quicinc.com, Andy Gross <agross@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, quic_vproddut@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>, quic_kalyant <quic_kalyant@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, krzk+dt@kernel.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 18, 2022 at 1:17 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > > > +       ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
> > >
> > > Why are we making aux transactions when hpd isn't asserted? Can we only
> > > register the aux device once we know that state is "connected"? I'm
> > > concerned that we're going to be possibly polling the connected bit up
> > > to some amount of time (0x0003FFFF usecs?) for each aux transfer when
> > > that doesn't make any sense to keep checking. We should be able to check
> > > it once, register aux, and then when disconnect happens we can
> > > unregister aux.
> >
> > This is for eDP and, unless someone wants to redesign it again, is
> > just how it works.
> >
> > Specifically:
> >
> > 1. On eDP you _always_ report "connected". This is because when an eDP
> > panel is turned off (but still there) you actually have no way to
> > detect it--you just have to assume it's there. And thus you _always_
> > register the AUX bus.
>
> Is reporting "connected" the same as HPD being asserted in the case of
> eDP? I can understand wanting to report "connected", because as you say,
> the panel is always connected; there aren't dongles or cables involved.

No. What I mean by connected is that when DRM asks "hey, do you have a
panel" connected then for eDP we always say "yes" regardless of any
hardware state.

HPD is a _huge_ misnomer for eDP and IMO the name causes lots of
confusion. It's not "hot plug detect". You don't hot plug eDP. It's
really "panel ready / panel IRQ"


> But the state of the HPD pin is changing at runtime, and eDP supports
> irq_hpd pulses from what I recall, for "link management".
>
> I think this device requires the status bit in the hardware to say it is
> "connected" before aux transactions are guaranteed to work. Presumably
> the HPD pin could go be asserted at the SoC's pad and there could be
> some time still where the hardware status bit hasn't flipped over to
> "connected" yet and thus aux transactions are going to fail. Can qcom
> confirm this?
>
> >
> > 2. When we are asked to read the EDID that happens _before_ the normal
> > prepare/enable steps. The way that this should work is that the
> > request travels down to the panel. The panel turns itself on (waiting
> > for any hardcoded delays it knows about) and then initiates an AUX
> > transaction. The AUX transaction is in charge of waiting for HPD.
>
> Are we talking about generic_edp_panel_probe()? Why doesn't that poll
> hpd gpio like panel_edp_prepare_once() does?

There's no HPD GPIO in this case, right?

In the trogdor case we ended up not using the HPD that was part of the
ti-sn65dsi86 controller because it was fairly useless (it debounced
for far too long), so we ended up hooking it up as a GPIO and I guess
gave up on getting the extra notifications from the panel. Maybe a
good thing, in hindsight, that we didn't do PSR because that might
have been a pain.

In any case, originally I had the GPIO being handled by the
ti-sn65dsi86 controller driver and that seemed like it made sense to
me (after all, the ti-sn65dsi86 driver would have to handle HPD if
this went to the dedicated HPD pin) but got told "no, put it in the
panel" by both you and Laurent [1].

[1] https://lore.kernel.org/r/20200415203256.GP4758@pendragon.ideasonboard.com/


> Are there any links to
> discussions about this I can read?

I'm not sure if there's any more than the conversation I pointed at
above where we talked about hpd-gpios. Atop that, I believe I just
realized that this was the only way it could work without re-designing
again.

To some extent the status quo is documented in commit a64ad9c3e4a5
("drm/panel-edp: Fix "prepare_to_enable" if panel doesn't handle
HPD"). I wrote that commit when I thought about how HPD would need to
be handled if it was a dedicated pin on the controller and the panel
didn't have knowledge about it.


> Pushing hpd state checking into aux
> transactions looks like the wrong direction. Also, as I said up above I
> am concerned that even checking the GPIO won't work and we need some way
> to ask the bridge if HPD is asserted or not and then fallback to the
> GPIO method if the display phy/controller doesn't have support to check
> HPD internally. Something on top of DRM_BRIDGE_OP_HPD?

If we could somehow get the HPD status from the bridge in the panel
driver it definitely would be convenient. It does feel like that's an
improvement that could be done later, though. We've already landed a
few instances of doing what's done here, like for parade-ps8640 and
analogix_dp. I suspect designing a new mechanism might not be the most
trivial.

I haven't actually tried it, but I suspect that to get something like
what you're talking about we'd have to get the rest of drm to know
that for eDP ports that it should assume something is connected
_regardless_ of what the "detect" / "HPD" options say. Then we'd have
to extend the edp-panel code to be able to be able to query the next
bridge in the chain if a GPIO wasn't provided.


> > For the DP case this should not cause any significant overhead, right?
> > HPD should always be asserted so this is basically just one extra IO
> > read confirming that HPD is asserted which should be almost nothing...
> > You're just about to do a whole bunch of IO reads/writes in order to
> > program the AUX transaction anyway.
>
> In the DP case the dongle/cable can be disconnected in the middle of aux
> transactions. If that happens we could be waiting a while in this
> transfer function to timeout looking for the status bit. The driver
> already gets an "unplug" irq when the cable is disconnected though so it
> would be better to figure out a way to stop the aux transactions quickly
> when that happens without having to read the hardware and poll the bit
> that we already know is doomed to timeout. I think apple dongles throw
> this logic for a loop though because the HDMI cable can be disconnected
> from the dongle and then we don't see an "unplug" irq, just the number
> of sinks becomes 0. Maybe there's an irq_hpd event, not sure.

Ah, interesting. Having a DP cable unplugged in the middle of an aux
transaction does seem like it could be a problem. What if we just wait
in the case our bridge.type is "DRM_MODE_CONNECTOR_eDP"? That should
be easy, right?


> > > > +       if (ret) {
> > > > +               DRM_DEBUG_DP("DP sink not ready for aux transactions\n");
> > > > +               goto exit;
> > > > +       }
> > > > +
> > > >         dp_aux_update_offset_and_segment(aux, msg);
> > > >         dp_aux_transfer_helper(aux, msg, true);
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > > index fac815f..2c3b0f7 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > > @@ -242,6 +242,29 @@ void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
> > > >         phy_calibrate(phy);
> > > >  }
> > > >
> > > > +int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
> > > > +{
> > > > +       u32 state, hpd_en, timeout;
> > > > +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> > > > +                               struct dp_catalog_private, dp_catalog);
> > > > +
> > > > +       hpd_en = dp_read_aux(catalog, REG_DP_DP_HPD_CTRL) &
> > > > +                                       DP_DP_HPD_CTRL_HPD_EN;
> > >
> > > Use two lines
> > >
> > >         hpd_en = dp_read_aux();
> > >         hpd_en &= DP_DP_HPD_CTRL_HPD_EN;
> > >
> > > > +
> > > > +       /* no-hpd case */
> > > > +       if (!hpd_en)
> > > > +               return 0;
> >
> > I guess reading from hardware is fine, but I would have expected the
> > driver to simply know whether HPD is used or not. Don't need to read
> > it from hardware, do we? It's not like it's changing from minute to
> > minute--this is something known at probe time.
>
> Are you saying that HPD is always asserted?

I don't think this is looking for HPD assertion, is it? This is
looking for whether the HPD interrupt is enabled, isn't it? This is to
support the case of eDP panels where we didn't hook the HPD line up,
right? It should be known at probe time whether we've hooked HPD up or
not. ...or am I misreading?


> That doesn't sound right.
> My understanding is that HPD will be asserted after the panel is powered
> up. Before that HPD is deasserted. Similarly, when we power down the
> panel, HPD will be deasserted. I guess DRM wants to assume that an eDP
> panel is always connected? That sounds like it might be OK as long as
> userspace doesn't use "connected" to know that it's OK to do things like
> read/write aux or push pixels to the panel when HPD is deasserted.

IMO having userspace reading / writing aux directly and expecting it
to work is a terrible idea anyway. It's _maybe_ sorta OK in the DP
case, but it's really not good in the eDP case. To me it's sorta like
expecting things to be amazing and foolproof when you go behind the
kernel's back and write to an i2c device using `i2cset -f`. Sure, it
might work, but it can also confuse the heck out of things. It also
turns out to be a huge problem when you get to PSR because userspace
will get errors if it tries to write to the AUX channel and the panel
is in PSR mode. This came up in the context of Brian's analogix dp
patches [1]. The right answer, in my mind, is to treat userspace
accessing the AUX channel directly as more of a debug feature, at
least for eDP panels.

In terms of userspace pushing pixels to the panel, I don't think
that's quite the same, is it? Generally userspace is in charge of
whether the eDP panel is powered on or powered off, isn't it?

So generally I think that for eDP a panel is always "connected" in all
senses of the word. It might not be "powered" at some given point of
time, but it's always connected.

[1] https://lore.kernel.org/r/CAD=FV=VYe1rLKANQ8eom7g8x1v6_s_OYnX819Ax4m7O3UwDHmg@mail.gmail.com/


-Doug
