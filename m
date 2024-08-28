Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5FC962B2A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFACA10E565;
	Wed, 28 Aug 2024 15:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U1XMF6An";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4A810E564;
 Wed, 28 Aug 2024 15:07:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E1AFACE187D;
 Wed, 28 Aug 2024 15:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A00C4CEC1;
 Wed, 28 Aug 2024 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724857630;
 bh=Y/T51qG5H9yIxtDfRozOi8msshjZ7I3edVl1HlTN04Q=;
 h=From:Subject:Date:To:Cc:From;
 b=U1XMF6AnRX6lN1XO8k2+y4BYmXzcewRljhgmwEI5ZNSsmdAQBF8+KY/MUT05+z57n
 J5jDipbg0+R8rdstgE7lcXI2iZOo2pgsSsQTGD3SFWzOnGaQYZeiEecwJ9Y+U0BC6V
 ls6pGbwqbAUZFdzErKEoF+ch8g/Apwl9Kk2OaGPtKtqtwAgcypBZF5ePShlWImn+TB
 CogqibmbjbhonX20OIhU0cKMdIj7hyhMMmuYqe8rWTA/qXCJpX2upSSoAVVbnl6Iwe
 GPzhMsIdLVLJVuDv6GRF1mZcrZtDrhL1vH6h02TpyWTBOUkdr9ZBIFe2BKvhD56rYE
 3wuxm9Rd0NcdQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/6] A621 support
Date: Wed, 28 Aug 2024 17:06:53 +0200
Message-Id: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA09z2YC/23MQQ6DIBCF4auYWZcGEIq66j0aF0gHnaQRA4a0M
 dy91HWX/0ved0DCSJhgaA6ImClRWGvISwNuseuMjJ61QXKpuBE928NGjtmbFGzS2LXe9JPyBup
 hi+jpfWKPsfZCaQ/xc9pZ/Na/TBaMs05zi7rlxnl1f9FqY7iGOMNYSvkCxw/2VaUAAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724857626; l=1221;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=Y/T51qG5H9yIxtDfRozOi8msshjZ7I3edVl1HlTN04Q=;
 b=V5k3zIxDNNV7Xvipbj8sgjaMITiUh2cdnRDVFJfMJtmyWATqqntlFpJgmhTzGJ1qfsKt3lpEM
 M4VQdNWBVqBBA/2KvTDgkJRdnpdbPMqgjSMBwZVMRfxnzdiJ0fxudsh
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

Baby A650, needs mesa mr !30253 (or better)

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Split up the gmu_cgc_mode patches more sensibly and write better
  commit messages
- Link to v1: https://lore.kernel.org/r/20240719-topic-a621-v1-0-850ae5307cf4@linaro.org

---
Konrad Dybcio (6):
      drm/msm/a6xx: Evaluate adreno_is_a650_family in pdc_in_aop check
      drm/msm/a6xx: Store primFifoThreshold in struct a6xx_info
      drm/msm/a6xx: Store correct gmu_cgc_mode in struct a6xx_info
      drm/msm/a6xx: Use the per-GPU value for gmu_cgc_mode
      drm/msm/a6xx: Set GMU CGC properties on a6xx too
      drm/msm/a6xx: Add A621 support

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 111 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  21 +++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  52 ++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   2 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  13 +++-
 5 files changed, 164 insertions(+), 35 deletions(-)
---
base-commit: 1019b7d66e8c015b2497edb64e6a2a5fd9d2aa24
change-id: 20240719-topic-a621-b5e83f79b4f7

Best regards,
-- 
Konrad Dybcio <konradybcio@kernel.org>

