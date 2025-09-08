Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA6B490FC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 16:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7537810E528;
	Mon,  8 Sep 2025 14:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KFSdKDSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B37110E538
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 14:15:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F125601A4;
 Mon,  8 Sep 2025 14:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28C4C4CEF1;
 Mon,  8 Sep 2025 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757340925;
 bh=h6Qry5FC98QS7Us6GZ3WJl94irnInyNVErTrv3usnxA=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=KFSdKDSseC+nvewrqp6aRmdLOAqtxbu5vDa/ojMk7gz2w3RgBcOeq+Mi5ibIXw75c
 B4jiwl/CjacSdJ71MywD3wUq9zdPXAz//JlKnG4ae/XIta6H4T+OcPp+gjHDgz03sf
 EJUr38/jpBv+mScdnONUNyYcS9WbMgwf9zhUgaYfnJ0BisU0fl0wRGf9WTLJ5bFlPx
 Fic4XoKLvzGMYgl5g+WmfvhflBKJ/ZRDt+O3RwB0wyTNj62F2F2/TZ0MqNSbNE0YOO
 bN2oskl4Vq+1qpJMj6IOcVh19Nmd97i//lBvx6da2J+x0TIN1/Wyv9CeBGLZpexm0p
 +iIxCh/mgF8LA==
Date: Mon, 08 Sep 2025 09:15:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andrzej.hajda@intel.com, linux-kernel@vger.kernel.org, 
 neil.armstrong@linaro.org, rfoss@kernel.org, u-kumar1@ti.com, 
 devarsht@ti.com, krzk+dt@kernel.org, sjakhade@cadence.com, jonas@kwiboo.se, 
 tzimmermann@suse.de, jernej.skrabec@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, s-jain1@ti.com, yamonkar@cadence.com, 
 devicetree@vger.kernel.org, Laurent.pinchart@ideasonboard.com, 
 conor+dt@kernel.org, mripard@kernel.org
To: Harikrishna Shenoy <h-shenoy@ti.com>
In-Reply-To: <20250908054609.1113360-1-h-shenoy@ti.com>
References: <20250908054609.1113360-1-h-shenoy@ti.com>
Message-Id: <175734087919.1809101.10556288924860708163.robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for DSC
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


On Mon, 08 Sep 2025 11:16:09 +0530, Harikrishna Shenoy wrote:
> From: Swapnil Jakhade <sjakhade@cadence.com>
> 
> Add binding changes for DSC(Display Stream Compression) in the MHDP8546
> DPI/DP bridge.
> 
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
> Changelog v2 --> v3:
> -Update the name of dsc register block.
> -Add the reg-name list in conditional based on compatible.
> Link to v2- https://lore.kernel.org/all/20250903111357.2605199-1-h-shenoy@ti.com/
> 
>  .../display/bridge/cdns,mhdp8546.yaml         | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml: allOf:0:else:properties:reg-names: {'minItems': 1, 'maxItems': 3, 'items': [{'const': 'mhdptx'}, {'const': 'mhdptx-sapb'}, {'const': 'dsc'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml: allOf:0:then:properties:reg-names: {'minItems': 2, 'maxItems': 4, 'items': [{'const': 'mhdptx'}, {'const': 'j721e-intg'}, {'const': 'mhdptx-sapb'}, {'const': 'dsc'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250908054609.1113360-1-h-shenoy@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

