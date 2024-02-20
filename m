Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA0585BE6B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DFC10E440;
	Tue, 20 Feb 2024 14:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GIywPFcl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C13010E440
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:16:12 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d220e39907so55593801fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 06:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708438570; x=1709043370; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v2Td2TNrjEN7a0rVuoz6czqXirIflgboIWJrSXb6sbE=;
 b=GIywPFcl7bU20myKSkamoeNOHV+2hPF6GYxrRmEBBV62NZPGHbLf9Q8lrt1iBWaayG
 ac4nEMruOw5FyFp7Y5HEi9UBIaHpsioC1Hwo8Z1cCegyeUdV/6dDoiIeEiDowPmixOoA
 7L4FGdpG5BcVyjpoo2hif7lpKoKQgzLHWIUs0RP69qYTTPzVq/WUrTlbbyC8HiQVpsV8
 EP8hD3AtCZJMOa5xShC9TiH8fCO/vVa4yvR2aBw4eFQCCxYxOaCJugO4RtYgbfEB0zGN
 JmOHROYUs7r94AeADFKXZgA5dbQo/n01jjmACLYiCNHiUeVjY2XuJ1zdgv1BGOLFaC1r
 /YdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708438570; x=1709043370;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v2Td2TNrjEN7a0rVuoz6czqXirIflgboIWJrSXb6sbE=;
 b=cNmgpYHdQdHV4sQNX1LLGIipkeVesF/k1/2D+MUeRmkkMNrnJ1uMx3NrHwTLlHhf74
 SH5dpzGTrvPTWucARQTlZ+jWNyJn/K/wby5eO4DY3rX2U+WJBtXZB4ecBpHE9sAVK/Pv
 XGF6yaCZxyhCVBcoDPwb0xs2T6UNxgi49giQ8tHMpX6kIDP+gyXWwWntirmr95B697x7
 smYn288QzwUG2TsmMW+Vxt7brJi32wNqcEabYZ5LJCZgbnk9Wf84XBQmP1Vd3+aoMIne
 SPg5TBYg+hWx+3yDWIo+0vH+fkHoTbdwjqt3xBdG4JuQpMFttCtENk58SdFkoKkDwTRg
 Sf8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuxjL0ZTkiAQhodjMBCGaeRGQlA7eZGS442VVaMxDIwEPtHH7PijJI3dGkYF7JeqycVZ0bdR6Dj+a3rXi8Z2Tm3w+Bln+pSW9fMaGKY6lR
X-Gm-Message-State: AOJu0Yx8hPnELmbKMCmfKYMIp0vM4wVqlTMjze3sXVYJcFRUUI3yEmxp
 +TnxGLuTUELub6WTV4QH0ckGgctqw4YEEstcMeSd0zNMRcJJXGeXLy5ku3ubtw0=
X-Google-Smtp-Source: AGHT+IFOSEeoJnbaHyMnGgA+ZXg4/jNIvZL9WnPF804ful9dH+0xLvjUzFdtefQJ5iv8rXCafIUGDQ==
X-Received: by 2002:ac2:4d84:0:b0:512:adba:2d9d with SMTP id
 g4-20020ac24d84000000b00512adba2d9dmr5632265lfe.14.1708438570171; 
 Tue, 20 Feb 2024 06:16:10 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 s8-20020a170906500800b00a3de4c7bf00sm3998534ejj.79.2024.02.20.06.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 06:16:09 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v4 0/4] drm/msm: Add display support for X1E80100
Date: Tue, 20 Feb 2024 16:15:55 +0200
Message-Id: <20240220-x1e80100-display-v4-0-971afd9de861@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABu01GUC/23OQQrCMBAF0KtI1kZmJqlGV95DXEzS1AZKKokWR
 Xp3025U6vJ/mPfnJbJPwWdxWL1E8kPIoY8l6PVKuJbjxctQlywISCEBygd6Awgg65CvHT8l660
 irQEsN6KcWc5e2sTRteUw3ruulNfkm/CYd07nktuQb316zrMDTu20oAFpv1wYUIKEeu+toUrXD
 Ry7EDn1mz5dxKQN9BEI9R+BiuAaqCwbs9OVWgjqW9j+EVQRyFh0SrEz7veHcRzfR6jImUoBAAA
 =
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=+c+uzrOpdn07JJ5Qe8bduej7vzyjISIkL3aTdvUotpw=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1LQfBxdTi1BQQL3lITfc+y4flWf8plONsFo12
 F9XUKyW1C6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdS0HwAKCRAbX0TJAJUV
 Vqp0D/9uvgP2TpKhX1DILfvHjT1/h9BUJZzL3agXqXe9hYJsQr69ug+Gg6jMEqFxME4TD5G2mZt
 pWIVdvWGoPuZkbDEyzdGVmbyr1tiF/TTi6YxZN3e50YVXl4fLf2yxlvT1JGX2yGZhI3CLpDTRf5
 xq9wnCjOKShAJ3KqqIH3+OPjK/CBw8FgS2cVZ/72DHFSsYzEkwxjBdVXkEaDDm9G/WvG1ulDzjM
 0M3KglSxfZJKHeq4v2CulS2Ew4i8fmudQ0L3caC1EjvRU+siOAR9iKxklE/hQ2VP2ITRdeIJugX
 n0kAem3egHPqld4kTmEb/Zfk08taiU6QfwgmrPsBo6FfV/wv/NU2lJSErTyJXExNOCSk3XAfOKm
 vBs+IBJZzXN23h95AM3TelwGAG/RuD3TbuUS+cFpRQI5NAOMM6fY7A7R7LYz3i284GjyTozvFSE
 UqWF5G+dGKvhgl1XsBuWxAgDG81Spodqm6QpviJmt8qX5EUIu+m6P87HZE80k7bknHDhyelDHnu
 QZUzEqak2Jek1i9Sq4qmvlYZThIE7BJNvfQDSSM/FI47PxOtaZMNEFf5W2VYszRKnsWhf/eWZCr
 ohujJ9mVU6SdaZSZyYepV4R2jrxlTrlEsQLYLa5oCZpWpCt3fvKWSDie0DpyFsggYkneZMkmS96
 vjcrEqyVtvEVcrw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

This patchset adds support for display for X1E80100.
The support for embedded DisplayPort on this platform will not
be enabled using the connetor type from driver match data,
but through some 'is-edp' property via DT. This subsequent work
will be part of a separate patchset.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v4:
- Dropped all references to clocks IDs from MDSS schema, along with all
  headers includes, and replaced with bogus phandles, all to avoid
  dependecies.
- Added Krzysztof's R-b tag to DPU schema patch.
- Link to v3: https://lore.kernel.org/r/20240216-x1e80100-display-v3-0-28b1c33ac8c0@linaro.org

Changes in v3:
- Added Dmitry's R-b tag to the mdss patch
- Swapped order of first two patches, as suggested by Rob
- Added "additionalProperties: true" to all pattern properties in MDSS
  schema
- Link to v2: https://lore.kernel.org/r/20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org

Changes in v2:
- Dropped the 4th patch:
  "drm/msm/dp: Try looking for link-frequencies into the port@0's endpoint first"
- Fixed the qcom,x1e80100-mdss schema by including some missing headers
  in the example
- Added TODO comment for reg_bus_bw
- Switched to SDMA features mask
- Added Krzysztof's R-b tag to mdss schema patch
- Added Dmitry's R-b tag to the dpu patch
- Link to v1: https://lore.kernel.org/r/20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org

---
Abel Vesa (4):
      dt-bindings: display/msm: Document the DPU for X1E80100
      dt-bindings: display/msm: Document MDSS on X1E80100
      drm/msm: mdss: Add X1E80100 support
      drm/msm/dpu: Add X1E80100 support

 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   4 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 251 ++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 449 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  13 +
 7 files changed, 720 insertions(+), 1 deletion(-)
---
base-commit: 2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
change-id: 20231201-x1e80100-display-a46324400baf

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

