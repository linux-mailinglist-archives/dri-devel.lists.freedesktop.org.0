Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E7D51E1A1
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 00:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E7710E44D;
	Fri,  6 May 2022 22:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8476A10E44D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 22:40:04 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id m11so9009094oib.11
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 15:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=DRgwz3Pr66109k8i3q4OJZka7y/YBIE0KaI7WFdrYJ8=;
 b=IoaU/CPoBhjzjwz5SfYjFqn8hEhQASGDSWiuFKnWTBe2J9q8/4YAGAxrC+zK9On3Be
 qliocvSdVP+JGq3TFgablN/XE3T/uWPbaYQCp/i5Z4DyzsLiuCf80+bqeYgwUXD4n9bd
 ZROwexoWm+hp3rae8rprr2i4q5r3NgFwrFlAaaWXIRtxbF+KUjdRZFQaDGHSpfz59TPG
 S5qiKxkor3R8sLHfBbcfqzm6qQFtrjvELsOcWTfrDUnBioJQ16g4+F+4+zVC8Q92rPg1
 sYZuiv29ydEeFgZPv3kmaw+MN8KprkoDiXh0cLXsVWKzCJAczSIgGFJw8yjt5E8jHpDi
 nmNw==
X-Gm-Message-State: AOAM532D5wuBNt3QZDVpWvOnoXnVUB6kQ8gLfT8SLVQ1nd+/yHeM7DOy
 NH+SGWgaBCGYhCuoAJNeTA==
X-Google-Smtp-Source: ABdhPJzrdNSnC5BVoRKMuBDvgNbnC5uroyrH4/mzoFE1AvpkFImqSpr3rFfcN8WIixqCY3b+N0Od9g==
X-Received: by 2002:aca:c0c5:0:b0:325:9ed4:a240 with SMTP id
 q188-20020acac0c5000000b003259ed4a240mr2540381oif.289.1651876803706; 
 Fri, 06 May 2022 15:40:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y28-20020a056870459c00b000e686d1387bsm1990639oao.21.2022.05.06.15.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 15:40:03 -0700 (PDT)
Received: (nullmailer pid 2407425 invoked by uid 1000);
 Fri, 06 May 2022 22:39:53 -0000
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20220506140533.3566431-11-andre.przywara@arm.com>
References: <20220506140533.3566431-1-andre.przywara@arm.com>
 <20220506140533.3566431-11-andre.przywara@arm.com>
Subject: Re: [PATCH v2 10/11] dt-bindings: display: convert Arm Mali-DP to DT
 schema
Date: Fri, 06 May 2022 17:39:53 -0500
Message-Id: <1651876793.707852.2407424.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, Will Deacon <will@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 06 May 2022 15:05:32 +0100, Andre Przywara wrote:
> The Arm Mali Display Processor (DP) 5xx/6xx is a series of IP that scans
> out a framebuffer and hands the pixels over to a digital signal encoder.
> It supports multiple layers, scaling and rotation.
> 
> Convert the existing DT binding to DT schema.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/display/arm,malidp.txt           |  68 ----------
>  .../bindings/display/arm,malidp.yaml          | 116 ++++++++++++++++++
>  2 files changed, 116 insertions(+), 68 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/arm,malidp.txt
>  create mode 100644 Documentation/devicetree/bindings/display/arm,malidp.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


display@f080000: 'arm,malidp-arqos-value' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb
	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb
	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb
	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb
	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb
	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb
	arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb
	arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb

