Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3635A02BA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA7FC7B01;
	Wed, 24 Aug 2022 20:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16896AD10A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 08:38:30 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id w23so7704397ljj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 01:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=JKH4ft/HojJoLFaDDgeksLkaodkyHdDC/mjKTNTZhPs=;
 b=oEmXzyGTsY1Jm/8QDV/fL0tMWnA8/aqTqARmji/gwW4uTPzoaSR9ltEOjszs48LwHm
 zyX/2IkiLkYutSnRSWpOccw4/fVZC22paPUEgeX0TFhWjMkc3Eq31lWv0gtcXzhHctXf
 yo/hfbmujNbjQSELNCY9smsLaTfejwC11ajGhW+AvQqxRQgVPa2G/n7j3SOr1l0A5TiP
 mr1ekZIM6Ipy1b1AOHF/Xjlj6p8M4AQonkKqaiLQJhZcJhu4wO8rMbt8qed8m9jSjyf5
 z2XDb1tNAeBwxdP1JbNfNAYNi34zvD0AmyZ+Zf2rVyIj5J31nKNeZl/wWO2qgzSRjokk
 9dWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=JKH4ft/HojJoLFaDDgeksLkaodkyHdDC/mjKTNTZhPs=;
 b=yum8V/ov/sx1KmV9hTI5ge09cvai2z4fZvTPM2yj0Wpcz9ndscr6WoXXxuyVa5oDhW
 aWS7VnAhr4MicQJVBLJn2ronSXk4NsHNAHlancKNf7Khib8jmyBzhceEczmMSlxWTPFZ
 WYbZbutbjhEuUq1Xj0EojD3Dcsz5fyMKul9yZL5A8WT85Hsbc5rKlpY/RqlX5/K1I++5
 dHI7W4KHNcp/GAgGFzuvoy0n4KLfEu2STiJ9pRsm/c73CHITqltJybd/D5A4LMV6xadS
 uKo9bQth/mZe6+6aWnRz/FYQBDc4OL8CTWS7G4LbBZhbe7exrVEjjrCKAOaP0YX8eHTj
 I5Dg==
X-Gm-Message-State: ACgBeo1M/8hdJLJeATdF8z4DYBs9oDqdOW9qpozfVVfKM5bHd8EBo3Vz
 jOGcV/6oaq2L6hm/sXtn0Zg3pQ==
X-Google-Smtp-Source: AA6agR4YBTjnWyro2PJsJoAncXN9rtMdAV8mFoIfbItwV+OsR3C7RYb9maJWlvJph7+5H40eCY+DFA==
X-Received: by 2002:a05:651c:210c:b0:25e:6a39:23ed with SMTP id
 a12-20020a05651c210c00b0025e6a3923edmr6546406ljq.43.1661243908301; 
 Tue, 23 Aug 2022 01:38:28 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a2e7202000000b00261d619fb16sm329148ljc.82.2022.08.23.01.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 01:38:27 -0700 (PDT)
Message-ID: <2bbafb3f-3f69-c014-b86c-476f56d93659@linaro.org>
Date: Tue, 23 Aug 2022 11:38:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: Add gamma compatible for mt8195
Content-Language: en-US
To: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220822091945.21343-1-zheng-yan.chen@mediatek.com>
 <20220822091945.21343-2-zheng-yan.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822091945.21343-2-zheng-yan.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/08/2022 12:19, zheng-yan.chen wrote:
> mt8195 uses 10bit-to-12bit gamma-LUT, which is different from
> current 9bit-to-10bit gamma-LUT, so this patch add its own compatible
> for mt8195.

I am not sure if this explains the need for change. Is mt8195 still
compatible with mt8183 or not? Your driver change suggests that it is
and points that this commit is wrong.

> 
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> 
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index a89ea0ea7542..fbd7b9664a78 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -25,11 +25,12 @@ properties:
>            - const: mediatek,mt8173-disp-gamma
>        - items:
>            - const: mediatek,mt8183-disp-gamma
> +      - items:
> +          - const: mediatek,mt8195-disp-gamma
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-gamma
>                - mediatek,mt8192-disp-gamma
> -              - mediatek,mt8195-disp-gamma


Best regards,
Krzysztof
