Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C31578404D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E494310E339;
	Tue, 22 Aug 2023 12:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0589610E338;
 Tue, 22 Aug 2023 12:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692706009; x=1724242009;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nWJ1b5l20Rmn7XHrf6p8/G2yfoSyKviMSMuDJTOiK2A=;
 b=TlC6kvKZcZvH41XCaOyr7roDfF3zqT5rb6pebMVMzZ9JxNS3zqO1JtLj
 RyRUt/wdqgswytQea4zreKnC1P3mzYo+hxwd5QRglcjaWAjrc+aIJDQkc
 rSP6FHseo7ILJCgs3uscbJAdXgZOhXP/2UWcnJWtu5uGzOQurcVECKqkW
 AWq1s47p+TrtntRNNqUBDpJ+WSPIn0Y9fV4v05MZPQNlauX/2uidryxJe
 lN0pq0SIu1GwBzPmBe3Xg3JSNO4Wa8YYIcI/YtNVbP5Ps+Bh9kyCUKB49
 FCFVCr/Nqk3+yncuiqs2AvKwMf9Fh+IzaMBQFaY1nIKYW32EHp4jlNaCD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377619795"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="377619795"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 05:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="982852181"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="982852181"
Received: from kainaats-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.230])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 05:06:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 4/4] Revert "drm/amd/display: implement force function
 in amdgpu_dm_connector_funcs"
In-Reply-To: <e65f30aa1bd581308f916fd005999ebe66618fad.1692705543.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692705543.git.jani.nikula@intel.com>
 <e65f30aa1bd581308f916fd005999ebe66618fad.1692705543.git.jani.nikula@intel.com>
Date: Tue, 22 Aug 2023 15:06:43 +0300
Message-ID: <877cpn7030.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Chao-kai Wang <Stylon.Wang@amd.com>, Alex Hung <alex.hung@amd.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> This reverts commit 0ba4a784a14592abed41873e339eab78ceb6e230.
>
> drm_edid_override_connector_update() is *not* supposed to be used by
> drivers directly.
>
> From the documentation:
>
>   Only to be used from drm_helper_probe_single_connector_modes() as a
>   fallback for when DDC probe failed during drm_get_edid() and caused
>   the override/firmware EDID to be skipped.
>
> It's impossible to unify firmare and override EDID handling and property
> updates if drivers mess with this directly.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: Chao-kai Wang <Stylon.Wang@amd.com>
> Cc: Daniel Wheeler <daniel.wheeler@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Wenchieh Chien <wenchieh.chien@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +------------------
>  1 file changed, 1 insertion(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index adfe2fcb915c..25151085508f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6317,31 +6317,6 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>  	return 0;
>  }
>  
> -void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
> -{
> -	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
> -	struct dc_link *dc_link = aconnector->dc_link;
> -	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
> -	struct edid *edid;
> -
> -	if (!connector->edid_override)
> -		return;

This one too, also documented:

	/**
	 * @edid_override: Override EDID set via debugfs.
	 *
	 * Do not modify or access outside of the drm_edid_override_* family of
	 * functions.
	 */

> -
> -	drm_edid_override_connector_update(&aconnector->base);
> -	edid = aconnector->base.edid_blob_ptr->data;
> -	aconnector->edid = edid;
> -
> -	/* Update emulated (virtual) sink's EDID */
> -	if (dc_em_sink && dc_link) {
> -		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
> -		memmove(dc_em_sink->dc_edid.raw_edid, edid, (edid->extensions + 1) * EDID_LENGTH);
> -		dm_helpers_parse_edid_caps(
> -			dc_link,
> -			&dc_em_sink->dc_edid,
> -			&dc_em_sink->edid_caps);
> -	}
> -}
> -
>  static const struct drm_connector_funcs amdgpu_dm_connector_funcs = {
>  	.reset = amdgpu_dm_connector_funcs_reset,
>  	.detect = amdgpu_dm_connector_detect,
> @@ -6352,8 +6327,7 @@ static const struct drm_connector_funcs amdgpu_dm_connector_funcs = {
>  	.atomic_set_property = amdgpu_dm_connector_atomic_set_property,
>  	.atomic_get_property = amdgpu_dm_connector_atomic_get_property,
>  	.late_register = amdgpu_dm_connector_late_register,
> -	.early_unregister = amdgpu_dm_connector_unregister,
> -	.force = amdgpu_dm_connector_funcs_force
> +	.early_unregister = amdgpu_dm_connector_unregister
>  };
>  
>  static int get_modes(struct drm_connector *connector)

-- 
Jani Nikula, Intel Open Source Graphics Center
