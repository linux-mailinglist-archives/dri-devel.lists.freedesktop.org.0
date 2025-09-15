Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09AAB584DA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 20:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB8F10E536;
	Mon, 15 Sep 2025 18:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="Hs3ZV1hH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B3610E534;
 Mon, 15 Sep 2025 18:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757961794; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nQwWZYmocl4JMvKJOiPfKO9vdwj2+4P60BEd7YACJrWjfT1cxAVeKywjf8s9YHTcwwnYXDT24ZxfA9pWaCou+5vewWu07s/JGjXWWJX4EHzxepk2jGtDZU74USFSjli03N32owN1WbA00UjW4AzFWqMxhdZfUve9QaMcsX+L4Gk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757961794;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HDCXdq+Cp62kQWHFw4NCmWffFqBc4USI+nx9VO+fazQ=; 
 b=O8N5ZUmDNI+HCfkk+6yvd0i2gx4s6MMKd45VPVErsTalQW/gDPM5bLiNdo23qanq9uiKbyu2+JqKS2hqg2E1LGhMLw3v0p64OWpTV++ctNGrHZ6UcPtwlM0uNxpqZY9py/03v973ZSTmdfLhOPoco/mrga5mSrhW2WBiLfSpDM8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757961794; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=HDCXdq+Cp62kQWHFw4NCmWffFqBc4USI+nx9VO+fazQ=;
 b=Hs3ZV1hHgedLuyNxJlc0JZct3XwBWWXRqsKyjTuhMREGK1IVQEi8F8q2Dj3h1RSq
 o06FVT8t/572IZBdaa2mPpvMsXd5b1ASs5QpuSPaKar9gBURFKCUnp9Fe0nZn7Rcu75
 PpUsZF5BmwUOWXQlqkBCu0v7aUyYGU3aw4KKug04=
Received: by mx.zohomail.com with SMTPS id 1757961791617141.89983291026647;
 Mon, 15 Sep 2025 11:43:11 -0700 (PDT)
Message-ID: <14dc410514608487a8f44c2060ee7aab3339e64f.camel@collabora.com>
Subject: Re: [PATCH V11 11/47] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, 
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, 	contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, 	shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, 
 aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com,
 daniel@ffwll.ch, 	uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, 	quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, 	sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, 	louis.chauvet@bootlin.com,
 mcanal@igalia.com, Daniel Stone <daniels@collabora.com>
Date: Mon, 15 Sep 2025 14:43:08 -0400
In-Reply-To: <20250815035047.3319284-12-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-12-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <14dc410514608487a8f44c2060ee7aab3339e64f.camel@collabora.com>+zmo_0_nfraprado@collabora.com
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

On Thu, 2025-08-14 at 21:50 -0600, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
>=20
> With the introduction of the pre-blending color pipeline we
> can no longer have color operations that don't have a clear
> position in the color pipeline. We deprecate all existing
> plane properties. For upstream drivers those are:
> =C2=A0- COLOR_ENCODING
> =C2=A0- COLOR_RANGE
>=20
> Drivers are expected to ignore these properties when
> programming the HW. DRM clients that register with
> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE will not be allowed to
> set the COLOR_ENCODING and COLOR_RANGE properties.
>=20
> Setting of the COLOR_PIPELINE plane property or drm_colorop
> properties is only allowed for userspace that sets this
> client cap.
>=20
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> ---
> v11
> =C2=A0- Skip color_encoding/range_property in
> drm_mode_object_get_properties
> =C2=A0=C2=A0 when plane_color_pipeline is present (Harry Wentland)
>=20
> V9:
> =C2=A0- Fix typo in commit description (Shengyu Qu)
>=20
> v8:
> =C2=A0- Disallow setting of COLOR_RANGE and COLOR_ENCODING when
> =C2=A0=C2=A0 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set
>=20
> v5:
> =C2=A0- Fix kernel docs
>=20
> v4:
> =C2=A0- Don't block setting of COLOR_RANGE and COLOR_ENCODING
> =C2=A0=C2=A0 when client cap is set
>=20
> =C2=A0drivers/gpu/drm/drm_connector.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/drm_crtc_internal.h |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/drm_ioctl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 7 +++++++
> =C2=A0drivers/gpu/drm/drm_mode_object.c=C2=A0=C2=A0 | 18 ++++++++++++++++=
++
> =C2=A0include/drm/drm_file.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++++
> =C2=A0include/uapi/drm/drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++++++++++++++
> =C2=A06 files changed, 49 insertions(+)
[..]

> @@ -399,6 +401,21 @@ int drm_mode_object_get_properties(struct
> drm_mode_object *obj, bool atomic,
> =C2=A0		if ((prop->flags & DRM_MODE_PROP_ATOMIC) && !atomic)
> =C2=A0			continue;
> =C2=A0
> +		if (plane_color_pipeline && obj->type =3D=3D
> DRM_MODE_OBJECT_PLANE) {
> +			struct drm_plane *plane =3D obj_to_plane(obj);
> +
> +			if (prop =3D=3D plane->color_encoding_property
> ||
> +			=C2=A0=C2=A0=C2=A0 prop =3D=3D plane->color_range_property)
> +				continue;
> +		}

A feedback that came up when discussing post-blend colorops [1] which
is also applicable here, is that there should be a driver cap in
addition to the client cap, and that the client cap should only be
possible to set if the driver cap is set. Without that, if the driver
doesn't support color pipelines, the client will effectively and
unintentionally disable color operations without any replacement when
setting the client cap.

Another suggestion was to keep the deprecated properties (in this case
COLOR_RANGE and COLOR_ENCODING) available but read-only so that
drm_info can display them and so that graceful handover from colorop-
unaware to colorop-aware clients can happen.

[1]
https://lore.kernel.org/dri-devel/20250822-mtk-post-blend-color-pipeline-v1=
-0-a9446d4aca82@collabora.com/T/#m830e2f87ca82b1f8da7377d0c55c557fb070c2dd


> +
> +		if (!plane_color_pipeline && obj->type =3D=3D
> DRM_MODE_OBJECT_PLANE) {
> +			struct drm_plane *plane =3D obj_to_plane(obj);
> +
> +			if (prop =3D=3D plane->color_pipeline_property)
> +				continue;
> +		}
> +
> =C2=A0		if (*arg_count_props > count) {
> =C2=A0			ret =3D __drm_object_property_get_value(obj,
> prop, &val);
> =C2=A0			if (ret)
>=20
[..]
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 3cd5cf15e3c9..27cc159c1d27 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -906,6 +906,21 @@ struct drm_get_cap {
> =C2=A0 */
> =C2=A0#define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
> =C2=A0
> +/**
> + * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
> + *
> + * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
> + * property on a &drm_plane, as well as drm_colorop properties.
> + *
> + * Setting of these plane properties will be rejected when this
> client
> + * cap is set:
> + * - COLOR_ENCODING
> + * - COLOR_RANGE
> + *
> + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
> + */
> +#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
> +
> =C2=A0/* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
> =C2=A0struct drm_set_client_cap {
> =C2=A0	__u64 capability;

One other thing pointed out was that these deprecated properties are
not actually rejected, but simply unlisted in the current
implementation, contrary to the documentation above. But if we do make
them read-only we'll need to revert back to the implementation on the
previous version, and then the documentation can stay as is.

--=20
Thanks,

N=C3=ADcolas
