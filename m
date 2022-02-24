Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FE74C35AF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7856910E1A0;
	Thu, 24 Feb 2022 19:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF9C10E1A0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 19:19:41 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id j2so4363964oie.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 11:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cc8HWmanEpdtB8YuJu7jgI5K1qIYmoacQ6BDCjLUl6I=;
 b=iK2e8b6IkfraJ4pqR//xXzOJL93KHG3fxO3YV5XcIx/oz6K9Ex+wugJDpqRIkcb15+
 p1ccp+0xJigSMmWH6LG7o52rUUVNUZtRwrT6G09/mVWISG7aFXdXP6e/iwGw34YC5HKH
 mZVIcR3cAy2vomdq7D83Ux2PFbeQoa3EatruPj2214jidFrDC5aIIa3y8fKeWV8vjTR3
 1CMJmcb3LNvSb2CJqyGAc7BOsEhzHn69jK/NKVh0zGo6/UjOKk/9hN4LxPfb4MCvAJfw
 yQOgnCXmsM1ZuaYOlWhqJDr8IvT19FfJ+PrgQfVn2PA8jwQAItAZhYI+fEpnL1f/2Ary
 Lxjw==
X-Gm-Message-State: AOAM530ygYYzhZDKhmn+V9LQvbrXfCvILqSE1HaZMgV3tUBENKnE4JIu
 63nBgeMo8S7V/xyIn5WjNg==
X-Google-Smtp-Source: ABdhPJy5kI058I2cgTCZQamlbwhD2RSanlfZAq00SNdVwO46A8RHSvGD2gvd12E/u/QveaCqpxRjKA==
X-Received: by 2002:a05:6870:d785:b0:d2:823a:94df with SMTP id
 bd5-20020a056870d78500b000d2823a94dfmr1860561oab.93.1645730380505; 
 Thu, 24 Feb 2022 11:19:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 f21-20020a4ada55000000b0031c16df28f9sm60232oou.42.2022.02.24.11.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 11:19:39 -0800 (PST)
Received: (nullmailer pid 3433528 invoked by uid 1000);
 Thu, 24 Feb 2022 19:19:38 -0000
Date: Thu, 24 Feb 2022 13:19:38 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v4,2/5] dt-bindings: display: mediatek: add MT8186 SoC
 binding
Message-ID: <YhfaSqWInwgsu30x@robh.at.kernel.org>
References: <20220222052803.3570-1-rex-bc.chen@mediatek.com>
 <20220222052803.3570-3-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222052803.3570-3-rex-bc.chen@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yongqiang.niu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 01:28:00PM +0800, Rex-BC Chen wrote:
> Add MT8186 SoC binding to AAL, CCORR, COLOR, DITHER, GAMMA, MUTEX,
> OVL, POSTMASK and RDMA.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml | 7 +++++++
>  .../bindings/display/mediatek/mediatek,ccorr.yaml          | 5 +++++
>  .../bindings/display/mediatek/mediatek,color.yaml          | 1 +
>  .../bindings/display/mediatek/mediatek,dither.yaml         | 1 +
>  .../bindings/display/mediatek/mediatek,gamma.yaml          | 1 +
>  .../bindings/display/mediatek/mediatek,mutex.yaml          | 2 ++
>  .../bindings/display/mediatek/mediatek,ovl-2l.yaml         | 5 +++++
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 5 +++++
>  .../bindings/display/mediatek/mediatek,postmask.yaml       | 5 +++++
>  .../bindings/display/mediatek/mediatek,rdma.yaml           | 1 +
>  10 files changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 225f9dd726d2..3a5416937293 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -23,6 +23,8 @@ properties:
>      oneOf:
>        - items:
>            - const: mediatek,mt8173-disp-aal
> +      - items:
> +          - const: mediatek,mt8183-disp-aal

This patch is for 8186...

>        - items:
>            - enum:
>                - mediatek,mt2712-disp-aal
> @@ -31,6 +33,11 @@ properties:
>                - mediatek,mt8195-disp-aal
>            - enum:
>                - mediatek,mt8173-disp-aal
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-aal

> +          - enum:
> +              - mediatek,mt8183-disp-aal

There won't be more than 1 fallback, so use const rather than enum.

>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index 6894b6999412..8ac87b5896ac 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -30,6 +30,11 @@ properties:
>                - mediatek,mt8195-disp-ccorr
>            - enum:
>                - mediatek,mt8192-disp-ccorr
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-ccorr
> +          - enum:
> +              - mediatek,mt8183-disp-ccorr

Same here.

>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index bc83155b3b4c..d0a4b9eb71fd 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -37,6 +37,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8183-disp-color
> +              - mediatek,mt8186-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> index 9d89297f5f1d..9a08514ed909 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> @@ -26,6 +26,7 @@ properties:
>            - const: mediatek,mt8183-disp-dither
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-dither
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index 247baad147b3..6d96f6736d91 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -27,6 +27,7 @@ properties:
>            - const: mediatek,mt8183-disp-gamma
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-gamma
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> index 6eca525eced0..55391b5c08c4 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> @@ -34,6 +34,8 @@ properties:
>            - const: mediatek,mt8173-disp-mutex
>        - items:
>            - const: mediatek,mt8183-disp-mutex
> +      - items:
> +          - const: mediatek,mt8186-disp-mutex
>        - items:
>            - const: mediatek,mt8192-disp-mutex

All these single entry cases can be a single enum.

>        - items:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> index 611a2dbdefa4..f7f89485a5ae 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> @@ -25,6 +25,11 @@ properties:
>            - const: mediatek,mt8183-disp-ovl-2l
>        - items:
>            - const: mediatek,mt8192-disp-ovl-2l
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-ovl-2l
> +          - enum:
> +              - mediatek,mt8192-disp-ovl-2l
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index e71f79bc2dee..110e6b2747bc 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -40,6 +40,11 @@ properties:
>                - mediatek,mt8195-disp-ovl
>            - enum:
>                - mediatek,mt8183-disp-ovl
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-ovl
> +          - enum:
> +              - mediatek,mt8192-disp-ovl
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> index 6ac1da2e8871..22c333d09465 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> @@ -23,6 +23,11 @@ properties:
>      oneOf:
>        - items:
>            - const: mediatek,mt8192-disp-postmask
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-postmask
> +          - enum:
> +              - mediatek,mt8192-disp-postmask
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index 8ef821641672..4f1c935cdf70 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -39,6 +39,7 @@ properties:
>                - mediatek,mt2701-disp-rdma
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-rdma
>                - mediatek,mt8192-disp-rdma
>            - enum:
>                - mediatek,mt8183-disp-rdma
> -- 
> 2.18.0
> 
> 
