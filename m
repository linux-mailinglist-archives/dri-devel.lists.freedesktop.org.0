Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F4351C32E
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 17:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712D110E4FC;
	Thu,  5 May 2022 15:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7FE10E4C5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 15:00:37 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id l18so9248115ejc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7r5jnxTR1P74pqq/UNy2IaR17hbE8dYbT5gxEqcPv7A=;
 b=a2Fv/yopvp3JvcM62Ob3BPJwpdNbIUvGbUG7/xXHqZy1aK+wkXIDX/98pEEKblhHv7
 X40YJ30KTutX9vKBXHLE34Y3s3ltUh6WclP2r/msZRKwGAf648K2mUD63V/8vXto2ZGb
 EZf/NDBsuE5XfGoPUfg/bXjv3zTyIlMSIu/s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7r5jnxTR1P74pqq/UNy2IaR17hbE8dYbT5gxEqcPv7A=;
 b=qzInY2lktkQPm0As7UcQILFu4nhmEOVPWQk6z3AASQh9bG+PGLePmjcECcr9owBpf/
 Os+liMkZtQ35PT3W30t+S9hW82GSsBlqZf3AyHutcxjhS6qbseBQfiEMSbQWVzhkXbiV
 D49HKKRWzZNRF4WmsNbIpl08RbPBuZo6vVFikF7xCtRNI4nW3O+SIOWDXdj8QWPUA++y
 gw47RQds6396gnr5FsBPoA/gHy6Ifd0zg84ywMCoInVfyxGzfSaKDgmc/sZxy9rTmN1F
 aWGaeZO/xkUcA1mfWOU8sto4scghERCl4Ps1orB0Z93g5f35lARok4MIUDaRVPB2ZG0u
 fhfA==
X-Gm-Message-State: AOAM530qCEKgqsEi5R4FjoVpa17UFwYROyxUFR5YtTztFOn8lMVwzfXp
 tgfeypWGFDmZUuJ3XeaO2opVYQapyRiNQkjrQgU=
X-Google-Smtp-Source: ABdhPJzXCOO/xAmaXktZbdCuZ0Xwtkqh5TSXjJSP8cWdl5qtYiKH0ymC2yPobK4YZjg8omNg/8nvMw==
X-Received: by 2002:a17:907:3da3:b0:6f4:4292:6d6 with SMTP id
 he35-20020a1709073da300b006f4429206d6mr20810980ejc.162.1651762835218; 
 Thu, 05 May 2022 08:00:35 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 el22-20020a170907285600b006f3ef214e17sm844127ejc.125.2022.05.05.08.00.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 08:00:33 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id d5so6476669wrb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 08:00:33 -0700 (PDT)
X-Received: by 2002:a5d:6d09:0:b0:20c:53a9:cc30 with SMTP id
 e9-20020a5d6d09000000b0020c53a9cc30mr20252978wrq.513.1651762832681; Thu, 05
 May 2022 08:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
 <YnJv3B/85hTz54SC@intel.com>
 <CAD=FV=WndmKuEB0=OVQP9YuJaSmD0uxkNs5LE0wWsFj7gBvhBA@mail.gmail.com>
 <1c6c9fde6e85f09cc89ea8dc6e8716fef58f3ee1.camel@redhat.com>
 <YnPjO4kbjezQl5Da@intel.com>
In-Reply-To: <YnPjO4kbjezQl5Da@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 May 2022 08:00:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbZEagm5qR207mcVm1Ry=bGeuRAqTYx3SBoZfyo6fSkg@mail.gmail.com>
Message-ID: <CAD=FV=XbZEagm5qR207mcVm1Ry=bGeuRAqTYx3SBoZfyo6fSkg@mail.gmail.com>
Subject: Re: [PATCH] drm: Document that power requirements for DP AUX transfers
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 5, 2022 at 7:46 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, May 04, 2022 at 02:10:08PM -0400, Lyude Paul wrote:
> > On Wed, 2022-05-04 at 09:04 -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Wed, May 4, 2022 at 5:21 AM Ville Syrj=C3=A4l=C3=A4
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Tue, May 03, 2022 at 04:21:08PM -0700, Douglas Anderson wrote:
> > > > > When doing DP AUX transfers there are two actors that need to be
> > > > > powered in order for the DP AUX transfer to work: the DP source a=
nd
> > > > > the DP sync. Commit bacbab58f09d ("drm: Mention the power state
> > > > > requirement on side-channel operations") added some documentation
> > > > > saying that the DP source is required to power itself up (if need=
ed)
> > > > > to do AUX transfers. However, that commit doesn't talk anything a=
bout
> > > > > the DP sink.
> > > > >
> > > > > For full fledged DP the sink isn't really a problem. It's expecte=
d
> > > > > that if an external DP monitor isn't plugged in that attempting t=
o do
> > > > > AUX transfers won't work. It's also expected that if a DP monitor=
 is
> > > > > plugged in (and thus asserting HPD) that it AUX transfers will wo=
rk.
> > > > >
> > > > > When we're looking at eDP, however, things are less obvious. Let'=
s add
> > > > > some documentation about expectations. Here's what we'll say:
> > > > >
> > > > > 1. We don't expect the DP AUX transfer function to power on an eD=
P
> > > > > panel. If an eDP panel is physically connected but powered off th=
en it
> > > > > makes sense for the transfer to fail.
> > > >
> > > > I don't agree with this. I think the panel should just get powred u=
p
> > > > for AUX transfers.
> > >
> > > That's definitely a fair thing to think about and I have at times
> > > thought about trying to make it work that way. It always ends up
> > > hitting a roadblock.
>
> How do you even probe the panel initially if you can't power it on
> without doing some kind of full modeset/etc.?

It's not that we can't power it on without a full modeset. It' that at
panel probe time all the DRM components haven't been hooked together
yet, so the bridge chain isn't available yet. The panel can power
itself on, though. This is why the documentation I added says: "if a
panel driver is initiating a DP AUX transfer it may power itself up
however it wants"


> > > The biggest roadblock that I recall is that to make this work then
> > > you'd have to somehow ensure that the bridge chain's pre_enable() cal=
l
> > > was made as part of the AUX transfer, right? Since the transfer
> > > function can be called in any context at all, we have to coordinate
> > > this with DRM. If, for instance, DRM is mid way through powering the
> > > panel down then we need to wait for DRM to fully finish powering down=
,
> > > then we need to power the panel back up. I don't believe that we can
> > > just force the panel to stay on if DRM is turning it off because of
> > > panel power sequencing requirements. At least I know it would have th=
e
> > > potential to break "samsung-atna33xc20.c" which absolutely needs to
> > > see the panel power off after it's been disabled.
> > >
> > > We also, I believe, need to handle the fact that the bridge chain may
> > > not have even been created yet. We do AUX transfers to read the EDID
> > > and also to setup the backlight in the probe function of panel-edp. A=
t
> > > that point the panel hasn't been linked into the chain. We had _long_
> > > discussions [1] about moving these out of probe and decided that we
> > > could move the EDID read to be later but that it was going to really
> > > ugly to move the AUX backlight later. The backlight would end up
> > > popping up at some point in time later (the first call to panel
> > > prepare() or maybe get_modes()) and that seemed weird.
> > >
> > > [1]
> > > https://lore.kernel.org/lkml/CAD=3DFV=3DU5-sTDLYdkeJWLAOG-0wgxR49Vxtw=
UyUO7z2PuibLGsg@mail.gmail.com/
> > >
> > >
> > > > Otherwise you can't trust that eg. the /dev/aux
> > > > stuff is actually usable.
> > >
> > > Yeah, it's been on my mind to talk more about /dev/aux. I think
> > > /dev/aux has some problems, at least with eDP. Specifically:
> > >
> > > 1. Even if we somehow figure out how to power the panel on as part of
> > > the aux transfer, we actually _still_ not guaranteed to be able to
> > > talk to it as far as I understand. My colleague reported to me that o=
n
> > > a system he was working with that had PSR (panel self refresh) that
> > > when the panel was powered on but in PSR mode that it wouldn't talk
> > > over AUX. Assuming that this is correct then I guess we'd also have t=
o
> > > do even more coordination with DRM to exit PSR and block future
> > > transitions of PSR. (NOTE: it's always possible that my colleague ran
> > > into some other bug and that panels are _supposed_ to be able to talk
> > > in PSR. If you think this is the case, I can always try to dig more).
> >
> > TBH - the coordination with drm I don't think would be the difficult pa=
rt, as
> > we'd just need to add some sort of property (ideally invisible to users=
pace)
> > that can be used in an atomic commit to disable PSR - similar to how we=
 enable
> > CRC readback from sysfs in the majority of DRM drivers. That being said
> > though, I think we can just leave the work of solving this problem up t=
o
> > whoever ends up needing this to work.
>
> The driver should just disable/prevent PSR when doing AUX if the hardware
> can't guarantee the PSR and AUX won't interfere with each other.

OK, fair enough. If we can solve the PSR problem that would be great.


> For i915 we have no problems with powering the panel on for AUX, but
> there is still a race with PSR vs. AUX because both use the same hardware
> internally. I've been nagging at people to fix this for i915 but I don't
> think it still got done :( Originally we were supposed to get a hardware
> mutex for this but that plan got scrapped for some reason.

I haven't looked at the i915 DRM code much, but my understanding is
that it's more of an "all in one" approach. The one driver pretty much
handles everything itself. That means that powering the panel up isn't
too hard. Is that right?


> > > 2. I'm not totally convinced that it's a great idea, at least for eDP=
,
> > > for userspace to be mucking with /dev/aux. For DP's case I guess
> > > /dev/aux is essentially enabling userspace drivers to do things like
> > > update firmware on DP monitors or play with the backlight. I guess we
> > > decided that we didn't want to add drivers in the kernel to handle
> > > this type of stuff so we left it for userspace? For eDP, though, ther=
e
> >
> > The main reason DP AUX got exposed to userspace in the first place was =
for
> > usecases like fwupd,
>
> My memory says the original reason was debugging. Or at least I had
> no idea fwupd had started to use this until I saw some weird looking
> DPCD addresses in some debug log.
>
> But I suppose it's possible there were already plans for firmware
> updates and whatnot and it just wasn't being discussed when this was
> being developed.

If it's just for debugging, I'd argue that leaving it as-is should be
fine. Someone poking around with their system can find a way to make
sure that the panel stays on. This is similar to how if you're poking
around with /dev/i2c it's up to you to make sure that the i2c device
you're poking at stays powered.

-Doug
