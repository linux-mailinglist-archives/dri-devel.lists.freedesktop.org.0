Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558B68CE4D4
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 13:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1A110EBB4;
	Fri, 24 May 2024 11:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DWOZeX6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F3F10EBB4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 11:26:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 58AEB630AB;
 Fri, 24 May 2024 11:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F28C32782;
 Fri, 24 May 2024 11:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716549977;
 bh=KCII9VvhTDTvyblIy2kt5S8OlDcHA9ogMutW/tsAaBo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=DWOZeX6Tk0NC57W0YtgVJEZLodphgxVbDKoCA54TTdEve3netFZn6FEkvDJVMJMRu
 I75BCayT1MSigUG96V2JCMqDyZIXGBskh14PMWMjZHCwBSxaEVTlDxGIqSNERipHHu
 pi+kAzkDv3RIWba3/zH4WSqJ+9SWXcBd8EFCQrGjP+14OPPTLWrnToaiO0M3lGpAOf
 HgtUp4MQbby6P/a5KPpSlLS57J4KNeL36/Pce43hcGyQdA056e1Ge2xVLW8FYUclze
 Bz9D5Ndg4k6PMUOR8ujQEQQFpMagAa/PdQ2OI7Erki9AiRZldODLI5Yw5jVg4+96Yj
 DNW8/ZzrK3LXw==
Date: Fri, 24 May 2024 06:26:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Chris Morgan <macroalpha82@gmail.com>, devicetree@vger.kernel.org, 
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Hironori KIKUCHI <kikuchan98@gmail.com>
In-Reply-To: <20240524103506.187277-2-ryan@testtoast.com>
References: <20240524103506.187277-1-ryan@testtoast.com>
 <20240524103506.187277-2-ryan@testtoast.com>
Message-Id: <171654997579.661410.2485055226401871531.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add WL-355608-A8
 panel
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


On Fri, 24 May 2024 22:33:13 +1200, Ryan Walklin wrote:
> The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display from an unknown
> OEM, used in a number of handheld gaming devices made by Anbernic.
> 
> Add a device tree binding for the panel.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../bindings/display/panel/wl-355608-a8.yaml  | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/panel/wl-355608-a8.example.dtb: /example-0/spi/panel@0: failed to match any schema with compatible: ['wl_355608_a8']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240524103506.187277-2-ryan@testtoast.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

