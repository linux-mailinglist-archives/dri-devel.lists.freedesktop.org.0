Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 366A45A5C83
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 09:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF1510E5F1;
	Tue, 30 Aug 2022 07:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B6A10E587
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 07:08:04 +0000 (UTC)
Date: Tue, 30 Aug 2022 07:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661843281; x=1662102481;
 bh=XS4L8F00nfD/1m3fNLnSazmpCldikhM8KnNL2oQQbjI=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=CeRAMSfXTtNDM45DZv0G5RblqqQvbE5qdKz4tENICb9smeTlj2H9a23aR3ZdCqb4O
 q8F0TZ9AgetBpyNwGtbuhurEHY4kXaReQVxqjaqMbKDlzoQT3hXhL61diyOLXpVo8m
 ttWq5W6+Ipb/wGQRHmLqb60EH7O4mEBi4opogyi9LOHCSNL95zgmNIz7wjkJe9jj8y
 l9llJKKLZ4MWTywSnmgc5GVYWe9ZS93smV7JKGdSlHQ2O1RgEy9qK2ENci13/KpHgP
 hB6WUlApYucGfsGtWQymETke6W7MY43PsTA2nJRXOhxEk0g2BE/+DJXgU4Dcj75KG0
 9Gc7IZ9dI08Gg==
To: Alex Deucher <alexdeucher@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 4/4] amd/display: indicate support for atomic async
 page-flips on DCN
Message-ID: <2uZ8U_CJxQ9zlnv1lIRhMtwKYU-uuOuhzef2hbvONDPGN-t9Pm4fSejJNLm3ThkJIj1ZkDZwizu49Xactvx-ykn-0Rc23CzsBUXe3Xg_-XI=@emersion.fr>
In-Reply-To: <CADnq5_NMHWGOdW5Gfr4wK6o5j7PnYKW57Gg6UbbUJfnONdHY1w@mail.gmail.com>
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-5-contact@emersion.fr>
 <CADnq5_MX0Qh7v-Wy1nBhMEWT9bhmQn4W-2Wo97CZgKcby1Xc+w@mail.gmail.com>
 <A_ZL55UlxqGGQnHrxTxvFZMCn1HkWbIuaZvtrOnir7mO6YCY8hhyYwjwKjv79SEEBLqbosVtxx0rVeCTso1RktRjY3ECNyLssw77of_D2sM=@emersion.fr>
 <CADnq5_NMHWGOdW5Gfr4wK6o5j7PnYKW57Gg6UbbUJfnONdHY1w@mail.gmail.com>
Feedback-ID: 1358184:user:proton
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, hwentlan@amd.com,
 nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, August 26th, 2022 at 16:39, Alex Deucher <alexdeucher@gmail.com>=
 wrote:

> On Fri, Aug 26, 2022 at 3:38 AM Simon Ser <contact@emersion.fr> wrote:
> >
> > On Thursday, August 25th, 2022 at 20:22, Alex Deucher <alexdeucher@gmai=
l.com> wrote:
> >
> > > On Wed, Aug 24, 2022 at 11:09 AM Simon Ser contact@emersion.fr wrote:
> > >
> > > > amdgpu_dm_commit_planes already sets the flip_immediate flag for
> > > > async page-flips. This flag is used to set the UNP_FLIP_CONTROL
> > > > register. Thus, no additional change is required to handle async
> > > > page-flips with the atomic uAPI.
> > > >
> > > > Note, async page-flips are still unsupported on DCE with the atomic
> > > > uAPI. The mode_set_base callbacks unconditionally set the
> > > > GRPH_SURFACE_UPDATE_H_RETRACE_EN field of the GRPH_FLIP_CONTROL
> > > > register to 0, which disables async page-flips.
> > >
> > > Can you elaborate a bit on this? We don't use hsync flips at all, eve=
n
> > > in non-atomic, as far as I recall. The hardware can also do immediate
> > > flips which take effect as soon as you update the base address
> > > register which is what we use for async updates today IIRC.
> >
> > When user-space performs a page-flip with the legacy KMS uAPI on DCE
> > ASICs, amdgpu_display_crtc_page_flip_target() is called. This function
> > checks for the DRM_MODE_PAGE_FLIP_ASYNC flag, sets work->async, which
> > is then passed as an argument to adev->mode_info.funcs->page_flip() by
> > amdgpu_display_flip_work_func(). Looking at an implementation, for
> > instance dce_v10_0_page_flip(), the async flag is used to set that
> > GRPH_FLIP_CONTROL register:
> >
> >         /* flip at hsync for async, default is vsync */
> >         tmp =3D RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
> >         tmp =3D REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
> >                             GRPH_SURFACE_UPDATE_H_RETRACE_EN, async ? 1=
 : 0);
> >         WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, tmp);
> >
> > I don't know how the hardware works, but I assumed it would be
> > necessary to do the same in the atomic uAPI code-path as well. However
> > dce_v10_0_crtc_do_set_base() has this code block:
> >
> >         /* Make sure surface address is updated at vertical blank rathe=
r than
> >          * horizontal blank
> >          */
> >         tmp =3D RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
> >         tmp =3D REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
> >                             GRPH_SURFACE_UPDATE_H_RETRACE_EN, 0);
> >         WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, tmp);
> >
> > Which unconditionally sets that same register.
> >
> > Either way, it's not a very big deal for this patch series, DCE and DCN
> > are separate, DCE can be sorted out separately.
> >
> > Am I completely mistaken here?
>=20
> I checked the code and it looks like only DCE11 and newer support
> immediate flips.  E.g.,
>=20
>         /* flip immediate for async, default is vsync */
>         tmp =3D RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
>         tmp =3D REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
>                             GRPH_SURFACE_UPDATE_IMMEDIATE_EN, async ? 1 :=
 0);
>=20
> in dce_v11_0.c.
>=20
> Either way, the non-DC display code is not atomic anyway, so I don't
> think this is an issue.  We still support async flips via the
> non-atomic API.  I agree this is not blocking for the patch series,
> just thinking out loud mostly.

Michel pointed out that DC can drive both DCN and DCE. This was a
misunderstanding on my end, I thought DC could only drive DCN. I'll reword =
the
commit message to refer to DC instead of DCN.

This begs the question, should we bother to set the
atomic_async_page_flip_not_supported flag on non-atomic drivers? I've just
slapped the flag everywhere for simplicity's sake, but maybe it would make =
more
sense to just set it for atomic-capable drivers. Especially if the long-ter=
m
goal is to convert all atomic drivers to support async flips and eventually
remove atomic_async_page_flip_not_supported.

Thanks for the hint regarding DCE10. It sounds like it may be worthwhile to
unset drm_mode_config.async_page_flip on DCE10 and earlier, to indicate to
user-space that async page-flips are not supported on these ASICs? Right no=
w it
seems like we indicate that we support them, and then ignore the ASYNC_FLIP
flag?
