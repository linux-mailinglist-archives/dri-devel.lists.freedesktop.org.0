Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB45F995C28
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 02:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EC510E274;
	Wed,  9 Oct 2024 00:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DiUkj4qM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908D810E274
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 00:14:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 08E9BA43853;
 Wed,  9 Oct 2024 00:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C43FC4CED0;
 Wed,  9 Oct 2024 00:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728432845;
 bh=E4VZjjRDfN+lhZZkbKwkkKuro9DYs1y1+b1/HbjnHI8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=DiUkj4qMgM52IWkz+RMubs33FfZ4zJSQeVQMXLQ/0xbv4JFXLDfmhJ0Ojl1Qame0Q
 kIA+JAuqwOhaLuieycJGEtObjWhC9zhCkhd/74yNWyUeMh/8u3tPWPScpxYaYeTQh3
 Ek6EiWmFANvRdrYAdeE1LYhTK4tNd901hIOYY6fGP6jrvtfvF3rE5+68hwP8e0wHWh
 zFC3dYiaUmXpnNBOo0ogWJ8W7EXt5Vwvq70+NkZzbNX48/AJ0pXIEFgFs+dUNU9Ivk
 2yFOuePvCbBJAGwo6hHlLuPdv6DGSiuyaiIn8qHaHCXATu95sz5E1kpuLsIo55TsXs
 RGbwVBi0muz4w==
Date: Tue, 08 Oct 2024 19:14:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, 
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 dri-devel@lists.freedesktop.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20241008-zii_yaml-v1-3-d06ba7e26225@nxp.com>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
 <20241008-zii_yaml-v1-3-d06ba7e26225@nxp.com>
Message-Id: <172843284230.2657753.15437804090200858713.robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt
 to yaml format
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


On Tue, 08 Oct 2024 18:00:59 -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-eeprom.txt to yaml format.
> Additional changes:
> - Add ref to nvme.yaml.
> - Add reg property.
> - Remove mfd at example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/nvmem/zii,rave-sp-eeprom.txt          | 40 ----------------
>  .../bindings/nvmem/zii,rave-sp-eeprom.yaml         | 54 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 40 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241008-zii_yaml-v1-3-d06ba7e26225@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

