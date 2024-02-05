Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2797849B26
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 13:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C57112509;
	Mon,  5 Feb 2024 12:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="YFnOEbn6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 354 seconds by postgrey-1.36 at gabe;
 Mon, 05 Feb 2024 12:57:40 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E77112509
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 12:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1707137860; x=1738673860;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=lSuPX0mNqwFU6zNkfMxkdvbdFd4yWz3j9e89k4x3+Xw=;
 b=YFnOEbn6EJ0hhVmdW8NZ8wH9dC6FbusCn93Ex9a1lCK/Sc9HSufHN5yB
 hw7DMpXd6L5xtN04COeGZlzsHmtibiGV1Ghd/dxEqtPhcOtIvXY6j0iTi
 VRabLgabrDdethd12UKivWGicc/UVee70fWkKsSMDjr4I9rTMDRmpVOB5
 N8UhIqQDWM87GODSj8wH9LOs3FZfUxUF6HlGun8Ac2jRghtwA7WAkqgqs
 l264QtVHg1rl4Psgn3tLiL3eX9YueSgsrYVT6+2ORoVW2OfxagQjG2+eV
 4VLlmA30vy3XFe72Gt5vG6OUKZn6SssOCKjbCqOc/EO0PYz/hbSsGHZol g==;
X-CSE-ConnectionGUID: vkCC3fSQQzSATfQ0PhcR1w==
X-CSE-MsgGUID: kIk9RWttQhaJv1roY+CkyQ==
X-IronPort-AV: E=Sophos;i="6.05,245,1701154800"; d="scan'208";a="15768033"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Feb 2024 05:56:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 05:56:34 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 5 Feb 2024 05:56:29 -0700
Message-ID: <f67e7264-aeb7-4210-9d01-28c2c9eefe54@microchip.com>
Date: Mon, 5 Feb 2024 13:55:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux][PATCH v2 3/4] MAINTAINERS: add SAM9X7 SoC's LVDS
 controller
Content-Language: en-US, fr-FR
To: Dharma Balasubiramani <dharma.b@microchip.com>, <andrzej.hajda@intel.com>, 
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux@armlinux.org.uk>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <geert+renesas@glider.be>, <arnd@arndb.de>,
 <hari.prasathge@microchip.com>, <Jason@zx2c4.com>, <rientjes@google.com>,
 <rdunlap@infradead.org>, <vbabka@suse.cz>, <manikandan.m@microchip.com>
References: <20240205110609.217022-1-dharma.b@microchip.com>
 <20240205110609.217022-4-dharma.b@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240205110609.217022-4-dharma.b@microchip.com>
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

On 05/02/2024 at 12:06, Dharma B - I70843 wrote:
> Add the newly added LVDS controller for the SAM9X7 SoC to the existing
> MAINTAINERS entry.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

If new series is to be done, this entry should be placed before this one
"MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER"

Otherwise:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Regards,
   Nicolas


> ---
> Changelog
> v1 -> v2
> - No Changes.
> ---
>   MAINTAINERS | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a7c4cf8201e0..24a266d20df6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14230,6 +14230,14 @@ S:	Supported
>   F:	Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
>   F:	drivers/power/reset/at91-sama5d2_shdwc.c
>   
> +MICROCHIP SAM9x7-COMPATIBLE LVDS CONTROLLER
> +M:	Manikandan Muralidharan <manikandan.m@microchip.com>
> +M:	Dharma Balasubiramani <dharma.b@microchip.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/display/bridge/microchip,sam9x7-lvds.yaml
> +F:	drivers/gpu/drm/bridge/microchip-lvds.c
> +
>   MICROCHIP SOC DRIVERS
>   M:	Conor Dooley <conor@kernel.org>
>   S:	Supported

