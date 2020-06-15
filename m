Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7071F9523
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 13:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1E589C9D;
	Mon, 15 Jun 2020 11:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F77989C9D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 11:18:27 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9183620679;
 Mon, 15 Jun 2020 11:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592219907;
 bh=Kc5Uu2zfW16GC/jLDwOItAJ1ZCbBOhlBnC7jl4IzQzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CLqA0Otm5iTchqOJNuF5+TEvlduYM9+uHf6vsS1atI8wMe7S/kxYzvwUUWFsse4+8
 sH1eDw9PbEF9rDtnc2aheYGa9DNhyAWCXgR4cJnGEviEeGugPmWRca0LUDu2E4mP8M
 PRkjztkO40hmW00EQKRvCSNgeGSBOeUs/BCxQ00k=
Date: Mon, 15 Jun 2020 12:18:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 14/29] dt: Fix broken references to renamed docs
Message-ID: <20200615111824.GB4447@sirena.org.uk>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
 <6866c0d6d10ce36bb151c2d3752a20eb5122c532.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
In-Reply-To: <6866c0d6d10ce36bb151c2d3752a20eb5122c532.1592203542.git.mchehab+huawei@kernel.org>
X-Cookie: Offer may end without notice.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-spi@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0002096573=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0002096573==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 08:46:53AM +0200, Mauro Carvalho Chehab wrote:
> Some files got renamed. Those were all fixed automatically by
>=20
> 	./scripts/documentation-file-ref-check --fix

Acked-by: Mark Brown <broonie@kernel.org>

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7nWQAACgkQJNaLcl1U
h9CxiAgAhDSjkVNSd4C3SSNbhfInIakuxFRySdIdhdj0LEFFiDgpuSzr3Lod/jYy
mKamyUcBQ6F3CafOHN8nf4MlH9u3CSElXbDvLZlah833W1ak+AWXqFDdqi3XM9Wg
5enzsfi4JHeKxu/NGAt7YUqXKG2WxM4RL0iC1H/CsGsLII4ixSPSNHJ8BsGs2Ehx
Dv2I9zYutWdH+3O8bk4vHtJHpZidjuobydynnmMgcHpeDXVSLPZx22W/LXsUAlfE
HFaK+IberJIeSTebqFLV0fkB5+x9yri0Jg8SLWubAGmqiS/XEvVLx1tF0uU/ukk4
dBx3qCxD+Vtqo7ZF4IYCIM1u5B64lg==
=HhUo
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--

--===============0002096573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0002096573==--
