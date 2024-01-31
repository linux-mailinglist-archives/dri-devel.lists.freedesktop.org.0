Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA5843FB6
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 13:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F68610F9FE;
	Wed, 31 Jan 2024 12:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818AB10E22D;
 Wed, 31 Jan 2024 12:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706705493; x=1738241493;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/05LkccSJOplrATiGrtWDK556uL3uH2h3gag+qurnXA=;
 b=l65RtMY0yJR8LckyhUtMPq5NPO5t0oKOT0nJxnyNQU6hy2vngp4NIq52
 ZqQncCOgloWEq1nl2CxaT6GNvU5L7A57qFaUxBhUrEAnvAyZKORh9hJmZ
 cXE7hAoon1kVConxGkhoPpEc5t8kKWZoCyWy2CJXdS4A+NSI4Jn/S3qpn
 iKzqBCpDtmcpH8iIVnHVmZPDc2gDlIBDKGyIC8IvYnRO4Mr/KZR5rq5Uv
 coSr8flg8IdnfpIFumMekih7023Erjfwmiw2EW2ridnGRAt6Q8KjMPWMY
 FV9cb5uDzmcO9r2dh7AUBHrEfgtAK/bnR17QLNje3vQ8W1tbOo1masZ+M Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="394026569"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="394026569"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:51:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4087947"
Received: from abarrete-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.174])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:51:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/6] drm/nouveau/svm: remove unused but set variables
In-Reply-To: <8b133e7ec0e9aef728be301ac019c5ddcb3bbf51.1704908087.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1704908087.git.jani.nikula@intel.com>
 <8b133e7ec0e9aef728be301ac019c5ddcb3bbf51.1704908087.git.jani.nikula@intel.com>
Date: Wed, 31 Jan 2024 14:51:27 +0200
Message-ID: <875xz9is34.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Danilo Krummrich <dakr@redhat.com>, intel-gfx@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Fix the W=1 warning -Wunused-but-set-variable.
>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Ping?

> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index cc03e0c22ff3..4d1008915499 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -112,7 +112,7 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>  {
>  	struct nouveau_cli *cli = nouveau_cli(file_priv);
>  	struct drm_nouveau_svm_bind *args = data;
> -	unsigned target, cmd, priority;
> +	unsigned target, cmd;
>  	unsigned long addr, end;
>  	struct mm_struct *mm;
>  
> @@ -136,9 +136,6 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>  		return -EINVAL;
>  	}
>  
> -	priority = args->header >> NOUVEAU_SVM_BIND_PRIORITY_SHIFT;
> -	priority &= NOUVEAU_SVM_BIND_PRIORITY_MASK;
> -
>  	/* FIXME support CPU target ie all target value < GPU_VRAM */
>  	target = args->header >> NOUVEAU_SVM_BIND_TARGET_SHIFT;
>  	target &= NOUVEAU_SVM_BIND_TARGET_MASK;
> @@ -926,15 +923,14 @@ nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
>  		 unsigned long addr, u64 *pfns, unsigned long npages)
>  {
>  	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
> -	int ret;
>  
>  	args->p.addr = addr;
>  	args->p.size = npages << PAGE_SHIFT;
>  
>  	mutex_lock(&svmm->mutex);
>  
> -	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args,
> -				struct_size(args, p.phys, npages), NULL);
> +	nvif_object_ioctl(&svmm->vmm->vmm.object, args,
> +			  struct_size(args, p.phys, npages), NULL);
>  
>  	mutex_unlock(&svmm->mutex);
>  }

-- 
Jani Nikula, Intel
