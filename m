Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9679047B0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 01:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18D710E745;
	Tue, 11 Jun 2024 23:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="okXRkvGd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E5710E744;
 Tue, 11 Jun 2024 23:33:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2A0D7CE1EF7;
 Tue, 11 Jun 2024 23:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40878C2BD10;
 Tue, 11 Jun 2024 23:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718148832;
 bh=PAJmKNOlaPn4rqZ+atyu5CwMxZWPwxMlxuC2B34gYBA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=okXRkvGdCe1XdVvPJ/B3x/XBUJKvAc+c/+bwlGU9W54Ab5gmcbKJWX54Capoo60sJ
 3QJpZ6tJLCd7givRILbxl7GVREwZBJF2P2jjEmADI+Vi1fGbX+C4Pz5QjmtFVx6LnR
 tkSHlgGrGviOwJM8a+FTVMXUf2Vug5BgOkX9Hvya/CwSqYlg0+QF1+oBMP2Kj1vezv
 KPd96BvLwpWBsrA/Lk4rZB1wgSSvy/p7HRu16yNadwVx6cQWnEQEr9GWv15M089tmr
 JnypYQy2nt56nHqiJiWGGgY94FyfmXO6AQcp5MdIi/No12URTEXg+jLJC2MLOP1NwB
 f9bkuf23XdKjw==
Date: Tue, 11 Jun 2024 17:33:51 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: tzimmermann@suse.de, konrad.dybcio@linaro.org, 
 dmitry.baryshkov@linaro.org, krzk+dt@kernel.org, mripard@kernel.org, 
 daniel@ffwll.ch, robdclark@gmail.com, dri-devel@lists.freedesktop.org, 
 quic_rmccann@quicinc.com, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, airlied@gmail.com, quic_abhinavk@quicinc.com, 
 sean@poorly.run, marijn.suijten@somainline.org, conor+dt@kernel.org, 
 swboyd@chromium.org, neil.armstrong@linaro.org, 
 linux-kernel@vger.kernel.org, quic_khsieh@quicinc.com, 
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, jonathan@marek.ca, 
 maarten.lankhorst@linux.intel.com
In-Reply-To: <20240611223743.113223-4-danila@jiaxyga.com>
References: <20240611223743.113223-1-danila@jiaxyga.com>
 <20240611223743.113223-4-danila@jiaxyga.com>
Message-Id: <171814883103.3303009.2789653537051980409.robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: Add SM7150 DPU
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


On Wed, 12 Jun 2024 01:37:42 +0300, Danila Tikhonov wrote:
> Document the DPU hardware found on the Qualcomm SM7150 platform.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../bindings/display/msm/qcom,sm7150-dpu.yaml | 145 ++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.example.dts:24:18: fatal error: dt-bindings/clock/qcom,sm7150-dispcc.h: No such file or directory
   24 |         #include <dt-bindings/clock/qcom,sm7150-dispcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240611223743.113223-4-danila@jiaxyga.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

