Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5067428E1E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 15:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED13A6E4D2;
	Mon, 11 Oct 2021 13:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C086E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 13:36:22 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id n63so24624671oif.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 06:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ldY18yibfHG91zMBxbkh+bf7In/Vug5vRBddbeB/9N4=;
 b=Lqpdpl407mHu+4/ByvPh/KR6q1K1XOmnIzpOUHaCisLs7FtE7egw1judPCgKgg3XSL
 50amo4X7SksdIonRx07mlFH1zB+TrvyhQ6v42j8COe3QlWXn1rutWHZ9et2HNJPAcdv7
 MOHLUipByG0kG7Ib1VEbsUzsqOk0FpX/2WhtAaKGmmzT/AeyqwCeGPLqu+53rQrXprz2
 4iQP8PCg3oYN8OLzO/Q5esm7L+P6lyXUEiGewLmdkfz5beR7jvThCS7nPtiN2MSnBsIu
 yr3ZwJJT23dgOPzFAEk0GRKQ7tkINn6IxwQ5nJ3msNHFJS4hpfWaPE6Ccf+p4cbEk6eX
 Wabw==
X-Gm-Message-State: AOAM533/XQ5jmP3CBuoH/0YkRuojpY/DcjB46OpKOWHODVdMQjcCMUtY
 H56NLUchJzRi3aG+h7EktBCIhbgZ0w==
X-Google-Smtp-Source: ABdhPJypokMi51gPcPyqsapesi1YWppZ4/PMLz4g89NLeFCSU2UGP0rJm3mD3Jks3tuGrdqzRkcIAA==
X-Received: by 2002:aca:c60e:: with SMTP id w14mr17766103oif.156.1633959382154; 
 Mon, 11 Oct 2021 06:36:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q2sm1522486ooe.12.2021.10.11.06.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:36:21 -0700 (PDT)
Received: (nullmailer pid 504944 invoked by uid 1000);
 Mon, 11 Oct 2021 13:36:18 -0000
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Vinod Koul <vkoul@kernel.org>
In-Reply-To: <20211011094624.3416029-2-msp@baylibre.com>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-2-msp@baylibre.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: mediatek,dpintf: Add DP_INTF binding
Date: Mon, 11 Oct 2021 08:36:18 -0500
Message-Id: <1633959378.242329.504943.nullmailer@robh.at.kernel.org>
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

On Mon, 11 Oct 2021 11:46:18 +0200, Markus Schneider-Pargmann wrote:
> DP_INTF is a similar functional block to mediatek,dpi but is different
> in that it serves the DisplayPort controller on mediatek SoCs and uses
> different clocks. Therefore this patch creates a new binding file for
> this functional block.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes v3 -> v4:
>     - Fixed clock names in the example as the clock patch series is merged into
>       next now
>     - Add missing ports decleration to the example
> 
>     Changes v1 -> v2:
>     - Move the devicetree binding from mediatek,dpi into its own binding file.
> 
>  .../display/mediatek/mediatek,dpintf.yaml     | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.example.dts:21:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file or directory
   21 |         #include <dt-bindings/clock/mt8195-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1539196

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

