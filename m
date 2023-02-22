Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBD369F846
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 16:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25E610EA14;
	Wed, 22 Feb 2023 15:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662A010EA14;
 Wed, 22 Feb 2023 15:44:54 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-17227cba608so7619108fac.3; 
 Wed, 22 Feb 2023 07:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bw/o2d2K7rGx8jIRXoMyh485ogBh3CzQ8lHjHQHgP88=;
 b=nVtplwpYOrpmv5auHphbThsB5vUI0Ms3ZskUvJ5lbu1bIFUs5qUoFjhQTperidUve1
 qkG6ep1wQh8TVXb6pD0amaDuhJtZV/bE1KauKv3c47O547/gyeePedUjF+vp26chdjCU
 40vUbKDpkkxBVku3mGZcuuj77kzSFMsYuj/rnCgUut7CtyVk4XMq/mOZ9dDrRYQlMGjM
 E+kybYipPTshCzloe6tzbxCsSb5pTldvUwqfmvbRDYOt9UqDlBZrtMtHZeJTt+YU/B7O
 nL38eEKt3L5d3z31wWvYYd8UiXeHUDPmEXyNirUrk3n25ZPBqsIzVNk5FhfpQ5e2homG
 mGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bw/o2d2K7rGx8jIRXoMyh485ogBh3CzQ8lHjHQHgP88=;
 b=XmhFVhezCEiM08FbdzrBZEIzeGJ6ERV3pHkl1OIFfcgXdWaUKntqCvgyZJE/sklPZ6
 Q3ybQFuPTw1LPc8ZR/pT+4pALiTX1AXTxLiL8oYxK3NjVkJ4b2zPj5XbSJYp/cAYumUq
 Tb+habj0Xafbl2q6snQuJ2ST4+mVV3HwVqlrP7sBxghX+UaoxGoeaEYIEXnr4xq65cHh
 6MZs4p4mhl5mh6tlJwG41vipGLW0maHLGiV+8qAamcPddf5bvd5IcKVogzXfDUNw2WoH
 c4DL3ygOC773ZuSGHmuZoSVgvJTu/REPiU1E19S/iczvYRMbZ1zwB3elVkxNvbnFIh3Q
 prhg==
X-Gm-Message-State: AO0yUKWKgCc4GJjtlALUxUL69yG1mQOomGGdXEDIQ8QsUg/w5u/1wo9d
 KO07kEIbBGhrzmUvgHFbeHcgIe4qfqPsVVIZxhI=
X-Google-Smtp-Source: AK7set8HctSnN91X1d+M6rIyfQjt2yhgJ7jTxiClAmw/r44291CstgYZiuPPwA1K5zp2sg+pYAvmX8Bhb4Hlrw+N0Qg=
X-Received: by 2002:a05:6870:808d:b0:16e:8a56:d0d2 with SMTP id
 q13-20020a056870808d00b0016e8a56d0d2mr1362645oab.38.1677080693513; Wed, 22
 Feb 2023 07:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-11-robdclark@gmail.com>
 <20230220110820.595cfa37@eldfell>
 <CAF6AEGuo-vmW4Va9=RH+kH9KgNvR2vzjJ8meO-oty56xjDhjgg@mail.gmail.com>
 <20230221104551.60d44d1c@eldfell> <Y/TAr64SpxO712RB@intel.com>
 <CAF6AEGumfEeGQQaEoEm4hzJajCOBBTrWxPQ9MTh7jt-Mov2FEQ@mail.gmail.com>
 <20230222115700.138d824c@eldfell>
In-Reply-To: <20230222115700.138d824c@eldfell>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 22 Feb 2023 07:44:42 -0800
Message-ID: <CAF6AEGuK0_GtgXS7REAN=u4YZ7x11FrAxVW4iQcqV7bJdJFv6g@mail.gmail.com>
Subject: Re: [PATCH v4 10/14] drm/vblank: Add helper to get next vblank time
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 1:57 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 21 Feb 2023 09:50:20 -0800
> Rob Clark <robdclark@gmail.com> wrote:
>
> > On Tue, Feb 21, 2023 at 5:01 AM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Tue, Feb 21, 2023 at 10:45:51AM +0200, Pekka Paalanen wrote:
> > > > On Mon, 20 Feb 2023 07:55:41 -0800
> > > > Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > > On Mon, Feb 20, 2023 at 1:08 AM Pekka Paalanen <ppaalanen@gmail.c=
om> wrote:
> > > > > >
> > > > > > On Sat, 18 Feb 2023 13:15:53 -0800
> > > > > > Rob Clark <robdclark@gmail.com> wrote:
> > > > > >
> > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > >
> > > > > > > Will be used in the next commit to set a deadline on fences t=
hat an
> > > > > > > atomic update is waiting on.
> > > > > > >
> > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/drm_vblank.c | 32 ++++++++++++++++++++++++++=
++++++
> > > > > > >  include/drm/drm_vblank.h     |  1 +
> > > > > > >  2 files changed, 33 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/d=
rm_vblank.c
> > > > > > > index 2ff31717a3de..caf25ebb34c5 100644
> > > > > > > --- a/drivers/gpu/drm/drm_vblank.c
> > > > > > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > > > > > @@ -980,6 +980,38 @@ u64 drm_crtc_vblank_count_and_time(struc=
t drm_crtc *crtc,
> > > > > > >  }
> > > > > > >  EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
> > > > > > >
> > > > > > > +/**
> > > > > > > + * drm_crtc_next_vblank_time - calculate the time of the nex=
t vblank
> > > > > > > + * @crtc: the crtc for which to calculate next vblank time
> > > > > > > + * @vblanktime: pointer to time to receive the next vblank t=
imestamp.
> > > > > > > + *
> > > > > > > + * Calculate the expected time of the next vblank based on t=
ime of previous
> > > > > > > + * vblank and frame duration
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > for VRR this targets the highest frame rate possible for the cu=
rrent
> > > > > > VRR mode, right?
> > > > > >
> > > > >
> > > > > It is based on vblank->framedur_ns which is in turn based on
> > > > > mode->crtc_clock.  Presumably for VRR that ends up being a maximu=
m?
> > > >
> > > > I don't know. :-)
> > >
> > > At least for i915 this will give you the maximum frame
> > > duration.
> >
> > I suppose one could argue that maximum frame duration is the actual
> > deadline.  Anything less is just moar fps, but not going to involve
> > stalling until vblank N+1, AFAIU
> >
> > > Also this does not calculate the the start of vblank, it
> > > calculates the start of active video.
> >
> > Probably something like end of previous frame's video..  might not be
> > _exactly_ correct (because some buffering involved), but OTOH on the
> > GPU side, I expect the driver to set a timer for a few ms or so before
> > the deadline.  So there is some wiggle room.
>
> The vblank timestamp is defined to be the time of the first active
> pixel of the frame in the video signal. At least that's the one that
> UAPI carries (when not tearing?). It is not the start of vblank period.
>
> With VRR, the front porch before the first active pixel can be multiple
> milliseconds. The difference between 144 Hz and 60 Hz is 9.7 ms for
> example.

What we really want is the deadline for the hw to latch for the next
frame.. which as Ville pointed out is definitely before the end of
vblank.

Honestly this sort of feature is a lot more critical for the non-VRR
case, and VRR is kind of a minority edge case.  So I'd prefer not to
get too hung up on VRR.  If there is an easy way for the helpers to
detect VRR, I'd be perfectly fine not setting a deadline hint in that
case, and let someone who actually has a VRR display figure out how to
handle that case.

BR,
-R
