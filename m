Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B60F392956
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 10:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72666EE38;
	Thu, 27 May 2021 08:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689726EE38;
 Thu, 27 May 2021 08:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id BAB323F720;
 Thu, 27 May 2021 10:16:17 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="hI6pkhzB";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54M89AOev3mK; Thu, 27 May 2021 10:16:16 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 94DBA3F6D2;
 Thu, 27 May 2021 10:16:16 +0200 (CEST)
Received: from [192.168.0.209] (irdmzpr01-ext.ir.intel.com [192.198.151.36])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 62FEF360128;
 Thu, 27 May 2021 10:16:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622103375; bh=oFWmAp3WfqpDGfNqpzYYvA4gfdudrFCx6xZ2/zIXrA0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=hI6pkhzBAtXRPAqUC8aOoLyaf29UoeMHofHsvEvHj+WU+jI+HEQD70gvnl/N17CpX
 2gEZ0fRciW6dg4SUXy31bwPRi8Ja8hy4VJWPKsu2ZwyfhntgMpeYPspcarS+OqKdeu
 LWhLe+kp96PgET9xTbiZUffDuHmIpkF8AH3We2qw=
Subject: Re: [PATCH v4 14/15] drm/vma: Add a driver_private member to vma_node.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
 <20210526113259.1661914-15-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <d39070fd-7eb5-7ce4-cd82-6d23f6df392b@shipmail.org>
Date: Thu, 27 May 2021 10:16:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526113259.1661914-15-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maarten,

On 5/26/21 1:32 PM, Thomas Hellström wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> This allows drivers to distinguish between different types of vma_node's.
> The readonly flag was unused and is thus removed.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

This one was acked by danvet on IRC, but he wanted a more verbose commit 
message stating that it would be temporary until all mmap-capable gem 
obj backends could be moved over to TTM for discrete.

/Thomas


> ---
>   drivers/gpu/drm/drm_gem.c     | 9 ---------
>   include/drm/drm_vma_manager.h | 2 +-
>   2 files changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 9989425e9875..e710e79069f6 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1149,15 +1149,6 @@ int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>   		return -EACCES;
>   	}
>   
> -	if (node->readonly) {
> -		if (vma->vm_flags & VM_WRITE) {
> -			drm_gem_object_put(obj);
> -			return -EINVAL;
> -		}
> -
> -		vma->vm_flags &= ~VM_MAYWRITE;
> -	}
> -
>   	ret = drm_gem_mmap_obj(obj, drm_vma_node_size(node) << PAGE_SHIFT,
>   			       vma);
>   
> diff --git a/include/drm/drm_vma_manager.h b/include/drm/drm_vma_manager.h
> index 76ac5e97a559..4f8c35206f7c 100644
> --- a/include/drm/drm_vma_manager.h
> +++ b/include/drm/drm_vma_manager.h
> @@ -53,7 +53,7 @@ struct drm_vma_offset_node {
>   	rwlock_t vm_lock;
>   	struct drm_mm_node vm_node;
>   	struct rb_root vm_files;
> -	bool readonly:1;
> +	void *driver_private;
>   };
>   
>   struct drm_vma_offset_manager {
