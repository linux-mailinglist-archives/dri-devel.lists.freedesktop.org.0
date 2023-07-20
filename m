Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30C075A3E4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 03:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DA010E04D;
	Thu, 20 Jul 2023 01:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3456810E04D;
 Thu, 20 Jul 2023 01:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=jQLdsxFbnAMC4nR/W72mTiYv9HLed0M1Guz4BtHqyEM=; b=SLI38fmp1U2UeQ3ks37hefukSB
 gg7QHAbenf8pqm3Pq2w3zIFRYAlu9DtkcGr9HKuex2rnRwX7Wj2Eettz0nm2rOBfJpVJn/Bm4Q+X1
 znLnBEck3msM/4PTxXGUHD5K7yMSzeLgM3vlFiR3x5xCjPBhUPzX0c/5PGPLBOClUk6nKdZ9+nQz8
 tGtFW85TVvsR70mQR0jvLlYJ5jUX6zVUrvmUQzeKKZTM7k2mKPMCGYoDyPLxaKx8Z2NthqN7+pMWx
 hwxlYczEpmveEE0eBub+er7N71Yac7R5UizmXtIJyeQN3kkJCt8UDh9tC8vvuqZ7c7S4KneGao7m1
 woukI0Mg==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qMIRP-009S7c-2b; Thu, 20 Jul 2023 01:26:51 +0000
Message-ID: <9d8254b2-2e68-2e4a-055a-5afdb04bd115@infradead.org>
Date: Wed, 19 Jul 2023 18:26:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] drm/amdgpu: Fix one kernel-doc comment
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, alexander.deucher@amd.com
References: <20230720010514.54342-1-yang.lee@linux.alibaba.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230720010514.54342-1-yang.lee@linux.alibaba.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/19/23 18:05, Yang Li wrote:
> Use colon to separate parameter name from their specific meaning.
> silence the warning:
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c:793: warning: Function parameter or member 'adev' not described in 'amdgpu_vm_pte_update_noretry_flags'
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> index 83e1923f6775..96d601e209b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -783,7 +783,7 @@ int amdgpu_vm_pde_update(struct amdgpu_vm_update_params *params,
>  /**
>   * amdgpu_vm_pte_update_noretry_flags - Update PTE no-retry flags
>   *
> - * @adev - amdgpu_device pointer
> + * @adev: amdgpu_device pointer
>   * @flags: pointer to PTE flags
>   *
>   * Update PTE no-retry flags when TF is enabled.

-- 
~Randy
