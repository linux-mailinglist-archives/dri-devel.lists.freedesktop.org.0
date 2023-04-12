Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2986DF583
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6A910E7BC;
	Wed, 12 Apr 2023 12:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D8F10E7B7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:37:43 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j11so14385672wrd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681303061; x=1683895061;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HMlPXBM3hd9jIHL9hgd0wOc31UORXSj4RilM3kqo964=;
 b=Z6aVvxumaepTR1WGJnrlhUfUxQORULeGEFRjMblfGS9rRIUBbD1guL+66kDoGL4L2F
 EJNPI2WnR9X/nptHy2HVSvB3cX5oQs2CyIUCjceXuWD8mg/12SB0Xgi1bhlRX1O+L45k
 Pr1WQeTvwalajQQlbo3kJdwwY+yxm75ZIQB+9XceHwL8B0Y0wk12WQo5Kv7wL1J8lN24
 9B+aPa0TI9AwPoVCBDSJbKqeJWCF0o0zg7OxvKe9irQ+syXvy2jlZ9til4kd3dINP/15
 Ayuo+c9aKnzXnlf8nMEGcNEl0ErehlBR/mi1ZpBBS0m5k5tdcRZtDadBe9P5jMsgHGj4
 CMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681303061; x=1683895061;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HMlPXBM3hd9jIHL9hgd0wOc31UORXSj4RilM3kqo964=;
 b=BJPXIwMhmMcc/XpWNrT5pmOA4vFNzXlbwv/Eu4QWdEmXVH7hD10JupMAg0a2yyBys0
 oU//3hmO2hpkoU9jWy3RAIc1yqhuC3YJg28PhjGBlQGN9hEUIuQz5oX1UfTgnFXJrqhz
 Po9LXGo9YkLtyWeuFscOW8ZTbou+Z2iXTcZHhQYnX58OndOLDV8xnIthK51S4erbZu4y
 Mdw/k74J6V7UmIS7zTsxW9RibIwdFuBVil4CBu60Jht6QchivnP0KwEHa6PJ7VsGkmAx
 Wvyz9omESnrY/+V4Wqilem4N08riHhljf5smoAsdzSIVcFLb5tU9WmsY6H+sRwm0F3W0
 NQ6A==
X-Gm-Message-State: AAQBX9dhKxnHVlTiiLyGYBpGmyKp+iK1qfSI/0qKhTwlLSWFGYA3JUU9
 02ju0MB+a6vS+8ncBcyaRXo=
X-Google-Smtp-Source: AKy350ZArefRK2km5RNJgiCd8KzO9LsFvtICtB+2FMvxRJx3OiTP5Hvi3HzbZ3HgKraJfWt5r3+hXA==
X-Received: by 2002:a5d:6e8d:0:b0:2d8:81a9:4d75 with SMTP id
 k13-20020a5d6e8d000000b002d881a94d75mr12073306wrz.32.1681303061489; 
 Wed, 12 Apr 2023 05:37:41 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 e18-20020adfe392000000b002c56013c07fsm17037899wrm.109.2023.04.12.05.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:37:40 -0700 (PDT)
Message-ID: <cd2906d3-5490-b3e0-b02a-39b201a65bb1@gmail.com>
Date: Wed, 12 Apr 2023 14:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 11/27] dt-bindings: display: mediatek: merge: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-12-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-12-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795's MERGE block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,merge.yaml   | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> index 69ba75777dac..be330be1399a 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> @@ -25,6 +25,9 @@ properties:
>             - const: mediatek,mt8173-disp-merge
>         - items:
>             - const: mediatek,mt8195-disp-merge
> +      - items:
> +          - const: mediatek,mt6795-disp-merge
> +          - const: mediatek,mt8173-disp-merge

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   
>     reg:
>       maxItems: 1
