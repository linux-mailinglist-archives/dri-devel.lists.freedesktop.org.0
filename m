Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC9B4BD3D6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 03:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0906610E280;
	Mon, 21 Feb 2022 02:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8037810E280
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:36:34 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id e79so14365431iof.13
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 18:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=z3L0QAaP0YwGTd6VI4wxx/3lOMZUuCl0MhaQbdJh1OQ=;
 b=pZ0ixaLMkfeCHOHE7FMUi2BAkw5jwzx0Bh6oY6GVzPdSgvK6Jzx5Eu1vY3IOIyt87P
 wPECivyHAJzTaZVppkmXFn3eOR6iSKsYdAS9TRIn0eY4JE3QTXiUWK3oRQUDB/tHrAoC
 BbFA1qtTo8bCtdQ5NkF7NsnZle9eiLSHu7DfJJnzx4SAcfS0tCLNL/tIrCjhd4d3oJii
 IuMrgJQWO5fBzmzE1JV6mI874m8y85OF5gwzHFt94qyKsOqlw6KTRRyvZBw2AkBD01lg
 E7UrGQlhUnBjLEZaJrmmmmwctsSf3lTxDIZ/n690reLSZYEBz10vCqLwjXvN0HBVEvZ7
 WKxA==
X-Gm-Message-State: AOAM533zeDo/85sMAlwHVr4+8ITVmk4lRJ8OxDigwfi6lAMVPQRGi7Ol
 XObPY4SSasEAlB+Or6QQhg==
X-Google-Smtp-Source: ABdhPJzC3lbA/3xbYHDC1TVY6Mc9mRZFu+uPq7kGdXhvdW9HCdoukC5Q8i8N7ZC5YawbHb6/C1rUWw==
X-Received: by 2002:a02:c851:0:b0:30e:2296:4290 with SMTP id
 r17-20020a02c851000000b0030e22964290mr14295308jao.49.1645410993813; 
 Sun, 20 Feb 2022 18:36:33 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id s9sm7433901ilv.50.2022.02.20.18.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 18:36:33 -0800 (PST)
Received: (nullmailer pid 2041539 invoked by uid 1000);
 Mon, 21 Feb 2022 02:36:09 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-3-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-3-granquet@baylibre.com>
Subject: Re: [PATCH v8 02/19] dt-bindings: mediatek,
 dp: Add Display Port binding
Date: Sun, 20 Feb 2022 20:36:09 -0600
Message-Id: <1645410969.343097.2041538.nullmailer@robh.at.kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, chunkuang.hu@kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, deller@gmx.de,
 kishon@ti.com, devicetree@vger.kernel.org, jitao.shi@mediatek.com,
 tzimmermann@suse.de, Markus Schneider-Pargmann <msp@baylibre.com>,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Feb 2022 15:54:20 +0100, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
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
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1594807

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

