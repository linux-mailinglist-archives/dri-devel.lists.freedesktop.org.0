Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA00777E08
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B0910E5B5;
	Thu, 10 Aug 2023 16:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9502910E5AF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 16:21:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05FBE657A2;
 Thu, 10 Aug 2023 16:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E263C433C9;
 Thu, 10 Aug 2023 16:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691684492;
 bh=Ii6tjgIv2QtHsUnrnSDSXrQ/263StJ8TP3+a3Sh6zOQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=k5TYUAwMgeVeKNZ00Jdev0aGUm3DTIx7/cXCI8AoqpJDfrxxtprfqvQ+i0ujpEuZx
 UUmzt372gEYauYKZTaPRVAUKkSBGH5bh7Udgll2GlRZO4qogZIMI8K80MSQM9aQeAW
 wXG5Rd7ZjP1/NDMtVIy+u5mx3cCVmlxnuxEyOiWS0g1s6MJ/Mocq5XfLpYP+ycZQtt
 0ezMcMsk9CwWu1WvElni3/nICJdSrNcKoONL08s9cpA4aqdwc3LfftWCHG+hqk0YHK
 LwkIMQa8LAAwYEhH2Lv8NiAoasZ2DH4DuweKxkPkRR1bWTS/sf3G3aCexzr3/lq4A3
 36euO5d/IrKUw==
Received: (nullmailer pid 480246 invoked by uid 1000);
 Thu, 10 Aug 2023 16:21:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20230810144116.855951-1-luca.ceresoli@bootlin.com>
References: <20230810144116.855951-1-luca.ceresoli@bootlin.com>
Message-Id: <169168448817.480119.7965083602843130061.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add ShenZhen New
 Display Co.
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 10 Aug 2023 16:41:14 +0200, Luca Ceresoli wrote:
> ShenZhen New Display Co., Limited is the manufacturer of the
> NDS040480800-V3 LCD panel according the datasheet.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v2: none
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230810144116.855951-1-luca.ceresoli@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

