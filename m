Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF05D5261EE
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 14:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0921C10E19E;
	Fri, 13 May 2022 12:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01C910FB85
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 12:33:28 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-ed9ac77cbbso10350801fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 05:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Y6SXqHq4jVINYnWAPbjFMrHoSh+02pvk+f0QJ78bs+8=;
 b=iYCx3Yke+ImOab+TImmQ5ijv+n9lXsm48LywEfRoks8Zqf9n3PgLMwvkEC683msLL7
 PmUSOTQu1vhcEtLEuoqlu/obCk35uSt+A2PX4vf5Ra2ieEZJpG1QLiZCxzZh6Pp9qiWW
 5s6QUuhXFpuBCVmhmdVf/4DJb9WuGvuVbsQtNJIP3pZKBid9tfYGWT6o1i/Us6BMnDHz
 r5Q5UsKpBNrWUSh8q2pOL+lY+1kHcKw162pnt7fktV5VwveUByLvOcpCSyT1mM4TQp+0
 OuNjc4lBmgO9udsYcM5Ej9z6rmsz/Xp/Kzm5R9AZp3VEID/AIiY35WSFMoHWqL39r4Fp
 sTtQ==
X-Gm-Message-State: AOAM5329zOJvOJQvXebc/VJThmrK/+CqiSvKiJTQKxkKsWbxTbDbvpZ0
 gDpEmYXSv38bJPI6qxyDVw==
X-Google-Smtp-Source: ABdhPJyPZn3Xgpi1f5vxZ52Fd5aXo/LxlG8R5JGXBiXK/g/Fud6q3u5VC0bItDo8dFuPlwtasN2xFg==
X-Received: by 2002:a05:6870:a1a0:b0:dd:e471:8baf with SMTP id
 a32-20020a056870a1a000b000dde4718bafmr8054392oaf.40.1652445206767; 
 Fri, 13 May 2022 05:33:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v3-20020a05683011c300b0060603221278sm866823otq.72.2022.05.13.05.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 05:33:26 -0700 (PDT)
Received: (nullmailer pid 85833 invoked by uid 1000);
 Fri, 13 May 2022 12:33:21 -0000
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
In-Reply-To: <20220512080523.25082-4-rex-bc.chen@mediatek.com>
References: <20220512080523.25082-1-rex-bc.chen@mediatek.com>
 <20220512080523.25082-4-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Date: Fri, 13 May 2022 07:33:21 -0500
Message-Id: <1652445201.080121.85831.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, chunkuang.hu@kernel.org, airlied@linux.ie,
 jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 May 2022 16:05:23 +0800, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,ethdr.yaml      | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml: properties:compatible: [{'const': 'mediatek,mt8195-disp-ethdr'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dts:24:18: fatal error: dt-bindings/memory/mt8195-memory-port.h: No such file or directory
   24 |         #include <dt-bindings/memory/mt8195-memory-port.h>
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

