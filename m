Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D93CA41438
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 04:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5809010E131;
	Mon, 24 Feb 2025 03:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VQfan/Iv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B14110E10B;
 Mon, 24 Feb 2025 03:45:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A1BEB5C1D0D;
 Mon, 24 Feb 2025 03:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB64FC4CEEA;
 Mon, 24 Feb 2025 03:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740368746;
 bh=qUFe4UpqBfFhFksfcMUFZKdum1MPLs1H5ZB+gO4zfFY=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=VQfan/Iv4Y9TzOMYqSNVSOsUCmtvnlwiK3HdxmznH6xj6G8HcNLH+41M3XIsuGBP6
 oG4xsCddQ53ccSIuco6whQ6gqaK09azWoX7fgWCO8sKXxARPieOVtwnue+iXiaXp9O
 XU0ALoPgI7BvYETedwjXQ/IB5ymMT9gRuFEa9AUGn+RGqH1msqmLDu0S/pdHqqYa04
 8v2WjYQO1aLtO+1U3/CtreGCdOG9tHd5e35TGmD0uQayFqXzR7FOiOy2tTVbB+KbRX
 6utsBGtAHCH7q1eOC5ak46c8biDkn7vc1jXaN6kgu6wSNSNtb2YkYfIeTPcLmyWkIc
 IpelMr2K567Pg==
Date: Sun, 23 Feb 2025 21:45:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-clk@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Adam Skladowski <a39.skl@gmail.com>, David Airlie <airlied@gmail.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>, 
 iommu@lists.linux.dev, freedreno@lists.freedesktop.org, 
 Stephen Boyd <sboyd@kernel.org>, Sean Paul <sean@poorly.run>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250224-msm8937-v3-5-dad7c182cccb@mainlining.org>
References: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
 <20250224-msm8937-v3-5-dad7c182cccb@mainlining.org>
Message-Id: <174036874131.769285.18190619820973305083.robh@kernel.org>
Subject: Re: [PATCH v3 5/8] dt-bindings: drm/msm/gpu: Document AON clock
 for A505/A506/A510
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


On Mon, 24 Feb 2025 02:56:20 +0100, Barnabás Czémán wrote:
> From: Adam Skladowski <a39.skl@gmail.com>
> 
> Adreno 505 (MSM8937), Adreno 506(MSM8953) and Adreno 510(MSM8976)
> require Always-on branch clock to be enabled, describe it.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> [reword commit, move alwayson on the first place]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250224-msm8937-v3-5-dad7c182cccb@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

