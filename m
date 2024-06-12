Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387D790538D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9A610E141;
	Wed, 12 Jun 2024 13:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UHGEEGJT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D2710E884;
 Wed, 12 Jun 2024 13:20:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D8F2D61485;
 Wed, 12 Jun 2024 13:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B023C4AF1A;
 Wed, 12 Jun 2024 13:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718198404;
 bh=ht4JeB3Vd88zOyRF2cKT3rK5jnnmxZ0bHNHoyEMgEas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UHGEEGJT4XsDY6Bjso7S4/lyXNt/mBaaI2ZPaCvb5zWH6SpZMrOT/Fo1g+ha+wPU+
 Xqws4yNm/QTLPiFIesk5P4GgnS9+jbx+hEnuAul7svvOXJ+iZc9Ihjnj8l66fvSw9L
 jMJHCnqcQUoH+rBnfRvEee53lUy7qC7gZlO5X7pVwRetsk8SF3gVM0RjJjJrvQ3YH9
 J9n8YdnanU4NA9lN7+NRhEUJJ0vFpRondgFU12AsTfmgQ/IKoxyicQv9WP1xcDAFRi
 BGtOPgNG8vD34rof+tiaalIevg1O1YtpIndRFzDoAdqgqPyZdDcJXdV6qW5IGAjLXf
 iqJwHkyY2vuRA==
Date: Wed, 12 Jun 2024 07:20:03 -0600
From: Rob Herring <robh@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: jonathan@marek.ca, krzk+dt@kernel.org, quic_khsieh@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_rmccann@quicinc.com,
 sean@poorly.run, dmitry.baryshkov@linaro.org, tzimmermann@suse.de,
 mripard@kernel.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 freedreno@lists.freedesktop.org, marijn.suijten@somainline.org,
 robdclark@gmail.com, conor+dt@kernel.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, devicetree@vger.kernel.org,
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Add SM7150 MDSS
Message-ID: <20240612132003.GA1934293-robh@kernel.org>
References: <20240611223743.113223-1-danila@jiaxyga.com>
 <20240611223743.113223-2-danila@jiaxyga.com>
 <171815244421.3448243.12009673117592867975.robh@kernel.org>
 <727417e8-781c-435c-8abd-f3dfe6b0e5bb@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <727417e8-781c-435c-8abd-f3dfe6b0e5bb@jiaxyga.com>
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

On Wed, Jun 12, 2024 at 09:19:35AM +0300, Danila Tikhonov wrote:
> On 6/12/24 03:34, Rob Herring (Arm) wrote:
> > On Wed, 12 Jun 2024 01:37:40 +0300, Danila Tikhonov wrote:
> > > Document the MDSS hardware found on the Qualcomm SM7150 platform.
> > > 
> > > Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> > > ---
> > >   .../display/msm/qcom,sm7150-mdss.yaml         | 460 ++++++++++++++++++
> > >   1 file changed, 460 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
> > > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.example.dts:25:18: fatal error: dt-bindings/clock/qcom,sm7150-dispcc.h: No such file or directory
> >     25 |         #include <dt-bindings/clock/qcom,sm7150-dispcc.h>
> >        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.example.dtb] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
> > make: *** [Makefile:240: __sub-make] Error 2
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240611223743.113223-2-danila@jiaxyga.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.
> > 
> 
> Yes, this happened because I forgot to add note (same for both dtbindings):
> Depends on commit ca3a91063acc (dt-bindings: clock: qcom: Add SM7150 DISPCC
> clocks)

So then this can't be merged as I imagine that is in a different tree. 
Maybe you want to not use the header for the example.

Rob
