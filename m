Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7499103E5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 14:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BDE10E0C6;
	Thu, 20 Jun 2024 12:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I2bLUI9g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345C510E2E7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 12:25:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 89DAE62032;
 Thu, 20 Jun 2024 12:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154DFC2BD10;
 Thu, 20 Jun 2024 12:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718886301;
 bh=u0IxrPEYcajYQ4EI1J1Jc2UprPH+WcAt3a1Y9ua5dp8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=I2bLUI9gvnbc/rB0DbBcfYycaG+F958VXJMvlqwwjksQEuBykPXfnVk6mnVUZpnah
 H4atNR+9PYQRuSTGpqdM3yMY68s+Mf5sHmJP9RMeJvyN7KJWQdu5/Bd0IlpjEjnuqf
 JGROnRYNJOxbL4cquiWwHk9rq69loiBjZnD0irec0hL91pecG5ho2+IlsbXUQzNZPr
 OtUzrbm60xxgDo3UHECDgYvXyZILyllYgE2dh7Z6UEnFTtwWvBBrv7wDwgBB/WMePY
 G48sEmt5gs04zvX6sOxYCpPVhF/R6q4k/tdUZbn4aqAJZxG53wHLVaDdPx4iNcSekN
 lo3qZ08S5qv+A==
Date: Thu, 20 Jun 2024 06:25:00 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chris Morgan <macroalpha82@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Watts <contact@jookia.org>, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20240620113150.83466-19-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
 <20240620113150.83466-19-ryan@testtoast.com>
Message-Id: <171888630004.1426859.15945368564600967257.robh@kernel.org>
Subject: Re: [PATCH 18/23] dt-bindings: allwinner: add H616 DE33 bus, clock
 and display bindings
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


On Thu, 20 Jun 2024 23:29:56 +1200, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add display engine bus, clock and mixer bindings for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 ++++---
>  .../bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml       | 1 +
>  .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml   | 1 +
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml:27:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.example.dtb: bus@1000000: compatible: ['allwinner,sun50i-a64-de2'] is valid under each of {'items': [{'const': 'allwinner,sun50i-a64-de2'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}, {'items': [{'const': 'allwinner,sun50i-a64-de2'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}
	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240620113150.83466-19-ryan@testtoast.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

