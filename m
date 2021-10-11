Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B7A428E19
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 15:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCFA6E4C7;
	Mon, 11 Oct 2021 13:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275F66E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 13:36:21 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id y207so21516638oia.11
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 06:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=FwobwD3dd/WQMo67DlN9a1cS0XJZiy4pf9ac1aljPJ4=;
 b=lzPCTEIe0m+7SYoYy3UdZtqGv4knXH0twWBmruYTenFfTZJzM0kBxdb933ZuI999Vw
 SmBoQ5GPsO9STefM5PNti/esqTbYMi0r5IjLnapRqrHtWKHQtTmZ8wnD4R+lFDQgp5gW
 VaVx/S+g2UcUuPzgRxRwDzbbaSyGrHjDEyGsbLnJ4o+bESEpPmVMqFl/GpfN5M8+8VnF
 ZJUPDIDUYrWfA+3SAete0VBGI/Ra5/koSuFX4R2qKtx0+r7ITyfunSl+dIVkAt9U+syN
 B+G5x98I1H85vpx3Cc7McsZm9tOlTa64tpGcdb6NPSYxePyB5mu83TVQnTxKjZ5E/HQd
 LozQ==
X-Gm-Message-State: AOAM531AZqgLkDacgXzqo2YV9ijLD/+89i0XjKWwtSmjlhT9+B2a+ZNX
 wDOxtvGVqfM9YujF4dMb5g==
X-Google-Smtp-Source: ABdhPJzbpAfYUHviS4dvb3JlLbjzjzDQqr3WVI5FNzzIZbfL+xLeRodimbzcCB6iXPFvMV4JXGQIkg==
X-Received: by 2002:aca:d741:: with SMTP id o62mr6830038oig.62.1633959380237; 
 Mon, 11 Oct 2021 06:36:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y5sm661869otg.52.2021.10.11.06.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:36:19 -0700 (PDT)
Received: (nullmailer pid 504939 invoked by uid 1000);
 Mon, 11 Oct 2021 13:36:18 -0000
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@google.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@chromium.org>, srv_heupstream@mediatek.com,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
In-Reply-To: <20211011070247.792-14-yunfei.dong@mediatek.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-14-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v7,
 13/15] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for
 mt8192
Date: Mon, 11 Oct 2021 08:36:18 -0500
Message-Id: <1633959378.213918.504938.nullmailer@robh.at.kernel.org>
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

On Mon, 11 Oct 2021 15:02:45 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v7: Re-write dtsi for hardware architecture changed
> ---
>  .../media/mediatek,vcodec-comp-decoder.yaml   | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml:44:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml:88:7: [warning] wrong indentation: expected 2 but found 6 (indentation)
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml:193:7: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: properties:compatible: [{'enum': ['mediatek,mt8192-vcodec-dec', 'mediatek,mtk-vcodec-lat', 'mediatek,mtk-vcodec-core']}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/media/mediatek,vcodec-comp-decoder.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:29.13-20: Warning (ranges_format): /example-0/vcodec_dec@16000000:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:29.13-20: Warning (ranges_format): /example-0/vcodec_dec@16000000:ranges: empty "ranges" property but its #size-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:33.13-66: Warning (dma_ranges_format): /example-0/vcodec_dec@16000000:dma-ranges: "dma-ranges" property has invalid length (24 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 2)
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:34.24-57.15: Warning (unit_address_vs_reg): /example-0/vcodec_dec@16000000/vcodec_lat: node has a reg or ranges property, but no unit name
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:59.25-85.15: Warning (unit_address_vs_reg): /example-0/vcodec_dec@16000000/vcodec_core: node has a reg or ranges property, but no unit name
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml: example-0: vcodec_dec@16000000:reg:0: [0, 369098752, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml:0:0: /example-0/vcodec_dec@16000000: failed to match any schema with compatible: ['mediatek,mt8192-vcodec-dec']
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml:0:0: /example-0/vcodec_dec@16000000/vcodec_lat: failed to match any schema with compatible: ['mediatek,mtk-vcodec-lat']
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml:0:0: /example-0/vcodec_dec@16000000/vcodec_core: failed to match any schema with compatible: ['mediatek,mtk-vcodec-core']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1539139

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

