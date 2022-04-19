Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F8F506C00
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 14:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EF610E7D5;
	Tue, 19 Apr 2022 12:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329AB10E7D5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 12:12:48 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 w27-20020a056830061b00b00604cde931a0so6603320oti.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 05:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=lbM+6TXr7OH0hoMGKTtqkVWI32EFUbBVKJzBhHmX6V4=;
 b=LNAoJ++ZDOqW3sYCvD239nNsCaLujuMlX+iTuL0ZtkCgsKo8f8hrVclEo8Sfukim+O
 BOprLKqaCk5wbMLAvbI8OD57DP27jsZYS4kbAT3J1foMU+crEK0BMANzUQe5Ovfim5vc
 BMeOEt/C3s847s65AdmlShn0v0NvQ+eMHR0dWlTQRnAlLGvlBiOmx/Zgzvca6ksm+i+6
 55UcmPu16rE5OutsXBngGl5XCldCpe3TCAqJtHjTljib0erhejKVjpa71CabN1NK5X+m
 ySWq+HtxcWVL7cbQ7shricKCDCUA38UwC72YWpOUvuuOUSzzKInxGQE/MqOETXsm7cJe
 /N6A==
X-Gm-Message-State: AOAM5309JUGZgYQB4VGiZ/aMEg72KHwEpFDEqJuShKZnTOghlVwxrZkL
 hFPibvdD14f+xmm1UISfXg==
X-Google-Smtp-Source: ABdhPJyjKDFF8xz6BuFfOGVDFYuw4bwRD11RnRt3Q2XGouMWxrrzMKZfe3UV4QNteW5WL5S5+lphdg==
X-Received: by 2002:a9d:765a:0:b0:605:4910:afb8 with SMTP id
 o26-20020a9d765a000000b006054910afb8mr4193620otl.1.1650370367445; 
 Tue, 19 Apr 2022 05:12:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o17-20020a9d5c11000000b005b2611a13edsm5239752otk.61.2022.04.19.05.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 05:12:47 -0700 (PDT)
Received: (nullmailer pid 1977868 invoked by uid 1000);
 Tue, 19 Apr 2022 12:12:43 -0000
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
In-Reply-To: <20220419033237.23405-6-rex-bc.chen@mediatek.com>
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-6-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH 5/5] dt-bindings: mediatek: add ethdr definition for mt8195
Date: Tue, 19 Apr 2022 07:12:43 -0500
Message-Id: <1650370363.563060.1977867.nullmailer@robh.at.kernel.org>
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

On Tue, 19 Apr 2022 11:32:37 +0800, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,ethdr.yaml      | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
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

