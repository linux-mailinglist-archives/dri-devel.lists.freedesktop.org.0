Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB6787A1A1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 03:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE8410F290;
	Wed, 13 Mar 2024 02:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bgBJX0cS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13A710F13B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 02:30:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB6BB6133B;
 Wed, 13 Mar 2024 02:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608ABC433C7;
 Wed, 13 Mar 2024 02:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710297044;
 bh=6epCFR+TeeVisNrBltVtOxZRUBOkKoRbe0+eZ0ebHGM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=bgBJX0cS4c75xtuhF2avvRAWfGeIS+DdV9OofdYqXwKLsvGUd5FxhhtQqF0mLN4dN
 /0zkpqzGk89wpr1NMFTIK1F09qLuKqVRWGN1AEMMo8y869BZWQpgbq02ZoWvzirGgH
 THVKVcTueHcJgN4l7N6LFujds6IA3UTv4MpUn8piGXRjtyy/043Xpku/hccu4QijI3
 6XlS/SxMGolxlTZT7Z5sQGHZUGSCI/ZDbMrnfFiY59kOGX3Gy8aMXXZf4F9nAaQGmY
 vLPYqL/t1jcl39selk774Xbsnx6JUYWkn2Ok/z3U449vArJT3GIT4RYGhZFpsCNg3F
 uaCPkK9BvACLg==
Date: Tue, 12 Mar 2024 20:30:43 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Michal Simek <michal.simek@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
In-Reply-To: <20240312-dp-live-fmt-v2-7-a9c35dc5c50d@amd.com>
References: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
 <20240312-dp-live-fmt-v2-7-a9c35dc5c50d@amd.com>
Message-Id: <171029704194.3354722.2132570272705371334.robh@kernel.org>
Subject: Re: [PATCH v2 7/8] dt-bindings: xlnx: Add VTC and TPG bindings
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


On Tue, 12 Mar 2024 17:55:04 -0700, Anatoliy Klymenko wrote:
> DO NOT MERGE. REFERENCE ONLY.
> 
> Add binding for AMD/Xilinx Video Timing Controller and Test Pattern
> Generator.
> 
> Copy media-bus-formats.h into dt-bindings/media to suplement TPG DT node.
> 
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> ---
>  .../bindings/display/xlnx/xlnx,v-tpg.yaml          |  87 ++++++++++
>  .../devicetree/bindings/display/xlnx/xlnx,vtc.yaml |  65 ++++++++
>  include/dt-bindings/media/media-bus-format.h       | 177 +++++++++++++++++++++
>  3 files changed, 329 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/xlnx/xlnx,v-tpg.yaml:35:4: [warning] wrong indentation: expected 4 but found 3 (indentation)
./Documentation/devicetree/bindings/display/xlnx/xlnx,v-tpg.yaml:45:8: [warning] wrong indentation: expected 8 but found 7 (indentation)
./Documentation/devicetree/bindings/display/xlnx/xlnx,v-tpg.yaml:49:8: [warning] wrong indentation: expected 8 but found 7 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/xlnx/xlnx,vtc.yaml: xlnx,pixels-per-clock: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/xlnx/xlnx,v-tpg.yaml: bus-format: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/xlnx/xlnx,v-tpg.yaml: xlnx,bridge: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240312-dp-live-fmt-v2-7-a9c35dc5c50d@amd.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

