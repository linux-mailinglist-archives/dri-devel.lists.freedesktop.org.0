Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D659E3F7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 14:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAAF11210D;
	Tue, 23 Aug 2022 12:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56321120B8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 12:51:41 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id z20so13422257ljq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=2CjazNJKWxawIRrAspwhPS6UmjSbXOY3YGzYB4E+Plc=;
 b=PPLvIhXyebaOzt5ZAgHRARuDpjE3QXcTZv8jgbNY3zvBxdR5T0KE8RXbL3ML0vLwwB
 utCyLkgq11HaiFzWK0PFjwBSeIkes+bOWEYJ3CaofriBJbCbD9Qhx0lN8j5/GtjKwYYb
 m2K9YR+tgW5R1pBYPlAQJkVPKATZjYOH/NCSBf2RhfXcTCWroHyMVa6FoWqCo3dP3inn
 CjTL8urZ46DjEbFoimD1Pr29eOLhWBHVc5d6dIC6RNja2OZ8AZ2wUPeQ61HgB2f6EfKk
 PETJTyGEGsqOX15mWMZcrVeKFaWM0VtdOfIdJzvG0XJ0xpUUwCviiqf1gi1dVUDnqb17
 Os5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2CjazNJKWxawIRrAspwhPS6UmjSbXOY3YGzYB4E+Plc=;
 b=bvkQlJuioifRtXu5AZ/SzEikxfdPgaSE3JiDAC97+edXXbWSarUhnrLNGBIQ2GOEfO
 KZPuo6eOOQYJUfPyP/WXm5vVpUGCqKR4eUX8MlTt8aiiw6vx4zTVpQix/A2L1VLkFBoR
 oZs5M9tr89TlC56dgQKuMbOaJ77Y22u2tyx4Ge8hZIFnUtvAdADqnsbZICRAgUo/7tQ9
 EsawApVg+jN1qf5Gp0Ko1GdP1qRswZU8+TGReXv34azna5JSc849xW9n+13k7gc9l3lj
 PmTZ+7/XvvtOoPKFs2LqHO6wa3GiaNZDYp5G6ORQLARN2LcamO8As1qp5hBm1nfAKIvZ
 J8tg==
X-Gm-Message-State: ACgBeo3hdqKSDMo/0ylMeyGCtStWuGfUDI0WuPO2i7R5SNWYbKNTygkr
 2tQfQfzvC54gFWHpBcBhuf/pHw==
X-Google-Smtp-Source: AA6agR58Hgvt7z3DYujhjrD2ZnvOcvvv4OymBiELF8Edk9l9F6qF62D2kPrhZN7V9Fcd3PvG3QDT+A==
X-Received: by 2002:a05:651c:b29:b0:261:d351:9dc4 with SMTP id
 b41-20020a05651c0b2900b00261d3519dc4mr1840748ljr.409.1661259099827; 
 Tue, 23 Aug 2022 05:51:39 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a05651236c900b00492e148365fsm1234663lfs.294.2022.08.23.05.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 05:51:38 -0700 (PDT)
Message-ID: <05f99396-f6e9-a315-7264-c659e3ec507c@linaro.org>
Date: Tue, 23 Aug 2022 15:51:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 1/4] dt-bindings: mediatek: modify VDOSYS0 device tree
 Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
 <20220822033213.15769-2-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822033213.15769-2-nathan.lu@mediatek.com>
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 wsd_upstream@mediatek.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/08/2022 06:32, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 device tree Documentations for MT8188.

(...)

> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index 0882ae86e6c4..d0e6c0dd4dfb 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -30,6 +30,8 @@ properties:
>        - items:
>            - const: mediatek,mt8183-disp-rdma
>        - items:
> +          - enum:
> +              - mediatek,mt8188-disp-rdma
>            - const: mediatek,mt8195-disp-rdma

Why do you change existing bindings?

Best regards,
Krzysztof
