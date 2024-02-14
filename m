Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A2385560A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 23:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56EC10E248;
	Wed, 14 Feb 2024 22:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="km3p9V3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19FB10E241;
 Wed, 14 Feb 2024 22:36:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D14ABCE23CB;
 Wed, 14 Feb 2024 22:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE028C43390;
 Wed, 14 Feb 2024 22:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707950179;
 bh=HCthTh2EHFiykooSADJUqIjdFXj2miq8U9qp/oonkpU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=km3p9V3noxQ1ZIql9oPAAJNkN82df2B+dTnOlCaozOme/mIueOuFFLUlOjaQcpHan
 gZwam76ZriDpwAbvAc37Ttc0K2BBYpZVGDyrXm+/AHylMuLHB/ZuywqVWPhAjNxUhA
 jYDoxAeOBjD0FrlYRHfvpiaQjfImiOlDOw3VIbQFqZ1954BLeDlq8JV2NUsGN3dC/Y
 ihhRfkLqG77zNIKQV4fpvj2MNyEK7YUtt4u90FqXmgSn4pUAZPfGkIxieojLMNO8/M
 h3CUoZJW84MCqw9D09tC/xdIXEJXLA53BOeccE4Vzety2hN6OblSpvsLIZfQf3QzTp
 MQS9HrwvpULEA==
Date: Wed, 14 Feb 2024 16:36:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20240214-x1e80100-display-v2-2-cf05ba887453@linaro.org>
References: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
 <20240214-x1e80100-display-v2-2-cf05ba887453@linaro.org>
Message-Id: <170795017402.2201397.8209800287591911549.robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: display/msm: Document the DPU for
 X1E80100
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


On Wed, 14 Feb 2024 23:24:31 +0200, Abel Vesa wrote:
> Document the DPU for Qualcomm X1E80100 platform in the SM8650 schema, as
> they are similar.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240214-x1e80100-display-v2-2-cf05ba887453@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

