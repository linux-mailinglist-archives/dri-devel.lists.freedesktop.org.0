Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7D96DF664
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAC510E7DC;
	Wed, 12 Apr 2023 13:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAC110E7DC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:03:54 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AE81F6603102;
 Wed, 12 Apr 2023 14:03:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681304632;
 bh=n6UmEOVTw+KXN9/725bQQxVPB20qNDRrZSlz09sXOMo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AQGqtRCpfP1ZuiophrOrBi4nZp+IoEZLBUmkBU7M1yFW3J4w/j+9WFvTAaK4aAfy0
 5mYHWH2h9wjO2WBZ32CNT1xRWPLebR3bOjhc4EYA2r8GAUkpXyuAw45LR3pxru37GU
 TJBMilPa+oR0ba/Sl+XjUj2izfyuitVr5N5O7t6jLvyKSSm9hcJWe2N8F2ludKsfQs
 BPXQNPKykaAn/QFWyaCAVLBVUDCUiSYmVAgcgUuhU29wxTbleKy57mWETsDJ/lmNi4
 eoW0EreMLhn9a2r7hNzEA0Rgm3J1Ixu9cUE3XdTH20jdV2vDUVROKrAgOAx3yO8xAA
 GmQOR2WRqCCBw==
Message-ID: <eb770f19-ada5-81bb-5ea3-798edabca70f@collabora.com>
Date: Wed, 12 Apr 2023 15:03:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 02/27] dt-bindings: phy: mediatek, dsi-phy: Add compatible
 for MT6795 Helio X10
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
 <20684378-cf3e-0299-d390-287b7bafbda5@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20684378-cf3e-0299-d390-287b7bafbda5@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/04/23 14:59, Alexandre Mergnat ha scritto:
> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>> Add a compatible string for MediaTek Helio X10 MT6795: this SoC uses
>> the same DSI PHY as MT8173.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml 
>> b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>> index 26f2b887cfc1..a9f78344efdb 100644
>> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>> @@ -24,6 +24,10 @@ properties:
>>             - enum:
>>                 - mediatek,mt7623-mipi-tx
>>             - const: mediatek,mt2701-mipi-tx
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt6795-mipi-tx
>> +          - const: mediatek,mt8173-mipi-tx
> 
> AFAIK, it should be:
>        - items:
>            - const: mediatek,mt6795-mipi-tx
>            - const: mediatek,mt8173-mipi-tx
> 
> Since it isn't respected above for mt7623, it may be tolerated.
> Please, take this comment as a suggestion, isn't a NAK from me.
> 

First of all, Thanks!
I want to explain, though, the reason for that.

If you check all the commits, on some I did it as you just proposed, while
on some others I did it with an enum before const: that's simply because I
*totally expect* some to grow, while others (const - const) I was either
unsure, or totally *not* expecting them to grow soon!

>>         - items:
>>             - enum:
>>                 - mediatek,mt8365-mipi-tx
> 
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> 

Thanks again!

Cheers,
Angelo
