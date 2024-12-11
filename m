Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038E29ED025
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 16:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8D510E611;
	Wed, 11 Dec 2024 15:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="Pt7bzOnO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69D910E611
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 15:45:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733931906; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GTxSzouE/mJE+KcWqIisOlkVG9j+OotNYODT4LEZjRPdaSYKc7i1d0Crd7pyMjvDqdU5eLTRAX/5IeTigPpE5dHS8QXY1M4Jrn3NnjBVtKwOEaAb5Z5EktNEONCh+XYNOQCPSC6Br72m6UZTTrYsbjK8gBMsPTsLpkfFRVXWgDc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733931906;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=OHdp4oLrGWXBegQfCTP9oaUHfCcRbALc/9btYKwbm/g=; 
 b=RRnoLm5el6MLEoSqg88YRisYqGEx4pCOHZTWeSIdwTFwAa5e9+bRtwp+6zz1NaoPvMj8ouM9AxoI9MRiqTrYbcGY2YhARM/0SC6JpRC2Avt10K4KSe+oPS1dJog8rJ8+3gtXha+sFsmrpps0DAq2Xo7RzrcUJZ8Mv6SCxeWHqo4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733931906; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=OHdp4oLrGWXBegQfCTP9oaUHfCcRbALc/9btYKwbm/g=;
 b=Pt7bzOnOJxObbbrVV2c8d+mjSfJf2B1OyEdq1aUsl6K6KJ04U4xsbT8gez0v24Bu
 R1VLpZQv362bO7DGcB5tjH/VGBBwZcXzaLjyJk1HH+zdCKborvP0hG7Tr1kl96XVi8e
 FGuQlhU9cF2G4AfJVjHSIeh8h5wbkRjmyJArBfG8=
Received: by mx.zohomail.com with SMTPS id 1733931903262633.7303262296845;
 Wed, 11 Dec 2024 07:45:03 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
 s.hauer@pengutronix.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, Andy Yan <andy.yan@rock-chips.com>,
 kernel@collabora.com
Subject: Re: [PATCH v5 05/18] drm/rockchip: vop2: Set AXI id for rk3588
Date: Wed, 11 Dec 2024 10:45:01 -0500
Message-ID: <5843712.DvuYhMxLoT@bootstrap>
In-Reply-To: <2d381563.5e54.193b46d2f30.Coremail.andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <5839604.DvuYhMxLoT@trenzalore>
 <2d381563.5e54.193b46d2f30.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
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

On Wednesday, 11 December 2024 01:34:34 EST Andy Yan wrote:
> Hi Detlev,
>=20
> At 2024-12-11 02:40:14, "Detlev Casanova" <detlev.casanova@collabora.com>=
=20
wrote:
> >Hi Andy,
> >
> >On Monday, 9 December 2024 07:29:18 EST Andy Yan wrote:
> >> From: Andy Yan <andy.yan@rock-chips.com>
> >>=20
> >> There are two AXI bus in vop2, windows attached on the same bus must
> >> have a unique channel YUV and RGB channel ID.
> >>=20
> >> The default IDs will conflict with each other on the rk3588, so they
> >> need to be reassigned.
> >>=20
> >> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> >> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> >> Tested-by: Derek Foreman <derek.foreman@collabora.com>
> >>=20
> >> ---
> >>=20
> >> Changes in v5:
> >> - Added in V5
> >>=20
> >>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 +++++++++++
> >>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  9 +++++++
> >>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 26 +++++++++++++++++++-
> >>  3 files changed, 48 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c index
> >> dc4edd65bc9e..8b9ca046eeeb 100644
> >> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> @@ -1426,6 +1426,12 @@ static void vop2_plane_atomic_update(struct
> >> drm_plane *plane, &fb->format->format,
> >>=20
> >>  		afbc_en ? "AFBC" : "", &yrgb_mst);
> >>=20
> >> +	if (vop2->data->soc_id > 3568) {
> >
> >Shouldn't this be done only for rk3588, as specified in the comments bel=
ow
> >? The test we did before showed that it is failing on rk3576 and 3576 is=
 >
> >3588.
> I think this is because you tested before with the patch I gave Derek=20
> without axi id assigned for rk3576.
> I assigned axi id for rk3576 in this version 18/18=EF=BC=88The new ID ass=
ignment can
> adapt to more application scenarios.=EF=BC=89, can you test it with the w=
hole V5
> version again?

Yes, I will do that. But patch 18 mentions:
+       /* Read only bit on rk3576*/
+       [VOP2_WIN_AXI_BUS_ID] =3D REG_FIELD(RK3568_CLUSTER_CTRL, 13, 13),

And the bit is being written here. If it is indeed writable, then I would d=
rop=20
that comment.

> >I suggest
> >
> >	if (vop2->data->soc_id =3D=3D 3588) {
> >
> >Regards,
> >Detlev
> >
> >> +		vop2_win_write(win, VOP2_WIN_AXI_BUS_ID, win->data-
> >>
> >>axi_bus_id);
> >>
> >> +		vop2_win_write(win, VOP2_WIN_AXI_YRGB_R_ID, win->data-
> >>
> >>axi_yrgb_r_id);
> >>
> >> +		vop2_win_write(win, VOP2_WIN_AXI_UV_R_ID, win->data-
> >>
> >>axi_uv_r_id);
> >>
> >> +	}
> >> +
> >>=20
> >>  	if (vop2_cluster_window(win))
> >>  =09
> >>  		vop2_win_write(win, VOP2_WIN_AFBC_HALF_BLOCK_EN,
> >
> >half_block_en);
> >

Detlev.


