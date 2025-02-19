Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DA3A3BE81
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CF110E7D1;
	Wed, 19 Feb 2025 12:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eEZD4Hga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30C010E7D1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739969356;
 bh=ZyOK9nag+8gUZ/F4eVgxxf/3BmUwS+AQI47Swx/xonk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eEZD4HgaCqIpEiiGGjAVB7dg/5/yZvma2y3+45M+1z5UcCk6/ZBRqop7gQHtrZqm0
 Ev5GJbFPR/wyOU3Unn2sbzlGMdVbHszuF1aa6KSHAZpEnu+NITdWmBR3smM58aidCV
 iTURTCaSl0Lbt/AKB7fJm/TK7/Js5L+0iWYutBwG3inRnizKQeaN0K6n7XzZr2PUSC
 MqOdYF0dI5Fmb9KoFzhkb0kBdmqaU/8ZanjOk9Iep2rvDMFrQBhLdIIIsLKXO61/9i
 0TUR4wyILZmgNNYKZPKs/u2vUnkSyUpsXZ10hg4dlZtFoAFq2OgRSrsBUAis0wfoBb
 t8WzShqkm8Haw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6780B17E14E7;
 Wed, 19 Feb 2025 13:49:15 +0100 (CET)
Message-ID: <bb3fb8df-7a15-4732-a75f-8e2fc17c04fc@collabora.com>
Date: Wed, 19 Feb 2025 13:49:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] dt-bindings: display: mediatek: ccorr: Add support
 for MT8196
To: Jay Liu <jay.liu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250219092040.11227-1-jay.liu@mediatek.com>
 <20250219092040.11227-5-jay.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250219092040.11227-5-jay.liu@mediatek.com>
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

Il 19/02/25 10:20, Jay Liu ha scritto:
> Add a compatible string for MediaTek MT8196 SoC
> 

Add a compatible string for the CCORR IP found in the MT8196 SoC.
Each CCORR IP of this SoC is fully compatible with the ones found in MT8192.


Please fix the commit description here, other than in dither and gamma.

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml     | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index fca8e7bb0cbc..581003aa9b9c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -32,6 +32,7 @@ properties:
>                 - mediatek,mt8186-disp-ccorr
>                 - mediatek,mt8188-disp-ccorr
>                 - mediatek,mt8195-disp-ccorr
> +              - mediatek,mt8196-disp-ccorr
>             - const: mediatek,mt8192-disp-ccorr
>   
>     reg:


