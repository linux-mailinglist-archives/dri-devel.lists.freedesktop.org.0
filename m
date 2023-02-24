Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E6A6A1ABD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164C910E7BF;
	Fri, 24 Feb 2023 10:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1810010E7BF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:58:17 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q16so3142173wrw.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UxT9FvHaPhscbfESj3x0Ux9E1/gu3fQSaddPYs/H2Hw=;
 b=pkSDpRPNfOn9j5B7JLq6oB+YolUwofphUahCjYotC5/zcNg+W6lKUwh5QWY3BYN1oR
 Gj1jdTuiZftrUBREWDqpORisvEZBVn9C2k5v9pWY85/XXkWnXUm0uSYfw3wLCFwjujMs
 Zl16tD7QX6gfR1oPj9qS3V2HAmUyZ+3PQmqwyagTmYUtjr96Ly8aoS7/6JpbdoiB2Dyy
 hQJK5+w4ANFxENTCR3wIoHqFs1EAghWnunjb9IPuLuyhaIF48ZJVoob+7f9ODMOetTAx
 VWGcYJgfkzFkH4QdZs9sc2XepmVEZ/LZpxR9qgjae3Zht2Js/OqwmXVN0Mq+PqYCzyNq
 o7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UxT9FvHaPhscbfESj3x0Ux9E1/gu3fQSaddPYs/H2Hw=;
 b=qBRQ8yQA3qwjA/2j97+q2DlrIm4WG8i7BFHIGOeqKAzCwXGqN8Zjqw/P5iR630VRs0
 X7himwYtSuNF3Rs9o4XjD8MvMmFjpShgTkhpmneaYCGPbxTZibQzJVZ5d9p082JTevFN
 Fqw9Dt6ONwUr5MT6BQl5grh2FD/uWm4i0e++e2suOJhUwbvI+4GIU/UbrWGvloz0xIqU
 7DgBkOaEwtgLKkee4dw5w3kM0Sl9rXxoqnKEOoihyKs9KNM2V9WqHLyubWWRiYBa8AKq
 g+QL3O44rlsdXnhofM3AVZ+2oJlJNHqZPRK7ruF3PIqG8t8DR9PdTw2NxmJ8iqv6b3Xh
 ZE3Q==
X-Gm-Message-State: AO0yUKWMWQaPtw4aMjD/HrAuHuc7WUSRwm0A54B/y8KDVBCk1TEldWop
 UNsOexZNNhr7/wLR7KjmbtN4gw==
X-Google-Smtp-Source: AK7set+7RhqsPgSckFc9YeBO3C0XfgcgNt80h0N7RD356kt/ThYv7bc6ee/ItorJfO2nByqDumA7Bg==
X-Received: by 2002:adf:ea07:0:b0:2c7:420:5d52 with SMTP id
 q7-20020adfea07000000b002c704205d52mr10876348wrm.62.1677236295491; 
 Fri, 24 Feb 2023 02:58:15 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a056000108600b002c53f6c7599sm11157554wrw.29.2023.02.24.02.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 02:58:15 -0800 (PST)
Message-ID: <d0ca7b78-1fa6-d999-e010-e633ee3dbf19@linaro.org>
Date: Fri, 24 Feb 2023 11:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 06/11] dt-bindings: gpu: mali-bifrost: Add support for
 MediaTek MT8186
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-7-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223133440.80941-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2023 14:34, AngeloGioacchino Del Regno wrote:
> MT8186 has a Mali-G52 MC2 2EE GPU (two cores): add a binding with
> two power domains (one per core) for it.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index be18b161959b..b9424f3ebd5f 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -20,6 +20,7 @@ properties:
>                - amlogic,meson-g12a-mali
>                - mediatek,mt8183-mali
>                - mediatek,mt8183b-mali
> +              - mediatek,mt8186-mali
>                - realtek,rtd1619-mali
>                - renesas,r9a07g044-mali
>                - renesas,r9a07g054-mali
> @@ -159,6 +160,7 @@ allOf:
>                enum:
>                  - mediatek,mt8183-mali
>                  - mediatek,mt8183b-mali
> +                - mediatek,mt8186-mali
>                  - mediatek,mt8192-mali
>      then:
>        properties:
> @@ -204,6 +206,22 @@ allOf:
>        required:
>          - power-domains
>          - power-domain-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8186-mali
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 2

as well:
maxItems: 2



Best regards,
Krzysztof

