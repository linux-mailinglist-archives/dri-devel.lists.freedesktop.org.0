Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 039FC5261ED
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 14:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD8D10E310;
	Fri, 13 May 2022 12:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A623E89E41
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 12:33:24 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id y63so9931920oia.7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 05:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=buZCjK/zEXixkrBZxaDQw6YBg7oqOrxcHQhY9x47DBY=;
 b=lbz7hYjeu2LHVFPL15O/gyLjxs2yMHN7e1RUFXqNbwEzVf8Juec4ggVDaeDJ1d+IXo
 9NVMiLZIxTvF9wMxfLri4AcJPtk/sj/C9CMsdGBj5FJndTA9f+kxfxAurkpq6ndA4nBf
 AFLTgB3ECjt0j0EWlTmi3K8hQXto7tBHUoIPlpNcqygYGCMg/JKJ9cHryr8IS1M5gDYW
 OTnoExDl3n64HF7ETIn4MuBbJ7iotAi4+vo38Y7iYH+kUu4X32DBOr7NhNxNmqd8dEco
 VXvKmdI1ONG1kzjCzxNCpex+nF1zXGjhkFJ+qIMUurDNnwdxnynqKa4+e5AX2Vh6A/Qh
 UsrQ==
X-Gm-Message-State: AOAM531ExGCNrGtYqMOpgZ4WpmSOYmhJK8jSAmOW38OozY+sEBngVh1C
 1A0rC5/uFTabwzNrWrfTag==
X-Google-Smtp-Source: ABdhPJw7upKKDoDgfZ+8DZ0CWGKjhxTuOLrapQu7ccyksWW8Kk1fXfQ/lZ4uAKurnleTew8Xzr+gOw==
X-Received: by 2002:a05:6808:1206:b0:2d7:65a8:65e with SMTP id
 a6-20020a056808120600b002d765a8065emr2225633oil.107.1652445202398; 
 Fri, 13 May 2022 05:33:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c24-20020a9d6858000000b00606ad72bdcbsm880686oto.38.2022.05.13.05.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 05:33:21 -0700 (PDT)
Received: (nullmailer pid 85827 invoked by uid 1000);
 Fri, 13 May 2022 12:33:21 -0000
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
In-Reply-To: <20220512080523.25082-2-rex-bc.chen@mediatek.com>
References: <20220512080523.25082-1-rex-bc.chen@mediatek.com>
 <20220512080523.25082-2-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Date: Fri, 13 May 2022 07:33:21 -0500
Message-Id: <1652445201.069924.85826.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 nancy.lin@mediatek.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 May 2022 16:05:21 +0800, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml: properties:compatible: [{'const': 'mediatek,mt8195-vdo1-rdma'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.example.dts:25:18: fatal error: dt-bindings/memory/mt8195-memory-port.h: No such file or directory
   25 |         #include <dt-bindings/memory/mt8195-memory-port.h>
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

