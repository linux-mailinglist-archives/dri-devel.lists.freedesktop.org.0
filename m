Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB4E3FED69
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 14:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108396E50D;
	Thu,  2 Sep 2021 12:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45AF6E50D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 12:04:01 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id r26so2205819oij.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 05:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=DqbDBOn9LbPv6mE+TZV/se5KZ66whWGBwMTUDdN1R0w=;
 b=T8j71xcjaPRAujfSnk8D5QvlUtRoiYDsg5Au+wln5cGpKMcDNPcsux4EhFmmUWNcTe
 08msPvAbPx+uQPHLPzOQBpvOOiupQka5M4xQSdnpOBX9cEzj06JBrsHtmB0tJYKU/F7q
 MO1mzDgQFlENcOoQygUAN1VMIPdnIKadNty2TLPZ7eK1+FeGgjXxwy/vtTJP4cOGN0BG
 7IDf1P7SRlo2+kEHQ6xrZBSbUt/RSY+lXq6q9N+62lwx03Ggzd/xxB6pHZFjA7li8EMo
 UscSuMkFnj55kkSPz36Yuve4VMnEXLesi7j0JGtkVFuhMPKE6OGn2e7RkJxWxhS8H77F
 IaMw==
X-Gm-Message-State: AOAM5332nPr/mhKqY6eBLpMnI9e7FYOuzoG73nbumrmc54b5iDnZDji5
 4v9mAiUKKWSUK+IefyAIFw==
X-Google-Smtp-Source: ABdhPJy5zHgT3CYbVHjqBlaKAIqyikhF9TQAXsaSbQ2sq9Ke9YuXUA+5Iro8Kv4/IbpBmwXXV+8GSg==
X-Received: by 2002:a05:6808:d53:: with SMTP id
 w19mr1890899oik.135.1630584240956; 
 Thu, 02 Sep 2021 05:04:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c10sm305218ots.48.2021.09.02.05.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 05:04:00 -0700 (PDT)
Received: (nullmailer pid 685596 invoked by uid 1000);
 Thu, 02 Sep 2021 12:03:59 -0000
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Tzung-Bi Shih <tzungbi@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Alexandre Courbot <acourbot@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomasz Figa <tfiga@google.com>, dri-devel <dri-devel@lists.freedesktop.org>
In-Reply-To: <20210901083215.25984-14-yunfei.dong@mediatek.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <20210901083215.25984-14-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v6,
 13/15] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for
 mt8192
Date: Thu, 02 Sep 2021 07:03:59 -0500
Message-Id: <1630584239.076177.685595.nullmailer@robh.at.kernel.org>
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

On Wed, 01 Sep 2021 16:32:13 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v6: add decoder block diagram for Laurent's comments.
> 
> This patch depends on "Mediatek MT8192 clock support"[1].
> 
> The definition of decoder clocks are in mt8192-clk.h, and this patch already in clk tree[1].
> 
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189
> ---
>  .../media/mediatek,vcodec-comp-decoder.yaml   | 192 ++++++++++++++++++
>  1 file changed, 192 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: properties:compatible: [{'enum': ['mediatek,mt8192-vcodec-dec', 'mediatek,mtk-vcodec-lat', 'mediatek,mtk-vcodec-core']}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/media/mediatek,vcodec-comp-decoder.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:22:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   22 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1522931

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

