Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0254BA62B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5510610E488;
	Thu, 17 Feb 2022 16:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BBA10E488
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 16:40:06 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id d7so2664309ilf.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=42YgXKsYX5OZqyMF3kRdlVgh0yrlkJ5vHS9c6U9AXD8=;
 b=JD732KFuQvuLJPEg1tiGOT/nWwkOIPWHCJXIU+VO7cOVX2+zmaW5MYACyho/jyzitz
 v3Vf3lc4TTEg1XIsDT1hc1cQNm8MprB4WhgbIuC47z8s+7qvhDvRUdSuPno4Dx6Aomjr
 YPdU3kacjAlxaGx0MpXv7b2uqID6OlYAdR2YZcKTPtKFmbGWz3XD43N6HUcTXgi3S8Vu
 Xn3P+nWUV3iXsLzqQorYGuXYPR0CmH15aeYrkhfoVxuZN5G9gsjeRvSAoXTbfNtXWpjP
 2enEvNOFZMjGTgbeNDHs/PkqWwG2jARylaFpJGwjE/+ZNMpuNywOaSDiwGykz+xWLop6
 JC/Q==
X-Gm-Message-State: AOAM532bNCBh79+VBu71g9ptg5GIdxPV/YT+Za5pfpkwgMCFtuEuxoen
 JVGdWXkedG6jC7IClx8x7w==
X-Google-Smtp-Source: ABdhPJzblA3h4h2T4K+K98Bdy6EvTCXy87z0Zrx38haaMlOdtIg1+JWX6SDxGNwnl4O1+t+hZSC20A==
X-Received: by 2002:a05:6e02:2168:b0:2c1:a436:d18c with SMTP id
 s8-20020a056e02216800b002c1a436d18cmr499762ilv.49.1645116005928; 
 Thu, 17 Feb 2022 08:40:05 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id a19sm2309825iot.35.2022.02.17.08.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 08:40:05 -0800 (PST)
Received: (nullmailer pid 3365323 invoked by uid 1000);
 Thu, 17 Feb 2022 16:39:55 -0000
From: Rob Herring <robh@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20220216181712.1493400-3-15330273260@189.cn>
References: <20220216181712.1493400-1-15330273260@189.cn>
 <20220216181712.1493400-3-15330273260@189.cn>
Subject: Re: [PATCH v8 2/3] MIPS: Loongson64: dts: update the display
 controller device node
Date: Thu, 17 Feb 2022 10:39:55 -0600
Message-Id: <1645115995.354636.3365322.nullmailer@robh.at.kernel.org>
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Li Yi <liyi@loongson.cn>,
 linux-mips@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Feb 2022 02:17:11 +0800, Sui Jingfeng wrote:
> From: suijingfeng <suijingfeng@loongson.cn>
> 
> The display controller is a pci device, its PCI vendor id is 0x0014
> its PCI device id is 0x7a06.
> 
> 1) In order to let the lsdc kms driver to know which chip the DC is
>    contained in, we add different compatible for different chip.
> 
> 2) Add display controller device node for ls2k1000 SoC
> 
> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> ---
>  .../loongson/loongson,display-controller.yaml | 114 ++++++++++++++++++
>  .../display/loongson/loongson-drm.txt         |  16 +++
>  .../boot/dts/loongson/loongson64-2k1000.dtsi  |   8 ++
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +-
>  4 files changed, 140 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson-drm.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/loongson/loongson,display-controller.yaml#
Error: Documentation/devicetree/bindings/display/loongson/loongson,display-controller.example.dts:22.30-31 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/display/loongson/loongson,display-controller.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1593886

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

