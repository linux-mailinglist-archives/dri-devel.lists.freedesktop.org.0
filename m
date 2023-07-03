Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC007465EE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 01:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697CB10E24D;
	Mon,  3 Jul 2023 23:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7260010E246;
 Mon,  3 Jul 2023 22:59:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A0DB61085;
 Mon,  3 Jul 2023 22:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD04C433C7;
 Mon,  3 Jul 2023 22:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688425195;
 bh=n19GJPDF+RLlje7pvmLVRX0hBah4pwQ3Uw2aRRWrRZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q41tQHm/ucNfOIL/xk4eormseBx/XoFSNQ/sBCLP9p8bRKBXLlTMeDv2C9WxNYU2A
 ag6MWrItzRfy4o74hBPcXL1c44UI7AvO8OUhFYQm7aqKuhffuPPB4lLzASpkf8/yOb
 ATknLkheeSaDMtb3KwACZcqXtpdPhmJEU+aFbflVlr3QwN1nIZNyoGz0hY7K6+F11P
 HLwnAn2acqoPTB6pjQbXL46BF+GCYDqJhfXz7/NSn1YDYFQKI2Hlz9Wt6vE5LesJNI
 pMK/H4L3wWGuQPJ6I/KK45Ea3lLYiUz1PJOAChsfqSTYhzfP9x+vkDvrSCBsXSNgLr
 7hu39ueiZOINQ==
Date: Mon, 3 Jul 2023 23:59:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v3 0/4] Qualcomm REFGEN regulator
Message-ID: <b93cb054-fd42-46e5-aef3-dc41b36a85f9@sirena.org.uk>
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k23AuSsl7zkPANaU"
Content-Disposition: inline
In-Reply-To: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
X-Cookie: Please go away.
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
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--k23AuSsl7zkPANaU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 08:15:53PM +0200, Konrad Dybcio wrote:

> Recent Qualcomm SoCs have a REFGEN (reference voltage generator) regulator
> responsible for providing a reference voltage to some on-SoC IPs (like DSI
> or PHYs). It can be turned off when unused to save power.
>=20
> This series introduces the driver for it and lets the DSI driver
> consume it.

What's the expected plan for merging this - should I be applying the DRM
patch?

--k23AuSsl7zkPANaU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSjUuIACgkQJNaLcl1U
h9C0igf/WJJjbSuyFnIa0QzDmk6VH8wPFNOpi/ZVp1QcD4+1z709iGwd35JHzOu4
PvcjIxjBozoxzdVo7NpW0bxnwlZl/3e+3tAOIjpHp9odr49UTBZGcu9gwenlzIp4
11xZldpE7ka90Pq5grV11HF6wtzBvXtNqpG8Md4LfW0+WhhDTmayfNIjXgnbNrar
9y0IPQj460708CQ2rWcG9KKoBLnyT7K+/WKKwwekESMIY7i0JCA8WojeJmccyWCd
wuKNBHyVRv9STOoP4hw7mEOHnaKvcT6FyavOBAlTcvKzMLKmEqi1WacuoSqM0xzl
wrH1dj9NrcRO/Ih3DFwskbtMoc3YPQ==
=wbYK
-----END PGP SIGNATURE-----

--k23AuSsl7zkPANaU--
