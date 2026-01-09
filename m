Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A6ED07BFA
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F6910E804;
	Fri,  9 Jan 2026 08:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpiF1imw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B268510E803;
 Fri,  9 Jan 2026 08:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767946605; x=1799482605;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=j7orR2NtnTW67/dD41Odsk6P3QmGzHSO9R+bo8KtTSw=;
 b=EpiF1imwfTJmnBo091026CSK+/p4PSEDThmk53neFFtJe2aAYMYuZJq4
 fUNLcA3oXJEbgpaP0XXB1ctOoO1BedW6Xdp/kMBSfhhFQTlZ1SJ1bReNq
 1OrYA5kz8LtKJatRSb75+4/iOoK5hGk5BpjMT9XHHbGKcxc6YHtsXmcjl
 zSC9DdqBDS6D2/I4pf6KS9rwD7kb7toRXXYfuz8X/tN/Cq4xK5dJg6+W2
 gfGjaM3XG/fXI+ir/vlwR8y0TMr6KfYpGe/frr9GY3ci6sCrFjLcvzyrO
 x2ospz+/EFb0mtFG1oFg8uenKsPLDd65ylkvRttxkKzw6Dln7TqaG0I93 Q==;
X-CSE-ConnectionGUID: OCHWC1uAQ2GAt/dP5rgYJw==
X-CSE-MsgGUID: Xx5IwLuWS5qe1KhEOcheLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="72961987"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="72961987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:16:44 -0800
X-CSE-ConnectionGUID: lAgisFcjSiejQEOHpEZu/Q==
X-CSE-MsgGUID: TrMUJKZvSoGwLtRF2V4IAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="208250144"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.143])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:16:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Leo Li <sunpeng.li@amd.com>, "Mario Limonciello (AMD)"
 <superm1@kernel.org>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, harry.wentland@amd.com, Xaver Hugl
 <xaver.hugl@gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Attach OLED property to eDP panels
In-Reply-To: <7bcfdb56-2e9a-4d38-a0df-f941907ae4a8@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260106170017.68158-1-superm1@kernel.org>
 <20260106170017.68158-3-superm1@kernel.org>
 <7bcfdb56-2e9a-4d38-a0df-f941907ae4a8@amd.com>
Date: Fri, 09 Jan 2026 10:16:38 +0200
Message-ID: <f62e27a385eaf07f78e7959472f2d30ac3cb9140@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 08 Jan 2026, Leo Li <sunpeng.li@amd.com> wrote:
> On 2026-01-06 12:00, Mario Limonciello (AMD) wrote:
>> amdgpu verifies that a given panel is an OLED panel from extended caps
>> and can provide accurate information to userspace.  Attach a property
>> to the DRM connector.
>> 
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 35dbc6aba4dfc..1cac5ebf50a9d 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -91,6 +91,7 @@
>>  #include <drm/drm_fourcc.h>
>>  #include <drm/drm_edid.h>
>>  #include <drm/drm_eld.h>
>> +#include <drm/drm_mode.h>
>>  #include <drm/drm_utils.h>
>>  #include <drm/drm_vblank.h>
>>  #include <drm/drm_audio_component.h>
>> @@ -3739,6 +3740,10 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>>  	caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
>>  	caps->aux_support = false;
>>  
>> +	drm_object_property_set_value(&conn_base->base,
>> +				      adev_to_drm(adev)->mode_config.panel_type_property,
>> +				      caps->ext_caps->bits.oled ? DRM_MODE_PANEL_TYPE_OLED : DRM_MODE_PANEL_TYPE_UNKNOWN);
>> +
>
> I think we'll want to pull this out into something like
> `dm_set_panel_type()`, called after `update_connector_ext_caps()` and
> any additional bits of edid parsing needed to make panel_type
> detection more robust. I suppose that can be a future task.

I really wish you moved *all* EDID parsing to drm_edid.c instead of
having your own.

BR,
Jani.

>
> Series is
> Reviewed-by: Leo Li <sunpeng.li@amd.com>
>
> Thanks,
> Leo
>
>>  	if (caps->ext_caps->bits.oled == 1
>>  	    /*
>>  	     * ||
>> @@ -9020,6 +9025,8 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>>  	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
>>  		struct drm_privacy_screen *privacy_screen;
>>  
>> +		drm_connector_attach_panel_type_property(&aconnector->base);
>> +
>>  		privacy_screen = drm_privacy_screen_get(adev_to_drm(adev)->dev, NULL);
>>  		if (!IS_ERR(privacy_screen)) {
>>  			drm_connector_attach_privacy_screen_provider(&aconnector->base,
>

-- 
Jani Nikula, Intel
