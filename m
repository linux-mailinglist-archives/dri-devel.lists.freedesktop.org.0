Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45066425281
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 14:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5C36F44B;
	Thu,  7 Oct 2021 12:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F318E6F44B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 12:05:41 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id o4so8646697oia.10
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 05:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=hzJFD9sphiC3TMOrWvmRyZB23LNjrFexhFogsT1/1mA=;
 b=sC9346lOJkXbL982jN5YQYoHHK7ykFixVRdOJRzw6YYzI8Qs8kznjkCbfYpUy/v1Vp
 2Qmqs0o9OcdD+5MYqrrbn013DjGWAM8Cn4Y+zcOIU/sZ+WM8IsJnUmHk0Db4TwuJpF07
 onWZy/ffUhxOprjFRAGRXvcbpmIBs6xTWx84PnMYNo+Xfazh6Ypfl9Y/+l1Wgc+qzh3j
 A6j3FkDFnbHkE+5rrKQ3LYD4yUv99bWunCKQY5DrV6bEbkIYLbWii9yDFXjUCS+10vmV
 6wwZSIVTBX/gOngUv9s+SJB4hZKzk6Zkg1r58NTMLNlojU3iUfOTJ8PXyph/egS1+OpS
 ZQpg==
X-Gm-Message-State: AOAM532+M4+NYSLaf7Ydzxe0RqqVl1KdJPrIj5x2CtyfSpBNydeslhfp
 g/n0FX0n7Uci8hTitvUpUw==
X-Google-Smtp-Source: ABdhPJw9o2pj552FafT4KjVB3daTmAbpQfS0yh5dFgZ+ghTcm2MIJEWHU2B3zKI3V9c5FFIhO/OyrQ==
X-Received: by 2002:aca:6283:: with SMTP id
 w125mr11720753oib.133.1633608340920; 
 Thu, 07 Oct 2021 05:05:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l13sm3786690otp.32.2021.10.07.05.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 05:05:40 -0700 (PDT)
Received: (nullmailer pid 121525 invoked by uid 1000);
 Thu, 07 Oct 2021 12:05:36 -0000
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 m.purski@samsung.com, devicetree@vger.kernel.org
In-Reply-To: <20211006152158.601856-1-angelogioacchino.delregno@collabora.com>
References: <20211006152158.601856-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] dt-bindings: display/bridge: sil,
 sii9234: Convert to YAML binding
Date: Thu, 07 Oct 2021 07:05:36 -0500
Message-Id: <1633608336.205912.121524.nullmailer@robh.at.kernel.org>
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

On Wed, 06 Oct 2021 17:21:58 +0200, AngeloGioacchino Del Regno wrote:
> Convert the Silicon Image SiI9234 HDMI/MHL bridge documentation to YAML.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/display/bridge/sii9234.txt       |  49 --------
>  .../bindings/display/bridge/sil,sii9234.yaml  | 110 ++++++++++++++++++
>  2 files changed, 110 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/sii9234.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii9234.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1537190


hdmi-bridge@39: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/exynos4412-i9300.dt.yaml
	arch/arm/boot/dts/exynos4412-i9305.dt.yaml
	arch/arm/boot/dts/exynos4412-n710x.dt.yaml
	arch/arm/boot/dts/exynos4412-trats2.dt.yaml

hdmi-bridge@39: 'ports' is a required property
	arch/arm/boot/dts/exynos4412-i9300.dt.yaml
	arch/arm/boot/dts/exynos4412-i9305.dt.yaml
	arch/arm/boot/dts/exynos4412-n710x.dt.yaml
	arch/arm/boot/dts/exynos4412-trats2.dt.yaml

