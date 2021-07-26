Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBF53D6A2E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 01:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9A86EA31;
	Mon, 26 Jul 2021 23:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5906B6EA31
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 23:25:41 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id h18so10541668ilc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 16:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MT4ylZQUL8zUjXo5xoBdpyFKPIyYeR5lDgFshQ2XgV4=;
 b=GOifjkUwlQw81WczzWfmSFI/5sur3rIe214eYfbtIYvMXP+VGjVvtTsYLVaK95exQ9
 B+VEq5lz7hVP0SI8vpdn35iQyjoF1Mx4kNV1MN21txGqoOFi0C1pXvy435YxWory77Wf
 L7k/AbCX/eILDUC3UcFBRMaDxKnPmZlPm4liNyGutQJREvTnCfCe1zaR53OeQIMyOgfA
 Fnq+5U1CoTybJhHORWHEIpo4q18BzFKHX0AKOXg/48pZW+y79zRfDLGYwjltwDD4kWoB
 gpRrMYLyCBxf9KFnMoygJPdviiDuktHH4RPh/3amLTDLv+3eDHg+HQS/kZrJ0lRwAjdd
 Vblg==
X-Gm-Message-State: AOAM530c0Hp5yMqZ4+Kzh01mfmx8e/QOAT7WgondcvJVh998ZW0qtY4X
 AWeoj2c5EkvrJ32wOFjHIw==
X-Google-Smtp-Source: ABdhPJybV1QTJn5F7wJak8d/0grLF5h3EbNyDlCgdReZoM4WIRqGcy5VdThDY8w8DBuHmbVt84Bdbg==
X-Received: by 2002:a92:cf05:: with SMTP id c5mr14181235ilo.196.1627341940689; 
 Mon, 26 Jul 2021 16:25:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id x11sm666558ilu.3.2021.07.26.16.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 16:25:40 -0700 (PDT)
Received: (nullmailer pid 1074977 invoked by uid 1000);
 Mon, 26 Jul 2021 23:25:37 -0000
Date: Mon, 26 Jul 2021 17:25:37 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 1/2] dt-bindings: display: bridge: lvds-codec:
 Document LVDS data mapping select
Message-ID: <20210726232537.GA1065054@robh.at.kernel.org>
References: <20210726210250.531544-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726210250.531544-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 11:02:49PM +0200, Marek Vasut wrote:
> Decoder input LVDS format is a property of the decoder chip or even
> its strapping. Add DT property data-mapping the same way lvds-panel
> does, to define the LVDS data mapping.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Use allOf
>     - Move the data-mapping to endpoint
> V3: - Rebase on V2 submitted a while ago, reinstate changelog
>     - Drop the allOf and un-rebase on previous pclk patch
> ---
>  .../bindings/display/bridge/lvds-codec.yaml   | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 304a1367faaa7..f795c671c3ce1 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -60,6 +60,21 @@ properties:
>            For LVDS encoders, port 1 is the LVDS output
>            For LVDS decoders, port 1 is the parallel output
>  
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#

Adding this means the 'port' needs to reference '$defs/port-base' 
instead of 'properties/port'. Otherwise, it's going to start failing 
when 'unevaluatedProperties' gets implemented (appears to be soon now).

> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-mapping:
> +                enum:
> +                  - jeida-18
> +                  - jeida-24
> +                  - vesa-24
> +                description: |
> +                  The color signals mapping order. See details in
> +                  Documentation/devicetree/bindings/display/panel/lvds.yaml
> +
>      required:
>        - port@0
>        - port@1
> @@ -71,6 +86,22 @@ properties:
>  
>    power-supply: true
>  
> +if:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          const: lvds-decoder
> +then:
> +  properties:
> +    ports:
> +      properties:
> +        port@1:
> +          properties:
> +            endpoint:
> +              properties:
> +                data-mapping: false

With this, I kind of think the schema should be split into encoder and 
decoder schemas. But we can leave that for the next addition...

Rob
