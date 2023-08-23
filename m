Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723DE785E50
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 19:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C0A10E47D;
	Wed, 23 Aug 2023 17:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 467 seconds by postgrey-1.36 at gabe;
 Wed, 23 Aug 2023 17:11:00 UTC
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705F710E098
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 17:11:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D15653200953;
 Wed, 23 Aug 2023 13:03:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 23 Aug 2023 13:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1692810189; x=1692896589; bh=9cl/qSeSo6vmRZcuQsqRNBYJquxH7umaNwW
 d2UbElMY=; b=XZO18epvn98KEW/ft1ix2O0P5qDrW3B4RCydNBcIEvj829bCzol
 Ti5mUFlE1KO95jKCjOKiuqHQtbs1/DCbvx2hh9QrMrXsUuh4gsgihNi/tZ6cv0u9
 vCQVEgULbN5M7m4SIJTCHoxdze08hsK13Mptay4GSgpR0HM/cNf++XdVOOI/GSq8
 xWwk5RGd+V5oBpuxwd56uTWOvheHGGqWXCCJKHF2V2156xsr+tI4W2M7j1UaIkEc
 17MZo0bINj6JPSrj1OZbxaEf0qrK3zEJqgiDmj4F3D91wgXfVwpAOxV96mHAiiVl
 qPyVurRlgN5xJCkjK4ZKRqhmHX6Aj3CzgVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1692810189; x=1692896589; bh=9cl/qSeSo6vmRZcuQsqRNBYJquxH7umaNwW
 d2UbElMY=; b=kSSQieZQu+tOzdAqMW5Setlpp5IvH3a9wUo1OlYtaLU6fEPqQMm
 2enFy4LyfLI5+Oa/b4qhSHo2BpR6dL9PXFSCsCyGuAIDP8ztlsbrHD0B3ZR2Qopi
 LI7N+hwizQjiUbz7j7NaQjex330y2wIhi9mAtc6VG7EM/dGelQTI9m9E2vyG4Bdf
 ZZgGKRqkCCS6Db7r81nhAtRz2zfRuEfu7H2O7o6WQknM79raPkyjpVkHm6oSMp0M
 eDD82gN7DxgpFzXrv8oIepuFiO6+brKxpu2GbKR7wjFYDEIfSVjF57OVLSKucz+7
 ifb9X0SvAVluRe4ai1L4S7sll5RJrqd4u6w==
X-ME-Sender: <xms:xzvmZMfHZVzOj_CYbjgpUM9UwcS12F1yeIKnWD7xmZd5gzhReW1SYw>
 <xme:xzvmZOP1PM7QQMf7tiqDa2VNik5Z8A10VqCeBi4btOujwfX0q5lXi9OKelSEYGPjM
 l-piofPPRcGqi7zxJk>
X-ME-Received: <xmr:xzvmZNj7ghNaGMbRF_lskZeCN5Lpu2Rn3is3DwpcQ_Bh_Q2NbWPWHonn59GIkwhvL07jrfnIZxaE3xKuJOr6XOoa1caICNEnxOvY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddvgedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepfdfo
 rggriicuofhomhgsrghsrgifrghlrgculdggofghrghrvgdmfdcuoehmrggriihmsehfrg
 hsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepleejvdeugeelhfevteduueev
 fffftefhudetuedugfduffekjedugfffjeefteegnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrrgiimhesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:xzvmZB-3DL1oMm7me3xUX9oxQyVdla6OHsE7KWJOiz0bC1wEnYqwDA>
 <xmx:xzvmZIuWx9khtOv3xPyaNSx_Tc5Lk0dGMN0dqfIqDX3bgocGJMlBGA>
 <xmx:xzvmZIGXRt7aSqt8xo-fO-MdavvjAHa1gXtXMlDd2y4oLFh1Eum63w>
 <xmx:zTvmZCWul1RADkwUjwjWbwAq2llV1p1IdzEQ4AGFMIshtV3Kt6xrGA>
Feedback-ID: i1b1946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Aug 2023 13:03:02 -0400 (EDT)
Message-ID: <0f721521-2dd3-f8b7-84f8-ee77bb7509a4@fastmail.com>
Date: Wed, 23 Aug 2023 10:03:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/vmwgfx: Fix possible invalid drm gem put calls
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230818041301.407636-1-zack@kde.org>
From: "Maaz Mombasawala (VMWare)" <maazm@fastmail.com>
In-Reply-To: <20230818041301.407636-1-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, iforbes@vmware.com,
 banackm@vmware.com, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM!

Reviewed-by: Maaz Mombasawala<mombasawalam@vmware.com>

Maaz Mombasawala (VMware)<maazm@fastmail.com>

On 8/17/2023 9:13 PM, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> vmw_bo_unreference sets the input buffer to null on exit, resulting in
> null ptr deref's on the subsequent drm gem put calls.
>
> This went unnoticed because only very old userspace would be exercising
> those paths but it wouldn't be hard to hit on old distros with brand
> new kernels.
>
> Introduce a new function that abstracts unrefing of user bo's to make
> the code cleaner and more explicit.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Reported-by: Ian Forbes <iforbes@vmware.com>
> Fixes: 9ef8d83e8e25 ("drm/vmwgfx: Do not drop the reference to the handle too soon")
> Cc: <stable@vger.kernel.org> # v6.4+
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 6 ++----
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.h      | 8 ++++++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 6 ++----
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     | 6 ++----
>   drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c | 3 +--
>   drivers/gpu/drm/vmwgfx/vmwgfx_shader.c  | 3 +--
>   6 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index 82094c137855..c43853597776 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -497,10 +497,9 @@ static int vmw_user_bo_synccpu_release(struct drm_file *filp,
>   		if (!(flags & drm_vmw_synccpu_allow_cs)) {
>   			atomic_dec(&vmw_bo->cpu_writers);
>   		}
> -		ttm_bo_put(&vmw_bo->tbo);
> +		vmw_user_bo_unref(vmw_bo);
>   	}
>   
> -	drm_gem_object_put(&vmw_bo->tbo.base);
>   	return ret;
>   }
>   
> @@ -540,8 +539,7 @@ int vmw_user_bo_synccpu_ioctl(struct drm_device *dev, void *data,
>   			return ret;
>   
>   		ret = vmw_user_bo_synccpu_grab(vbo, arg->flags);
> -		vmw_bo_unreference(&vbo);
> -		drm_gem_object_put(&vbo->tbo.base);
> +		vmw_user_bo_unref(vbo);
>   		if (unlikely(ret != 0)) {
>   			if (ret == -ERESTARTSYS || ret == -EBUSY)
>   				return -EBUSY;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> index 50a836e70994..1d433fceed3d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> @@ -195,6 +195,14 @@ static inline struct vmw_bo *vmw_bo_reference(struct vmw_bo *buf)
>   	return buf;
>   }
>   
> +static inline void vmw_user_bo_unref(struct vmw_bo *vbo)
> +{
> +	if (vbo) {
> +		ttm_bo_put(&vbo->tbo);
> +		drm_gem_object_put(&vbo->tbo.base);
> +	}
> +}
> +
>   static inline struct vmw_bo *to_vmw_bo(struct drm_gem_object *gobj)
>   {
>   	return container_of((gobj), struct vmw_bo, tbo.base);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 6b9aa2b4ef54..25b96821df0f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -1164,8 +1164,7 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
>   	}
>   	vmw_bo_placement_set(vmw_bo, VMW_BO_DOMAIN_MOB, VMW_BO_DOMAIN_MOB);
>   	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
> -	ttm_bo_put(&vmw_bo->tbo);
> -	drm_gem_object_put(&vmw_bo->tbo.base);
> +	vmw_user_bo_unref(vmw_bo);
>   	if (unlikely(ret != 0))
>   		return ret;
>   
> @@ -1221,8 +1220,7 @@ static int vmw_translate_guest_ptr(struct vmw_private *dev_priv,
>   	vmw_bo_placement_set(vmw_bo, VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM,
>   			     VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM);
>   	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
> -	ttm_bo_put(&vmw_bo->tbo);
> -	drm_gem_object_put(&vmw_bo->tbo.base);
> +	vmw_user_bo_unref(vmw_bo);
>   	if (unlikely(ret != 0))
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index b62207be3363..1489ad73c103 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -1665,10 +1665,8 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
>   
>   err_out:
>   	/* vmw_user_lookup_handle takes one ref so does new_fb */
> -	if (bo) {
> -		vmw_bo_unreference(&bo);
> -		drm_gem_object_put(&bo->tbo.base);
> -	}
> +	if (bo)
> +		vmw_user_bo_unref(bo);
>   	if (surface)
>   		vmw_surface_unreference(&surface);
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> index 7e112319a23c..fb85f244c3d0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> @@ -451,8 +451,7 @@ int vmw_overlay_ioctl(struct drm_device *dev, void *data,
>   
>   	ret = vmw_overlay_update_stream(dev_priv, buf, arg, true);
>   
> -	vmw_bo_unreference(&buf);
> -	drm_gem_object_put(&buf->tbo.base);
> +	vmw_user_bo_unref(buf);
>   
>   out_unlock:
>   	mutex_unlock(&overlay->mutex);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> index e7226db8b242..1e81ff2422cf 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> @@ -809,8 +809,7 @@ static int vmw_shader_define(struct drm_device *dev, struct drm_file *file_priv,
>   				    shader_type, num_input_sig,
>   				    num_output_sig, tfile, shader_handle);
>   out_bad_arg:
> -	vmw_bo_unreference(&buffer);
> -	drm_gem_object_put(&buffer->tbo.base);
> +	vmw_user_bo_unref(buffer);
>   	return ret;
>   }
>   
