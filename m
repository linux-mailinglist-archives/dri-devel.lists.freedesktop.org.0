Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DFAA07427
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 12:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A2310ED67;
	Thu,  9 Jan 2025 11:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Y5KC+4xv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3F610ED67
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 11:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736420771;
 bh=E45GLpk8zksDScKdK3oLdV64rwa0TmpfqdEorcPKJb0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y5KC+4xviIMPss9mxz+YcOCZCw0elqToOm1NDSspyQH/u56olBue/2pkpEE/U3Hug
 6w+z/w33fyCv+w1Tf2ni99hxtub2RoATT2OeoImVZyaMN36M3YK8SyupLjSRAcYTEh
 y5Qli6PiuDp/bDSdcPaUFrqgHWKsx8C1e8qFrkWA1BQkOitJzbVR6WrK3T0WaPrORY
 i5Npg75GQNO/kZ7eS94Kv01n1Wbg19FtDp2QZWX0kli6Uf7E0lBGQ65NFLNLQznLvv
 6GvMfBBr/Qs954P6KTN5rEAvYyhjLFcN74SqpUb+VL/VEWtsUIBWJQLDfQWiW8Zmvv
 5ppoiLdEqWdQA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E58F17E156A;
 Thu,  9 Jan 2025 12:06:10 +0100 (CET)
Message-ID: <5be6790e-ba40-44c6-a171-03edebd60a20@collabora.com>
Date: Thu, 9 Jan 2025 12:06:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] arm64: defconfig: enable display support for
 mt8365-evk
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
 <20231023-display-support-v6-4-c6af4f34f4d8@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v6-4-c6af4f34f4d8@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Il 09/01/25 11:37, Alexandre Mergnat ha scritto:
> Enable the DRM HDMI connector support.
> Enable the MIPI-DSI display Startek KD070FHFID015 panel.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c62831e61586..1e2963a13500 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -897,9 +897,11 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
>   CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
>   CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
>   CONFIG_DRM_PANEL_SITRONIX_ST7703=m
> +CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
>   CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>   CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
>   CONFIG_DRM_FSL_LDB=m
> +CONFIG_DRM_DISPLAY_CONNECTOR=m
>   CONFIG_DRM_LONTIUM_LT8912B=m
>   CONFIG_DRM_LONTIUM_LT9611=m
>   CONFIG_DRM_LONTIUM_LT9611UXC=m
> 


