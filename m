Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKDvLpONrmnlFwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:06:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A6C235E1A
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A1910E13A;
	Mon,  9 Mar 2026 09:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PK0TTc8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302C210E13A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 09:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773047182; x=1804583182;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=cWU7SeTLuGya9n55pQuorj67sQeq9qvT4r5KBJQyEJw=;
 b=PK0TTc8iDRhmr6LbnPf2c92rN92xKBvetYsp2CbwBGManUzj5rKUHELk
 C9P7iwdMuZMfki0WBwnRxEAN1TP8HwlxxUAwRVPBw0bJ6Th4q6wpJ4AGJ
 EFeUmoaHBvpKPYCiAFMYaqlxVnI//vE6jA7EddKn/0HZku+zLKaEyioSd
 DMIy6JflcRZDidZMu0dIqCB6wcpXrzBILa4f/z55OBnFHqcu2fiproFpZ
 XXuwwqlkmPZkazlaM6YinmkHsUXc82ftsbqBQrbPWB94xiasvGohwYT38
 0cFMISAKBrJr7U1iPECzOrqTINfQ7U+g8is6EjyrR48xeaPnEz4xqlBoI A==;
X-CSE-ConnectionGUID: LlpfQqhLQXyRMuvVR44XYA==
X-CSE-MsgGUID: tBIcQ8OhSM6gpfMBcPYYNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73086628"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73086628"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:06:21 -0700
X-CSE-ConnectionGUID: 6ZN8QIvvStudmw9vM6Y9mA==
X-CSE-MsgGUID: PJar8lw5SLGXQ1fVXjYMqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="219668197"
Received: from unknown (HELO [10.102.88.20]) ([10.102.88.20])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:06:20 -0700
Message-ID: <c74c04c4-8654-40a2-9591-3ecd288c709b@linux.intel.com>
Date: Mon, 9 Mar 2026 10:06:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Remove boot params address setting via MMIO
 register
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 maciej.falkowski@linux.intel.com
References: <20260305142226.194995-1-andrzej.kacprowski@linux.intel.com>
 <fa4b9d1c-79bd-46c6-b5d9-b4ea60445f40@linux.intel.com>
Content-Language: en-US
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <fa4b9d1c-79bd-46c6-b5d9-b4ea60445f40@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 25A6C235E1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.kacprowski@linux.intel.com,m:oded.gabbay@gmail.com,m:jeff.hugo@oss.qualcomm.com,m:lizhi.hou@amd.com,m:maciej.falkowski@linux.intel.com,m:odedgabbay@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[karol.wachowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karol.wachowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,amd.com,linux.intel.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linux.intel.com:mid]
X-Rspamd-Action: no action

On 3/9/2026 9:35 AM, Karol Wachowski wrote:
> On 3/5/2026 3:22 PM, Andrzej Kacprowski wrote:
>> The NPU 60XX uses the default boot params location specified
>> in the firmware image header, consistent with earlier generations.
>> Remove the unnecessary MMIO register write, freeing the AON register
>> for future use.
>>
>> Fixes: 44e4c88951fa ("accel/ivpu: Implement warm boot flow for NPU6 and unify boot handling")
>> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>> ---
>>  drivers/accel/ivpu/ivpu_hw_40xx_reg.h | 6 ------
>>  drivers/accel/ivpu/ivpu_hw_ip.c       | 1 -
>>  2 files changed, 7 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_hw_40xx_reg.h b/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
>> index 421242acb184..fc0ee8d637f9 100644
>> --- a/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
>> +++ b/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
>> @@ -121,12 +121,6 @@
>>  #define VPU_50XX_HOST_SS_AON_PWR_ISLAND_STATUS_DLY			0x0003006cu
>>  #define VPU_50XX_HOST_SS_AON_PWR_ISLAND_STATUS_DLY_STATUS_DLY_MASK	GENMASK(7, 0)
>>  
>> -#define VPU_40XX_HOST_SS_AON_RETENTION0                                 0x0003000cu
>> -#define VPU_40XX_HOST_SS_AON_RETENTION1                                 0x00030010u
>> -#define VPU_40XX_HOST_SS_AON_RETENTION2                                 0x00030014u
>> -#define VPU_40XX_HOST_SS_AON_RETENTION3                                 0x00030018u
>> -#define VPU_40XX_HOST_SS_AON_RETENTION4                                 0x0003001cu
>> -
>>  #define VPU_40XX_HOST_SS_AON_IDLE_GEN					0x00030200u
>>  #define VPU_40XX_HOST_SS_AON_IDLE_GEN_EN_MASK				BIT_MASK(0)
>>  #define VPU_40XX_HOST_SS_AON_IDLE_GEN_HW_PG_EN_MASK			BIT_MASK(1)
>> diff --git a/drivers/accel/ivpu/ivpu_hw_ip.c b/drivers/accel/ivpu/ivpu_hw_ip.c
>> index 959984c54341..37f95a0551ed 100644
>> --- a/drivers/accel/ivpu/ivpu_hw_ip.c
>> +++ b/drivers/accel/ivpu/ivpu_hw_ip.c
>> @@ -931,7 +931,6 @@ static int soc_cpu_boot_40xx(struct ivpu_device *vdev)
>>  
>>  static int soc_cpu_boot_60xx(struct ivpu_device *vdev)
>>  {
>> -	REGV_WR64(VPU_40XX_HOST_SS_AON_RETENTION1, vdev->fw->mem_bp->vpu_addr);
>>  	soc_cpu_set_entry_point_40xx(vdev, vdev->fw->cold_boot_entry_point);
>>  
>>  	return 0;
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>

Pushed to drm-misc-next, thanks.
