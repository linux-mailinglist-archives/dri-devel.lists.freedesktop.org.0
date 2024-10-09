Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA6A995C25
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 02:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057EA10E618;
	Wed,  9 Oct 2024 00:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dPU4g917";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BE810E249
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 00:14:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7297EA4379D;
 Wed,  9 Oct 2024 00:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3ADC4CECC;
 Wed,  9 Oct 2024 00:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728432844;
 bh=jYBcePMOOYkg5tEtoXYzFxitT+4jY9HsX2bHokdM62E=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dPU4g917C8K1h2uicf2COFv02iBL7fa/ggyQgvefoJFRGCDaxIg8+HeDXc3U+Of6d
 WQF84R3lK7shGBkxKYjWN/E6rZ/6cyr5wJdGVeUcW09KdYZrEOBQhITOfgW+I6tyxf
 SBvx8dRJ774/WHEk6AxUBms2Ln1uq6wAVhiL1fO+pM4+o9clKV4xNrxW+r70/bnjIz
 vKOkmk2izqCNK7/vYYj45K/X9TNOaGRwauAMCGry8KTHQkTSAYFrfVwBFpgK8zCTg6
 b0bjmrI4c3fXvJxQGvU3GB8nnbsEMNE5o5dWjurSTkvyXvWUiHuU1VwH6s9tNS2rJv
 gWstub7c0C4Ew==
Date: Tue, 08 Oct 2024 19:14:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, linux-leds@vger.kernel.org
In-Reply-To: <20241008-zii_yaml-v1-2-d06ba7e26225@nxp.com>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
 <20241008-zii_yaml-v1-2-d06ba7e26225@nxp.com>
Message-Id: <172843284141.2657712.2409161838083716200.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml
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


On Tue, 08 Oct 2024 18:00:58 -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-backlight.txt to yaml format.
> Additional Changes:
> - Remove mfd parent node at example.
> - Ref to backlight's common.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../leds/backlight/zii,rave-sp-backlight.txt       | 23 --------------
>  .../leds/backlight/zii,rave-sp-backlight.yaml      | 36 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 23 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241008-zii_yaml-v1-2-d06ba7e26225@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

