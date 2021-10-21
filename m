Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B139E4362F8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 15:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F486EC67;
	Thu, 21 Oct 2021 13:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D56C6EC65
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 13:30:09 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id g125so837424oif.9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 06:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=WLIwA5FD/KtHnG54OgwxE3AJ2VLgcGG0qXYDGdPIMCU=;
 b=0FnIiu8E5UW1spy+MxflbTiMcIDMyKvwBaOPioGSQtlNY2TnosYOpzmNmQCPzD/aT7
 GDx5wEZ4E+N2D2xYsDBku6lS79Pe8ph6GtQDoT8dYHGs8I6RWOdm5K0+ypGtiAp3fiQj
 IrvLhFdSQkupPqg4U0lkkbzFAWzSrKuW5SYsmVzD7qza0maEKsXQbsDr9pqGhl82S1ek
 J4ecWklxE5DY9R4o93YdQvCL5V167FbFIs97TmiBCUjEYpTnVbGv12WWrRIUUZVEwCrv
 T6Tk+uKPktzMAdII+0qZfZGGi11DGkDRd4Td0TO7kFgXCNIALAEOtKxSLDjJOy3YJKxV
 Hduw==
X-Gm-Message-State: AOAM533XMWwIOHYHQ8QngexEjfrmRltrxNy2SQExTUeP8ap/jtD+DJRc
 /m3PDcIwoNuWey7/AJ+HfWuY/LloDg==
X-Google-Smtp-Source: ABdhPJzWNqQ82LGFFmXVyboYOunuq36yDADhSjRjBxsMz++SfMFiv9RLtb3gzPemE+KZAIIdxJ6VMw==
X-Received: by 2002:a05:6808:f8f:: with SMTP id
 o15mr1238476oiw.38.1634823008338; 
 Thu, 21 Oct 2021 06:30:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 187sm1064082oig.19.2021.10.21.06.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:30:07 -0700 (PDT)
Received: (nullmailer pid 353169 invoked by uid 1000);
 Thu, 21 Oct 2021 13:30:05 -0000
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
In-Reply-To: <20211021092707.3562523-3-msp@baylibre.com>
References: <20211021092707.3562523-1-msp@baylibre.com>
 <20211021092707.3562523-3-msp@baylibre.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Date: Thu, 21 Oct 2021 08:30:05 -0500
Message-Id: <1634823005.099522.353168.nullmailer@robh.at.kernel.org>
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

On Thu, 21 Oct 2021 11:27:02 +0200, Markus Schneider-Pargmann wrote:
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes v4 -> v5:
>     - Removed "status" in the example
>     - Remove edp_tx compatible.
>     - Rename dp_tx compatible to dp-tx.
> 
>  .../display/mediatek/mediatek,dp.yaml         | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dts:20:18: fatal error: dt-bindings/power/mt8195-power.h: No such file or directory
   20 |         #include <dt-bindings/power/mt8195-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1544239

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

