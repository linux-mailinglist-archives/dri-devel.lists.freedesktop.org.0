Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB8EA4428A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AB310E6DB;
	Tue, 25 Feb 2025 14:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A6c6N6Yn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2324510E176;
 Tue, 25 Feb 2025 14:24:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A3D385C6793;
 Tue, 25 Feb 2025 14:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C99CC4CEDD;
 Tue, 25 Feb 2025 14:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740493479;
 bh=Tc/+WyJ8Iu+Vv+jAgKujCKC+Po6J5sopxIY2TPW8Xjc=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=A6c6N6Yn7j53oak37Og95xt1rMTVpfmjwcHxJfJ43MK8NIMZh5JwLQXaN8RnwLT3R
 nzvYY6s5w9mfB1n7oypQDTYcdau2q6QVY97RcU57DQf5MAWDMjaBd4Z6noqZlVCzZg
 IYTsbhIloDhv2JjfrlfncWupCp6K2tQvw5lGkZ7zCl1m1MlDLOspXXoZrOMXwwKEQq
 v0GXdbNBY1vwedcQzhejheZB+adUQzneLBCVH3LOsjiPOj/SznCDjtj1R7+TZePlaa
 upPZSNfu3RvPRVuj0g7EQwYYHuaixfpuCNGPiCM6BTiPHYNbay6Td1sbCF34aPENi7
 9Vwq8goStZtpg==
Date: Tue, 25 Feb 2025 08:24:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, quic_jesszhan@quicinc.com, rfoss@kernel.org, 
 jernej.skrabec@gmail.com, conor+dt@kernel.org, robh+dt@kernel.org, 
 jonas@kwiboo.se, linux-arm-msm@vger.kernel.org, 
 Laurent.pinchart@ideasonboard.com, quic_vproddut@quicinc.com, 
 neil.armstrong@linaro.org, konradybcio@kernel.org, andrzej.hajda@intel.com, 
 linux-kernel@vger.kernel.org, quic_rajeevny@quicinc.com, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 marijn.suijten@somainline.org, andersson@kernel.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com, 
 sean@poorly.run, devicetree@vger.kernel.org
To: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <20250225121824.3869719-4-quic_amakhija@quicinc.com>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-4-quic_amakhija@quicinc.com>
Message-Id: <174049347715.2313013.4695405671704163724.robh@kernel.org>
Subject: Re: [PATCH 03/11] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P
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


On Tue, 25 Feb 2025 17:48:16 +0530, Ayushi Makhija wrote:
> Document DSI controller and phy on SA8775P platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 170 ++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml: ^dsi@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml: ^phy@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250225121824.3869719-4-quic_amakhija@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

