Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051F5984A8B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 20:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3320F10E731;
	Tue, 24 Sep 2024 18:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SmhXbk8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3ABD10E731
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 18:01:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 12A1FA43806;
 Tue, 24 Sep 2024 18:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CADC4CEC5;
 Tue, 24 Sep 2024 18:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727200867;
 bh=FIBb6Xvg+vsgLgLFLONIDRw5APSJqrReEgeIWNL+IS0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=SmhXbk8xSfBousexFosmlobUgbqZZT8vkrhy3PqNvfGjguI5C24e74tfAoS288cv+
 ShVL9IN8zynLttc4j52kERYVOhfxp3spvFLrCL3RJ8PjOp/jl6X38qkw8bi966fmyw
 IeoCBOh3AId7HJW43JDo/hrV4gHx3Enbz305N0GwFmnOQmX4TKLBXiQjEWiybngqjS
 oFPmOHpvi9OUFLskXitlQJ2cydCon8zJFtepf6nfOqt2bwFnMyNqJQC1WLrX9NTi00
 GBabJGQ9D6PXccpqOyjCDKaB6Yv0rmJqzgMHH0v+VGHOLJ+ymo6HqUFhroJrhGokpp
 JM0D42QcdaScQ==
Date: Tue, 24 Sep 2024 13:01:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: andrzej.hajda@intel.com, sam@ravnborg.org, robh+dt@kernel.org, 
 jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com, 
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel@pengutronix.de, 
 alexander.stein@ew.tq-group.com, shawnguo@kernel.org, linux-imx@nxp.com, 
 mripard@kernel.org, vkoul@kernel.org, dri-devel@lists.freedesktop.org, 
 daniel@ffwll.ch, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, airlied@gmail.com, 
 jernej.skrabec@gmail.com, s.hauer@pengutronix.de, oliver.brown@nxp.com, 
 devicetree@vger.kernel.org, festevam@gmail.com, dmitry.baryshkov@linaro.org, 
 neil.armstrong@linaro.org
In-Reply-To: <b2e1d26f964a03163ec7a1ba6ac8d7c88d6cb111.1727159906.git.Sandor.yu@nxp.com>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
 <b2e1d26f964a03163ec7a1ba6ac8d7c88d6cb111.1727159906.git.Sandor.yu@nxp.com>
Message-Id: <172720086579.2917.61541648754055069.robh@kernel.org>
Subject: Re: [PATCH v17 3/8] dt-bindings: display: bridge: Add Cadence MHDP8501
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


On Tue, 24 Sep 2024 15:36:48 +0800, Sandor Yu wrote:
> Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> v16->v17:
> - Add lane-mapping property
> 
> v9->v16:
>  *No change
> 
> .../display/bridge/cdns,mhdp8501.yaml         | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml: lane-mapping: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/b2e1d26f964a03163ec7a1ba6ac8d7c88d6cb111.1727159906.git.Sandor.yu@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

