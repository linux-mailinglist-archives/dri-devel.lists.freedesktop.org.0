Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0073753F2D3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 01:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E87310E11D;
	Mon,  6 Jun 2022 23:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16A210E11D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 23:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654559661; x=1686095661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bcDo34V3SBh7aMa9X8slkrT7LELVo69c7qj4o3fOZNs=;
 b=J+pbEQdLUOKQTu1gWF6WCrKIIRqyzeuoaoms7xqXg1kwfLrR1UBqDLft
 sIo42t0fGp8JzNDiK6oUGQvHxWWi7KuMMpyjKTSsUOSSH+oZD3c6iSFpf
 w1Q3dopJi0YuGq36DbZvz40bQ0tAIZ5dowQdTWLnslsG9HFU7dmr5M/TK
 5Ar4AgPZ24Dyf/8I4TdR/OiaEuaRcjmI3QH/9ujWiXmnUWSTPBNvUCiVB
 OLCrHZNHb/NwabfeIGvxmwvIqYrsWSD73aZwS03LleZLYanlXk9ILzCln
 lNhmhYDkjwiOdvHqLkrx74peuQwk0RK4lhEE46YQGDPMEJ4zmgp+0YZaC A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="277236778"
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; d="scan'208";a="277236778"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 16:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; d="scan'208";a="709255665"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 06 Jun 2022 16:54:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 6 Jun 2022 16:54:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 6 Jun 2022 16:54:20 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2308.027;
 Mon, 6 Jun 2022 16:54:20 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/2] drm/virtio: .release ops for virtgpu fence release
Thread-Topic: [PATCH v2 1/2] drm/virtio: .release ops for virtgpu fence release
Thread-Index: AQHYd5A8aGyELveKGEq4bVp11h61TK1DEdjA
Date: Mon, 6 Jun 2022 23:54:20 +0000
Message-ID: <bacc0e91d9e34b289470b5e838b815e9@intel.com>
References: <20220603211849.27703-1-dongwon.kim@intel.com>
 <20220603211849.27703-2-dongwon.kim@intel.com>
In-Reply-To: <20220603211849.27703-2-dongwon.kim@intel.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> virtio_gpu_fence_release is added to free virtio-gpu-fence
> upon release of dma_fence.
>=20
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_fence.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/vir=
tio/virtgpu_fence.c
> index f28357dbde35..ba659ac2a51d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_fence.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
> @@ -63,12 +63,20 @@ static void virtio_gpu_timeline_value_str(struct dma_=
fence *f,
> char *str,
>  		 (u64)atomic64_read(&fence->drv->last_fence_id));
>  }
>=20
> +static void virtio_gpu_fence_release(struct dma_fence *f)
> +{
> +	struct virtio_gpu_fence *fence =3D to_virtio_gpu_fence(f);
> +
> +	kfree(fence);
> +}
> +
>  static const struct dma_fence_ops virtio_gpu_fence_ops =3D {
>  	.get_driver_name     =3D virtio_gpu_get_driver_name,
>  	.get_timeline_name   =3D virtio_gpu_get_timeline_name,
>  	.signaled            =3D virtio_gpu_fence_signaled,
>  	.fence_value_str     =3D virtio_gpu_fence_value_str,
>  	.timeline_value_str  =3D virtio_gpu_timeline_value_str,
> +	.release	     =3D virtio_gpu_fence_release,

Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

>  };
>=20
>  struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device=
 *vgdev,
> --
> 2.20.1

