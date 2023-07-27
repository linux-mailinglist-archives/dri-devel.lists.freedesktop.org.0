Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F116C76592D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D3E10E1D4;
	Thu, 27 Jul 2023 16:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC1110E1D4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:50:39 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51d95aed33aso1512936a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690476637; x=1691081437;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ca83DArfwYSOrij3GU5MKEjp3+Tob7zF8j3oLiLUAA=;
 b=JsK+YR6oU0GmuhsKrZ4QxdQWBVSJF1UVlnChg0t3Ys/MRkQ9z7tcZS/yZMnZXipBjk
 DbfXFC+HDoPPMJ8jU2NSNQLQx+NhXYhMkZfGw6ZgciyE1B4qw7sVjYTAcVhTtoozJRlY
 fcBL7jlboWgjpL+/6OjYq7UF8E70Vqx1MiYoBQfm7V1q9Sk99s5h9N9l/gHYShLwUgyn
 eELVNFFZP1OUZq+YA3JLCFGlsuHSy78NhpG4Wep2M3avKybHCfdDJOibIZSo8K+E2k0/
 GvEe3YY/2Gj2ftbxyvBfod7UaPTlsGf/6ki2Gk/fKEpw+BcamsTBJLzt6uYcHXXv88pt
 WyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690476637; x=1691081437;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ca83DArfwYSOrij3GU5MKEjp3+Tob7zF8j3oLiLUAA=;
 b=Om+PIczTz1CnMdXWN8sX3AXxzxGy1DJY+7uJw1q2ZI146f0Ukq0mM/UDUEGGiWQXki
 OIo3BRJa2AmSdYj05850OmoaevluAEfNShLtRqHeZSEVFPKDu5hBHjymG2UamFAGmx4Q
 yLYE0jAoFFa97la0VGEEXJKZtN5OUmXoCUaCIPYtuYBJEO0AVPBAT8tPUNTkqJSWkhLz
 64KiYtCxwQpjW0tJS5lGlzILcpReCP5G9I114ge3JJZLcWI7/0/4CDMkHXxApkzUn0gx
 0u31Puj32xUjMDXNFh95MMGlxDuW4pqves3/R5lQgMCPVYdoSJBasjP/HxJLjmr8lRkr
 CXmw==
X-Gm-Message-State: ABy/qLZuJGEMOGHNLSvDC92WDtdKgUPmucqNx0bfQLo2zgrrKMzq09Vc
 qNqileJHbNAOXvQuve+RRYA=
X-Google-Smtp-Source: APBJJlEkIyXdNLPB+S5kMe28Kp9+/FTHl5FfWx3i+zKwBred5WR3IrCEgA5Zrs4IKOLFdiXpviY2BA==
X-Received: by 2002:aa7:d049:0:b0:51d:9ddf:f0f3 with SMTP id
 n9-20020aa7d049000000b0051d9ddff0f3mr2008193edo.31.1690476637348; 
 Thu, 27 Jul 2023 09:50:37 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 s11-20020aa7c54b000000b0051df54c6a27sm832509edr.56.2023.07.27.09.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:50:36 -0700 (PDT)
Date: Thu, 27 Jul 2023 18:50:35 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: tegra: transformers: add connector node
Message-ID: <ZMKgW6eYpJVqeZJM@orome>
References: <20230618085046.10081-1-clamor95@gmail.com>
 <20230618085046.10081-3-clamor95@gmail.com>
 <ZMKJE1G87-jWeg2_@orome>
 <5A2447D3-DB49-4788-AA05-182AF0F04ED2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+quuNHqy5nY6+XIF"
Content-Disposition: inline
In-Reply-To: <5A2447D3-DB49-4788-AA05-182AF0F04ED2@gmail.com>
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


--+quuNHqy5nY6+XIF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 07:26:28PM +0300, Svyatoslav Ryhel wrote:
>=20
>=20
> 27 =D0=BB=D0=B8=D0=BF=D0=BD=D1=8F 2023 =D1=80. 18:11:15 GMT+03:00, Thierr=
y Reding <thierry.reding@gmail.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=
=B2(-=D0=BB=D0=B0):
> >On Sun, Jun 18, 2023 at 11:50:46AM +0300, Svyatoslav Ryhel wrote:
> >> All ASUS Transformers have micro-HDMI connector directly available.
> >> After Tegra HDMI got bridge/connector support, we should use connector
> >> framework for proper HW description.
> >>=20
> >> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # ASUS TF T30
> >> Tested-by: Robert Eckelmann <longnoserob@gmail.com> # ASUS TF101 T20
> >> Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201 T30
> >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >> ---
> >>  arch/arm/boot/dts/tegra20-asus-tf101.dts      | 22 ++++++++++++++++---
> >>  .../dts/tegra30-asus-transformer-common.dtsi  | 21 ++++++++++++++++--
> >>  2 files changed, 38 insertions(+), 5 deletions(-)
> >>=20
> >> diff --git a/arch/arm/boot/dts/tegra20-asus-tf101.dts b/arch/arm/boot/=
dts/tegra20-asus-tf101.dts
> >> index c2a9c3fb5b33..97350f566539 100644
> >> --- a/arch/arm/boot/dts/tegra20-asus-tf101.dts
> >> +++ b/arch/arm/boot/dts/tegra20-asus-tf101.dts
> >> @@ -82,9 +82,11 @@ hdmi@54280000 {
> >>  			pll-supply =3D <&hdmi_pll_reg>;
> >>  			hdmi-supply =3D <&vdd_hdmi_en>;
> >> =20
> >> -			nvidia,ddc-i2c-bus =3D <&hdmi_ddc>;
> >> -			nvidia,hpd-gpio =3D <&gpio TEGRA_GPIO(N, 7)
> >> -				GPIO_ACTIVE_HIGH>;
> >> +			port@0 {
> >> +				hdmi_out: endpoint {
> >> +					remote-endpoint =3D <&connector_in>;
> >> +				};
> >> +			};
> >
> >Does this need a bindings change? nvidia,tegra20-hdmi currently doesn't
> >support OF graphs, so this would probably fail to validate if we merge
> >it without a corresponding DT bindings update.
>=20
> drm/tegra patch is backwards compatible and connector node is optional.

We still need to document the connector node, otherwise the DT
validation will complain about port@0 being used here, won't it?

Thierry

--+quuNHqy5nY6+XIF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmTCoFoACgkQ3SOs138+
s6FMdxAAr/lh5lLTiYBGhpZ6nbI8bKAjx08EQ5zqrB179pkIC7+ZATpv+6u/WBWN
MONzJyFIGz+Kr9yg1Qz0o9u3sRatuQo4XZbTdhKb6t0nscEwD+IZDJRWYCSPmady
YEN0hJ0iZcQhZwVFioduYkzAnClbILg6qgs7fTATD9X0Di8bmqVAwdg3MDNs8sC9
R49WsfVg2CHC7SL3NKhw8qpUihEJs6+C7Pu9WfGDERlOf9XdpJPs2KJungGjPznp
58/XAeDHGMSZ+Rs3RC/HM2PGjfkUdyf616NHW8YCInl4Jiie4NZpYiZNBOdQN5/4
/B9LbgNuOS/HM8qKtsksYJDGNzQqYuXsqBWz0SS5LEeRTraurkuhuGkbbasmWssS
DxJfbFbnxxul2+ItpTcAG2c4+/N9fVDqVvV8zRpaN3V5RZjC8pT0XLrWSkbIQV7E
rxphLww7zuPDOjGXUKZIji8PUuZ0g++sO5isAkCaZESkdF7cHQcEq5WTXpT+78my
D6NqkVjJr0YNrBsisJGgewrXxx6YjSKpMp7KJYOVJOKOjdnOZucCcyhbOpdF2Pmf
CIy6rUOymPzzAVOYvrWBDTnM+U5bwTwhQGOLJfBZvRNyi0hkfQwO/4xJe3LHVuYF
ykJcAKiU3slOXD5EKNVSqbbhgkuY+bvnz7K8gfVEQ2eF73vrcIQ=
=d9x5
-----END PGP SIGNATURE-----

--+quuNHqy5nY6+XIF--
