Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36B04E7A0A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 18:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C104E10E1C5;
	Fri, 25 Mar 2022 17:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BE410E1C5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 17:31:42 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id z92so10015009ede.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fRup0HhTI1fItvOnWgW1apl6hJ+hovK5wDJd4/CJEws=;
 b=R0nUOZ5jxfxPY5KF2RNLoxz/3xVJPVGs/2xxdtG3pFKTJoUkCnj2zu+Ml52748MT1p
 r38zC4d00axxIj8wX3lhUAQvh/TXpHApWivbXSUqydf+NrI5CGwBABey6G+2vjxSLEoQ
 /lV1t7sprzt6v34/7gixVL8gyFiFEcSMthq+V6kncFimOSJgrLmesZY4vdNC5+69GWhT
 sSUB/GLW6Y5XlVzh+yu7/bNYe8UPd62kLoH8+4nkc+Sd46czqUaaF2+aPn3XwSUQjoa+
 6mB+0hEPC+71k6rLskCshEsQb5CWa/Q1gQ6FZdxuS/LFHmQbGNiRgrx6NuLiAr52BCH3
 QzNA==
X-Gm-Message-State: AOAM530SO1Z5OETZB2T/5AFHH6hHGmDk/8golha0fB3JuzTrVgQTv6T4
 ryMBkLvbN6F2+B0lH6sYWjg=
X-Google-Smtp-Source: ABdhPJxBJl5W6RwFQAyh8otMltwQxLkSdlG8+OGsciwzNPCea5FQXhEojfuAMY1CBRj+1zzaCrkF1w==
X-Received: by 2002:a50:d84c:0:b0:418:f176:79df with SMTP id
 v12-20020a50d84c000000b00418f17679dfmr14200983edj.353.1648229500341; 
 Fri, 25 Mar 2022 10:31:40 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 c12-20020a05640227cc00b004192114e521sm3209328ede.60.2022.03.25.10.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 10:31:39 -0700 (PDT)
Message-ID: <8baedbe6-eb60-02b4-a6b8-fe3abc566335@kernel.org>
Date: Fri, 25 Mar 2022 18:31:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/22] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, angelogioacchino.delregno@collabora.com
References: <20220325171511.23493-1-granquet@baylibre.com>
 <20220325171511.23493-2-granquet@baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220325171511.23493-2-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/03/2022 18:14, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

This is v1, how did you get Rob's review already?

> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index dd2896a40ff0..53acf9a84f7f 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,16 +4,16 @@
>  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: mediatek DPI Controller Device Tree Bindings
> +title: mediatek DPI/DP_INTF Controller Device Tree Bindings

While at it, remove "Device Tree Bindings". It's about hardware.


Please also rebase your tree as you use my old email address.

Best regards,
Krzysztof
