Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A54879556
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 14:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8743D10F106;
	Tue, 12 Mar 2024 13:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="txqGyP7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3AB10F106
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 13:49:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B20B1611E2;
 Tue, 12 Mar 2024 13:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DD5C43390;
 Tue, 12 Mar 2024 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710251349;
 bh=gQOndgtic22jBUvA6JtP0OZkfHWdF7w1Uwcr114J8+E=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=txqGyP7INBJyRGU+aRYSqv1aNw001UvRkMWVoxb5QWnhK2Rv7mvVAVVXuhCfZwjAv
 mdLlq2EjEEkchwYFVOxeVzc15RTPXs/703VmeNZmywulSJ8dwCB/MSQasCbHgeQaCm
 KqAk6gUvzBMtd1RQq3B/2xdMF2gy0toBQewwFY7SXH5pHgYjJop4RaZ8H5JF+tlJr/
 syoDKPub+ddnIWI6wJu2tXaS2UO61sSDsUwqJC861DOOX55Cv32e7qurOpCFilWXkY
 GMg1PV+R0sA/bBrkQNHs2TXG2fbGqL2afl1fpCTu81Z2B7uMXL/DPAAR1PTdq0wLrF
 jg3UXa20Ks1MQ==
Date: Tue, 12 Mar 2024 07:49:08 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-sound@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Jaroslav Kysela <perex@perex.cz>, devicetree@vger.kernel.org, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Vishal Sagar <vishal.sagar@amd.com>
In-Reply-To: <20240312-xilinx-dp-audio-v1-2-696c79facbb9@ideasonboard.com>
References: <20240312-xilinx-dp-audio-v1-0-696c79facbb9@ideasonboard.com>
 <20240312-xilinx-dp-audio-v1-2-696c79facbb9@ideasonboard.com>
Message-Id: <171025134476.2083292.14206241408846166502.robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: display/xlnx/zynqmp-dpsub: Add audio DMAs
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


On Tue, 12 Mar 2024 11:41:03 +0200, Tomi Valkeinen wrote:
> The DP subsystem for ZynqMP support audio via two channels, and the DP
> DMA has dma-engines for those channels. For some reason the DT binding
> has not specified those channels, even if the picture included in
> xlnx,zynqmp-dpsub.yaml shows "2 x aud" DMAs.
> 
> Add the two audio DMAs to the binding.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml    | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dts:54.26-27 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240312-xilinx-dp-audio-v1-2-696c79facbb9@ideasonboard.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

