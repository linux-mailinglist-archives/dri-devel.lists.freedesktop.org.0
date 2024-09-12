Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0FF97647C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 10:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048D310EB0A;
	Thu, 12 Sep 2024 08:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DMQSB9fP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF03810E212;
 Thu, 12 Sep 2024 08:29:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 28DDE5C5A22;
 Thu, 12 Sep 2024 08:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE8FC4CECC;
 Thu, 12 Sep 2024 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726129791;
 bh=eAUIlyp5qcM+w+YA1LphnKTG2D4G9lYzmAurJarHO5M=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=DMQSB9fPLxf8PIfjzcs5vllUIlSpcMxGXXdNF8+gVAg00HzoFWR4/hthDP9n3U5t6
 C8N1feL+6JScojQrfFgN2dWzs9ZeaH9GoMlwHJI0TZXoAzj3uC8xQOE5oklCscNEyt
 JHMX/HmDqnCI249/4+vM74YjnvhvUK3hITa1AAS0RqWmV6GXJTBQaKYy1ScSOPiFL5
 IDweBsuotpYbDhhrGJSATuaIfbes33+6OYJT+Dk6Mf0Uzxa2jj25e9jsIh7C9K9Pou
 K3sYUyjCfk2bTnq74Y4TarAobEoj0BTsrKDGSPhHfG2Q7yrvWXzVM3FcWV8BGI8Zkm
 sVjAC1K5S44ng==
Date: Thu, 12 Sep 2024 03:29:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
 conor+dt@kernel.org, swboyd@chromium.org, bigfoot@classfun.cn, 
 devicetree@vger.kernel.org, airlied@gmail.com, konrad.dybcio@linaro.org, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, 
 freedreno@lists.freedesktop.org, quic_jmadiset@quicinc.com, 
 quic_vpolimer@quicinc.com, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, quic_kalyant@quicinc.com, sean@poorly.run, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, andersson@kernel.org, 
 danila@jiaxyga.com, daniel@ffwll.ch, robdclark@gmail.com, 
 dmitry.baryshkov@linaro.org, maarten.lankhorst@linux.intel.com, 
 marijn.suijten@somainline.org, mripard@kernel.org, tzimmermann@suse.de
In-Reply-To: <20240912071437.1708969-3-quic_mahap@quicinc.com>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-3-quic_mahap@quicinc.com>
Message-Id: <172612978829.2592275.5038712419296813855.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: Document the DPU for SA8775P
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


On Thu, 12 Sep 2024 12:44:34 +0530, Mahadevan wrote:
> Document the DPU for Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  .../display/msm/qcom,sa8775p-dpu.yaml         | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240912071437.1708969-3-quic_mahap@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

