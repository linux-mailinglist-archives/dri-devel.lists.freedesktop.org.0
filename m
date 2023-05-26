Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B01F7120C2
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 09:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9B210E0EF;
	Fri, 26 May 2023 07:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9091710E7A5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:18:00 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f6d3f83d0cso4511815e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 00:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685085477; x=1687677477;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ccYNkSB9yXNFc0pNcevL4BywfT3cjPwDcQMS5hYjY5A=;
 b=upk6XEp7pKdAdaE6HpwR/flUdXcgSnj7QESN26X5BQS21Ly7Tn2Kg6FF1+xUSO0DIg
 rnR6531U8ajhEcFTYhM5f3+bMqEj1vnygeCGpwJ++u8Zc1PBnixfyCACy2bSGhKQfuKX
 hv+7nhfex5xD9fOYnlV1YnyxizfBhcVaLB7/xtuNWR7+8baORFbvCZGenLg2+LzDRsm+
 zgXNe4qhCOpXSjmvvceSp2wsv6vdBEdCojgDcTkAAYSiE/iDaHbRVNJN2BaoSRxfW1TT
 ipP8Z+7wOKRzxYdwhUgkmuE8WsXZUe8MX3SvCnFQo143yaB7hGIOmJbDvNrtu1v27s6I
 Os+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685085477; x=1687677477;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ccYNkSB9yXNFc0pNcevL4BywfT3cjPwDcQMS5hYjY5A=;
 b=HabVwbDcW4sOTjOcb0wtT7/jb8mxpOKqSS7xJIK6C0Luv7kz4uxKMYKNi7c3IXK8zF
 vFh9ybBqJ82COcDDuoCH6hHaxYpUxSNqKK/usL5kLMiedgsv9kUvCKETmCUSMJx/njrs
 zWoWPAnGQ2MplOw826D2MpEsplfb03C5B0/onEUs9r1LrcUYPtZfehKcbDVOdE59eOz1
 Gpr96QXooK3WDvTfIzFCkg9PIRRgDxuNPThBHIIM18BhhTI+3fOU9sDKKmc2u0H+WBoy
 ZIeJqkOb4Q4vUhnPCX5cdVLTVPcbOG1qdx+IBE1f0gKe+qvpXSKDqLMp1BVuVFPf8SIw
 d3Jg==
X-Gm-Message-State: AC+VfDxrZLe1FA/8fA72lHALd6dnZ01idyLoygxa39HbLAeNndafbjwc
 OMaWy/cP0poK2K8zWZGUfEW+5w==
X-Google-Smtp-Source: ACHHUZ7pZtbrAhMxd6iWleR200RM6mvanIpgkNTpR5s75pyuJh/4bcbqfdyd+rbo3dVfFEZazKD4jA==
X-Received: by 2002:a05:600c:2310:b0:3f6:a92:57e with SMTP id
 16-20020a05600c231000b003f60a92057emr821751wmo.20.1685085476727; 
 Fri, 26 May 2023 00:17:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15d9:4dfb:95d6:f5a0?
 ([2a01:e0a:982:cbb0:15d9:4dfb:95d6:f5a0])
 by smtp.gmail.com with ESMTPSA id
 s26-20020a7bc39a000000b003f42328b5d9sm4239806wmj.39.2023.05.26.00.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 00:17:56 -0700 (PDT)
Message-ID: <a24cecc0-ade2-b438-f2bb-0b1ab830be01@linaro.org>
Date: Fri, 26 May 2023 09:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: Remove duplicate fdinfo fields
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230525155227.560094-1-robdclark@gmail.com>
 <20230525155227.560094-2-robdclark@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230525155227.560094-2-robdclark@gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: Rob Clark <robdclark@chromium.org>,
 Shashank Sharma <shashank.sharma@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 25/05/2023 17:52, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Some of the fields that are handled by drm_show_fdinfo() crept back in
> when rebasing the patch.  Remove them again.
> 
> Fixes: 376c25f8ca47 ("drm/amdgpu: Switch to fdinfo helper")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> index 13d7413d4ca3..a93e5627901a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -80,23 +80,20 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   
>   	amdgpu_ctx_mgr_usage(&fpriv->ctx_mgr, usage);
>   
>   	/*
>   	 * ******************************************************************
>   	 * For text output format description please see drm-usage-stats.rst!
>   	 * ******************************************************************
>   	 */
>   
>   	drm_printf(p, "pasid:\t%u\n", fpriv->vm.pasid);
> -	drm_printf(p, "drm-driver:\t%s\n", file->minor->dev->driver->name);
> -	drm_printf(p, "drm-pdev:\t%04x:%02x:%02x.%d\n", domain, bus, dev, fn);
> -	drm_printf(p, "drm-client-id:\t%Lu\n", vm->immediate.fence_context);
>   	drm_printf(p, "drm-memory-vram:\t%llu KiB\n", stats.vram/1024UL);
>   	drm_printf(p, "drm-memory-gtt: \t%llu KiB\n", stats.gtt/1024UL);
>   	drm_printf(p, "drm-memory-cpu: \t%llu KiB\n", stats.cpu/1024UL);
>   	drm_printf(p, "amd-memory-visible-vram:\t%llu KiB\n",
>   		   stats.visible_vram/1024UL);
>   	drm_printf(p, "amd-evicted-vram:\t%llu KiB\n",
>   		   stats.evicted_vram/1024UL);
>   	drm_printf(p, "amd-evicted-visible-vram:\t%llu KiB\n",
>   		   stats.evicted_visible_vram/1024UL);
>   	drm_printf(p, "amd-requested-vram:\t%llu KiB\n",

I got:
drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c: In function ‘amdgpu_show_fdinfo’:
drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c:64:32: error: variable ‘domain’ set but not used [-Werror=unused-but-set-variable]
    64 |         uint32_t bus, dev, fn, domain;
       |                                ^~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c:64:28: error: variable ‘fn’ set but not used [-Werror=unused-but-set-variable]
    64 |         uint32_t bus, dev, fn, domain;
       |                            ^~
drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c:64:23: error: variable ‘dev’ set but not used [-Werror=unused-but-set-variable]
    64 |         uint32_t bus, dev, fn, domain;
       |                       ^~~
drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c:64:18: error: variable ‘bus’ set but not used [-Werror=unused-but-set-variable]
    64 |         uint32_t bus, dev, fn, domain;

after applying patch 2, can you fix it ? Seems you can keep the drm-pdev print line

I applied patch 1

Thanks,
Neil
