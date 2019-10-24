Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1DCE2F41
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 12:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AA76E225;
	Thu, 24 Oct 2019 10:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5D76E221;
 Thu, 24 Oct 2019 10:40:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c2so20259526wrr.10;
 Thu, 24 Oct 2019 03:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VYH3uk/OA0VCb8L6LYUadY8bkyeEqe533iRXkfv2fac=;
 b=r30iEhzYf/nBpGNzpfKNxsIVmvLqnkfoZd0cen98XMft5lm08A/wSD/e8/mi1ivMHv
 oBgHA2BMxDigHrsjesqf4MeNmyqRiI6EJJi+HLGwdQIJ5B7d6zyDAHa8IukOxL5p6bDU
 Wludb7EYoCgggiY2c8ZmLQOvzJO4QdYOw2YE4QCWX/UF7IOU/XBCmee5sYdIbbfCfSUQ
 v2r9JaLh5YfInR6LC8yWTX6P8zwDHBhJLqRZz3hYoep34wc7YvhQe759qqtbRhxfBgt4
 0us5RSDwc3Z+hXaJ5kSohr53yQCqbD5TuxzcstE6rk3j/aOdD5gbRVMf+R8C409cxsSR
 JcgA==
X-Gm-Message-State: APjAAAV+JxQ3/3o/+vgO5stcrljsrZY3hgvxyHHqwNaP/vsGQgWnlYqr
 lXA89eH/IUat38A1s/k1TWg=
X-Google-Smtp-Source: APXvYqz9KRo3NE3wAdLP+gl+yPbSJt9aJTtPDQDxtiZn2wTLOCjGvT0B7u2uKxwqBlozuAOdfdE8LA==
X-Received: by 2002:a5d:6246:: with SMTP id m6mr3358445wrv.262.1571913658182; 
 Thu, 24 Oct 2019 03:40:58 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id c16sm12287631wrw.32.2019.10.24.03.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 03:40:56 -0700 (PDT)
Date: Thu, 24 Oct 2019 12:40:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/property: Enforce more lifetime rules
Message-ID: <20191024104055.GC2825247@ulmo>
References: <20191023144953.28190-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20191023144953.28190-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VYH3uk/OA0VCb8L6LYUadY8bkyeEqe533iRXkfv2fac=;
 b=SAHXRs88l8fzGKi6Q+VkzvfpeXv+WvRVtz2HSK3Ky5ax+SvbeoKvu43WbXo8bCDAor
 DhroDTPbkAEBwQu6wgFnTn4C4r5E3vcEuALjSHDQYZ5RmRoxltzOPF78IYHutw53GPzx
 hg+NsMozei0bKKdGUZbx6EZUmmAiO9ko+sCugx/vS7UDcU11uTSu/jSDEuzHDEz5p+zo
 vZDGEDqyTcZ7IitfH/9WPyDxHtPkoRz8E+nR/PGXeUQssNYdtVm3gzueohcymbIartNC
 l33F9MP4QS7xK6LqlH3l4gaL0DBtsMBckgYY5NkPtM9E3MOJXxEZ3eAEpv86iXk/6tnN
 aDPw==
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rajat Jain <rajatja@google.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0730669270=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0730669270==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2019 at 04:49:52PM +0200, Daniel Vetter wrote:
> Properties can't be attached after registering, userspace would get
> confused (no one bothers to reprobe really).
>=20
> - Add kerneldoc
> - Enforce this with some checks. This needs a somewhat ugly check
>   since connectors can be added later on, but we still need to attach
>   all properties before they go public.
>=20
> Note that we already enforce that properties themselves are created
> before the entire device is registered.
>=20
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Rajat Jain <rajatja@google.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_mode_object.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode=
_object.c
> index 6a23e36ed4fe..35c2719407a8 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -224,12 +224,26 @@ EXPORT_SYMBOL(drm_mode_object_get);
>   * This attaches the given property to the modeset object with the given=
 initial
>   * value. Currently this function cannot fail since the properties are s=
tored in
>   * a statically sized array.
> + *
> + * Note that all properties must be attached before the object itself is
> + * registered and accessible from userspace.
>   */
>  void drm_object_attach_property(struct drm_mode_object *obj,
>  				struct drm_property *property,
>  				uint64_t init_val)
>  {
>  	int count =3D obj->properties->count;
> +	struct drm_device *dev =3D property->dev;
> +
> +
> +	if (obj->type =3D=3D DRM_MODE_OBJECT_CONNECTOR) {
> +		struct drm_connector *connector =3D obj_to_connector(obj);
> +
> +		WARN_ON(!dev->driver->load &&
> +			connector->registration_state =3D=3D DRM_CONNECTOR_REGISTERED);
> +	} else {
> +		WARN_ON(!dev->driver->load && dev->registered);
> +	}

I'm not sure I understand why dev->driver->load needs to be a special
case. Don't the same rules apply for those drivers as well?

Thierry

> =20
>  	if (count =3D=3D DRM_OBJECT_MAX_PROPERTY) {
>  		WARN(1, "Failed to attach object property (type: 0x%x). Please "
> --=20
> 2.23.0
>=20
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xf7cACgkQ3SOs138+
s6Eqyg//X8jV9x+ptZswm38ia70GCzqBDpS0lXvc7gkope9PX4W+LlQqRi+crgiP
XdFyEg34nm7asdjIWimmnyUp8w00zH+KX3n+J3D4tSPnjn1pl91vKBQbLA4/nIjC
bBkMhvZB5HZhoR+Z8peJLDnWuIlDqSr2lJe8Afi6SupUtVauQgDzmtXUTBLF4HxF
nGS72jAYYfLKTVyjdGtw1Xww6DOq+Iwcdy9BrLl4k+ft05s0VoCCSoGWLMcI9jY5
fW9v9h6XbgnErJ9lJ5Mjkdm+33JbKR4oE3+QpLR1ADhJWWrjY6WtUOlcQSrjOFOG
DIKZal+/9ScFbhZOCxN+GTlNZGE0Un2Ay2ARcQIBxYEYxro8jDf+jEnvuito9GKa
N6+ljAWgGHYoeGeX32tMEqxlGPTV6lH3OrFSvs4A2h9foNmker8jHMGCBCWY+QgN
miCD5EwnhxxDnyKqEUY+/VMWjJ+l+n3ciAH0QG4zSu+pGUpMW+IlTiWsgdeMWj10
QtsQ/5YU4KueDyQDM/w3HznmXmpuKzuMeOF8U178tjcz2lGmiVapUNGGqCAzYW9F
Nl2bPkipOxN5rwnzXoOcJw5ah3fAO2u4R8XRxQLZzsg2L9rsciOEW2BUtnjemjit
ngZSiI3YrFdXu6q2MQMu20LYYUtwvejcPH/y41HeTf+KQjqHhR4=
=glqR
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--

--===============0730669270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0730669270==--
