Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DABA9629B1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 16:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7915510E537;
	Wed, 28 Aug 2024 14:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+F8NMNv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD70710E52F;
 Wed, 28 Aug 2024 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724853974; x=1756389974;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IyvuXA/L1erUpNvG4oHV31Z4NUga96Wa1+OQOlp1QLU=;
 b=h+F8NMNvvUjhc+1C22dnTvAFAm5FmHUBmYSYY6V1JBVf0NzpRxw5AjIM
 EvaqtLVc5/pXx/T+fXoSr0CTc/vU/zIRkorj5g2N3erjD/BEMB33+WHhj
 MueJ0R0P0Izqdar8B5WXjUTM92je7Qy+VyD8sR6IK1RQ4OR3FjuYUHqVp
 cTvNm/CdZJ+Xtnp3BScZNUeYkn5N69OM+U43Bb55F5AGaFQtMXg3G1Kwk
 iMnNoLSFn51rX8VxXL7vqcdqBZdUskiCWFj5j2iRQDFFWsEbOmpcMaZwp
 K+nWWGK4OSW4rOel08NXyyV7mLqBtmEDTiWatr1cQmhXpXnnTXen9mpiD Q==;
X-CSE-ConnectionGUID: A4UVMGmrTdqonCgA+NLk0A==
X-CSE-MsgGUID: 1Nme9uhXTQ6QT0qCKAAmgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23269504"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="23269504"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:06:14 -0700
X-CSE-ConnectionGUID: SUIPUFEBT9OXKoTSSxE9qw==
X-CSE-MsgGUID: yeiV1P52TxWqpw4J4FFSWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="68084446"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:06:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [RESEND 3/3] drm/amd/display: switch to guid_gen() to generate
 valid GUIDs
In-Reply-To: <dac8f408-6f13-4ee7-a54c-342d51ba88d1@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240812122312.1567046-1-jani.nikula@intel.com>
 <20240812122312.1567046-3-jani.nikula@intel.com>
 <dac8f408-6f13-4ee7-a54c-342d51ba88d1@amd.com>
Date: Wed, 28 Aug 2024 17:06:06 +0300
Message-ID: <87mskwyc6p.fsf@intel.com>
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

On Wed, 28 Aug 2024, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> On 8/12/24 08:23, Jani Nikula wrote:
>> Instead of just smashing jiffies into a GUID, use guid_gen() to generate
>> RFC 4122 compliant GUIDs.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>
> Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>
> I would prefer to take this series through the amdgpu tree though,
> assuming nobody minds.

How long is it going to take for that to get synced back to
drm-misc-next though?

BR,
Jani.


>
>> 
>> Side note, it baffles me why amdgpu has a copy of this instead of
>> plumbing it into drm mst code.
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++++---------
>>   1 file changed, 12 insertions(+), 11 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 72c10fc2c890..ce05e7e2a383 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -2568,9 +2568,9 @@ static int dm_late_init(void *handle)
>>   
>>   static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
>>   {
>> +	u8 buf[UUID_SIZE];
>> +	guid_t guid;
>>   	int ret;
>> -	u8 guid[16];
>> -	u64 tmp64;
>>   
>>   	mutex_lock(&mgr->lock);
>>   	if (!mgr->mst_primary)
>> @@ -2591,26 +2591,27 @@ static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
>>   	}
>>   
>>   	/* Some hubs forget their guids after they resume */
>> -	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, guid, 16);
>> -	if (ret != 16) {
>> +	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, buf, sizeof(buf));
>> +	if (ret != sizeof(buf)) {
>>   		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
>>   		goto out_fail;
>>   	}
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
>>   			drm_dbg_kms(mgr->dev, "check mstb guid failed - undocked during suspend?\n");
>>   			goto out_fail;
>>   		}
>>   	}
>>   
>> -	import_guid(&mgr->mst_primary->guid, guid);
>> +	guid_copy(&mgr->mst_primary->guid, &guid);
>>   
>>   out_fail:
>>   	mutex_unlock(&mgr->lock);

-- 
Jani Nikula, Intel
