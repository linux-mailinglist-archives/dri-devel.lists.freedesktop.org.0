Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED3153E486
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 14:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727ED10E610;
	Mon,  6 Jun 2022 12:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BAB10E06A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 12:54:01 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id r3so11861580ilt.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 05:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=RgW4935QCsAGMmkhuRJMk7RJh1JHfN66O7hxz5zZQuI=;
 b=itqX2jpHZlgtanrZWp3Bk+ogg2XnkMKRD8baQPIY7qXlIPliFDjqEK70Yp4Z5get0+
 7SqeoEJsywnW93xBvSboTRCncZH12yUeanxFuKGiT9S8OSTyZ+t9ZocUgsCAfs2Nn4Uc
 9ayXF2wXKxAG3ZTCx7WM2RnsQe8fqzpZ9j928blaEghlTnlYlBxTtFW8YCjdzGkZzNfN
 vY1YtaUTXHQ6+hY4kyDUO8GZkGfl/FliHYjIZmmbhCfVH6GUAT6TtsnQBKqXBIADW53P
 FKN+ofHgOwS7BgBEJVbU9SMrtJoREFYMudJ4wll7QPfcNyk9+4TvXP44UmHs/lrBAGlm
 nzWw==
X-Gm-Message-State: AOAM531681MS1dtbbDbvc7vWLj6pwZGJkZgOr8IV/8Q3I3jvTbr/awxQ
 aQ9Lnfna1ZKiTTpqefydcQ==
X-Google-Smtp-Source: ABdhPJx8Ddb/0qM1ktVNbazk8LwdBo/5aLQiFZIdEU/GvqAx//WMhBNcB+l9qZAtxabGJJtIVk9sHQ==
X-Received: by 2002:a05:6e02:1d91:b0:2d3:bef3:a073 with SMTP id
 h17-20020a056e021d9100b002d3bef3a073mr14231575ila.60.1654520040280; 
 Mon, 06 Jun 2022 05:54:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a92950f000000b002d3adf71893sm6194943ilh.20.2022.06.06.05.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 05:53:59 -0700 (PDT)
Received: (nullmailer pid 534473 invoked by uid 1000);
 Mon, 06 Jun 2022 12:53:53 -0000
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
In-Reply-To: <20220606051131.14182-2-rex-bc.chen@mediatek.com>
References: <20220606051131.14182-1-rex-bc.chen@mediatek.com>
 <20220606051131.14182-2-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v4 1/3] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
Date: Mon, 06 Jun 2022 07:53:53 -0500
Message-Id: <1654520033.524963.534472.nullmailer@robh.at.kernel.org>
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
 chunkuang.hu@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 matthias.bgg@gmail.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 pavel@ucw.cz, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Jun 2022 13:11:29 +0800, Bo-Chen Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.example.dtb:0:0: /example-0/soc/rdma@1c104000: failed to match any schema with compatible: ['mediatek,mt8195-vdo1-rdma']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

