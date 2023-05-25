Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCB97105AC
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 08:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8170C10ED9A;
	Thu, 25 May 2023 06:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51F710ED9A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 06:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1684996021; x=1716532021;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rV7X8sJTUMiQ+nwFrbSH9S0xiOFtSvj7VBi8hCz7dKA=;
 b=SuZk3qB7qOVXNZkjU3OksV7rkaQCwzUM1MyZsV+60eIiY2x17DAzV095
 U6mJ5zYGHgx3btCupM2K7tTym+dAvGhbrEYRW/IJsZAdDWiX2szqWfsm9
 jZbrFNV49yVVdZDRs1pgf4BKSQlcYQcTKHzvN/bsFE8IIEn1pfP1L9r0j
 j+Ay4qYMHxIIvDD29UgH7O4hQXc2FkmivZPMqmMpqa9FTVdgt1WHDEoy7
 R2MbbOPousxI22EmsTCPmLTsCHNF+b6v0zdeLdILOhZRK2wgSYOc4skRg
 CKUySMikKVKBJ882NwMBv9oe7+lvm0OCsk3im1hfpPHsn2pElvZJbpPDG Q==;
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
 d="asc'?scan'208";a="217194852"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 May 2023 23:26:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 24 May 2023 23:26:56 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 24 May 2023 23:26:53 -0700
Date: Thu, 25 May 2023 07:26:31 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: Re: [v3 2/4] drm/panel: Support for Starry-himax83102-j02 TDDI
 MIPI-DSI panel
Message-ID: <20230525-relearn-rug-0a75ea9674f9@wendy>
References: <CAD=FV=XUuzjjLq3YP3683jOd06odwk5Dox5MS8oY8goB-_8T5w@mail.gmail.com>
 <20230525025000.3692510-1-yangcong5@huaqin.corp-partner.google.com>
 <20230525025000.3692510-3-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CkngReavlAbqfK2R"
Content-Disposition: inline
In-Reply-To: <20230525025000.3692510-3-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--CkngReavlAbqfK2R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 10:49:58AM +0800, Cong Yang wrote:
> The Starry-himax83102-j02 is a 10.51" WUXGA TFT panel. which fits in nice=
ly
> with the existing panel-boe-tv101wum-nl6 driver. From the datasheet[1], M=
IPI
> needs to keep the LP11 state before the lcm_reset pin is pulled high, so
> increase lp11_before_reset flag.
>=20
> [1]: https://github.com/HimaxSoftware/Doc/tree/main/Himax_Chipset_Power_S=
equence
>=20
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

I didn't Ack this (or 4/4). If the patches are otherwise acceptable,
perhaps the committer could remove my A-b from the non dt-binding
patches.

Thanks,
Conor.

--CkngReavlAbqfK2R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG7/lwAKCRB4tDGHoIJi
0uSCAP9Z8K30BSavxbACku/asQVqLBzDha1SIla3Ye4HGvrPMAEAzU40VFU1stOu
a8BR8h+xFvzt7BYgZfdbhs8oI7iw5wo=
=odpO
-----END PGP SIGNATURE-----

--CkngReavlAbqfK2R--
