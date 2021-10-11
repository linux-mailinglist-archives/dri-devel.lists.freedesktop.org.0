Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD057428E1F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 15:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95056E4C9;
	Mon, 11 Oct 2021 13:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF3C6E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 13:36:26 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id e63so4055334oif.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 06:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=85xipXNv8mvBeKPmm2emtS9A+cn3fK5eUSpsvYA0F0s=;
 b=KHlRQQKHUUsYFGj1kOrFf7sg3wyDPR1/Jl45CWmEWBiU4K8U58qdq2tJl+D54liea/
 m2zbaDgbSyNePwJCGhVNZDVvs8yRzPQ4x9p0k0pX+ZbEH9jJtNAFcHkhBoEscvAoLwgG
 g0g9V5WIZvx5419nymGcewoT+wxhqxVTW1XxyaKDvP4zVSIJIIr9uURaE/GSbZA0pcIh
 HuWWr0v0Gw/d5ZCrNVGjAMlk3F43PCBPJ/wvC+6fHfcxpDQ1qa5nFPUFi7X9s3i9RtP4
 x5QuNGdgHh7QkX4NTIHsOo4TBsA92fmPsRPBulmPm17hjK4ys/r1Y2Q2JJYdhOaAOlp7
 O3zw==
X-Gm-Message-State: AOAM532z50/4uad560Fid+TwbkDjc9r6G0sBF89dP9pSW6N7y9wSUbAe
 ++2OI20/p3Hb5YAzy9GgAg==
X-Google-Smtp-Source: ABdhPJyE7+/tzL7Uvj2g+kEPhUHNPa6mHB8C7Nw2hpoRd1TRl83LypTzSOtSMZPZ0Czq8QnqNVUDBg==
X-Received: by 2002:a05:6808:1984:: with SMTP id
 bj4mr4202420oib.30.1633959386217; 
 Mon, 11 Oct 2021 06:36:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v22sm1171004oot.43.2021.10.11.06.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:36:25 -0700 (PDT)
Received: (nullmailer pid 504946 invoked by uid 1000);
 Mon, 11 Oct 2021 13:36:18 -0000
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
In-Reply-To: <20211011094624.3416029-3-msp@baylibre.com>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-3-msp@baylibre.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Date: Mon, 11 Oct 2021 08:36:18 -0500
Message-Id: <1633959378.253312.504945.nullmailer@robh.at.kernel.org>
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

On Mon, 11 Oct 2021 11:46:19 +0200, Markus Schneider-Pargmann wrote:
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dts:20:18: fatal error: dt-bindings/power/mt8195-power.h: No such file or directory
   20 |         #include <dt-bindings/power/mt8195-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1539195

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

