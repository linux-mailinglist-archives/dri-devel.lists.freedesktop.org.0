Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52118849B30
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 13:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669C611250C;
	Mon,  5 Feb 2024 12:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="r91jsD1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936B111250C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1707137932; x=1738673932;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=bP9ZnCfCpTt/rbFHJ4W2dlbUkjm0HFaJsGuoyQtjz0k=;
 b=r91jsD1mfb8ah7ci0vK5YVXdqDLVAMA1l4HNH2OIqU6mB7CvtCoW9ZjS
 sTao1J9xZ1MaOBniDQpAU5sHdmLgB3fcGOP98zm9Wd5xnw9wlTpousr5I
 lA8N1apan9OJsj/iBK3jn6WtiWpM+3ITzikiCgU9LUxDJ1udhjLu40XAC
 WqQuWC8lORSxKYbysNfFxhiPhtSNnYT9fN9FBpSenLQXIOnKtib4q0P+Y
 CEV0wA9b+KiV1kFx59PY78WpB8qy/+QpK0ue+vVtDivWT3+UzyuASaDWl
 XgKPBpzEHQ0jpVBcPfaA80NTlw1LBWOgreNCH67ki9j3OzQ707qLPnnHA w==;
X-CSE-ConnectionGUID: +9XfpNPRTg+UlDr0fHTZpQ==
X-CSE-MsgGUID: q0fQlXMbT3mAJDCiZ/C8Ew==
X-IronPort-AV: E=Sophos;i="6.05,245,1701154800"; d="scan'208";a="17127417"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Feb 2024 05:51:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 05:51:24 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 5 Feb 2024 05:51:19 -0700
Message-ID: <8b43b2b9-e77c-479f-9ed8-58554f372d06@microchip.com>
Date: Mon, 5 Feb 2024 13:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux][PATCH v2 4/4] ARM: configs: at91: Enable LVDS serializer
 support
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
 <20240205110609.217022-5-dharma.b@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240205110609.217022-5-dharma.b@microchip.com>
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
> Enable LVDS serializer support for display pipeline.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Acked-by: Hari Prasath Gujulan Elango <hari.prasathge@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   arch/arm/configs/at91_dt_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
> index 71b5acc78187..6a7714beb099 100644
> --- a/arch/arm/configs/at91_dt_defconfig
> +++ b/arch/arm/configs/at91_dt_defconfig
> @@ -143,6 +143,7 @@ CONFIG_VIDEO_OV2640=m
>   CONFIG_VIDEO_OV7740=m
>   CONFIG_DRM=y
>   CONFIG_DRM_ATMEL_HLCDC=y
> +CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
>   CONFIG_DRM_PANEL_SIMPLE=y
>   CONFIG_DRM_PANEL_EDP=y
>   CONFIG_FB_ATMEL=y

