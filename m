Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE1650CA1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 14:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA4810E29F;
	Mon, 19 Dec 2022 13:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FEB10E29F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 13:26:33 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id r130so7802860oih.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 05:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IDSJGuoBUlMGgiS087wDSGGlbj9bvZ8Uqb80GAsEvJQ=;
 b=ZCnmwDdB3caHWX7NydvbzoXOCTXfjcK+Ee7dq+bt9FZh6A1yU1KYE0+lNxF8Iknuhr
 ZwmkBHR8gkLqzFYeSRGKCZPtxICSt4zejWyk8CKVBW+6hfWzMn1FYhBYVy4SePF7RmIL
 C8pwrNQQFqoPFfoegR4oAdwiW0g0Hmp0SenHcojFEZDJuv2mmB/m/HIiTsQWDEMcLZCT
 HNngmYrKN6nj64UAv9T9EH0ZnN9BoEQE8fjw9ePSuRiOIGljs1N4gi9cNtw7Ebupuxwv
 vPMWjl/wvAV2LMYlhqRmZsxTHk1RRZZJt3+QXJOibfEhtsRpjiIg/vr3xBkVdRMFzMfL
 LTMA==
X-Gm-Message-State: ANoB5plm1FmVISa1oPQQIc47jSGkpMTX3ACoAWwUT05najyE1l9ZY5ot
 RWrXpkjME6mAgPr9u+XLog==
X-Google-Smtp-Source: AA0mqf45gJMy4jKgeBK6aXjInaHFDzhi2dL+gMB6cIn2NwjrEShN/UVjRZul9vLQgzZITxk5lO7e1A==
X-Received: by 2002:a05:6808:118c:b0:355:1df0:9b84 with SMTP id
 j12-20020a056808118c00b003551df09b84mr20960099oil.2.1671456392955; 
 Mon, 19 Dec 2022 05:26:32 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c17-20020a9d6851000000b0066bb73cce68sm4344900oto.69.2022.12.19.05.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 05:26:32 -0800 (PST)
Received: (nullmailer pid 1185311 invoked by uid 1000);
 Mon, 19 Dec 2022 13:26:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <dea33013-ae1b-a8b2-5287-68a52f5ce028@gmail.com>
References: <dea33013-ae1b-a8b2-5287-68a52f5ce028@gmail.com>
Message-Id: <167145632480.1180502.8911882694570490800.robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: rockchip: convert
 rockchip-lvds.txt to YAML
Date: Mon, 19 Dec 2022 07:26:31 -0600
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 17 Dec 2022 16:23:53 +0100, Johan Jonker wrote:
> Convert rockchip-lvds.txt to YAML.
> 
> Changed:
>   Add power-domains property.
>   Requirements between PX30 and RK3288
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Changed V2:
>   Fix title
> ---
>  .../display/rockchip/rockchip-lvds.txt        |  92 ----------
>  .../display/rockchip/rockchip-lvds.yaml       | 157 ++++++++++++++++++
>  2 files changed, 157 insertions(+), 92 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Documentation/devicetree/bindings/soc/rockchip/grf.yaml: Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/dea33013-ae1b-a8b2-5287-68a52f5ce028@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

