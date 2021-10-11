Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC615428E67
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 15:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4664C6E4E8;
	Mon, 11 Oct 2021 13:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F20789E59
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 13:43:04 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u18so56551093wrg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 06:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LBQ/RlcHRgsJhWdGxR74k8U+6xJLDTMUXocquzJPiJU=;
 b=OSRKb1tR/iscBaaH4Vkfq89LYiA99Wg2MWozP0+JxU5cFEwSuakTotaA5qfjuf0tcn
 wc8nkgQg3BjtGpo6QvjpvCeiE2dxFpXWDKG+QHquCxCgQ8iNDFTXqXnX5kH/W/QPAYy2
 rzpNcqTeyuRiAm9LFnaNn4jJGXEk0bih1SG5sjlcHk5EA27WggxzscALmljLyvSRdbSB
 K7z2/2m6MDDOgDaO2Kv7kH8Xn61JYrZatd20Aqm7yx/oaHGhqdz4vKRaSEFpV8qT+qs3
 b8SSGrk/nx+lG3UB+fe2jCF8KMujidu8X6WCwzFd9uMckL7SXKwR1604Dn7orqrDzoQp
 cOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LBQ/RlcHRgsJhWdGxR74k8U+6xJLDTMUXocquzJPiJU=;
 b=Ex8okxUov0fcTKireOprJTWusK9BYFEvqdDAT3MAnlu5PryS30coKoCkxigl2BN3Ub
 nHk3iwlvkQXVJ3CUiV0rFyQVyIBJnBfdn2u7d/X76+4BMYEVp3R2MEfX+XdC8wMDL3Bf
 ozX8KOyw6HMa+ciIW1sDtyEC2tUH7pv+TxliGLaF+rTBGGI7cWTRkqqyQX8mMR/98kWq
 Ct7AgvEZpuKn5gvDmyQAiezWaokwbQgypFVYD06xNz5z9ShzE4Ct+yN2//H6hRngAx9y
 wzURDXQazu2t9lYAYHbCewN0bKLTrhNyApsoda/FrJ1se0/28zUXU3bTiIFFl1bYZiFP
 0ZHA==
X-Gm-Message-State: AOAM532IJfGkgnn26mR71lsFvFYpt8jcel/uR/l3sfzugJ/lZe4ElZIv
 nzS59FERTLIaiM1keAPDAbhL7w==
X-Google-Smtp-Source: ABdhPJw80tNA1CtEMAR2DIAqo6RWlGOsP3zsfqN+AHn9A3bpiH1G4WPtqy3EvbLa45r88Y0l+rikmg==
X-Received: by 2002:adf:b19b:: with SMTP id q27mr25056733wra.125.1633959782842; 
 Mon, 11 Oct 2021 06:43:02 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id f3sm19666735wmb.12.2021.10.11.06.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:43:02 -0700 (PDT)
Date: Mon, 11 Oct 2021 15:43:01 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: mediatek,dpintf: Add DP_INTF binding
Message-ID: <20211011134301.rkkblnj4bfowghu7@blmsp>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-2-msp@baylibre.com>
 <1633959378.242329.504943.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1633959378.242329.504943.nullmailer@robh.at.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Oct 11, 2021 at 08:36:18AM -0500, Rob Herring wrote:
> On Mon, 11 Oct 2021 11:46:18 +0200, Markus Schneider-Pargmann wrote:
> > DP_INTF is a similar functional block to mediatek,dpi but is different
> > in that it serves the DisplayPort controller on mediatek SoCs and uses
> > different clocks. Therefore this patch creates a new binding file for
> > this functional block.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> > 
> > Notes:
> >     Changes v3 -> v4:
> >     - Fixed clock names in the example as the clock patch series is merged into
> >       next now
> >     - Add missing ports decleration to the example
> > 
> >     Changes v1 -> v2:
> >     - Move the devicetree binding from mediatek,dpi into its own binding file.
> > 
> >  .../display/mediatek/mediatek,dpintf.yaml     | 86 +++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.example.dts:21:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file or directory
>    21 |         #include <dt-bindings/clock/mt8195-clk.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The mt8195 clock series was already merged and is available in
linux-next. I checked with make dt_binding_check before sending.

Thanks,
Markus

> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1441: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1539196
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
