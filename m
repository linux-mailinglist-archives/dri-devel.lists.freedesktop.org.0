Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC506B1199
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 20:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8535610E6E9;
	Wed,  8 Mar 2023 19:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A2D10E6E9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 19:02:59 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-17683b570b8so17021951fac.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 11:02:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678302178;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5FrWOB0uVxHx56X9xrWxuDWJ/kb3JEYgMVQs34PVT2U=;
 b=jWEu82bsvNZfSdE8qCGkLIazdvUPtH7e+i8w62bBShpUf2onXh92mLDuIw+jy0mGe6
 ZdtJQHdupqh0aeVTdVmnixeVp/0YDYqvPIROr7ARsRYSucRKD2VqtoDv1sQb5Yzc0BCV
 SZbCwwbQzrwjgl22W0Ng+jqt8jJXWAvddF/cejLvGp5rHdpXEz0QyivIp52+mHqPOkFb
 aUki6tVEVcQvCPba/OvjS4Fs6WDE+sSW259+qkdiqnEISX1pN42CgRqZ+FnKxC2KdnQ3
 sjif6ZD+QQEB0Ht+rwZiMr0nGKbuy10b0NNtksuVv3bWZR0eTDHIVUq7KDY4XzC8W6PI
 Zutw==
X-Gm-Message-State: AO0yUKUJpIBI1+D1L54f3lg3kzXK9u3dRNbBH9LEvaM3ZsUox9XaU9Wx
 4D7CyZ+tDmoUHO3rZfkhiQ==
X-Google-Smtp-Source: AK7set+DvjoWc1KWq2h3sKBZx+8CoWicRMFGWsEt1KRrNByZmsCl9/pHwHZRNzh/c5BtXW6lqvK2cw==
X-Received: by 2002:a05:6870:b14d:b0:172:80f9:a545 with SMTP id
 a13-20020a056870b14d00b0017280f9a545mr13141161oal.25.1678302178217; 
 Wed, 08 Mar 2023 11:02:58 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d199-20020a4a52d0000000b005264a1472adsm1543777oob.15.2023.03.08.11.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 11:02:57 -0800 (PST)
Received: (nullmailer pid 3604331 invoked by uid 1000);
 Wed, 08 Mar 2023 19:02:57 -0000
Date: Wed, 8 Mar 2023 13:02:57 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 03/12] dt-bindings: gpu: mali-bifrost: Fix
 power-domain-names validation
Message-ID: <20230308190257.GA3601415-robh@kernel.org>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228102704.708150-3-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 11:26:55AM +0100, AngeloGioacchino Del Regno wrote:
> Commit ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
> incorrectly introduced power domain names for MT8183, causing
> validation issues.
> 
> Add power-domain-names to the base schema, allowing a maximum of
> five elements; since platforms having a single power domain don't
> need any actual domain name, disallow that for each sub-schema.
> 
> Fixes: a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml          | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 5b7f1c9d2b30..bf0f7f1f71e0 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -65,6 +65,10 @@ properties:
>      minItems: 1
>      maxItems: 5
>  
> +  power-domain-names:
> +    minItems: 1

If you are disallowing for a single domain, then this could be 2...

Reviewed-by: Rob Herring <robh@kernel.org>

> +    maxItems: 5
> +
>    resets:
>      minItems: 1
>      maxItems: 3
> @@ -112,6 +116,7 @@ allOf:
>        properties:
>          power-domains:
>            maxItems: 1
> +        power-domain-names: false
>        required:
>          - resets
>    - if:
> @@ -136,6 +141,7 @@ allOf:
>              - const: bus_ace
>          power-domains:
>            maxItems: 1
> +        power-domain-names: false
>          resets:
>            minItems: 3
>          reset-names:
> @@ -186,6 +192,7 @@ allOf:
>              - const: bus
>          power-domains:
>            maxItems: 1
> +        power-domain-names: false
>        required:
>          - clock-names
>  
> -- 
> 2.39.2
> 
