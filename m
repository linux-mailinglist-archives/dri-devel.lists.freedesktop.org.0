Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4C546728
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 15:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC6810EC6D;
	Fri, 10 Jun 2022 13:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81EB10EC6D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 13:12:44 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id i16so5518784ioa.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 06:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=IkgD32JQQv4iXIcEl6HeM9jrQJQd0Tq+F8d36Y5X2zg=;
 b=tbR1W7tXaHkE1tuHAZP/lpO/q4nwlS3T97kuTdXEn13uVNmsK5QQRpEimPX9Omnv07
 kBRszTvW94yvw2fEezy1oxSiIgEUysOKZLdsrUReUa3/z+EXDIx4+CmbNFhxj6UDLlch
 XVeNQHuNveZT0PbN2amUoUtFItTq3wQAXEv/TuZF/YaJjWt8Yf1hdI/ABRMJKDFLY3Ay
 L4xKEf03eftxQYNhjGKpJct630123KFVeeyK5FMjwsTJsvCM4tYsLUHWIGNxoDOQLJzE
 cHx362aWSGAlDrVll3MuHW7oe+6204Jr3jfsBOzsK18azlvVXzFhjnACogifVVGxy4yY
 y2Rg==
X-Gm-Message-State: AOAM532T9z+8JSGTd6SApyuLRy7QnzMrl2p61tfV04Ks3B+9/x1/V5Hb
 GCwNX59yOnShlKkDZmM0QA==
X-Google-Smtp-Source: ABdhPJw7sfj49a/XqcZX4iEyYBeVBikgyBwiHnh2QxO3rAv60pfY7q66XAD3rxdzNX0bgAVsDTmVOw==
X-Received: by 2002:a5d:9a13:0:b0:668:94ba:46ab with SMTP id
 s19-20020a5d9a13000000b0066894ba46abmr20425276iol.155.1654866764099; 
 Fri, 10 Jun 2022 06:12:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a02344c000000b003318ba8386bsm7885984jaz.81.2022.06.10.06.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 06:12:43 -0700 (PDT)
Received: (nullmailer pid 1529407 invoked by uid 1000);
 Fri, 10 Jun 2022 13:12:35 -0000
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
In-Reply-To: <20220610105522.13449-2-rex-bc.chen@mediatek.com>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
 <20220610105522.13449-2-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v11 01/10] dt-bindings: mediatek,
 dp: Add Display Port binding
Date: Fri, 10 Jun 2022 07:12:35 -0600
Message-Id: <1654866755.768151.1529406.nullmailer@robh.at.kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 deller@gmx.de, Project_Global_Chrome_Upstream_Group@mediatek.com,
 wenst@chromium.org, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 msp@baylibre.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, granquet@baylibre.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 18:55:13 +0800, Bo-Chen Chen wrote:
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
> [Bo-Chen: Fix reviewers' comment]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dtb: dp_tx@1c600000: max-lanes: b'\x04' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dtb: dp_tx@1c600000: max-linkrate: b'\x1f\xa4' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

