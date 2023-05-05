Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B1D6F8B83
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 23:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB8D10E0B1;
	Fri,  5 May 2023 21:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181BE10E0B1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 21:45:31 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-192d5ab4962so1295099fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 14:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683323131; x=1685915131;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RY/eXSCNgcg1l+d5z3txUiSd1IDYl3P2//k5Gq9XXUY=;
 b=XnOHnuv/oBs0gj+N34JK43Zn8+W246EL3QAIx2LM1WdfGVU2jZDcgUR5E9s0aVO0V/
 Sb0mrEcJhNYN1tdqumNW+HkeyhZGsvofb+aYrjQmvTRi4yBQ7C0pUygkAHPT/xbYhtzx
 jshxRvpZr8r9sVB/Mq3Tv8K3rsVV8yoKU6ah2VzzSvrWE+z6FHM3MC8F245k73Oz+iQC
 ZQ3BPT/YnmYI8cshUlHsvxN65oL0wks5o97RZg3mwIVWqxU7yH5cdK+LM6/LEe2fQWRa
 pFAkxQvLclnTsYg74VbBbRrQVTuJHB42K0YBYqtqmHrkk3wZf8nWbwNT3K75ZxwFC7P1
 5XqA==
X-Gm-Message-State: AC+VfDySx8mKLPyPtZfmp3Kcj4TPw+SUDQ4WGpjBwitWoGwyjh4Ayawn
 cDZCu503C3pJGrxGssaeww==
X-Google-Smtp-Source: ACHHUZ4C5l8ALq0mTUv2IjXe/kxKCI1lSv66O5mZNz9Pe/is9TVS3MYfOyhEyPYDZp5nqgCqoOxcMw==
X-Received: by 2002:a05:6808:aa8:b0:38e:aa4:e4a4 with SMTP id
 r8-20020a0568080aa800b0038e0aa4e4a4mr1289438oij.8.1683323131028; 
 Fri, 05 May 2023 14:45:31 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 du3-20020a056808628300b0038bffe1332dsm3173068oib.57.2023.05.05.14.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:45:30 -0700 (PDT)
Received: (nullmailer pid 3616075 invoked by uid 1000);
 Fri, 05 May 2023 21:45:29 -0000
Date: Fri, 5 May 2023 16:45:29 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: novatek,nt35950: define ports
Message-ID: <20230505214529.GB3609047-robh@kernel.org>
References: <20230502120036.47165-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502120036.47165-1-krzysztof.kozlowski@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jianhua Lu <lujianhua000@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 02, 2023 at 02:00:35PM +0200, Krzysztof Kozlowski wrote:
> The panel-common schema does not define what "ports" property is, so
> bring the definition to enforce the type.  Panels can be single- or
> dual-link, thus require only one port@0.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Rework to add ports to device schema, not to panel-common.
> https://lore.kernel.org/all/20230420160905.GA2952736-robh@kernel.org/
> ---
>  .../bindings/display/panel/novatek,nt35950.yaml           | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
> index 377a05d48a02..c93cc1018b41 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
> @@ -47,8 +47,13 @@ properties:
>    vddio-supply:
>      description: regulator that supplies the I/O voltage
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

Similarly needed on this one.

Perhaps what you want here is a dual-link panel schema?

> +
> +    required:
> +      - port@0
> +
>    backlight: true
> -  ports: true
>    reg: true
>  
>  required:
> @@ -59,6 +64,7 @@ required:
>    - avee-supply
>    - dvdd-supply
>    - vddio-supply
> +  - ports
>  
>  additionalProperties: false
>  
> -- 
> 2.34.1
> 
