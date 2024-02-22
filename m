Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB1A860061
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6499D10E9E6;
	Thu, 22 Feb 2024 18:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hmO+2am9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F414C10E9E4;
 Thu, 22 Feb 2024 18:07:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4A36C619A5;
 Thu, 22 Feb 2024 18:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56E2C43390;
 Thu, 22 Feb 2024 18:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708625225;
 bh=ZtNhYpZN7rqPE9bUe0k8mpZXmH6Y6GMI25YBDA2i5Aw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hmO+2am9MHLbtPB3UvcT421hW55I4NzSmdJKNRlpbEEeFchi48eKfBYTj3XRmMBAg
 bSBL+BphdA3zplWNs4th5WheQvwHQuEa2Rc0jZZb40+RgADhdRQMtFfhyDffSUsHBl
 Wey+6FFHszS0p2VXI44nqQIbNjmUWSraIx0+gX6kMnnfZFSBfUmMjBXoXxIOeAbziY
 Kq5PRC3Afd1boEMP78FK1RGbhcPzqWvwz5By3iUVW34ceq7ncanStz+PFMRgbvYhUN
 ms9vrxkpBgCeYeI8SKTRXSf19aY3o8U1SXXuvTwaHQbmahgKjcXzzlZJ2MJS4KOk0J
 OTK4j6x55QrjQ==
From: Will Deacon <will@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/7] drm/msm: Add support for the A750 GPU found on the
 SM8650 platform
Date: Thu, 22 Feb 2024 18:06:25 +0000
Message-Id: <170861684323.1924954.5000298340107956205.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
References: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 16 Feb 2024 12:03:47 +0100, Neil Armstrong wrote:
> Unlike the the very close A740 GPU on the SM8550 SoC, the A750 GPU
> doesn't have an HWCFG block but a separate register set.
> 
> The missing registers are added in the a6xx.xml.h file that would
> require a subsequent sync and the non-existent hwcfg is handled
> in a6xx_set_hwcg().
> 
> [...]

Applied SMMU binding changes to will (for-joerg/arm-smmu/bindings), thanks!

[2/7] dt-bindings: arm-smmu: Fix SM8[45]50 GPU SMMU 'if' condition
      https://git.kernel.org/will/c/2777781ca9b6
[3/7] dt-bindings: arm-smmu: Document SM8650 GPU SMMU
      https://git.kernel.org/will/c/8a05f74d567a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
