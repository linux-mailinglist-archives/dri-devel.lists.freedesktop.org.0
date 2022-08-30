Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8781C5A6633
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 16:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54D910E0F4;
	Tue, 30 Aug 2022 14:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812B010E0EE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 14:24:04 +0000 (UTC)
Date: Tue, 30 Aug 2022 14:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661869441; x=1662128641;
 bh=lvuD2mk0iCdYimHBJgDWku2ro8PxhDA+/QGClxKI3Cc=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=jqs2+7NJJvB3x3Qu9lC/llN67Fi9v/RPwv0/tzMc0U562UFPQwfRSHGjdnV4HWw8k
 U4/qbE49YYBxOt5oUZJkijz5eFGhuzCHJLaBCDwjwid5WScn4QsgjYl8nauE8lLDa9
 Nv66cmARVg6QISpEzt+4qj4eiOOOk/uNm9B4TYhbXxnA8FLInfZies83NygeBYQn0B
 vl/jd601p5pq4Bru8m3gggql96gjlD6VnhL9EpjB9Mk7Y0bcI+Wz/xcxq1PRAb5sBp
 7zq986XNBKWc0hAlNx25zK5lBcstMGTLqAE7AJV2tkndbt4j0SjbsYIml5cif9np82
 oiolGmhSrcAJA==
To: Alex Deucher <alexdeucher@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 4/4] amd/display: indicate support for atomic async
 page-flips on DCN
Message-ID: <2ceFF1QUjpWpVaQxW7MgRgDlU-Ff3UPBZLRET1On9G_S5IxK-i4Ye2zGgx5KeEJVXwMCyaG2TIBG7RW4L5lciqbQhE-uitglBBgqTwhKCck=@emersion.fr>
In-Reply-To: <CADnq5_PX_d0hsoTSLsyZpEHg9hu33x8LhyLOGFMZRo0WWdKPvw@mail.gmail.com>
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-5-contact@emersion.fr>
 <CADnq5_MX0Qh7v-Wy1nBhMEWT9bhmQn4W-2Wo97CZgKcby1Xc+w@mail.gmail.com>
 <A_ZL55UlxqGGQnHrxTxvFZMCn1HkWbIuaZvtrOnir7mO6YCY8hhyYwjwKjv79SEEBLqbosVtxx0rVeCTso1RktRjY3ECNyLssw77of_D2sM=@emersion.fr>
 <CADnq5_NMHWGOdW5Gfr4wK6o5j7PnYKW57Gg6UbbUJfnONdHY1w@mail.gmail.com>
 <2uZ8U_CJxQ9zlnv1lIRhMtwKYU-uuOuhzef2hbvONDPGN-t9Pm4fSejJNLm3ThkJIj1ZkDZwizu49Xactvx-ykn-0Rc23CzsBUXe3Xg_-XI=@emersion.fr>
 <CADnq5_PX_d0hsoTSLsyZpEHg9hu33x8LhyLOGFMZRo0WWdKPvw@mail.gmail.com>
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

On Tuesday, August 30th, 2022 at 16:06, Alex Deucher <alexdeucher@gmail.com=
> wrote:

> On Tue, Aug 30, 2022 at 3:08 AM Simon Ser contact@emersion.fr wrote:
>=20
> > On Friday, August 26th, 2022 at 16:39, Alex Deucher alexdeucher@gmail.c=
om wrote:
> >=20
> > > On Fri, Aug 26, 2022 at 3:38 AM Simon Ser contact@emersion.fr wrote:
> > >=20
> > > > On Thursday, August 25th, 2022 at 20:22, Alex Deucher alexdeucher@g=
mail.com wrote:
> > > >=20
> > > > > On Wed, Aug 24, 2022 at 11:09 AM Simon Ser contact@emersion.fr wr=
ote:
> > > > >=20
> > > > > > amdgpu_dm_commit_planes already sets the flip_immediate flag fo=
r
> > > > > > async page-flips. This flag is used to set the UNP_FLIP_CONTROL
> > > > > > register. Thus, no additional change is required to handle asyn=
c
> > > > > > page-flips with the atomic uAPI.
> > > > > >=20
> > > > > > Note, async page-flips are still unsupported on DCE with the at=
omic
> > > > > > uAPI. The mode_set_base callbacks unconditionally set the
> > > > > > GRPH_SURFACE_UPDATE_H_RETRACE_EN field of the GRPH_FLIP_CONTROL
> > > > > > register to 0, which disables async page-flips.
> > > > >=20
> > > > > Can you elaborate a bit on this? We don't use hsync flips at all,=
 even
> > > > > in non-atomic, as far as I recall. The hardware can also do immed=
iate
> > > > > flips which take effect as soon as you update the base address
> > > > > register which is what we use for async updates today IIRC.
> > > >=20
> > > > When user-space performs a page-flip with the legacy KMS uAPI on DC=
E
> > > > ASICs, amdgpu_display_crtc_page_flip_target() is called. This funct=
ion
> > > > checks for the DRM_MODE_PAGE_FLIP_ASYNC flag, sets work->async, whi=
ch
> > > > is then passed as an argument to adev->mode_info.funcs->page_flip()=
 by
> > > > amdgpu_display_flip_work_func(). Looking at an implementation, for
> > > > instance dce_v10_0_page_flip(), the async flag is used to set that
> > > > GRPH_FLIP_CONTROL register:
> > > >=20
> > > > /* flip at hsync for async, default is vsync */
> > > > tmp =3D RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
> > > > tmp =3D REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
> > > > GRPH_SURFACE_UPDATE_H_RETRACE_EN, async ? 1 : 0);
> > > > WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, tmp);
> > > >=20
> > > > I don't know how the hardware works, but I assumed it would be
> > > > necessary to do the same in the atomic uAPI code-path as well. Howe=
ver
> > > > dce_v10_0_crtc_do_set_base() has this code block:
> > > >=20
> > > > /* Make sure surface address is updated at vertical blank rather th=
an
> > > > * horizontal blank
> > > > */
> > > > tmp =3D RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
> > > > tmp =3D REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
> > > > GRPH_SURFACE_UPDATE_H_RETRACE_EN, 0);
> > > > WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, tmp);
> > > >=20
> > > > Which unconditionally sets that same register.
> > > >=20
> > > > Either way, it's not a very big deal for this patch series, DCE and=
 DCN
> > > > are separate, DCE can be sorted out separately.
> > > >=20
> > > > Am I completely mistaken here?
> > >=20
> > > I checked the code and it looks like only DCE11 and newer support
> > > immediate flips. E.g.,
> > >=20
> > > /* flip immediate for async, default is vsync */
> > > tmp =3D RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
> > > tmp =3D REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
> > > GRPH_SURFACE_UPDATE_IMMEDIATE_EN, async ? 1 : 0);
> > >=20
> > > in dce_v11_0.c.
> > >=20
> > > Either way, the non-DC display code is not atomic anyway, so I don't
> > > think this is an issue. We still support async flips via the
> > > non-atomic API. I agree this is not blocking for the patch series,
> > > just thinking out loud mostly.
> >=20
> > Michel pointed out that DC can drive both DCN and DCE. This was a
> > misunderstanding on my end, I thought DC could only drive DCN. I'll rew=
ord the
> > commit message to refer to DC instead of DCN.
> >=20
> > This begs the question, should we bother to set the
> > atomic_async_page_flip_not_supported flag on non-atomic drivers? I've j=
ust
> > slapped the flag everywhere for simplicity's sake, but maybe it would m=
ake more
> > sense to just set it for atomic-capable drivers. Especially if the long=
-term
> > goal is to convert all atomic drivers to support async flips and eventu=
ally
> > remove atomic_async_page_flip_not_supported.
>=20
> yeah, I think we can drop the flag for non-atomic. amdgpu at least
> already supports async flips.
>=20
> > Thanks for the hint regarding DCE10. It sounds like it may be worthwhil=
e to
> > unset drm_mode_config.async_page_flip on DCE10 and earlier, to indicate=
 to
> > user-space that async page-flips are not supported on these ASICs? Righ=
t now it
> > seems like we indicate that we support them, and then ignore the ASYNC_=
FLIP
> > flag?
>=20
> Async flips work fine with the current code. I think I did the
> initial implementation on DCE10. We set
> GRPH_SURFACE_UPDATE_H_RETRACE_EN dynamically in dce_v10_0_page_flip()
> based on the type of flip selected.

Hm, can you elaborate on the difference between "immediate flip" (as in
UNP_FLIP_CONTROL) and GRPH_SURFACE_UPDATE_H_RETRACE_EN? What are their
relationship with KMS's concept of "async flips"?

Also you said earlier:

> We don't use hsync flips at all, even in non-atomic, as far as I recall.

Is "hsync flip" controlled by GRPH_SURFACE_UPDATE_H_RETRACE_EN, or is it
something else entirely?
