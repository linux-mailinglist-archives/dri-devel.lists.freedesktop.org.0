Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA6BD126C4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CED710E008;
	Mon, 12 Jan 2026 11:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rRzhT0rI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BAF10E008
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H7cZUleIa4BS4s1pJYJbT71GjKXKbZ/qX3Jpi9pXWWs=; b=rRzhT0rIyZzNOKdLKmQOdOdLyy
 bcR3TUgOsmF5RGZU1sow4Rh0zCA1vhltSr9xdfRFRK+Ir1fp40X4P7Zk9dwwJj4YvJb//Xdgf8V3w
 dgYDExDyCynND1Ct8xfjz3YfPuDRXCoxHirUL09JibbXk+GzbpZA6lNDu7V8savqGL8BiHsF+akUX
 IUSBTL1M2k6GDEJgje8o6DSr3xp/7bNlHIKOBl1yycEdLm/ReFCwUycDNm+tkfVskH1fqnFKv+HPJ
 wCUlK7sRSZzzhOf6AS+VUAbO0hWkJAssf0+WIKYnDE8Q6q8uF3tg5JQdR/8uc4HtmX9mBdZH4+6EJ
 mfebOIVA==;
Received: from 84.124.69.144.static.user.ono.com ([84.124.69.144]
 helo=[192.168.0.17]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vfGZG-004O5s-GH; Mon, 12 Jan 2026 12:58:42 +0100
Message-ID: <19cc245f97f6e30b18d6ef01697c5b53d6a53297.camel@igalia.com>
Subject: Re: [PATCH v2 0/2] drm/v3d: Convert v3d logging to device-based DRM
 helpers
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Simona Vetter
 <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Date: Mon, 12 Jan 2026 12:58:32 +0100
In-Reply-To: <20260112-v3d-drm-debug-v2-0-8ef6244c97bb@igalia.com>
References: <20260112-v3d-drm-debug-v2-0-8ef6244c97bb@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
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

Thanks!

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

El lun, 12-01-2026 a las 08:51 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> This small series intends to replace the legacy
> DRM_DEBUG/INFO/WARN/ERROR
> logging with the corresponding device-based drm_dbg(), drm_info(),
> drm_warn()
> and drm_err() helpers. I split the series in two patches to ease the
> reviewing process as the first one has a minor code-refactor.
>=20
> Thanks for the review!
>=20
> Best regards,
> - Ma=C3=ADra
>=20
> ---
> v1 -> v2:
>=20
> - [1/2, 2/2] Use the ``struct drm_file *file_priv`` pointer instead
> of
> =C2=A0 passing ``struct v3d_dev`` to functions (Iago Toral)
> - [2/2] s/drm_warn/drm_err in ``v3d_reset()`` (Iago Toral)
> - Link to v1:
> https://lore.kernel.org/r/20260109-v3d-drm-debug-v1-0-02041c873e4d@igalia=
.com
>=20
> ---
> Ma=C3=ADra Canal (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Consolidate CPU job validation in=
 a function
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Convert v3d logging to device-bas=
ed DRM helpers
>=20
> =C2=A0drivers/gpu/drm/v3d/v3d_bo.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
8 +--
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_gem.c=C2=A0=C2=A0=C2=A0 |=C2=A0 16 ++---
> =C2=A0drivers/gpu/drm/v3d/v3d_irq.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +--
> =C2=A0drivers/gpu/drm/v3d/v3d_mmu.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_submit.c | 140 +++++++++++++++++-----------=
-
> ----------
> =C2=A07 files changed, 88 insertions(+), 102 deletions(-)
> ---
> base-commit: 44e4c88951fa9c73bfbde8269e443ea5343dd2af
> change-id: 20260109-v3d-drm-debug-412cec00a4ac
>=20
>=20

