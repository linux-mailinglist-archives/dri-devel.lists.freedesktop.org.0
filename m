Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5F6C20DE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 20:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E1810E30B;
	Mon, 20 Mar 2023 19:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4ED10E301
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 19:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+d6G12ekNECg6CxTbo213cund9poUW+sMQnSqK6O3zA=; b=eCrs6nvESbh57DXVTqp+y5+C28
 cuurTjA8WjS/X0FwkZa1vJBiLU03Qilnf/R0mPhs9h9bXpWAl2pTVJJUtjlsQA3sKmcJkBJemBQNN
 nWgKVBUCcmXLO/I/+GNprG7qYa9Ut0b+UFaYdPEK7gFL0GwFfTbwhIoJJzrL9mjAYfTT3zg0mEcLb
 9mjd/Ru8D8lch/Us2rDcaMEcl8a+phodybkgAweAp5tTKU2RULLRpLIY1MfZItq/Jto4I3vY1WauS
 Ki0XJENQijY8GKk1glEcuj7Gw8LuyDhSLogg80+6JtPRGWHGhbaATShFlP3+B4t5prCfssk35NVtE
 7T5P9Gcw==;
Received: from [177.34.168.16] (helo=[192.168.0.3])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1peKqp-0019eT-55; Mon, 20 Mar 2023 20:07:23 +0100
Message-ID: <865a2a60-1e2a-9e9b-3da1-d58da3a9de6b@igalia.com>
Date: Mon, 20 Mar 2023 16:07:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/vgem: Drop struct drm_vgem_gem_object
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, Melissa Wen <mwen@igalia.com>
References: <20230222160617.171429-1-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230222160617.171429-1-mcanal@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/22/23 13:06, Maíra Canal wrote:
> Commit 45d9c8dde4cd ("drm/vgem: use shmem helpers") introduced shmem
> helpers to vgem and with that, removed all uses of the struct
> drm_vgem_gem_object. So, as the struct is no longer used, delete it.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---

Applied to drm-misc-next.

Best Regards,
- Maíra Canal

>   drivers/gpu/drm/vgem/vgem_drv.h | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.h b/drivers/gpu/drm/vgem/vgem_drv.h
> index 0ed300317f87..34cf63e6fb3d 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.h
> +++ b/drivers/gpu/drm/vgem/vgem_drv.h
> @@ -39,17 +39,6 @@ struct vgem_file {
>   	struct mutex fence_mutex;
>   };
>   
> -#define to_vgem_bo(x) container_of(x, struct drm_vgem_gem_object, base)
> -struct drm_vgem_gem_object {
> -	struct drm_gem_object base;
> -
> -	struct page **pages;
> -	unsigned int pages_pin_count;
> -	struct mutex pages_lock;
> -
> -	struct sg_table *table;
> -};
> -
>   int vgem_fence_open(struct vgem_file *file);
>   int vgem_fence_attach_ioctl(struct drm_device *dev,
>   			    void *data,
