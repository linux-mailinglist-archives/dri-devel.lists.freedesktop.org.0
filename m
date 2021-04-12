Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDD935BB29
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 09:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BE56E212;
	Mon, 12 Apr 2021 07:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616856E212;
 Mon, 12 Apr 2021 07:48:00 +0000 (UTC)
IronPort-SDR: G+j5NjifjokqSTxhgVW5xNoqo1JEUsda8zp2eu/J8BXgXLYpdbZgAMZkv7OhsmUYwd/qFnBPeY
 QXrrFlrNM1iw==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="173625912"
X-IronPort-AV: E=Sophos;i="5.82,214,1613462400"; 
 d="asc'?scan'208";a="173625912"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 00:47:58 -0700
IronPort-SDR: 1TpkL28efSw0cHc07kh2o8zjawf5ljtqE1Knhru2s7ZEuLVH0to8FAh+QIt/+dXEkJL2TRHxPe
 PCPZUZ+5Gccg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,214,1613462400"; 
 d="asc'?scan'208";a="423686447"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga008.jf.intel.com with ESMTP; 12 Apr 2021 00:47:51 -0700
Date: Mon, 12 Apr 2021 15:30:06 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 16/18] vfio/gvt: Use mdev_get_type_group_id()
Message-ID: <20210412073006.GD1551@zhen-hp.sh.intel.com>
References: <0-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
 <16-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <16-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, David Airlie <airlied@linux.ie>,
 Leon Romanovsky <leonro@nvidia.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>,
 Tarun Gupta <targupta@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1408915437=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1408915437==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8WA4ILJSyYAmUzbY"
Content-Disposition: inline


--8WA4ILJSyYAmUzbY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.04.06 16:40:39 -0300, Jason Gunthorpe wrote:
> intel_gvt_init_vgpu_type_groups() makes gvt->types 1:1 with the
> supported_type_groups array, so the type_group_id is also the index into
> gvt->types. Use it directly and remove the string matching.
>=20
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

For two gvt specific changes in this series, it's better to just merge thro=
ugh
vfio tree.

Thanks

>  drivers/gpu/drm/i915/gvt/gvt.c   | 24 +++++++-----------------
>  drivers/gpu/drm/i915/gvt/gvt.h   |  4 ++--
>  drivers/gpu/drm/i915/gvt/kvmgt.c |  5 ++---
>  3 files changed, 11 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gv=
t.c
> index d1d8ee4a5f16a3..4b47a18e9dfa0f 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.c
> +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> @@ -46,22 +46,12 @@ static const char * const supported_hypervisors[] =3D=
 {
>  	[INTEL_GVT_HYPERVISOR_KVM] =3D "KVM",
>  };
> =20
> -static struct intel_vgpu_type *intel_gvt_find_vgpu_type(struct intel_gvt=
 *gvt,
> -		const char *name)
> +static struct intel_vgpu_type *
> +intel_gvt_find_vgpu_type(struct intel_gvt *gvt, unsigned int type_group_=
id)
>  {
> -	const char *driver_name =3D
> -		dev_driver_string(&gvt->gt->i915->drm.pdev->dev);
> -	int i;
> -
> -	name +=3D strlen(driver_name) + 1;
> -	for (i =3D 0; i < gvt->num_types; i++) {
> -		struct intel_vgpu_type *t =3D &gvt->types[i];
> -
> -		if (!strncmp(t->name, name, sizeof(t->name)))
> -			return t;
> -	}
> -
> -	return NULL;
> +	if (WARN_ON(type_group_id >=3D gvt->num_types))
> +		return NULL;
> +	return &gvt->types[type_group_id];
>  }
> =20
>  static ssize_t available_instances_show(struct kobject *kobj,
> @@ -71,7 +61,7 @@ static ssize_t available_instances_show(struct kobject =
*kobj,
>  	unsigned int num =3D 0;
>  	void *gvt =3D kdev_to_i915(dev)->gvt;
> =20
> -	type =3D intel_gvt_find_vgpu_type(gvt, kobject_name(kobj));
> +	type =3D intel_gvt_find_vgpu_type(gvt, mtype_get_type_group_id(kobj));
>  	if (!type)
>  		num =3D 0;
>  	else
> @@ -92,7 +82,7 @@ static ssize_t description_show(struct kobject *kobj, s=
truct device *dev,
>  	struct intel_vgpu_type *type;
>  	void *gvt =3D kdev_to_i915(dev)->gvt;
> =20
> -	type =3D intel_gvt_find_vgpu_type(gvt, kobject_name(kobj));
> +	type =3D intel_gvt_find_vgpu_type(gvt, mtype_get_type_group_id(kobj));
>  	if (!type)
>  		return 0;
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 03c993d68f105a..0cf480f42850d2 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -569,8 +569,8 @@ struct intel_gvt_ops {
>  	void (*vgpu_reset)(struct intel_vgpu *);
>  	void (*vgpu_activate)(struct intel_vgpu *);
>  	void (*vgpu_deactivate)(struct intel_vgpu *);
> -	struct intel_vgpu_type *(*gvt_find_vgpu_type)(struct intel_gvt *gvt,
> -			const char *name);
> +	struct intel_vgpu_type *(*gvt_find_vgpu_type)(
> +		struct intel_gvt *gvt, unsigned int type_group_id);
>  	bool (*get_gvt_attrs)(struct attribute_group ***intel_vgpu_type_groups);
>  	int (*vgpu_query_plane)(struct intel_vgpu *vgpu, void *);
>  	int (*vgpu_get_dmabuf)(struct intel_vgpu *vgpu, unsigned int);
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index b4348256ae9591..16e1e4a38aa1f6 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -700,10 +700,9 @@ static int intel_vgpu_create(struct kobject *kobj, s=
truct mdev_device *mdev)
>  	pdev =3D mdev_parent_dev(mdev);
>  	gvt =3D kdev_to_i915(pdev)->gvt;
> =20
> -	type =3D intel_gvt_ops->gvt_find_vgpu_type(gvt, kobject_name(kobj));
> +	type =3D intel_gvt_ops->gvt_find_vgpu_type(gvt,
> +						 mdev_get_type_group_id(mdev));
>  	if (!type) {
> -		gvt_vgpu_err("failed to find type %s to create\n",
> -						kobject_name(kobj));
>  		ret =3D -EINVAL;
>  		goto out;
>  	}
> --=20
> 2.31.1
>=20

--8WA4ILJSyYAmUzbY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYHP2/gAKCRCxBBozTXgY
J/khAJ9CUg20EmSdCuvke4qjplEgpJzVHQCfQRc3dCuaoe5B0patPbza7P190CY=
=tRnQ
-----END PGP SIGNATURE-----

--8WA4ILJSyYAmUzbY--

--===============1408915437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1408915437==--
