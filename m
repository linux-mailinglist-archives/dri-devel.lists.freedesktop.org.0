Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035A772FA38
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 12:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A1010E43B;
	Wed, 14 Jun 2023 10:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984A410E444
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 10:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1686737641; x=1718273641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VAPthzcnnqlNt/nQZ0vV4048nkzs7GOHEYdG5MsUCs4=;
 b=X0qnD3ZxFHUzfprsHgjIISSqlBHTzcBnRZk9hJfZPkK8Nc4vYkKhp8DF
 OwUXIppiciGDbeN2bYaZ0VG95TwAqjnMO7uOGQM53L4fZVCrpmUxfsb3p
 DF+8k+i33XXboeA8J/zNiBZsEKW9zZZPyn8IaJEHuApB3pfBhBW2CJr+Q
 eElNE/TAW+jWoI2Ab3+DPukg8In+hEl2IweVV1FSIZA0NmjMG4hlAVFEZ
 50n3G+UHvhqwQKvCkzFWsk3LuiDkJNMuAHegcm43DGT217G1biR/ScE0R
 oKEtd9Fqhw2mAQXNc14AyUHdcnWhOqBQTlJQXjCRZjcl/BD0EveysPgqd g==;
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
 d="asc'?scan'208";a="220235278"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Jun 2023 03:13:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 14 Jun 2023 03:13:10 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 14 Jun 2023 03:13:06 -0700
Date: Wed, 14 Jun 2023 11:12:41 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 5/9] drm: atmel-hlcdc: add compatible string check for
 XLCDC and HLCDC
Message-ID: <20230614-prompter-culture-e0e0be452dba@wendy>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-6-manikandan.m@microchip.com>
 <20230613-unvocal-employed-aff3cf92d60a@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QuDUUakIziv3ViOc"
Content-Disposition: inline
In-Reply-To: <20230613-unvocal-employed-aff3cf92d60a@spud>
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
Cc: alexandre.belloni@bootlin.com, Nayabbasha.Sayed@microchip.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hari.PrasathGE@microchip.com, krzysztof.kozlowski+dt@linaro.org,
 Varshini.Rajendran@microchip.com,
 Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 Balamanikandan.Gunasundar@microchip.com, lee@kernel.org,
 Dharma.B@microchip.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 robh+dt@kernel.org, Durai.ManickamKR@microchip.com,
 linux-arm-kernel@lists.infradead.org, Balakrishnan.S@microchip.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--QuDUUakIziv3ViOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 07:16:06PM +0100, Conor Dooley wrote:
> On Tue, Jun 13, 2023 at 12:34:22PM +0530, Manikandan Muralidharan wrote:

> > +		/* Other SoC's that supports HLCDC IP */
>=20
> Should this be "Other SoCs that do not support HLCDC IP"?

Clearly a reading comprehension fail here. Sorry about the noise!

--QuDUUakIziv3ViOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZImSmQAKCRB4tDGHoIJi
0jAhAQD1nRPDu93AVOgMRGuJ3DNPaHTNqE85XfDmtkkk6MV97gD+I9A9uWAQ7XzY
zbG4X1x8w6EH2/vHSA6fH1pHmGiqYQ4=
=Thzy
-----END PGP SIGNATURE-----

--QuDUUakIziv3ViOc--
