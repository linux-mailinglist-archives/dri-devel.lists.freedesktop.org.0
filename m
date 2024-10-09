Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE2C995C2A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 02:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E30510E619;
	Wed,  9 Oct 2024 00:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="puEFSkBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E8810E274
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 00:14:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1F374A4386D;
 Wed,  9 Oct 2024 00:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBB3C4AF11;
 Wed,  9 Oct 2024 00:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728432846;
 bh=0qjVzVNij6Q7rJVM+vtOkErT499UlI/yKNhtwMaoh0g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=puEFSkBzWgvk/zmDjShuQjw7OOadqpBUmWf4OlBffZHx4dN5tYkG86koRo6HSzM5T
 LVfoSWEaHOTjUfucK8K/hxP6XkwEAb9wontZF9kKx0lhgsxfSHkPlRSdVQxYrBrpj5
 tvSs5jDI51vWVrAmiMQtF0AApi+XQ0lwE7jaPeEaOhWxjxqlpHWug1kNpfMIjPDHqp
 EG4h86navGeGQvgw2RASLujNDEzTZsyUyVZeGb0JMB15Fi6fcpKoUF5kH2e3zJ0kjh
 vs2NQq6Q8dFvvkhLxI7pbsynPslRqwdCqXBDuSrNZfvrN1fWGkeA8l1yAdDnru5qyg
 1PUiG7mlxJJAw==
Date: Tue, 08 Oct 2024 19:14:05 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, linux-watchdog@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>
In-Reply-To: <20241008-zii_yaml-v1-4-d06ba7e26225@nxp.com>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
 <20241008-zii_yaml-v1-4-d06ba7e26225@nxp.com>
Message-Id: <172843284314.2657793.15106714372363156953.robh@kernel.org>
Subject: Re: [PATCH 4/5] dt-bindings: watchdog: convert zii,rave-sp-wdt.txt
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


On Tue, 08 Oct 2024 18:01:00 -0400, Frank Li wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241008-zii_yaml-v1-4-d06ba7e26225@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

