Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E8DB7B76
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 16:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864466F77E;
	Thu, 19 Sep 2019 14:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621C36F77E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:03:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6526B022;
 Thu, 19 Sep 2019 14:03:02 +0000 (UTC)
Subject: Re: [PATCH v2] drm/ioctl: Add a ioctl to label GEM objects
To: Rohan Garg <rohan.garg@collabora.com>, dri-devel@lists.freedesktop.org
References: <20190919125321.22880-1-rohan.garg@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <74b4cb8b-1bce-19d9-1022-aa5ed542e10c@suse.de>
Date: Thu, 19 Sep 2019 16:02:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919125321.22880-1-rohan.garg@collabora.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0097874538=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0097874538==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SqoMLgtP7uyIOs1IJXuQ2wT6QigxlHiwo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SqoMLgtP7uyIOs1IJXuQ2wT6QigxlHiwo
Content-Type: multipart/mixed; boundary="Bzv8GCyOY2S3QhBXYcu458L7Fp5Z7E3RA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rohan Garg <rohan.garg@collabora.com>, dri-devel@lists.freedesktop.org
Message-ID: <74b4cb8b-1bce-19d9-1022-aa5ed542e10c@suse.de>
Subject: Re: [PATCH v2] drm/ioctl: Add a ioctl to label GEM objects
References: <20190919125321.22880-1-rohan.garg@collabora.com>
In-Reply-To: <20190919125321.22880-1-rohan.garg@collabora.com>

--Bzv8GCyOY2S3QhBXYcu458L7Fp5Z7E3RA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 19.09.19 um 14:53 schrieb Rohan Garg:
> DRM_IOCTL_BO_SET_LABEL lets you label GEM objects, making it
> easier to debug issues in userspace applications.
>=20
> Changes in v2:
>   - Hoist the IOCTL up into the drm_driver framework
>=20
> Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem.c      | 64 ++++++++++++++++++++++++++++++++++=

>  drivers/gpu/drm/drm_internal.h |  4 +++
>  drivers/gpu/drm/drm_ioctl.c    |  1 +
>  include/drm/drm_drv.h          | 18 ++++++++++
>  include/drm/drm_gem.h          |  7 ++++
>  include/uapi/drm/drm.h         | 20 +++++++++++
>  6 files changed, 114 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 6854f5867d51..785ac561619a 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -941,6 +941,65 @@ drm_gem_release(struct drm_device *dev, struct drm=
_file *file_private)
>  	idr_destroy(&file_private->object_idr);
>  }
> =20
> +int drm_bo_set_label_ioctl(struct drm_device *dev, void *data,
> +		       struct drm_file *file_priv)
> +{
> +	struct drm_label_object *args =3D data;
> +
> +	if (!args->len || !args->name)
> +		return -EINVAL;
> +
> +	if (dev->driver->label)
> +		return dev->driver->label(dev, args, file_priv);
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +/**
> + * drm_gem_label - label a given GEM object
> + * @dev: drm_device for the associated GEM object
> + * @data: drm_label_bo struct with a label, label length and any relev=
ant flags
> + * @file_private: drm file-private structure to clean up
> + */
> +
> +int drm_gem_set_label(struct drm_device *dev, struct drm_label_object =
*args, struct drm_file *file_priv)

I'd like to set labels for internal GEM objects. Could you split off the
object update code into something that is easily callable from within
drivers? Something like

  // called by ioctl
  int drm_gem_object_adopt_label(struct drm_gem_object *gem,
        char *label)
  {
        // your object update code goes here
  }

  // called by drivers
  int drm_gem_object_set_label(struct drm_gem_object *gem,
        const char *label)
  {
	char* new_label =3D strdup(label)
	return drm_gem_object_adopt_label(gem, new_label);
  }


We have debugfs support for TTM-based GEM objects at [1]. I think the
label would be a welcome addition to the output.

Best regards
Thomas

[1]
https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/drm_gem_ttm=
_helper.c#n23

> +{
> +	struct drm_gem_object *gem_obj;
> +	int err =3D 0;
> +	char *label;
> +
> +	if (args->len > 0)
> +		label =3D strndup_user(u64_to_user_ptr(args->name), args->len);
> +
> +	gem_obj =3D drm_gem_object_lookup(file_priv, args->handle);
> +	if (!gem_obj) {
> +		DRM_ERROR("Failed to look up GEM BO %d\n", args->handle);
> +		err =3D -ENOENT;
> +		goto err;
> +	}
> +
> +	if ((args->len =3D=3D 0 && args->name =3D=3D NULL) || gem_obj->label)=
 {
> +		kfree(gem_obj->label);
> +		gem_obj->label =3D NULL;
> +	}
> +
> +	gem_obj->label =3D label;
> +
> +	drm_gem_object_put_unlocked(gem_obj);
> +
> +	if (IS_ERR(gem_obj->label)) {
> +		err =3D PTR_ERR(gem_obj->label);
> +		goto err;
> +	}
> +
> +err:
> +	if (err !=3D 0)
> +		args->flags =3D err;
> +
> +	return err;
> +}
> +
> +
>  /**
>   * drm_gem_object_release - release GEM buffer object resources
>   * @obj: GEM buffer object
> @@ -958,6 +1017,11 @@ drm_gem_object_release(struct drm_gem_object *obj=
)
> =20
>  	dma_resv_fini(&obj->_resv);
>  	drm_gem_free_mmap_offset(obj);
> +
> +	if (obj->label) {
> +		kfree(obj->label);
> +		obj->label =3D NULL;
> +	}
>  }
>  EXPORT_SYMBOL(drm_gem_object_release);
> =20
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_inter=
nal.h
> index 51a2055c8f18..8259622f9ab6 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -137,6 +137,10 @@ int drm_gem_pin(struct drm_gem_object *obj);
>  void drm_gem_unpin(struct drm_gem_object *obj);
>  void *drm_gem_vmap(struct drm_gem_object *obj);
>  void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
> +int drm_bo_set_label_ioctl(struct drm_device *dev, void *data,
> +			struct drm_file *file_priv);
> +int drm_gem_set_label(struct drm_device *dev, struct drm_label_object =
*args,
> +			struct drm_file *file_priv);
> =20
>  /* drm_debugfs.c drm_debugfs_crc.c */
>  #if defined(CONFIG_DEBUG_FS)
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index f675a3bb2c88..079d1422f9c5 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -709,6 +709,7 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D=
 {
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioct=
l, DRM_MASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM=
_MASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioct=
l, DRM_MASTER),
> +	DRM_IOCTL_DEF(DRM_IOCTL_BO_SET_LABEL, drm_bo_set_label_ioctl, DRM_REN=
DER_ALLOW),
>  };
> =20
>  #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE( drm_ioctls )
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 8976afe48c1c..f736ba1f42a6 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -715,6 +715,24 @@ struct drm_driver {
>  			    struct drm_device *dev,
>  			    uint32_t handle);
> =20
> +
> +	/**
> +	 * @label:
> +	 *
> +	 * This label's a buffer object.
> +	 *
> +	 * Called by the user via ioctl.
> +	 *
> +	 * The default implementation is drm_gem_label(). GEM based drivers
> +	 * must not overwrite this.
> +
> +	 * Returns:
> +	 *
> +	 * Zero on success, negative errno on failure.
> +	 */
> +	int (*label)(struct drm_device *dev, struct drm_label_object *args,
> +				struct drm_file *file_priv);
> +
>  	/**
>  	 * @gem_vm_ops: Driver private ops for this object
>  	 *
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 6aaba14f5972..f801c054e972 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -237,6 +237,13 @@ struct drm_gem_object {
>  	 */
>  	int name;
> =20
> +	/**
> +	 * @label:
> +	 *
> +	 * Label for this object, should be a human readable string.
> +	 */
> +	char *label;
> +
>  	/**
>  	 * @dma_buf:
>  	 *
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 8a5b2f8f8eb9..23b507f5c571 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -626,6 +626,25 @@ struct drm_gem_open {
>  	__u64 size;
>  };
> =20
> +/** struct drm_label_object - ioctl argument for labelling BOs.
> + *
> + * This label's a BO with a userspace label
> + *
> + */
> +struct drm_label_object {
> +	/** Handle for the object being labelled. */
> +	__u32 handle;
> +
> +	/** Label and label length.
> +	 *  length includes the trailing NULL.
> +	 */
> +	__u32 len;
> +	__u64 name;
> +
> +	/** Flags */
> +	int flags;
> +};
> +
>  #define DRM_CAP_DUMB_BUFFER		0x1
>  #define DRM_CAP_VBLANK_HIGH_CRTC	0x2
>  #define DRM_CAP_DUMB_PREFERRED_DEPTH	0x3
> @@ -946,6 +965,7 @@ extern "C" {
>  #define DRM_IOCTL_SYNCOBJ_QUERY		DRM_IOWR(0xCB, struct drm_syncobj_tim=
eline_array)
>  #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_t=
ransfer)
>  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_sy=
ncobj_timeline_array)
> +#define DRM_IOCTL_BO_SET_LABEL      DRM_IOWR(0xCE, struct drm_label_ob=
ject)
> =20
>  /**
>   * Device specific ioctls should only be in their respective headers
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--Bzv8GCyOY2S3QhBXYcu458L7Fp5Z7E3RA--

--SqoMLgtP7uyIOs1IJXuQ2wT6QigxlHiwo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2DipEACgkQaA3BHVML
eiOqzQf/XGotQhYZampneKPC+1dNAAyYrmqEkfMrzMkuevWfWR4bGXp38jgPHVsn
bIxA35fC/TTUffntmNnsjNGx8T+ot8XRDMXAU7GpbzwVZipAqDn7v9vkNSiNxHQX
lqnPd4gn4Pf5T+2wN/BVwqXmz/d01kOfvVnVVjU/ahHciHNK4zVENfBArB1gWBaX
zjy45GIcC7E/UeZDA88140RLlnivyhZho9MSgb/O4DJsUv+wozj/T8/bP2dEjrRN
lngOpGWNoHjdaEGbGNxYrc4WK+9cb4GouwHaHIJb/9wkzxIZE1Wtg9/GvmJwNN5o
bW1WVYfn7LEXPpbm7i1FkqUtvii1/g==
=pB+V
-----END PGP SIGNATURE-----

--SqoMLgtP7uyIOs1IJXuQ2wT6QigxlHiwo--

--===============0097874538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0097874538==--
