Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC2F51CA7C
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 22:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC7310F02D;
	Thu,  5 May 2022 20:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C963A10EE44
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 20:21:29 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id g20so6479206edw.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 13:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ez/MqyyqDDSMqwdh56DJVGkRDFCgf83uI/POXQbKlPM=;
 b=B5t5XXE9kkx9KeDssYGdlWh0/Orjatugfqp6wSniFSrQYI/E4R1yqCb0n5NeTsOhqj
 oj7MLa6ew1d9wv/wWZ3ZpLYLKniQN4bndiqAQa1DwIpSneX2yHIAhzrxsl3fObqbICV8
 Ol6lF+01cm7Tr6+9PyUXPlAxB2apy8cujgoeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ez/MqyyqDDSMqwdh56DJVGkRDFCgf83uI/POXQbKlPM=;
 b=OFhO7nKDBkQx28A6L1taGNuNDRVWMh7+arGiTyjq7ociMIRWcR3pJO5ZNPNFgpWDVC
 YWmOaZuVxB06JA6hzu9Pj+39YUTea7pInWSiTr4RTMFcnvdnJxkaeN9gIpT7Sl3Q4X1c
 K3ctXwE13VuexOrAwjgijpgRUVC9PuHVstBldqOpDZLbGTZNGJLp6wptd96gUpb5DC4I
 kJdk8CtKJNuc42IWAc1BE7ysOjoHHvvlB1+7FnWqhuXzO5bdTrXvWupRGJE/7IFeLm8T
 Dc3YyeubeDYZ7+EzzKdqx8OLpy+vRcguY1P+DaYCJPB6wK6ptBt3xqBFoH4d4po8WTHf
 jreg==
X-Gm-Message-State: AOAM531B+fvEtemzEH8xvflEx1nQhtuH/J+VAsTtEb2lKwAQfsN2aRYU
 EX4z2hiihsvHPIWBX+2b0h5YdK02xAl6ar8k8Co=
X-Google-Smtp-Source: ABdhPJwpao9vgou5KZUxzQL67kRHyW51XzX1iuM6b5s1M7O++VPpbxBHsfJrKk4DX2mhsgzv4luFKg==
X-Received: by 2002:a05:6402:1cc1:b0:413:2cfb:b6ca with SMTP id
 ds1-20020a0564021cc100b004132cfbb6camr31142821edb.265.1651782088020; 
 Thu, 05 May 2022 13:21:28 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 zd10-20020a17090698ca00b006f3ef214e4fsm1063241ejb.181.2022.05.05.13.21.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 13:21:26 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id
 125-20020a1c1983000000b003941f354c62so3281646wmz.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 13:21:26 -0700 (PDT)
X-Received: by 2002:a7b:c7c2:0:b0:394:18b:4220 with SMTP id
 z2-20020a7bc7c2000000b00394018b4220mr6529276wmk.118.1651782085642; Thu, 05
 May 2022 13:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
 <YnJv3B/85hTz54SC@intel.com>
 <CAD=FV=WndmKuEB0=OVQP9YuJaSmD0uxkNs5LE0wWsFj7gBvhBA@mail.gmail.com>
 <1c6c9fde6e85f09cc89ea8dc6e8716fef58f3ee1.camel@redhat.com>
 <YnPjO4kbjezQl5Da@intel.com>
 <CAD=FV=XbZEagm5qR207mcVm1Ry=bGeuRAqTYx3SBoZfyo6fSkg@mail.gmail.com>
 <YnPoYsnx7IeBfJ5D@intel.com>
 <CAD=FV=WxxEGM4cLBHGMeRBFDAXGJJF105kLZ588JSFJRg8PM8A@mail.gmail.com>
 <CAA8EJppSof0wZ9nph8v_2pgRZj2BJiZ1hTBfLgQ+CFsT+h_dyQ@mail.gmail.com>
In-Reply-To: <CAA8EJppSof0wZ9nph8v_2pgRZj2BJiZ1hTBfLgQ+CFsT+h_dyQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 May 2022 13:21:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WuAV-mrm0Bokqyyn7UgP5-jyNdhh8e4rqJibJ0Kutp_Q@mail.gmail.com>
Message-ID: <CAD=FV=WuAV-mrm0Bokqyyn7UgP5-jyNdhh8e4rqJibJ0Kutp_Q@mail.gmail.com>
Subject: Re: [PATCH] drm: Document that power requirements for DP AUX transfers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Jani Nikula <jani.nikula@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 5, 2022 at 1:10 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 5 May 2022 at 18:53, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, May 5, 2022 at 8:29 AM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Thu, May 05, 2022 at 08:00:20AM -0700, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Thu, May 5, 2022 at 7:46 AM Ville Syrj=C3=A4l=C3=A4
> > > > <ville.syrjala@linux.intel.com> wrote:
> > > > >
> > > > > On Wed, May 04, 2022 at 02:10:08PM -0400, Lyude Paul wrote:
> > > > > > On Wed, 2022-05-04 at 09:04 -0700, Doug Anderson wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Wed, May 4, 2022 at 5:21 AM Ville Syrj=C3=A4l=C3=A4
> > > > > > > <ville.syrjala@linux.intel.com> wrote:
> > > > > > > >
> > > > > > > > On Tue, May 03, 2022 at 04:21:08PM -0700, Douglas Anderson =
wrote:
> > > > > > > > > When doing DP AUX transfers there are two actors that nee=
d to be
> > > > > > > > > powered in order for the DP AUX transfer to work: the DP =
source and
> > > > > > > > > the DP sync. Commit bacbab58f09d ("drm: Mention the power=
 state
> > > > > > > > > requirement on side-channel operations") added some docum=
entation
> > > > > > > > > saying that the DP source is required to power itself up =
(if needed)
> > > > > > > > > to do AUX transfers. However, that commit doesn't talk an=
ything about
> > > > > > > > > the DP sink.
> > > > > > > > >
> > > > > > > > > For full fledged DP the sink isn't really a problem. It's=
 expected
> > > > > > > > > that if an external DP monitor isn't plugged in that atte=
mpting to do
> > > > > > > > > AUX transfers won't work. It's also expected that if a DP=
 monitor is
> > > > > > > > > plugged in (and thus asserting HPD) that it AUX transfers=
 will work.
> > > > > > > > >
> > > > > > > > > When we're looking at eDP, however, things are less obvio=
us. Let's add
> > > > > > > > > some documentation about expectations. Here's what we'll =
say:
> > > > > > > > >
> > > > > > > > > 1. We don't expect the DP AUX transfer function to power =
on an eDP
> > > > > > > > > panel. If an eDP panel is physically connected but powere=
d off then it
> > > > > > > > > makes sense for the transfer to fail.
> > > > > > > >
> > > > > > > > I don't agree with this. I think the panel should just get =
powred up
> > > > > > > > for AUX transfers.
> > > > > > >
> > > > > > > That's definitely a fair thing to think about and I have at t=
imes
> > > > > > > thought about trying to make it work that way. It always ends=
 up
> > > > > > > hitting a roadblock.
> > > > >
> > > > > How do you even probe the panel initially if you can't power it o=
n
> > > > > without doing some kind of full modeset/etc.?
> > > >
> > > > It's not that we can't power it on without a full modeset. It' that=
 at
> > > > panel probe time all the DRM components haven't been hooked togethe=
r
> > > > yet, so the bridge chain isn't available yet. The panel can power
> > > > itself on, though. This is why the documentation I added says: "if =
a
> > > > panel driver is initiating a DP AUX transfer it may power itself up
> > > > however it wants"
> > > >
> > > >
> > > > > > > The biggest roadblock that I recall is that to make this work=
 then
> > > > > > > you'd have to somehow ensure that the bridge chain's pre_enab=
le() call
> > > > > > > was made as part of the AUX transfer, right? Since the transf=
er
> > > > > > > function can be called in any context at all, we have to coor=
dinate
> > > > > > > this with DRM. If, for instance, DRM is mid way through power=
ing the
> > > > > > > panel down then we need to wait for DRM to fully finish power=
ing down,
> > > > > > > then we need to power the panel back up. I don't believe that=
 we can
> > > > > > > just force the panel to stay on if DRM is turning it off beca=
use of
> > > > > > > panel power sequencing requirements. At least I know it would=
 have the
> > > > > > > potential to break "samsung-atna33xc20.c" which absolutely ne=
eds to
> > > > > > > see the panel power off after it's been disabled.
> > > > > > >
> > > > > > > We also, I believe, need to handle the fact that the bridge c=
hain may
> > > > > > > not have even been created yet. We do AUX transfers to read t=
he EDID
> > > > > > > and also to setup the backlight in the probe function of pane=
l-edp. At
> > > > > > > that point the panel hasn't been linked into the chain. We ha=
d _long_
> > > > > > > discussions [1] about moving these out of probe and decided t=
hat we
> > > > > > > could move the EDID read to be later but that it was going to=
 really
> > > > > > > ugly to move the AUX backlight later. The backlight would end=
 up
> > > > > > > popping up at some point in time later (the first call to pan=
el
> > > > > > > prepare() or maybe get_modes()) and that seemed weird.
> > > > > > >
> > > > > > > [1]
> > > > > > > https://lore.kernel.org/lkml/CAD=3DFV=3DU5-sTDLYdkeJWLAOG-0wg=
xR49VxtwUyUO7z2PuibLGsg@mail.gmail.com/
> > > > > > >
> > > > > > >
> > > > > > > > Otherwise you can't trust that eg. the /dev/aux
> > > > > > > > stuff is actually usable.
> > > > > > >
> > > > > > > Yeah, it's been on my mind to talk more about /dev/aux. I thi=
nk
> > > > > > > /dev/aux has some problems, at least with eDP. Specifically:
> > > > > > >
> > > > > > > 1. Even if we somehow figure out how to power the panel on as=
 part of
> > > > > > > the aux transfer, we actually _still_ not guaranteed to be ab=
le to
> > > > > > > talk to it as far as I understand. My colleague reported to m=
e that on
> > > > > > > a system he was working with that had PSR (panel self refresh=
) that
> > > > > > > when the panel was powered on but in PSR mode that it wouldn'=
t talk
> > > > > > > over AUX. Assuming that this is correct then I guess we'd als=
o have to
> > > > > > > do even more coordination with DRM to exit PSR and block futu=
re
> > > > > > > transitions of PSR. (NOTE: it's always possible that my colle=
ague ran
> > > > > > > into some other bug and that panels are _supposed_ to be able=
 to talk
> > > > > > > in PSR. If you think this is the case, I can always try to di=
g more).
> > > > > >
> > > > > > TBH - the coordination with drm I don't think would be the diff=
icult part, as
> > > > > > we'd just need to add some sort of property (ideally invisible =
to userspace)
> > > > > > that can be used in an atomic commit to disable PSR - similar t=
o how we enable
> > > > > > CRC readback from sysfs in the majority of DRM drivers. That be=
ing said
> > > > > > though, I think we can just leave the work of solving this prob=
lem up to
> > > > > > whoever ends up needing this to work.
> > > > >
> > > > > The driver should just disable/prevent PSR when doing AUX if the =
hardware
> > > > > can't guarantee the PSR and AUX won't interfere with each other.
> > > >
> > > > OK, fair enough. If we can solve the PSR problem that would be grea=
t.
> > > >
> > > >
> > > > > For i915 we have no problems with powering the panel on for AUX, =
but
> > > > > there is still a race with PSR vs. AUX because both use the same =
hardware
> > > > > internally. I've been nagging at people to fix this for i915 but =
I don't
> > > > > think it still got done :( Originally we were supposed to get a h=
ardware
> > > > > mutex for this but that plan got scrapped for some reason.
> > > >
> > > > I haven't looked at the i915 DRM code much, but my understanding is
> > > > that it's more of an "all in one" approach. The one driver pretty m=
uch
> > > > handles everything itself. That means that powering the panel up is=
n't
> > > > too hard. Is that right?
> > >
> > > Yeah, we don't have too many "helpful" abstractions in the way ;)
> > >
> > > > > > > for userspace to be mucking with /dev/aux. For DP's case I gu=
ess
> > > > > > > /dev/aux is essentially enabling userspace drivers to do thin=
gs like
> > > > > > > update firmware on DP monitors or play with the backlight. I =
guess we
> > > > > > > decided that we didn't want to add drivers in the kernel to h=
andle
> > > > > > > this type of stuff so we left it for userspace? For eDP, thou=
gh, there
> > > > > >
> > > > > > The main reason DP AUX got exposed to userspace in the first pl=
ace was for
> > > > > > usecases like fwupd,
> > > > >
> > > > > My memory says the original reason was debugging. Or at least I h=
ad
> > > > > no idea fwupd had started to use this until I saw some weird look=
ing
> > > > > DPCD addresses in some debug log.
> > > > >
> > > > > But I suppose it's possible there were already plans for firmware
> > > > > updates and whatnot and it just wasn't being discussed when this =
was
> > > > > being developed.
> > > >
> > > > If it's just for debugging, I'd argue that leaving it as-is should =
be
> > > > fine. Someone poking around with their system can find a way to mak=
e
> > > > sure that the panel stays on.
> > >
> > > That could require altering the state of the system quite a bit, whic=
h
> > > may defeat the purpose.
> >
> > It does? In my experience you just need to make sure that the panel is
> > turned on. ...or are you saying that you'd use this for debugging a
> > case where the system isn't probing properly?
> >
> > If things are truly in bad shape, at least on boards using device tree
> > it's easy to tweak the device tree to force a regulator to stay on. I
> > suppose we could also add a "debugfs" entry for the panel that also
> > forces it to be powered on.
> >
> >
> > >  At least I would not be willing to accept such
> > > a limitation.
> >
> > Hmm, so where does that leave us? Are you against landing this patch?
> > I've done a lot of cleanups recently and I just don't think I have the
> > time to rework all the AUX transfer functions and figure out how to
> > power the panel. It also seems like a lot of added complexity for a
> > debug path.
>
> If my 2c counts, I support landing this patch. It clearly documents
> current behaviour and expectations.
>
> If that helps,
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> As for the /dev/aux, question, I think we can make the following plan wor=
k:
> - Document that eDP panel power up can be handled by using the
> pm_runtime API (which is the case for both panel-edp and atna33xc20)).
> I think this is a sensible requirement anyway. And both panels show
> how to handle different poweron/poweroff timings.
> - Make drm_dp_aux_dev_get_by_minor() pm_runtime_get() the attached panel.

This matches what you suggested previously, but I still think it has a
potential problem as I talked about in the my previous (very long)
reply [1]. The relevant part was:

> Now, despite the fact that the generic eDP panel code doesn't follow
> the "strict"ness I just described, the _other_ DP panel I worked on
> recently (samsung-atna33xc20) does. In testing we found that this
> panel would sometimes (like 1 in 20 times?) crash if you ever stopped
> outputting data to the display and then started again. You absolutely
> needed to fully power cycle the display each time. I tried to document
> this to the best of my ability in atana33xc20_unprepare(). There's
> also a WARN_ON() in atana33xc20_enable() trying to detect if someone
> is doing something the panel driver doesn't expect.

Specifically, I think you could get in trouble if you did:

a) drm wants to power down the panel.

b) drm calls the panel's disable() function

c) we start an aux transfer and grab a runtime pm reference

d) drm calls the panel's unprepare() function =3D> atana33xc20_unprepare()

e) atana33xc20_unprepare()'s pm_runtime_put_sync_suspend() _won't_
power off the panel (we still have the reference from step c), even
though it needs to.

f) we'll finish an aux transfer and, presumably, call
pm_runtime_put_autosuspend()

g) drm wants to power the panel back up

h) drm calls the panel's prepare() function, but power wasn't properly cycl=
ed

This was the whole reason why I wanted to document that the official
API for powering the panel was via the panel's prepare() function.

[1] https://lore.kernel.org/r/CAD=3DFV=3DUmXzPyVOa-Y0gpY0qcukqW3ge5DBPx6ak8=
8ydEqTsBiQ@mail.gmail.com/

-Doug
