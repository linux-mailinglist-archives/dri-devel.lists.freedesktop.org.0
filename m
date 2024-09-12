Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1987797647A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 10:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF0110E212;
	Thu, 12 Sep 2024 08:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sWdnb8CX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBAD10E212;
 Thu, 12 Sep 2024 08:29:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B2038A44283;
 Thu, 12 Sep 2024 08:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCFEC4CEC3;
 Thu, 12 Sep 2024 08:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726129790;
 bh=vVZSVYNNMpsxf/Mtb1DzmqrGNnMqIEIm+Nt2IKnA8hA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=sWdnb8CXle8EwZQtK4FF2OPZiO4WYQ+RQ0yo731sacd6+s9mXxQkLvJR41dZJLHR5
 ku1BzgEoYxHHcVg9eIRn9Z0MrgaYViDkjpaq3AQLvODziVTMB+jfMBOz45mNR4JbpC
 hIVnQqQx54h9mSjhfscWiRH4TVXlV9xw1ffrSWIXtARfD/oabDu/C6rhGUsCco9iYn
 8OgavysBhYcM677c8qTtpjdsvUGDcLOlJLauSgOfdo2XwN7IAVWVoYnnRVVPrF8Pz7
 3ebkCbIpvxUv7Rp50WELU2xHRUrEXQ9wUhklmQODO6Fawg2QlY1TkzbGMHH/ud68Wf
 014aV9hnrDymQ==
Date: Thu, 12 Sep 2024 03:29:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: andersson@kernel.org, dmitry.baryshkov@linaro.org, sean@poorly.run, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com, 
 neil.armstrong@linaro.org, swboyd@chromium.org, mailingradian@gmail.com, 
 quic_abhinavk@quicinc.com, freedreno@lists.freedesktop.org, 
 danila@jiaxyga.com, quic_kalyant@quicinc.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, mripard@kernel.org, 
 konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, 
 marijn.suijten@somainline.org, robdclark@gmail.com, krzk+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, quic_jesszhan@quicinc.com, 
 conor+dt@kernel.org, airlied@gmail.com, bigfoot@classfun.cn
In-Reply-To: <20240912071437.1708969-2-quic_mahap@quicinc.com>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-2-quic_mahap@quicinc.com>
Message-Id: <172612978700.2592228.2560116576416075874.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
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


On Thu, 12 Sep 2024 12:44:33 +0530, Mahadevan wrote:
> Document the MDSS hardware found on the Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 225 ++++++++++++++++++
>  1 file changed, 225 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml: ^display-controller@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml: ^displayport-controller@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint
Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dts:24:18: fatal error: dt-bindings/clock/qcom,sa8775p-dispcc.h: No such file or directory
   24 |         #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:442: Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1432: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240912071437.1708969-2-quic_mahap@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

