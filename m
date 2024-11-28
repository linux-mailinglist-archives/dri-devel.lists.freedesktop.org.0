Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970399DB586
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 11:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E105010E32A;
	Thu, 28 Nov 2024 10:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MjbvXtZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9085F10E32A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 10:25:49 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-434a9f2da82so5394805e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 02:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732789548; x=1733394348; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3I6AIsxUoBRKH40pVb83UXSa60uj6EOLZZQQogO210c=;
 b=MjbvXtZZ29RLCUSYhcHJinybpWq64u59+Kv7Y61tVV6n4k+0TlLcZ5z9KgD5fJueMw
 OR3OXJkQ6E0jkqWqbmZpvZ9VWE3Rtlj/bzylD2x4UPwFn5OJx2IABHngB5/cIgDyC4Va
 O16UG9+vmdkMMY7DT0V3k13bCksBF0qf4+FX0Nh7opYg78fCqy92OGKRxV9Q+RXJJ86c
 VGKksPRoYo4RJzstg32gJnXfNDqvtHIFe8qt8RdQTHqBUUrc55KIJ8hsv6QDBj5TM3jH
 amKzUYoCX06dYh1gJig55flVatqxx1bmeJP+zC+wqm8MnLXGDab3SsX5TQ5OjSivr5ZY
 BzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732789548; x=1733394348;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3I6AIsxUoBRKH40pVb83UXSa60uj6EOLZZQQogO210c=;
 b=cKCVcYaLO4hD3/GnyMI5pMjB+9imTTdpX67RTrayJaGndu4asgjX+sSIn9+Rk9+62l
 mqsy38ZfbaXp0VgEz+p41vJNZtEjI4mg1HJTBiLNGDcpp57X027SuCyc5XfJ7qrawIYl
 t1OGE7whsOxTteGbF5GmoqslqAcJnKJKamhbMZVNdB/kwErTLOBNweQF7H+8nykdHsY+
 CW8JHmZXlnrrvd6Mp39WmvOmULPFVeVwCYVsUmR4XnWJvlYKRsPRKd8rGZSMf0653FoP
 K7KSzR8Z5IJWBQoeEFd0nPxvxDBaOhS8NjbN2pUQUoyxfXP3c0X+qdXmuu2eufGCXPUI
 +4QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZE1EXUlodyGv1qjbyjAxDTa/7rnGdttwcJzhknyAcIC0/n7j/uZo5LlJ7ihMHP4jpCTyUU1VRZSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu8By2cnqxdGzAtjWlnH1G5WJrygwdNsiryqF+P/tCNbe+HtMT
 OPG09R+sCw0RAvvM6/+pnh0UwlNJv+MiFdvsEF8UWlwpth5eRea+FIqCmGUZX1w=
X-Gm-Gg: ASbGncvyg0iOy1wckjJ4FpjiqjKhkVxAHyPZrVnjata/EhsOfgIPjVevhgjxi63/lJo
 FE0mPepevZkVy2JzsYucr74vR4Ym4+xDq5c4I2IvycS+whxkIarS7X53svI95eY5h6p1iW7Xr0F
 iv06bpfaxw6Gwev36Ef9gZ2nbNNiSRNl+EmEIeUWO1Yx6ADnP/+5DTOG72AaBpwvgtKnSoJ9xU4
 ZfYAU7muKlSNe5Z3yx2gpAvh1n7L4ESXMYAA8zLH1q1UKPvAOQ7oEA10JE4vN408izzQdA=
X-Google-Smtp-Source: AGHT+IFQt4Vfl+PvJP+MuHQ1mfUYk+er39XdGjNBbNwl8yQnreitbGwARmajf+Gz6miUOFvxRMnAkw==
X-Received: by 2002:a05:6000:20c1:b0:382:4a84:67c with SMTP id
 ffacd0b85a97d-385c6ebab13mr3595896f8f.32.1732789547694; 
 Thu, 28 Nov 2024 02:25:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd2db59sm1265909f8f.11.2024.11.28.02.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 02:25:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/7] drm/msm: adreno: add support for DDR bandwidth
 scaling via GMU
Date: Thu, 28 Nov 2024 11:25:40 +0100
Message-Id: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACRFSGcC/43NTQ6CMBCG4auQrh3TP9LiynsYFy0M0EQpabFiC
 He3sNKNcfl+yTyzkIjBYSSnYiEBk4vODznEoSB1b4YOwTW5CadcMsYETH50NcS7nksK3fgA+4T
 kJ4S2RMp5i8pIRfL5GLB1805frrl7FycfXvunxLb1DzQxoCCsbkSlhDKVPd/cYII/+tCRTU38U
 6p+SDxLskGrlUUuK/0lrev6BonI628LAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4297;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=QFIGcLBS5awrPt51xjYv8/qRgMLKwZbBgWzWKCOeJa8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSEUnP5IC4uCJseRZg7AqBeQ4J5cvNQ82L7CNpdFk
 Wexy/iOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0hFJwAKCRB33NvayMhJ0f2/D/
 9ItHDmWb+7KkCMadOuYfx54Oz4hNQ/4CWFCEGcVAYxBTlNCKuOJ1cl9GRkfpvSXcV3NHDw2ZaqRRak
 7q4dUr8khCCP3OBukhv0gK4aBLBz8Y0+SkZjfbsyzX1dLJlL3Z3p6PH5agOzJ/3SN3o6/wd0JEqXXC
 fb/eiO/s3LHAyVEYT52CVc3oIklXI56d/51DLDU6LitwgG2uCpEc+92uuQ1PCOj8mealuAQtz024XP
 cm5x470LaHeV11MjxcucsqxI2K5hdkojJ6lsBQWo8CfzNWlRgnnmKfOmEx+hbAGTsp5OCKzBY5WC+K
 qK6urxatBwKD+WH712Ku3ML3tqLFgUrqGiDvvutDP6XiK7X26slIAcjARqLOdZ12f7W2QHRLA44Alk
 WVKMWXHFnV+BcqJnLf/5eg9Y45ti7C1TZt9VMxkHp4Qqr3M/Xn4J9ZLSUqjfEq7QLI64+lZFwUPyH1
 jgs3mDDruMqinzCRcyPw7ycUPOsaz/7LRlBo788wB8xfadaJIYrUMHtIq1PRyWlQ4VI+ChgE1NtvaN
 HgYS5mTiJThzeMDp5j/k2bmV2o3hReVWVV37WC3nQPnqKCggW1plq7AEloGCR2BP0NdX9Xtezv//eO
 S39+gDMS2WrThEnyte2JbYea16FE55/VwUYqXHLNI+qUHELojTekO1uO8G/A==
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

[1] https://lore.kernel.org/all/20241128-topic-opp-fix-assert-index-check-v1-0-cb8bd4c0370e@linaro.org/

Ran full vulkan-cts-1.3.7.3-0-gd71a36db16d98313c431829432a136dbda692a08 with mesa 25.0.0+git3ecf2a0518 on:
- QRD8550
- QRD8650
- HDK8650

Patchset is based on current msm-next including preemption support.

Any feedback is welcome.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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

 arch/arm64/boot/dts/qcom/sm8550.dtsi      |  11 ++
 arch/arm64/boot/dts/qcom/sm8650.dtsi      |  14 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  22 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 197 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  27 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c     |  45 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h     |   5 +
 8 files changed, 309 insertions(+), 13 deletions(-)
---
base-commit: 18ac96e1bd761af2b7c2fc99901e9a813a6f3bb3
change-id: 20241113-topic-sm8x50-gpu-bw-vote-f5e022fe7a47

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

