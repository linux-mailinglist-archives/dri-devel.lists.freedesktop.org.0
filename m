Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F24AA5B079F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 16:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C9110E78C;
	Wed,  7 Sep 2022 14:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3853110E798;
 Wed,  7 Sep 2022 14:55:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28FC6106F;
 Wed,  7 Sep 2022 07:55:06 -0700 (PDT)
Received: from [10.57.15.197] (unknown [10.57.15.197])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5A7E3F71A;
 Wed,  7 Sep 2022 07:54:58 -0700 (PDT)
Message-ID: <9656a09c-09e9-0c9b-ede6-1d3ddc905e08@arm.com>
Date: Wed, 7 Sep 2022 15:54:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] drm/amdgpu: fix repeated words in comments
Content-Language: en-GB
To: Jilin Yuan <yuanjilin@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch,
 shaoyun.liu@amd.com
References: <20220907113400.30590-1-yuanjilin@cdjrlc.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220907113400.30590-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-09-07 12:34, Jilin Yuan wrote:
> Delete the redundant word 'and'.
> Delete the redundant word 'in'.
> Delete the redundant word 'the'.
> Delete the redundant word 'are'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index afaa1056e039..71367b9dd590 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -958,7 +958,7 @@ static void amdgpu_device_vram_scratch_fini(struct amdgpu_device *adev)
>    * @registers: pointer to the register array
>    * @array_size: size of the register array
>    *
> - * Programs an array or registers with and and or masks.

Not redundant - the first "and" refers to the boolean operation, the 
second is a conjunction. This is clear from the code if you look at it. 
You could perhaps restyle the comment as "with AND and OR masks" to make 
that stand out a bit better, but either way, please try to actually 
understand the changes you're proposing.

Robin.

> + * Programs an array or registers with and or masks.
>    * This is a helper for setting golden registers.
>    */
>   void amdgpu_device_program_register_sequence(struct amdgpu_device *adev,
> @@ -1569,7 +1569,7 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
>    * @state: vga_switcheroo state
>    *
>    * Callback for the switcheroo driver.  Suspends or resumes the
> - * the asics before or after it is powered up using ACPI methods.
> + * asics before or after it is powered up using ACPI methods.
>    */
>   static void amdgpu_switcheroo_set_state(struct pci_dev *pdev,
>   					enum vga_switcheroo_state state)
> @@ -3203,7 +3203,7 @@ static int amdgpu_device_ip_resume_phase2(struct amdgpu_device *adev)
>    *
>    * Main resume function for hardware IPs.  The hardware IPs
>    * are split into two resume functions because they are
> - * are also used in in recovering from a GPU reset and some additional
> + * also used in recovering from a GPU reset and some additional
>    * steps need to be take between them.  In this case (S3/S4) they are
>    * run sequentially.
>    * Returns 0 on success, negative error code on failure.
