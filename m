Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C21402B15
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 16:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671CF898EE;
	Tue,  7 Sep 2021 14:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE3E898EE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 14:51:47 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so13050811otk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 07:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=QW31+DP9HY/r4V30E1vm8cM8DbDpfwbSGw1klAkv3Nw=;
 b=rvk9XeyQHUqGTKLzSvruTlqp2uFmjGYbqgovuvoJRWk6qNtLBJfkgClfYnA9AK0PB2
 G/tHtwt5mbveLJZCCVES/6swPbX042yZfuwZkGf/7FRgrIqr8cSUwyhkVoAF4rPEKbu0
 aAhiJZ/7nqZtucw9gnU7qxnmJl3OAZDl4sHuK+qRmscwCDivCQGMhAvQWYnCiS14Z07X
 FbbEr5/4avd8awnN9pNejdibQ+mwPgBatnCzXg2BwC0/EFQn8084lNOiR1pgE+IQbUci
 5bwMADEfxDYD6aGwiN+my4kssXlsOQweu9+Pk36JTzXqRx54Lj/Bq9J1f3Et7yBeBf0y
 6uEA==
X-Gm-Message-State: AOAM533yEWSwa5Ot7xqU2Gxckxlfe9bbOziOn6igM6+X1s5NO/+Y8ZVa
 7d9ks0H2kIeSMqn3afHVrw==
X-Google-Smtp-Source: ABdhPJxcJL15uqG84K1L/XuTKDz+hov96kbNg/syHqy4gPJoZiaGsdG4k+EvI1uo1F7llZ566VmPuw==
X-Received: by 2002:a05:6830:441f:: with SMTP id
 q31mr15527535otv.204.1631026306857; 
 Tue, 07 Sep 2021 07:51:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f25sm2457741otp.2.2021.09.07.07.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 07:51:46 -0700 (PDT)
Received: (nullmailer pid 3958447 invoked by uid 1000);
 Tue, 07 Sep 2021 14:51:44 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 linux-phy@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210907083723.7725-4-granquet@baylibre.com>
References: <20210907083723.7725-1-granquet@baylibre.com>
 <20210907083723.7725-4-granquet@baylibre.com>
Subject: Re: [PATCH 3/4] dt-bindings: phy: Add binding for Mediatek MT8195
 HDMI PHY
Date: Tue, 07 Sep 2021 09:51:44 -0500
Message-Id: <1631026304.898566.3958446.nullmailer@robh.at.kernel.org>
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

On Tue, 07 Sep 2021 10:37:20 +0200, Guillaume Ranquet wrote:
> Add bindings to describe Mediatek MT8195 HDMI PHY
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../phy/mediatek,mtk8195-hdmi-phy.yaml        | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml: properties:compatible: [{'const': 'mediatek,mt8195-hdmi-phy'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
./Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/phy/mediatek,mtk8195-hdmi-phy.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.example.dts:19:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8195-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1438: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1525169

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

