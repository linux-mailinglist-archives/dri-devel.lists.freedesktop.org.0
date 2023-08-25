Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3EF788787
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D4210E671;
	Fri, 25 Aug 2023 12:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0070210E671;
 Fri, 25 Aug 2023 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vOs5GKJ5B84q1sV3Ldza955jM6flGL+drWT4vJX7cM4=; b=I3izleluO5uz1HCwLP7T18tv8N
 9n1toSviUoB2lbwKkTrfyM64u2xRfiOABqAPRuvvh6PA05L5U+JXXTy54RLVAeoxL8flRyYY2pocY
 DMUXLpPl6tdlC/ApV2feBzvDnGPXpsbFrOG1JOZZ4UJyE/b3iODU9du4iskd+3+gkJDkfPJYP3W84
 knfvKtPxh/eTZWN/l4qBetFmAociU955PeWIvPbG3KG7vG9rZeTHNDVW5YKPu3g6SOcmAeOEb/eDI
 kzVPtcZORma6aA7npXi96+QJRhCWmn6Q5yJHnjoiKsf2vc8DQbtn1ezvq3oIlvC0QfzAUpbEPbAd0
 +ajxqjqA==;
Received: from [187.35.42.59] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qZW15-00FHTT-TC; Fri, 25 Aug 2023 14:34:20 +0200
Message-ID: <44ddad4c-6c69-48f4-bf9f-86b4c04dbfbe@igalia.com>
Date: Fri, 25 Aug 2023 09:34:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: Merge debug module parameters
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20230824162505.173399-1-andrealmeid@igalia.com>
 <20230824162505.173399-2-andrealmeid@igalia.com>
 <32549529-6cc8-e187-9436-8b9d28e88b1d@amd.com>
 <5780676f-7f6b-4f82-a729-b011a493a861@igalia.com>
 <3fed67c9-7a4a-a6ae-5d73-5d391da53a57@gmail.com>
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <3fed67c9-7a4a-a6ae-5d73-5d391da53a57@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em 25/08/2023 09:29, Christian König escreveu:
> Am 25.08.23 um 14:24 schrieb André Almeida:
>> Em 25/08/2023 03:56, Christian König escreveu:
>> > Am 24.08.23 um 18:25 schrieb André Almeida:
>> >> Merge all developer debug options available as separated module
>> >> parameters in one, making it obvious that are for developers.
>> >>
>> >> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> >> ---
>> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 24 
>> ++++++++++++++++++++++++
>> >>   drivers/gpu/drm/amd/include/amd_shared.h |  9 +++++++++
>> >>   2 files changed, 33 insertions(+)
>> >>
>> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> >> index f5856b82605e..d53e4097acc0 100644
>> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> >> @@ -194,6 +194,7 @@ int amdgpu_use_xgmi_p2p = 1;
>> >>   int amdgpu_vcnfw_log;
>> >>   int amdgpu_sg_display = -1; /* auto */
>> >>   int amdgpu_user_partt_mode = AMDGPU_AUTO_COMPUTE_PARTITION_MODE;
>> >> +uint amdgpu_debug_mask;
>> >>   static void amdgpu_drv_delayed_reset_work_handler(struct work_struct
>> >> *work);
>> >> @@ -938,6 +939,9 @@ module_param_named(user_partt_mode,
>> >> amdgpu_user_partt_mode, uint, 0444);
>> >>   module_param(enforce_isolation, bool, 0444);
>> >>   MODULE_PARM_DESC(enforce_isolation, "enforce process isolation
>> >> between graphics and compute . enforce_isolation = on");
>> >> +MODULE_PARM_DESC(debug_mask, "debug options for amdgpu, disabled by
>> >> default");
>> >> +module_param_named(debug_mask, amdgpu_debug_mask, uint, 0444);
>> >> +
>> >>   /* These devices are not supported by amdgpu.
>> >>    * They are supported by the mach64, r128, radeon drivers
>> >>    */
>> >> @@ -2871,6 +2875,24 @@ static struct pci_driver 
>> amdgpu_kms_pci_driver = {
>> >>       .dev_groups = amdgpu_sysfs_groups,
>> >>   };
>> >> +static void amdgpu_init_debug_options(void)
>> >> +{
>> >> +    if (amdgpu_debug_mask & DEBUG_VERBOSE_EVICTIONS) {
>> >> +        pr_info("debug: eviction debug messages enabled\n");
>> >> +        debug_evictions = true;
>> >> +    }
>> >> +
>> >> +    if (amdgpu_debug_mask & DEBUG_VM) {
>> >> +        pr_info("debug: VM handling debug enabled\n");
>> >> +        amdgpu_vm_debug = true;
>> >> +    }
>> >> +
>> >> +    if (amdgpu_debug_mask & DEBUG_LARGEBAR) {
>> >> +        pr_info("debug: enabled simulating large-bar capability on
>> >> non-large bar system\n");
>> >> +        debug_largebar = true;
>> >
>> > How should that work???
>>
>> Ops, I thought it was a boolean. It should be
>>
>> +        debug_largebar = 1;
> 
> 
> That's not the problem, the question is since when do we have a 
> debug_largebar option and what should that one do?
> 

It should work exactly like the other one, but instead of using 
amdgpu.large_bar=1, one would use amdgpu.debug_mask=0x4 to activate it, 
as the plan is to merge all current debug options in a single one right?

> Regards,
> Christian.

