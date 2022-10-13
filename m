Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9715FDDAF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 17:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADBE10E8E3;
	Thu, 13 Oct 2022 15:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD99110E2A6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 15:55:38 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id p127so1530161oih.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 08:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gYclH+AU0uDsjdL9yX3maHxQPLG1CbVvXWtgf7N5YNw=;
 b=ZMe9QjT89RV3ZXbb+9nLOkILdX8shI8aWVqLqEEF9dlbRi2VsvgyOpHw5O60h2nv7Y
 VzRu2Lukh4yAMxRLnWOJecFdhIkBi9TTYwfzJFsXN9Nqui9JsAKM8k0eNk/C5alV/1i8
 rVBhVlYV08xnV08pTPqYUuNNzLGSdKWZP5jyCbHHeTOsNQoHUm2HwBLudmsGQGNM8rdj
 +wP6JUkqnj7REuF/JaU2xAWPILclvwLTjr9B51bnoRK/XNAKruAeOYr90NOPIUnH0M52
 IJGAnw9qyiBA97qHGej+nesmVmP0ktyTPCEzG+nFVBdKe0Lzi2ns4U/n0+ETDOnU5Hud
 9gDg==
X-Gm-Message-State: ACrzQf0u4z6OtHw+lzEJpNkVuOTdu4cMNYHZvKJEYuEtCOZjdPHH3/Nr
 1RoSvsu8RE0ZTT9fTPg1mQ==
X-Google-Smtp-Source: AMsMyM6dDBIHv8Xu07nccWXkNNxJlTQAuUDsjISsABDxijdxjs4YI+QAHzD67QDw6sWTrqJBhEavmQ==
X-Received: by 2002:a05:6808:282:b0:354:9454:af5b with SMTP id
 z2-20020a056808028200b003549454af5bmr228146oic.20.1665676537881; 
 Thu, 13 Oct 2022 08:55:37 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r6-20020a056830418600b00661b6e1eb3csm96328otu.38.2022.10.13.08.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 08:55:37 -0700 (PDT)
Received: (nullmailer pid 384630 invoked by uid 1000);
 Thu, 13 Oct 2022 15:55:38 -0000
From: Rob Herring <robh@kernel.org>
To: allen <allen.chen@ite.com.tw>
In-Reply-To: <20221013105116.180380-2-allen.chen@ite.com.tw>
References: <20221013105116.180380-1-allen.chen@ite.com.tw>
 <20221013105116.180380-2-allen.chen@ite.com.tw>
Message-Id: <166567436493.334966.17548882165028995639.robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Date: Thu, 13 Oct 2022 10:55:38 -0500
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Pin-yen Lin <treapking@chromium.org>,
 Hermes Wu <Hermes.Wu@ite.com.tw>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Oct 2022 18:51:13 +0800, allen wrote:
> From: allen chen <allen.chen@ite.com.tw>
> 
> Add properties to restrict dp output data-lanes and clock.
> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>  .../bindings/display/bridge/ite,it6505.yaml   | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/ite,it6505.example.dtb: dp-bridge@5c: port:endpoint: Unevaluated properties are not allowed ('link-frequencies' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

