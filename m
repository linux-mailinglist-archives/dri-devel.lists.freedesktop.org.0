Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E80C9621B4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 09:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C3B10E4C4;
	Wed, 28 Aug 2024 07:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="m+IuM1tT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507DC10E4C4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 07:48:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62B78FF808;
 Wed, 28 Aug 2024 07:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724831329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y5zLZsHecvlr5wSYFNatvZpgULQ6Qmig03QDSQmQd4Y=;
 b=m+IuM1tTx5x1LLw++vJv+fVKTLfoYsQe486sDQqOB4JvPo0i/JIlUYXEqpBcD7ew+lG8B5
 ubnACfagbmX36TbQzavKFAA1nP2nJ5ZwxCZGhsqN7mUYMGwrGChsrNnlfh7Al2nn234Vw6
 Qnc4toma/uSIkeZ1OdF1EdVuicT2P1hY9CIe8yxDpCuOR76KOtIv1DHColUWaqmuiJ3bIs
 0GrAY77FOYA2mQdSs6dYdUZHwrkSlhieu3DRPo3qY2QJPwYsg1S8TfExbKa/a6fFAA4i+3
 ZLDUWtxAjoEyXiq2awP9FrIKW+GiEySKt/VFt0QRGEtxj52f7nxEMphy/vnEPw==
Date: Wed, 28 Aug 2024 09:48:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
Message-ID: <20240828094846.166c7de6@xps-13>
In-Reply-To: <fd0d73cf-6bce-4f7b-9513-5f434ab9ae00@gmail.com>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
 <20240821071132.281018-2-hpchen0nvt@gmail.com>
 <20240823182616.5a85e1ae@xps-13>
 <fd0d73cf-6bce-4f7b-9513-5f434ab9ae00@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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

Hi Hui-Ping,

hpchen0nvt@gmail.com wrote on Wed, 28 Aug 2024 10:47:17 +0800:

> Dear Miqu=C3=A8l,
>=20
> Thank you for your reply.
>=20
>=20
>=20
> On 2024/8/24 =E4=B8=8A=E5=8D=88 12:26, Miquel Raynal wrote:
> > Hi,
> >
> > hpchen0nvt@gmail.com wrote on Wed, 21 Aug 2024 07:11:31 +0000:
> > =20
> >> Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.
> >>
> >> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>   .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++=
++
> >>   1 file changed, 93 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma3=
5d1-nand.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand=
.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> >> new file mode 100644
> >> index 000000000000..152784e73263
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> >> @@ -0,0 +1,93 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
> >> +
> >> +maintainers:
> >> +  - Hui-Ping Chen <hpchen0nvt@gmail.com>
> >> +
> >> +allOf:
> >> +  - $ref: nand-controller.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - nuvoton,ma35d1-nand =20
> > Can we please use the -nand-controller suffix. A NAND is a the common
> > name for a chip with storage inside. You are describing a host
> > controller that can be connected to in order to talk to a NAND. =20
>=20
>=20
> Okay, I will change it to nuvoton,ma35d1-nfi.
>=20
> Because in our platform, it is the NAND Flash Interface.

nfi is not an acronym that is understandable by everyone. Please use
-nand-controller. Don't be worried by the size of the string.

You can use the acronym as prefix for your NAND controller functions
though.

Thanks,
Miqu=C3=A8l
