Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFA14F1A42
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 22:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD9010E54D;
	Mon,  4 Apr 2022 20:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5C610E52C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 20:53:30 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id ot30so12575050ejb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 13:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WueRDRfr6BAl+MBn1z171sKIcb7QdIl7NG0IfQdFZxw=;
 b=F+mlPqCKvYJg63av9BwZFo3zarr64WeRcUomzbVzgA0qV9cD8VD2ecZMs4YUG/BpAm
 eqTxcMKRb8F+bqSRghLJV/ZVMWnA7MwGy+pwr8rxtWx5gkKOxraKr5AGMavn8uUytUYy
 O/Xobx4sQQqEmKcNKmTV+R4hUQTn9ZtuAq1cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WueRDRfr6BAl+MBn1z171sKIcb7QdIl7NG0IfQdFZxw=;
 b=EaJOEyP9V9VfDKuB8UQcYSoSy87+JYGYH7+71XKF85fwAC+JMgkb8cWcsVeV+g35fk
 8ZsPYNvsc2Opcm7MlnnRb/eHCSRbjOopS5vES4h467xWLnFmvRPKUgQR/8b1Bll1T2MD
 BlKYa8lTMpUaTiu9ouBcNzO9KniTZ9eHUTsW0mlSbuFxinqyYkM9r3QLimcjBMASEeHP
 iogTByAWSmKHOcWbRCgezRTlufpEOjHMyTmpTTLfzsiM1KmJygkIh0OqhmqCGbiBFgSo
 ZONaKgmDMl8kflqxxrH/48enJdYw629lukaljVdguIR4Wqv6HJms7t1CvfSdiUyvVQha
 Pc5Q==
X-Gm-Message-State: AOAM533BEPUBlj75Fma1BZti4ndH7RCxHlTGLP0bckB3R0rQxwrvp9sa
 dxEjC4deZ4KhekQb8CatuMoJ4OMyUnvAMQ==
X-Google-Smtp-Source: ABdhPJyGTfE919WGBeviB2ZP/tg0BMMrm+0mdCnCQ1KbexeTLCaqK1XUVI8SqAAhv/rbEkkDWc0Ttw==
X-Received: by 2002:a17:907:6e03:b0:6e0:15ce:77ba with SMTP id
 sd3-20020a1709076e0300b006e015ce77bamr45467ejc.67.1649105608540; 
 Mon, 04 Apr 2022 13:53:28 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 hr38-20020a1709073fa600b006e0280f3bbdsm4790602ejc.110.2022.04.04.13.53.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 13:53:27 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id
 l7-20020a05600c1d0700b0038c99618859so318668wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 13:53:26 -0700 (PDT)
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr764798wmc.29.1649105606159; Mon, 04 Apr
 2022 13:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
 <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
 <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
 <CAA8EJppt9XONbgtKfmHmN+==QNqiVJeb8GKJFdZm=yyY-tgmHQ@mail.gmail.com>
In-Reply-To: <CAA8EJppt9XONbgtKfmHmN+==QNqiVJeb8GKJFdZm=yyY-tgmHQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Apr 2022 13:53:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U5-sTDLYdkeJWLAOG-0wgxR49VxtwUyUO7z2PuibLGsg@mail.gmail.com>
Message-ID: <CAD=FV=U5-sTDLYdkeJWLAOG-0wgxR49VxtwUyUO7z2PuibLGsg@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Apr 2, 2022 at 1:26 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 2 Apr 2022 at 20:06, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Sat, Apr 2, 2022 at 3:37 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On 01/04/2022 02:22, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Wed, Mar 30, 2022 at 9:03 AM Sankeerth Billakanti
> > > > <quic_sbillaka@quicinc.com> wrote:
> > > >>
> > > >> @@ -1547,6 +1593,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> > > >>
> > > >>          dp_display->encoder = encoder;
> > > >>
> > > >> +       ret = dp_display_get_next_bridge(dp_display);
> > > >> +       if (ret)
> > > >> +               return ret;
> > > >
> > > > It feels weird to me that this is in a function called "modeset_init",
> > > > though I certainly don't know the structure of the MSM display code
> > > > well enough to fully comment.
> > >
> > > It's called modeset_init() as it initializes KMS objects used by DP
> > > driver. We have similar functions for dsi and hdmi
> >
> > Sorry, I wasn't meaning to imply that modeset_init() was a bad name or
> > anything. Mostly saying that I wasn't sure that modeset init was the
> > proper time to populate the aux bus. ...but then again, perhaps it is
> > given the current structure of this driver?
> >
> >
> > > > My expectation would have been that
> > > > devm_of_dp_aux_populate_ep_devices() would have been called from your
> > > > probe routine and then you would have returned -EPROBE_DEFER from your
> > > > probe if you were unable to find the panel afterwards.
> > >
> > > I don't think it's possible to call it from probe() since
> > > drm_dp_aux_register() is called only from dp_display_bind().
> > > The PHY also isn't initialized at that moment, so we can not probe AUX
> > > devices.
> > >
> > > The overall semantics of the AUX bus is not clear to me.
> > > Typically the bus is populated (and probed) when devices are accessible.
> > > But for the display related buses this might not be the case.
> >
> > In general the AUX bus is modeled much like the i2c bus. You probe the
> > sub-device when you're able to transfer. Then you can confirm that the
> > device is actually there and init the device.
> >
> >
> > > For example for the DSI bus we clearly define that DSI transfer are not
> > > possible before the corresponding bridge's (or panel's) enable call.
> > >
> > > Maybe the same approach should be adopted for the AUX bus. This would
> > > allow us to populate the AUX bus before hardware access is actually
> > > possible, thus creating all the DRM bridges before the hardware is
> > > actually up and running.
> >
> > So I guess what you're proposing is that you could probe the devices
> > under the AUX bus and they could acquire resources (and possibly
> > return EPROBE_DEFER) at a point in time _before_ it's actually
> > possible to transfer. Then I guess you'd later do the transfer?
>
> Exactly.
>
> >
> > I guess conceivably one could re-design the DRM subsystem like that,
> > but I don't think it's trivial.
>
> The problem is that the DRM subsystem is already designed like that.
> All the bridge chains are static. They are created during the device
> probe. And the modes are populated later (via the get_modes()
> callback), after the HPD signal is delivered.
> For the encoder/bridge chains it is explicitly stated that the display
> pipe (clocks and timing signals) are not running before bridge's
> enable() callback or after the disable() callback being called.
>
> > Why? I believe that we need to know
> > things about the panel at probe time. For instance, we need to be able
> > to populate the panel's modes.
>
> As I said, panel modes are not needed at the probe time. The fact that
> most (if not all) of the panel drivers provide them in the platform
> data (and thus modes are typically populated at the probe time) comes
> from the fact that the panel is usually a known static piece of
> hardware. With the generic edp-panel this is no longer the case. A
> single device handles a (probed) variety of panels.

OK, so I misspoke when I said that the modes are populated during
probe time for edp-panel. They're not and I guess I managed to confuse
myself when I wrote my previous email. Instead they (and everything
else that comes from the EDID) isn't needed until the panel's
get_modes() is called, as you said. So, ignoring the backlight problem
talked about below, we could conceivably delay the reading of the EDID
until get_modes.

...but I think something still isn't quite right with your description
of how it works. Specifically:

1. I'm 99% certain that get_modes() is called _before_ enable, even
for the DP case. I have no idea how that works for you for DP if the
clocks / timing signals don't work until enable happens. Aside from my
previous observations of this, it also logically makes sense that
get_modes() needs to be called before enable(), doesn't it? When
enable() is called then don't you already know what mode userspace has
picked for you? How can userspace pick a mode to give to enable if you
can't query the modes until after enable?

2. As soon as you have told userspace that a display is present then,
I believe, it's legal for userspace to ask for the set of available
modes.

3. For DP and eDP HPD means something a little different. Essentially
there are two concepts: a) is a display physically connected and b) is
the display powered up and ready. For DP, the two are really tied
together. From the kernel's point of view you never "power down" a DP
display and you can't detect that it's physically connected until it's
ready. Said another way, on you tie "is a display there" to the HPD
line and the moment a display is there it's ready for you to do AUX
transfers. For eDP, in the lowest power state of a display it _won't_
assert its "HPD" signal. However, it's still physically present. For
eDP you simply have to _assume_ it's present without any actual proof
since you can't get proof until you power it up. Thus for eDP, you
report that the display is there as soon as we're asked. We can't
_talk_ to the display yet, though. So in get_modes() we need to be
able to power the display on enough to talk over the AUX channel to
it. As part of this, we wait for the signal named "HPD" which really
means "panel finished powering on" in this context.

NOTE: for aux transfer, we don't have the _display_ pipe and clocks
running. We only have enough stuff running to do the AUX transfer.
We're not clocking out pixels. We haven't fully powered on the
display. The AUX transfer is designed to be something that can be done
early _before_ you turn on the display.


OK, so basically that was a longwinded way of saying: yes, we could
avoid the AUX transfer in probe, but we can't wait all the way to
enable. We have to be able to transfer in get_modes(). If you think
that's helpful I think it'd be a pretty easy patch to write even if it
would look a tad bit awkward IMO. Let me know if you want me to post
it up.


> Compare it with the generic monitor:
> We have a known bridge (display-connector.c), so the driver can build
> the display chain. However a set of modes is not known till the actual
> monitor is plugged into the device.
>
> > To get this information we need the
> > EDID which means we need to be able to do a transfer. If we're using
> > an AUX backlight we also need to add info about the backlight at probe
> > time and that also needs the transfer to work.
>
> Yes, the backlight is the problem in the suggested design. I'm not
> sure when panel->backlight has to  be populated for things to work.
> If we can set it after the probe but before calling into
> mode_set/drm_bridge_chain_enable(), then it should be fine.

Actually we _probably_ can do this. Right now it only affects a small
subset of panels (those that use AUX backlight) and I can give it a
shot if this is the last blocker.

...this is even more awkward than the above, though, because the first
first call to get_modes() will actually _cause_ the backlight device
to show up. That's not super elegant but it might work OK?


> > So I guess the net result is maybe we should just keep it where it is.
> > Long term I'd be interested in knowing if there's a reason why we
> > can't structure the driver so that AUX transfers can happen with less
> > intertwining with the rest of the code, but that can happen later. I
> > would expect that you'd basically just need clocks and regulators on
> > and maybe your PHY on. Ideally with some pm_runtime fun we should be
> > able to do that independently with anything else the driver needs to
> > do?
>
> Not really. The driver is shared between the DP and eDP. And the DP
> (well, combo DP+USB-C) part has quite logical expectations that e.g.
> AUX channel is not up until all negotiations about the USB-C altmodes
> are done and the HPD event is delivered. This is the source for my
> suggestion regarding AUX bus rework/redesign. For non-eDP cases the
> connected device becomes known much later than the dp_parser code runs
> (and much later than all the bridges are to be instantiated).
>
> Another option would be to keep common drm/msm/dp core code and split
> the actual driver code into two distinct code paths: one supporting
> DP, another one supporting eDP. I think, up to now we were trying hard
> to stay away from such a split.

Even for eDP the AUX transfer shouldn't happen until after HPD is
asserted. That's why the AUX transfer function has to wait for HPD.
However, for eDP it's a requirement to register/create the AUX bus
before HPD is asserted. We went through lots of design discussions and
the end result of it all was that we pass the AUX bus to the panel at
the panel's probe time. This is something I don't think we want to
revisit.

Logically there are simply some things that will have to be different
for eDP and DP. It really stems from the case that in the lowest power
state of eDP that we truly can't tell if the panel is there and thus
we have to assume it's there. It also comes from the fact that, in
eDP, the panel driver is in charge of doing power sequencing across
several regulators / GPIOs including getting the timing right.


-Doug
