Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E3D840E27
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 18:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FD110E1A4;
	Mon, 29 Jan 2024 17:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9318010E1A4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 17:15:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD7BF623C1;
 Mon, 29 Jan 2024 17:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37ED9C433C7;
 Mon, 29 Jan 2024 17:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706548471;
 bh=IY3+mOCEfpNRLEE5Yd9Y6ozPNm56tWYWYfMzj2fiZBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UHZDFLPgwQ0sr4CtIfiwyqL8cTMuyQS0zkhd8RPXtfFhv7BmwcM0bRhsZodkTxY0x
 feEJFkNORnaL3pgf3bDFL4qyuKdTOAQUT/IwaGwM0HHTD5inHfVALZh1r6dTqFGu2U
 eYy3JZ9y8ImdyPkGQjSMKIDdGFkbLH+JJ0m59f9qQGmhdTv09w1uoG9/52KcbW5zgc
 iQA2yyhBOyrwRa7AY7U+WCPmQRBxmsFqifdEq6kiW+oTMMkMHxgM/DYd2xahOBJ/HI
 W1wkQdgz/KKaGficJTTnCZEJf4gpsRsQ+/uDyaRiv/y4Lgh5DRIiM5EpVMZ+BQdqTe
 FIoemojaaOPbg==
Date: Mon, 29 Jan 2024 17:14:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma.B@microchip.com
Subject: Re: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Message-ID: <20240129-dwindle-salvaging-1ae9da61c085@spud>
References: <20240119-character-mardi-43571d7fe7d5@wendy>
 <da60f9f3-f955-4a87-a020-5710185953c0@microchip.com>
 <20240122-stark-duress-2f59294dcf27@spud>
 <4906b7e2-0ddb-4d3c-a48b-e16278f2d649@microchip.com>
 <20240124-lend-emerald-1028fe65cc39@spud>
 <c3c30bf2-e7c2-4861-bfdf-519a7afde476@microchip.com>
 <20240125-proved-passage-7fa128f828db@wendy>
 <51da296d-a8a9-417a-8875-3b5e866a89a3@microchip.com>
 <20240126-uncommon-stout-dd3243e6b43f@spud>
 <e2080c19-a62b-4716-8de1-d3bdc299a49c@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O8JBIuMwLVxn+xwX"
Content-Disposition: inline
In-Reply-To: <e2080c19-a62b-4716-8de1-d3bdc299a49c@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 Linux4Microchip@microchip.com, dri-devel@lists.freedesktop.org,
 Nicolas.Ferre@microchip.com, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--O8JBIuMwLVxn+xwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 03:41:22AM +0000, Dharma.B@microchip.com wrote:
> I will proceed with updating the clock names to include "lvds pll" and=20
> adjusting the clocks minitems to 3. Does this seem appropriate to you?
>=20
> Please let me know if there are any additional considerations or=20
> specific aspects that require attention.

That seems okay, thanks.

--O8JBIuMwLVxn+xwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbfc8AAKCRB4tDGHoIJi
0pzyAPwOmSdqPU9+jAtNozvTctC+s8e/7JFYs7RiVScM6OBpCQEAsK+qKhVr8wPM
fDpDFMHLAEMRGod043qDO4TmwX3FfgA=
=/UpN
-----END PGP SIGNATURE-----

--O8JBIuMwLVxn+xwX--
