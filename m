Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9139A85171A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 15:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D1E10E2F6;
	Mon, 12 Feb 2024 14:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Aa66Rotz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD95710E7B1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 14:35:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C0F89CE0170;
 Mon, 12 Feb 2024 14:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E1EC433C7;
 Mon, 12 Feb 2024 14:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707748548;
 bh=FEZEKqY3PEPBoYpj0jiC+YPZPIyblBQmDkJBM9b5JJo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Aa66RotzZ/7KLs3BaxzMWXwX8lDZZJHKqICiSM3w/tEa0lRoqjGhYM7Io5qB3Ndl5
 USyP07zjAul+LXOyPLKpyGBrX5IvaOe5uJeBMJPdOD0RbPFEZx+8gr8Zl0Td7e+Y3h
 Zx/Wxb60iLlGys9Tj8qop6N56kwjz6C1ZfOykK/6cgvJKDiGVRo1ESoZbl0x4n28s9
 gjTGnU5Bvz1r2U9SNgyU+4bI4yO2WR70qY75tysgz95BBKKVk34LWRBbO4Ht2FmNKw
 W3EFeqXbOr5q0zMvTj/ULtV6fiHBB/dDHP/3GGK6KR3sjFjBNEtToY28mw4v0Yy/Sf
 hBtu6c2wFExrQ==
Date: Mon, 12 Feb 2024 08:35:46 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Cc: chromeos-krk-upstreaming@google.com, tzimmermann@suse.de, 
 maarten.lankhorst@linux.intel.com, hverkuil-cisco@xs4all.nl, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 mchehab@kernel.org, ribalda@chromium.org, robh+dt@kernel.org, 
 mripard@kernel.org, airlied@gmail.com, linux-media@vger.kernel.org, 
 akpm@linux-foundation.org, dinguyen@kernel.org, devicetree@vger.kernel.org, 
 daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
In-Reply-To: <20240212131323.2162161-8-panikiel@google.com>
References: <20240212131323.2162161-1-panikiel@google.com>
 <20240212131323.2162161-8-panikiel@google.com>
Message-Id: <170774854498.294434.14234480400138512065.robh@kernel.org>
Subject: Re: [PATCH 7/9] media: dt-bindings: Add Chameleon v3 framebuffer
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


On Mon, 12 Feb 2024 13:13:21 +0000, Paweł Anikiel wrote:
> The Chameleon v3 uses the framebuffer IP core to take the video signal
> from different sources and directly write frames into memory.
> 
> Signed-off-by: Paweł Anikiel <panikiel@google.com>
> ---
>  .../bindings/media/google,chv3-fb.yaml        | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/google,chv3-fb.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/google,chv3-fb.example.dts:28.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/media/google,chv3-fb.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240212131323.2162161-8-panikiel@google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

