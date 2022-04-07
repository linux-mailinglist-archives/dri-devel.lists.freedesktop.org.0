Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF44F8566
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 18:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BEE10EBC3;
	Thu,  7 Apr 2022 16:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EDE10EBC3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 16:59:38 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 v19-20020a056820101300b0032488bb70f5so1029864oor.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 09:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aC19x5r9rZubAKpC81guZrRX4y273dQzbgSbAky6Be0=;
 b=1WPbZZrXJQ+ff+lde3t+H12pfFDAfmq5shq0NxBr+MuKfSgA180HssYRZQ3BP+joGB
 yDFENRsuq1Y6xatFVu/m+hTBGL95uzXmXI/XsUobiBz9FJwMnf7MHpDDZhskRXgFlpZ+
 V7fhoRNGNQypbvd/yunOkSwB4/tkrabjKlEzYDG2FYmj7ReOO67Qxdh1yUeStAUl074u
 CzJDOxN6mZEANJs8ut6ua2vrLaD8paWpv/oOG5E3l9dGWsUPeKTZAZhWAmR1VdU69Z2q
 7OmnuErC4pqOMTCBLLIVKXFE8iRzE9JeGj6CZmx9H3LhzM7f5RkXl4p6KcjUreqoE/Jg
 fTDg==
X-Gm-Message-State: AOAM531aNOnwQRXzq//BBYMpCSSgjr3nv0grGbGwZaSAiPw3Xc2x2MMc
 96Bx+NbfuXRtbmBwj7Rp5Q==
X-Google-Smtp-Source: ABdhPJyX3QvTe0zmiLuNGWZy+chauwpSC9x6rEqLF6MEabvEoOfirFI8gL6EubY0Io0O9Jw5NP94Nw==
X-Received: by 2002:a4a:d1c4:0:b0:329:7ba9:1c43 with SMTP id
 a4-20020a4ad1c4000000b003297ba91c43mr4805762oos.63.1649350777082; 
 Thu, 07 Apr 2022 09:59:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f8-20020a4a8908000000b0032472938f95sm6737942ooi.17.2022.04.07.09.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 09:59:36 -0700 (PDT)
Received: (nullmailer pid 1401083 invoked by uid 1000);
 Thu, 07 Apr 2022 16:59:35 -0000
Date: Thu, 7 Apr 2022 11:59:35 -0500
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v0 02/10] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI TX
Message-ID: <Yk8Yd1etl7pK3B+a@robh.at.kernel.org>
References: <20220406160123.1272911-1-l.stach@pengutronix.de>
 <20220406160123.1272911-3-l.stach@pengutronix.de>
 <1649275702.749756.2682164.nullmailer@robh.at.kernel.org>
 <6ce2484e9b0482b01c139118cc5b5472e5563314.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ce2484e9b0482b01c139118cc5b5472e5563314.camel@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, patchwork-lst@pengutronix.de,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 07, 2022 at 11:15:26AM +0200, Lucas Stach wrote:
> Am Mittwoch, dem 06.04.2022 um 15:08 -0500 schrieb Rob Herring:
> > On Wed, 06 Apr 2022 18:01:15 +0200, Lucas Stach wrote:
> > > The HDMI TX controller on the i.MX8MP SoC is a Synopsys designware IP
> > > core with a little bit of SoC integration around it.
> > > 
> > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > ---
> > >  .../bindings/display/imx/fsl,imx8mp-hdmi.yaml | 72 +++++++++++++++++++
> > >  1 file changed, 72 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
> > > 
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Error: Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.example.dts:36.45-46 syntax error
> > FATAL ERROR: Unable to parse input tree
> > make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.example.dtb] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1401: dt_binding_check] Error 2
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/patch/
> > 
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> > 
> Those failures are caused by the example referencing the power domain
> defines, that are only added in a dependency of this series. They build
> fine with all the dependencies applied, so please don't let this bot
> failure prevent you from looking at the actual bindings.

I review the failures. It otherwise looks fine.

Rob
