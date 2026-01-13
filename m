Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568CFD19C1F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA38410E4EF;
	Tue, 13 Jan 2026 15:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="XjfUI6hM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EAC10E4EF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1768317095; x=1799853095;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7XznA18BA70UboFGcQVIjFlVsDecJjM7njq32R22DrE=;
 b=XjfUI6hMLptuz4mTDBw3ElweDYUvYsuxuMln1fZhugY2M6oezogqeHlj
 jp/wOXNrK9nccRxkUqgpRtVndRo8oUKO/X7AzYxeCJD3oIvkqRccWHyr/
 iMx56Wr2jrtFfwFO4JgkriZDK1zpfzEjLwiuHqhGbsm+MrywaZzuYgErk
 94pVO+KaYZ2uMuL5pqWeIuTYcf5Dcs+NvLx9HIXQiT9JhJe5NXYBcpfSE
 tjA+agpiaJ6oNAU7yFDAeJlNtc3RU401nWe1bTovL6qx6BrAV1xJyXqHk
 E7n/HBph1rTIjPnodDQ1cIWtlK65ediWF3+lZ1RqbDSGQGm029dJlV6aL w==;
X-CSE-ConnectionGUID: elVzir9fTFac2yKBdCUdNg==
X-CSE-MsgGUID: PRgTA9VDTSiMPgwjr6n34Q==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; d="scan'208";a="52247948"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:11:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 13 Jan 2026 08:11:12 -0700
Received: from [10.159.205.69] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 13 Jan 2026 08:11:09 -0700
Message-ID: <468e4624-355b-400f-8d03-4db5c37e3ec7@microchip.com>
Date: Tue, 13 Jan 2026 16:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
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
 <20260113-cpitchen-mainline_gfx2d-v5-3-9cdab8fa699b@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260113-cpitchen-mainline_gfx2d-v5-3-9cdab8fa699b@microchip.com>
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

On 13/01/2026 at 14:10, Cyrille Pitchen wrote:
> Add support for the GFX2D GPU.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> index b075865e6a7688005d471665459b3f6f1f26f7a4..338a0f3b336ffa6f1e3f900a4b4a58e4e3f93bb8 100644
> --- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> @@ -353,6 +353,14 @@ AT91_XDMAC_DT_PERID(26))>,
>   				status = "disabled";
>   			};
>   
> +			gpu: gpu@f0018000 {
> +				compatible = "microchip,sam9x60-gfx2d";
> +				reg = <0xf0018000 0x4000>;

Same here, probably smaller size for register map is better.

Regards,
   Nicolas

> +				interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
> +				status = "disabled";
> +			};
> +
>   			i2s: i2s@f001c000 {
>   				compatible = "microchip,sam9x60-i2smcc";
>   				reg = <0xf001c000 0x100>;
> 

