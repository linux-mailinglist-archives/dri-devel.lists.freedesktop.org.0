Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB99FD1B254
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 21:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597AF10E038;
	Tue, 13 Jan 2026 20:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="jhHjuAvr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8357910E038
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1768334866; x=1768939666; i=wahrenst@gmx.net;
 bh=kLqIweRiHHZXLWpYMmQpkhFs4IB4LuXUNRGIExyhc/w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=jhHjuAvrtw8Fz9o6/yVBX02h7hXWxxPTd09u5lNlRzM1vtf+Q6xUppzDvWi5RE4v
 Tz6oFiIPKuAXirdAaynPc9Lk9GC5wO+8apOkzpRWoorj0mekWKGIs/NRSgViz3ID8
 pUYkpoNCrK6d8FHEOBMYG5EY6sNGyb5r6P/q0BRmXhhayjrbTGxQC6QFFNSZ2Dcql
 1zGjk2Iut5EiKEOITDpyTrovkPLKckBVjZ0T53EhGSre43xP2Ru5z4c/kwCNz/Gb6
 rYKeO7Ib9l/V0+w5AeV63sv8g3+CkWlwDbfqEsnqT3HnBpn/l25rbZnzgW2N9OLPL
 8Vj0w7aqthESvKbHNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.209.202]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6qp-1wCKPh2Oct-00lWnE; Tue, 13
 Jan 2026 21:07:46 +0100
Message-ID: <c93d7eb0-2591-48e7-97e9-3fd899b1026c@gmx.net>
Date: Tue, 13 Jan 2026 21:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Add V3D device node
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-dev@igalia.com
References: <20260113192902.48046-2-mcanal@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260113192902.48046-2-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lk7Dkz0mthlPu9uENRCv7r/Qru9BqtLUqZQ+beOsXhqZ6ni5/n3
 X/PgPxQ55bq21hVZx4ICdOOkb6r16P1eq7u/9SDXJHCaSeMDvXMsAbFbvfF283dEspA8e8E
 woTL0EdTlq4w/7hk1bSe1d01y71F9Bisx3J9zl2tXYbngYiO94gIzSrsqg1s1FHzda8b+X5
 HoWVAcUt+8YZV9ho9XCTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FsoGziLSOTE=;zlI6tP8Pudgi47wdOZdRQYNuCXD
 +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
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

Hi Ma=C3=ADra,

Am 13.01.26 um 20:28 schrieb Ma=C3=ADra Canal:
> Commits 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D 7.x")
> and 6fd9487147c4 ("drm/v3d: add brcm,2712-v3d as a compatible V3D device=
")
> added driver support for V3D on BCM2712, but the corresponding device
> tree node is still missing.
>
> Add the V3D device tree node to the BCM2712 DTS.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>   .../boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  |  4 ++++
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 14 ++++++++++++++
>   2 files changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/=
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> index 7d4742ebe247..97522c6803c5 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
this file doesn't exist in linux-next anymore.

Do you mean bcm2712-rpi-5-b-base.dtsi ?
> @@ -247,3 +247,7 @@ &pcie1 {
>   &pcie2 {
>   	status =3D "okay";
>   };
> +
> +&v3d {
> +	clocks =3D <&firmware_clocks 5>;
> +};
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot=
/dts/broadcom/bcm2712.dtsi
> index 330a121ebfcb..4c9c63fcf037 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/bcm2835-pm.h>
>  =20
>   / {
>   	compatible =3D "brcm,bcm2712";
> @@ -642,6 +643,19 @@ mip1: msi-controller@1000131000 {
>   			msi-ranges =3D <&gicv2 GIC_SPI 247 IRQ_TYPE_EDGE_RISING 8>;
>   			brcm,msi-offset =3D <8>;
>   		};
> +
> +		v3d: gpu@2000000 {
Please keep the order of the addresses. In case v3d is really part of=20
the axi bus, then this should be the first child node of axi (2000000 <=20
1000100000).

Thanks
> +			compatible =3D "brcm,2712-v3d";
> +			reg =3D <0x10 0x02000000 0x0 0x4000>,
> +			      <0x10 0x02008000 0x0 0x6000>,
> +			      <0x10 0x02030800 0x0 0x0700>;
> +			reg-names =3D "hub", "core0", "sms";
> +
> +			power-domains =3D <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
> +			resets =3D <&pm BCM2835_RESET_V3D>;
> +			interrupts =3D <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
> +		};
>   	};
>  =20
>   	vc4: gpu {

