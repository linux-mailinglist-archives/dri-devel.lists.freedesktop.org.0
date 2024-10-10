Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05405998EC4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 19:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C6E10E9A4;
	Thu, 10 Oct 2024 17:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="onqp1m+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F4B10E9A2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 17:50:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 258505C5A51;
 Thu, 10 Oct 2024 17:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9055C4CECC;
 Thu, 10 Oct 2024 17:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728582632;
 bh=e2ct8EgYpnqZZr08HUKWQNGYtu2nQSXbY5wl+rtsE68=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=onqp1m+Chu2s1rdECvnyt9l7leioNL/SHAyciVnS7UgPGlOzCzm4LRSr/KGp2CA80
 UbMdYz/LBwjiptaVhPMSO6PiRtMqVxlRPIy321HsN4bjyNCIRMGfvi6G911FTVjSgq
 NIonrIRb31X4hFA3XAQjUSqTQtyy1qnYhRRBqISpqx8VA3RMETZHtjO0oQJzVlE6AJ
 BJhckatk2ze9cOZw9ZBOMf+DGPiJyi2Ir7h/UoW8GTYRcCmUsIdPVqKl6B0wFJgFP4
 a8YoHthkLecJLEm8ZPchjoD/gHEjGeZpcMXZp+LO62MblsHBOyhjqAd/DWw7q6lqX1
 hf3LrRI3OkIIA==
Date: Thu, 10 Oct 2024 12:50:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor+dt@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 linux-watchdog@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, 
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20241010-zii_yaml-v2-4-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-4-0ab730607422@nxp.com>
Message-Id: <172858262752.2080943.12465101127692480556.robh@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: watchdog: convert
 zii,rave-sp-wdt.txt to yaml format
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


On Thu, 10 Oct 2024 11:42:41 -0400, Frank Li wrote:
> Convert device binding doc zii,rave-sp-wdt.txt to yaml format.
> Additional changes:
> - Ref to watchdog.yaml.
> - Remove mfd node in example.
> - Remove eeprom part in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/watchdog/zii,rave-sp-wdt.txt          | 39 ------------------
>  .../bindings/watchdog/zii,rave-sp-wdt.yaml         | 47 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 39 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.yaml: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241010-zii_yaml-v2-4-0ab730607422@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

