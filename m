Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC255D19AC1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 15:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F1B10E356;
	Tue, 13 Jan 2026 14:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="c6lyltNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EE510E356
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1768316395; x=1799852395;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jC2AsUFaWKrDJEStofCk0XWXz8JM2i3DMt8adlwoSOo=;
 b=c6lyltNyI1d7xFQCXSFdHVWFKYU1uTcNa0pmEn90OIg+HKX57YyiI1Vi
 xZApEDZZsb1O+5i2Dlk8G3znjJJJiLxnKY7h4fvll7tE+y5Ee5IvHd/IG
 GJeMMXNOUczAnX4v0lGZmM3Z9hIqywxTxB0hbfbIHNrfKQT33zrQ2Zv7X
 vNyK8T27ZoPlJ2pBGxtWEkl/4kIrssKfYrit0i1wh1uJ4k+60DIg3nbV3
 NmGAr+tiDMwqbKVAMATCRRQ4bX+5AcXtJrPLTSyVL8kd8oHyhJESDNIrr
 i1ShzZqAWIXzOfixbejsZGIkkm6RWJvVG8qwBANdcr0hf/VdGyigVB0zO A==;
X-CSE-ConnectionGUID: sRFtzLONRu6S+I4SjuArAw==
X-CSE-MsgGUID: VUqyUxX7Sb2mCTacvPGjBA==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; d="scan'208";a="283174523"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 07:59:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 13 Jan 2026 07:59:51 -0700
Received: from [10.159.205.69] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 13 Jan 2026 07:59:47 -0700
Message-ID: <d4d76895-9029-4913-8873-e9a41852f677@microchip.com>
Date: Tue, 13 Jan 2026 15:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260113-cpitchen-mainline_gfx2d-v5-0-9cdab8fa699b@microchip.com>
 <20260113-cpitchen-mainline_gfx2d-v5-4-9cdab8fa699b@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260113-cpitchen-mainline_gfx2d-v5-4-9cdab8fa699b@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 13/01/2026 at 14:10, Cyrille Pitchen wrote:
> Add support for the GFX2D GPU.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sam9x7.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
> index 46dacbbd201ddb68a7456d6fe1afafa59db90ec8..79a82962264f51c4c243530b9dad9010f8cf1347 100644
> --- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
> @@ -292,6 +292,14 @@ AT91_XDMAC_DT_PERID(26))>,
>   			status = "disabled";
>   		};
>   
> +		gpu: gpu@f0018000 {
> +			compatible = "microchip,sam9x7-gfx2d";
> +			reg = <0xf0018000 0x4000>;

I see that the register map is much smaller that this 0x4000 size required.

> +			interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
> +			status = "disabled";
> +		};
> +
>   		i2s: i2s@f001c000 {
>   			compatible = "microchip,sam9x7-i2smcc", "microchip,sam9x60-i2smcc";
>   			reg = <0xf001c000 0x100>;
> 

Best regards,
   Nicolas
