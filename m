Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA6190480C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 02:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B952A10E1D6;
	Wed, 12 Jun 2024 00:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vONq4abH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A2810E1D6;
 Wed, 12 Jun 2024 00:34:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4976561206;
 Wed, 12 Jun 2024 00:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92413C2BD10;
 Wed, 12 Jun 2024 00:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718152446;
 bh=5fRGuvJp6cBf5p4D5mJF23NkzpveK8jJGPPtUPoL47Y=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=vONq4abHtLrO1CV8n8jkL2JI7V/e8C71ZawuNB8izsThmZ7zeuBNf6L9pjUeYOb0L
 ABkkhSjNK1tGGBdcEQHF+QGGr0Boc3xPaNH4pwF0gf7uFwWoYnPcQEaTuwdROGl5lG
 76cXGQwCz2LHb0c4UDqX5k19r2FM7x0cdHoA/bq8tmU00FBoLSECTlNLrlhnxDsY9T
 r3d6Cg7iQfrVsoDV0MeUpKPiEDPvkcurn31SYc7xAQeHoTGMoMgkG7JqfFzjBE13c9
 4rM354UbjF2TpJsCOG0dG8Lou2GbSuhMEhWK4+EDi6nZHNJl1E9hEOfld92kQKqESx
 eMMDN65Z+ALkg==
Date: Tue, 11 Jun 2024 18:34:04 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: jonathan@marek.ca, krzk+dt@kernel.org, quic_khsieh@quicinc.com, 
 linux-arm-msm@vger.kernel.org, quic_rmccann@quicinc.com, sean@poorly.run, 
 dmitry.baryshkov@linaro.org, tzimmermann@suse.de, mripard@kernel.org, 
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, 
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, 
 daniel@ffwll.ch, freedreno@lists.freedesktop.org, 
 marijn.suijten@somainline.org, robdclark@gmail.com, conor+dt@kernel.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, devicetree@vger.kernel.org, 
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org
In-Reply-To: <20240611223743.113223-2-danila@jiaxyga.com>
References: <20240611223743.113223-1-danila@jiaxyga.com>
 <20240611223743.113223-2-danila@jiaxyga.com>
Message-Id: <171815244421.3448243.12009673117592867975.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Add SM7150 MDSS
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


On Wed, 12 Jun 2024 01:37:40 +0300, Danila Tikhonov wrote:
> Document the MDSS hardware found on the Qualcomm SM7150 platform.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../display/msm/qcom,sm7150-mdss.yaml         | 460 ++++++++++++++++++
>  1 file changed, 460 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.example.dts:25:18: fatal error: dt-bindings/clock/qcom,sm7150-dispcc.h: No such file or directory
   25 |         #include <dt-bindings/clock/qcom,sm7150-dispcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240611223743.113223-2-danila@jiaxyga.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

