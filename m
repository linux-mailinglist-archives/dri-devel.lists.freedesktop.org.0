Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C05CD4CD7C4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 16:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A853010FF84;
	Fri,  4 Mar 2022 15:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9914910FF86
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 15:29:03 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so9772623ooi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 07:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=J5ioJmCSVVWCtbo+u6o5MHD3cE9Z/JYc9eT4jBLaSTU=;
 b=tUPyxvr5jcXM6s2ffqxS9PRK/ZcLIcf3vVjvUbhJA5yxaYuwJvqRdnG0lLeCxQdC23
 zZed8LPBMEFz+xlX9fPw6hXlJ8+VcaVj2LgNruzycy6Ji+ilO6R5BmvXZv+XyAHORosP
 GxePce52ehvc2k4FUE6OP3KGv6uqqaKmgErKXLgOnt49ptLzUv2EFVGJQ0HQ6j9j1D0V
 3gTd/KsfhmUPGXfSqKDLec90s+Z7f7K+impqOe6e125zKKEz8BF8YxUYk+85BVpt3tML
 5fL19A2Nza/uPnmR/GWCZ6hTBeGPkqQJ4QJ3opsyf6Ohu8SnECcAsfHH5fRcIIsrOkSn
 ezzA==
X-Gm-Message-State: AOAM533omweGxSdSq7fiXIF/xM/TTZ08YMJEkbRwPKFZeoloGDQTL8O9
 9x+IQeDEro/3C/328AhhEg==
X-Google-Smtp-Source: ABdhPJxuZOHatViaL6tiAhK4OShzYUiPIoRUY4TN0tNXWjvpW9YkoKjUjPortO9oOaQCOPdVHFxMNg==
X-Received: by 2002:a05:6870:a406:b0:d9:b303:7dc2 with SMTP id
 m6-20020a056870a40600b000d9b3037dc2mr6864276oal.23.1646407742846; 
 Fri, 04 Mar 2022 07:29:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 e3-20020a056870c34300b000d9d83493bfsm590564oak.8.2022.03.04.07.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:29:02 -0800 (PST)
Received: (nullmailer pid 3970571 invoked by uid 1000);
 Fri, 04 Mar 2022 15:29:01 -0000
From: Rob Herring <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>
In-Reply-To: <20220304000311.970267-3-joel@jms.id.au>
References: <20220304000311.970267-1-joel@jms.id.au>
 <20220304000311.970267-3-joel@jms.id.au>
Subject: Re: [PATCH v2 2/2] dt-bindings: gpu: Convert aspeed-gfx bindings to
 yaml
Date: Fri, 04 Mar 2022 09:29:01 -0600
Message-Id: <1646407741.272520.3970570.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Mar 2022 10:33:11 +1030, Joel Stanley wrote:
> Convert the bindings to yaml and add the ast2600 compatible string.
> 
> The legacy mfd description was put in place before the gfx bindings
> existed, to document the compatible that is used in the pinctrl
> bindings.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
>  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
>  .../devicetree/bindings/mfd/aspeed-gfx.txt    | 17 -----
>  3 files changed, 69 insertions(+), 58 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
>  delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1600723


display@1e6e6000: 'memory-region' is a required property
	arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-opp-zaius.dt.yaml
	arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dt.yaml

