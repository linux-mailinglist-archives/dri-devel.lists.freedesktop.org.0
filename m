Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9B51BBE0C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB1B6E3D3;
	Tue, 28 Apr 2020 12:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FBD8918F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 08:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1588060825;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=K6NDm2J1xaVXm6jF6KgArlrb/oodSBZNUiS/2yF1Wro=;
 b=XlYxrAJB/G3/v9edOSeAi+5jr1KP/83jczirSVnsmi9GYzmBuP27bBAAUop44R2HDs
 gLUNySirRQYg00i3dgl9N/YrpSROW1JlIDZuuEfDwyj3UvAFdtyq5H+OxH61DUTHvWBg
 pKYd2k87Ji1l4Ziz9Hlgt0GOx7694IyJD5bNCl1D6+oulrrDuRyIcNDfRbLgrfT6q1fV
 uriJ+3NT6F/EOP3NDyIoViI/fSF4/cW0znxtSDw+Qi++YdPI/5qbdre37LfaMAfsE6/J
 VoQ7SW3zQVxmoUZcQB8q3Zi2fkHjE4E9bLMVTRx5FqcISgV+wy2nu1yAmKVZMrHDItjf
 gRHw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PuwDas9g=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
 with ESMTPSA id R0acebw3S7xnNsG
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 28 Apr 2020 09:59:49 +0200 (CEST)
Subject: Re: [PATCH v7 06/12] ARM: DTS: omap4: add sgx gpu child node
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <DOBE9Q.00IRKFIW0JMG@crapouillou.net>
Date: Tue, 28 Apr 2020 09:59:22 +0200
Message-Id: <98FA6E7D-0DC7-4C70-A228-038BB9799290@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
 <5f493a50fedef45c3cacd91cbf999092d9c05164.1587760454.git.hns@goldelico.com>
 <DOBE9Q.00IRKFIW0JMG@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 =?iso-8859-1?Q?Beno=EEt_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 26.04.2020 um 14:50 schrieb Paul Cercueil <paul@crapouillou.net>:
> =

> Hi Nikolaus,
> =

> Le ven. 24 avril 2020 =E0 22:34, H. Nikolaus Schaller <hns@goldelico.com>=
 a =E9crit :
>> Add SGX GPU node with interrupt. Tested on PandaBoard ES.
>> Since omap4420/30/60 and omap4470 come with different SGX variants
>> we need to introduce a new omap4470.dtsi. If an omap4470 board
>> does not want to use SGX it is no problem to still include
>> omap4460.dtsi.
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> arch/arm/boot/dts/omap4.dtsi   | 11 ++++++-----
>> arch/arm/boot/dts/omap4470.dts | 15 +++++++++++++++
>> 2 files changed, 21 insertions(+), 5 deletions(-)
>> create mode 100644 arch/arm/boot/dts/omap4470.dts
>> diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
>> index 763bdea8c829..15ff3d7146af 100644
>> --- a/arch/arm/boot/dts/omap4.dtsi
>> +++ b/arch/arm/boot/dts/omap4.dtsi
>> @@ -389,7 +389,7 @@ abb_iva: regulator-abb-iva {
>> 			status =3D "disabled";
>> 		};
>> -		target-module@56000000 {
>> +		sgx_module: target-module@56000000 {
>> 			compatible =3D "ti,sysc-omap4", "ti,sysc";
>> 			reg =3D <0x5600fe00 0x4>,
>> 			      <0x5600fe10 0x4>;
>> @@ -408,10 +408,11 @@ target-module@56000000 {
>> 			#size-cells =3D <1>;
>> 			ranges =3D <0 0x56000000 0x2000000>;
>> -			/*
>> -			 * Closed source PowerVR driver, no child device
>> -			 * binding or driver in mainline
>> -			 */
>> +			gpu: gpu@0 {
>> +				compatible =3D "ti,omap4-sgx540-120", "img,sgx540-120", "img,sgx540=
";
>> +				reg =3D <0x0 0x2000000>;	/* 32MB */
>> +				interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>> +			};
>> 		};
>> 		/*
>> diff --git a/arch/arm/boot/dts/omap4470.dts b/arch/arm/boot/dts/omap4470=
.dts
>> new file mode 100644
>> index 000000000000..f29c581300bf
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/omap4470.dts

^^^ there is also a missing "i" in the file name

>> @@ -0,0 +1,15 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Device Tree Source for OMAP4470 SoC
>> + *
>> + * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.co=
m/
>> + *
>> + * This file is licensed under the terms of the GNU General Public Lice=
nse
>> + * version 2.  This program is licensed "as is" without any warranty of=
 any
>> + * kind, whether express or implied.
>> + */
>> +#include "omap4460.dtsi"
>> +
>> +&sgx {
> =

> Does this even compile?

Good question.

So far there is no well known eval board in mainline that #includes this .d=
tsi (because it is new) and therefore it passes any compile tests.

  DTC     arch/arm/boot/dts/omap4470-test.dtb - due to target missing
Error: arch/arm/boot/dts/omap4470.dtsi:13.1-5 Label or path sgx not found

I have now added a dummy board (not to be mainlined) for my own compile tes=
t...

> =

> The node's handle is named sgx_module, not sgx.

Indeed. A fix is queued for v8.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
