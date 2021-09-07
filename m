Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D11402D1B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 18:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FB989FCC;
	Tue,  7 Sep 2021 16:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888C889FCC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 16:47:56 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 q26-20020a4adc5a000000b002918a69c8eeso2929976oov.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 09:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MHz/eO25vUr8S8mSE9bsSa7gCQmBbjrMFcMGbCUHb6o=;
 b=cEnBhW91iuzqgiYIIDvglNkotKZ3SYsXxg5rqCeUxClZKCU25h9bvemIM4Yn8ytixH
 NqVfdTaGqHl+2lK2LrxKr8e08sDUSd2Lycf1202vfz4ndaKN4lczQ6cnVMiY6/wquBS3
 ap3pPhe7OdYSaIhWnBQ46gLvlIym3HwIDZvGov2VH0rEYzJj5HAFKvJ9QE9+810k3uJv
 x/XCy18K/oNvheRzLzmINI8MOrqS5TEOlLQdS1fElRvMUV3+dfYRSxOOVqt+hNzlGqOL
 aJ9kAzm4eNTsH+41O35npmzCYQRu36/GzVtdPdJXkcgzviNgsbcUSH7/KVXEDYbkAKpi
 RLbA==
X-Gm-Message-State: AOAM532nfjOfW21QNwuDZlAF3mV5lzJPnwUBYy5ZeVJCoFDaaLdzruTe
 DALQM4rRPY9ujI+ZA500Aw==
X-Google-Smtp-Source: ABdhPJzZ4nyNi1E0Szx6UheqtQBDEqBMRmGhaKeXZHBzgMHg0LqsypWDXSEu8Z0dH05M0/talFPCXA==
X-Received: by 2002:a4a:e923:: with SMTP id a3mr641201ooe.45.1631033275700;
 Tue, 07 Sep 2021 09:47:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z18sm2234069oib.27.2021.09.07.09.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 09:47:54 -0700 (PDT)
Received: (nullmailer pid 4137367 invoked by uid 1000);
 Tue, 07 Sep 2021 16:47:53 -0000
Date: Tue, 7 Sep 2021 11:47:53 -0500
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-kernel@lists.infradead.org,
 CK Hu <ck.hu@mediatek.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jitao shi <jitao.shi@mediatek.com>, linux-phy@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 4/4] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Message-ID: <YTeXuVdyh+VMGdl7@robh.at.kernel.org>
References: <20210907083723.7725-1-granquet@baylibre.com>
 <20210907083723.7725-5-granquet@baylibre.com>
 <1631026304.913177.3958449.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631026304.913177.3958449.nullmailer@robh.at.kernel.org>
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

On Tue, Sep 07, 2021 at 09:51:44AM -0500, Rob Herring wrote:
> On Tue, 07 Sep 2021 10:37:21 +0200, Guillaume Ranquet wrote:
> > Add Mediatek HDMI and HDMI-DDC bindings for MT8195 SoC.
> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >  .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 46 +++++++++
> >  .../mediatek/mediatek,mt8195-hdmi.yaml        | 99 +++++++++++++++++++
> >  2 files changed, 145 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dts:19:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file or directory
>    19 |         #include <dt-bindings/clock/mt8195-clk.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1438: dt_binding_check] Error 2

Last I checked this is still not upstream. I'd suggest you adjust the 
example to not need this header.

Rob
