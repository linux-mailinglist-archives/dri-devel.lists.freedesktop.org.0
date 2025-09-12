Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE56B53F75
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 02:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DFD10E3F2;
	Fri, 12 Sep 2025 00:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OjqTNAxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291B010E0D4;
 Fri, 12 Sep 2025 00:17:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B644D601AF;
 Fri, 12 Sep 2025 00:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3495CC4CEF0;
 Fri, 12 Sep 2025 00:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757636268;
 bh=3RZx3B3a93+MI3rsd0ttOFCVaCC1U6RzL2JzBz1Jvjw=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=OjqTNAxt50f5XtTfv85KO5HN1HlBi9MH3vAlSjjTkNouZX1gtx3eYnwtrPIsACsLu
 PaLPic86LE5liewv0KeBq5pK4XMOBF9k4u04ssU4U54Ej6brnT+zMjDfg+xorxDAf5
 azkVI7gCrlULUpw1x9Ul0SfI68rtMgabxaPQVVNcHLaKJOhAA7lf78EB2WV45HM1nA
 Fiu5c+G2qeZXM3avcvel2ePz456eBokzP09UnfgacWwKEUSxNWCH7mFiV35/hPCNGW
 7nL4mesiQ7t3FHDI2etHlqvQwuWTzWFBk+G4P1xUPQRH9BHDJ2d57Tfu7ySEphKYxT
 ohfxeGuy2mEaA==
Date: Thu, 11 Sep 2025 19:17:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 linux-arm-msm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>
To: Abel Vesa <abel.vesa@linaro.org>
In-Reply-To: <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
Message-Id: <175763620749.1187186.12529943530682570245.robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
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


On Thu, 11 Sep 2025 15:28:50 +0300, Abel Vesa wrote:
> Document the DisplayPort controller found in the Qualcomm Glymur SoC.
> There are 4 controllers and their base addresses and layouts differ,
> therefore being incompatible with all previous platforms.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.example.dtb: displayport-controller@ae90000 (qcom,glymur-dp): reg: [[0, 183042048], [0, 512], [0, 183042560], [0, 512], [0, 183043072], [0, 1536], [0, 183046144], [0, 1024], [0, 183047168], [0, 1024]] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.example.dtb: displayport-controller@ae90000 (qcom,glymur-dp): reg: [[0, 183042048], [0, 512], [0, 183042560], [0, 512], [0, 183043072], [0, 1536], [0, 183046144], [0, 1024], [0, 183047168], [0, 1024]] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250911-glymur-display-v1-3-d391a343292e@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

