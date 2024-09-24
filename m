Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BB5983C5D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 07:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A1110E4E8;
	Tue, 24 Sep 2024 05:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bM1AJCvO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346FE10E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 05:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3W5iz06bXlmZUwS24EMstofkPye68S/8CIj9q/Tm7uU=; b=bM1AJCvOBwWqg2kUepSVkHgUJ5
 LLlSX/gpBQ6T6rP5UBqhG8i/zo9rsBxfSZ0jRnkEeNguUf5F+OeTndxCNmIEoIvlrK3gGCDlODSKV
 4sPDb79qPhDoFiT2Si9yqMX3XwAL6uBnJ5GLh5vAUY0rpaNnyF8czKc0dhm6cB74pF5CVqXn/tREL
 7067ttdxzuj5/ORbNUXppL+yUVdGnsYRAwNgBZ48G2VQ/eB50DPcmppPpoTrqajjYIrs4yFcLVx5v
 cDwcSV/RRwjSg4gb+TYF9wQNE5M/nHTEU9B4hHOEXPHvu59Md5u1Kh6MklX5z3h/emh/OUtwtxDkN
 35Xz5gdQ==;
Received: from 62.83.47.18.dyn.user.ono.com ([62.83.47.18] helo=[192.168.0.17])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ssy8A-000FNN-LE; Tue, 24 Sep 2024 07:30:34 +0200
Message-ID: <e90e4fd6c03d30e8b43ef8e492767977b1e99ad5.camel@igalia.com>
Subject: Re: [PATCH v6 11/11] drm/v3d: Expose Super Pages capability
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Tvrtko Ursulin <tursulin@igalia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Tue, 24 Sep 2024 07:30:24 +0200
In-Reply-To: <20240923141348.2422499-12-mcanal@igalia.com>
References: <20240923141348.2422499-1-mcanal@igalia.com>
 <20240923141348.2422499-12-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
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

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

El lun, 23-09-2024 a las 10:55 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> Add a new V3D parameter to expose the support of Super Pages to
> userspace. The userspace might want to know this information to
> apply optimizations that are specific to kernels with Super Pages
> enabled.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.c | 3 +++
> =C2=A0include/uapi/drm/v3d_drm.h=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A02 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
> b/drivers/gpu/drm/v3d/v3d_drv.c
> index 8be8c6dd9b35..fb35c5c3f1a7 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -104,6 +104,9 @@ static int v3d_get_param_ioctl(struct drm_device
> *dev, void *data,
> =C2=A0	case DRM_V3D_PARAM_MAX_PERF_COUNTERS:
> =C2=A0		args->value =3D v3d->perfmon_info.max_counters;
> =C2=A0		return 0;
> +	case DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES:
> +		args->value =3D !!v3d->gemfs;
> +		return 0;
> =C2=A0	default:
> =C2=A0		DRM_DEBUG("Unknown parameter %d\n", args->param);
> =C2=A0		return -EINVAL;
> diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> index 87fc5bb0a61e..2376c73abca1 100644
> --- a/include/uapi/drm/v3d_drm.h
> +++ b/include/uapi/drm/v3d_drm.h
> @@ -290,6 +290,7 @@ enum drm_v3d_param {
> =C2=A0	DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT,
> =C2=A0	DRM_V3D_PARAM_SUPPORTS_CPU_QUEUE,
> =C2=A0	DRM_V3D_PARAM_MAX_PERF_COUNTERS,
> +	DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES,
> =C2=A0};
> =C2=A0
> =C2=A0struct drm_v3d_get_param {

