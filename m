Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3DAA4210C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9CD10E3FF;
	Mon, 24 Feb 2025 13:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iF3FLRXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E32C10E04E;
 Sun, 23 Feb 2025 20:29:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 248605C64AE;
 Sun, 23 Feb 2025 20:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCF9C4CEDD;
 Sun, 23 Feb 2025 20:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740342543;
 bh=n4NWWAUXEdT0YGj4Aiq2nVtrLD+1ywCK9QsELKjAkPA=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=iF3FLRXIwtp4T2Mrc28IqG9radah4rcXuDw8jWPJ5stZ1RqEbhlM1DwR5McIjSabZ
 VnqNvJaXrmxh1IPK1QRtBZYepZd/q4kt5Qhs/Eb3Bjw8hPuh+tNJ6c5p/+6kJTlPuF
 hDw5qCFERLC3zo4nQPHGRwmG5gVjICiVjF3sYbihO99NyxMa3O12/eNlv4j5dWBuzF
 0XwH/Y9FmdlSGdtANBBoc+nANUcxa1rv3FvHQEt4zn6V/S9nGDV/KklY9ZcGpUubTS
 2O9a1d7sbik66eeIvpXvXRzVWo0vgcdvudFv/WJ7C2JAy24V3vYgd7EKxoLDdiU+qj
 ELJmu770IhaDg==
Date: Sun, 23 Feb 2025 14:29:01 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>, 
 linux-gpio@vger.kernel.org, Will Deacon <will@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Rob Clark <robdclark@gmail.com>, Lee Jones <lee@kernel.org>, 
 Sean Paul <sean@poorly.run>, Stephen Boyd <sboyd@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Robin Murphy <robin.murphy@arm.com>, linux-clk@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, iommu@lists.linux.dev, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, freedreno@lists.freedesktop.org, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephan Gerhold <stephan@gerhold.net>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250223-msm8937-v2-4-b99722363ed3@mainlining.org>
References: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
 <20250223-msm8937-v2-4-b99722363ed3@mainlining.org>
Message-Id: <174034253782.156239.3219626417590856183.robh@kernel.org>
Subject: Re: [PATCH v2 4/8] dt-bindings: iommu: qcom,iommu: Add MSM8937
 IOMMU to SMMUv1 compatibles
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


On Sun, 23 Feb 2025 19:57:49 +0100, Barnabás Czémán wrote:
> Add MSM8937 compatible string with "qcom,msm-iommu-v1" as fallback
> for the MSM8937 IOMMU which is compatible with Qualcomm's secure
> fw "SMMU v1" implementation.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250223-msm8937-v2-4-b99722363ed3@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

