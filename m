Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCF8506BFE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 14:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20D610E2A0;
	Tue, 19 Apr 2022 12:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACCA10E2A0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 12:12:46 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso17260622fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 05:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=0569YfmtjdqJ+2hyukw09AFuvfwmKEbwEGbKGweOpvI=;
 b=zM+rz10/Jy0DS1ljlAr744o14mg8Vzn0bGV3KbeBcGhFwScvES501tpdDfmj26CgvP
 smNWvnNWcyXozMvyRza1mT9cpK+Rb7O30q5ingzIfrXGSoOPrBhG2DdIGzqfVVAsoKxu
 2FJa0EKUKajhd+xTvhsQGEwAnVFAf7A/s4CtObn0pfxYndCxsUrYbTgx2SAozOIBl83e
 kmGcrkw7k6hg8PQt+wEbufU0eL8fJ3E2c8UtYskzsX3khpqPsQAFlHxUQW8NZW8Pn/bn
 ecgGJOT5mUWSxyellIQZ6hOEm3DJWRePizy05wML1ceSBVBEjgPNTh66oeMa1IT/BnMg
 utZg==
X-Gm-Message-State: AOAM5337B/eEa4w4FXtL2EYAqYNpc7tZXVQvq7HO0SfAXcfYpqehcBS9
 Gj65X8pmTg6MVPKBNLynYA==
X-Google-Smtp-Source: ABdhPJx8LiBK0K4XkLwgCXtqriBYjWmQ7YGCbPJHV61zXAKBySQssJNDd/Khvosb+uQCNv6rnPT75g==
X-Received: by 2002:a05:6870:9611:b0:df:200f:a6dd with SMTP id
 d17-20020a056870961100b000df200fa6ddmr6047417oaq.299.1650370366071; 
 Tue, 19 Apr 2022 05:12:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g25-20020a544f99000000b002da70c710b8sm5082428oiy.54.2022.04.19.05.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 05:12:45 -0700 (PDT)
Received: (nullmailer pid 1977866 invoked by uid 1000);
 Tue, 19 Apr 2022 12:12:43 -0000
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
In-Reply-To: <20220419033237.23405-4-rex-bc.chen@mediatek.com>
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-4-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Date: Tue, 19 Apr 2022 07:12:43 -0500
Message-Id: <1650370363.539386.1977865.nullmailer@robh.at.kernel.org>
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
 jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Apr 2022 11:32:35 +0800, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
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

