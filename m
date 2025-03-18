Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2715DA66CF0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 08:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8B210E44F;
	Tue, 18 Mar 2025 07:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eyTu0yHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5922D10E44B;
 Tue, 18 Mar 2025 07:56:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DDAE8A48D26;
 Tue, 18 Mar 2025 07:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D20C4CEDD;
 Tue, 18 Mar 2025 07:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742284609;
 bh=PYexzvxuekgqLHatZlFwTRRdX07yMrz0UyQigczwDJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eyTu0yHpjLaLbKHHy1oBYw211KKL360J3Zo8yI7ETyJaJBKbn+Vs1enJVqm2EYwMh
 NbRu3/jX1Neqtgl+/2MSX/yl/jcqAPI6bXks684f9G2NCQJKW3gyQYi02deDaLuNcE
 N6dzclk1qoT0eo0efN1Qeo+MqlmCGGPQZpQpHI/ujmfBwF3IKWGLKZf/n70JiCAXzd
 DmgEiR22g6ai2EC4hjqxudQR+SrcMyzQhxdZXJO4CGLuqkhyRpZJH0IxanUVe3P1rA
 NSmerndGOAvd2/KJVD+SDW2e0VGHcVLn9nFPSf4NuOm5WyDncQKkaPCT90toW4pjQ7
 06FIxy+InJqVw==
Date: Tue, 18 Mar 2025 08:56:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Kumar Gala <galak@codeaurora.org>, 
 Andy Gross <agross@codeaurora.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, 
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/9] dt-bindings: soc: qcom: add Smart Peripheral System
 Interrupt Controller
Message-ID: <20250318-dandelion-aardwolf-of-radiance-695fd9@krzk-bin>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-3-655c52e2ad97@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317-fix-nexus-4-v1-3-655c52e2ad97@oss.qualcomm.com>
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

On Mon, Mar 17, 2025 at 07:44:38PM +0200, Dmitry Baryshkov wrote:
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sps-sic.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,sps-sic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Smart Peripheral System Interrupt Controller

Interrupt controller should have interrupt-cells. Or this is not
interrupt controller...

Anyway same comments as for previous patch.

Best regards,
Krzysztof

