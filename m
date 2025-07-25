Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BFBB11F57
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 15:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F41A10E20B;
	Fri, 25 Jul 2025 13:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rxztm1Zg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724E710E20B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 13:27:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C2B95C6788;
 Fri, 25 Jul 2025 13:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9A8C4CEE7;
 Fri, 25 Jul 2025 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753450070;
 bh=lXb0UAkdLRBZEl2w236QgUTKNdJI4nqMaBIkSJhUt1A=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=Rxztm1Zg2BICuHOgdxuDU8E9XunHZYswcsJQky0leSQJM08JMEmbEaovz3Zcw9p0j
 5mfj1jIkSKLGMNg0L82YL1dxB/BtBYatXGCCvpH9at9O9fLl5j0kgG/WEIN7y6y1XH
 PTaYC43Cvv9GXvkxGo/uhMuJOgV0VQMpsB+GZm7FsnnIiAWqBzF1GNxzntz/+MFiBH
 IC8tBuHIgCdKuRipxJPpKnUjaE3itoHmfUAGscGFSUgpQDcfhF2DqhV+MTz6zYF1WS
 oV/qTCl+tLpQguthUMBDg3Mir5PfyXvTK/APP5UVVkWYPb5I9jf6Xuo6ue9JyApvYQ
 TjPbM4i2uvlfQ==
Date: Fri, 25 Jul 2025 08:27:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <danielt@kernel.org>, Helge Deller <deller@gmx.de>, 
 linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250725-max25014-v1-1-0e8cce92078e@gocontroll.com>
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
 <20250725-max25014-v1-1-0e8cce92078e@gocontroll.com>
Message-Id: <175345006903.1002291.4212198267952446360.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: backlight: Add max25014 bindings
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


On Fri, 25 Jul 2025 13:09:23 +0200, Maud Spierings wrote:
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 78 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 83 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.example.dtb: backlight@6f (maxim,max25014): Unevaluated properties are not allowed ('bl-name' was unexpected)
	from schema $id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250725-max25014-v1-1-0e8cce92078e@gocontroll.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

