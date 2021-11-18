Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F056A4565E4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 23:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E28C6E820;
	Thu, 18 Nov 2021 22:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2E36E820
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 22:49:57 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id t23so17683213oiw.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 14:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NEMOVgkvVV2eWKxnp9UBhrGqsYMELkDt/UIMsRouQTI=;
 b=h3+gAkzul70KJIg3HW/vCf48aL+Fi71LnbHH8joxuiS1P6+TJR1ySgsQf3w7V3Gq6M
 aapVmKSxqXbMkpMo8B2BUzSu6ggo7OI7X5J4moOj4fBUa6cJgjkv5A9EfeOi+1gF6QWC
 MCcDsMF9tXLgRDAaxjSU5w3eRCTuwO3obf951tuBCygd+y3Nt/oksj+kabOmMrMKDfrZ
 lDZ+xI4VYkrDcfD2COpielc1E0ETNfPS3sj57YFWumTkfy0xFguFZMDYqLc3wjLDz1VH
 wJ2UPKT1dF5kDspx7LKOHSZSvlYfq/TFp6bi+yfpXNMFisadpE4TeOjExpOeFOwzisVR
 cH1g==
X-Gm-Message-State: AOAM533MLWKnD2gmPwLS8ZfGe3F/76RZyCjgKgvwjAtXg/Gv0Tv8Uyjw
 0+638iJQht5zbPGadfkGQA==
X-Google-Smtp-Source: ABdhPJyRhCp+Q8aBhg/oMots96pmWF4+WFdd2UzE562Fg4cqxoNVqdfURkh0kxWYoDlO/IZ60UuToA==
X-Received: by 2002:a05:6808:1784:: with SMTP id
 bg4mr587209oib.70.1637275796369; 
 Thu, 18 Nov 2021 14:49:56 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e14sm267321oow.3.2021.11.18.14.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 14:49:55 -0800 (PST)
Received: (nullmailer pid 1907489 invoked by uid 1000);
 Thu, 18 Nov 2021 22:49:54 -0000
Date: Thu, 18 Nov 2021 16:49:54 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/2] dt-bindings: display: Turn lvds.yaml into a generic
 schema
Message-ID: <YZbYkpHFc0XzwMOC@robh.at.kernel.org>
References: <20211116143503.385807-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116143503.385807-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Frank Rowand <frowand.list@gmail.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 03:35:02PM +0100, Maxime Ripard wrote:
> The lvds.yaml file so far was both defining the generic LVDS properties
> (such as data-mapping) that could be used for any LVDS sink, but also
> the panel-lvds binding.
> 
> That last binding was to describe LVDS panels simple enough, and had a
> number of other bindings using it as a base to specialise it further.
> 
> However, this situation makes it fairly hard to extend and reuse both
> the generic parts, and the panel-lvds itself.
> 
> Let's remove the panel-lvds parts and leave only the generic LVDS
> properties.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../display/panel/advantech,idk-1110wr.yaml   | 17 ++++++++++-
>  .../display/panel/innolux,ee101ia-01d.yaml    | 21 +++++++++++++-
>  .../bindings/display/panel/lvds.yaml          | 29 +------------------
>  .../display/panel/mitsubishi,aa104xd12.yaml   | 17 ++++++++++-
>  .../display/panel/mitsubishi,aa121td01.yaml   | 17 ++++++++++-
>  .../display/panel/sgd,gktw70sdae4se.yaml      | 17 ++++++++++-
>  6 files changed, 85 insertions(+), 33 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> index 93878c2cd370..f27cd2038636 100644
> --- a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> @@ -11,13 +11,23 @@ maintainers:
>    - Thierry Reding <thierry.reding@gmail.com>
>  
>  allOf:
> +  - $ref: panel-common.yaml#
>    - $ref: lvds.yaml#
>  
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: advantech,idk-1110wr
> +
> +  required:
> +    - compatible
> +
>  properties:
>    compatible:
>      items:
>        - const: advantech,idk-1110wr
> -      - {} # panel-lvds, but not listed here to avoid false select
> +      - const: panel-lvds
>  
>    data-mapping:
>      const: jeida-24
> @@ -35,6 +45,11 @@ additionalProperties: false
>  
>  required:
>    - compatible
> +  - data-mapping
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +  - port
>  
>  examples:
>    - |+
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
> index a69681e724cb..6e06eecac14e 100644
> --- a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
> @@ -11,15 +11,26 @@ maintainers:
>    - Thierry Reding <thierry.reding@gmail.com>
>  
>  allOf:
> +  - $ref: panel-common.yaml#
>    - $ref: lvds.yaml#
>  
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: innolux,ee101ia-01d
> +
> +  required:
> +    - compatible
> +
>  properties:
>    compatible:
>      items:
>        - const: innolux,ee101ia-01d
> -      - {} # panel-lvds, but not listed here to avoid false select
> +      - const: panel-lvds
>  
>    backlight: true
> +  data-mapping: true
>    enable-gpios: true
>    power-supply: true
>    width-mm: true
> @@ -27,5 +38,13 @@ properties:
>    panel-timing: true
>    port: true
>  
> +required:
> +  - compatible
> +  - data-mapping
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +  - port
> +
>  additionalProperties: false
>  ...
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> index 49460c9dceea..5281a75c8bb5 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/display/panel/lvds.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: LVDS Display Panel
> +title: LVDS Display Common Properties
>  
>  maintainers:
>    - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> @@ -26,18 +26,7 @@ description: |+
>    Device compatible with those specifications have been marketed under the
>    FPD-Link and FlatLink brands.
>  
> -allOf:
> -  - $ref: panel-common.yaml#
> -

I think you can leave this instead of adding everywhere you include 
lvds.yaml. Either way,

Reviewed-by: Rob Herring <robh@kernel.org>
