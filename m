Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A952A8251
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 16:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4F76E140;
	Thu,  5 Nov 2020 15:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B076E140
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 15:36:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n15so2282415wrq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 07:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VVtlWEsWM10xUxHEqNjqBw9sRoL2M0FU25wnXi6OOus=;
 b=H05KUpxI/QnSpcJkO54mUBh5O3Ewu1jFW4YjrxVmdwaAxr1Ixa8HyOQnMnsI8St83F
 xUE/L2I661AaScwuuxs/huDvv9d3KsB3yef6bdbSw/dAc4UGZ4yoSi4LERWTYMUY/2ty
 eFuSPcSrbrTsLtDcNK8cWEixXiIUn0dPN3xm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VVtlWEsWM10xUxHEqNjqBw9sRoL2M0FU25wnXi6OOus=;
 b=BDBUO9Jiukn5YxpkqKwXcaRC7eFwxBP/CqihXzuRH+2HpBUoA3wzme4c3D0O9tnWdM
 5hIPuDOTaNS/YrYvSny82FtApjeu+0Wn4HkxNmpTqzyKF/QMG7pD9xj99zcZDN3Um8Hx
 8iKc9KLpn8KRZrPdb0PxrqY66Bl4oZsEjKCz972nNm1EK07ol/2mWw7Rb2EcDt6oZ7TX
 430nFweaLo+0nBT13lxExhsUT9qauYHB08R/Dhj2BkyH3z5dbedtbCkgBBCl70EHN+yW
 WJEs4KPfCDTF2VT1/qOQQYdxtSWd2D2aWIpGqmuwTJkj8ULNDT9LcCiSPSwA7FAuzxhS
 f0YA==
X-Gm-Message-State: AOAM530vZZyQ1+j0Rjj3sIrpSjSsmbibhBW5wIsDOArswagSEOc2zmYD
 krig36uMQl5d6tTHtw1L95OfxNuK8YNfhKcZ
X-Google-Smtp-Source: ABdhPJxh3Z1GlBMPfmqu7v1JJvJawwE9rOJA/eTCIf0EZ4K/5lBBkyY5b2idmPK0o/68qlYdyBA8dQ==
X-Received: by 2002:adf:8362:: with SMTP id 89mr3814500wrd.280.1604590569421; 
 Thu, 05 Nov 2020 07:36:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f7sm3114919wrx.64.2020.11.05.07.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 07:36:08 -0800 (PST)
Date: Thu, 5 Nov 2020 16:36:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/amdgpu: Make struct drm_driver const
Message-ID: <20201105153606.GZ401619@phenom.ffwll.local>
References: <20201104100425.1922351-1-daniel.vetter@ffwll.ch>
 <20201104100425.1922351-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104100425.1922351-6-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 11:04:25AM +0100, Daniel Vetter wrote:
> From: Luben Tuikov <luben.tuikov@amd.com>
> 
> Make the definition of struct drm_driver
> a constant, to follow the latest developments
> in the DRM layer.
> 
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> [danvet: Rebase onto devm_drm_dev_alloc patch and drop the freesync
> ioctl line again that escaped from internal trees.]
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Entire series merged to drm-misc-next, with an irc ack from Alex for this
one here. Thanks everyone who helped out with patches and reviews!
-Daniel

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 31 +++++++++++++++++++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 24 +------------------
>  2 files changed, 28 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 8b30915aa972..d6fced7a9a03 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -40,6 +40,7 @@
>  #include "amdgpu.h"
>  #include "amdgpu_irq.h"
>  #include "amdgpu_dma_buf.h"
> +#include "amdgpu_sched.h"
>  
>  #include "amdgpu_amdkfd.h"
>  
> @@ -1094,7 +1095,7 @@ static const struct pci_device_id pciidlist[] = {
>  
>  MODULE_DEVICE_TABLE(pci, pciidlist);
>  
> -static struct drm_driver kms_driver;
> +static const struct drm_driver amdgpu_kms_driver;
>  
>  static int amdgpu_pci_probe(struct pci_dev *pdev,
>  			    const struct pci_device_id *ent)
> @@ -1165,7 +1166,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>  	if (ret)
>  		return ret;
>  
> -	adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
> +	adev = devm_drm_dev_alloc(&pdev->dev, &amdgpu_kms_driver, typeof(*adev), ddev);
>  	if (IS_ERR(adev))
>  		return PTR_ERR(adev);
>  
> @@ -1509,7 +1510,29 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
>  	return 0;
>  }
>  
> -static struct drm_driver kms_driver = {
> +int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
> +
> +const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_VM, amdgpu_vm_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_SCHED, amdgpu_sched_ioctl, DRM_MASTER),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_BO_LIST, amdgpu_bo_list_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_FENCE_TO_HANDLE, amdgpu_cs_fence_to_handle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	/* KMS */
> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_MMAP, amdgpu_gem_mmap_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_WAIT_IDLE, amdgpu_gem_wait_idle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_CS, amdgpu_cs_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_INFO, amdgpu_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_CS, amdgpu_cs_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_FENCES, amdgpu_cs_wait_fences_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_METADATA, amdgpu_gem_metadata_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +};
> +
> +static const struct drm_driver amdgpu_kms_driver = {
>  	.driver_features =
>  	    DRIVER_ATOMIC |
>  	    DRIVER_GEM |
> @@ -1520,6 +1543,7 @@ static struct drm_driver kms_driver = {
>  	.lastclose = amdgpu_driver_lastclose_kms,
>  	.irq_handler = amdgpu_irq_handler,
>  	.ioctls = amdgpu_ioctls_kms,
> +	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
>  	.dumb_create = amdgpu_mode_dumb_create,
>  	.dumb_map_offset = amdgpu_mode_dumb_mmap,
>  	.fops = &amdgpu_driver_kms_fops,
> @@ -1572,7 +1596,6 @@ static int __init amdgpu_init(void)
>  		goto error_fence;
>  
>  	DRM_INFO("amdgpu kernel modesetting enabled.\n");
> -	kms_driver.num_ioctls = amdgpu_max_kms_ioctl;
>  	amdgpu_register_atpx_handler();
>  
>  	/* Ignore KFD init failures. Normal when CONFIG_HSA_AMD is not set. */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index efda38349a03..ab6d9f1186c2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -29,7 +29,6 @@
>  #include "amdgpu.h"
>  #include <drm/drm_debugfs.h>
>  #include <drm/amdgpu_drm.h>
> -#include "amdgpu_sched.h"
>  #include "amdgpu_uvd.h"
>  #include "amdgpu_vce.h"
>  #include "atom.h"
> @@ -480,7 +479,7 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
>   * etc. (all asics).
>   * Returns 0 on success, -EINVAL on failure.
>   */
> -static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
> +int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>  {
>  	struct amdgpu_device *adev = drm_to_adev(dev);
>  	struct drm_amdgpu_info *info = data;
> @@ -1243,27 +1242,6 @@ void amdgpu_disable_vblank_kms(struct drm_crtc *crtc)
>  	amdgpu_irq_put(adev, &adev->crtc_irq, idx);
>  }
>  
> -const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_VM, amdgpu_vm_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_SCHED, amdgpu_sched_ioctl, DRM_MASTER),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_BO_LIST, amdgpu_bo_list_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_FENCE_TO_HANDLE, amdgpu_cs_fence_to_handle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	/* KMS */
> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_MMAP, amdgpu_gem_mmap_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_WAIT_IDLE, amdgpu_gem_wait_idle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_CS, amdgpu_cs_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_INFO, amdgpu_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_CS, amdgpu_cs_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_FENCES, amdgpu_cs_wait_fences_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_METADATA, amdgpu_gem_metadata_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW)
> -};
> -const int amdgpu_max_kms_ioctl = ARRAY_SIZE(amdgpu_ioctls_kms);
> -
>  /*
>   * Debugfs info
>   */
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
