Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DA97BCED9
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 16:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AFF10E184;
	Sun,  8 Oct 2023 14:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FFC10E17A;
 Sun,  8 Oct 2023 14:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=31H6J0TKF2jb6VRUPaWmYacNYwTgcymYOOg7MyMV/6g=; b=0hseURS32wrmjeWCmP59ESkAJl
 UPUY+oltA6U8Hg7+FPRboX5J4xJMABPgpxe8DHV6XUaip0FiLCGpVWJ1ar/NbxaQ+I5B16lBArgur
 Cl97ZqZ1X/FY8hD7efxD6QxArijb+yYhibWpb/PBy4OWW7mLNPKU9u6eI9Ij5TyLU8zS9i9+eZ7z4
 i2Q2oyvAWBlfa5N9koTFrBVLCk0POr1MQG83Sg112YjWxrmtjRwNriSXBflfqwTSPpFmYA6adDsLD
 wEcq56kaPOY3vUT4CLHmT2TX8DqMDQvr+oCu4dksgIOCXtariFCyJwQT4vttVzK7rf+OK2vDzyZc5
 RLUF3EHg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qpURL-008vvc-0W; Sun, 08 Oct 2023 14:07:27 +0000
Message-ID: <22b74194-2701-47b4-a8cc-3e41ceb326d6@infradead.org>
Date: Sun, 8 Oct 2023 07:07:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: fix kernel-doc warning
Content-Language: en-US
To: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
References: <20231008070618.20640-1-bragathemanick0908@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231008070618.20640-1-bragathemanick0908@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/8/23 00:06, Bragatheswaran Manickavel wrote:
> Identified below document warning in latest linux-next.
> ./include/uapi/drm/nouveau_drm.h:49: warning: Cannot understand
> * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX: on line 49 - I thought it was a doc line
> 
> Also, on running checkpatch.pl to nouveau_drm.h identified
> few more warnings/errors and fixing them in this patch
> 
> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> ---
>  include/uapi/drm/nouveau_drm.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> index eaf9f248619f..a523ca5aa865 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -46,7 +46,7 @@ extern "C" {
>  #define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
>  
>  /**
> - * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
> + * NOUVEAU_GETPARAM_EXEC_PUSH_MAX:

Yes, this does quieten the kernel-doc warning, but the produced html output
is not correct.

I had sent a patch for this but it was incomplete (missing full commit message).
I have just sent a v2:
  https://lore.kernel.org/lkml/20231008140231.17921-1-rdunlap@infradead.org/


>   *
>   * Query the maximum amount of IBs that can be pushed through a single
>   * &drm_nouveau_exec structure and hence a single &DRM_IOCTL_NOUVEAU_EXEC
> @@ -458,15 +458,15 @@ struct drm_nouveau_svm_bind {
>  
>  #define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
>  #define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
> -#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
>  
>  #define DRM_IOCTL_NOUVEAU_SVM_INIT           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_INIT, struct drm_nouveau_svm_init)
>  #define DRM_IOCTL_NOUVEAU_SVM_BIND           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_BIND, struct drm_nouveau_svm_bind)
>  
>  #define DRM_IOCTL_NOUVEAU_GEM_NEW            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_NEW, struct drm_nouveau_gem_new)
>  #define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF        DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF, struct drm_nouveau_gem_pushbuf)
> -#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
> -#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
> +#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
> +#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
>  #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
>  
>  #define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)

-- 
~Randy
