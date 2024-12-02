Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88489E076C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 16:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6791910E7B4;
	Mon,  2 Dec 2024 15:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nno5o5gi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8565810E7B4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 15:46:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DC04B5C4427;
 Mon,  2 Dec 2024 15:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D32DC4CED1;
 Mon,  2 Dec 2024 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733154402;
 bh=nq9CApm2lwU3fpXbg/FXX6NMDF+2uS9tBRO+bf3mRTs=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=Nno5o5ginogysZYOoinMPACfcmzLi+NvkvWdGsltRWpC9rd1iSKUzbuKi+dexEVC6
 VBtR9WlggSfrnvBoqJqs0HkfdK/167+6KxETARnP6EwNHRD5jVdxn6m4avfERluDb/
 5ss+bMZ4iGWtGQLEFZOa0nDNjhIxHi04yO8djXxrhWaRqpQhQhA8pJ/JeB/71CnHT9
 kIqWc4NVCgwZBbPXFy041BMzFegKtLFI70GfYZJZCjncRo2oi8cdWiCwxHRpyXWc3S
 npTdtucykpJxCkuIpL0b+1MP4REnLr1rGA+BZP8TpUGuEANUx/62bgjJYSDFun9x1z
 ReYvBWoS/hrYw==
Date: Mon, 02 Dec 2024 09:46:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Doug Berger <opendmb@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 dri-devel@lists.freedesktop.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Simona Vetter <simona@ffwll.ch>, Ray Jui <rjui@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Linus Walleij <linus.walleij@linaro.org>, 
 Scott Branden <sbranden@broadcom.com>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-kernel@vger.kernel.org
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-1-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
 <20241202-dt-bcm2712-fixes-v1-1-fac67cc2f98a@raspberrypi.com>
Message-Id: <173315440083.2722567.15501799626521434805.robh@kernel.org>
Subject: Re: [PATCH 1/7] dtbindings: display: bcm2711-hdmi: Correct
 bindings for 2712
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


On Mon, 02 Dec 2024 14:31:54 +0000, Dave Stevenson wrote:
> The previous patch just adding the compatible missed out that the
> number of interrupts changed
> 
> Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        | 44 +++++++++++++++-------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:59:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:67:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:76:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:84:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241202-dt-bcm2712-fixes-v1-1-fac67cc2f98a@raspberrypi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

