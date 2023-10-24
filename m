Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF927D4BB9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 11:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0949B10E304;
	Tue, 24 Oct 2023 09:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE65210E304
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 09:16:45 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 950EF66072F6;
 Tue, 24 Oct 2023 10:16:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698139004;
 bh=r0vyK6t+hqH4TTC1qIrFumbx19aWI5+c+iBrveLsLsI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L27CSkz4NL1hcSujYkcmuxOWxtewf0FMmpdPgtsFlKACf+LH4JSaWsYAZAB6xF11e
 wO+d0hN+bI+tTGLYkT/ycX2vOYVIztV6FvTPqiqCqsoVv7+KJckIcopaGTkMTCL2YK
 WNB8LYod3UYtvXEuayB3fRCHrRigXFzF5y9S1dgqeEunYC1TV38zK893FZy8UePVwX
 gVa9ltO4XwxzjWf6SthT27ZgBcA2CWKr+yPU0qMMbBxbVESb6RARuDdeltZ4qFXs/r
 JX+ze8AvL0ltGj+hcXakQeDQOGMeiVr6ycFBnT/e1ArVay/V6py/cxWLg3PxH5CME2
 BH5aYLuCC3lxw==
Message-ID: <1b1c1c78-4ac0-46bb-9986-00ea1d07b527@collabora.com>
Date: Tue, 24 Oct 2023 11:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] dt-bindings: pwm: add binding for mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Xinlei Lee <xinlei.lee@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-12-5c860ed5c33b@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023-display-support-v1-12-5c860ed5c33b@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/10/23 16:40, Alexandre Mergnat ha scritto:
> Display PWM for MT8365 is compatible with MT8183. Then, add MT8365 binding
> along with MT8183 SoC.

MT8365's Display PWM controller IP is the same as MT8183: blah blah blah :-)
because saying that it is compatible doesn't mean that it is the same...

That's a nitpick anyway, but whatever - you'll still have to send a v2 of
this series, so you have an easy chance to edit the commit description of
this one.

Nitpicks apart...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index efe0cacf55b7..e4069bcbf8d5 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -32,6 +32,7 @@ properties:
>                 - mediatek,mt8188-disp-pwm
>                 - mediatek,mt8192-disp-pwm
>                 - mediatek,mt8195-disp-pwm
> +              - mediatek,mt8365-disp-pwm
>             - const: mediatek,mt8183-disp-pwm
>   
>     reg:
> 


