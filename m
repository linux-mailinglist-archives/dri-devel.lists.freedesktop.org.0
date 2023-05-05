Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B786F8B7E
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 23:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD24710E69A;
	Fri,  5 May 2023 21:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6151010E0B1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 21:43:12 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-192b330a577so995748fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 14:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683322991; x=1685914991;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d67AXOmWylM0/SckTFt/S26gCo7UanrJn2W3elREHSg=;
 b=gaG6CARcXpAFOH+EjG+4WU6QZw1MNJX8usRMX0cAEK/IPNwS+Vq9dZCL9BgnUeeF+R
 uwXYbd238Zae80c4cdaNM1UFL4CAHNOu5RSBntDTsDBkLVHJ/jDoztfBVBJkmPMpQX6L
 e5aOcVPF79qLtWZM4SyTZfLgcSZKB1sjDrzZSSOy5UqhmbMEiC/LkQIpYo8uhHe8qPpB
 oKrIBOGWCU5Gt1KuLBT+z29yO4Oa/SFsKInvRRhq+bXdkynLpAKeAr7SGAepOx2Fown3
 NIKKvOpuhxkJMaOJcEjXoa9nUfJGQDu0SEEdRjLJaaK5nB7lpeboD/0l3Rsu4X6m4g/7
 idnw==
X-Gm-Message-State: AC+VfDyD96z+r2jVmjVkgw5hj+8VGNJ5lgxh9j3OmOSQJPapNHXWkQAE
 PhXPvKVzRV8FIAQ5SEIrlA==
X-Google-Smtp-Source: ACHHUZ5uobplnVA6/byhUFmIwgQB1k0JkXUKu5NuHq3CLXccWshup491ufmc/AocnoMQfW8Cfk3Xzw==
X-Received: by 2002:a05:6870:d501:b0:184:5f08:a130 with SMTP id
 b1-20020a056870d50100b001845f08a130mr1196854oan.33.1683322991085; 
 Fri, 05 May 2023 14:43:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t5-20020a056870e74500b001762d1bf6a9sm2303787oak.45.2023.05.05.14.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:43:10 -0700 (PDT)
Received: (nullmailer pid 3612999 invoked by uid 1000);
 Fri, 05 May 2023 21:43:09 -0000
Date: Fri, 5 May 2023 16:43:09 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: novatek,nt36523: define ports
Message-ID: <20230505214309.GA3609047-robh@kernel.org>
References: <20230502120036.47165-1-krzysztof.kozlowski@linaro.org>
 <20230502120036.47165-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502120036.47165-2-krzysztof.kozlowski@linaro.org>
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

On Tue, May 02, 2023 at 02:00:36PM +0200, Krzysztof Kozlowski wrote:
> The panel-common schema does not define what "ports" property is, so
> bring the definition to enforce the type.  All panels described by
> binding are dual-link, thus require both ports.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Rework to add ports to device schema, not to panel-common.
> https://lore.kernel.org/all/20230420160905.GA2952736-robh@kernel.org/
> ---
>  .../bindings/display/panel/novatek,nt36523.yaml           | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> index 0039561ef04c..a2a8c4e39573 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> @@ -32,8 +32,14 @@ properties:
>    vddio-supply:
>      description: regulator that supplies the I/O voltage
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    required:
> +      - port@0
> +      - port@1

What is each port?
 
You need:

additionalProperties: false
properties:
  port@0:
    $ref: ...
    description: ...

  port@1:
    $ref: ...
    description: ...

