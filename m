Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B853E485
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 14:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36D311A59F;
	Mon,  6 Jun 2022 12:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3063D11A59F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 12:53:59 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id y85so1765789iof.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 05:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=5oeNRqJHXQOxmP96SxoUW0sboEGHvZBA+hQSWA/WSEQ=;
 b=wzzVCUzuKXYOYecXibhTO7MXIfmUgnarb9SpkptsDw422pVWuHHAjs59t8dT7w3MV/
 +bEvJ/HDz68joUxoKw4U862Gdum8S5gjEWfSbFiGX5q19cXOHVx1HNxkQa8aP5e3mcpz
 px8cnW3ESgfzoAPxHqqpwq0ImJcmuKUNLQkht64ptyf1NPj6M85bavQctOVUCnOZ+kPJ
 o9SF2AdGyWHyarbxqxdv81zqeuFVO/GZoN4urCs3EryPhlp/93q8uya8v9SXGHxwo4nT
 cYAdJ+tBdT08fADinltK45EghwOM/kYJwzr+FqMyFb3AfFqS7OioZAcYl7NqV2eBjJFU
 WYvA==
X-Gm-Message-State: AOAM532OfI30aP53YxoGs7gMM8rtF7M/kXSnwss7z//iqupOcbB2PlM2
 t+1oRX62uo14Tu18/j17iQ==
X-Google-Smtp-Source: ABdhPJxl4I6L73YL+CEdCXFSlZqbhylQ9woaXl6Dvpd8oQXNa8pk/9ibMdKb7n3+JHc51K6Q4Iy7KQ==
X-Received: by 2002:a05:6638:389f:b0:331:b463:fbee with SMTP id
 b31-20020a056638389f00b00331b463fbeemr2681428jav.145.1654520038133; 
 Mon, 06 Jun 2022 05:53:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a02b782000000b003315c00e885sm5429712jam.0.2022.06.06.05.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 05:53:57 -0700 (PDT)
Received: (nullmailer pid 534475 invoked by uid 1000);
 Mon, 06 Jun 2022 12:53:53 -0000
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
In-Reply-To: <20220606051131.14182-4-rex-bc.chen@mediatek.com>
References: <20220606051131.14182-1-rex-bc.chen@mediatek.com>
 <20220606051131.14182-4-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v4 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Date: Mon, 06 Jun 2022 07:53:53 -0500
Message-Id: <1654520033.535645.534474.nullmailer@robh.at.kernel.org>
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
Cc: chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, pavel@ucw.cz, matthias.bgg@gmail.com,
 nancy.lin@mediatek.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Jun 2022 13:11:31 +0800, Bo-Chen Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dtb:0:0: /example-0/soc/hdr-engine@1c114000: failed to match any schema with compatible: ['mediatek,mt8195-disp-ethdr']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

