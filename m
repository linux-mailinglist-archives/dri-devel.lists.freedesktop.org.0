Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657255391B8
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 15:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9B1112F0F;
	Tue, 31 May 2022 13:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB89112F11
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 13:21:27 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id t144so17366334oie.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 06:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=sjiY+V80OL2DiZ6A4EsGgW9fJIH8AO134dDg8U/4y24=;
 b=q7Sb3DI0ywi87+pbAcG9BDwvLkB06RfDkooWr/HB7HnYbNSprIdSJIQnBsSS4209Vm
 9mls6WfDEKWyT5lQV5VpQR78KIZ0JfmkvSGYgtVPgdG5PpiDYQkKYVJDfrqDFS7BzCsZ
 dnJ2NQbgIjylUgjI243iDyEGJQyevknDTsWzTmjcGXWImk4D3Eck6Iu3f0nxlvHUoR8/
 a9PKWcolzc4q+7s6vxZVf5qaAWsuz8L9czSfJRggJiJpRh5PaprAlIn8YjhyZrMW2sJQ
 X/X/OeNIEZYbgOEtW2RH1/rVWy9rio5VaxB5Io2dDpipTIF5+ih4PbH6KxzrBcYoK8Vt
 lNAQ==
X-Gm-Message-State: AOAM532/wYqVcCodqD0hAdJolS7TQvqK5Aoad2yk35lBBrVnLx+jK0rI
 L8TxdLK0OVEJ5L2UO75exQ==
X-Google-Smtp-Source: ABdhPJyl1Zml7tK5z8UzPYsy0IRPoHHsY9ZbD0LO+NEm3SnMP5YpNvNvBFYMbygVSD+kwDaZAn8DAw==
X-Received: by 2002:a05:6808:1510:b0:32a:ef6a:99b with SMTP id
 u16-20020a056808151000b0032aef6a099bmr12444054oiw.120.1654003286440; 
 Tue, 31 May 2022 06:21:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t6-20020a056870f20600b000e90544b79fsm5563380oao.41.2022.05.31.06.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 06:21:26 -0700 (PDT)
Received: (nullmailer pid 1610155 invoked by uid 1000);
 Tue, 31 May 2022 13:21:25 -0000
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
In-Reply-To: <20220530201436.902505-1-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
Subject: Re: [PATCH 1/7] dt-bindings: display: mediatek: dpi: add
 power-domains property
Date: Tue, 31 May 2022 08:21:25 -0500
Message-Id: <1654003285.268526.1610147.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 May 2022 22:14:30 +0200, Fabien Parent wrote:
> DPI is part of the display / multimedia block in MediaTek SoCs, and
> always have a power-domain (at least in the upstream device-trees).
> Add the power-domains property to the binding documentation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.example.dts:29.35-36 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

