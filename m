Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BFF515528
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 22:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B157B10F91F;
	Fri, 29 Apr 2022 20:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ECE10F91F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 20:06:33 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-e656032735so9245466fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 13:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2lI/TWi2tf2Q7JmUZ2/HVxcNVVbUFx/NU2eKJt3txIU=;
 b=KvaMhGwHPQ1WqWfMbXLgG8zVyPhBSk0JR79P3hCa9w3DY7/LnZ0norhaYuyOykI+/n
 HtqW2xzYpzCDLkkiCnXdwLjmbczD7n4BHrpEXgV6lRhDVemq2/lEsJQKc1Lhj5i3UIJO
 7T4JBJZOh+skkfZmEY58WIvuQLTKNRlTZYm+TJ67Hwz6BoWhvXZ3l/KhEoKxw8J+ldrH
 ZdwTV1Rw678lP37NQympVoc8eeZpAJXwyngAJW1Nem6TLHdmDcbhG07biqFWSzRHA6Qo
 IshUyNAnNm2ED+jbUmWEvdEAjGb302Pubjsh6OexrUmF44JHneoJlR3tVy67bJk3Ql98
 +MdA==
X-Gm-Message-State: AOAM531s3BsK9Fg+e7AkF412yfIfE7S3rWsRJVAkXDLT0znCNStTqRLC
 BlN9wi7D/BUzTrLUdT+uzg==
X-Google-Smtp-Source: ABdhPJylIgWmSsuu4I/a3zDRexm1IDuitX9f8YLbudWq18PfZJulvaKEhEYxJPJKLMbOHCK/46tOnA==
X-Received: by 2002:a05:6870:61d4:b0:df:b74:8de5 with SMTP id
 b20-20020a05687061d400b000df0b748de5mr467807oah.37.1651262792205; 
 Fri, 29 Apr 2022 13:06:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o22-20020a9d7656000000b0060603221258sm65246otl.40.2022.04.29.13.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 13:06:31 -0700 (PDT)
Received: (nullmailer pid 2776081 invoked by uid 1000);
 Fri, 29 Apr 2022 20:06:30 -0000
Date: Fri, 29 Apr 2022 15:06:30 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
Message-ID: <YmxFRuBWmPaCyw0I@robh.at.kernel.org>
References: <20220428133753.8348-1-rex-bc.chen@mediatek.com>
 <20220428133753.8348-2-rex-bc.chen@mediatek.com>
 <1651177993.334386.220464.nullmailer@robh.at.kernel.org>
 <9f601c458bd3401b216992e8dd72485a10f34597.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f601c458bd3401b216992e8dd72485a10f34597.camel@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 airlied@linux.ie, cellopoint.kai@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, xinlei.lee@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 09:55:37AM +0800, Rex-BC Chen wrote:
> On Thu, 2022-04-28 at 15:33 -0500, Rob Herring wrote:
> > On Thu, 28 Apr 2022 21:37:50 +0800, Rex-BC Chen wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> > > 
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > > ---
> > >  .../display/mediatek/mediatek,dsi.txt         |  62 ---------
> > >  .../display/mediatek/mediatek,dsi.yaml        | 122
> > > ++++++++++++++++++
> > >  2 files changed, 122 insertions(+), 62 deletions(-)
> > >  delete mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> > > l
> > > 
> > 
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> > 
> > Note that it is not yet a requirement to have 0 warnings for
> > dtbs_check.
> > This will change in the future.
> > 
> > Full log is available here: 
> > https://urldefense.com/v3/__https://patchwork.ozlabs.org/patch/__;!!CTRNKA9wMg0ARbw!wKbRsUmeUS_4mtOwj1t30buVNEilHYYhsUmEd5MvZ7P9VyDXg6cikERof47mkwETQzFL$
> >  
> > 
> > 
> > dsi@1400c000: compatible: ['mediatek,mt7623-dsi', 'mediatek,mt2701-
> > dsi'] is too long
> > 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
> > 	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb
> > 
> > dsi@14014000: #address-cells:0:0: 2 was expected
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-
> > sku2.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku6.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku7.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> > sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> > 
> > dsi@14014000: 'port' is a required property
> > 	arch/arm64/boot/dts/mediatek/mt8183-evb.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-
> > sku2.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku6.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku7.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> > sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> > 
> > dsi@14014000: #size-cells:0:0: 2 was expected
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-
> > sku2.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku6.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku7.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> > sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> > 
> > dsi@1401b000: 'port' is a required property
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
> > 
> 
> Hello Rob,
> 
> Thanks for your comments.
> The purpose of this series is not to fix dts for previous SoCs.
> Therefore, if there is a chance, we could send another series to fix
> them.

Conversions often find that the actual dts files vary a bit more than 
the binding doc said. You should look at the warnings and decide if they 
should be fixed or the schema relaxed. It's a judgement call. I have no 
idea if you did that already or not, so I send this out on conversions. 
The check runs automatically, but sending it I review briefly.

Rob
