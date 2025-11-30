Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F1DC9512A
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 16:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9230510E067;
	Sun, 30 Nov 2025 15:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IqNF5ci3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9C210E067
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 15:15:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3784860132;
 Sun, 30 Nov 2025 15:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1578C4CEF8;
 Sun, 30 Nov 2025 15:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764515750;
 bh=hMizoJdXUR5jj48wInWzYGy+PF1KqvVUCrqSYZVjpBE=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=IqNF5ci3EiLuQUlGIjLJCNcg4Qe81EAX9pOR3uYIDEiwJiyUDqvQd8ChVSoSGllhM
 rIzy3np2qM1hAdQNtneM3ifCrmE45B1bsfR33dQAQtvHdr+5XeQqipfruCqz4Zih+w
 rqi5iSzYajSSGgDE4KiKMfjTp9t/LiQHqMln2XbLbm/9EqOfTijmYuWKHxLpDTr4aY
 pyT5p0hRiPPZNqtLGYX8xPxy5VwGAUxbJEDiWHeEX7m8rz9M0kAtmaPOObVeTJ6trJ
 mDDX/LMGVPDQEPvX0exISE0KrvsZTxvL4wIPQbMge2Hsleb+eXUcvw1A7cuLxe6QV/
 q87q8crCsVh5w==
Date: Sun, 30 Nov 2025 09:15:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: thierry.reding@gmail.com, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 mripard@kernel.org, airlied@gmail.com, neil.armstrong@linaro.org, 
 devicetree@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 jessica.zhang@oss.qualcomm.com, tzimmermann@suse.de, simona@ffwll.ch, 
 sam@ravnborg.org, krzk+dt@kernel.org
To: Renjun Wang <renjunw0@foxmail.com>
In-Reply-To: <tencent_FD75580BB3BF35F44985E237E7DE56BE2407@qq.com>
References: <tencent_FD75580BB3BF35F44985E237E7DE56BE2407@qq.com>
Message-Id: <176451574938.1028542.3454025128487626115.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add HannStar HSD156JUW2
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


On Sun, 30 Nov 2025 22:35:27 +0800, Renjun Wang wrote:
> Add the HannStar HSD156JUW2 15.6" FHD (1920x1080) TFT LCD panel to
> the panel-simple compatible list.
> 
> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/tencent_FD75580BB3BF35F44985E237E7DE56BE2407@qq.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

