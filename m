Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B32858C0B50
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 08:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506AF10E1E6;
	Thu,  9 May 2024 06:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fUw4Gqqt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A446E10E1E6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 06:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0RjHwT+YyLuDF5iFL8ttb518kQW+NUsvtIvVczatkKM=; b=fUw4Gqqtc+Iice6Z8DqBiiDwl8
 GpNkDdrn9WExGlGxcCnDJgp1iTXwQeAm4QJbZV4HThIO+3vz1xy0GQCmYug8MEJbFRtC68SFXEK4h
 lSgh5DZHe2snqBb5k4pZPQE3SHuzcG4JzvwcT9meisF+mvoyYU+tBDkglU8PC/55ainBiHxzr7j8C
 ZgtXvgFAHaHqzKABKDBL7PxKW7/O9+HaUfvtAwBqYIZ2JCYwMeTX+pG1XaqdTF4v2iFTSSLIQxQis
 5oAADlV6DxBZkST/3duUyDMtb41XJxFI8wAuO6/Ey25v2C3ZcwwYuK6ys+X2IlvL81iV302zrWgd/
 sTL52pTA==;
Received: from [192.168.12.229] by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4x2h-003ZxZ-65; Thu, 09 May 2024 08:14:11 +0200
Message-ID: <d6f30dd43106e811f0181f557e633d8ed98302cf.camel@igalia.com>
Subject: Re: [PATCH 6/6] drm/v3d: Deprecate the use of the Performance
 Counters enum
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 "Juan A ." =?ISO-8859-1?Q?Su=E1rez?= <jasuarez@igalia.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Thu, 09 May 2024 08:14:11 +0200
In-Reply-To: <20240508143306.2435304-8-mcanal@igalia.com>
References: <20240508143306.2435304-2-mcanal@igalia.com>
 <20240508143306.2435304-8-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
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

El mi=C3=A9, 08-05-2024 a las 11:30 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> The Performance Counters enum used to identify the index of each
> performance counter and provide the total number of performance
> counters (V3D_PERFCNT_NUM). But, this enum is only valid for V3D 4.2,
> not for V3D 7.1.
>=20
> As we implemented a new flexible structure to retrieve performance
> counters information, we can deprecate this enum.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0include/uapi/drm/v3d_drm.h | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> index 0860ddb3d0b6..706b4dea1c45 100644
> --- a/include/uapi/drm/v3d_drm.h
> +++ b/include/uapi/drm/v3d_drm.h
> @@ -603,6 +603,12 @@ struct drm_v3d_submit_cpu {
> =C2=A0	__u64 extensions;
> =C2=A0};
> =C2=A0
> +/* The performance counters index represented by this enum are
> deprecated and
> + * must no longer be used. These counters are only valid for V3D
> 4.2.
> + *
> + * In order to check for performance counter information,
> + * use DRM_IOCTL_V3D_PERFMON_GET_COUNTER.

We should probably also include a reference to the new
DRM_V3D_PARAM_MAX_PERF_COUNTERS param here as well to retrieve the
total number of counters available.

Iago

> + */
> =C2=A0enum {
> =C2=A0	V3D_PERFCNT_FEP_VALID_PRIMTS_NO_PIXELS,
> =C2=A0	V3D_PERFCNT_FEP_VALID_PRIMS,

