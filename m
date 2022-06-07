Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DF853F2EF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 02:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF3E11BF2F;
	Tue,  7 Jun 2022 00:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E3911BF10
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 00:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654561402; x=1686097402;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cfnfM4v5rEHIlWjIY9bhQvgX8vAtfeODWi2dU6u5vC0=;
 b=npXW3OBkNgkWp3usyhq16PGSejXammOODdbcr1ctbbWG/Pui0cC+WWwP
 d9TI5AmGplO+wxl/pYaEoJ6B650wMvNKXKC6hFP2jbrzifK/T/Fdm+Bgw
 Y99iXmr0g3w5I+na52ZUX88MuDTPdWf666b2gLzFXzJLrgTK7uZkNAwvB
 513GbvEKD6yMAvDGwH/ms/YcUqTZCfNivJDBeTb/S4eIncYqf4sowlpoS
 1BKxrWBJi67czvwfY0XuyXO/Pwot7U+xCVaIPaxk+IBejV/tFYG8BL4gR
 d1uvcTimIxQL8Nh6ktJPs0NMANxWOVF5y4iS1KtpTs0Ks6K+VIUzT8X0m Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="340225407"
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; d="scan'208";a="340225407"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 17:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; d="scan'208";a="758787620"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga005.jf.intel.com with ESMTP; 06 Jun 2022 17:23:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 6 Jun 2022 17:23:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 6 Jun 2022 17:23:21 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2308.027;
 Mon, 6 Jun 2022 17:23:21 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/2] drm/virtio: fence created per cursor/plane update
Thread-Topic: [PATCH v2 2/2] drm/virtio: fence created per cursor/plane update
Thread-Index: AQHYd5A99Vlo+z5m0E6T4dlFRryAuq1DEejA
Date: Tue, 7 Jun 2022 00:23:20 +0000
Message-ID: <a3ee13eb8b7348569478bec7655e1418@intel.com>
References: <20220603211849.27703-1-dongwon.kim@intel.com>
 <20220603211849.27703-3-dongwon.kim@intel.com>
In-Reply-To: <20220603211849.27703-3-dongwon.kim@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, lkp <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Gurchetan
 Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi DW,

> Subject: [PATCH v2 2/2] drm/virtio: fence created per cursor/plane update
>=20
> Having one fence for a vgfb would cause conflict in case there are
> multiple planes referencing the same vgfb (e.g. Xorg screen covering
> two displays in extended mode) being flushed simultaneously. So it makes
> sence to use a separated fence for each plane update to prevent this.
>=20
> vgfb->fence is not required anymore with the suggested code change so
> both prepare_fb and cleanup_fb are removed since only fence creation/
> freeing are done in there.
>=20
> v2: - use the fence always as long as guest_blob is enabled on the
>       scanout object
>     - obj and fence initialized as NULL ptrs to avoid uninitialzed
>       ptr problem (Reported by Dan Carpenter/kernel-test-robot)
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |   1 -
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 103 ++++++++++---------------
>  2 files changed, 39 insertions(+), 65 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virti=
o/virtgpu_drv.h
> index 0a194aaad419..4c59c1e67ca5 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -186,7 +186,6 @@ struct virtio_gpu_output {
>=20
>  struct virtio_gpu_framebuffer {
>  	struct drm_framebuffer base;
> -	struct virtio_gpu_fence *fence;
>  };
>  #define to_virtio_gpu_framebuffer(x) \
>  	container_of(x, struct virtio_gpu_framebuffer, base)
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/vir=
tio/virtgpu_plane.c
> index 6d3cc9e238a4..821023b7d57d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -137,29 +137,37 @@ static void virtio_gpu_resource_flush(struct drm_pl=
ane *plane,
>  	struct virtio_gpu_device *vgdev =3D dev->dev_private;
>  	struct virtio_gpu_framebuffer *vgfb;
>  	struct virtio_gpu_object *bo;
> +	struct virtio_gpu_object_array *objs =3D NULL;
> +	struct virtio_gpu_fence *fence =3D NULL;
>=20
>  	vgfb =3D to_virtio_gpu_framebuffer(plane->state->fb);
>  	bo =3D gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
> -	if (vgfb->fence) {
> -		struct virtio_gpu_object_array *objs;
>=20
> +	if (!bo)
> +		return;
[Kasireddy, Vivek] I think you can drop the above check as bo is guaranteed
to be valid in resource_flush as the necessary checks are already done earl=
y
in virtio_gpu_primary_plane_update().

> +
> +	if (bo->dumb && bo->guest_blob)
> +		fence =3D virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
> +					       0);
> +
> +	if (fence) {
>  		objs =3D virtio_gpu_array_alloc(1);
> -		if (!objs)
> +		if (!objs) {
> +			kfree(fence);
>  			return;
> +		}
>  		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
>  		virtio_gpu_array_lock_resv(objs);
> -		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
> -					      width, height, objs, vgfb->fence);
> -		virtio_gpu_notify(vgdev);
> +	}
> +
> +	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
> +				      width, height, objs, fence);
> +	virtio_gpu_notify(vgdev);
[Kasireddy, Vivek] I think it is OK to retain the existing style where all =
the
statements relevant for if (fence) would be lumped together. I do understan=
d that
the above two statements would be redundant in that case but it looks a bit=
 cleaner.

>=20
> -		dma_fence_wait_timeout(&vgfb->fence->f, true,
> +	if (fence) {
> +		dma_fence_wait_timeout(&fence->f, true,
>  				       msecs_to_jiffies(50));
> -		dma_fence_put(&vgfb->fence->f);
> -		vgfb->fence =3D NULL;
> -	} else {
> -		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
> -					      width, height, NULL, NULL);
> -		virtio_gpu_notify(vgdev);
> +		dma_fence_put(&fence->f);
>  	}
>  }
>=20
> @@ -239,47 +247,6 @@ static void virtio_gpu_primary_plane_update(struct d=
rm_plane
> *plane,
>  				  rect.y2 - rect.y1);
>  }
>=20
> -static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
> -				       struct drm_plane_state *new_state)
> -{
> -	struct drm_device *dev =3D plane->dev;
> -	struct virtio_gpu_device *vgdev =3D dev->dev_private;
> -	struct virtio_gpu_framebuffer *vgfb;
> -	struct virtio_gpu_object *bo;
> -
> -	if (!new_state->fb)
> -		return 0;
> -
> -	vgfb =3D to_virtio_gpu_framebuffer(new_state->fb);
> -	bo =3D gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
> -	if (!bo || (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY && !bo->guest_blo=
b))
> -		return 0;
> -
> -	if (bo->dumb && (plane->state->fb !=3D new_state->fb)) {
> -		vgfb->fence =3D virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context=
,
> -						     0);
> -		if (!vgfb->fence)
> -			return -ENOMEM;
> -	}
> -
> -	return 0;
> -}
> -
> -static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
> -					struct drm_plane_state *old_state)
> -{
> -	struct virtio_gpu_framebuffer *vgfb;
> -
> -	if (!plane->state->fb)
> -		return;
> -
> -	vgfb =3D to_virtio_gpu_framebuffer(plane->state->fb);
> -	if (vgfb->fence) {
> -		dma_fence_put(&vgfb->fence->f);
> -		vgfb->fence =3D NULL;
> -	}
> -}
> -
>  static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
>  					   struct drm_atomic_state *state)
>  {
> @@ -290,6 +257,8 @@ static void virtio_gpu_cursor_plane_update(struct drm=
_plane
> *plane,
>  	struct virtio_gpu_output *output =3D NULL;
>  	struct virtio_gpu_framebuffer *vgfb;
>  	struct virtio_gpu_object *bo =3D NULL;
> +	struct virtio_gpu_object_array *objs =3D NULL;
> +	struct virtio_gpu_fence *fence =3D NULL;
>  	uint32_t handle;
>=20
>  	if (plane->state->crtc)
> @@ -309,22 +278,32 @@ static void virtio_gpu_cursor_plane_update(struct d=
rm_plane
> *plane,
>=20
>  	if (bo && bo->dumb && (plane->state->fb !=3D old_state->fb)) {
>  		/* new cursor -- update & wait */
> -		struct virtio_gpu_object_array *objs;
> +		fence =3D virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
> +					       0);
> +		if (!fence)
> +			return;
>=20
>  		objs =3D virtio_gpu_array_alloc(1);
> -		if (!objs)
> +		if (!objs) {
> +			if (fence)
[Kasireddy, Vivek] I think you can drop the above check given that you chec=
ked it
earlier.

> +				kfree(fence);
> +
>  			return;
> +		}
> +
>  		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
>  		virtio_gpu_array_lock_resv(objs);
>  		virtio_gpu_cmd_transfer_to_host_2d
>  			(vgdev, 0,
>  			 plane->state->crtc_w,
>  			 plane->state->crtc_h,
> -			 0, 0, objs, vgfb->fence);
> +			 0, 0, objs, fence);
>  		virtio_gpu_notify(vgdev);
> -		dma_fence_wait(&vgfb->fence->f, true);
> -		dma_fence_put(&vgfb->fence->f);
> -		vgfb->fence =3D NULL;
> +
> +		if (fence) {
[Kasireddy, Vivek] Same as above; i.e, you can drop the if (fence) check as=
 we
wouldn't get here without a valid fence.

I think with the above changes, the diff may get smaller and simpler. Regar=
dless,
this patch is Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

> +			dma_fence_wait(&fence->f, true);
> +			dma_fence_put(&fence->f);
> +		}
>  	}
>=20
>  	if (plane->state->fb !=3D old_state->fb) {
> @@ -358,15 +337,11 @@ static void virtio_gpu_cursor_plane_update(struct d=
rm_plane
> *plane,
>  }
>=20
>  static const struct drm_plane_helper_funcs virtio_gpu_primary_helper_fun=
cs =3D {
> -	.prepare_fb		=3D virtio_gpu_plane_prepare_fb,
> -	.cleanup_fb		=3D virtio_gpu_plane_cleanup_fb,
>  	.atomic_check		=3D virtio_gpu_plane_atomic_check,
>  	.atomic_update		=3D virtio_gpu_primary_plane_update,
>  };
>=20
>  static const struct drm_plane_helper_funcs virtio_gpu_cursor_helper_func=
s =3D {
> -	.prepare_fb		=3D virtio_gpu_plane_prepare_fb,
> -	.cleanup_fb		=3D virtio_gpu_plane_cleanup_fb,
>  	.atomic_check		=3D virtio_gpu_plane_atomic_check,
>  	.atomic_update		=3D virtio_gpu_cursor_plane_update,
>  };
> --
> 2.20.1

