Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477FEC72FBB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 09:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D31210E714;
	Thu, 20 Nov 2025 08:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sa1Ri4Wp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018B010E714;
 Thu, 20 Nov 2025 08:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763628978; x=1795164978;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=oA1afS3am/WuNGiiKhM/r0CEwMJg6MoRFU2jp7PZlpg=;
 b=Sa1Ri4WpnF82nOO8IaYDudMqxLlsfxMWNTAkfeR+wsQamzu+xN/WjYln
 7QsJbmA6IHWdogMbmIod/LUNVrsHfStzGizap94VhzXfeyEWQvnQ6wnZl
 /4tiru2NaWkfFtDe3mSKuV3W7CJy4xDWj0ffDALYkNc5XeELYEoBW9Rp1
 vV4xtv3bnLulZK0INm+PIJOUQoNsFeIVppW2Inv7urTcr+ETqVeoPAQXM
 T1QwnjrLCkX6PMwfP6PfmCVUYTPVdKbkWIxvmjUm1PcbOId3+JXDM7tZn
 1xAdORXJwWnvQkA5Dzh8yy4+jq9F4j4YVFD3YdrcFsVeK3xQbnJykh2Cu w==;
X-CSE-ConnectionGUID: 3kuDb2BNTsu2plx3i+YUgQ==
X-CSE-MsgGUID: bgkWGZAyT0Sz7XEPWlrDsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68297209"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="68297209"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 00:56:18 -0800
X-CSE-ConnectionGUID: 5rClW/dKT2WQKwoo5gG5Pw==
X-CSE-MsgGUID: MFTTOXYkQZyr2UUR9pGJ9w==
X-ExtLoop1: 1
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 00:56:15 -0800
Date: Thu, 20 Nov 2025 09:56:13 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [REGRESSION][RFC] memleak on xe load & unload on PTL
In-Reply-To: <qalol3lam5khiijztfdysgl7qj3fhgwizyclkld6hae6bqazz5@6xqir2p45nkt>
Message-ID: <0f5ba970-24cf-bf2c-59c1-cfc77804881a@intel.com>
References: <c1245e1a-2856-83e6-69ed-1ddead4ad3d0@intel.com>
 <qalol3lam5khiijztfdysgl7qj3fhgwizyclkld6hae6bqazz5@6xqir2p45nkt>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2030057926-1763579828=:270825"
Content-ID: <dbab0f61-25ca-9180-ce5e-c3025867452c@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2030057926-1763579828=:270825
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <bf4241a6-9ede-c45e-c339-6eb2681b5243@intel.com>

On Wed, 19 Nov 2025, Lucas De Marchi wrote:
> On Tue, Nov 18, 2025 at 01:35:53PM +0100, Micha³ Grzelak wrote:
>> Hi,
>> 
>> just hit memory leak on xe module load & unload:
>> 
>> unreferenced object 0xffff88811b047d10 (size 16):
>>  comm "modprobe", pid 1058, jiffies 4297578480
>>  hex dump (first 16 bytes):
>>    00 6b 4b 2d 81 88 ff ff 80 7e 4b 2d 81 88 ff ff  .kK-.....~K-....
>>  backtrace (crc 4f169eaf):
>>    kmemleak_alloc+0x4a/0x90
>>    __kmalloc_cache_noprof+0x488/0x800
>>    drm_buddy_init+0xc2/0x330 [drm_buddy]
>>    __xe_ttm_vram_mgr_init+0xc3/0x190 [xe]
>>    xe_ttm_stolen_mgr_init+0xf5/0x9d0 [xe]
>>    xe_device_probe+0x326/0x9e0 [xe]
>>    xe_pci_probe+0x39a/0x610 [xe]
>>    local_pci_probe+0x47/0xb0
>>    pci_device_probe+0xf3/0x260
>>    really_probe+0xf1/0x3c0
>>    __driver_probe_device+0x8c/0x180
>>    driver_probe_device+0x24/0xd0
>>    __driver_attach+0x10f/0x220
>>    bus_for_each_dev+0x7f/0xe0
>>    driver_attach+0x1e/0x30
>>    bus_add_driver+0x151/0x290
>> 
>> Issue was reproduced on PTL & BMG, booted with latest kernel from
>> drm-tip. Looks like fault was introduced in commit d4cd665c9
>> ("drm/buddy: Separate clear and dirty free block trees"), since reverting 
>> it
>> makes the leak disappear. Also attached RFC patch, which at first
>> glance could fix the issue.
>> 
>> Added xe maintainers and the author to Cc.
>
> the backtrace above and the commit message below could be merged
> together
>
>> From 914aa53c18a88834310b8560323b63bae98fb29d Mon Sep 17 00:00:00 2001
>> From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
>> Date: Tue, 18 Nov 2025 11:34:11 +0100
>> Subject: [PATCH] drm/buddy: release free_trees array on buddy mm teardown
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=UTF-8
>> Content-Transfer-Encoding: 8bit
>> Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 
>> 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
>> 
>> During initialization of DRM buddy memory manager at drm_buddy_init,
>> mm->free_trees array is allocated for both clear and dirty RB trees.
>> During cleanup happening at drm_buddy_fini it is never freed, leading to
>> memory leaks observed on xe module load & unload cycles.
>> 
>> Deallocate array for free trees when cleaning up buddy memory manager.
>> 
>> Fixes: d4cd665c ("drm/buddy: Separate clear and dirty free block trees")
>> Signed-off-by: Micha³ Grzelak <michal.grzelak@intel.com>
>> ---
>> drivers/gpu/drm/drm_buddy.c | 1 +
>> 1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 2f279b46bd2c..8308116058cc 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -420,6 +420,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>
>> 	for_each_free_tree(i)
>> 		kfree(mm->free_trees[i]);
>> +	kfree(mm->free_trees);
>
> looks correct to me and also matches the out_free_tree label in
> drm_buddy_init()
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thank you Lucas for your review. I will update the commit message with
your R-B applied when resending the patch.

BR,
Micha³
--8323329-2030057926-1763579828=:270825--
