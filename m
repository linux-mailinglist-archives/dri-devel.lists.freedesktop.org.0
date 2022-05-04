Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF18D51A4E3
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 18:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4487310E3B5;
	Wed,  4 May 2022 16:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213E510E39E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 16:04:48 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g20so2225042edw.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 09:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sYeIs03ajhIBWiYoaUqE6sHrS2llkidG0pWS/3WopUA=;
 b=Vj69ODdDTDp/nytWChqSXLxuj8VzxVrUlY+xH0sK5HcG6n5NaS/oJpXsDM7YCfxO5N
 m20FwlodgMtcbp1PpPY1N7QImv0H9R1Noc+ORG227sXpo6elEHgZz3bCqIc/XLwgdBLn
 7Nf+YQ2wHC88zDDWuM0ypSPJ22MCF878wb4yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sYeIs03ajhIBWiYoaUqE6sHrS2llkidG0pWS/3WopUA=;
 b=VCI0zK/b119MnGZHOzGvOqRdLoHKQQeHVJmoF0wVc/pq3+liXtro1egTMD2XJ+ZW0+
 85faGuXINbDDMTPepjTFyaDFK5n4O3wbWsDtKRozNC+2zjYrGm8KTBwm2T3vfaLovra0
 b1vv7d6WLJxN7dLaT+MW0B5FqIrwLiUQ2aJ2K5LTgqr4JSdMO3ux9tQtxqc0i9Pbs8l/
 nZcp3038oDl+FuA77t++7mhuhWIUUZc/1Qwgx7zhYGo2A7s3fv5N56dN7ArBwJpQhxjh
 oSdkT9jJOxYjaxgnDETzneLFbvqWKA3WsqPdafhf1BoUYghTIkORgsjzP1L7Axt4+ll4
 rUMQ==
X-Gm-Message-State: AOAM532zq93TsHjsXQGvMlm0+MWUYFJedBwhz8HcsHLjTeEP2cvtfTO3
 g0q990mVfLWFFFDc/6yeNoMa3Sccnvs935n+oOk=
X-Google-Smtp-Source: ABdhPJy8BqaScRSgyPq2JMoRUK9P2mU0/VO8YUQBv2mxDrjvMIi6VQ9FmcKct8T1AbVyh+z88blHKQ==
X-Received: by 2002:a50:bb0e:0:b0:425:c727:566e with SMTP id
 y14-20020a50bb0e000000b00425c727566emr23807817ede.132.1651680286169; 
 Wed, 04 May 2022 09:04:46 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm5967425ejc.141.2022.05.04.09.04.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:04:44 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id p189so1127958wmp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 09:04:42 -0700 (PDT)
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id
 l8-20020a05600c4f0800b00391fe3c40e6mr141836wmq.34.1651680282225; Wed, 04 May
 2022 09:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
 <YnJv3B/85hTz54SC@intel.com>
In-Reply-To: <YnJv3B/85hTz54SC@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 May 2022 09:04:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WndmKuEB0=OVQP9YuJaSmD0uxkNs5LE0wWsFj7gBvhBA@mail.gmail.com>
Message-ID: <CAD=FV=WndmKuEB0=OVQP9YuJaSmD0uxkNs5LE0wWsFj7gBvhBA@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Jani Nikula <jani.nikula@intel.com>,
 Maxime Ripard <maxime@cerno.tech>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 4, 2022 at 5:21 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, May 03, 2022 at 04:21:08PM -0700, Douglas Anderson wrote:
> > When doing DP AUX transfers there are two actors that need to be
> > powered in order for the DP AUX transfer to work: the DP source and
> > the DP sync. Commit bacbab58f09d ("drm: Mention the power state
> > requirement on side-channel operations") added some documentation
> > saying that the DP source is required to power itself up (if needed)
> > to do AUX transfers. However, that commit doesn't talk anything about
> > the DP sink.
> >
> > For full fledged DP the sink isn't really a problem. It's expected
> > that if an external DP monitor isn't plugged in that attempting to do
> > AUX transfers won't work. It's also expected that if a DP monitor is
> > plugged in (and thus asserting HPD) that it AUX transfers will work.
> >
> > When we're looking at eDP, however, things are less obvious. Let's add
> > some documentation about expectations. Here's what we'll say:
> >
> > 1. We don't expect the DP AUX transfer function to power on an eDP
> > panel. If an eDP panel is physically connected but powered off then it
> > makes sense for the transfer to fail.
>
> I don't agree with this. I think the panel should just get powred up
> for AUX transfers.

That's definitely a fair thing to think about and I have at times
thought about trying to make it work that way. It always ends up
hitting a roadblock.

The biggest roadblock that I recall is that to make this work then
you'd have to somehow ensure that the bridge chain's pre_enable() call
was made as part of the AUX transfer, right? Since the transfer
function can be called in any context at all, we have to coordinate
this with DRM. If, for instance, DRM is mid way through powering the
panel down then we need to wait for DRM to fully finish powering down,
then we need to power the panel back up. I don't believe that we can
just force the panel to stay on if DRM is turning it off because of
panel power sequencing requirements. At least I know it would have the
potential to break "samsung-atna33xc20.c" which absolutely needs to
see the panel power off after it's been disabled.

We also, I believe, need to handle the fact that the bridge chain may
not have even been created yet. We do AUX transfers to read the EDID
and also to setup the backlight in the probe function of panel-edp. At
that point the panel hasn't been linked into the chain. We had _long_
discussions [1] about moving these out of probe and decided that we
could move the EDID read to be later but that it was going to really
ugly to move the AUX backlight later. The backlight would end up
popping up at some point in time later (the first call to panel
prepare() or maybe get_modes()) and that seemed weird.

[1] https://lore.kernel.org/lkml/CAD=3DFV=3DU5-sTDLYdkeJWLAOG-0wgxR49VxtwUy=
UO7z2PuibLGsg@mail.gmail.com/


> Otherwise you can't trust that eg. the /dev/aux
> stuff is actually usable.

Yeah, it's been on my mind to talk more about /dev/aux. I think
/dev/aux has some problems, at least with eDP. Specifically:

1. Even if we somehow figure out how to power the panel on as part of
the aux transfer, we actually _still_ not guaranteed to be able to
talk to it as far as I understand. My colleague reported to me that on
a system he was working with that had PSR (panel self refresh) that
when the panel was powered on but in PSR mode that it wouldn't talk
over AUX. Assuming that this is correct then I guess we'd also have to
do even more coordination with DRM to exit PSR and block future
transitions of PSR. (NOTE: it's always possible that my colleague ran
into some other bug and that panels are _supposed_ to be able to talk
in PSR. If you think this is the case, I can always try to dig more).

2. I'm not totally convinced that it's a great idea, at least for eDP,
for userspace to be mucking with /dev/aux. For DP's case I guess
/dev/aux is essentially enabling userspace drivers to do things like
update firmware on DP monitors or play with the backlight. I guess we
decided that we didn't want to add drivers in the kernel to handle
this type of stuff so we left it for userspace? For eDP, though, there
is a panel driver and we if we have an AUX backlight we create a real
backlight device. If we needed to do a firmware update of an eDP panel
it would make sense for the panel driver to present some interface for
the firmware update so that the panel driver could make sure that the
panel stayed powered for the duration of the firmware update, not just
for the duration of a single AUX transfer.

3. In general it feels a little awkward for userspace to be directly
poking at the same set of registers that a kernel driver is also
poking at.

To me it feels like /dev/aux is much like the /dev/i2c interface. Yes,
userspace can go talk to random i2c devices and can even talk to them
after a kernel driver has "claimed" an i2c device, but:
a) If an i2c device is powered off, then the i2c transfer won't work.
b) If you set a register of a device managed by a kernel driver behind
the back of the kernel driver, you're really asking for trouble.


So I guess my proposals would be to pick one of:

a) Leave things they way they are as I've documented. NOTE that my
documentation does document the way things are today. No aux transfer
function that I'm aware of powers up an eDP panel. In this case if
someone wants to use /dev/aux for an eDP panel it's really up to them
not to shoot themselves in the foot.

b) Stop populating /dev/aux for eDP panels and only do it for DP and
then if/when someone yells we figure out how they were using /dev/aux
and why it was safe. This is definitely an ABI change but I have no
idea if it would really break anyone. I suppose we could take a first
step by spewing a WARN_ON if someone directly uses /dev/aux for eDP?

c) Somehow dynamically create / remove the /dev/aux device as the eDP
panel turns off and on again. If /dev/aux is there then we know that
the panel is on. NOTE: this ignores PSR. I don't think we'd want to
delete / create the /dev/aux node that often. So we'd either have to
still accept that the transfers will sometimes fail (c1) or make it a
requirement that we bring the panel out of PSR for an AUX transfer
(c2).


Technically we could list option (d) to power the panel up, but as per
above I think it's pretty awkward and doesn't feel like the right way
to go. Obviously happy to hear other opinions, though.
