Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6C6346D7B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 23:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAEF6E196;
	Tue, 23 Mar 2021 22:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC906E196
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 22:45:49 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id e8so19504253iok.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ab4o4vZ3Z9H6htd+vIWwUIBld84Fbz0WvCeZIZS5gUY=;
 b=hTWeOWU4dmlw4lRrMoRmsOMf+bDJULThBoclRLfgkWaPtr3yasK4QiiaLzIAnocZ+F
 KbMTrrm/BImnL3Zvufvp7LgXgWiWGgHuptmPIEwPA2YaWyyQ2DcJSDOekCYcJ64vZVII
 9KhGY15C/UkD9e0h3/rPk5kF1+jUQ8GaWkOBvKCVcy6JJLDyuwV8KLvzInfvqQhpoNY4
 CD6GWmzPnWwVJdh/DcdhpN+jYuntn/t/aWoq+FWSpwcoc4zEiT0YDQoZ/vFqqFxoWuA0
 CD+iOqjgMqu5Qdn3KnvBIUWJ1wPe7qudYz8ijjWu8YAYYG/XUKYxXM2n01b29Kej6nvk
 wvKw==
X-Gm-Message-State: AOAM533ZG7Y8cBjM6d5/k2yoR5ClGX+NWPjDhVHiSMegdYMO4FvnX0kl
 eL+Q1ZE3GGWs57If6jjCDQ==
X-Google-Smtp-Source: ABdhPJwczXzVNl7B5zrDCuYGHxJJ00UYCjp7Y8H7wIQACyPGFHS/a8D4OsUfEtPeY1Q9yTMPTNnYoA==
X-Received: by 2002:a02:662b:: with SMTP id k43mr224183jac.139.1616539548932; 
 Tue, 23 Mar 2021 15:45:48 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b15sm136066ilm.25.2021.03.23.15.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 15:45:47 -0700 (PDT)
Received: (nullmailer pid 1488135 invoked by uid 1000);
 Tue, 23 Mar 2021 22:45:46 -0000
Date: Tue, 23 Mar 2021 16:45:46 -0600
From: Rob Herring <robh@kernel.org>
To: Parshuram Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Message-ID: <20210323224546.GA1485576@robh.at.kernel.org>
References: <1616146664-6941-1-git-send-email-pthombar@cadence.com>
 <1616146709-7227-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616146709-7227-1-git-send-email-pthombar@cadence.com>
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, airlied@linux.ie,
 robert.foss@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com,
 laurent.pinchart@ideasonboard.com, sjakhade@cadence.com, nikhil.nd@ti.com,
 mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 10:38:29AM +0100, Parshuram Thombare wrote:
> Add binding changes for HDCP in the MHDP8546 DPI/DP bridge binding.
> 
> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
> ---
>  .../display/bridge/cdns,mhdp8546.yaml         | 34 ++++++++++++-------
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> index 63427878715e..d571f4bb6b16 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> @@ -17,8 +17,8 @@ properties:
>        - ti,j721e-mhdp8546
>  
>    reg:
> -    minItems: 1
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3

1 entry was valid and now it is not? That's not a compatible change and 
needs an explanation at a minimum.

>      items:
>        - description:
>            Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
> @@ -26,13 +26,20 @@ properties:
>            included in the associated PHY.
>        - description:
>            Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
> +      - description:
> +          Register block of mhdptx sapb registers.
>  
>    reg-names:
> -    minItems: 1
> -    maxItems: 2
> -    items:
> -      - const: mhdptx
> -      - const: j721e-intg
> +    minItems: 2
> +    maxItems: 3
> +    oneOf:
> +      - items:
> +          - const: mhdptx
> +          - const: j721e-intg
> +          - const: mhdptx-sapb
> +      - items:
> +          - const: mhdptx
> +          - const: mhdptx-sapb
>  
>    clocks:
>      maxItems: 1
> @@ -98,15 +105,15 @@ allOf:
>      then:
>        properties:
>          reg:
> -          minItems: 2
> +          minItems: 3
>          reg-names:
> -          minItems: 2
> +          minItems: 3
>      else:
>        properties:
>          reg:
> -          maxItems: 1
> +          maxItems: 2
>          reg-names:
> -          maxItems: 1
> +          maxItems: 2
>  
>  required:
>    - compatible
> @@ -129,8 +136,9 @@ examples:
>  
>          mhdp: dp-bridge@f0fb000000 {
>              compatible = "cdns,mhdp8546";
> -            reg = <0xf0 0xfb000000 0x0 0x1000000>;
> -            reg-names = "mhdptx";
> +            reg = <0xf0 0xfb000000 0x0 0x1000000>,
> +                  <0x0 0x4f48000 0x0 0x74>;
> +            reg-names = "mhdptx", "mhdptx-sapb";
>              clocks = <&mhdp_clock>;
>              phys = <&dp_phy>;
>              phy-names = "dpphy";
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
