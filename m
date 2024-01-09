Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342E7827FCF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 08:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98CA10E363;
	Tue,  9 Jan 2024 07:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B4510E027;
 Tue,  9 Jan 2024 07:56:29 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e4d1e0e5eso5905475e9.3; 
 Mon, 08 Jan 2024 23:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704786988; x=1705391788; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vmcOkd1JGqghmKEIDJKd9dqQGbLpFZzoNOZWBAZnITI=;
 b=YIyy0j75EaiQdeVZ+Bb6+qFTcplFZIULwzxItOXe36opbtBARzD2nCu0M/UHj6Xmp2
 bNfGFk+C2w6MPotVdDkc+fGyuw2U1uTrUerLKeH0GaVC6J/o2F21ecZCPcABqBfrEyJV
 dG+0AbSc9lnSX7DUSgIcppcSOJBMI14WvBITrGOK5AXMqm6yHbMzJvCV9aaf7jwhgYqM
 iLD8hDuw3KEmXIhaDsstJ6Z7vvUOwJTIHFERutUqK/YwPJf6C31XTu9IDTgWvneyzcZL
 dx1Dm7tiHvTTvPcBxtVCWXnGd6bXvX6R9SXuCgsznwWlr1YbDJkA46rZZq3f6QuJcwfB
 Ws0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704786988; x=1705391788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vmcOkd1JGqghmKEIDJKd9dqQGbLpFZzoNOZWBAZnITI=;
 b=Y8eUUORaY8Sw2itg05zbLmY3bxjXici5SRpYcGd5W4jx3omou3zneA3HbBvihNHkWQ
 81jAI+vmWi1G6CvgwpeHeJFw4BmSEs1M8S5n8EWrvXRrNnVTNiTndUm5nZI+WGMyoGNw
 F+uXn9PkThBVO+X7kIYOoizr4GcpuTfSMj2Nxsj4/c29D98Y8Mbd7bDCXGzqb0IHUwSE
 PekWP+6oEGaQ6jmBAkD6/hW2cTTnepIPfg5kZYHD0+F5/WERhLSYbbvtfUwbAwu+r1JG
 XG1lTwn3v0r58Aoeax3Cx37/P3bw2OleffSiVqMSA8WE0aW1+wrCHUlDALXXJ/7M95Hl
 JmGA==
X-Gm-Message-State: AOJu0YwF+Lk7AuOtnbq9yZ3UcYITFCmkZE01/jgjX22nLWl6HBZN1xv1
 GxKwK5vCBHOMVoDDOLK9q7+xLLC2zy4=
X-Google-Smtp-Source: AGHT+IFHHdthAsKcF+HK5aBOIV5E4qlIJwyhFQZ5odVZRan5v9xYzM4g2/ssNjOZeGjqxNoQ0TO7Zg==
X-Received: by 2002:a05:600c:138f:b0:40e:3bba:8080 with SMTP id
 u15-20020a05600c138f00b0040e3bba8080mr2527246wmf.75.1704786988273; 
 Mon, 08 Jan 2024 23:56:28 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a05600c3b1900b0040d85a304desm10507107wms.35.2024.01.08.23.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 23:56:27 -0800 (PST)
Message-ID: <5b231151-45fe-4d65-a9c2-63973267bdba@gmail.com>
Date: Tue, 9 Jan 2024 08:56:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: add shared fdinfo stats
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20231207180225.439482-1-alexander.deucher@amd.com>
 <20231207180225.439482-3-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20231207180225.439482-3-alexander.deucher@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.12.23 um 19:02 schrieb Alex Deucher:
> Add shared stats.  Useful for seeing shared memory.
>
> v2: take dma-buf into account as well
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: Rob Clark <robdclark@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
>   3 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> index 5706b282a0c7..c7df7fa3459f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -97,6 +97,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   		   stats.requested_visible_vram/1024UL);
>   	drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
>   		   stats.requested_gtt/1024UL);
> +	drm_printf(p, "drm-shared-vram:\t%llu KiB\n", stats.vram_shared/1024UL);
> +	drm_printf(p, "drm-shared-gtt:\t%llu KiB\n", stats.gtt_shared/1024UL);
> +	drm_printf(p, "drm-shared-cpu:\t%llu KiB\n", stats.cpu_shared/1024UL);
> +
>   	for (hw_ip = 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
>   		if (!usage[hw_ip])
>   			continue;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index d79b4ca1ecfc..1b37d95475b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1287,25 +1287,36 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
>   			  struct amdgpu_mem_stats *stats)
>   {
>   	uint64_t size = amdgpu_bo_size(bo);
> +	struct drm_gem_object *obj;
>   	unsigned int domain;
> +	bool shared;
>   
>   	/* Abort if the BO doesn't currently have a backing store */
>   	if (!bo->tbo.resource)
>   		return;
>   
> +	obj = &bo->tbo.base;
> +	shared = (obj->handle_count > 1) || obj->dma_buf;

I still think that looking at handle_count is the completely wrong 
approach, we should really only look at obj->dma_buf.

Regards,
Christian.

> +
>   	domain = amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type);
>   	switch (domain) {
>   	case AMDGPU_GEM_DOMAIN_VRAM:
>   		stats->vram += size;
>   		if (amdgpu_bo_in_cpu_visible_vram(bo))
>   			stats->visible_vram += size;
> +		if (shared)
> +			stats->vram_shared += size;
>   		break;
>   	case AMDGPU_GEM_DOMAIN_GTT:
>   		stats->gtt += size;
> +		if (shared)
> +			stats->gtt_shared += size;
>   		break;
>   	case AMDGPU_GEM_DOMAIN_CPU:
>   	default:
>   		stats->cpu += size;
> +		if (shared)
> +			stats->cpu_shared += size;
>   		break;
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index d28e21baef16..0503af75dc26 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -138,12 +138,18 @@ struct amdgpu_bo_vm {
>   struct amdgpu_mem_stats {
>   	/* current VRAM usage, includes visible VRAM */
>   	uint64_t vram;
> +	/* current shared VRAM usage, includes visible VRAM */
> +	uint64_t vram_shared;
>   	/* current visible VRAM usage */
>   	uint64_t visible_vram;
>   	/* current GTT usage */
>   	uint64_t gtt;
> +	/* current shared GTT usage */
> +	uint64_t gtt_shared;
>   	/* current system memory usage */
>   	uint64_t cpu;
> +	/* current shared system memory usage */
> +	uint64_t cpu_shared;
>   	/* sum of evicted buffers, includes visible VRAM */
>   	uint64_t evicted_vram;
>   	/* sum of evicted buffers due to CPU access */

