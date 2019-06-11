Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4775F3D2E1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 18:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F9E890DB;
	Tue, 11 Jun 2019 16:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432CF890DB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 16:46:00 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hajuG-0000Bo-LP; Tue, 11 Jun 2019 16:45:56 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D6694440046; Tue, 11 Jun 2019 17:45:54 +0100 (BST)
Date: Tue, 11 Jun 2019 17:45:54 +0100
From: Mark Brown <broonie@kernel.org>
To: James Qian Wang <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: next-20190611 build: 1 failures 20 warnings (next-20190611)
Message-ID: <20190611164554.GD5316@sirena.org.uk>
References: <E1haipo-0003Ae-CW@optimist>
MIME-Version: 1.0
In-Reply-To: <E1haipo-0003Ae-CW@optimist>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W5gQPkVM7jP5xtb25GOh+1waT6S1jB2k3sECOmQS//0=; b=gdB3Jhme4SlvBW20mWywREPEZ
 mFId6MoV4WnkU0xiMq4pXhnet3crBNeigS7fF96GCf6WT1pR/nPlf0dUyJKceXnNv2QZ7DuZ9cYrs
 gYzavJEA/L2UXi1KZddc2o/O2L+UHH6YfaI6ghYgOuTdonv9LHRaROCuGcygkj/c7JTOA=;
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
Cc: dri-devel@lists.freedesktop.org, linaro-kernel@lists.linaro.org,
 linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-build-reports@lists.linaro.org
Content-Type: multipart/mixed; boundary="===============2042188682=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2042188682==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Content-Disposition: inline


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2019 at 04:37:16PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm allmodconfig due to:

> 	arm-allmodconfig
> ../drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:206:30: error: passing argument 3 of 'd71_layer_update_fb' from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:385:30: error: passing argument 3 of 'd71_layer_update_fb' from incompatible pointer type [-Werror=incompatible-pointer-types]

due to 75f3b7efacb8e (drm/komeda: Add format support for Y0L2, P010,
YUV420_8/10BIT) which introduces those two calls.

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz/2r8ACgkQJNaLcl1U
h9CyqggAgloTZxQRgBpbsluShw1SLkikwibJx0Qo17XyH/PBIwVi4+IiPSiE4IsA
4qiQ/RJZpkO39LG/RsetgzVTGha6mXVVZ2IWFhM4b1Pz71h2gvknhsTm62oKwx1H
bibBN915JPTCjg+RF+ry3Id4Ez/q5E8JUM7vyKns72IOPjJCsdD7HCcUCXhPWF08
c3MfiRcuAUm3JuX1LILSiiVSBf+5VrX+uV9uBwSk2gtFGLYICkSKNqpVsOMnaH8+
rABEqyGFJc135bEbfBXGjKAJemCJe0/UZkpmF0O3S8JHstbtngSL8e19nrFQTt0y
aZUAV0+AJxTzh4dFl6Qpj+0xhquONw==
=WEo4
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--

--===============2042188682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2042188682==--
