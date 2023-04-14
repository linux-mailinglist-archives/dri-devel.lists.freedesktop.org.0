Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B546E1DFB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D051B10E144;
	Fri, 14 Apr 2023 08:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D4D10E144
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:21:09 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5058181d58dso1850596a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681460467; x=1684052467;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k9w56sg0vFWPotW3ggjC58S0oDYkCPh83S4/DlaSQRs=;
 b=SvGZ5RwkfcAUFCPQAmlZ/0mT4BbyNtXUcqqzCOlcXeWRuG/zqOy94hFrJ2crZPKtYV
 l6i4oj3HMIiidbLCDbt0v7fNR35xocG/yWmtXQ4S5Hfgcj14WnVn7Gi0iBcg8HBKkzOv
 USmzu2OE0JBCOsWNQhcRBn13RShBPk/bpJaFefiwdqISsnn7sc8LRl9BfW5nsVy8GFZi
 /11ouHGEycuicUZ3xRN63ibLOITUEP0R0+iCjJ+xM/rSn4zu7UPJ1lsg8UyMqa0ySirR
 2n2LRYigvIctX0hKLww8sdNAHiFV35aIQDWQdsw1S37Z1ZeP+JAzLB0NoKAdTxWBZUnP
 E0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681460467; x=1684052467;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k9w56sg0vFWPotW3ggjC58S0oDYkCPh83S4/DlaSQRs=;
 b=RJX4WWXDeWJUgOhOcgIkY30bq7k3MqNXS+eXwsl/nAvoTOGUVwgEihlzOOdR1KzjX+
 /WN9E2U4aIGEo7EZLUdE209G1k4rVfQ9mZyX3cqDwIe/ZcLbD4DTKuCrs/+fFfIJ55En
 jz/pvmYMVUb8AaDoHwUKcfBXFs6NXnw+Us7gQNh6X/eS98yzHzlDhkGbqI6oe8DysJal
 0bha59jKAuvDcal478aIDAX7Zb/gJ5f6DFE709Y3iQgVKNTF0IXdSrfYoZpEC/vRMcL1
 +nFyHGYOnb2dyTmHe5sdweQR3yNXV6f8F6pwVGAo58aoAlOPS9m5jmR2iymu8Dbr7Fo8
 EX8g==
X-Gm-Message-State: AAQBX9fmgGfT893myXh5VFtW1U0K0vA1UTVRefWxg6mBnHjTnIQf/JNd
 aU8Fy3iyx+UFlZmq9apqMTGUYQ==
X-Google-Smtp-Source: AKy350YM+MOz33eDaFgkCqQllKhNWwkLLpRA7eDwp2QztSKXE3waumiu5Xmot0TK+gNOB5bBXpOv7g==
X-Received: by 2002:a05:6402:511:b0:504:b606:32e0 with SMTP id
 m17-20020a056402051100b00504b60632e0mr5042292edv.34.1681460467297; 
 Fri, 14 Apr 2023 01:21:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 vf13-20020a170907238d00b009475bf82935sm2096367ejb.31.2023.04.14.01.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:21:06 -0700 (PDT)
Message-ID: <aaeeb18d-f8e8-d6c1-1272-e5b797554b9e@linaro.org>
Date: Fri, 14 Apr 2023 10:21:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
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
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index 0088bc8e7c54..153e146df7d4 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -22,7 +22,9 @@ properties:
>            - mediatek,mt8173-disp-pwm
>            - mediatek,mt8183-disp-pwm
>        - items:
> -          - const: mediatek,mt8167-disp-pwm
> +          - enum:
> +              - mediatek,mt6795-disp-pwm
> +              - mediatek,mt8167-disp-pwm

This does not look correct. You do not add compatible, you replace
breaking all mt8167-disp-pwm. At least it looks like this from context.

Best regards,
Krzysztof

