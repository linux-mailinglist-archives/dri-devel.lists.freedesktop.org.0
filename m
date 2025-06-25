Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446ACAE865C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 16:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A14010E240;
	Wed, 25 Jun 2025 14:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rO3IxLe0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A945710E740
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 14:25:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A7E4CA526DD;
 Wed, 25 Jun 2025 14:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37455C4CEEA;
 Wed, 25 Jun 2025 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750861516;
 bh=gIZwiFDHx2s0parZhM/vFYkw+llVp5IIeVaP9k00Kz4=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=rO3IxLe0y98Aa+TBhnVRMW8EDC8jpipS4BCaCL5vCAh2n8+7aeZ7jhaOraQMgb35v
 iT1PqyGzUNtg7O9wzmOU5+vS+e27TBxlHG0ilpiwnLEV1GaqjFVomclH+G+KxrWMoU
 ob/Z6p0U7PwOkZo/PU2IQQ9eIMvJk63Hb08IdCNCaGLB07wk36yIyDSZ0qlySmilfj
 DIwqjPy0oYSULDE65PILOvU4lP9/POFpdgxJ4HYUBAmEeyBzyPYTbSXxBwZ2otCVvW
 di0loxqHsJOwvrQ5/H/LMqybkU7frVpgsljwSMoUja0Vq+toA69paGMORRPo9UWDmw
 y6MQtv/UH+OCQ==
Date: Wed, 25 Jun 2025 09:25:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20250625-panel-synaptics-tddi-v2-1-7a62ab1d13c7@disroot.org>
References: <20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org>
 <20250625-panel-synaptics-tddi-v2-1-7a62ab1d13c7@disroot.org>
Message-Id: <175086151529.908340.14015506927066516002.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: document Synaptics
 TDDI panel driver
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


On Wed, 25 Jun 2025 15:38:44 +0530, Kaustabh Chakraborty wrote:
> Document the driver for Synaptics TDDI (Touch/Display Integration) panels.
> Along with the MIPI-DSI panel, these devices also have an in-built LED
> backlight device and a touchscreen, all packed together in a single chip.
> Also, add compatibles for supported panels - TD4101 and TD4300.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../display/panel/synaptics,td4300-panel.yaml      | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.example.dtb: /example-0/dsi/panel@0: failed to match any schema with compatible: ['synaptics,td4300-panel']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250625-panel-synaptics-tddi-v2-1-7a62ab1d13c7@disroot.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

