Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9D9CCB190
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 10:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5598C10E961;
	Thu, 18 Dec 2025 09:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="BOy92H+T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Thu, 18 Dec 2025 09:13:15 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CFE10E95C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 09:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1766049195; x=1797585195;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XX7b7q9Edhc0k6MzMJrFi4FJw/WKh29AyKl9J8y+gVc=;
 b=BOy92H+TUXSDDcQ2/h+wMeLmu4EVGvtMq5nwg2MTiHOkOnNU4uDl5chq
 KpdQRuL7CtnItJz/UIpOdy2JrbKSsMs6h9LeEvP351l761aGopdb9tl9G
 g7Z43115XQK/ZTIcsaovhYxjoEpc7Q31jxcOAkjh/WxSzx/WI31yy6yKL
 q7yPsDPBFNRqp8O6crm16Lzg4Y8wC7Imt5Q7QO+PfSLjQXjYloCCTX1EJ
 c7UwpZbmuRKO5kyzDthS4SnsnaDbOJQoMUJj7dGDSV0s7GqCbALmL5czC
 IKUUyY+h1GWyXeSlncSThVFFfFzPZFqhSHtbhg9PCmSUmumMXlgOaBO2C A==;
X-CSE-ConnectionGUID: Ve+L4/dBQ2anPaGCYtCixQ==
X-CSE-MsgGUID: Vc5HPdrpQn2pxdPLCq9osw==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; d="scan'208";a="282091071"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:06:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 02:05:29 -0700
Received: from [10.171.248.75] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 02:05:24 -0700
Message-ID: <66b2bbd4-a758-4a20-981f-07fcdb116412@microchip.com>
Date: Thu, 18 Dec 2025 10:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mfd: atmel-hlcdc: Add compatible for sama7d65 XLCD
 controller
To: Manikandan Muralidharan <manikandan.m@microchip.com>, <lee@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <dharma.b@microchip.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20251218040521.463937-1-manikandan.m@microchip.com>
 <20251218040521.463937-2-manikandan.m@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20251218040521.463937-2-manikandan.m@microchip.com>
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
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add compatible for sama7d65 XLCD controller.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
> changes in v2:
> - isolate this change into a dedicated patch
> ---
>   drivers/mfd/atmel-hlcdc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
> index 4c4e35d404f3..c3f3d39bf584 100644
> --- a/drivers/mfd/atmel-hlcdc.c
> +++ b/drivers/mfd/atmel-hlcdc.c
> @@ -140,6 +140,7 @@ static const struct of_device_id atmel_hlcdc_match[] = {
>   	{ .compatible = "atmel,sama5d4-hlcdc" },
>   	{ .compatible = "microchip,sam9x60-hlcdc" },
>   	{ .compatible = "microchip,sam9x75-xlcdc" },
> +	{ .compatible = "microchip,sama7d65-xlcdc" },
>   	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, atmel_hlcdc_match);

