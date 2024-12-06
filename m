Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 881E59E7809
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 19:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC6B10E40E;
	Fri,  6 Dec 2024 18:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tl5mKPRJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9B110E40E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 18:25:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ABB015C5A0C;
 Fri,  6 Dec 2024 18:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FBBC4CED1;
 Fri,  6 Dec 2024 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733509528;
 bh=6zPrOx2SudmgD/c40+Z4a9ztiOiUIdAL08zqV81/sfs=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=tl5mKPRJ4qW6dAOX/AFyy4x6zWaRQy9Z/ra+AtEAYP1YS+8iNTK13pAz/lwHUFmuW
 vkO18VAW3gT75101h1AAzL4GWebmnOzOPe/RZUwWSkKQsPssck0zqGUeRH3vQU64G4
 0c+pwI61ZfzdDMUK+pur+1WXpU9i2vQiDL27LgnsflrBquDTI0N031EaWffY/x3z+G
 Uscw4QpmECno6h5u2jkEw7vFHzL45uDGHBkpiGnVt8TPbdmC/hS/tV+3JIOcQ9Zykk
 yKni9yZvcLdKsSbookP0Y5Omwi9ArnXRDmdyVX+u4bpc0kMVQW+enQNSLexJwbWOtH
 N7edetiR57TsQ==
Date: Fri, 06 Dec 2024 12:25:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, 
 Hector Martin <marcan@marcan.st>, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, 
 asahi@lists.linux.dev, Sven Peter <sven@svenpeter.dev>, 
 linux-arm-kernel@lists.infradead.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Pavel Machek <pavel@ucw.cz>, 
 Daniel Thompson <danielt@kernel.org>, linux-fbdev@vger.kernel.org
To: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241206172735.4310-2-towinchenmi@gmail.com>
References: <20241206172735.4310-1-towinchenmi@gmail.com>
 <20241206172735.4310-2-towinchenmi@gmail.com>
Message-Id: <173350952667.3933863.13037602591337209524.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 bindings for Apple DWI backlight
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


On Sat, 07 Dec 2024 01:24:33 +0800, Nick Chan wrote:
> Add the device tree bindings for backlight controllers attached via Apple
> DWI 2-wire interface.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../bindings/leds/backlight/apple,dwi-bl.yaml | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/leds/backlight/apple,dwi.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241206172735.4310-2-towinchenmi@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

