Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EC39F30C4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 13:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCDB10E3E2;
	Mon, 16 Dec 2024 12:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czLdKP/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3839410E3E2;
 Mon, 16 Dec 2024 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734353097; x=1765889097;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=EvJsNZyMdTe/t/OA+34MGlqfu8RZxdIlQ/fLcVfLXCM=;
 b=czLdKP/wkzOA5dRlZNjy2z2euMi7J+PSFF5qtM5DUKypKjw9tk3zsheG
 X7Y6eXOMjurFFgtcptjBfAtk+cp5wGOLLH+QGHIJfVkSfy9W/8viXjXjF
 R6to6l+FYRLb6l66F8qaPay1VeQdZ5zYhucDRtb7YvcmveGDgPeCdN01e
 2a8TRLu27Ys4ZKSeIf2H0RzMjBeeSG+UpXNnT0QLs7SMNlbzhNUkQHsLn
 svZhmVqmqL4CJwK/KqDcNFv9vQuVOzTqEORrJbKB6zlNX9UB7NGIYgkKm
 Wdn02zSYBRHXsvojGuAAUYMsM/Q0Vt6FNv0/Z+hbV4GImMMSd8Oz7AQ+t w==;
X-CSE-ConnectionGUID: bjOtilgwTYS5okgpssfIVQ==
X-CSE-MsgGUID: XvWTEzebQnO9R7acVJ7mFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45737465"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45737465"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 04:44:56 -0800
X-CSE-ConnectionGUID: LSOUWf+jT/yWHF5SLYsSPA==
X-CSE-MsgGUID: XHKk/6xOS561V9ovdfdEDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="97233492"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 04:44:54 -0800
Date: Mon, 16 Dec 2024 14:45:31 +0200
From: Imre Deak <imre.deak@intel.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Wayne Lin <wayne.lin@amd>, Alex Deucher <alexander.deucher@amd.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v3 06/11] drm/amd/dp_mst: Expose a connector to kernel
 users after it's properly initialized
Message-ID: <Z2Ag68XqBOZTghHq@ideak-desk.fi.intel.com>
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-7-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211230328.4012496-7-imre.deak@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Harry, Leo, Alex, Wayne,

could you please ack this change as well?

Thanks,
Imre

A typo below in the commit log, can fix it while merging the patch here and in
the i915/nouveau patches.

On Thu, Dec 12, 2024 at 01:03:23AM +0200, Imre Deak wrote:
> After a connector is added to the drm_mode_config::connector_list, it's
> visible to any in-kernel users looking up connectors via the above list.
> Make sure that the connector is properly initialized before such
> look-ups, by initializing the connector with
> drm_connector_dynamic_register() - which doesn't add the connector to
  ^ should be drm_connector_dynamic_init()

> the list - and registering it with drm_connector_dynamic_register() -
> which adds the connector to the list - after the initialization is
> complete.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 6e43594906130..d398bc74e6677 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -590,11 +590,12 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
>  	amdgpu_dm_set_mst_status(&aconnector->mst_status,
>  			MST_PROBE, true);
>  
> -	if (drm_connector_init(
> +	if (drm_connector_dynamic_init(
>  		dev,
>  		connector,
>  		&dm_dp_mst_connector_funcs,
> -		DRM_MODE_CONNECTOR_DisplayPort)) {
> +		DRM_MODE_CONNECTOR_DisplayPort,
> +		NULL)) {
>  		kfree(aconnector);
>  		return NULL;
>  	}
> -- 
> 2.44.2
> 
