Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FB1714AB5
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C885710E28C;
	Mon, 29 May 2023 13:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23810E291
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:51:31 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30789a4c537so1934292f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685368287; x=1687960287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=78pcypVpN3CxF4Efbw66eNAU7KdZVo7I7D8DwmPSSNY=;
 b=RGnHahrqAMOmuuk/E4fXSa9iPqk72Omn6f6aqeKHPz/0xSpC4bL3nJsEoyKF8COt0x
 cQ3xzsVZvg9pOC5MXDFpHrCyv6GxVACQvk54AJZMptR3Blktf7ReftSc5WdHGJEjLO46
 R+TdZ9Ttjs20yAV4AzMzN0eq/7XY5ypMuZDM/7zu2vM3vJNwoPRVRq6JnLU7iaIF7Nxm
 0gq5+8qUOXOJacb+phUkDb3i1PJCpVDKzhF9i0WfvWX35z9I6g4SNDNRR86GnloatUmQ
 0uFZsI4mjH74yYXx0rbsxNM5VN2lATjny7VRQnXjFX9KACBz7zzQR8Wj0NcO6PaYBtHd
 J2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368287; x=1687960287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=78pcypVpN3CxF4Efbw66eNAU7KdZVo7I7D8DwmPSSNY=;
 b=OpfBLsIllNe4Pk+e5jXyddzf6lH9WTPkJwId1o3W4FBz/iSgZD8QWdpRlTjxYTz0fg
 G5BsAHJ3lalcbB5eoWHOGzGi3qVHFIjLC2yKut2L5v1jmBkXQYiCzW5brYZuKviSzYZB
 VyrhqXmBR0IAywE1QgGt/rqKoVuiiOpg9YgPa3M5rJZnRHxUXhaWiVWSLag1snbUHYHn
 o7bOGjJY9r8tBnx7ZzME+A9diEVQB1ki9yKUopxwPhyRI9ZfExr7ClZUlMrBZF2os/vA
 RAUFulcCif7/Kgak4vzHVpdX0QffcIeXamOKjlt5e98Nibazx/mo9J9mQqHlVQTGYFta
 ABMg==
X-Gm-Message-State: AC+VfDzSoMlewWclSx6WafZOtyROtEimVFmKZFWBJlFVuLCtX34BRiJr
 9vv+EyJzkIxNAqoT3VBMkvHquoNI6gVtOw==
X-Google-Smtp-Source: ACHHUZ7XNS0Ka4Zavjp9uZSaETZlKXum4Ox8t6LlTxg+Hui9Jl0m6ncdtdAfQq6dIti7SzAdeGbFiQ==
X-Received: by 2002:adf:e345:0:b0:309:4f23:e52e with SMTP id
 n5-20020adfe345000000b003094f23e52emr8944522wrj.15.1685368287334; 
 Mon, 29 May 2023 06:51:27 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a5d6ac3000000b003062ad45243sm53692wrw.14.2023.05.29.06.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 06:51:26 -0700 (PDT)
Message-ID: <7b39f7ba-7e29-bf4c-e165-130cd3539d45@gmail.com>
Date: Mon, 29 May 2023 15:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
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



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
> block: this is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index 0088bc8e7c54..153e146df7d4 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -22,7 +22,9 @@ properties:
>             - mediatek,mt8173-disp-pwm
>             - mediatek,mt8183-disp-pwm
>         - items:
> -          - const: mediatek,mt8167-disp-pwm
> +          - enum:
> +              - mediatek,mt6795-disp-pwm
> +              - mediatek,mt8167-disp-pwm
>             - const: mediatek,mt8173-disp-pwm
>         - items:
>             - enum:
