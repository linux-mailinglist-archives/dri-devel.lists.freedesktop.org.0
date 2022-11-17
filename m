Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D30562D518
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 09:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B8410E564;
	Thu, 17 Nov 2022 08:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E0710E57A;
 Thu, 17 Nov 2022 08:35:26 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id l12so1663266lfp.6;
 Thu, 17 Nov 2022 00:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ObVsXIII727K1r+MqdiusoodIGGIxFl3h6+GPMS0wE8=;
 b=cE51cSRMa45SarWkZhO/5XKMv3DcJ+oMgdt4vk6lK6fKU/dIOhPci3EohB1k8fT/ao
 GzZRdTx8FbBUz8KW5m7s1ggtpZErA0JL/6mYdq8oHU799zzME1V/BlzZVjYeQDd3861t
 cVGtVfrfVmgTqT3ajckukgx+xSgJkbF3qsUNpyuPkISv8fkQNfWIBdh5xffuhN9o/6AL
 vlIp5o8/mzuoXoHvqGnY6d23ZY01J+qeE87EORYD4GZ6KE01odakzKUGfSbN+m2AB0lX
 4O0ISZI9oGoB+SA19l6EGDxRjDKp4DyY0oBfHrQ2brwtXV7ajKVOZrz42NAEE6mJaT+f
 Z6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ObVsXIII727K1r+MqdiusoodIGGIxFl3h6+GPMS0wE8=;
 b=R+jYnqu2V8beyygjhqMh+ubd+OGy7s83v4EKm7sHmtJGJ+qSiffe84yKRCAa9t1dRL
 2ZpgqmcVyc9TrUhIHKiHXDI6G6zkX/m5LWE9S968Ec1jj3EZJK+IK+1+c/23G+NZsKWF
 918GDuvRAFkKc0lpahTaXr6hiSqYayjXaBL47TCxUuVDEofxtBoPJKN8h45BgkqCsjBy
 mkSB+wU2tBUtreMZPpn1rucoPgWwb4dyIIM75MUMsKP+lEFZ4Opmsvywh3xw1tFWManW
 F+9JaEEzA3kFOG8qecuDGRN0Ntml92aQYs20oq+Rw+HtZsJxB4xgAenumW2AVaME5Z+e
 Oc6Q==
X-Gm-Message-State: ANoB5pke1GvAj4hwuGihZCp36JGLsBtnpt1Kp/xDCb97J3PXUFFEdSsh
 Fq3RCfkHrHqUBa8vK+arBY8=
X-Google-Smtp-Source: AA0mqf7b8CdZSOPpH2MdVy1M65rNORSFFxiOBOl3Z44EfZJKVcaQQUdMi2wBF0uJhjvLqjqloDbj/w==
X-Received: by 2002:a05:6512:2382:b0:4a2:70de:3546 with SMTP id
 c2-20020a056512238200b004a270de3546mr497627lfv.420.1668674124421; 
 Thu, 17 Nov 2022 00:35:24 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 s5-20020a056512214500b004b07cdef19csm41260lfr.138.2022.11.17.00.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 00:35:24 -0800 (PST)
Date: Thu, 17 Nov 2022 10:35:14 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/atomic: add quirks for blind save/restore
Message-ID: <20221117103514.47dedae9@eldfell>
In-Reply-To: <20221117075433.222968-1-contact@emersion.fr>
References: <20221117075433.222968-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HROJ3e51QhiPDf5SAysJvFG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/HROJ3e51QhiPDf5SAysJvFG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Nov 2022 07:54:40 +0000
Simon Ser <contact@emersion.fr> wrote:

> Two quirks to make blind atomic save/restore [1] work correctly:
>=20
> - Mark the DPMS property as immutable for atomic clients, since
>   atomic clients cannot change it.
> - Allow user-space to set content protection to "enabled", interpret
>   it as "desired".
>=20
> [1]: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/3794
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>

That seems to be the sensible thing to do to these properties.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

I'm really to happy see wlroots doing this. This has been in my mind to
do in Weston for years, but never had the chance to implement it yet. I
have just one little detail different: I would snapshot the "original"
KMS state at Weston start-up only once, and then use that snapshot as
the base every time Weston needs to sanitize the KMS state, like when
re-gaining DRM master. It's a bit more complicated, but it goes better
with the idea of resetting KMS state or starting from clean state, in
case KMS ever gains UAPI for that.


Thanks,
pq

> ---
>=20
> I don't have the motivation to write IGT tests for this.
>=20
>  drivers/gpu/drm/drm_atomic_uapi.c | 5 +++--
>  drivers/gpu/drm/drm_property.c    | 7 +++++++
>  2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index c06d0639d552..95363aac7f69 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -741,8 +741,9 @@ static int drm_atomic_connector_set_property(struct d=
rm_connector *connector,
>  		state->scaling_mode =3D val;
>  	} else if (property =3D=3D config->content_protection_property) {
>  		if (val =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> -			drm_dbg_kms(dev, "only drivers can set CP Enabled\n");
> -			return -EINVAL;
> +			/* Degrade ENABLED to DESIRED so that blind atomic
> +			 * save/restore works as intended. */
> +			val =3D DRM_MODE_CONTENT_PROTECTION_DESIRED;
>  		}
>  		state->content_protection =3D val;
>  	} else if (property =3D=3D config->hdcp_content_type_property) {
> diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_propert=
y.c
> index dfec479830e4..dde42986f8cb 100644
> --- a/drivers/gpu/drm/drm_property.c
> +++ b/drivers/gpu/drm/drm_property.c
> @@ -474,7 +474,14 @@ int drm_mode_getproperty_ioctl(struct drm_device *de=
v,
>  		return -ENOENT;
> =20
>  	strscpy_pad(out_resp->name, property->name, DRM_PROP_NAME_LEN);
> +
>  	out_resp->flags =3D property->flags;
> +	if (file_priv->atomic && property =3D=3D dev->mode_config.dpms_property=
) {
> +		/* Quirk: indicate that the legacy DPMS property is not
> +		 * writable from atomic user-space, so that blind atomic
> +		 * save/restore works as intended. */
> +		out_resp->flags |=3D DRM_MODE_PROP_IMMUTABLE;
> +	}
> =20
>  	value_count =3D property->num_values;
>  	values_ptr =3D u64_to_user_ptr(out_resp->values_ptr);


--Sig_/HROJ3e51QhiPDf5SAysJvFG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmN18kIACgkQI1/ltBGq
qqe8hA//XIzWlpbrx8nM5SGBZ+6PnYm7qxvRE++OJcr6+OnQqpmGJKSc4/re+a+7
iAxEr/k58kW1eMDZde4AgEuSjnWPCg3HYWUOyXjyJuHq4PIeGL+7cG2i6qzfJd2r
i84bdhf91GEmI2AbtGMbKC8/C6DF65CVMrmwL5DkzZfu2ivwSh8w4iyXrW0i/7MO
MY/KpiITiPW2mGFsmwMjA1cNhgYEH0GWNcYEqQ4tkMM8kRXJVcXpi7ssThUL/Jx9
I5jXlyFDMrKxD1CE7TaaCH9WzFXlRDl4D4pS9h2lYSYc/wGqH1/wsaWOldfhafVe
MarItZFNZNzSxxswEoxhpD14LsHcWeJyIjNRKKM3Cj0vh8rQuaKOKS7WGQMYccLh
2jYxF7Tq+7JpmmsMz+n2i/N1gyeouafafIxx3+rQYDAuz4DLw6qf5GUAdepsYrjm
GGF7OXzrxF79iq6k2v4KgTsoutGwhkIm5EiwSP31fpBBHURu8hXV3+R37YlfAz3F
teiqYwSiw9j60RyBOaT3izdSA4nvk4nj8zdWaA2IkzVgxdRkAmJAxbl80DZVl0Eq
Wm7ao1Jmesjq4RCs4uPMXP63RajWKuSDn3cNAaCfh2TxG0Wez5c6HW2L8mo0pe/R
wPuSmTHVcWm2xbjnnDqUbMElmnPpoZhkD6zAYkUbYrWZfI3Qeq4=
=Q08p
-----END PGP SIGNATURE-----

--Sig_/HROJ3e51QhiPDf5SAysJvFG--
