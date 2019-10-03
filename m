Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98743CAE4A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 20:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F026E16D;
	Thu,  3 Oct 2019 18:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76026E16D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 18:35:58 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iG5xC-0006D4-Pe; Thu, 03 Oct 2019 18:35:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 49A972740210; Thu,  3 Oct 2019 19:35:54 +0100 (BST)
Date: Thu, 3 Oct 2019 19:35:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v8 2/5] leds: Add of_led_get() and led_put()
Message-ID: <20191003183554.GA37096@sirena.co.uk>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
MIME-Version: 1.0
In-Reply-To: <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
X-Cookie: $3,000,000.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8xZ6YXfyq2hnNuMAqNcsK16gYTOtcLHh464CJAwxiiA=; b=hoipmdP7ShfKwIU+CCwtxbVn0
 L3MZJGBv7TEP7q7v2d3Ug9EJwUbiLnTOSIK5tKOV/S+tskCzNfaZwBMzMG/xCoL4aB8ux8Tf2X241
 DBdLnfxkUS2Cpk03iXbc9IZ5aK9lCsZTkl02iy2dTEWgsO81RHRcOJdU5KJV5pmPaUkgQ=;
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org,
 Liam Girdwood <lgirdwood@gmail.com>, tomi.valkeinen@ti.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, dmurphy@ti.com, pavel@ucw.cz,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1099182299=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1099182299==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 03, 2019 at 07:43:17PM +0200, Jacek Anaszewski wrote:
> On 10/3/19 2:47 PM, Jean-Jacques Hiblot wrote:
> > On 03/10/2019 12:42, Sebastian Reichel wrote:
> >> On Thu, Oct 03, 2019 at 10:28:09AM +0200, Jean-Jacques Hiblot wrote:

This mail has nothing relevant in the subject line and pages of quotes
before the question for me, it's kind of lucky I noticed it....

> I wonder if it wouldn't make sense to add support for fwnode
> parsing to regulator core. Or maybe it is either somehow supported
> or not supported on purpose?

Anything attempting to use the regulator DT bindings in ACPI has very
serious problems, ACPI has its own power model which isn't compatible
with that used in DT.

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2WP4kACgkQJNaLcl1U
h9AgAQf/eheTMwAWaxe5ccDKZD9hVWX05p22QRpydZ2d8Yz9U/uFwu9tph6P4tRd
ffNJl+01Sn6rytSQyx+k3jaRZ75L/yfX5AXag+4JE1/6zk94LOtt/of4OnrmXDxW
b0FHmWlI5wuQS/QWYCU3TPbQ5Rp5/INXfQc/XcCOTJT4nYeqLFmcGe0xv31dIFso
k7BogASJB2+cjFyEMTh1xfsqGNAPYhQfFxNSX5tBUqhvt4fpfhwhCvmNQAAvmWaJ
/VLI8g0JTa3T2uroJJKBPXgw8bm3One9Q0aNtcQDF8TgmI7w+73gx42iu28A0PyP
bookZAb4iUFLMpD/FIoDy75uPMPjTg==
=pjam
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--

--===============1099182299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1099182299==--
