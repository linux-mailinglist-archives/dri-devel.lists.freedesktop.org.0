Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2828D8A8072
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 12:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973C910F586;
	Wed, 17 Apr 2024 10:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SstsGJ1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A2411337C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713348875;
 bh=nP6Y2cH6R/RSVNj91LUL6ipM/UHgj+V1OQwPKKnkgjQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SstsGJ1d7dF0sTiCq19GAQDn9PeB6bYpjCOvzfpX6z4o9hc+KpF0FbQsPvO371n/C
 GnsKq719DLEgjgoXZ3DGGJ1t4/BZdaJC2+Nul+USg1vFiARr9mKkfOdgbS0TXFQJPd
 yMeow0v4fKoHqlKgNSTCpBKVdtACyjIc94RpPjpuz98RryoTV/fs61uhsWWKPp0ObR
 jx1QJ/3wXJmNpHHHlQlmOBTtUl0HbVAl75rb9i+HKeFSTyuexydG76wDgiFvUj91wx
 iEgJfGjVhJ30+X3lwEtXi3BX9UC5cVBWYtStI1XeOJEqgXQ6zEoon8dqvxS+GgzJ1s
 GtCKvWnb+nWsA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E30BD378020A;
 Wed, 17 Apr 2024 10:14:33 +0000 (UTC)
Message-ID: <105c9ee8-2b9e-4117-b4d8-472982ef59d1@collabora.com>
Date: Wed, 17 Apr 2024 12:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/18] dt-bindings: display: mediatek: dpi: add
 compatible for MT8365
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-7-33ce8864b227@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v2-7-33ce8864b227@baylibre.com>
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

Il 16/04/24 17:53, Alexandre Mergnat ha scritto:
> Add dt-binding documentation of dpi for MediaTek MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index e126486e8eac..ebb61bc4eab7 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -27,6 +27,7 @@ properties:
>             - mediatek,mt8188-dp-intf
>             - mediatek,mt8192-dpi
>             - mediatek,mt8195-dp-intf
> +          - mediatek,mt8365-dpi
>         - items:
>             - enum:
>                 - mediatek,mt6795-dpi
> 

MT8365 and MT8192 are identical. I'll make it easy for you:

       - items:
           - enum:
               - mediatek,mt8365-dpi
           - const: mediatek,mt8192-dpi

Cheers,
Angelo
