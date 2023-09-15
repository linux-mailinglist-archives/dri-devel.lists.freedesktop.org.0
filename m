Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 448DC7A2217
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 17:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9ACA10E63E;
	Fri, 15 Sep 2023 15:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B536E10E63E;
 Fri, 15 Sep 2023 15:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694790854; x=1726326854;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vk2Bi0+4astxw6y3MMSSHQ1DdZqNr7Yyfg6oxwVJFw0=;
 b=RnlxZaj21HT7v0F95usCq1iZkNsjXFYwB5LyDhSx/5kLPmGAjknlZza/
 LWVr47VkEPm9knEDtFZ2mn20NdY0cl3nv8uVZ2IUlJpDF4sXZ22b4vdko
 y6PmbrlIvSNc+PdnbT2PgHYJGlRKG6GihtvYP9rukwiLHGHRroqo7uHnd
 gXZKVnezUUyn/25QeS2LM405wMPI2v2PBvRU1S+dRk8rL7hNfGye2MeEN
 VDPIi8nbDkQR/ndUQCwC4W24yk1lbd/FxLeuEG+bVUPhiIeUefS+68rPF
 LlaaIyBJSwEprd0jKjRpzdRxVcY1NnLaL9q75UA+XKSCwZW35SuKUMHrE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="410209799"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="410209799"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 08:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="868741923"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="868741923"
Received: from azafrani-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.177])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 08:14:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/amd/display: Remove unwanted drm edid references
In-Reply-To: <39a7f19a-e6b6-4962-b7e0-4f33cb78938c@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230905171354.2657889-1-alex.hung@amd.com>
 <39a7f19a-e6b6-4962-b7e0-4f33cb78938c@amd.com>
Date: Fri, 15 Sep 2023 18:14:02 +0300
Message-ID: <87led7v58l.fsf@intel.com>
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
Cc: stylon.wang@amd.com, haoping.liu@amd.com, srinivasan.shanmugam@amd.com,
 sunpeng.li@amd.com, Qingqing.Zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, daniel.wheeler@amd.com, aurabindo.pillai@amd.com,
 hersenxs.wu@amd.com, hamza.mahfooz@amd.com, wayne.lin@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Sep 2023, Harry Wentland <harry.wentland@amd.com> wrote:
> On 2023-09-05 13:13, Alex Hung wrote:
>> [WHY]
>> edid_override and drm_edid_override_connector_update, according to drm
>> documentation, should not be referred outside drm_edid.
>> 
>> [HOW]
>> Remove and replace them accordingly.
>> 
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++-----------------
>>  1 file changed, 2 insertions(+), 21 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 1bb1a394f55f..f6a255773242 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6372,15 +6372,12 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>>  static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>>  {
>>  	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
>> +	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
>>  	struct dc_link *dc_link = aconnector->dc_link;
>>  	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
>>  	struct edid *edid;
>>  
>> -	if (!connector->edid_override)
>> -		return;
>> -
>> -	drm_edid_override_connector_update(&aconnector->base);
>> -	edid = aconnector->base.edid_blob_ptr->data;
>> +	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
>
> Looks like we only call this in the case where a connector is forced, so
> drm_get_edid will never try to read the edid from the ddc but always gives
> us the override_edid. Please spell that out in the commit description so
> anyone else looking at the patch doesn't have to trace it themselves.

Connector forcing is only about forcing the connector status. The probe
helper will call ->force instead of ->detect.

But this has nothing to do with override_edid. That's completely
orthogonal.

Here, you can call drm_get_edid() if you like. Connector forcing just
bypasses the DDC probe for determining connector status. If connector is
forced off, you won't get the EDID, regardless of override/firmware
EDID, but if it's forced on, the EDID read proceeds.

And the EDID read has the priority order 1) override EDID if set via
edid_override debugfs, 2) firmware EDID if set via edid_firmware module
parameter, and 3) regular DDC read.

BR,
Jani.

>
>>  	aconnector->edid = edid;
>>  
>>  	/* Update emulated (virtual) sink's EDID */
>> @@ -6421,22 +6418,6 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>>  	};
>>  	struct edid *edid;
>>  
>> -	if (!aconnector->base.edid_blob_ptr) {
>
> Can edid_blob_ptr never be NULL?
>
> Harry
>
>> -		/* if connector->edid_override valid, pass
>> -		 * it to edid_override to edid_blob_ptr
>> -		 */
>> -
>> -		drm_edid_override_connector_update(&aconnector->base);
>> -
>> -		if (!aconnector->base.edid_blob_ptr) {
>> -			DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",
>> -					aconnector->base.name);
>> -
>> -			aconnector->base.force = DRM_FORCE_OFF;
>> -			return;
>> -		}
>> -	}
>> -
>>  	edid = (struct edid *) aconnector->base.edid_blob_ptr->data;
>>  
>>  	aconnector->edid = edid;
>

-- 
Jani Nikula, Intel
