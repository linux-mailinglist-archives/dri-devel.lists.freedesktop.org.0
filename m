Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9599EE2F4B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 12:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D566E227;
	Thu, 24 Oct 2019 10:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61CB6E226;
 Thu, 24 Oct 2019 10:43:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g24so2239739wmh.5;
 Thu, 24 Oct 2019 03:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pdyyflbsTfc80kcXiRl5w9Rkm+kwovm66WV1jNmysKc=;
 b=UuzCK24f6EL2LB9CrOwwbtJkyLs8a/iqZhDghOWWrqH2sIDVH0BzfIkat10XN6CO0L
 SdIU4jHVNdZGHokHlMi6m7XC+DbSRMSnC14KoPJBOKhxjf02fuLQbC20Ir+Gkl3bjtch
 jpvNU5vyJoH5eGhsAthymOv2KzuNUaAJjNZw2ssiwNxGA6/faMUWyqdyucrTpYNEploA
 nzJXocc+Cn41NwNpvtLpxTccLMP9prCa+uiGRfcYMbURicuqcL49V3dlkkCv0dVcgX2a
 scgqLtJodULHcSadzYOFcHnO1yWO5OvmM4ylwTwRATrOOVNmgTN5EQhN+Rr7qCnsCBN9
 tVaw==
X-Gm-Message-State: APjAAAVv64OhDbAZYkQyFLadSyaw9Mx4E9EfeQLWDRZ1PQmQFo+6zvPb
 SRnYjIGfC7+tAe2ztZHlMEk=
X-Google-Smtp-Source: APXvYqyihsmK83dpE9xlfy5Oz4ufzhOoZ/9p0EpO6X0Yb2FHhQTL+jCwgDJd/YFRRmHnyM7r33ZOxA==
X-Received: by 2002:a1c:2884:: with SMTP id o126mr4596059wmo.153.1571913810231; 
 Thu, 24 Oct 2019 03:43:30 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id 6sm2366761wmd.36.2019.10.24.03.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 03:43:29 -0700 (PDT)
Date: Thu, 24 Oct 2019 12:43:28 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/property: Enforce more lifetime rules
Message-ID: <20191024104328.GD2825247@ulmo>
References: <20191023144953.28190-1-daniel.vetter@ffwll.ch>
 <20191024104055.GC2825247@ulmo>
MIME-Version: 1.0
In-Reply-To: <20191024104055.GC2825247@ulmo>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pdyyflbsTfc80kcXiRl5w9Rkm+kwovm66WV1jNmysKc=;
 b=NWis688YlrK1giWhRdrZVdcKI4xGQ1eFvf/CHo8xCtUTvfKAQxWe6zLUba+cRv2syC
 S7mbz4ewb9uO4nW/sUQsR/7ildA1vTvQ2Jp9NlzQLVwKxcmmy16kMztUxqhPFVJCBM7l
 z3Uu1MsT2ZSQTC47rD7gOErigvhuKCM7pkVv8WuWdD2/6WVucVuZxjiiwHePLliy85TR
 u/HiP2QoJdSH0/NAubFfecY0zql4S0L7TU56nA1TtVFQXFllAEPd/l4Q7wwOWXUnelac
 df3y7VrbhC3iaWXqRDDQyk2v/Vn94pCEhnYqV3yiYEG1djKwcPYh4+SVUbLufjyfeHr4
 HIDw==
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
Content-Type: multipart/mixed; boundary="===============1889630937=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1889630937==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Content-Disposition: inline


--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 12:40:55PM +0200, Thierry Reding wrote:
> On Wed, Oct 23, 2019 at 04:49:52PM +0200, Daniel Vetter wrote:
> > Properties can't be attached after registering, userspace would get
> > confused (no one bothers to reprobe really).
> >=20
> > - Add kerneldoc
> > - Enforce this with some checks. This needs a somewhat ugly check
> >   since connectors can be added later on, but we still need to attach
> >   all properties before they go public.
> >=20
> > Note that we already enforce that properties themselves are created
> > before the entire device is registered.
> >=20
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Rajat Jain <rajatja@google.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_mode_object.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mo=
de_object.c
> > index 6a23e36ed4fe..35c2719407a8 100644
> > --- a/drivers/gpu/drm/drm_mode_object.c
> > +++ b/drivers/gpu/drm/drm_mode_object.c
> > @@ -224,12 +224,26 @@ EXPORT_SYMBOL(drm_mode_object_get);
> >   * This attaches the given property to the modeset object with the giv=
en initial
> >   * value. Currently this function cannot fail since the properties are=
 stored in
> >   * a statically sized array.
> > + *
> > + * Note that all properties must be attached before the object itself =
is
> > + * registered and accessible from userspace.
> >   */
> >  void drm_object_attach_property(struct drm_mode_object *obj,
> >  				struct drm_property *property,
> >  				uint64_t init_val)
> >  {
> >  	int count =3D obj->properties->count;
> > +	struct drm_device *dev =3D property->dev;
> > +
> > +
> > +	if (obj->type =3D=3D DRM_MODE_OBJECT_CONNECTOR) {
> > +		struct drm_connector *connector =3D obj_to_connector(obj);
> > +
> > +		WARN_ON(!dev->driver->load &&
> > +			connector->registration_state =3D=3D DRM_CONNECTOR_REGISTERED);
> > +	} else {
> > +		WARN_ON(!dev->driver->load && dev->registered);
> > +	}
>=20
> I'm not sure I understand why dev->driver->load needs to be a special
> case. Don't the same rules apply for those drivers as well?

Nevermind, I just noticed that drm_dev_register() sets dev->registered
to true before calling the driver's ->load() implementation, so makes
sense:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xgE8ACgkQ3SOs138+
s6GoHRAAt5SgmFydTcDRVGtoNHviA8Vkk7JcGJhQeI0WqxCo/W/ExFL2Fp073Gw6
5qAHcPQeSfZLTaDPcjrW7GYphPNjRqxk4SgOdZBx+XojugjZpfl1dOov859Q74KI
IQoVdyvCykfRTV0q8IeQKhP8iG8pOR8xctUSYfXBpHf6ofM6BPakZ/m0Tyjg8JL/
lZTzrmAs1o3Ibn3VPkYj6nPWV6JqjBWVJbHXMHATvOSuRFtNjGMS5kxauLem49lT
ZasJ/GS3OMmY0/9d2Ig0dVYslMbiJSJ45jFIOOn0Ui8ypPyz3eSQeOu0CwLPWetP
cS/B+EwIGWxsVNcLKtJG3EkJcn8PhNvPJ50S5QczvwvewGjuGyL+sSZPqczDwnDQ
BGnfI3HiUVG4lnl9ZI0+n+z7bz4IX98ayApdN0hmuO2GqdrWnxdhpzEqA2H6dcCp
FGEPsfg0LFRHzv/JhJStneXsfaiPYbnkLW1EfiihmV6UcNgTzmyw3bKlTdQkBCHs
fWvzXxswRgH5+XelGr6bpLY4ONkE1jQUGK24tYyKv8KbrsCnkjgh92OkD6APCfDP
xk2guviDzbLcrBxb2sVwKqQmxiHZeaH17IQ8H2/AFKOI/trGOOaFFco2jz4JZdN1
icEDKgLf5Y06PseJTrGarrRt1+lMqfZNyPnGw1IPW9REJKuHNb4=
=99+O
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--

--===============1889630937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1889630937==--
