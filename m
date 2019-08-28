Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6062E9FE99
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 11:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6311F897EB;
	Wed, 28 Aug 2019 09:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846BF897E0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 09:36:49 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s18so1793432wrn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 02:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BBuzzof8zZMyC5cBUE8nZgFa0hb+Dbo0Ym4NPdlUc3Q=;
 b=RLkdm4TuyIWPPVlqtzIpjBA0ZubSOaMKMAU0r+nWiT0r43p1XacODvjxmv9Npq1UXn
 MGHZFADbNE6c19+EmBZA5yFIwgoqmKajVLk/EkG5Ve8n0rrGPmiYHGoSo8jJAHmk69/S
 PZMBzuoYrCBHN5QyNstZCX4mT0l5Pc5HBaOadEQ5qEAQ2VisKUszo0kuy9LHwfdFnqDj
 K0YgEV9nHbNaIlL3OIZmtQr9gqeUfEPDBypn6qcutZEV7JPlc9ZaEUR3ChsOh4n4egCN
 Sr08Nauvu5ZMnYuN5DziA0hdH4+UZG9PayAdlIvoBgnYoWZW9coS25dxSuFLTluQXpzz
 9rKw==
X-Gm-Message-State: APjAAAXza783OK7JuOcenFC1q8M1dTkWod2CLKThkcnIReTIFFmXQlo1
 NGG+Az8KjY5del9UimTWJ0A=
X-Google-Smtp-Source: APXvYqwMQnUB0YswPXCDQ17rfO0T99SGjGKn1T19r6B1/gAj6ortuQOoWuNkvCua17xNq8CJRLTJuQ==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr3553458wrt.249.1566985007828; 
 Wed, 28 Aug 2019 02:36:47 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id j20sm4464767wre.65.2019.08.28.02.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 02:36:46 -0700 (PDT)
Date: Wed, 28 Aug 2019 11:36:45 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dariusz Marcinkiewicz <darekm@google.com>
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
Message-ID: <20190828093645.GD2917@ulmo>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-8-darekm@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BBuzzof8zZMyC5cBUE8nZgFa0hb+Dbo0Ym4NPdlUc3Q=;
 b=AkKK/XBjEHizNiJ0Mj63NeQtn6moijs4nu2RBhf9x/eWwd3J1lopIwY4zV3tZb+DlO
 VC1dkwGi6ZSir6f/+ks3upVkVmfQKQ/cXJrNsCN+aTEz+mRJVwWYgi3rYePyMm2RvE9j
 3qnk9AeZ8xfZLnF6DjVPsWQAFYOkNBcRtTpJWBH9cchiNlzlIMbgBP12imyY+hr9aYZ5
 t9tMP+KW/dg3PMxhk5hACbAMfCVA62KpV5VGG6ltn+2wJ93KW9PIQBhVBShrduA+AXBH
 tXW4qH/k7bWNbB1oKBPgy/GOrsYydl/ocG53Qu31310stSFGjfFDyU0i2MZy3jurV7Wn
 cHaA==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0390184799=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0390184799==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DrWhICOqskFTAXiy"
Content-Disposition: inline


--DrWhICOqskFTAXiy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2019 at 12:45:05PM +0200, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
>=20
> Changes since v4:
> 	- only create a CEC notifier for HDMI connectors
>=20
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/gpu/drm/tegra/output.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/outpu=
t.c
> index bdcaa4c7168cf..34373734ff689 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -70,6 +70,11 @@ tegra_output_connector_detect(struct drm_connector *co=
nnector, bool force)
> =20
>  void tegra_output_connector_destroy(struct drm_connector *connector)
>  {
> +	struct tegra_output *output =3D connector_to_output(connector);
> +
> +	if (output->cec)
> +		cec_notifier_conn_unregister(output->cec);
> +
>  	drm_connector_unregister(connector);
>  	drm_connector_cleanup(connector);
>  }
> @@ -163,18 +168,11 @@ int tegra_output_probe(struct tegra_output *output)
>  		disable_irq(output->hpd_irq);
>  	}
> =20
> -	output->cec =3D cec_notifier_get(output->dev);
> -	if (!output->cec)
> -		return -ENOMEM;
> -
>  	return 0;
>  }
> =20
>  void tegra_output_remove(struct tegra_output *output)
>  {
> -	if (output->cec)
> -		cec_notifier_put(output->cec);
> -
>  	if (output->hpd_gpio)
>  		free_irq(output->hpd_irq, output);
> =20
> @@ -184,6 +182,7 @@ void tegra_output_remove(struct tegra_output *output)
> =20
>  int tegra_output_init(struct drm_device *drm, struct tegra_output *outpu=
t)
>  {
> +	int connector_type;
>  	int err;
> =20
>  	if (output->panel) {
> @@ -199,6 +198,21 @@ int tegra_output_init(struct drm_device *drm, struct=
 tegra_output *output)
>  	if (output->hpd_gpio)
>  		enable_irq(output->hpd_irq);
> =20
> +	connector_type =3D output->connector.connector_type;
> +	/*
> +	 * Create a CEC notifier for HDMI connector.
> +	 */
> +	if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> +	    connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB) {
> +		struct cec_connector_info conn_info;
> +
> +		cec_fill_conn_info_from_drm(&conn_info, &output->connector);
> +		output->cec =3D cec_notifier_conn_register(output->dev, NULL,
> +							 &conn_info);
> +		if (!output->cec)
> +			return -ENOMEM;
> +	}
> +
>  	return 0;
>  }
> =20

It might be slightly cleaner to move this into the HDMI drivers
themselves, although that'd mean a bit of duplication. That could be
mitigated by moving the code into a separate helper that could be called
by the HDMI drivers.

Then again, I don't feel strongly about it, and that could always be
done as part of some later refactoring, so I think this is fine.

Thierry

--DrWhICOqskFTAXiy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1mSy0ACgkQ3SOs138+
s6H4gg/+OuMLV5fIj7+uzWlp1gQO6V43RpNGjpFS9gndEosOfV/QTOEip16Efq1p
ZegaEk1ibqDX7dIwQ2m48uFRJw+qKyYVIJoxBhFDgcUk5uwnAtHF7qMTRnQJGcVP
LDjQ2Lxw4PmpdO8SQxUc/xDOlmTWPcqGpv7XzqB+ZbwK7ACCce5Cw080B/5kp1Z1
4D4dttwjpVdtO0/dx3nhFYpjeDAwyH/u8kWJLFAt+cbVgyNap8drgrSNlAArVXD3
R5R5Ge3iouXUuY+juQRv4uwC86F6WAOfKU8VQaENjRof5jCyL/BJrv9t4JGYbVte
QQnAi9FJvwbpra04AkpFG2nib/nnX/8m3OGiRrMp29l7TRpD9QptRDIaSKkPkw4n
BpySuAXUIh05zS8xNNZNDxW3BygkZQHoK50tW0RNwhYmI4LTfOrkDT3E6ZyWLx9E
j4+CwkemwwRijP8yX3eegsC8gYreS1ERPNuAehIghf95X3b6KExZQb4/yj/qxW/E
cpXn24r3PT45Y7GZVXuIEyMIeLWIz+2YOxCgXwYjzEkRau8NHBA/UIRPzWLiuovO
JXJyeT7d7J9rNm0YE9A45jNnG4qpN1ruV919nABZ9Qgq7jVFDP83bWp1ywKZQtTO
be1SyPh01yjDg3/H7mRqkLFU3WXO+Uz82JwNG1RN9A0aE0Us3Qo=
=st98
-----END PGP SIGNATURE-----

--DrWhICOqskFTAXiy--

--===============0390184799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0390184799==--
