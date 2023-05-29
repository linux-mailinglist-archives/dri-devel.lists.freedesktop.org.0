Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D04714B8E
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 16:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C4C10E2B7;
	Mon, 29 May 2023 14:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D90310E2B6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 14:07:23 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f6d3f83d0cso34882205e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 07:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685369241; x=1687961241;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LuPny2OtXAzM2wWK6VJ+p5t+ABcpKnPrmiRDWrl/TM4=;
 b=S2L7ubx5W2cOkZ8pVxf0WL9LIoKztesZZ7B2oDF4cIv688EwisgTFdGiM051ckbdog
 IXapWwJUh2Sh6C7luDJmahU3Z1RFiNnb2Xcc5ff1MQi/cBNguGxh3qq9r2Bl7TGwBbE1
 bSK0Ywk6NRfXydQ4E8JfKxCbrJbbQTkPJbgXxCEC6adjw90zodzr7FC+1MguNY0Y2fQ+
 zR31DzhDv+0TkE1tTVvgqkRujPKG05bWuEgyAx+upRvmciOpX7BQvMA1kJnAfcSwE2q/
 7Bnlpgt016RARi6s5pTc1VXtFlvPg1WJ1f3QbiwkXDjMkEARdqGYdrv5Dqbly81nqaFT
 oyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685369241; x=1687961241;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LuPny2OtXAzM2wWK6VJ+p5t+ABcpKnPrmiRDWrl/TM4=;
 b=DmnwnLVzgHrIlxqI/So6Hl8Zt4inx0IG2A4NLyS0vckAsBYV4z/zZVPMtVIzc9i1We
 qpyWbd3nt5zYNqH5VyBoOFZJybc2tJufIues/qyv/3njdnMb/ZTF8SI8j1TOpiOY8Eyz
 4VmOFp0Kfe40cXfG+KGVNAIg7ipKsqSwOLSKRtguAkUXK1RQNTbgjHjJHZ+T3BViSUjF
 vR0tIcwrkRhiESws4mxwuGPlQX1JuFdgxLd0IxDBhZ6sian3L2pTer9iwkavin8MIhmv
 wteGIrLG0D3fP7J8ApfyzHlyUOVy7pp6nwNDOn9SQyyLrz47Qug/9Lg3fFxTA5tAJwt8
 CluA==
X-Gm-Message-State: AC+VfDzS/Gr5BZm4+bOkt0A0KfsAU/1X7O2W35gQ5DuKbrPFbxoxL7ML
 hVI/EusW+pfPnfFlmk4QjhI=
X-Google-Smtp-Source: ACHHUZ6zxu2kt7VKYzBTez/NpRcKvfFT/05iC4XI/22RhPD4iBaJlYpy/McywyI+4iaDMmBq5kffpQ==
X-Received: by 2002:a7b:cb9a:0:b0:3f1:72e2:5d13 with SMTP id
 m26-20020a7bcb9a000000b003f172e25d13mr9545158wmi.16.1685369241290; 
 Mon, 29 May 2023 07:07:21 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a1c4c11000000b003f4ecf1fcbcsm18247034wmf.22.2023.05.29.07.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 07:07:20 -0700 (PDT)
Message-ID: <02a588ca-680f-ab45-1005-768d5b5db252@gmail.com>
Date: Mon, 29 May 2023 16:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT6795
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
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

Hi Chun-Kuang Hu,

Can you help to merge the missing DT-binding patches in this series?

Thanks a lot,
Matthias

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
> the same parameters as MT8183.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../display/mediatek/mediatek,dpi.yaml        | 23 +++++++++++--------
>   1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index d976380801e3..803c00f26206 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -17,15 +17,20 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - mediatek,mt2701-dpi
> -      - mediatek,mt7623-dpi
> -      - mediatek,mt8173-dpi
> -      - mediatek,mt8183-dpi
> -      - mediatek,mt8186-dpi
> -      - mediatek,mt8188-dp-intf
> -      - mediatek,mt8192-dpi
> -      - mediatek,mt8195-dp-intf
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dpi
> +          - mediatek,mt7623-dpi
> +          - mediatek,mt8173-dpi
> +          - mediatek,mt8183-dpi
> +          - mediatek,mt8186-dpi
> +          - mediatek,mt8188-dp-intf
> +          - mediatek,mt8192-dpi
> +          - mediatek,mt8195-dp-intf
> +      - items:
> +          - enum:
> +              - mediatek,mt6795-dpi
> +          - const: mediatek,mt8183-dpi
>   
>     reg:
>       maxItems: 1
