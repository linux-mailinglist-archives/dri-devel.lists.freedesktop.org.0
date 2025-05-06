Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCA8AAB95F
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 08:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962DA10E1CA;
	Tue,  6 May 2025 06:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PsdL7a5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D66310E1CA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 06:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1746514569;
 bh=a+I9Q2/IDUgbzScxa83+l03FoiQJZNFZzGWX2jYHBPU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PsdL7a5gUWBzzj6WHLi3LyT0i9xpO9CmDUMSbHVeti3/BE3fyzc45zzcVAEAjJs/f
 w4an1X5v7zaZd9TYCeWd3lLs5Mv3w0GReBIIR7oCwrwLLynqRlhBDDS+megOFU12gV
 2/XFo/Hz/ZCWqLT4eDF3TdodNWkUAr9zINM/2S45QeQHlUx1Yl1RzCpgi32dZBuKdu
 oFC06VocPHy/EKIHOrqtcMYntH2JhTURtMcO2aXo1DozOJrY03honB4GP43PEs+2z3
 WHu5jRP28I9gqM76+OMgtutLkA7XKedzPA96yFXE1v4FPBA5SoR/ajWSzvOuxy4n3L
 qxyB+zbcggBzg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9988217E0630;
 Tue,  6 May 2025 08:56:08 +0200 (CEST)
Date: Tue, 6 May 2025 08:56:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 2/3] drm/panfrost: Add driver IOCTL for setting BO labels
Message-ID: <20250506085603.49eb803b@collabora.com>
In-Reply-To: <20250424022138.709303-3-adrian.larumbe@collabora.com>
References: <20250424022138.709303-1-adrian.larumbe@collabora.com>
 <20250424022138.709303-3-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 24 Apr 2025 03:21:31 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Allow UM to label a BO for which it possesses a DRM handle.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 44 ++++++++++++++++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_gem.h |  2 ++
>  include/uapi/drm/panfrost_drm.h         | 20 +++++++++++
>  3 files changed, 65 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index b87f83e94eda..b0ab76d67e96 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -495,6 +495,46 @@ static int panfrost_ioctl_madvise(struct drm_device =
*dev, void *data,
>  	return ret;
>  }
> =20
> +static int panfrost_ioctl_set_label_bo(struct drm_device *ddev, void *da=
ta,
> +				       struct drm_file *file)
> +{
> +	struct drm_panfrost_set_label_bo *args =3D data;
> +	struct drm_gem_object *obj;
> +	const char *label =3D NULL;
> +	int ret =3D 0;
> +
> +	if (args->pad)
> +		return -EINVAL;
> +
> +	obj =3D drm_gem_object_lookup(file, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (args->label) {
> +		label =3D strndup_user((const char __user *)(uintptr_t)args->label,
> +				     PANFROST_BO_LABEL_MAXLEN);
> +		if (IS_ERR(label)) {
> +			ret =3D PTR_ERR(label);
> +			if (ret =3D=3D -EINVAL)
> +				ret =3D -E2BIG;
> +			goto err_put_obj;
> +		}
> +	}
> +
> +	/*
> +	 * We treat passing a label of length 0 and passing a NULL label
> +	 * differently, because even though they might seem conceptually
> +	 * similar, future uses of the BO label might expect a different
> +	 * behaviour in each case.
> +	 */
> +	panfrost_gem_set_label(obj, label);
> +
> +err_put_obj:
> +	drm_gem_object_put(obj);
> +
> +	return ret;
> +}
> +
>  int panfrost_unstable_ioctl_check(void)
>  {
>  	if (!unstable_ioctls)
> @@ -561,6 +601,7 @@ static const struct drm_ioctl_desc panfrost_drm_drive=
r_ioctls[] =3D {
>  	PANFROST_IOCTL(PERFCNT_ENABLE,	perfcnt_enable,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(PERFCNT_DUMP,	perfcnt_dump,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
> +	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
>  };
> =20
>  static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
> @@ -625,6 +666,7 @@ static const struct file_operations panfrost_drm_driv=
er_fops =3D {
>   * - 1.2 - adds AFBC_FEATURES query
>   * - 1.3 - adds JD_REQ_CYCLE_COUNT job requirement for SUBMIT
>   *       - adds SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY queries
> + * - 1.4 - adds SET_LABEL_BO
>   */
>  static const struct drm_driver panfrost_drm_driver =3D {
>  	.driver_features	=3D DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
> @@ -637,7 +679,7 @@ static const struct drm_driver panfrost_drm_driver =
=3D {
>  	.name			=3D "panfrost",
>  	.desc			=3D "panfrost DRM",
>  	.major			=3D 1,
> -	.minor			=3D 3,
> +	.minor			=3D 4,
> =20
>  	.gem_create_object	=3D panfrost_gem_create_object,
>  	.gem_prime_import_sg_table =3D panfrost_gem_prime_import_sg_table,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.h
> index c0be2934f229..842e025b9bdc 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -9,6 +9,8 @@
> =20
>  struct panfrost_mmu;
> =20
> +#define PANFROST_BO_LABEL_MAXLEN	4096
> +
>  struct panfrost_gem_object {
>  	struct drm_gem_shmem_object base;
>  	struct sg_table *sgts;
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_=
drm.h
> index 568724be6628..b0445c5e514d 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -21,6 +21,7 @@ extern "C" {
>  #define DRM_PANFROST_PERFCNT_ENABLE		0x06
>  #define DRM_PANFROST_PERFCNT_DUMP		0x07
>  #define DRM_PANFROST_MADVISE			0x08
> +#define DRM_PANFROST_SET_LABEL_BO		0x09
> =20
>  #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFRO=
ST_SUBMIT, struct drm_panfrost_submit)
>  #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFR=
OST_WAIT_BO, struct drm_panfrost_wait_bo)
> @@ -29,6 +30,7 @@ extern "C" {
>  #define DRM_IOCTL_PANFROST_GET_PARAM		DRM_IOWR(DRM_COMMAND_BASE + DRM_PA=
NFROST_GET_PARAM, struct drm_panfrost_get_param)
>  #define DRM_IOCTL_PANFROST_GET_BO_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM=
_PANFROST_GET_BO_OFFSET, struct drm_panfrost_get_bo_offset)
>  #define DRM_IOCTL_PANFROST_MADVISE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANF=
ROST_MADVISE, struct drm_panfrost_madvise)
> +#define DRM_IOCTL_PANFROST_SET_LABEL_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM=
_PANFROST_SET_LABEL_BO, struct drm_panfrost_set_label_bo)
> =20
>  /*
>   * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
> @@ -227,6 +229,24 @@ struct drm_panfrost_madvise {
>  	__u32 retained;       /* out, whether backing store still exists */
>  };
> =20
> +/**
> + * struct drm_panfrost_set_label_bo - ioctl argument for labelling Panfr=
ost BOs.
> + */
> +struct drm_panfrost_set_label_bo {
> +	/** @handle: Handle of the buffer object to label. */
> +	__u32 handle;
> +
> +	/**  @pad: MBZ. */
> +	__u32 pad;
> +
> +	/**
> +	 * @label: User pointer to a NUL-terminated string
> +	 *
> +	 * Length cannot be greater than 4096
> +	 */
> +	__u64 label;
> +};
> +
>  /* Definitions for coredump decoding in user space */
>  #define PANFROSTDUMP_MAJOR 1
>  #define PANFROSTDUMP_MINOR 0

