Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BFD5399A6
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 00:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4CC10E711;
	Tue, 31 May 2022 22:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD82B10E720
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 22:46:56 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id v9so362576oie.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 15:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=2Z7nZCZCrp6yDZohpwqv7FuEhmrYv7mpBJYl13nUGZE=;
 b=XTqL3wzeGDLA+o8UeGS74RkJzWKBFREECRL5IbFqME04/8MA9IAbHRKwbGQE/4J9a+
 Slqsg5uLQ6EFF231PtJ+X1ynMyxYX0aI2cZwuYVEDqxQRJv98LNVbjntj+VLeufh7cn9
 qrlFSETds42HbCWEP1MQggynE6p/BWG8kf4Ckp3v1hgGIJmeiTM5lPc8WvK4357Dbk8o
 tjil2t+zzMcTQSx0VRzdPjcnHIVgsHL61aIj6kFb5fdVBaS1LSeA/naAqyiOffIX8WXD
 K9E7smLL734v2xvFdDxbZfh+MFftvS+8dk37VjIjAGtQ28NUiAzdSNuj8L9UgJvL6JKz
 nIkw==
X-Gm-Message-State: AOAM53082+c0DTxSraqr7FckS33jfFecrU9ilcNtJSq/QGDnhs9eZOYk
 km7GbCebsuQx6H2SKEOVzw==
X-Google-Smtp-Source: ABdhPJyCt/w64P3Qhbl9BTehgfuVFmuXiRTTi5iJf9VTUqZA4lc6Tq78gjAB18eUT2wVhb7SnkTfDA==
X-Received: by 2002:a05:6808:1454:b0:328:82a9:cb08 with SMTP id
 x20-20020a056808145400b0032882a9cb08mr13482779oiv.106.1654037216107; 
 Tue, 31 May 2022 15:46:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m19-20020a056820051300b0035eb4e5a6b0sm128663ooj.6.2022.05.31.15.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 15:46:55 -0700 (PDT)
Received: (nullmailer pid 2476551 invoked by uid 1000);
 Tue, 31 May 2022 22:46:54 -0000
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
In-Reply-To: <20220531111900.19422-4-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-4-peterwu.pub@gmail.com>
Subject: Re: [RESEND 03/14] dt-bindings: leds: mt6370: Add Mediatek mt6370
 indicator
Date: Tue, 31 May 2022 17:46:54 -0500
Message-Id: <1654037214.458913.2476550.nullmailer@robh.at.kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com, lgirdwood@gmail.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org, sre@kernel.org,
 cy_huang@richtek.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, chiaen_wu@richtek.com,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 jingoohan1@gmail.com, deller@gmx.de, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 May 2022 19:18:49 +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek mt6370 indicator documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../leds/mediatek,mt6370-indicator.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml: Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

