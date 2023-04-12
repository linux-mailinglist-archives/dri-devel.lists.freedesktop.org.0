Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEABA6DF544
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5FB10E7B4;
	Wed, 12 Apr 2023 12:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E05610E7B4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:31:02 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 hg25-20020a05600c539900b003f05a99a841so14008296wmb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681302660; x=1683894660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LH8FUEh+YJu8DH3rQ9pd4R0sfMJTPR3+WipwFABmNG4=;
 b=SKj8hts1928ziujgAoLnuqVkvDvGcPZx36SBJHxw+/0D/ZFODDY4QCuDaPwslggRoY
 AL0fHbhDZ54IiymSNRpgOcztfTVCMYJBahVeQxJRhHfMUx1zzQkD5fAr1uhNC8NkJj+2
 TlI+Xs2wdnQ4C2SbpWPLQAgzPsSE96He+YrPPhFhhWu7QXZIA7tL25TZaWLHKmmfolOT
 mgk5iGo1cZD7lug3KA6VJnE9zKrDfk0tJNM1YvwkgmiDXk29Cjt9H6nW/pcdYSMAbLPj
 FwqojBdj6zG94Wa5EDAvxojVaN46+6GMtSP1CZ/UqkOysvuH+mRZNQ5kNfJvr74I9E9u
 j1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681302660; x=1683894660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LH8FUEh+YJu8DH3rQ9pd4R0sfMJTPR3+WipwFABmNG4=;
 b=DaAtlPso5qQaUrbPEY+SzdooF8zXQaCUOjRRjzfuFZja81X1fXg816oVZKvMt0C7oE
 nJd4zalMM+aGXnUGf+yiqXp2KKoRkBkkP2GqdQMAiw5we9Xy1K/RB26jQtVshL1TazkC
 Id5uhJNcMTYrOflPpjFpoVb83kD4aNYd71h1qt3TfLu6n/DRvsyBBYHbcFlAYwP0IWFM
 HKFkdzJK0+DQi1m+3MSXC9sjGmy/Pef1/kQUDifNdm5e4Zp82RU4p5X2ITK2kfKwaH62
 K5XrejmyTKYPNUMgATb9ICgMmW2owk5p10+p6nsai+TGr9HLlGj6DcUCHbX2gX7ckoTf
 8Gtg==
X-Gm-Message-State: AAQBX9ehgUBsxwpixUG/TVrDicse14sn88BYrH5CA6uJv/JvngdH7l5S
 SN7BzFWMEM9epplB47GsFX0=
X-Google-Smtp-Source: AKy350bn9uF0IQIwzgop3ifBPq286Rptgb8qr/QNLk/Ydb6m3Rimef/MNKrhRejMvnS2eP3FRuoY/A==
X-Received: by 2002:a05:600c:21c4:b0:3f0:4428:9444 with SMTP id
 x4-20020a05600c21c400b003f044289444mr11979874wmj.10.1681302660547; 
 Wed, 12 Apr 2023 05:31:00 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb43000000b002de99432fc8sm17058331wrs.49.2023.04.12.05.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:30:59 -0700 (PDT)
Message-ID: <40b46002-fad7-9751-fc2c-5d96a5ce6b75@gmail.com>
Date: Wed, 12 Apr 2023 14:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Content-Language: en-US
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

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

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
