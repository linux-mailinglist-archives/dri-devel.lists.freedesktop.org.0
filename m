Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B526E6F57
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 00:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15B310E215;
	Tue, 18 Apr 2023 22:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772F110E215
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 22:26:15 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6a5ecdb455bso485516a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 15:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681856774; x=1684448774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DzkYu2FZFUxwYvdabyHvXaq9bbCUpOwOEj0N+6nTnPE=;
 b=HjjcDgLNtMpXfW9BEG7kmEv0HZrUJcXcuA5WamVMfN2DqXFxWNS27c81Ji2ZoJ1Mnq
 XihvL4/3HOeH1D4cnBORjhVE5dExWxXyyXb5ZcSOv8L7cgTao7ISck55DIFfl9ndQ4X7
 Z62JcCyZi/NyJk643RzXu6/mjLZHqQW13cYnb4e/1DOk/tx8wK900mWvZuDV54PET3Iw
 QmbkCamc4NgN7l7/LjYUVFQzysPt8ZDhwu3XQYQhYDACpy0rIxdEB0BY8u48NvhO3DPR
 kmipD3cbLIJdslicxDF6TwXarvyWMHlc8N6kkrBdAooMn5ldGQH4y4YuHyMqXtXTJR6B
 E9pw==
X-Gm-Message-State: AAQBX9e0ZJSgxapruszdSTpXn+P0xA/7jSCs4HePguH+SVVBd27gi346
 uPsItyJLNBklD4O6S6n2Fg==
X-Google-Smtp-Source: AKy350bFvNy0NlWTzt68rhthpi/WPjnoE7xLzVZ9Y3ny/MmMDQ7CWhC385UPZEOO6x3QefiiZ6rpbQ==
X-Received: by 2002:a05:6870:f2a5:b0:184:50ac:2e27 with SMTP id
 u37-20020a056870f2a500b0018450ac2e27mr1936247oap.50.1681856774469; 
 Tue, 18 Apr 2023 15:26:14 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e8-20020a9d63c8000000b006a5f70dd12bsm1374581otl.17.2023.04.18.15.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 15:26:13 -0700 (PDT)
Received: (nullmailer pid 2439794 invoked by uid 1000);
 Tue, 18 Apr 2023 22:26:13 -0000
Date: Tue, 18 Apr 2023 17:26:13 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: panel: add common definition of
 ports
Message-ID: <20230418222613.GA2408838-robh@kernel.org>
References: <20230416153929.356330-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416153929.356330-1-krzysztof.kozlowski@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 16, 2023 at 05:39:29PM +0200, Krzysztof Kozlowski wrote:
> Few panel bindings for dual-link connections just type "ports: true",
> which does not enforce any type.  Add common definition of ports, so the
> type will be fixed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/panel/panel-common.yaml     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index 5b38dc89cb21..ad62d34e6fa3 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -70,6 +70,16 @@ properties:
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>  
> +  # For dual-link connections
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    patternProperties:
> +      "^port@[0-9a-f]+$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base

This allows any undocumented property.

> +
> +    required:
> +      - port@0
> +

I don't think this should be added here because users must define what 
each port is. With it here, we're going to validate the nodes twice as 
well. Same can be said for 'port' though. It can't be extended though.

I originally wanted to a do a meta-schema to enforce some of this, but 
there's just too many exceptions.

Rob
