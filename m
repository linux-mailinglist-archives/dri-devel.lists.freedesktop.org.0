Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C851FC95
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56F510EF59;
	Mon,  9 May 2022 12:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C07610EF59
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 12:21:02 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 s12-20020a0568301e0c00b00605f30530c2so9966653otr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 05:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=CL6w1tqa1qD4GwVR1BmE4sf7WG++85dECQ4XHoV82pM=;
 b=jr1e974J2B3jMdHh15G7saoTj0tT2Dimp1hwcFhqa8FuNLcQJjB1jxnYOJhQmVMwsF
 yzOLaeE8uOtC4a91Js+akwsvy4F6706Mvu6AbZ+2c7PhfwHJEu9jAHPQIcRKZpuWdJF6
 39vmqRnk33tz1jj72LRewhUVSDhD90KMgSsyDbnApepTSQbQG0LrvvCtYu9qPIGD0eb7
 bqeYmKB8KVvzDaJXQKA0s+xff/3ibvuB9ieSpdDPIHBQGHZfpKdY7d0tKvedLPayb7Uc
 kBie/FFNA74vJgVQZEJwDNv1N8o0zseYuM5vPQtMXoo5hgBSxKalpm+02N49IBtzHhE9
 nUgw==
X-Gm-Message-State: AOAM532/YiXDQYwNG9mGhzc3868X3oPQe1aWqm6aRIVO0TsNS9Y1NuOj
 Uo8iyFKLfYjAYAWGOcdtTw==
X-Google-Smtp-Source: ABdhPJyYPUCuWnXkqMUn8CSgjlvGDITLJOGE1wCgwYZLeOPJP8mkqU5EfVup2MiR05RSXjZrKUscsQ==
X-Received: by 2002:a9d:f22:0:b0:5c9:5da1:3752 with SMTP id
 31-20020a9d0f22000000b005c95da13752mr3718194ott.354.1652098861730; 
 Mon, 09 May 2022 05:21:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 52-20020a9d0eb7000000b0060603221241sm4571606otj.17.2022.05.09.05.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 05:21:01 -0700 (PDT)
Received: (nullmailer pid 3576231 invoked by uid 1000);
 Mon, 09 May 2022 12:20:58 -0000
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
In-Reply-To: <20220509044302.27878-4-rex-bc.chen@mediatek.com>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-4-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Date: Mon, 09 May 2022 07:20:58 -0500
Message-Id: <1652098858.568339.3576230.nullmailer@robh.at.kernel.org>
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
 jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 09 May 2022 12:43:02 +0800, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,ethdr.yaml      | 191 ++++++++++++++++++
>  1 file changed, 191 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dts:26:18: fatal error: dt-bindings/memory/mt8195-memory-port.h: No such file or directory
   26 |         #include <dt-bindings/memory/mt8195-memory-port.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dtb] Error 1
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

