Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797DBB0B038
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 15:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3106210E07F;
	Sat, 19 Jul 2025 13:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z8PcE7pP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0F510E07F
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 13:24:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5EAECA5373A;
 Sat, 19 Jul 2025 13:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D5AC4CEE3;
 Sat, 19 Jul 2025 13:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752931486;
 bh=K6ehNrIeWFbo2IhyErHCbxwdJtL8CPLpZhn861VUH1I=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=Z8PcE7pPpWF/Bf/0ZcbCfDXnDswj+gRhGP/EwCZEzZIP8apc6DmlsTps2OyvxW4Mr
 yB0rpFUEjN5Rb07ZilqPP4iveE+p4VCoKfA737lJAPRYhPC9DOuvfbQ7xoNS3A2MGn
 0xNQMBlRs4BmHK0owTCJ8BN9IRdRS9FIKOEkh6txGyfak2T+EPyW/RiyJcDrMGVYsK
 iRdswvcEIQHcuhalueN7pwesLDCErNkvUC2CussPNG9SXwrE54eemsgcmpxjM8l3Hm
 TOev1MfDdZRme8lx5cKiSVHuy42U3XIf40xfv5k/0tl9YjrukzzrPqQQBXi+tP94sD
 StiLiltdTz1yQ==
Date: Sat, 19 Jul 2025 08:24:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Orson Zhai <orsonzhai@gmail.com>, dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Kevin Tang <kevin.tang@unisoc.com>, devicetree@vger.kernel.org, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Maxime Ripard <mripard@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org
To: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
In-Reply-To: <20250719-ums9230-drm-v1-1-e4344a05eb3d@abscue.de>
References: <20250719-ums9230-drm-v1-0-e4344a05eb3d@abscue.de>
 <20250719-ums9230-drm-v1-1-e4344a05eb3d@abscue.de>
Message-Id: <175293148489.4113846.8949388873166546770.robh@kernel.org>
Subject: Re: [PATCH 01/12] dt-bindings: display: sprd: adapt for UMS9230
 support
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


On Sat, 19 Jul 2025 14:09:37 +0200, Otto Pflüger wrote:
> Add the compatible strings for the display controller found in the
> UMS9230 SoC and bindings for a gate clock. Add IOMMU-related bindings
> to the display-subsystem node.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>  .../bindings/display/sprd/sprd,display-subsystem.yaml  | 11 +++++++++++
>  .../bindings/display/sprd/sprd,sharkl3-dpu.yaml        | 18 +++++++++++++-----
>  .../bindings/display/sprd/sprd,sharkl3-dsi-host.yaml   | 11 ++++++++---
>  3 files changed, 32 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml:38:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml:41:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.example.dtb: dpu@63000000 (sprd,sharkl3-dpu): clocks: [[4294967295, 21], [4294967295, 13]] is too long
	from schema $id: http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dpu.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250719-ums9230-drm-v1-1-e4344a05eb3d@abscue.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

