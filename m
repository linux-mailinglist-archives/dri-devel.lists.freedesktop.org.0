Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5069213ADF3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 16:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8A66E41A;
	Tue, 14 Jan 2020 15:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1758 seconds by postgrey-1.36 at gabe;
 Tue, 14 Jan 2020 15:46:08 UTC
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF62C6E41A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K15TeIKz2iH2yNBaQfbFQ/2HZ43ycaI2mrMgjoB89W8=; b=eqqWHZPhE1xW0gJlR8rUqsdv+
 14x7EIh3mp7KCevqvc2W/P5xWtIynG2LI174Hi1s+Cl5gRYWHvrPZXBPtnxUpvTNSMeUEAtZCYsrU
 RXg2EFs3MZ+EQLZGh170vi1j1eAEhv9Ac9eR8jghkcbjKtQ4zgx89uVywSYcPvGB1uMW0=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irNvv-00004y-E7; Tue, 14 Jan 2020 15:16:43 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 22C3ED04DF5; Tue, 14 Jan 2020 15:16:43 +0000 (GMT)
Date: Tue, 14 Jan 2020 15:16:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v3 4/7] drm/panfrost: Add support for multiple regulators
Message-ID: <20200114151643.GW3897@sirena.org.uk>
References: <20200114071602.47627-1-drinkcat@chromium.org>
 <20200114071602.47627-5-drinkcat@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200114071602.47627-5-drinkcat@chromium.org>
X-Cookie: Programming is an unnatural act.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1407959995=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1407959995==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="buDNgeHiu+HCsDEc"
Content-Disposition: inline


--buDNgeHiu+HCsDEc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 14, 2020 at 03:15:59PM +0800, Nicolas Boichat wrote:

>  - I couldn't find a way to detect the number of regulators in the
>    device tree, if we wanted to refuse to probe the device if there
>    are too many regulators, which might be required for safety, see
>    the thread on v2 [1].

You'd need to enumerate all the properties of the device and look
for things matching *-supply.

Reviewed-by: Mark Brown <broonie@kernel.org>

--buDNgeHiu+HCsDEc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4d21oACgkQJNaLcl1U
h9CCOwf+K6UJ3dhSHND3Fpdx/IUgRmsJiK2V3jATceFWHdf8/BMeiNDYwD2U7i1q
3086jl6AsX+YoSVr7Y1z7U+i8sHs2E/x/bP9LjOzRAXLya+5rdefN2ngQZq1Deex
AUlEQpjAk186CwzKC1OWLLmbBYRbo/avge9LcYp3eAFfUbv2kjv2QRPII2EspHzi
Zs3Y57WJlZ7STEyx7rHHXWYqEv7IqhlIo1f2xZobE7MFBmsYCjYy9GMMexe6H2z4
zMbp8clRBhJ/+CeT06cbMK5/gPb1biOaPeFndjeQOSbO3hmvfi2F2w32lJZsad4x
qAImcHOYwKX7KXoR1RoiFJO5kVdyaw==
=l7/J
-----END PGP SIGNATURE-----

--buDNgeHiu+HCsDEc--

--===============1407959995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1407959995==--
