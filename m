Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDBB246F73
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 19:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC9289CA4;
	Mon, 17 Aug 2020 17:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A7889CA4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 17:47:25 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r15so5902910wrp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 10:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5RtXW9+JsZdHT+tKgqiTPPpr7Nv9pAdHrlJhgf6Tosc=;
 b=qHaDKI2kSmOAxTolOniYHW8aPGEPQTwIQ4eDUP+MHfBK44yLkkUG6/cCgR16lmFAnf
 IjFXp90dFIZIBFQ23N2JSQaHdWpAP1alxqwCH7WIZCRogX6UDTiSA30+9yAZPBelihcJ
 2PdqKEDaneNYrYQF9TEDbG0kIrUFRaMhzsekvvAUBP1yols4mV0R2Z1TYT+w/5NpsoDH
 PrHABgYdxqVD/mV9ynLlwnG9TgeXdyDTqtlCdhHWSDcH8ASxlxHKYiAp/esRNJBqX/9w
 eVbRNUrEKoe+25v86dhIwaYXK3tJ3Mybxbfhjt+P7FKcbn1ua95wiLoDx04bW1IatvED
 dnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5RtXW9+JsZdHT+tKgqiTPPpr7Nv9pAdHrlJhgf6Tosc=;
 b=ZKCmQcgVCVTIDwiFdmU6dKsPF9q8moo+2DgqP9djZXeV8+rtmJeAVEmF88iIAnl07X
 EuXl7gy9tp5HOm4JoIiniVl1XQoBdv7GBGgYsZHvExv9/NXTMjne7FEV1KWgBc6nzxjx
 i3ayFK92A00GZDO1qJLyZ2+eiePt63aBFon4h6dexck+iH2ALYdmj+cbnB0aRpq6ZoK7
 csPL6yJjeJM9WcIgfRyBMEUP+J+4DWZBb3j2O7ywjyUjeQxa7GZQv0r8phVKffZfZkwn
 JVfS0UnK5uSjbcv3Dl59jFhdQe3CEsqPqwEDvppo+U/6nTM2Q5FAAJWEkQ/6VtCM4nit
 WTBQ==
X-Gm-Message-State: AOAM531U3P1D/JE2CRWlKonRQ7dV3CDrajMalMLBFubFoFKXCQqFHUvN
 Wuq1Rz156HWOcMX3ifDkF1o=
X-Google-Smtp-Source: ABdhPJzWVXLqYa5EZAkE6BnztCix43+0tOTjxTrNdrA3ak7YZEcBC2Gx9tHdCLve2deiotdtv8GoXA==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr16208657wru.364.1597686444149; 
 Mon, 17 Aug 2020 10:47:24 -0700 (PDT)
Received: from gmail.com ([37.172.237.83])
 by smtp.gmail.com with ESMTPSA id z12sm31924874wrp.20.2020.08.17.10.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 10:47:23 -0700 (PDT)
Date: Mon, 17 Aug 2020 19:46:57 +0200
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 23/24] drm/virtio: implement blob resources: resource
 create blob ioctl
Message-ID: <20200817174657.GA237811@gmail.com>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
 <20200814024000.2485-24-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024000.2485-24-gurchetansingh@chromium.org>
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
Cc: virtio-dev@lists.oasis-open.org, mst@redhat.com,
 dri-devel@lists.freedesktop.org, sebastien.boeuf@intel.com, kraxel@redhat.com,
 vgoyal@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 07:39:59PM -0700, Gurchetan Singh wrote:
>From: Gerd Hoffmann <kraxel@redhat.com>
>
>Implement resource create blob as specified.
>
>Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>Co-developed-by: Gurchetan Singh <gurchetansingh@chromium.org>
>Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
>Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>---
> drivers/gpu/drm/virtio/virtgpu_drv.h    |   4 +-
> drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 136 ++++++++++++++++++++++++
> drivers/gpu/drm/virtio/virtgpu_object.c |   5 +-
> drivers/gpu/drm/virtio/virtgpu_vram.c   |   2 +
> 4 files changed, 144 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
>index 444b65c8d4ee..3e9ec5b1fb63 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
>+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
>@@ -255,8 +255,8 @@ struct virtio_gpu_fpriv {
> 	struct mutex context_lock;
> };
>
>-/* virtgpu_ioctl.c */
>-#define DRM_VIRTIO_NUM_IOCTLS 10
>+/* virtio_ioctl.c */
>+#define DRM_VIRTIO_NUM_IOCTLS 11
> extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
> void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>index 7dbe24248a20..47ac32b7031a 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>@@ -34,6 +34,10 @@
>
> #include "virtgpu_drv.h"
>
>+#define VIRTGPU_BLOB_FLAG_USE_MASK (VIRTGPU_BLOB_FLAG_USE_MAPPABLE | \
>+				    VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
>+				    VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
>+
> void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file)
> {
> 	struct virtio_gpu_device *vgdev = dev->dev_private;
>@@ -520,6 +524,134 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
> 	return 0;
> }
>
>+static int verify_blob(struct virtio_gpu_device *vgdev,
>+		       struct virtio_gpu_fpriv *vfpriv,
>+		       struct virtio_gpu_object_params *params,
>+		       struct drm_virtgpu_resource_create_blob *rc_blob,
>+		       bool *guest_blob, bool *host3d_blob)
>+{
>+	if (!vgdev->has_resource_blob)
>+		return -EINVAL;
>+
>+	if ((rc_blob->blob_flags & ~VIRTGPU_BLOB_FLAG_USE_MASK) ||
>+	    !rc_blob->blob_flags)
>+		return -EINVAL;
>+
>+	if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE) {
>+		if (!vgdev->has_resource_assign_uuid)
>+			return -EINVAL;
>+	}
>+
>+	switch (rc_blob->blob_mem) {
>+	case VIRTGPU_BLOB_MEM_GUEST:
>+		*guest_blob = true;
>+		break;
>+	case VIRTGPU_BLOB_MEM_HOST3D_GUEST:
>+		*guest_blob = true;
>+		fallthrough;
>+	case VIRTGPU_BLOB_MEM_HOST3D:
>+		*host3d_blob = true;
>+		break;
>+	default:
>+		return -EINVAL;
>+	}
>+
>+	if (*host3d_blob) {
>+		if (!vgdev->has_virgl_3d)
>+			return -EINVAL;
>+
>+		/* Must be dword aligned. */
>+		if ((rc_blob->cmd_size) % 4 != 0)
>+			return -EINVAL;
>+
>+		params->ctx_id = vfpriv->ctx_id;
>+		params->blob_id = rc_blob->blob_id;
>+	} else {
>+		if (rc_blob->blob_id != 0)
>+			return -EINVAL;
>+
>+		if (rc_blob->cmd_size != 0)
>+			return -EINVAL;
>+	}
>+
>+	params->blob_mem = rc_blob->blob_mem;
>+	params->size = rc_blob->size;
>+	params->blob = true;
>+	params->blob_flags = rc_blob->blob_flags;
>+	return 0;
>+}
>+
>+static int virtio_gpu_resource_create_blob(struct drm_device *dev,
>+					   void *data, struct drm_file *file)
>+{
>+	int ret = 0;
>+	uint32_t handle = 0;
>+	struct drm_gem_object *obj;
>+	struct virtio_gpu_object *bo;
>+	bool host3d_blob, guest_blob;
>+	struct virtio_gpu_object_params params = { 0 };
>+	struct virtio_gpu_device *vgdev = dev->dev_private;
>+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
>+	struct drm_virtgpu_resource_create_blob *rc_blob = data;
>+
>+	guest_blob = host3d_blob = false;
>+	if (verify_blob(vgdev, vfpriv, &params, rc_blob,
>+			&guest_blob, &host3d_blob))
>+		return -EINVAL;
>+
>+	if (vgdev->has_virgl_3d)
>+		virtio_gpu_create_context(dev, file);
>+
>+	if (rc_blob->cmd_size) {
>+		void *buf;
>+
>+		buf = memdup_user(u64_to_user_ptr(rc_blob->cmd),
>+				  rc_blob->cmd_size);
>+
>+		if (IS_ERR(buf))
>+			return PTR_ERR(buf);
>+
>+		virtio_gpu_cmd_submit(vgdev, buf, rc_blob->cmd_size,
>+				      vfpriv->ctx_id, NULL, NULL);
>+	}
>+
>+	if (guest_blob)
>+		ret = virtio_gpu_object_create(vgdev, &params, &bo, NULL);
>+	else if (!guest_blob && host3d_blob)
>+		ret = virtio_gpu_vram_create(vgdev, &params, &bo);
>+	else
>+		return -EINVAL;
>+
>+	if (ret < 0)
>+		return ret;
>+
>+	bo->guest_blob = guest_blob;
>+	bo->host3d_blob = host3d_blob;
>+	bo->blob_mem = rc_blob->blob_mem;
>+	bo->blob_flags = rc_blob->blob_flags;
>+
>+	obj = &bo->base.base;
>+	if (params.blob_flags & VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE) {
>+		ret = virtio_gpu_resource_assign_uuid(vgdev, bo);
>+		if (ret) {
>+			drm_gem_object_release(obj);
>+			return ret;
>+		}
>+	}
>+
>+	ret = drm_gem_handle_create(file, obj, &handle);
>+	if (ret) {
>+		drm_gem_object_release(obj);
>+		return ret;
>+	}
>+	drm_gem_object_put(obj);
>+
>+	rc_blob->res_handle = bo->hw_res_handle;
>+	rc_blob->bo_handle = handle;
>+
>+	return 0;
>+}
>+
> struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
> 	DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
> 			  DRM_RENDER_ALLOW),
>@@ -552,4 +684,8 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
>
> 	DRM_IOCTL_DEF_DRV(VIRTGPU_GET_CAPS, virtio_gpu_get_caps_ioctl,
> 			  DRM_RENDER_ALLOW),
>+
>+	DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_CREATE_BLOB,
>+			  virtio_gpu_resource_create_blob,

Should the function be suffixed by _ioctl like the others?

Other than than, all the serie is:
Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
