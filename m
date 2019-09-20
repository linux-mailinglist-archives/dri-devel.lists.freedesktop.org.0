Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 003A5B93EA
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 17:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6CC6E07D;
	Fri, 20 Sep 2019 15:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776826E07D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 15:25:14 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v8so7206448wrt.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 08:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2OZDiHmyOn9ewR9VGCEZrTP1SS2dxond5/aPpB/N4G0=;
 b=gSRNnnFXgZQlAcL85tv9tfwZ4mNNiKMOn4JJqkCu8uM6MLHWo3GbPB8YTyfgiUgppM
 d81PxW8VxYYwjt9+u5yyPwhAOcUseZ+Nwi7xjCHTIeDpY3Lu9RAPAHjdqS/Pm7zOtXV7
 M1RSQVVuttclSZsZC6V5LI7oRQCPR7J3Q7WUpX6jEhahUDz+8JuPcmlCt3LCebly9JCz
 4D162W8e6iSBk9e8EMX9f8W4IG9CXfiWbz5DWOS/jJp2PmWGAfZDb4GN1qzGJJdon05X
 ROb8UYRwB0ZKfzkUWq0N8ZF+bibx5DTkw6YxowhVNKtITTVXMbW/gUyQaXPW7fnj4Y4k
 dtOQ==
X-Gm-Message-State: APjAAAUP7H4TNWRyW64oGTtQD7KTRgWk3YqhocXwKTtVsXkNpjxlxSfm
 5WehQ6o42MW4aL4KxU8cvssk6v34
X-Google-Smtp-Source: APXvYqykekwFENFITeMzq1iansS46g68aJiKj1/Bn+D7w0klQj0IEQtgL0SUSXH4kyTFYeKOPZveXQ==
X-Received: by 2002:adf:e388:: with SMTP id e8mr12535249wrm.306.1568993112899; 
 Fri, 20 Sep 2019 08:25:12 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id q3sm3052487wru.33.2019.09.20.08.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 08:25:11 -0700 (PDT)
Date: Fri, 20 Sep 2019 17:25:10 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rohan Garg <rohan.garg@collabora.com>
Subject: Re: [PATCH v2] drm/ioctl: Add a ioctl to label GEM objects
Message-ID: <20190920152510.GB10973@ulmo>
References: <20190919125321.22880-1-rohan.garg@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20190919125321.22880-1-rohan.garg@collabora.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2OZDiHmyOn9ewR9VGCEZrTP1SS2dxond5/aPpB/N4G0=;
 b=TAKqLsAy+AguQfwRuckVShu0UvcdnwiWmtq9L7FR3N7KSGpEWnRFkPb9bnBYRdJLGh
 SJ3TOQu/aqIbCSb6nNcE6gl0h54nQlrKMJdFvsadaJPiVAymiXvecLmCLH/pqb2J1rpV
 SjUfABP91dSPbynWljdnWOAVNemj3MT8yPPcHUoePJnTZz1UaD8GpDJBDy2J8ZjMNDgm
 rJjkeYRwQ9lxH4IIGab1ZZ/+IAbq/89KX+/CbCWroIX0/EwakPeC5ZJz6L/9OlISsGFt
 ewI1LXEfDCoQdW186eSDzqiFG4Dno9vhfNNfm1HRgrArHaWFlMTEvLwsIiLFR1YzJQcE
 sutQ==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1200741328=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1200741328==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2019 at 02:53:21PM +0200, Rohan Garg wrote:
> DRM_IOCTL_BO_SET_LABEL lets you label GEM objects, making it
> easier to debug issues in userspace applications.
>=20
> Changes in v2:
>   - Hoist the IOCTL up into the drm_driver framework
>=20
> Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem.c      | 64 ++++++++++++++++++++++++++++++++++
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
> @@ -941,6 +941,65 @@ drm_gem_release(struct drm_device *dev, struct drm_f=
ile *file_private)
>  	idr_destroy(&file_private->object_idr);
>  }
> =20
> +int drm_bo_set_label_ioctl(struct drm_device *dev, void *data,
> +		       struct drm_file *file_priv)

Perhaps call this drm_gem_set_label_ioctl() so that it's consistent with
the other GEM related IOCTLs?

> +{
> +	struct drm_label_object *args =3D data;

Similarly, perhaps make this struct drm_gem_set_label for consistency.

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
> + * @data: drm_label_bo struct with a label, label length and any relevan=
t flags
> + * @file_private: drm file-private structure to clean up
> + */
> +
> +int drm_gem_set_label(struct drm_device *dev, struct drm_label_object *a=
rgs, struct drm_file *file_priv)

Function name doesn't match the kerneldoc.

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

People could abuse this to spam the system logs with these error
messages. Better make this DRM_DEBUG() or leave it out completely.

> +		err =3D -ENOENT;
> +		goto err;

I think you're leaking the label string here.

> +	}
> +
> +	if ((args->len =3D=3D 0 && args->name =3D=3D NULL) || gem_obj->label) {
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

Why don't you check for this earlier? That seems suboptimal because now
you've got some error value in gem_obj->label that you're going to have
to special case at every step of the way.

> +
> +err:
> +	if (err !=3D 0)
> +		args->flags =3D err;

Why the flags? We typically just return the error...

> +
> +	return err;

=2E.. like here.

> +}

Do we want to export this so that drivers can use it?

> +
> +
>  /**
>   * drm_gem_object_release - release GEM buffer object resources
>   * @obj: GEM buffer object
> @@ -958,6 +1017,11 @@ drm_gem_object_release(struct drm_gem_object *obj)
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
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_interna=
l.h
> index 51a2055c8f18..8259622f9ab6 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -137,6 +137,10 @@ int drm_gem_pin(struct drm_gem_object *obj);
>  void drm_gem_unpin(struct drm_gem_object *obj);
>  void *drm_gem_vmap(struct drm_gem_object *obj);
>  void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
> +int drm_bo_set_label_ioctl(struct drm_device *dev, void *data,
> +			struct drm_file *file_priv);
> +int drm_gem_set_label(struct drm_device *dev, struct drm_label_object *a=
rgs,
> +			struct drm_file *file_priv);

This one seems to be unused now.

> =20
>  /* drm_debugfs.c drm_debugfs_crc.c */
>  #if defined(CONFIG_DEBUG_FS)
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index f675a3bb2c88..079d1422f9c5 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -709,6 +709,7 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl,=
 DRM_MASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_M=
ASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl,=
 DRM_MASTER),
> +	DRM_IOCTL_DEF(DRM_IOCTL_BO_SET_LABEL, drm_bo_set_label_ioctl, DRM_RENDE=
R_ALLOW),
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

Spurious blank line.

> +	 * Returns:
> +	 *
> +	 * Zero on success, negative errno on failure.
> +	 */
> +	int (*label)(struct drm_device *dev, struct drm_label_object *args,
> +				struct drm_file *file_priv);

If I understand correctly, you use this so that non-GEM drivers can use
this IOCTL to label their non-GEM objects. Do you think that's really
useful? I mean they've already got quite a bit of special code to deal
with their objects, so singling out this IOCTL seems a bit odd.

Then again, I guess it doesn't really hurt since GEM-based drivers will
always use the standard implementation.

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

Nit: I think you mean "trailing NUL". Also, the parameter is called len
below, so the comment here should match.

Thierry

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
>  #define DRM_IOCTL_SYNCOBJ_QUERY		DRM_IOWR(0xCB, struct drm_syncobj_timel=
ine_array)
>  #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_tra=
nsfer)
>  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_sync=
obj_timeline_array)
> +#define DRM_IOCTL_BO_SET_LABEL      DRM_IOWR(0xCE, struct drm_label_obje=
ct)
> =20
>  /**
>   * Device specific ioctls should only be in their respective headers
> --=20
> 2.17.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2E71MACgkQ3SOs138+
s6EBiQ/+OcKfLXO9g3YigRDU2BQq+5tvfEdOzOnnpYXSaHGf35+y2hSBzADNGYRW
r003O4/lh6doWEwv35oMw/GvMjHHsEtBPCj3G+t1j8GVVtT5hshYnCtifkvPQDtd
q5g2IgNKBJHADaW+kBgNgrAj1BjNP73jxSk7yFg9UEPQw0U8eBVxFoOiMzizVEpn
BSZk6KUYj/C50UjYDCoKajf5G7Xe/uSaBOdPRzhjKTvBumlyAqhZtMf3fSM8mQ4N
Xt/clJdvVmF66kIl4GbTDi6JqzYfK5Vyla95mm3x2Y7m8Ff3YCoAem3kd7vz8tLN
5SVuwgTfzDVM+x4+1CE/mPpe1AlY232G3yTLNVfxveP76g1RVJYtwc/4HE94076U
JXnQHsrlrq77EeLkhyLnxu1rA8o2fBKTwDCmQphcfb5uf4pSUqffa8lIrbkrXzGo
B5cFaG6OjCpOJSjfXMJjrrBZIajdjHt8Y+w7JmKdElIpdV2Blpuku7LWMeVupN4q
xTdH4gTYZfbOc1Cq0RNmpJVE/TDA0w9g9AHx74ODbMB+mMrunalzLoLpmGVyPVuA
8g2jqmei1oKFWO1jVXn97+58b0VGWzkRJDmZCOaNwAAjMp1P7uGvAjZl2ZK5N9wo
Zh0VvdOeSJkbsTOTisDgbnlLkR2Qpx58V4gxAmD0/reWU2tiazQ=
=QJQU
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--

--===============1200741328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1200741328==--
