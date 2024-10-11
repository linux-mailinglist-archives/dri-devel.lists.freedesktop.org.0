Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0882999AF8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 05:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2330210EA1D;
	Fri, 11 Oct 2024 03:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eQhPoMzW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3497D10EA1D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 03:11:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2625AA44E2F;
 Fri, 11 Oct 2024 03:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6473FC4CEC5;
 Fri, 11 Oct 2024 03:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728616274;
 bh=/Is7oWoyxrLieInLOs7YT+uoBTtaioJ+iCMHS+28m4s=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=eQhPoMzWy+8mZcr6AqdoEhJQ2JG3QFOjkZqiAMY3UCc9ocKoGVvKRaZH7K95KfGgH
 cw1QMpcCienCzG42y2tNFPSEl4pFAh0okp7/8znTfHwIl8RzEF3E7TLd9Sd4QwVrFB
 ACtTdRD8ivYtHDtQU3x3XYLdb2UDGYxudrH/YGgJC2diml20/DJyGUsFLEQncFlrO0
 txiXgX5WsCu5wwwKTQLPeEiTtT0US0CC31qmTiOcbRPmbhl3ZU5TigntIxxfSPnFhw
 HcD2qQD9wf+rlGZI+akwh2skB1vf92KF6jO8xwcNigSiVywwHHFUJVw60Jjqu3Py73
 pCsPg9VnwbF/g==
Date: Thu, 10 Oct 2024 22:11:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Pavel Machek <pavel@ucw.cz>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-watchdog@vger.kernel.org
In-Reply-To: <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>
Message-Id: <172861627193.2232781.13972900744363458830.robh@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: backlight: convert
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


On Thu, 10 Oct 2024 11:42:39 -0400, Frank Li wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241010-zii_yaml-v2-2-0ab730607422@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

