Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6709051E1A0
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 00:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D0F10E2A2;
	Fri,  6 May 2022 22:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C3D10E255
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 22:40:00 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 s18-20020a056830149200b006063fef3e17so5847430otq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 15:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=JRAgCq5GM8wuUh6niNskRess02I0uopRoA0TA1SpzX4=;
 b=xntPqHxs3L/nZ/61V1+YOOUlZk2W6sMqOBQAfEMw4RAp8VYqSdjtKUPKHAqSr49/aD
 BQwrCvlNdvhcbeeqBf1oR65rRqjsJHoggHrVrxScTu9yjOZ1viyk4aJrmMAozqTiJS65
 FPXMq+y4QI2j5JplAFoU7lJJVeOMftPN5YmF2W2L0O2Lse0+QljeZNvb24rE2wHRoou4
 wj7euU4AnFhkZxUD1P79SM7eMz+fzf384LL7VyByCYJJyRQER9tt8dWW09R2cRAkOfhO
 hFfqRht6wIEcvFv7o4OVqf9gDno2SYBV22iYF/RJI0BBcvJkSTEQQ7pAAlph8Ojb1V3q
 L30A==
X-Gm-Message-State: AOAM531ik8DJLDXFNj02qJGpATg0cAF5025SBw7B3+rRqTKUeCHlI0CS
 xIGXbdB6ny6oI/uzR8uABQ==
X-Google-Smtp-Source: ABdhPJy7nAcwUD36fRri/MP+FHxvQKAxa9ZVmusmeYu/DvmwfbdWNsmVhfw89TJhO1jaQablvim+pw==
X-Received: by 2002:a9d:5184:0:b0:605:ea2e:72cb with SMTP id
 y4-20020a9d5184000000b00605ea2e72cbmr1861525otg.234.1651876799632; 
 Fri, 06 May 2022 15:39:59 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 44-20020a9d082f000000b0060603221272sm2089165oty.66.2022.05.06.15.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 15:39:59 -0700 (PDT)
Received: (nullmailer pid 2407421 invoked by uid 1000);
 Fri, 06 May 2022 22:39:53 -0000
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20220506140533.3566431-9-andre.przywara@arm.com>
References: <20220506140533.3566431-1-andre.przywara@arm.com>
 <20220506140533.3566431-9-andre.przywara@arm.com>
Subject: Re: [PATCH v2 08/11] dt-bindings: display: convert PL110/PL111 to DT
 schema
Date: Fri, 06 May 2022 17:39:53 -0500
Message-Id: <1651876793.685307.2407420.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Will Deacon <will@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 06 May 2022 15:05:30 +0100, Andre Przywara wrote:
> The Arm PL110 and PL111 are IP blocks that provide a display engine with
> an LCD interface, being able to drive a variety of LC panels.
> 
> Convert the binding over to DT schema, to the DTs can be automatically
> checked.
> This still contains the deprecated "arm,pl11x,tft-r0g0b0-pads" property,
> because this is used by several DTs in the tree.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/display/arm,pl11x.txt | 110 -----------
>  .../bindings/display/arm,pl11x.yaml           | 174 ++++++++++++++++++
>  2 files changed, 174 insertions(+), 110 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/arm,pl11x.txt
>  create mode 100644 Documentation/devicetree/bindings/display/arm,pl11x.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


clcd@10020000: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/arm-realview-eb-11mp-bbrevd-ctrevb.dtb
	arch/arm/boot/dts/arm-realview-eb-11mp-bbrevd.dtb
	arch/arm/boot/dts/arm-realview-eb-11mp-ctrevb.dtb
	arch/arm/boot/dts/arm-realview-eb-11mp.dtb
	arch/arm/boot/dts/arm-realview-eb-a9mp-bbrevd.dtb
	arch/arm/boot/dts/arm-realview-eb-a9mp.dtb

clcd@31040000: 'interrupt-names' is a required property
	arch/arm/boot/dts/lpc3250-phy3250.dtb

clcd@60000000: 'clock-names' is a required property
	arch/arm/boot/dts/spear300-evb.dtb

clcd@60000000: 'clocks' is a required property
	arch/arm/boot/dts/spear300-evb.dtb

clcd@60000000: 'interrupt-names' is a required property
	arch/arm/boot/dts/spear300-evb.dtb

clcd@60000000: 'port' is a required property
	arch/arm/boot/dts/spear300-evb.dtb

clcd@90000000: 'clock-names' is a required property
	arch/arm/boot/dts/spear320-hmi.dtb

clcd@90000000: 'clocks' is a required property
	arch/arm/boot/dts/spear320-hmi.dtb

clcd@90000000: 'interrupt-names' is a required property
	arch/arm/boot/dts/spear320-hmi.dtb

clcd@90000000: 'port' is a required property
	arch/arm/boot/dts/spear320-hmi.dtb

clcd@c0000000: 'interrupt-names' is a required property
	arch/arm/boot/dts/integratorcp.dtb

clcd@c0000000: 'port@0' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/integratorcp.dtb

clcd@c0000000: 'port' is a required property
	arch/arm/boot/dts/integratorcp.dtb

clcd@fc200000: 'clock-names' is a required property
	arch/arm/boot/dts/spear600-evb.dtb

clcd@fc200000: 'clocks' is a required property
	arch/arm/boot/dts/spear600-evb.dtb

clcd@fc200000: 'interrupt-names' is a required property
	arch/arm/boot/dts/spear600-evb.dtb

clcd@fc200000: 'port' is a required property
	arch/arm/boot/dts/spear600-evb.dtb

display@1000000: 'interrupt-names' is a required property
	arch/arm/boot/dts/integratorap-im-pd1.dtb

display@1000000: 'port@0' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/integratorap-im-pd1.dtb

display@1000000: 'port' is a required property
	arch/arm/boot/dts/integratorap-im-pd1.dtb

display@10120000: 'interrupt-names' is a required property
	arch/arm/boot/dts/versatile-ab.dtb
	arch/arm/boot/dts/versatile-ab-ib2.dtb
	arch/arm/boot/dts/versatile-pb.dtb

display@10120000: 'port@0' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/versatile-ab.dtb
	arch/arm/boot/dts/versatile-ab-ib2.dtb
	arch/arm/boot/dts/versatile-pb.dtb

display@10120000: 'port' is a required property
	arch/arm/boot/dts/versatile-ab.dtb
	arch/arm/boot/dts/versatile-ab-ib2.dtb
	arch/arm/boot/dts/versatile-pb.dtb

lcd@C0000000: 'interrupt-names' is a required property
	arch/arm/boot/dts/nspire-clp.dtb
	arch/arm/boot/dts/nspire-cx.dtb
	arch/arm/boot/dts/nspire-tp.dtb

lcd-controller@40008000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/lpc4337-ciaa.dtb
	arch/arm/boot/dts/lpc4350-hitex-eval.dtb
	arch/arm/boot/dts/lpc4357-ea4357-devkit.dtb
	arch/arm/boot/dts/lpc4357-myd-lpc4357.dtb

