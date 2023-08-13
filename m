Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AE177A47E
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 03:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FD510E042;
	Sun, 13 Aug 2023 01:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3B910E042
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 01:13:46 +0000 (UTC)
Received: from [192.168.2.249] (109-252-150-127.dynamic.spd-mgts.ru
 [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1922D66071B8;
 Sun, 13 Aug 2023 02:13:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691889224;
 bh=bldCLhjQs5myfHeuIY7KWdxl9012TTQlA1NFtPIAq9o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=St/DMsWozVKpwIu5zF8eR0+hD9xcwltNuJvAA0qZNWwW5Myi0Vx8ecjh8GpIXVWjM
 KxpUFsIsi7RffxeukeJfRtO9G5lvAemcQu2WntdaOgxX79yRhyCnUQE3KbWxNFijR0
 qvN/jgNCZur/z3O1OtDRQ6YNS6cb6DB5lS3lmiOiF8PVZ7xpSNtRd2WCKGCXFGGiSN
 JJqp0YkJ1QA3qQgQFDmR/cbFscuTFhiB7b5B6SxlFP/d+6Ua1OA3zG3YmLbnvWYpTV
 hY5v86IBMhPwhYQQJtcG3Rxfi2QxP0fqJK/L96jXvO/eamrfzQJ6iszL9P3THBjCcc
 5Pv7Tz1BbgujA==
Message-ID: <08561b1d-43c6-98d5-ebbf-42dd8526a4d3@collabora.com>
Date: Sun, 13 Aug 2023 04:13:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] drm/virtio: Remove unused function declarations
Content-Language: en-US
To: Yue Haibing <yuehaibing@huawei.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 daniel@ffwll.ch
References: <20230811101823.32344-1-yuehaibing@huawei.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230811101823.32344-1-yuehaibing@huawei.com>
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/11/23 13:18, Yue Haibing wrote:
> Commit dc5698e80cf7 ("Add virtio gpu driver.") declared but never
> implemented virtio_gpu_attach_status_page()/virtio_gpu_detach_status_page()
> Also commit 62fb7a5e1096 ("virtio-gpu: add 3d/virgl support")
> declared but never implemented virtio_gpu_fence_ack() and
> virtio_gpu_dequeue_fence_func().
> Commit c84adb304c10 ("drm/virtio: Support virtgpu exported resources")
> declared but never implemented virtgpu_gem_prime_get_uuid().
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 4126c384286b..8513b671f871 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -344,8 +344,6 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
>  			      struct virtio_gpu_object *obj,
>  			      struct virtio_gpu_mem_entry *ents,
>  			      unsigned int nents);
> -int virtio_gpu_attach_status_page(struct virtio_gpu_device *vgdev);
> -int virtio_gpu_detach_status_page(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
>  			    struct virtio_gpu_output *output);
>  int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev);
> @@ -394,11 +392,8 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
>  				  struct virtio_gpu_fence *fence);
>  void virtio_gpu_ctrl_ack(struct virtqueue *vq);
>  void virtio_gpu_cursor_ack(struct virtqueue *vq);
> -void virtio_gpu_fence_ack(struct virtqueue *vq);
>  void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
>  void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
> -void virtio_gpu_dequeue_fence_func(struct work_struct *work);
> -
>  void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
>  
>  int
> @@ -465,8 +460,6 @@ struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
>  					 int flags);
>  struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
>  						struct dma_buf *buf);
> -int virtgpu_gem_prime_get_uuid(struct drm_gem_object *obj,
> -			       uuid_t *uuid);
>  struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
>  	struct drm_device *dev, struct dma_buf_attachment *attach,
>  	struct sg_table *sgt);

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

