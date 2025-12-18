Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAF1CCB18D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 10:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356A810E93D;
	Thu, 18 Dec 2025 09:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="tMJJ92Ep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 18 Dec 2025 09:12:53 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2356B10E93D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 09:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1766049171; x=1797585171;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZSfKuyhknbDckhEuDJksiGTYSdFPIDWNu7knsS8JTrw=;
 b=tMJJ92Ep+j8ZufwElqNIotiftnA+hkW1kjORQj01NuXImZDIgag3Wx6i
 m8Vsvcgh0/qt9qT+nTRKBgCSSjVH5vRxA4WICuAAwxBer8ZH/8zGIeKRR
 B8NIkMtwMW1hsaON6CrtGXs41yxTKCdFXdV1+Hy40P7BcjRJ19mMCaymD
 cmX9QPo5TbaOngUPZErY5rTETRniDH1vQTUbnVSIKaiBZ0r6BS3Tvicxz
 P0RU6/AJLTF6xbwivlt4XNuUHsO0a6wLJwWBg/JQSedx/By5XMnO8/yi+
 hRbfOnUgK+bVmg/P/a3vliYd152b3Z1p/nMtYKaKmpo3xKAtKAeipw4qU A==;
X-CSE-ConnectionGUID: 6Eh0cHflS2uiAW2+IC6f/A==
X-CSE-MsgGUID: KOwhJPFpTp2RUlyqCRGyKQ==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; d="scan'208";a="50039434"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2025 02:05:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Dec 2025 02:05:17 -0700
Received: from [10.171.248.75] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 02:05:12 -0700
Message-ID: <c60323c4-a938-4ceb-b0f4-82166ebfb2ad@microchip.com>
Date: Thu, 18 Dec 2025 10:05:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: atmel,hlcdc: Add sama7d65
 compatible string
To: Manikandan Muralidharan <manikandan.m@microchip.com>, <lee@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <dharma.b@microchip.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20251218040521.463937-1-manikandan.m@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20251218040521.463937-1-manikandan.m@microchip.com>
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

On 18/12/2025 at 05:05, Manikandan Muralidharan wrote:
> Add LCD compatible string for sama7d65.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
>   Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> index 4aa36903e755..dfee8707bac2 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> @@ -25,6 +25,7 @@ properties:
>         - atmel,sama5d4-hlcdc
>         - microchip,sam9x60-hlcdc
>         - microchip,sam9x75-xlcdc
> +      - microchip,sama7d65-xlcdc
>   
>     reg:
>       maxItems: 1
> 
> base-commit: e8c28e16c3ebd142938aee296032c6b802a5a1d4

