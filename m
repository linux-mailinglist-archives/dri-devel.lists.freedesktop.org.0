Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9855151FC96
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8FC10F076;
	Mon,  9 May 2022 12:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EC710F077
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 12:21:04 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 31-20020a9d0822000000b00605f1807664so9976164oty.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 05:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=sv2cI5/IIfv5TA9/D1vZuscnav6gHINQOSxljIH5MXs=;
 b=leiD2v/tZQ8l+4WKbAmRzzaUwhTBf8AUDvxe0zviWVwW3dLjmLRmMrNRIG5h1XHnV1
 XW1Mxpx7fUyVn+RkZT0iBk2Vo6bD6vpiLl9GiBsMMY2gyTubp4Bc+XhziiuIW59TzC+z
 imDF+I0L55cAO9SHcP7nlJY8Tf7Qe4HLA2sBboGOw7pfeLIT2yfxQ04Q73a0DAgsknrT
 o4g5E8ZmgkK8kj5/hut3Hs6RLZBMbkjnD55OdxOCxDw0nBOqAe5o/oj3tL9SLLHOkp0T
 bJCoF9hTt+10qikvlj+3NT4MoPNEH+QA3TgeZXpoZHueoef/RnrZk2n73aM1tZX23niI
 hBgg==
X-Gm-Message-State: AOAM530CIVq4BlYPvQYBW8Ro4B8zzfPIP7mSsVMBSIVjy1KZ+Gh+oVyj
 TbydeAiN+FW++ae4cgnCiQ==
X-Google-Smtp-Source: ABdhPJzmgTfUp6EHG/A94h+NBN2R5QfBMhZFGUuuka9lsHg+u9WLwv5BWtw2aG+NwSAp98BLFiz3Zg==
X-Received: by 2002:a9d:74d8:0:b0:606:42dc:5ce3 with SMTP id
 a24-20020a9d74d8000000b0060642dc5ce3mr5735048otl.303.1652098863902; 
 Mon, 09 May 2022 05:21:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 52-20020a9d0eb7000000b0060603221241sm4571643otj.17.2022.05.09.05.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 05:21:03 -0700 (PDT)
Received: (nullmailer pid 3576229 invoked by uid 1000);
 Mon, 09 May 2022 12:20:58 -0000
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
In-Reply-To: <20220509044302.27878-2-rex-bc.chen@mediatek.com>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-2-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Date: Mon, 09 May 2022 07:20:58 -0500
Message-Id: <1652098858.557372.3576228.nullmailer@robh.at.kernel.org>
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, nancy.lin@mediatek.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 09 May 2022 12:43:00 +0800, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.example.dts:27:18: fatal error: dt-bindings/memory/mt8195-memory-port.h: No such file or directory
   27 |         #include <dt-bindings/memory/mt8195-memory-port.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.example.dtb] Error 1
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

