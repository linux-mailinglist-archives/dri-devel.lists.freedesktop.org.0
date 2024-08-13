Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A4950884
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 17:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1289710E379;
	Tue, 13 Aug 2024 15:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="1BagDpT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC7410E378
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 15:07:50 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-428243f928fso55829585e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1723561668; x=1724166468;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KfwxZlVCz6QYsfcVu3qZxUKwtqH+VQCZhlHT6+F+PJw=;
 b=1BagDpT34PcGt1f00iFGtC0cTpoEOdmH369coI413Vw7MctfP7qA7D2UewFzGJEhYT
 a7+5w7brvM2lKOw2GiJmVY1vR5urBw0dlt8ngYdvgKlV6rMXsUcvBjAiI9XWiU5qNxMF
 fBisOhh2iSOtP2pl5D/nUsU1+lKTVc0Lm8oRMGUBMNxWVC5SRoNKVJXsYWiC50IbSskA
 Agf9L/2Ke/22cuw98SslfPU469KIbtveIbk5MHrRRblAVP61wbiRa2WaMAGUiYLgstEe
 okWmvCukzbna2X7lVogLumNRAs0XHRYvBXHq9RmWnvb1K67DMVaTFQ9j/H/Lh8LnP8BZ
 avxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723561668; x=1724166468;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KfwxZlVCz6QYsfcVu3qZxUKwtqH+VQCZhlHT6+F+PJw=;
 b=rjbDWgqRpY/UbV8ea8zGz9/tKzHisnFFFKjCen85vUDX2ZbzKOz+ImEjmt/tN6YMST
 CYfxpRlK3x08HDx6a83ZyuAKoDGf6bFzLs7MXn7WfJZF2TrcDL/CMGFt34Gi98eAT0Nu
 +Ql4nMIoD03KPcQHubcFDV49ZYyPObJyThiYnzvBsedn2gky2GPDSZDLLk/aES+Fl/lG
 NSKPg2hN8s+VaZpo9sVDHQxVCrBD/07YEUmvn5V9x4f9cvUsES9HMZKjr63KONDKcAGG
 PzufWx1/i2oQ5yrVLoW7oDUExsH7pi9BRp4BeL43izILPjOckYfGpoTS436Cwy33rVEw
 58Hg==
X-Gm-Message-State: AOJu0YyQ6OuAQaqLF6b3Z3hX9nWosyeGRTB4RronW+Azljowii/6lQ9R
 YERQ43H9XpeLn8kqRgBoS9jVDDDyQ5t11tGAU8nsKG1hyEWZjHGvNoKKglTXQRt+6NeYgwF7Tgh
 e
X-Google-Smtp-Source: AGHT+IEW0BqCKAPoEPJ7S6zCfsWY7yBFEXS+u/xQqnOj1gnjZo4eXyuM6QYDppLtygUNz6HlP2FF7g==
X-Received: by 2002:a05:600c:198b:b0:426:62c5:4731 with SMTP id
 5b1f17b1804b1-429d486efafmr39106835e9.29.1723561668289; 
 Tue, 13 Aug 2024 08:07:48 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4f0a6610sm10632960f8f.113.2024.08.13.08.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 08:07:47 -0700 (PDT)
Message-ID: <7ff1a613-98b2-4587-a55b-c433e22df5bc@ursulin.net>
Date: Tue, 13 Aug 2024 16:07:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/amdgpu: Re-validate evicted buffers v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 friedrich.vock@gmx.de
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20240604160503.43359-1-christian.koenig@amd.com>
 <20240604160503.43359-7-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240604160503.43359-7-christian.koenig@amd.com>
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


I was waiting for some replies elsewhere on this thread. Anwyay.. for 
the below, because I don't understand how come an important fix like 
this is not garnering more attention:

On 04/06/2024 17:05, Christian König wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Since you pretty much changed my logic you could also "demote" me to 
Reported-by:. In which case I could theoretically even provide an r-b. :)

> 
> Currently the driver appears to be thinking that it will be attempting to
> re-validate the evicted buffers on the next submission if they are not in
> their preferred placement.
> 
> That however appears not to be true for the very common case of buffers
> with allowed placements of VRAM+GTT. Simply because the check can only
> detect if the current placement is *none* of the preferred ones, happily
> leaving VRAM+GTT buffers in the GTT placement "forever".
> 
> Fix it by extending the VRAM+GTT special case to the re-validation logic.
> 
> v2: re-work the criteria to consider if something is in it's preferred
> placement or not and also disable the handling on APUs.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 4e2391c83d7c..1a470dafa93d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1242,15 +1242,15 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
>   			return r;
>   	}
>   
> -	/* If the BO is not in its preferred location add it back to
> -	 * the evicted list so that it gets validated again on the
> -	 * next command submission.
> -	 */
>   	if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
> -		uint32_t mem_type = bo->tbo.resource->mem_type;
> -
> -		if (!(bo->preferred_domains &
> -		      amdgpu_mem_type_to_domain(mem_type)))
> +		/*
> +		 * If the preferred location is VRAM but we placed it into GTT
> +		 * add it back to the evicted list so that it gets validated
> +		 * again on the next command submission.
> +		 */
> +		if (!(adev->flags & AMD_IS_APU) &&
> +		    bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM &&
> +		    bo->tbo.resource->mem_type != TTM_PL_VRAM)

I think this logic works to fix discrete and APU apart that I don't like 
the special casing things so much. Which is perhaps a consequence of too 
many dynamic games with placements. :(

That said, my version also had a little bit of special casing so perhaps 
the battle for clean design has been lost.

So ack from me for this version. Not sure it is good to merge it though 
without also fixing the migration throttling and that is a more 
difficult one (the part where I was awaiting a reply).

Regards,

Tvrtko

>   			amdgpu_vm_bo_evicted(&bo_va->base);
>   		else
>   			amdgpu_vm_bo_idle(&bo_va->base);
