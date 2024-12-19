Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F06919F87F3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 23:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC92510EE01;
	Thu, 19 Dec 2024 22:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fKw5uTiL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4BD10E4C1;
 Thu, 19 Dec 2024 22:37:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CB2C75C6924;
 Thu, 19 Dec 2024 22:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DFCC4CECE;
 Thu, 19 Dec 2024 22:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734647832;
 bh=v5hV4AcXGyzngmHLzfcNY3dZttHo/6M+Ma5Nsjria24=;
 h=From:Subject:Date:To:Cc:From;
 b=fKw5uTiLj5/xOqtpCdQEvbxCswysTb6fGxGd3jBT3XKFXEDToTO3JY7rsfbfTE4pi
 hs6krl1LuYqc9/ffLHjbfyL9Prpa6bJs7Bvadbgd4I1MklLBtEAXv7IRm4RWsnb+xP
 3eu6+xoz+xo8WqGAmdWAJKXsoik0wy+q8FRdo6XZX7Sc01PG7dPEEGvPzy9UPbnG9C
 YmBn1S1w8Hll4HOQZUClNzXKXbvEYBNZrtz9dDbrobmBoFdL4g44HKRr43csm0bmXy
 mRhqnLT6cwpPVp16T8RdyYY//a2HLY3Iu0VfdMzNzKMS6qYdMXVtMRCPD3jhANjWp2
 FsrMA7nPTM9RQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/2] Print GMU version at boot on >A630
Date: Thu, 19 Dec 2024 23:36:54 +0100
Message-Id: <20241219-topic-gmu_fw_ver-v1-0-d403a70052d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAagZGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0NL3ZL8gsxk3fTc0vi08viy1CJdMwPLVIskCzNzCwMjJaC2gqLUtMw
 KsJHRsbW1AAwvlU1iAAAA
X-Change-ID: 20241219-topic-gmu_fw_ver-609e8b867802
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734647828; l=747;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=v5hV4AcXGyzngmHLzfcNY3dZttHo/6M+Ma5Nsjria24=;
 b=C6vOiblShlvGe2gARR+WhlpSno5NovLTuEY8kb7WEXR/FbLJcVGteu2UgmXqnGTQctVdgakH3
 Pq0xODxI4otBfH6YfncXhiZigTP7ZlL7tN1LUr5/Bue2n07wEMkKInG
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
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

Might come in useful to try and track down otherwise inexplicable
failures in e.g. old CI logs. A630 uses a different mechanism that is
not implemented in this series.

Tested on 8280 and X1

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (2):
      drm/msm: registers: Add GMU FW version register
      drm/msm/a6xx: Print GMU core firmware version at boot

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 7 +++++++
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 5 +++++
 2 files changed, 12 insertions(+)
---
base-commit: 8503810115fbff903f626adc0788daa048302bc0
change-id: 20241219-topic-gmu_fw_ver-609e8b867802

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

