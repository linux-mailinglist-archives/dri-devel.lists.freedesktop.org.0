Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8161D777E0A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E0810E5AF;
	Thu, 10 Aug 2023 16:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492E110E5AF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 16:21:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A685F661AD;
 Thu, 10 Aug 2023 16:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCDDC433CA;
 Thu, 10 Aug 2023 16:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691684497;
 bh=lEKql8+vNOvT3PVTTDq2YEYXsHM2wKRCKSo4hM72quc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rwcTsvzgxpHJKEXDpPjhSIwq3guyZlltoXOyBQLY3GG4KVTE5zUkVjkLsjOPyj2ei
 WQN4eOeICL4iVLRGZWhqhwMLtaNhtPnrOffjutkLhGCVtGrgXbohvzQxA0aVTJ4CZG
 vXre1mRyO0tz3Q13ip6bBy0P6vE9UjuSz3v2UDSX7jT9X6eanbunmOaBfQ+lhOIPFC
 GO2q4oHg8QzODusO+2KO39INa1nX+TfUoV+WrGp1NBYrYxFt0aSOUJt3t/QvFkgUbI
 O3ZpRqa6TgNpFrDkBDVjUMWG+WMuRo/KEQiHWnpFLzboec04TjHfwIwhY6h7j2ZFiw
 /wM+t41Xo8ggw==
Received: (nullmailer pid 480249 invoked by uid 1000);
 Thu, 10 Aug 2023 16:21:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20230810144116.855951-2-luca.ceresoli@bootlin.com>
References: <20230810144116.855951-1-luca.ceresoli@bootlin.com>
 <20230810144116.855951-2-luca.ceresoli@bootlin.com>
Message-Id: <169168448913.480168.11890907861387742608.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Add panels based
 on ILITEK ILI9806E
Date: Thu, 10 Aug 2023 10:21:30 -0600
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 10 Aug 2023 16:41:15 +0200, Luca Ceresoli wrote:
> Add bindings for LCD panels based on the ILITEK ILI9806E RGB controller
> connected over SPI and the "ShenZhen New Display Co NDS040480800-V3"
> 480x800 panel based on it.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v2:
>  - remove T: line form MAINTAINERS entry
>  - reference spi-peripheral-props.yaml
>  - add 'maxItems: 1' to reg
>  - use unevaluatedProperties
>  - remove out of scope backlight node
> ---
>  .../display/panel/ilitek,ili9806e.yaml        | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230810144116.855951-2-luca.ceresoli@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

