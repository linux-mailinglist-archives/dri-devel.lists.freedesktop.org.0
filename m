Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40489E5914
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 16:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DAD10EEA4;
	Thu,  5 Dec 2024 15:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TCBGQecn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2822510EEA4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 15:01:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4349fb56260so7089085e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 07:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733410878; x=1734015678; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tbWDMh1oOyUt0FdrCtOOr0ppw77dNgGcXJzOMWhRrgU=;
 b=TCBGQecn2aRzKnUw8CYzdtwUq7TyLgtoIvHBzsnLa4Mokp6x6QRmi9pSi5bQfy1Nek
 uarDFZhv1f4KGNg/LxFHaO1K8oBEp8XdcYXJBPTiB37nOhMPm0jYKg9S0JoUWsDS3N9X
 97hefNFF4P+mH0OxdD2ylSTgWn4OV9mmbnvh+fteeUIkBRXYlRuG20hSozTrLRgRdR2B
 J7HRV1VrKff6Q06FJAa7GwVAkpzoCvjCXHNPpGQz0STFMso9UYFum3/r1QVWP4glM6HH
 Tz49MiQxBOKslhEZfFy0xVlpGJdlHVgxLMdca5o4QoGIOKlKAKunVE3khhwErAWw93Jw
 tSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733410878; x=1734015678;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tbWDMh1oOyUt0FdrCtOOr0ppw77dNgGcXJzOMWhRrgU=;
 b=eu6e27NVatEkRIT+LjNT8obXWGdb/AuE7AozbohbmybCB/y9Jf4qFsn0X+OLxHQ/cx
 IJ+gnXEEkmkkHlAQjGPvXzGJA8gNI7TJYfIgwMrPP2Va6jBEsTeCwvwsF7pafRwIcNg4
 yaKoBf2eiBN6CvaUXSGtiaY3I6MEJT8gHEYiZMNpo7+o+JWg101mNW0JfYyDQcVvyG/L
 kB41DJcLffSVq8AWt1cCAtuygayd2HiIlB8gQe2vBhR3PGDcblsuFJgIx1wl/L5nWByM
 VPvejnG8Rvmp9GyDVUTVFHWdu+A5iiWpet1Y/c3g8/vuYuHkDpiQMMWCp1catAv0cbVZ
 SQHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo3kRoBM7Vc0qCrIh4Yojpwf3pEM3VnU5AJHY2OjqHDDUTOBwLOPC5KIfU1FOFpCEUZmnentk0Mb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcVWxhgd7nwJ8Lz9SzoulilqlL+WeF9DX0w3YflbsoTG1KvYQr
 uKiBkwGMkUjcyiy6TFTwh+UMCvelnaIJZ5UkPpo0f+eON2oRLYD1tN0ofcr4Das=
X-Gm-Gg: ASbGncsoFOpOX3NBXiIVv5D9nua/ThapmQ5Ic/SDgns22w+rnUNMpWyB4lNAL6YtT4E
 DdPqf6zwJOJ7uiRAHkCPiYR1rtycq4R1GjnvQByEgkU1rbS/FZIPhfovTREBMYgsNimTrwQR0UB
 mooxA2B5Xpg+0tqoEq1OPvuxeTLXmqPyQkV8nOSDvi4FROOPpg4n8W5yg0oJS3X8UD1uIGHamrC
 kfN93NjNaYCzo0K+B1Smvk0Y8d4spGVAHSwymbG7tWqeKpB2+mg4N0MH9FNJjAbyerrS0k=
X-Google-Smtp-Source: AGHT+IGhmRzBKdM9swwZgZIhKLM8LIVgc35epsroCYtGmEdGqZoyNJjXT65jo1zPO+hOdn8NoRrpXQ==
X-Received: by 2002:a05:600c:a03:b0:434:a923:9310 with SMTP id
 5b1f17b1804b1-434d09cf141mr95386425e9.15.1733410876246; 
 Thu, 05 Dec 2024 07:01:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52c0bc7sm62830795e9.35.2024.12.05.07.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 07:01:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/7] drm/msm: adreno: add support for DDR bandwidth
 scaling via GMU
Date: Thu, 05 Dec 2024 16:01:04 +0100
Message-Id: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADDAUWcC/43NTQ6CMBCG4auYrh3TP2xx5T2MCwoDNlFKWqwYw
 t0trDAmxOX7JfPMSAJ6i4GcdiPxGG2wrk0h9ztS3oq2QbBVasIpl4wxAb3rbAnhoYeMQtM9wbw
 guh6hzpByXqMqpCLpvPNY22GhL9fUNxt659/Lp8jm9Q80MqAgjK5EroQqcnO+27bw7uB8Q2Y18
 rWUb0g8SbJCo5VBLnP9I4mVxPWGJJKkWXWkJaO1UeJLmqbpA3vk/pxVAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4651;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=b1pKFZiTa/F6E8Dkp//xdfPfKGEfW16l02UZUYI5EXY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUcA3CO6vTLpJYs2HfLccENhknf2A1LzscxmXacWJ
 DSE4GaSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1HANwAKCRB33NvayMhJ0Ym2D/
 sGsBTqzQIxIkxjoTaZNHUXJu8Mr86SPSQQl31/btttbW3+YSds2lwaOFSMcEvEMhFwe6+OCmdouI7u
 Cw/VnAoXXrzhqfqSen6+xRVUwzNtA+r/pceTVli8XTxGwNht7XookQgx1HQevlrejPJQhTqxQKikP1
 b6i9472TF2UfqftjOgwE/bwW/zZlah0rLW1ChvmthJ08w6pdJWTur4u1cYizpV51hg90VUo3eFjKsi
 GxxCsPuRSI8NTbdb6022gm5IqsHnzB+qXp+k4rv9dDlnb1qulazMbJzYasD53rNxVHafJLhp5y7W+4
 kznWNdI5yELL90ljk4QoiruUN3U7Mkv6x2+cKNjy2d/0VqHVqT0Ha0UBYQg9IY4KUAIVU64KSDpj5F
 DuFnQjSMvSGiI9cSUhtkoyEJ7Gaj5s9HW2LiQEo+16+BtagaWk+ZG646og2KyNl+wk8+idNzCt4GUv
 f5/GFoz5l2nU1iaKlKhxO5tVWt1Nkh95N0b6DlRkk4iJ2+evRkGVOxPaVUgsG0y7w3mcvvfOwuAwDI
 RH211J2I61kVJLecu/TeitNBoYC/XLJiN1sJQGpHJA6RnhKkXRebwb+k6njXACwrLtO/kPYGwDYDFp
 6ewKoA5KMxGH2+288XbMcWQ7Weu/TOIhpGIMdeAnyw1RCyKkPPuKbIXp7AKA==
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
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 183 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  26 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c     |  47 +++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h     |   5 +
 8 files changed, 301 insertions(+), 11 deletions(-)
---
base-commit: df210b30304e9113866a213363894a6d768411ec
change-id: 20241113-topic-sm8x50-gpu-bw-vote-f5e022fe7a47

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

