Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE729F4E4C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DBA10E9B4;
	Tue, 17 Dec 2024 14:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mlgO+lvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C0710E9AC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:51:23 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361a50e337so37994175e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734447082; x=1735051882; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7GbXDl8LUFfVMAPVd1mF5EDk6hx6b9at0dYoXeRYVRY=;
 b=mlgO+lvFa+WwnoJGpzWp0DampbxMcgQtun8tpPOibiBAooGPQFyzlo91RJTNFh0Qxv
 twWZBvLPoVHnFpzoCIOfGfmZrM7CvT7Pdm3lEcgEQtDI/HcRg5fWWZUMADG+417/TGNb
 kaBFmjCgf1m5n7G01BeGISTlJTvm8y6Xj0AHNscytvPAcfArG5In7HO2sPTudUXccKkb
 XBOlJ8YsBW/1kfiAsdQaExzxFxfbG8bY+jKztiUKMs1GQI2Xsc3mx8vo4BQNlJzSUgIO
 O7d4RH5dBBE/9u8Vxs2cgey19tAwiWGaup/Pah6AEwuSwh7bFbCpAwDd0LTI4f+Sbtqv
 MmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734447082; x=1735051882;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7GbXDl8LUFfVMAPVd1mF5EDk6hx6b9at0dYoXeRYVRY=;
 b=dzjEa6Y68As9LhSt9wGGH85jvGlh7gSTpNpf2Z6piJACYtEQyJWNlKaOzv37JkGxpf
 erVK5jHYC4rpyIU5PBxPuF/8nvEschmxaCUBOfTpERzIDW71o5yOBe5G0XByvVf+VCwi
 i/7G1hN9UPOIeW6llTQ9VOgCEdRv2i8pau0jtIH2YlTX10+Z+rSMBEEwCEUCLhc15b7g
 hAgUmWE5MdImF1dUyVl9I5Zu+1u4FPulmQ1sODwT/dxEWOGU2AUv8s6VvQ8BbbBXT+7t
 RZaPosD7XG2kqzB0BMe10c0SD0hUoUMdo/9v4Jum/vXYU8Pz6iKyvav3JL7U+Lcqwfg0
 50Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCZZ7xPThxUnNLyh/b4hAoQGEnMnkzz8t5qQKp+yJsvEh2JyiGS58HIgdwbVNf6VVqut17S3NX22o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIrY1CD4hFGQOxZdgRwqpdO/FGG0ni2q32M3sc/6+jIox87urw
 BXx1q0EAwBKiG+r4LfBm0CKLrpskAtPA4Z4NSEF8GqVjwUoLMuFZt9yN75zucWE=
X-Gm-Gg: ASbGncvobt149Obo+hm9n5tyahdSeA45Eh5n2YpdbsLQBfRQ5GgU2WGXoL4jrbqi6Os
 higMOyVFNgTHw5T1S4hOj7THD9X01+SfgfkPPbn2yZrV1C4F0GC98VSZV1OARusGWY4cLkngZ7l
 VY/MDDt86fVJFgQPsuVVWF1+3ramBxGGIe7I32/GQ/JpaOQMdeJ3j8dptf3UU9vScLSIIkPvOWe
 fU6eY7hN3EspIvFxvFo9C60k3UMF9SjgQTKHjxRpXrD7XMwhlSzUXm11bHa4SW5VIIe/jxeGAfJ
 rQ==
X-Google-Smtp-Source: AGHT+IEyF5JqI6dc+Cr21DWt8VokNuhVRMBamyPiTK82TkRe5pggjl0Bdb/QStuHXSlZxBNPFJKn5w==
X-Received: by 2002:a05:6000:4609:b0:386:39fd:5ec with SMTP id
 ffacd0b85a97d-3888e0c15c4mr15483460f8f.57.1734447081862; 
 Tue, 17 Dec 2024 06:51:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43636066f51sm118417375e9.22.2024.12.17.06.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 06:51:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 0/7] drm/msm: adreno: add support for DDR bandwidth
 scaling via GMU
Date: Tue, 17 Dec 2024 15:51:13 +0100
Message-Id: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGPYWcC/43OzU7EIBDA8VfZcBbD8FFgT76H8VDK0CXR0kDFN
 Zu+u+xerGnSePxPMr+ZGymYIxZyPt1IxhpLTFOL7ulEhks/jUijb0044xIABF3SHAdaPsxVMTr
 On9R90ZoWpEEh4zyg7qUmbX3OGOL1Qb++tb7EsqT8/bhU4T79B1qBMiqc8cJqoXvrXt7j1Of0n
 PJI7mrlW8keSLxJ0qMz2iGX1uwksZG4OZBEkwz4jg3AgtNiJ8lfiTN1IMkm2U4xD8p7KdROUhs
 J4EBSTera38EGbRQOf6R1XX8ALnjF2ukBAAA=
X-Change-ID: 20241113-topic-sm8x50-gpu-bw-vote-f5e022fe7a47
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5493;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=iHt3DEjYJD2zOnsRwBQshG58EadYS/b9sYswjmBDDMw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnYY/llNmmQRE9gWmT3Sf9PjuPLNbFu7nIZyMikhrn
 tYoF82WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ2GP5QAKCRB33NvayMhJ0YmuD/
 9aO6EoLCqbEdjiWk6zYW1kupo75uv6TYWpJqij3EMM2ArBBu9qawT5pOE12zccFx5dYkcVMrLL5SOA
 aZd0nufQWdWa3+DwWj5KAnA2i0mxj0arqT8u4kv4bVzPq5R6OpSzbYrM3p6AUW2ZeEFAIy0F3/6DVw
 Wr0jd/Z0flQfD8AL9uj3bWhc2mLj5LTKHIwILXO+zRjSf0CoCl5a2ivMwE17Syhs6unKbfpEGa7dHn
 cAMruEIdMKAp/64GwW74gM0birB2Q6GwMQaZOGBBXM921HKrkwJa+RAZFr1VPhYmrRBrsLsIQ1a3bm
 A7gKem3kZotb8/GK5MAUc2A5AJhb8LGpplnMi+Wh2u9P3MhefUy3TMY4barOxnpLIRNNY2vql5eIw/
 EfBfK1IB1Ohi0JpJxALuqnqbtcFv76QAWJbfe7TAHzzgj7XJCnjNejkXBXC8O7oAYgE4cE/ap50PFK
 GoyGYBD9yhzV50bnPVOK0MmE4AtysOPmSK8HoeFxeuaAKn2EtrcwpMaOHb37Dmc6OBomfjvL0nkvAT
 hGHMv4mQMxfdl0NUM9tSEAS//ov9JtfzkU40clRLcXlAMyDQU5qb5z5/pXZg9QQB3fBYxPH4HL6yT8
 Slt4QONpZAXEY6LMJHKJj1x7qTY3gkTRyZB/q0StQWOaj5+AZOx2CTvopAZg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Adreno GPU Management Unit (GMU) can also vote for DDR Bandwidth
along the Frequency and Power Domain level, but by default we leave the
OPP core scale the interconnect ddr path.

While scaling the interconnect path was sufficient, newer GPUs
like the A750 requires specific vote parameters and bandwidth to
achieve full functionnality.

In order to get the vote values to be used by the GPU Management
Unit (GMU), we need to parse all the possible OPP Bandwidths and
create a vote value to be send to the appropriate Bus Control
Modules (BCMs) declared in the GPU info struct.
The added dev_pm_opp_get_bw() is used in this case.

The vote array will then be used to dynamically generate the GMU
bw_table sent during the GMU power-up.

Those entries will then be used by passing the appropriate
bandwidth level when voting for a GPU frequency.

This will make sure all resources are equally voted for a
same OPP, whatever decision is done by the GMU, it will
ensure all resources votes are synchronized.

Depends on [1] to avoid crashing when getting OPP bandwidths.

[1] https://lore.kernel.org/all/20241203-topic-opp-fix-assert-index-check-v3-0-1d4f6f763138@linaro.org/

Ran full vulkan-cts-1.3.7.3-0-gd71a36db16d98313c431829432a136dbda692a08 with mesa 25.0.0+git3ecf2a0518 on:
- QRD8550
- QRD8650
- HDK8650

Any feedback is welcome.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v6:
- Account for A6xx in a6xx_gmu_rpmh_bw_votes_init():
  - always vote the perfmode bit on a6xx
  - only vote X & Y on A7xx
- Only AB vote starting from A750
- Cleanup a6xx_gmu_rpmh_bw_votes_init()
  - drop useless tests
  - add local const struct a6xx_bcm to avoid &info->bcms[bcm_index]
  - remove useless ULL to 1000ULL
  - add an error if cmd_db_read_aux_data() returns count==0
- Link to v5: https://lore.kernel.org/r/20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org

Changes in v5:
- Dropped bogus qcom,icc.h flags
- Properly calculate _wait_bitmask from votes
- Switch DT to qcom,bus-freq values from downstream
- Added review tags
- Link to v4: https://lore.kernel.org/r/20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org

Changes in v4:
- Collected review tags
- Dropped bcm_div() and switched to clamp() instead
- Dropped pre-calculation of AB votes
- Instead calculate a 25% floor vote in a6xx_gmu_set_freq() as recommended
- Use QCOM_ICC_TAG_ALWAYS in DT
- Made a740_generate_bw_table() generic, using defines to fill the table
- Link to v3: https://lore.kernel.org/r/20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org

Changes in v3:
- I didn't take Dmitry's review tags since I significantly changed the patches
- Dropped applied OPP change
- Dropped QUIRK/FEATURE addition/rename in favor of checking the a6xx_info->bcms pointer
- Switch a6xx_info->bcms to a pointer, so it can be easy to share the table
- Generate AB votes in advance, the voting was wrong in v2 we need to quantitiwe each bandwidth value
- Do not vote via GMU is there's only the OFF vote because DT doesn't have the right properties
- Added defines for the a6xx_gmu freqs tables to not have magic 16 and 4 values
- Renamed gpu_bw_votes to gpu_ib_votes to match the downstream naming
- Changed the parameters of a6xx_hfi_set_freq() to u32 to match the data type we pass
- Drop "request for maximum bus bandwidth usage" and merge it in previous changes
- Link to v2: https://lore.kernel.org/r/20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org

Changes in v2:
- opp: rename to dev_pm_opp_get_bw, fix commit message and kerneldoc
- remove quirks that are features and move them to a dedicated .features bitfield
- get icc bcm kerneldoc, and simplify/cleanup a6xx_gmu_rpmh_bw_votes_init()
  - no more copies of data
  - take calculations from icc-rpmh/bcm-voter
  - move into a single cleaner function
- fix a6xx_gmu_set_freq() but not calling dev_pm_opp_set_opp() if !bw_index
- also vote for maximum bus bandwidth usage (AB)
- overall fix typos in commit messages
- Link to v1: https://lore.kernel.org/r/20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org

---
Neil Armstrong (7):
      drm/msm: adreno: add defines for gpu & gmu frequency table sizes
      drm/msm: adreno: add plumbing to generate bandwidth vote table for GMU
      drm/msm: adreno: dynamically generate GMU bw table
      drm/msm: adreno: find bandwidth index of OPP and set it along freq index
      drm/msm: adreno: enable GMU bandwidth for A740 and A750
      arm64: qcom: dts: sm8550: add interconnect and opp-peak-kBps for GPU
      arm64: qcom: dts: sm8650: add interconnect and opp-peak-kBps for GPU

 arch/arm64/boot/dts/qcom/sm8550.dtsi      |  13 +++
 arch/arm64/boot/dts/qcom/sm8650.dtsi      |  15 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  22 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 186 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  26 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c     |  54 ++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h     |   5 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 +
 9 files changed, 316 insertions(+), 11 deletions(-)
---
base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
change-id: 20241113-topic-sm8x50-gpu-bw-vote-f5e022fe7a47

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

