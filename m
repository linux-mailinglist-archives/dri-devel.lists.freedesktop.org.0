Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E9B14A8C3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 18:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F298C6E31C;
	Mon, 27 Jan 2020 17:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E776E32D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 17:15:00 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id l136so7397009oig.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 09:15:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=k4ey/v184CvKWYOReTk6RsIuynmUBFRFgYAqJjPcrR4=;
 b=gEy1t4BLzUPteQAwY+VyqJKeSY3QE2OzsLZ/vzdRZBzcAwvEVXfDq448RYX1SU27KW
 mEyUnxBNcEr4V8dAbor7ZsgIW07pVB+hHxTJzUO3XCCNnW2e7/MR0zs3gmV3P84u9FpO
 v24aIPOyxfdhj/1bG9rLW6a8dAMJF2fe9CYEHdj4RR1sgKO+PSadm9wrI8jQG69MwYp5
 Qg8LqoSMqGfNqskj+Tfey4MRbPXU4dRrBpf5vISnY1T18cLdnxCHGD7rEifr6h6+Hl46
 cXoD/DvX0eI0KqdMaUKIFlWD/YEiwdVp5YFYacCykW03fTYdvIbigOvxnOAEEVniC/tf
 z1ww==
X-Gm-Message-State: APjAAAUdPoT32njHlBXvHH6nBo12HD76yGOtXYe1nwRqQeDOgQsyOOPp
 PH+Ms5uEhILuJ2qPWAbvqQ==
X-Google-Smtp-Source: APXvYqziCDKOQq2CX3TlOi7pNha+sxl3OTQ8qLhFGhkhv0aU4a8izXXCeClJ1npkU1amNVWiRslj3Q==
X-Received: by 2002:aca:e146:: with SMTP id y67mr39769oig.93.1580145299818;
 Mon, 27 Jan 2020 09:14:59 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 6sm4930858oil.43.2020.01.27.09.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 09:14:59 -0800 (PST)
Received: (nullmailer pid 8334 invoked by uid 1000);
 Mon, 27 Jan 2020 17:14:57 -0000
Date: Mon, 27 Jan 2020 11:14:57 -0600
From: Rob Herring <robh@kernel.org>
To: Yuti Amonkar <yamonkar@cadence.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: drm/bridge: Document Cadence MHDP
 bridge bindings in yaml format
Message-ID: <20200127171457.GA32507@bogus>
References: <1579690501-10698-1-git-send-email-yamonkar@cadence.com>
 <1579690501-10698-2-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579690501-10698-2-git-send-email-yamonkar@cadence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 praneeth@ti.com, narmstrong@baylibre.com, airlied@linux.ie, jonas@kwiboo.se,
 jsarha@ti.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, tomi.valkeinen@ti.com, maxime@cerno.tech,
 sjakhade@cadence.com, mparab@cadence.com, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 11:54:59AM +0100, Yuti Amonkar wrote:
> Document the bindings used for the Cadence MHDP DPI/DP bridge in
> yaml format.
> 
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> ---
>  .../bindings/display/bridge/cdns,mhdp.yaml         | 131 +++++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> new file mode 100644
> index 0000000..696418a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> @@ -0,0 +1,131 @@

Missing SPDX tag. Dual license please.

> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/bridge/cdns,mhdp.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Cadence MHDP bridge
> +
> +maintainers:
> +  - Swapnil Jakhade <sjakhade@cadence.com>
> +  - Yuti Amonkar <yamonkar@cadence.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,mhdp8546
> +      - ti,j721e-mhdp8546
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description:
> +          Register block of mhdptx apb registers upto PHY mapped area(AUX_CONFIG_P).
> +          The AUX and PMA registers are mapped to associated phy driver.
> +      - description:
> +          Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: mhdptx
> +      - const: j721e-intg
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      DP bridge clock, it's used by the IP to know how to translate a number of
> +      clock cycles into a time (which is used to comply with DP standard timings
> +      and delays).
> +
> +  phys:
> +    description: Phandle to the DisplyPort phy.
> +
> +  phy-names:
> +    const: dpphy
> +
> +  ports:
> +    type: object
> +    description:
> +      Ports as described in Documentation/devicetree/bindings/graph.txt
> +
> +    properties:
> +       '#address-cells':

Wrong indentation.

> +         const: 1
> +
> +       '#size-cells':
> +         const: 0
> +
> +       port@0:
> +         type: object
> +         description:
> +           input port representing the DP bridge input
> +
> +       port@1:
> +         type: object
> +         description:
> +           output port representing the DP bridge output.
> +
> +    required:
> +      - port@0
> +      - port@1
> +      - '#address-cells'
> +      - '#size-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,j721e-mhdp8546
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +        reg-names:
> +          minItems: 2
> +          maxItems: 2

As we've already defined the max, you can drop maxItems on these 2.

With those 2 changes,

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
