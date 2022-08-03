Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A740589476
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 00:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1482811A106;
	Wed,  3 Aug 2022 22:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E0711B386
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 22:37:13 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id i84so1398736ioa.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 15:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=4pz4MBcrSjB8kB9MOPhMov58tyMfLBBMG6H3f2eOpjw=;
 b=0Xs9zi2Xq+oEI0rUKy+/nVL35EOP5LYLIrZxDln0YBIwHzaLDSlIoAPLMoYMIsQ1lK
 w2m03VleB+aV3KGXg6oFoZKW+oaYPH2EBnwwOrSRq0VU0aBq7gg5hPBJPiLnB3X1aMG/
 m+j5YabCR2YsMKGWD6Btvf/tx9w51lyGm6BaNxEmRKMoIw6l7a0yZG9c9qxrU04vnUGi
 EjQr8fhUrlwVuLx2rZWtRA/FFfJEIWCD/DoA6AnC07UTADsY/kkGWiJ0pwXha5XFz3FD
 ZM+49Tp+C85fzv1wlXZQfdL4zKcblNAIL7/F7ubbjVIhrvTQmo8Ie11alTP6NOG+Z1qI
 4X7g==
X-Gm-Message-State: AJIora87d804SWeilUj88R4sikOnFCVO9PpvGTVN4oAVxhAfkMzUl8bD
 6d4HL5J2//A4rCUTTmimbw==
X-Google-Smtp-Source: AGRyM1vIT2vAplfGeDRkhgbxS2UqKelL062MMS4BX6biQYqaVsZYCUdK1voS1xq8V8TPBXgUgPtQ7w==
X-Received: by 2002:a05:6638:2410:b0:341:5daa:2bc9 with SMTP id
 z16-20020a056638241000b003415daa2bc9mr11576771jat.306.1659566232542; 
 Wed, 03 Aug 2022 15:37:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a026002000000b0033f8af36a96sm8186583jac.165.2022.08.03.15.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 15:37:12 -0700 (PDT)
Received: (nullmailer pid 2745689 invoked by uid 1000);
 Wed, 03 Aug 2022 22:37:10 -0000
Date: Wed, 3 Aug 2022 16:37:10 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: icn6211: Add support
 for external REFCLK
Message-ID: <20220803223710.GA2744605-robh@kernel.org>
References: <20220801131747.183041-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801131747.183041-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robert.foss@linaro.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 01, 2022 at 03:17:46PM +0200, Marek Vasut wrote:
> The ICN6211 is capable of deriving its internal PLL clock from either
> MIPI DSI HS clock, external REFCLK clock, or even internal oscillator.
> Currently supported is only the first option. Document support for
> external REFCLK clock input in addition to that.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/bridge/chipone,icn6211.yaml         | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> index 4f0b7c71313c3..18563ebed1a96 100644
> --- a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> @@ -24,6 +24,15 @@ properties:
>      maxItems: 1
>      description: virtual channel number of a DSI peripheral
>  
> +  clock-names:
> +    const: "refclk"

Drop quotes.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
