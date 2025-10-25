Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425CBC09791
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 18:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E78110E323;
	Sat, 25 Oct 2025 16:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ujsxSkzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B8510E323;
 Sat, 25 Oct 2025 16:28:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D788450CA;
 Sat, 25 Oct 2025 16:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1826C4CEFF;
 Sat, 25 Oct 2025 16:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409736;
 bh=vw8g2Kori7LsPn9dAOsxwkFOC383lL0e9VbHkDwlF1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ujsxSkzfeLTodWgvBNNLDf0mnN17ipJZvpobqQ4SAHKt2tb0wyFAyrafLPH8UYjQK
 7f7OEhSWbWfPFs509Ppy/qUJd2Lu80Mdlbd6WCVBV9G9Yi5004m9d8RNsUtxmBhb77
 DbW8W3+4mCTGdltDGo4SNQjO7/bM1SbwuTbu8nFd7jfJ55+ni9YDMeRHoD4Lebx3Na
 ufb+nT5ADp8ALTmPUDP7Z6Ht6BeZTT4dzI3yZysjkN1TQnEBsBbmMR4SUkW0xrXLFA
 S1N1QXUD80GCCxFlci6WvLCKRMf1fpq7DuXizYwJzYprqKOclZ5/KFy4Uv17jiJpAG
 4bC3+h7ms2KPw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] drm/msm/adreno: Add speedbin data for A623 GPU
Date: Sat, 25 Oct 2025 12:01:13 -0400
Message-ID: <20251025160905.3857885-442-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
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

From: Akhil P Oommen <akhilpo@oss.qualcomm.com>

[ Upstream commit 0584da4515dbb4fec69107ce837eef36a7be5d7d ]

Add the speedbin mappings for Adreno 623 GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/672462/
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Rationale
- What changed: Adds speedbin-to-bin mappings for Adreno 623 so the
  driver can correctly gate OPPs based on fuse value:
  - A623 entry: drivers/gpu/drm/msm/adreno/a6xx_catalog.c:889
  - New mapping: drivers/gpu/drm/msm/adreno/a6xx_catalog.c:916
    - { 0, 0 }, { 185, 0 }, { 127, 1 }
- Why it matters: The a6xx driver reads the GPU’s speed-bin fuse and
  filters usable OPPs accordingly. Without a mapping, the code falls
  back to BIT(0), which can enable OPPs meant only for faster bins on
  slower-binned parts (risking instability or rendering faults):
  - Fuse read: drivers/gpu/drm/msm/adreno/adreno_gpu.c:1173
  - Mapping lookup and fallback:
    - fuse_to_supp_hw() uses info->speedbins:
      drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2485
    - If no mapping, logs error and defaults to BIT(0):
      drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2514,
      drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2520
- Device-tree evidence (A623-class SoC) shows higher OPPs are explicitly
  restricted to bin 0, making correct speedbin mapping essential:
  - NVMEM speed_bin: arch/arm64/boot/dts/qcom/qcs8300.dtsi:4316
  - OPP table: arch/arm64/boot/dts/qcom/qcs8300.dtsi:4324
    - Top OPPs only for BIT(0):
      arch/arm64/boot/dts/qcom/qcs8300.dtsi:4331,
      arch/arm64/boot/dts/qcom/qcs8300.dtsi:4338
    - Lower OPPs for BIT(0)|BIT(1):
      arch/arm64/boot/dts/qcom/qcs8300.dtsi:4345,
      arch/arm64/boot/dts/qcom/qcs8300.dtsi:4352
  - Without this patch, slower-binned A623 parts would be misidentified
    as bin 0 and incorrectly allowed to use these top OPPs.
- Stable backport fit:
  - Bug fix: Correctly enforces hardware-supported OPPs based on fuses
    for A623, preventing potential over-frequency/undervoltage
    conditions on slower bins.
  - Small and contained: Adds a data table entry; no API or
    architectural change.
  - Low regression risk: Aligns A623 with how other a6xx GPUs already
    use speedbins; expected outcome is correct OPP gating (performance
    might decrease on mis-binned systems, but that is the intended fix).
  - Touches a single DRM/msm driver file; no core kernel impact.
  - No new features; strictly correctness and reliability for existing
    hardware support.

Conclusion
- This is a clear, low-risk correctness fix for A623 platforms and
  should be backported to stable trees that include A623 support.

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 2b1c41f6cfeee..3c82b3f320e3a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -913,6 +913,11 @@ static const struct adreno_info a6xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 185, 0 },
+			{ 127, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x06030001,
-- 
2.51.0

