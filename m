Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832CE4CAD90
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 19:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0210610E3D1;
	Wed,  2 Mar 2022 18:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB74410E3D1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 18:29:18 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so2934074ooi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 10:29:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DDLkQjtsVkQCsb7mEStcIkC/qhgtCuwY/MfpFPALJyM=;
 b=A6i/QRBpzssR5lVP7xMRdPuCcS/objObPRePfxdVKVy6yYBa2mbnYS8JycUupKxzK2
 MqoiuLIwUtR7NP2qtrK68ZVPiujOQjmiWR+a/d6nChsx3eJxsAsctx5KSpN5AyqT+46J
 c+KV0PpbKr6aGNtPzBuEDK3G8nnTbCJTZIz1LeBeJ1FcqiZZPAgOeg72kOqyMlmDyWz6
 HFacdKmkrdgf2MIiyaFIYD06jV0h6sJlR9JB+rYQougstLuDmkcksJDYTJukyiT+CZ6q
 dFLo+CmS806/j0puthahxjYugAeSVKkOO4l2hoKmNuiOEOjnq6x2JvMqSmcJ0W375X4z
 //fw==
X-Gm-Message-State: AOAM533HjBSuqypvd5IoA40bKOsLHAYXPJGop4qApTDGza+24OK22uxr
 6JSxuNw/r69xclw9W8qgIJEgXJ9J3Q==
X-Google-Smtp-Source: ABdhPJwqJ83BEMj8ICVihFWXKcXZLet9FKLbMpQjJ9xjN7RYb6lJkezH8+mFjc0TP3O8aXVud+J10w==
X-Received: by 2002:a05:6870:4392:b0:d7:844:3d99 with SMTP id
 r18-20020a056870439200b000d708443d99mr912928oah.56.1646245758091; 
 Wed, 02 Mar 2022 10:29:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 s12-20020a0568302a8c00b005b010d92dadsm4690104otu.69.2022.03.02.10.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:29:17 -0800 (PST)
Received: (nullmailer pid 4010908 invoked by uid 1000);
 Wed, 02 Mar 2022 18:29:16 -0000
Date: Wed, 2 Mar 2022 12:29:16 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH V5 3/6] dt-bindings: display: mediatek: revise enum to
 const
Message-ID: <Yh+3fPzns86LSIdi@robh.at.kernel.org>
References: <20220301080105.31323-1-rex-bc.chen@mediatek.com>
 <20220301080105.31323-4-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301080105.31323-4-rex-bc.chen@mediatek.com>
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

On Tue, Mar 01, 2022 at 04:01:02PM +0800, Rex-BC Chen wrote:
> There won't be more than 1 fallback for these bindings, so we modify
> them to use const instead of enum.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 2 +-
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 2 +-
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 4 ++--
>  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 2 +-
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 2 +-
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 4 ++--
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4 ++--
>  7 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 191b56e16bee..bc1c70d089ba 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -31,7 +31,7 @@ properties:
>                - mediatek,mt8183-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
> -          - enum:
> +          - const:
>                - mediatek,mt8173-disp-aal

Run 'make dt_binding_check'. This will fail.

>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index 6894b6999412..fc40e2981eaa 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -28,7 +28,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8195-disp-ccorr
> -          - enum:
> +          - const:
>                - mediatek,mt8192-disp-ccorr
>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index bc83155b3b4c..22ed5d368cbe 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -32,14 +32,14 @@ properties:
>            - enum:
>                - mediatek,mt7623-disp-color
>                - mediatek,mt2712-disp-color
> -          - enum:
> +          - const:
>                - mediatek,mt2701-disp-color
>        - items:
>            - enum:
>                - mediatek,mt8183-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
> -          - enum:
> +          - const:
>                - mediatek,mt8173-disp-color
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> index 9d89297f5f1d..2a82792b2625 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> @@ -28,7 +28,7 @@ properties:
>            - enum:
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
> -          - enum:
> +          - const:
>                - mediatek,mt8183-disp-dither
>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index 247baad147b3..45f88bdf07bb 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -29,7 +29,7 @@ properties:
>            - enum:
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
> -          - enum:
> +          - const:
>                - mediatek,mt8183-disp-gamma
>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index e71f79bc2dee..88ba3f27b0e4 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -33,12 +33,12 @@ properties:
>            - enum:
>                - mediatek,mt7623-disp-ovl
>                - mediatek,mt2712-disp-ovl
> -          - enum:
> +          - const:
>                - mediatek,mt2701-disp-ovl
>        - items:
>            - enum:
>                - mediatek,mt8195-disp-ovl
> -          - enum:
> +          - const:
>                - mediatek,mt8183-disp-ovl
>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index 8ef821641672..56368c10d904 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -35,12 +35,12 @@ properties:
>            - enum:
>                - mediatek,mt7623-disp-rdma
>                - mediatek,mt2712-disp-rdma
> -          - enum:
> +          - const:
>                - mediatek,mt2701-disp-rdma
>        - items:
>            - enum:
>                - mediatek,mt8192-disp-rdma
> -          - enum:
> +          - const:
>                - mediatek,mt8183-disp-rdma
>  
>    reg:
> -- 
> 2.18.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
