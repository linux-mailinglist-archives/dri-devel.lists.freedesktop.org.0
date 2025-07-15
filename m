Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0763B05B12
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C0810E20D;
	Tue, 15 Jul 2025 13:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HnAzQgwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F125B10E20D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:16:40 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45618ddd62fso23020055e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752585399; x=1753190199; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KSNHtnaETw4DtlzGAY8NvYjbcn3Lhzp8vASuZK7f+jQ=;
 b=HnAzQgwpJ8NKiyrjLBobTrQYLg4GDH8Lkh5p+8QU1zV6TPl+xDvuthHKT0Z/Svcx0T
 ejUrfl6t3QTPeNH/VhP/Hmaf4cxPYLpEb1Ry+CigJoqJDy6Vs52kQZfnNqdf1rYbFzun
 PQiZxLYJtK8dM3Iqc71DWxIECyc9a0Zq9PiUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752585399; x=1753190199;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSNHtnaETw4DtlzGAY8NvYjbcn3Lhzp8vASuZK7f+jQ=;
 b=wyoceN6K3YJoWdkwsXA7fNRvhNU6z72j14d7wGBHY37o1Y3FKUZjaKSqNfI2XPkCR7
 qRiRWx8OyPTljDF+ZtkPMhfiE7x/xsgYdOiXcBUv5KkQ8/xtVjaJc3DR7vADtMnShdrl
 wYIKWMKgXdX0q1T0iQ3LLH/Ju9Dyv7WwrTFXEh/eE3BJoe3Vc//t0gG9Ier2itiuw23w
 myfvoKjkXflQc0QY1kLXpe1C8oqtfyhKDlCBkjlzjwtkDjfvciTJN2J/PXnsNHtVXoYN
 EaGQfaKvTYf2XInEG5ug/jruU0pV1GbOkYnJCnpRea67m/O2GgouQfvwMfOhfxLc0S1l
 s1FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr+VKJM9dWJkFlEtcefVwp96vxZAFn7ForYlKyyPzv9fUPHedQiNipUETCiR8on/vfc/zT53Heiko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxYRcesU73kMujYGmG/N/pIAVnaObbRKuzD4rObGRys97GYTjb
 +diSCgCxjNzCN4d3HwGJbqUVlM4p3m0W4a1EmO5nuTB/hAN8MDhKS/Wfn1Pb0EakWL0=
X-Gm-Gg: ASbGncuEqw9T+3gm7ndMgRAV+GAa352mg++8JT+08Ac9re+DF/vEBLCMM9X//TamNO9
 dSm2o7tlqnZ4l/foiE+72sHuCWO0zSFCPib6pXvpTkBF+nt+NrnLyoizmeoa98JDrfu57VQ08Wo
 7IHtpp1Jv4tvWlCFcfKHVghNNjL9XWxXSkEu+C69ic9fjnbGB63x9C988WkykkdiINrSiGO66Z1
 j+hdtezfdtCtCFRZOEpGNEDtzcaEjhxriv2X1+70bQ96OZK4twy9R5JuIuyja/g29BG/rZwqH36
 b4DSd82OXG51TG4hEhttjuTU+Cok3SgmrctzIeAuokiOg4tiNZFwBp98yFEAln5v1H4XN9/IlYi
 mr3oT7OGzmbYWZgJOsFTYpySwxw9cf2BeXumaiGuQLvQk
X-Google-Smtp-Source: AGHT+IE6AVE3VzANWiPdrua10GyZdj4f6vBrn2kcw3n5QovC7tZwk4OkyMeCMgiFtC85TLlBWyscYg==
X-Received: by 2002:a05:600c:610:b0:43c:f44c:72a6 with SMTP id
 5b1f17b1804b1-455174367demr115789855e9.2.1752585399385; 
 Tue, 15 Jul 2025 06:16:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562797b8d2sm19149335e9.8.2025.07.15.06.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 06:16:38 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:16:37 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] Revert "drm/amdgpu: Use dma_buf from GEM object instance"
Message-ID: <aHZUtdhU26IVoNwa@phenom.ffwll.local>
References: <20250715082635.34974-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715082635.34974-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Tue, Jul 15, 2025 at 10:26:22AM +0200, Thomas Zimmermann wrote:
> This reverts commit 515986100d176663d0a03219a3056e4252f729e6.
> 
> The dma_buf field in struct drm_gem_object is not stable over the
> object instance's lifetime. The field becomes NULL when user space
> releases the final GEM handle on the buffer object. This resulted
> in a NULL-pointer deref.
> 
> Workarounds in commit 5307dce878d4 ("drm/gem: Acquire references on
> GEM handles for framebuffers") and commit f6bfc9afc751 ("drm/framebuffer:
> Acquire internal references on GEM handles") only solved the problem
> partially. They especially don't work for buffer objects without a DRM
> framebuffer associated.
> 
> Hence, this revert to going back to using .import_attach->dmabuf.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index ff98c87b2e0b..5743ebb2f1b7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -514,7 +514,7 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
>  		return false;
>  
>  	if (drm_gem_is_imported(obj)) {
> -		struct dma_buf *dma_buf = obj->dma_buf;
> +		struct dma_buf *dma_buf = obj->import_attach->dmabuf;
>  
>  		if (dma_buf->ops != &amdgpu_dmabuf_ops)
>  			/* No XGMI with non AMD GPUs */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 6626a6e64ff5..d1ccbfcf21fa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -317,7 +317,8 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
>  	 */
>  	if (!vm->is_compute_context || !vm->process_info)
>  		return 0;
> -	if (!drm_gem_is_imported(obj) || !dma_buf_is_dynamic(obj->dma_buf))
> +	if (!drm_gem_is_imported(obj) ||
> +	    !dma_buf_is_dynamic(obj->import_attach->dmabuf))
>  		return 0;
>  	mutex_lock_nested(&vm->process_info->lock, 1);
>  	if (!WARN_ON(!vm->process_info->eviction_fence)) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index af0f655dfd5b..b9b4f7d9186e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1272,7 +1272,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
>  		struct drm_gem_object *obj = &bo->tbo.base;
>  
>  		if (drm_gem_is_imported(obj) && bo_va->is_xgmi) {
> -			struct dma_buf *dma_buf = obj->dma_buf;
> +			struct dma_buf *dma_buf = obj->import_attach->dmabuf;
>  			struct drm_gem_object *gobj = dma_buf->priv;
>  			struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
>  
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
