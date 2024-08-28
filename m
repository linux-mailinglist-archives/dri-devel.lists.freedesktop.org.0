Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DBB9628E0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A394210E536;
	Wed, 28 Aug 2024 13:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1ZLDgUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9445C10E535;
 Wed, 28 Aug 2024 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724852442; x=1756388442;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=F2gbc6cimSYl3RObycIzZ9pKaOf5+xDaMzVVQGK+vAA=;
 b=Y1ZLDgUDavEWIuS8RbKDFelyK0Yc+/BXNKA9qG2KtycqHQJdf9ui4h2i
 bnh68AAtH28QGjahK6+9Xm62pV+ENziLb2hYBOvE92j9E77Nr/Fqizqqs
 ysrzWUU1NlSJTqvGljq3n75TOJ5IIQyA6me7mmmKJvFvdEkxb6yf0vBWT
 jIHm44Ub2hpNnfypNS/0A1stxEVMQ+6Kd01TQmTxTluLkSBW7HSCkL5dc
 aYOqySC97ZLDpRTpOopy+EyvX6o2VCoN256U5F8qapxg0l6hXJO/hKUiJ
 kBovnlf0HtIKG0BPuD2qXr5nNNyUv+7XfvzKDrExcf5abZ2pZuX79PcSF Q==;
X-CSE-ConnectionGUID: +SAgvRonQuCTtyNnth6zUQ==
X-CSE-MsgGUID: DUi706K5R+CeHGR4QFLdgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23340469"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="23340469"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 06:40:41 -0700
X-CSE-ConnectionGUID: y3WGcdZLSAeIFV0S8XaGoQ==
X-CSE-MsgGUID: ltOoSpggSH2vvP9I7Xp0FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="68117697"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 06:40:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [RESEND 3/3] drm/amd/display: switch to guid_gen() to generate
 valid GUIDs
In-Reply-To: <Zs8kJOC2pH7gSfET@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240812122312.1567046-1-jani.nikula@intel.com>
 <20240812122312.1567046-3-jani.nikula@intel.com>
 <Zs8kJOC2pH7gSfET@phenom.ffwll.local>
Date: Wed, 28 Aug 2024 16:40:33 +0300
Message-ID: <87plpsydda.fsf@intel.com>
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

On Wed, 28 Aug 2024, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Mon, Aug 12, 2024 at 03:23:12PM +0300, Jani Nikula wrote:
>> Instead of just smashing jiffies into a GUID, use guid_gen() to generate
>> RFC 4122 compliant GUIDs.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> Side note, it baffles me why amdgpu has a copy of this instead of
>> plumbing it into drm mst code.
>
> Yeah ec5fa9fcdeca ("drm/amd/display: Adjust the MST resume flow") promised
> a follow-up, but that seems to have never materialized. Really should
> materialize though. Patch lgtm
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks!

Cc: AMD folks, ack for merging the series via drm-misc-next?

BR,
Jani.


>
>
>> ---
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++++---------
>>  1 file changed, 12 insertions(+), 11 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 72c10fc2c890..ce05e7e2a383 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -2568,9 +2568,9 @@ static int dm_late_init(void *handle)
>>  
>>  static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
>>  {
>> +	u8 buf[UUID_SIZE];
>> +	guid_t guid;
>>  	int ret;
>> -	u8 guid[16];
>> -	u64 tmp64;
>>  
>>  	mutex_lock(&mgr->lock);
>>  	if (!mgr->mst_primary)
>> @@ -2591,26 +2591,27 @@ static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
>>  	}
>>  
>>  	/* Some hubs forget their guids after they resume */
>> -	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, guid, 16);
>> -	if (ret != 16) {
>> +	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, buf, sizeof(buf));
>> +	if (ret != sizeof(buf)) {
>>  		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
>>  		goto out_fail;
>>  	}
>>  
>> -	if (memchr_inv(guid, 0, 16) == NULL) {
>> -		tmp64 = get_jiffies_64();
>> -		memcpy(&guid[0], &tmp64, sizeof(u64));
>> -		memcpy(&guid[8], &tmp64, sizeof(u64));
>> +	import_guid(&guid, buf);
>>  
>> -		ret = drm_dp_dpcd_write(mgr->aux, DP_GUID, guid, 16);
>> +	if (guid_is_null(&guid)) {
>> +		guid_gen(&guid);
>> +		export_guid(buf, &guid);
>>  
>> -		if (ret != 16) {
>> +		ret = drm_dp_dpcd_write(mgr->aux, DP_GUID, buf, sizeof(buf));
>> +
>> +		if (ret != sizeof(buf)) {
>>  			drm_dbg_kms(mgr->dev, "check mstb guid failed - undocked during suspend?\n");
>>  			goto out_fail;
>>  		}
>>  	}
>>  
>> -	import_guid(&mgr->mst_primary->guid, guid);
>> +	guid_copy(&mgr->mst_primary->guid, &guid);
>>  
>>  out_fail:
>>  	mutex_unlock(&mgr->lock);
>> -- 
>> 2.39.2
>> 

-- 
Jani Nikula, Intel
