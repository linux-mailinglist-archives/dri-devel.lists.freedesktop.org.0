Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C345CBD3B1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8443210E3C2;
	Mon, 15 Dec 2025 09:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WQ4nhYsj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F9E10E24D;
 Mon, 15 Dec 2025 09:43:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 437F960129;
 Mon, 15 Dec 2025 09:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A5DC19421;
 Mon, 15 Dec 2025 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765791376;
 bh=dSLpxiL1aXMnJwyx4tEHeVx1Cgit3eOzv1//IzQcCEo=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=WQ4nhYsj07UiogayY1jqqrBEbH7UuNW59gy5cWwaztlK6hn98biG/rx5bkL+/75G2
 t9Nd+CTzUxIIxaqgxI/8rdH1eJXhVRPpYQkWgbhl/xy265GTmXYNhl6PzoDQfxurtY
 HAbI/i3D53b0ft8ZBFNJ2UiSHTFDA1/fK7jT6LQHlJSsgAuv4avBXaBEeQqnzmLhN6
 aEa+2HNUYrDCObqeGGNcPtOGt5x5iAaf1n0bDbMyyacETlZP/B324g6bB1K5FiKTwb
 nm7xKVHKpmKks6f28H1RQyayZEVLZPmruxzIwyuH9vYiLGpcrp850fCYM6j3euztUI
 7c+Sw4wMtHvVQ==
Date: Mon, 15 Dec 2025 03:36:13 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: yongxing.mou@oss.qualcomm.com, robin.clark@oss.qualcomm.com, 
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 krzk+dt@kernel.org, neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
 linux-arm-msm@vger.kernel.org, lumag@kernel.org, simona@ffwll.ch, 
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com, sean@poorly.run, 
 marijn.suijten@somainline.org, abhinav.kumar@linux.dev, mripard@kernel.org
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
In-Reply-To: <20251215083854.577-5-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-5-yuanjie.yang@oss.qualcomm.com>
Message-Id: <176579137354.1486530.823295322686100207.robh@kernel.org>
Subject: Re: [PATCH v3 04/11] dt-bindings: display/msm:
 qcom,kaanapali-mdss: Add Kaanapali
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


On Mon, 15 Dec 2025 16:38:47 +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> Kaanapali has significant register changes, making it incompatible
> with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
>  1 file changed, 297 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb: phy@9ac1000 (qcom,kaanapali-dsi-phy-3nm): reg: [[0, 162271232], [0, 460], [0, 162271744], [0, 128], [0, 162272512], [0, 1024]] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251215083854.577-5-yuanjie.yang@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

