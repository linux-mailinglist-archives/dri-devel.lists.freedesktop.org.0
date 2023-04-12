Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FC96DF560
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9D710E7BB;
	Wed, 12 Apr 2023 12:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D5010E7B7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:35:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 eo6-20020a05600c82c600b003ee5157346cso7959821wmb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681302929; x=1683894929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nOc2AucAU7aYdgbiSm2th1euSZVFGfwkabbTq6fep20=;
 b=m+v514HGaFK5Ryst2GvVu0WpbKzjiMUgoyTC3y7ib70zmND8f67yDqDhLEyszteIcu
 nDEgm33pZMF14/NNYFE24RJ4wbeF6salTTbtdl1udWn14nlYygKujZcEmXvXeCrBKu20
 +uHCSmVjN7gN/VCu2q6bPg9rk3QWIOcAVF8XQ8OFc/EyKn6V4ER2/rkYwBUSltPIteMT
 snSivVlPFZSUA7xOhLeIVhtWzFFbsxi/TyAwby9iugYa7cAG2iQNu0+ThiWWmiAZ2KsA
 I8wgaKW3OSXULH/DAaKqPGc/lFQDpCVKycLjbmpJbYKXoe1pSxtsvoQj+sPanEZNJ6af
 xwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681302929; x=1683894929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nOc2AucAU7aYdgbiSm2th1euSZVFGfwkabbTq6fep20=;
 b=eSS69l1poCUueP2SDRr1kbPiK4Ia0cEt8A3F3YvwkcdKlpHA/5F3eD8aqMZHnB6tLl
 HWgQCyRhs4plFUmsEJUVUIqtqPw9vGfJSJrKfDhu141CDE784DPiCdtQV4C7GWN1owOl
 trnhVlpdcCwFrjMy1SEkTJQNQ9PdjPX/GuhyFc1jE90YlEb8EEnVDMNpNAbGNSXoB2Ro
 kyZlmhQpiMsu4jzhVWMOwTgprlB7oqh7HSy5J9lC9qm2tgiS/Mog0X6jUfv0L/6rBpsq
 yfc+Zj29JAftgDJrm7wNPGeXHh0RoVcn9lZtnRb6U/TggQl3mypufxUFAhGprokphVRU
 lyBg==
X-Gm-Message-State: AAQBX9eMqtMDoSCzXIYQzEcyjmfj+qUSbXx/opJnnIachKwI5DXISLN1
 1Fl+odZZfaVkAZriG0utWM8=
X-Google-Smtp-Source: AKy350bP8nKYohS7TIl2I5thMGIpEvLFOztUtKV5055tbR5s2H7wE+Qv5yJdtdxWYRvuV7mf/92Nfg==
X-Received: by 2002:a7b:c3d4:0:b0:3f0:7f4b:f3ab with SMTP id
 t20-20020a7bc3d4000000b003f07f4bf3abmr4704930wmj.5.1681302929390; 
 Wed, 12 Apr 2023 05:35:29 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a05600c0a4800b003ee5fa61f45sm2359319wmq.3.2023.04.12.05.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:35:28 -0700 (PDT)
Message-ID: <6920f628-8e8e-b800-eaeb-2703a9b7f9f0@gmail.com>
Date: Wed, 12 Apr 2023 14:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 04/27] dt-bindings: display: mediatek: aal: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-5-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-5-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795: similarly to
> MT8173, this SoC has the gamma LUT registers in DISP_AAL.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,aal.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 92741486c24d..7fd42c8fdc32 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -27,6 +27,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt2712-disp-aal
> +              - mediatek,mt6795-disp-aal
>             - const: mediatek,mt8173-disp-aal
>         - items:
>             - enum:
