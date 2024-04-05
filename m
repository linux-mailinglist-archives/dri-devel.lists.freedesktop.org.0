Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA2D8997BC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 10:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9879113A51;
	Fri,  5 Apr 2024 08:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bh9/DsXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2201A113A50;
 Fri,  5 Apr 2024 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712305556; x=1743841556;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Bg3i9gUs2KNmsiaeURC3hc68fGURAjloO3OwHQh+kow=;
 b=Bh9/DsXju9FKawzDyZjZ+L0AU67U86iis5crCWF77gTCnGD8d7KNMD6Z
 gDhF1lS7KlDEPkJB8vEbeWep4DSPW0ZWCUMvtRCvhDQkayhCJYMKPaGKw
 knEgRA0kQRp29ax6bbUunGWM1RPlCAE/EmpsY/WqS3GuCAdQuxJSXWibw
 b1kLXr2M3QngLpaAaEzhrqnweNYw/nqv2jFIFzi+MC7pvcFB0fb9UJ6kM
 JF400mFA7fDVVg0gr7AHMo5jjpEOqylvAWIq07iWPraN64sl5j9mH9awM
 BjauqR877SJqufvUl3m2spxGNUBuXK3Kkd04ltvjPBUniP0Tras/6u0sw w==;
X-CSE-ConnectionGUID: YTIwZRv+QeO8SQ5S5JuaZw==
X-CSE-MsgGUID: ofEALIiOQ0ah3qa/zkVYFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11440539"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="11440539"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:25:54 -0700
X-CSE-ConnectionGUID: 9neCS/knTeGC5q9PT9OiZQ==
X-CSE-MsgGUID: GGnTn7CiRYyZUcnNLLKIXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19648678"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.41.202])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:25:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 12/12] drm/probe-helper: Switch to per-device debugs
In-Reply-To: <20240404203336.10454-13-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-13-ville.syrjala@linux.intel.com>
Date: Fri, 05 Apr 2024 11:25:49 +0300
Message-ID: <877chccj1u.fsf@intel.com>
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

On Thu, 04 Apr 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Switch to per-device debugs so that we know which
> device we're dealing with.

Again see the first handful of patches in the series [1]. It cleans up
the mode printing as well.

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1709843865.git.jani.nikula@intel.com


>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 35 ++++++++++++++----------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_pro=
be_helper.c
> index 968a3ee66b1e..0860f7367511 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -567,8 +567,8 @@ int drm_helper_probe_single_connector_modes(struct dr=
m_connector *connector,
>=20=20
>  	drm_modeset_acquire_init(&ctx, 0);
>=20=20
> -	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id,
> -			connector->name);
> +	drm_dbg_kms(dev, "[CONNECTOR:%d:%s]\n",
> +		    connector->base.id, connector->name);
>=20=20
>  retry:
>  	ret =3D drm_modeset_lock(&dev->mode_config.connection_mutex, &ctx);
> @@ -611,11 +611,10 @@ int drm_helper_probe_single_connector_modes(struct =
drm_connector *connector,
>  	 * check here, and if anything changed start the hotplug code.
>  	 */
>  	if (old_status !=3D connector->status) {
> -		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] status updated from %s to %s\n",
> -			      connector->base.id,
> -			      connector->name,
> -			      drm_get_connector_status_name(old_status),
> -			      drm_get_connector_status_name(connector->status));
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] status updated from %s to %s\n",
> +			    connector->base.id, connector->name,
> +			    drm_get_connector_status_name(old_status),
> +			    drm_get_connector_status_name(connector->status));
>=20=20
>  		/*
>  		 * The hotplug event code might call into the fb
> @@ -638,8 +637,8 @@ int drm_helper_probe_single_connector_modes(struct dr=
m_connector *connector,
>  		drm_kms_helper_poll_enable(dev);
>=20=20
>  	if (connector->status =3D=3D connector_status_disconnected) {
> -		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
> -			connector->base.id, connector->name);
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] disconnected\n",
> +			    connector->base.id, connector->name);
>  		drm_connector_update_edid_property(connector, NULL);
>  		drm_mode_prune_invalid(dev, &connector->modes, false);
>  		goto exit;
> @@ -697,8 +696,8 @@ int drm_helper_probe_single_connector_modes(struct dr=
m_connector *connector,
>=20=20
>  	drm_mode_sort(&connector->modes);
>=20=20
> -	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] probed modes :\n", connector->base.id,
> -			connector->name);
> +	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] probed modes :\n",
> +		    connector->base.id, connector->name);
>  	list_for_each_entry(mode, &connector->modes, head) {
>  		drm_mode_set_crtcinfo(mode, CRTC_INTERLACE_HALVE_V);
>  		drm_mode_debug_printmodeline(mode);
> @@ -834,14 +833,12 @@ static void output_poll_execute(struct work_struct =
*work)
>  			old =3D drm_get_connector_status_name(old_status);
>  			new =3D drm_get_connector_status_name(connector->status);
>=20=20
> -			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] "
> -				      "status updated from %s to %s\n",
> -				      connector->base.id,
> -				      connector->name,
> -				      old, new);
> -			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] epoch counter %llu -> %llu\n",
> -				      connector->base.id, connector->name,
> -				      old_epoch_counter, connector->epoch_counter);
> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] status updated from %s to %s\n",
> +				    connector->base.id, connector->name,
> +				    old, new);
> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] epoch counter %llu -> %llu\n",
> +				    connector->base.id, connector->name,
> +				    old_epoch_counter, connector->epoch_counter);
>=20=20
>  			changed =3D true;
>  		}

--=20
Jani Nikula, Intel
