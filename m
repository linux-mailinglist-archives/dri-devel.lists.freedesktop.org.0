Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040CDA61B51
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 21:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F2A10E0AA;
	Fri, 14 Mar 2025 20:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P1c3GE/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B348E10E040;
 Fri, 14 Mar 2025 20:01:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D029B5C55F4;
 Fri, 14 Mar 2025 19:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B901C4CEE9;
 Fri, 14 Mar 2025 20:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741982498;
 bh=4xBcotl8pJzTMj0Jsqp+amff/4VTyaDG9wXsvY9BiZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P1c3GE/FQ9nXFVg3ofquunNAv8v8Z1dnYhayTCgabuO1r41J4KWwMdFoA0QSYAiHK
 SX/PeItHN+7dDErarMX7psDTJiIdwS3UCKZ0/XegDlhZcvfCOkEdlooAqthnwA7aHM
 QSqwk3YeyF6zkwaxpzzhiR4bG63eMfHxilFcdL0/vu6Ze14l3FPOArkCRk+tdyvAfa
 55ngKn3tUiFMjIqOF2REexYoP82GHKRhtwKvAYpY2qP/YkQ/7qNB7rrFPPgDKEYO7V
 anAps1UeQOIVkz/DfrP6cgTsY7aDpfCfleM+Mab4JQtYY935tNyiU1UL1+pHmAkLgy
 uzSe9zpTIk2xA==
From: Bjorn Andersson <andersson@kernel.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <rfoss@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 00/11] Various dt-bindings fixes
Date: Fri, 14 Mar 2025 15:00:52 -0500
Message-ID: <174198247894.1604753.10471572024781965640.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
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


On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
> A set of not quite related bindings warnings fixes.
> 
> 

Applied, thanks!

[05/11] arm64: dts: qcom: sdx75: Fix up the USB interrupt description
        commit: 6810ecd57eb4ba9e09bac851d5b9d56c5e5acc1a
[06/11] arm64: dts: qcom: sdx75: Rename AOSS_QMP to power-management
        commit: a3715ce8650928e2da7060957a7e9b962d8bb7be
[07/11] arm64: dts: qcom: qcs615: Rename AOSS_QMP to power-management
        commit: bc09537f4745aae561f56daad0353d1b876bc096
[08/11] arm64: dts: qcom: sc8180x: Rename AOSS_QMP to power-management
        commit: 9ea77c65b7b0357c54899a24ffd37d0430c90913
[09/11] arm64: dts: qcom: x1e80100-dell-xps13-9345: Drop clock-names from PS8830
        commit: 6d617082867d4789ea4dcc67fc483460e2ac1d05
[10/11] arm64: dts: qcom: x1e80100-romulus: Drop clock-names from PS8830
        commit: 57aac7bd091cd7a1f43c852ce3703ce6c2433b21
[11/11] arm64: dts: qcom: x1e001de-devkit: Drop clock-names from PS8830
        commit: 8cd4b0f6bc71b2bf4f5c3fb8ec2857192182cb23

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
