Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDECC0B1F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 20:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CD76E1F2;
	Fri, 27 Sep 2019 18:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C243F6E1F3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 18:32:04 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C7CF217D7;
 Fri, 27 Sep 2019 18:32:03 +0000 (UTC)
Date: Fri, 27 Sep 2019 20:32:01 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 0/2] drm: LogiCVC display controller support
Message-ID: <20190927183201.hfkhayehmloi34vo@gilmour>
References: <20190927100738.1863563-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190927100738.1863563-1-paul.kocialkowski@bootlin.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569609124;
 bh=l2MgxAfQqTBvJzgFFAMW7kFZV7ci+yqItew1m0ywt0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EmDPZ5jm7V7bcMW+f64E9QxeFWXFhK6EkmtlyzDzLrNr2u64hRCH1mt1pFpvn3AOT
 QOI/V46gq93gcwmCvvqdO/HWSAA2pjwtK0G5vh33lAB/MeUfelTUxZEYu5KP5RFSA+
 V61UEHJZyxQIGOHfFXEKqtX12Ye/zrVWBtcItpAI=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1289116385=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1289116385==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tukillri5nr7fxtt"
Content-Disposition: inline


--tukillri5nr7fxtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 27, 2019 at 12:07:36PM +0200, Paul Kocialkowski wrote:
> This series introduces support for the LogiCVC display controller.
> The controller is a bit unusual since it is usually loaded as
> programmable logic on Xilinx FPGAs or Zynq-7000 SoCs.
> More details are presented on the main commit for the driver.
>
> More information about the controller is available on the dedicated
> web page: https://www.logicbricks.com/Products/logiCVC-ML.aspx

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--tukillri5nr7fxtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXY5VoQAKCRDj7w1vZxhR
xYKdAQD7nEpueam4PSkHSKh8hVDVyPCVaXN/FdzJgTHzv4XOkQEAzBZjTbENrCBg
0RfwWhlSmQVPQssAzVRlemjHylV2zQg=
=95Js
-----END PGP SIGNATURE-----

--tukillri5nr7fxtt--

--===============1289116385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1289116385==--
