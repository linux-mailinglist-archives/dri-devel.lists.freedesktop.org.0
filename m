Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CCA2F3392
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 16:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767006E250;
	Tue, 12 Jan 2021 15:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0727A6E250
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 15:07:28 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id d203so2655460oia.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 07:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YURvgP9BUjHljOosNLiDIA3f2KWxkQAmrOPayfecXYk=;
 b=C2Us3RBqdYqEMiUuiwokRIkft0WHtGQ2mUecVbkwJoLouJrFRdlaBlN1UjVEKs6gIU
 1YdqbSAGUGtQEr+ag3uIHDMysC43vHTQS+xkQOn42MsTPOCI6rlUtIWZSonWZ5lkc4ei
 c0TpRvz1JRCaLqbhk9i4UM1cV0Fo4IkczZGTtVJdb6YLFnyMEzcqIMyj4JjUsVncFdii
 u9kigRz2QGqQQXQdpQqN0zSbaD7VKoo2YoaFnvdE3XWwJxZa8GCqqSOiKqFUIQxT8In3
 9N6ypIGFesvCf3uEyxgIVm6kxBk8LpbUf9fwLPQ5fPqBdFRznXfrhToNuw/Wdohe/XVn
 l62g==
X-Gm-Message-State: AOAM5331tnnMbF+fk3ntpqXf9Crl+XrB8Uc23Xk7c5VPom1aiZ9OAFQc
 k1u9zMIIUl6PbokK5HgImQ==
X-Google-Smtp-Source: ABdhPJxRuf1QKqeifgfkDYrkLo0q/suBbG48tctoUk5301xqgCa7AnfdCV5cTj3rX+62Im9zvPvjRg==
X-Received: by 2002:aca:cf03:: with SMTP id f3mr2312654oig.39.1610464048303;
 Tue, 12 Jan 2021 07:07:28 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p4sm693676oib.24.2021.01.12.07.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 07:07:27 -0800 (PST)
Received: (nullmailer pid 353855 invoked by uid 1000);
 Tue, 12 Jan 2021 15:07:26 -0000
Date: Tue, 12 Jan 2021 09:07:26 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v9 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Message-ID: <20210112150726.GA330364@robh.at.kernel.org>
References: <20210108011011.4061575-1-drinkcat@chromium.org>
 <20210108091005.v9.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108091005.v9.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
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
Cc: devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 08, 2021 at 09:10:08AM +0800, Nicolas Boichat wrote:
> Define a compatible string for the Mali Bifrost GPU found in
> Mediatek's MT8183 SoCs.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
> 
> (no changes since v6)
> 
> Changes in v6:
>  - Rebased, actually tested with recent mesa driver.
>  - No change
> 
> Changes in v5:
>  - Rename "2d" power domain to "core2"
> 
> Changes in v4:
>  - Add power-domain-names description
>    (kept Alyssa's reviewed-by as the change is minor)
> 
> Changes in v3:
>  - No change
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 184492162e7e..71b613ee5bd7 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -17,6 +17,7 @@ properties:
>      items:
>        - enum:
>            - amlogic,meson-g12a-mali
> +          - mediatek,mt8183-mali
>            - realtek,rtd1619-mali
>            - rockchip,px30-mali
>        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> @@ -87,6 +88,30 @@ allOf:
>      then:
>        required:
>          - resets
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8183-mali
> +    then:
> +      properties:
> +        sram-supply: true

This has to be defined at the top-level or there will be an error when 
it is present (due to additionalProperties).

In this if/then you can do:

else:
  sram-supply: false

to disallow it if not 'mediatek,mt8183-mali'

> +        power-domains:
> +          description:
> +            List of phandle and PM domain specifier as documented in
> +            Documentation/devicetree/bindings/power/power_domain.txt
> +          minItems: 3
> +          maxItems: 3
> +        power-domain-names:
> +          items:
> +            - const: core0
> +            - const: core1
> +            - const: core2
> +
> +      required:
> +        - sram-supply
> +        - power-domains
> +        - power-domains-names
>  
>  examples:
>    - |
> -- 
> 2.29.2.729.g45daf8777d-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
