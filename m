Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B11340C78
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 19:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2EA6E944;
	Thu, 18 Mar 2021 18:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940016E944;
 Thu, 18 Mar 2021 18:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=zX1IM6Mo/u7NFFyAIwCKTg2FQIUSClNMoYOG1y8Qo+0=; b=EwHVt3F8eQwDFnKZyEalMT0q8M
 eknpJGf4LBR+KYGWYez0Rx44G2HruGo/5YqVGxh/7mecSQFSBOZyQ6zjS2ANfTlwII8XaAc38r9Kg
 4GRa9QE6Y8MWNW7gMxPc8pOSBDRYjcDQQS42QcZvT39warCj43euQEJ/9h8UwBz80rZ0FesnrhOhL
 1OsEpcunw/PiLkJrAnBTYDBxyY90WqhgITWNbeHakcm9V8Evyl8AZrZC8S7cn2vxHuNQrYxyV9eFV
 PI8RT05ewtNflREX35nrhHQPHGhQHlWS9+pjLjOV5mtSC7eM3SDxd6vGE8WVCImfFkpYKld/tN11r
 4YL816bg==;
Received: from [2601:1c0:6280:3f0::9757]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMx3f-003KMP-9B; Thu, 18 Mar 2021 18:07:49 +0000
Subject: Re: [PATCH] drm/amdgpu: Fix a typo
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 Hawking.Zhang@amd.com, John.Clements@amd.com, guchun.chen@amd.com,
 tao.zhou1@amd.com, Likun.Gao@amd.com, Bhawanpreet.Lakha@amd.com,
 Jiansong.Chen@amd.com, ray.huang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210318113308.1345-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b09b524c-1f3d-6231-29b9-f0eac3e77293@infradead.org>
Date: Thu, 18 Mar 2021 11:07:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318113308.1345-1-unixbhaskar@gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/18/21 4:33 AM, Bhaskar Chowdhury wrote:
> 
> s/traing/training/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> index c325d6f53a71..db18e4f6cf5f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> @@ -661,7 +661,7 @@ static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)
> 
>  	if (ops & PSP_MEM_TRAIN_SEND_LONG_MSG) {
>  		/*
> -		 * Long traing will encroach certain mount of bottom VRAM,
> +		 * Long training will encroach certain mount of bottom VRAM,

		                                       amount
I think.

>  		 * saving the content of this bottom VRAM to system memory
>  		 * before training, and restoring it after training to avoid
>  		 * VRAM corruption.
> --
> 2.26.2
> 


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
