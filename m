Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28318995C22
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 02:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1259F10E249;
	Wed,  9 Oct 2024 00:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="divIMHKw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED7710E249
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 00:14:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A1BF7A4384A;
 Wed,  9 Oct 2024 00:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE58C4CEC7;
 Wed,  9 Oct 2024 00:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728432843;
 bh=ISowwB8V/w5gps6MY3LRCF12ElijfALxRi3ED/Ocfr0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=divIMHKwDCrk7iS1Bfp1xg/nYyUHq54TSX9moiIzilL8RNe6r2dcqf43qbm8MR/gQ
 KGQKaGaVUtP8o+QQ5yxQu7+pPVrTQ8WLnvtV0bMZ58na4GgH9kaWvImxPsOiS6xJNG
 M/nGcOgTdgQhnu/IuwzL28lijd52QrYKjs9wxctXAepXi6fPdALxIbGIlsTZN6DKsY
 y084+ESg1lY1FXrKTURm2q8D9Ci6X/JTeHdWTLVLGClAcEnRU3VCgG3QPkZXahsSS1
 tti5gffBklKZMMY8/QufSWCY8jpGGmaoZj3p9Zana36AbI+O4ARh4wtm4OLmd3tKVE
 Ktb3h4Byd8sOA==
Date: Tue, 08 Oct 2024 19:14:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, Pavel Machek <pavel@ucw.cz>, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20241008-zii_yaml-v1-1-d06ba7e26225@nxp.com>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
 <20241008-zii_yaml-v1-1-d06ba7e26225@nxp.com>
Message-Id: <172843284049.2657665.7415620328802530234.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: input: convert
 zii,rave-sp-pwrbutton.txt to yaml
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


On Tue, 08 Oct 2024 18:00:57 -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-pwrbutton.txt to yaml format.
> Additional changes:
> - add ref to input.yaml.
> - remove mfd node in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/input/zii,rave-sp-pwrbutton.txt       | 22 -------------
>  .../bindings/input/zii,rave-sp-pwrbutton.yaml      | 36 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 22 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.yaml: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241008-zii_yaml-v1-1-d06ba7e26225@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

