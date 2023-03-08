Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B036B02B3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0A410E5DA;
	Wed,  8 Mar 2023 09:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A992910E06A;
 Wed,  8 Mar 2023 09:19:56 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id z42so15834579ljq.13;
 Wed, 08 Mar 2023 01:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678267195;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Jsa4k0Q27Z2jrXWpJJwbGeRZ1J9wE6m0cu7n4+3Tcfs=;
 b=KCZJJea7y2PQ5XTqFw4e/QseuXBRkmLrf1w5S388zEroTtCcCawP8vNnPCxiU5GLMS
 OEJwFh9HAgOYxaUXZpHfpxGy8fUxz2GKxNzH2ITlaQmSCVI8M7zf4QOgJsGuAeetm658
 2Dysi5C/Y5lGD/nfd9RQj/3MJChFuUtmIteIxRalEriw6515mzI8rRvR1Zou6XlQKml6
 TtLPDcDktRVaJiM+rb7Tj8H2lkkv9NkrZudsdpqPL+a+h9P7JLEo/+StUDLrKBts3JKm
 sZBc7xYiKsjDC7m85ux0gWNwBkdW2bZCsIOVEdDPld2uZCqLDvWMuiPS5+UWSp78ql7x
 y8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678267195;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jsa4k0Q27Z2jrXWpJJwbGeRZ1J9wE6m0cu7n4+3Tcfs=;
 b=RwNIKh4a7GDkgZMI+A2yYrv2pTqM3qhqg5NDuP8fHhEgRtRCBV1JY97R+2qrjQKV2i
 Udsx2TczOwBZVGQTAsj9IvPpwkSQjcX0uNGqsaNVDcI/cOCfz4/2SESq2UaC2E2jpy9Z
 burSZTJc5+Ngo7eiu0FXzvkD67SYwKY2sX5eREtqJQAgfupYCCV7U06bO/Bztez8jjNz
 VmrLUJejIwm58+LruZFWxZq3L4s+fvDOjMcRY+8Inr8txc9SWKJX1lrzbon9GaucyIkp
 UH+GQITbmAXh/LsqVXAYL8Yq7y/aIomgpgt/Lu9QOl1eqQIIoJzkQwQr2HlLhly+esQo
 QObQ==
X-Gm-Message-State: AO0yUKXObHfyREV0HDwjXugtjexxIUtnkAtCL3M+2Bld8I/eQqNudiZe
 CiAgpjCWu3TOC90weThyKDg=
X-Google-Smtp-Source: AK7set92OM1hFQmwpCxUs+d+J1D4AztRytLyzG5KH/QuTXqGlGH960mazO/aThblArzfMKHZPmBEuw==
X-Received: by 2002:a2e:a3d7:0:b0:290:6c15:ee26 with SMTP id
 w23-20020a2ea3d7000000b002906c15ee26mr4715204lje.31.1678267194632; 
 Wed, 08 Mar 2023 01:19:54 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e8756000000b002986f36dd6bsm161924ljj.59.2023.03.08.01.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 01:19:54 -0800 (PST)
Date: Wed, 8 Mar 2023 11:19:50 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 06/17] drm/connector: Print connector colorspace in
 state debugfs
Message-ID: <20230308111950.58f222a9@eldfell>
In-Reply-To: <20230307151107.49649-7-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-7-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4ArZIroc+JrTbpPfbAhT0O1";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/4ArZIroc+JrTbpPfbAhT0O1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Mar 2023 10:10:56 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> v3: Fix kerneldocs (kernel test robot)
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Reviewed-By: Joshua Ashton <joshua@froggi.es>
> ---
>  drivers/gpu/drm/drm_atomic.c    |  1 +
>  drivers/gpu/drm/drm_connector.c | 15 +++++++++++++++
>  include/drm/drm_connector.h     |  1 +
>  3 files changed, 17 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index c0dc5858a723..d6d04c4ccfc0 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1071,6 +1071,7 @@ static void drm_atomic_connector_print_state(struct=
 drm_printer *p,
>  	drm_printf(p, "\tcrtc=3D%s\n", state->crtc ? state->crtc->name : "(null=
)");
>  	drm_printf(p, "\tself_refresh_aware=3D%d\n", state->self_refresh_aware);
>  	drm_printf(p, "\tmax_requested_bpc=3D%d\n", state->max_requested_bpc);
> +	drm_printf(p, "\tcolorspace=3D%s\n", drm_get_colorspace_name(state->col=
orspace));
> =20
>  	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_WRITEBACK)
>  		if (state->writeback_job && state->writeback_job->fb)
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 7649f0ac454f..7ed48f9cbb20 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1044,6 +1044,21 @@ static const char * const colorspace_names[] =3D {
>  	[DRM_MODE_COLORIMETRY_BT601_YCC] =3D "BT601_YCC",
>  };
> =20
> +/**
> + * drm_get_colorspace_name - return a string for color encoding
> + * @colorspace: color space to compute name of
> + *
> + * In contrast to the other drm_get_*_name functions this one here retur=
ns a
> + * const pointer and hence is threadsafe.
> + */
> +const char *drm_get_colorspace_name(enum drm_colorspace colorspace)
> +{
> +	if (WARN_ON(colorspace >=3D ARRAY_SIZE(colorspace_names)))
> +		return "unknown";
> +
> +	return colorspace_names[colorspace];

Should this protect against returning NULL? Well, I suppose that cannot
happen right now, and probably holes will not be added in the enum. But
should kernel code still be more paranoid?


Thanks,
pq

> +}
> +
>  static const u32 hdmi_colorspaces =3D
>  	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |
>  	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 46c064d9ffef..c77e42408522 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1970,6 +1970,7 @@ void drm_connector_list_iter_end(struct drm_connect=
or_list_iter *iter);
> =20
>  bool drm_connector_has_possible_encoder(struct drm_connector *connector,
>  					struct drm_encoder *encoder);
> +const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
> =20
>  /**
>   * drm_for_each_connector_iter - connector_list iterator macro


--Sig_/4ArZIroc+JrTbpPfbAhT0O1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQIUzcACgkQI1/ltBGq
qqeeiQ//cW6a4chtAv+aEMAbpV1/23uddSc1eTYmqz8iQn2SE9b3QF6ryW4qnLfv
lqwraaCqNORkrU1HpibpuAACr2YGBgrt12biuWQ4LjICOZShPiIatH95nVMKQmkr
aJr3Io2RyNMM6c6k0iszNsADJbngWUeOGFn+Hi6/Y4INdtlxoZUsYVqJYOyqbTOM
vHrBgEvDcxbCRfiNOE3/QIBquiLgdlYtkOlM8QCKuQxJAzxGMq1U4HwTLnsg1AJG
80HCa+ej/4/1TgueSa5/Awxw1a1Qy6VOCuckcwr4MEKI39i85J9G8HdCvbu1pNr/
Ddvl99zx9dW9rieCiDlNe7r5GJ5gRAE1AUjDXKBlMA/7Bc9AZMXbY9RfNNSAY9bY
WmpLrlTU2UWIqTQrcpCGKwvDc9HoTsLYF7vFEihkocp4iOrBfOsHiOnOlmZH94Ss
saPcaxBU8hp4Lv1XuEdQFYTI+KXjIwA5azoUq1DaaAZlgd/WFtyYNDhcZno6z1Rx
jAWOLGpPj/iRdvRE3nRpbcmO6xAlDW3Oe4pX+VRiUnUPqs/pgAVn4I1p7b4Lutrq
F/NLP5NN0HoG35ab5N49K2GHPhC58TNifdd4GTz4nXuJ58na5H4ivBSITd3lZQ9p
dBX2deFBce5u3npNarXNN67ntLu4pb3iBi+V9IpKpj8WUjXAjkE=
=wuIS
-----END PGP SIGNATURE-----

--Sig_/4ArZIroc+JrTbpPfbAhT0O1--
