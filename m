Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FD9B927CC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 19:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5DA10E03F;
	Mon, 22 Sep 2025 17:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="dEiyeVuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 587 seconds by postgrey-1.36 at gabe;
 Mon, 22 Sep 2025 17:55:23 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D17510E03F;
 Mon, 22 Sep 2025 17:55:23 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 3A41E1C008F; Mon, 22 Sep 2025 19:45:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1758563134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2LoNSD1MjksE+Q5STpZ9iMFA6rZNp5scT6RfGqsxh58=;
 b=dEiyeVuTfcFh0yqrUAInmXJZKRuF3SIxESWQ07Xil4xdIB7tWc75EPVDpyt7i6rcSY+lj1
 l6Ke6nSPHI4lpnpqhaKN4dkgF4srfd4485SecXZMyl80G1WsF/zRPNqg/vXjsDQF/cE2ms
 eszlkEZ5YvkuB/teWa0j2ISyQ5Jl+XU=
Date: Mon, 22 Sep 2025 19:45:33 +0200
From: Pavel Machek <pavel@ucw.cz>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Lee Jones <lee@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Adam Skladowski <a_skl39@protonmail.com>,
 Sireesh Kodali <sireeshkodali@protonmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: Add Xiaomi Redmi 3S
Message-ID: <aNGLPdmOyh/pfroq@duo.ucw.cz>
References: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
 <20250831-msm8937-v7-6-232a9fb19ab7@mainlining.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="8MXtIuaouyubyuXB"
Content-Disposition: inline
In-Reply-To: <20250831-msm8937-v7-6-232a9fb19ab7@mainlining.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--8MXtIuaouyubyuXB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +	led-controller@45 {
> +		compatible =3D "awinic,aw2013";
> +		reg =3D <0x45>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		vcc-supply =3D <&pm8937_l10>;
> +		vio-supply =3D <&pm8937_l5>;
> +
> +		led@0 {
> +			reg =3D <0>;
> +			function =3D LED_FUNCTION_STATUS;
> +			led-max-microamp =3D <5000>;
> +			color =3D <LED_COLOR_ID_RED>;
> +		};
> +
> +		led@1 {
> +			reg =3D <1>;
> +			function =3D LED_FUNCTION_STATUS;
> +			led-max-microamp =3D <5000>;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +		};
> +
> +		led@2 {
> +			reg =3D <2>;
> +			function =3D LED_FUNCTION_STATUS;
> +			led-max-microamp =3D <5000>;
> +			color =3D <LED_COLOR_ID_BLUE>;
> +		};
> +	};
> +};

That's single, 3-color LED, right? Please see LED multicolor support.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--8MXtIuaouyubyuXB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaNGLPQAKCRAw5/Bqldv6
8irtAJwI2afEzeUg31W2fmTx+qETFXOowQCdFOieFEzz1la9CKecVgIxILFSLCI=
=EBxA
-----END PGP SIGNATURE-----

--8MXtIuaouyubyuXB--
