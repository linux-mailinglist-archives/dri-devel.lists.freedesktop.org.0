Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81324A85020
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 01:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018C610E38E;
	Thu, 10 Apr 2025 23:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cgC2r4Ts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039F410E38E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=urtfd6+G+JoqkNaHVpmTLGU4iE52Gsr951WzebNXvHI=; b=cgC2r4Tskg+MA9tW/U1rFn2maX
 +jxhjV59AOLkqsEdIsuEUj4WKY19kNfO5myjWveGTPSSnZQ462w+5j5qJFAIGRNgfIs3cbDaRDxjS
 3kEbPm+C05d/30p35IcocDRsNtClHG4nrTEoQHc5ijHz/C2b6VAF7PWWs1P4+HdPE7gpt1fEveM3A
 NgwGXP+I4XFSgYbecL8irSL4NPwpaNWAznVAU+EfFfiuPAhFDFkfH5rCxwR8uSUNUmTbZWT9D1ZiJ
 pbsYhRoTUWxX+WeCPrPXV8RXu9Hcg7Ao1JIG5kHQIFH5kq4Donwmkm0n4ZZA3yYhxOq5A2OD6LY6O
 qn89tWcw==;
Received: from [189.7.87.174] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u31Lr-00Eu4V-TW; Fri, 11 Apr 2025 01:30:32 +0200
Message-ID: <9aa38dd3-6b6e-4b5e-b994-0771adce8376@igalia.com>
Date: Thu, 10 Apr 2025 20:30:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Fix Indirect Dispatch configuration for V3D
 7.1.6 and later
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250409205051.9639-1-mcanal@igalia.com>
 <8e277f667296ca5d95bed270ee981aee0e5c3086.camel@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <8e277f667296ca5d95bed270ee981aee0e5c3086.camel@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Iago,

On 10/04/25 03:02, Iago Toral wrote:
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Applied to misc/kernel.git (drm-misc-fixes).

Best Regards,
- Maíra

> 
> El mié, 09-04-2025 a las 17:50 -0300, Maíra Canal escribió:
>> This commit is a resubmission of commit 1fe1c66274fb ("drm/v3d: Fix
>> Indirect Dispatch configuration for V3D 7.1.6 and later"), which was
>> accidentally reverted by commit 91dae758bdb8 ("Merge tag
>> 'drm-misc-next-2024-08-01' of
>> https://gitlab.freedesktop.org/drm/misc/kernel
>> into drm-next"), likely due to an unfortunate conflict resolution.
>>
>>  From the original commit message:
>>
>> ```
>> `args->cfg[4]` is configured in Indirect Dispatch using the number of
>> batches. Currently, for all V3D tech versions, `args->cfg[4]` equals
>> the
>> number of batches subtracted by 1. But, for V3D 7.1.6 and later, we
>> must not
>> subtract 1 from the number of batches.
>>
>> Implement the fix by checking the V3D tech version and revision.
>>
>> Fixes several `dEQP-VK.synchronization*` CTS tests related to
>> Indirect Dispatch.
>> ```
>>
>> Fixes: 91dae758bdb8 ("Merge tag 'drm-misc-next-2024-08-01' of
>> https://gitlab.freedesktop.org/drm/misc/kernel into drm-next")
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_sched.c | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
>> b/drivers/gpu/drm/v3d/v3d_sched.c
>> index b3be08b0ca91..466d28ceee28 100644
>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>> @@ -428,7 +428,8 @@
>> v3d_rewrite_csd_job_wg_counts_from_indirect(struct v3d_cpu_job *job)
>>   	struct v3d_bo *bo = to_v3d_bo(job->base.bo[0]);
>>   	struct v3d_bo *indirect = to_v3d_bo(indirect_csd->indirect);
>>   	struct drm_v3d_submit_csd *args = &indirect_csd->job->args;
>> -	u32 *wg_counts;
>> +	struct v3d_dev *v3d = job->base.v3d;
>> +	u32 num_batches, *wg_counts;
>>   
>>   	v3d_get_bo_vaddr(bo);
>>   	v3d_get_bo_vaddr(indirect);
>> @@ -441,8 +442,17 @@
>> v3d_rewrite_csd_job_wg_counts_from_indirect(struct v3d_cpu_job *job)
>>   	args->cfg[0] = wg_counts[0] <<
>> V3D_CSD_CFG012_WG_COUNT_SHIFT;
>>   	args->cfg[1] = wg_counts[1] <<
>> V3D_CSD_CFG012_WG_COUNT_SHIFT;
>>   	args->cfg[2] = wg_counts[2] <<
>> V3D_CSD_CFG012_WG_COUNT_SHIFT;
>> -	args->cfg[4] = DIV_ROUND_UP(indirect_csd->wg_size, 16) *
>> -		       (wg_counts[0] * wg_counts[1] * wg_counts[2])
>> - 1;
>> +
>> +	num_batches = DIV_ROUND_UP(indirect_csd->wg_size, 16) *
>> +		      (wg_counts[0] * wg_counts[1] * wg_counts[2]);
>> +
>> +	/* V3D 7.1.6 and later don't subtract 1 from the number of
>> batches */
>> +	if (v3d->ver < 71 || (v3d->ver == 71 && v3d->rev < 6))
>> +		args->cfg[4] = num_batches - 1;
>> +	else
>> +		args->cfg[4] = num_batches;
>> +
>> +	WARN_ON(args->cfg[4] == ~0);
>>   
>>   	for (int i = 0; i < 3; i++) {
>>   		/* 0xffffffff indicates that the uniform rewrite is
>> not needed */
> 

