Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FB9886342
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 23:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A171121DB;
	Thu, 21 Mar 2024 22:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lhRjKsFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A191121DE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 22:25:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D6BC6CE11E9;
 Thu, 21 Mar 2024 22:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB606C433C7;
 Thu, 21 Mar 2024 22:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711059931;
 bh=KV1cqdEWouuF9AZNPJszbFGwtds7bB206s9mEHm38IY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=lhRjKsFjoMXVNpayNroILS0ygmnonPsjJ3uvr2+RVILA/g48y/YGCQrtQiMiMMj6e
 kF/UT1WFAZUL41Jt3DvwiDMM7Vc37F5y04cBhGYI7DUoLJH5aeFdFmDYcp+DgQzZXQ
 +jbySrQHsxnpT+M5T3jGxKjtWh/ouwD6lb0B09ZbiPm+bsRxZUprOq/Fe+PaKEeq6G
 usSTwEn0klpCUepXRR8YvBDEXGEtQXGKMinN3GEdgrzho7UevbflmAviDtQZCKxREe
 FfPPrrXcoT3+WiNxJnbbmSh45+FQGTl/Cq6jDy4vBMFe76rnAGuIyioJwiy3xG5qGq
 whLWO4I6Tw29A==
Date: Thu, 21 Mar 2024 17:25:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-media@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, 
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
In-Reply-To: <20240321-dp-live-fmt-v3-8-d5090d796b7e@amd.com>
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
 <20240321-dp-live-fmt-v3-8-d5090d796b7e@amd.com>
Message-Id: <171105992875.3043233.18321806946234735413.robh@kernel.org>
Subject: Re: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
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


On Thu, 21 Mar 2024 13:43:46 -0700, Anatoliy Klymenko wrote:
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
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/xlnx/xlnx,v-tpg.yaml: bus-format: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/xlnx/xlnx,v-tpg.yaml: xlnx,bridge: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/xlnx/xlnx,vtc.yaml: xlnx,pixels-per-clock: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240321-dp-live-fmt-v3-8-d5090d796b7e@amd.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

