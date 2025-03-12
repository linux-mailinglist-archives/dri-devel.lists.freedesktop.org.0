Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37AFA5DF5D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 15:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021C510E799;
	Wed, 12 Mar 2025 14:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8tUDvxJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7FC10E7A2;
 Wed, 12 Mar 2025 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741790749; x=1773326749;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=LzO7zDFVj/Lq8H1pMmqw0FuN6IxeUVkCuSJaU2WpVdU=;
 b=l8tUDvxJGqdqij4aaFfRKBw86JpD/h/INhvuqDXubx7eA7XUvCLQMjiK
 TON0s2ZNu688EVOIboxfLNRkCS4WWRfcJEVqj8aKhRhj0HmPWlRNlD9kC
 iVLZNkTWrNlf2/Y7R7UdUmiHL26v1JmqEutqcjQoPd8SehErkZ9UQsaGj
 xLHHqXMXzG/GIzk20YuwJxqykR30nSBR4ArqAQU6b6tns+zYFb45nrnP+
 r7ifT3o1f5JS/e/8IeGyXTYgd2nESlXOBv6D0GIh/TaAIiz0aeskxVGHA
 BybHMUzKJseb2bYgpBB6DFY9VOEjsc6wVLN5QAA/EHWbP503HizhvvIsS g==;
X-CSE-ConnectionGUID: sLY/J3wlS26V+9uZ22+z/Q==
X-CSE-MsgGUID: PEVLlAiBSOmPufv1t3yadA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="60417891"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="60417891"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 07:45:49 -0700
X-CSE-ConnectionGUID: rpmgR+gITZWECGXQV/zwJg==
X-CSE-MsgGUID: KHKRraf6T3OvdIunyaVfTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120631623"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.23])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 07:45:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 8/8] drm/client: s/unsigned int i/int i/
In-Reply-To: <20250228211454.8138-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
 <20250228211454.8138-9-ville.syrjala@linux.intel.com>
Date: Wed, 12 Mar 2025 16:45:44 +0200
Message-ID: <87wmcue293.fsf@intel.com>
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

On Fri, 28 Feb 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Replace the 'unsigned int i' footguns with plain old signed
> int. Avoids accidents if/when someone decides they need
> to iterate backwards.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_client_modeset.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_c=
lient_modeset.c
> index 54cbcaa476e2..0f9d5ba36c81 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -39,7 +39,7 @@ int drm_client_modeset_create(struct drm_client_dev *cl=
ient)
>  	unsigned int max_connector_count =3D 1;
>  	struct drm_mode_set *modeset;
>  	struct drm_crtc *crtc;
> -	unsigned int i =3D 0;
> +	int i =3D 0;
>=20=20
>  	/* Add terminating zero entry to enable index less iteration */
>  	client->modesets =3D kcalloc(num_crtc + 1, sizeof(*client->modesets), G=
FP_KERNEL);
> @@ -75,7 +75,7 @@ static void drm_client_modeset_release(struct drm_clien=
t_dev *client)
>  	struct drm_mode_set *modeset;
>=20=20
>  	drm_client_for_each_modeset(modeset, client) {
> -		unsigned int i;
> +		int i;
>=20=20
>  		drm_mode_destroy(client->dev, modeset->mode);
>  		modeset->mode =3D NULL;
> @@ -960,7 +960,7 @@ bool drm_client_rotation(struct drm_mode_set *modeset=
, unsigned int *rotation)
>  	struct drm_plane *plane =3D modeset->crtc->primary;
>  	struct drm_cmdline_mode *cmdline;
>  	u64 valid_mask =3D 0;
> -	unsigned int i;
> +	int i;
>=20=20
>  	if (!modeset->num_connectors)
>  		return false;

--=20
Jani Nikula, Intel
