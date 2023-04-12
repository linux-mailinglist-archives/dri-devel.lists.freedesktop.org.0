Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E57A6DF58D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A67010E7C3;
	Wed, 12 Apr 2023 12:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F170F10E7C3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:38:22 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l26-20020a05600c1d1a00b003edd24054e0so7947864wms.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681303101; x=1683895101;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qrfSreIyYVzZ3y5IG1fr+KWAIr+UCJ0I73Dqb0W+8F0=;
 b=hKnB8rVVvWL/ZJVDH+5nnQup1V2zH+GXfSRvRjUwuxliSYmoOFCJYXpxVmdryKI5Z6
 em1bkjoymu8mUq+z0MMoyyqrcS+ggayxUSXiP9PeGUq3mZZolACfXxqRl9fshlGGPAFD
 Vkn8DAxLw+V9u8UTvs6/XjsZnQzXSTajc7QEVBBricagogLZ8T6SLB8w2LkIvy7fUNlo
 i5BFX0Abej8aMb/TM2bcwTGrZkLkNmZ6/s4uPq0g9ySPiufO2mj7uIebq3BMVV4pMOrE
 ZSfERzWfVLg4yCjn4pHkcURAMPmIsuND0L0K2xfg4HxUIjLL7AjNyC3IHq8/QR3EfDtj
 wkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681303101; x=1683895101;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qrfSreIyYVzZ3y5IG1fr+KWAIr+UCJ0I73Dqb0W+8F0=;
 b=b64nZsi/eVqmIgHRNa+ifwHmV+lK/qGkrVn1CfcH6gNaeKI30K1KXsBoYwfU/pFSFR
 H1BwQAswvngQP7FTo6xprKVeAJ8ZSomm0JPSPUxOCKIhuwoqrP2rBIelsNJQ5oIwmjnG
 QuR0hb8Q+vYRVlbzhKYrZBn1qusBiUahiBe/UNtB73N3vlzOj3uHcPJuRX1gn/RCa6O/
 bNYiVQVH8Djlj1LE0jGftkFA7QuOnua0RinFQ0RU6RX98QPWK46Dhq+VZ9ZK8b4e0I4m
 oLW3goXUQxn2L1p7OE+kUNNImmuu5PXVaJcCDFYw45jCo4hugdS1gGy7cmPKbdw90i2H
 B5Vw==
X-Gm-Message-State: AAQBX9cMBzWIojKPzGjZFXm+38pAZBIh6wsHYwYk39mPLIM63M2QKXDF
 pkJHt0H2PUndV7PVRP+IoLQ=
X-Google-Smtp-Source: AKy350b1vX5xNQp4/w0RoaPw15e4jwJGSLVJZU+94BcA1FM+NfcERa2O3p1GtJwdJ/T8GfM77hbaig==
X-Received: by 2002:a05:600c:1e25:b0:3ed:24f7:2b48 with SMTP id
 ay37-20020a05600c1e2500b003ed24f72b48mr1859483wmb.8.1681303100769; 
 Wed, 12 Apr 2023 05:38:20 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a05600c0a4900b003ee6aa4e6a9sm2381574wmq.5.2023.04.12.05.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:38:19 -0700 (PDT)
Message-ID: <9b5a0ad7-bd94-98be-273a-7a2f9d53ed36@gmail.com>
Date: Wed, 12 Apr 2023 14:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 14/27] dt-bindings: display: mediatek: od: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-15-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-15-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795's OverDrive (OD)
> block: this is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,od.yaml      | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> index 853fcb9db2be..691a3644504f 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> @@ -25,6 +25,9 @@ properties:
>             - const: mediatek,mt2712-disp-od
>         - items:
>             - const: mediatek,mt8173-disp-od
> +      - items:
> +          - const: mediatek,mt6795-disp-od
> +          - const: mediatek,mt8173-disp-od

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   
>     reg:
>       maxItems: 1
