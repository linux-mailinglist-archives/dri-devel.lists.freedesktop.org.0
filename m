Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8C3765710
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 17:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F1610E5A5;
	Thu, 27 Jul 2023 15:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEF110E5A5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:11:19 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-991da766865so147387966b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690470678; x=1691075478;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rf62hs1ejTaEIoI4FqGDyw6TQJaaolUeJwHL+w88ryc=;
 b=IjlQLHyUnHEu00B7Qy6f+Y30kxLDfQmNfxvNcD9bv1Us+i0FAly0rXozGaKPjyS5x2
 IOLkzjcBw5qe3HpewfeKx9KS0MAVrcK8L4GrBfTtvXmcOYkxqXAAL57Kl3f2ML6NdWRD
 m9uZNIEtj+6VQwA4cOk5eglj64/c+h+WNVwFoYmAnFB7aDuXg6cFv1ZTOzkLfcemeQFT
 JQQeddoqzon5fpmXewvVwuQX2wtF4fYHHLfXlA1jO2DOQGPYA/mlt0CjS7q5AkdUOgiM
 /MX8Prfu0jUq5iqATseYSaWMH0kl2FgG/za6tNKLGy+bqtz705NQW49/Z4n0R4bt0bjt
 EB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690470678; x=1691075478;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rf62hs1ejTaEIoI4FqGDyw6TQJaaolUeJwHL+w88ryc=;
 b=Iv8XToMpSK6xNc3p3YHSIEzZFkkjPcFUMVwXcaNhE+D0qSDkPfM3wW2Ofok8IsZ+VU
 W83MtSHrTNZy5QIswhzOcFc+ZSSGLvgyJSZZr0jIhTFXfdGg6I2yLkD62Qs323e8if9q
 noLAW1zRudt+rWAlXgZnLBWRRvodM3WJ8Yhr47ZZeTvxnPEQsWXecxr6w6+tvJY02fZe
 cuz8yB/hkUCfypYU7zHe1s7foeUh8imht2XPFobW50L5baz54mZvjMjLsYCS/T2Fhqld
 SAr7j513dalxfM8UcReczK2HUdF72eU/JCZO9FQzZrt68Q3McKKvaWjqRllCx5iG2zlU
 PmuA==
X-Gm-Message-State: ABy/qLamIPpeW6RofECfOUENovqYv/1fpgyIUN/Oyk0f6PsEv3HTHC+x
 a4c5PiOv+3ben4YozbrNMpXKgThlvHU=
X-Google-Smtp-Source: APBJJlEl+Qg5j7Vyl8VRwP5KwrQQXAuT04cxYsbyyz4Rv/CKQmt3ycUxpq1s6g46wacCBDYhC+c7dQ==
X-Received: by 2002:a17:906:5a60:b0:974:1ef7:1e88 with SMTP id
 my32-20020a1709065a6000b009741ef71e88mr2260231ejc.13.1690470677961; 
 Thu, 27 Jul 2023 08:11:17 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a170906831000b00993cc1242d4sm869521ejx.151.2023.07.27.08.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 08:11:17 -0700 (PDT)
Date: Thu, 27 Jul 2023 17:11:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: tegra: transformers: add connector node
Message-ID: <ZMKJE1G87-jWeg2_@orome>
References: <20230618085046.10081-1-clamor95@gmail.com>
 <20230618085046.10081-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hlXONs87O1x4A5Mj"
Content-Disposition: inline
In-Reply-To: <20230618085046.10081-3-clamor95@gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hlXONs87O1x4A5Mj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 18, 2023 at 11:50:46AM +0300, Svyatoslav Ryhel wrote:
> All ASUS Transformers have micro-HDMI connector directly available.
> After Tegra HDMI got bridge/connector support, we should use connector
> framework for proper HW description.
>=20
> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # ASUS TF T30
> Tested-by: Robert Eckelmann <longnoserob@gmail.com> # ASUS TF101 T20
> Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201 T30
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20-asus-tf101.dts      | 22 ++++++++++++++++---
>  .../dts/tegra30-asus-transformer-common.dtsi  | 21 ++++++++++++++++--
>  2 files changed, 38 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/tegra20-asus-tf101.dts b/arch/arm/boot/dts=
/tegra20-asus-tf101.dts
> index c2a9c3fb5b33..97350f566539 100644
> --- a/arch/arm/boot/dts/tegra20-asus-tf101.dts
> +++ b/arch/arm/boot/dts/tegra20-asus-tf101.dts
> @@ -82,9 +82,11 @@ hdmi@54280000 {
>  			pll-supply =3D <&hdmi_pll_reg>;
>  			hdmi-supply =3D <&vdd_hdmi_en>;
> =20
> -			nvidia,ddc-i2c-bus =3D <&hdmi_ddc>;
> -			nvidia,hpd-gpio =3D <&gpio TEGRA_GPIO(N, 7)
> -				GPIO_ACTIVE_HIGH>;
> +			port@0 {
> +				hdmi_out: endpoint {
> +					remote-endpoint =3D <&connector_in>;
> +				};
> +			};

Does this need a bindings change? nvidia,tegra20-hdmi currently doesn't
support OF graphs, so this would probably fail to validate if we merge
it without a corresponding DT bindings update.

Thierry

--hlXONs87O1x4A5Mj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmTCiRMACgkQ3SOs138+
s6E9qxAAlNVbjPuB+C8Cgsu4EsoY/eiPXDFu2GUEmDJ9NdiJs1gnzIfBd6o53zjW
58Ozc/9jcrMoqjO8yhCtF/5DxZL3EQnyjIat/VQI5wd8bUjJwqrE8N/TAgcOU9qR
q3EWJs51pe0QQGImdz5hadlzRHIVIFtMJsCKTEvfytYiRkM5DIAN0JFEPqIWTJ8u
08aZaATSY16sPtnvu6Kao0tZfCkY5nrrS5/81EJ4cfMxYyhR0WtEr7AQdLOfWh3l
9p/v3+wZheNbgfy+3Rq2wWVPFoZ6GZgzr+LOSbt9TsV8neyqKTE75PF2Ni3cUhGd
+KWyVNinysYAkGmsPEhwkNhbBF6re4ZtKL+9VZTMxFNMgrJev8V6wIMZIBjhHseW
g35apJYPFtnW6JEz108iexlCDOrV9Q5cLnA4eM/8nOoWd9/2oWtPhSYKQDJz1MYf
7V13e+u11thmiGysZ1SP8SpN7ZV3zyWAxBqx3/vniObofLGkG8mN9/e5kuHblYB4
S8JVwYmxATIL/gFPwng9xojBWxYyy++QvQI7enHjtRXcS+3wmYOIWYLul+r7AQ+/
18kdezTzOIEGKtqtIusmMwJN048x48I5fcU6Xea2Ov2Wzwf0LcJx5iK+MJMvt4U5
j7bk6I8DsMu3/n98qAUGr5ZvBulb6Qp9M5c6e4aS/NEDCbM3gp0=
=emKT
-----END PGP SIGNATURE-----

--hlXONs87O1x4A5Mj--
