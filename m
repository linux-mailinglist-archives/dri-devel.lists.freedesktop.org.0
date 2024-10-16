Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3229A1261
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 21:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E557B10E181;
	Wed, 16 Oct 2024 19:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="es/QFLE+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5475410E181
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 19:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=bylu2pig5vgtbgkyzos4fvvlim.protonmail; t=1729106348; x=1729365548;
 bh=VokmqUex0gxEbClNcfMI1HcrZ3mz/pDmExmI02fcrHU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=es/QFLE+trj1jXjWwLbJDsxsgI6ZpXekFOwUB1GMPjFzmxT/lMlj5WU5LusWoHXSO
 a4e1S8jOD+75MoYRIC4FnwAc/TL/K72JOgBs1DhuH+LO7uDKTRHjCb1XWDWOzvxnSy
 V4pARN5UhVZjSQy+3HEVoyr22Kh8i5gEmLohrBQekUv6jVnOajDkY0o1KDIdfehT04
 AjwkY16weo6/bzFDXceDOtu2A+Gx9zDvou/+hFrg5gPq8TRdSTw+7JdX1PpZPBvzDG
 bAGQjHey8YX0i8uEquxoRlM1I/ATn3R8Q7ZblplwlKCN96NvPrifWeiOjVNAjvJbA3
 2hG6WQIa2FNdw==
Date: Wed, 16 Oct 2024 19:19:05 +0000
To: Daniel Stone <daniel@fooishbar.org>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: Andy Yan <andyshrk@163.com>, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re: Re:Re:[PATCH v5] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <kYKfHO8oonY1wP8ZvanmTnvgjGfw0uek8cmMIV99Bc6zO3EE32B2LKaypAphAxVJKx2I-Lnd3CzvyTRVAaM4xhj75z7dOzlp7xPMlFQKRN0=@proton.me>
In-Reply-To: <CAPj87rOmPyat12S4WUixiUBAsuAEEbyNX5VY2JS+wn5a1jux0A@mail.gmail.com>
References: <20241014222022.571819-4-pZ010001011111@proton.me>
 <7b45f190.452f.1928e41b746.Coremail.andyshrk@163.com>
 <o_Cyz_ARcHj4zNlovv75MBwslIRhn3YWlscoNrlpLVobh7eWIMEQR5bNv0yhHx2KEx_gbYi_gH-8Y-CdvRZs9lZscz3-lhAbM50GXUdtSKY=@proton.me>
 <30940542.b36d.19290215124.Coremail.andyshrk@163.com>
 <1974DYrs9gLrQrZ5VwCglFgKDDK686iyqnS_g6uPB-s9wZ_4CqfZXPjmYWihLgrkRu7ptNjpkFeqB0uTt73RFId6cL8FowQ8LFltPmaKCoI=@proton.me>
 <1ae9f15d.e52.19292e05e73.Coremail.andyshrk@163.com>
 <CAPj87rOmPyat12S4WUixiUBAsuAEEbyNX5VY2JS+wn5a1jux0A@mail.gmail.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: e2497491b4b02a9caaaac23dabf6ca08f7b82d0a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wednesday, October 16th, 2024 at 2:27 PM, Daniel Stone <daniel@fooishbar=
.org> wrote:

> Hi all,
>
> On Wed, 16 Oct 2024 at 02:11, Andy Yan andyshrk@163.com wrote:
>
> > At 2024-10-16 04:13:40, "Piotr Zalewski" pZ010001011111@proton.me wrote=
:
> >
> > > Ok I get it now. Is such rework correct? - when gamma LUT for rk356x =
is
> > > being set, instead of disabling the LUT before the gamma LUT write fo=
r the
> > > current CRTC's video port, active video port is selected. Selection i=
s
> > > based on if DSP LUT EN bit is set for particular video port. eg:
> >
> > If the userspace want to set gamma for CRTCx, then that is indeed where=
 they want to set the
> > gamma on=E3=80=82The driver silently sets the gamma on another CRTC, wh=
ich is not what the user wants.
> >
> > I think there are two options=EF=BC=9A
> > =EF=BC=881=EF=BC=89return a error if gamma is enable on other CRTC=
=EF=BC=8C this is what we done in our BSP code[1]
> > (2) disable the dsp_lut on privious CRTC, then switch to the current CR=
TC which userspace wants.
>
>
> 1 is the only solution that can work. Silently changing the colour
> properties of a separate CRTC is not OK, since this can lead to
> displaying incorrect content.

Ok right kernel keeps track of the state and sees gamma as enabled even if=
=20
dsp lut en bit was cleared.

Would it be better to check if gamma is already enabled on another CRTC in=
=20
atomic_check rather than atomic_begin/atomic_flush (and silently fail) like
in[1]?

[1] https://github.com/armbian/linux-rockchip/blob/rk3576-6.1-dev-2024_04_1=
9/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c#L3666

Best regards, Piotr Zalewski
