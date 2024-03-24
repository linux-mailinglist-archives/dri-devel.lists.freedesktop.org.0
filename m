Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A6887E73
	for <lists+dri-devel@lfdr.de>; Sun, 24 Mar 2024 19:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9900D10E09F;
	Sun, 24 Mar 2024 18:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M+oPGF82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEFA10E139
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 18:57:11 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-513ccc70a6dso6284532e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 11:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711306630; x=1711911430; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w8EKsV+yihlR6CzqwroFmnT9wtLXmcrhrPbnC7zLk2c=;
 b=M+oPGF825+UyD2XPJ5ThtAJ3+j2/UUdhKxhpATOF6dIuahOfJt8s3f0CimgVVxoiR4
 Sd93T5f1IWr0Dd0J8CIkd9yMtkfDYA1qq64c/liIhU6B8qsZYiQCseY13k0BeHZ5uwV1
 m3xpgLfrgwAPeYyZASThnaKLOEmLnDZr/h+GOufxXF3WKJrTzMTS72xUC0YKsOTmUQaY
 T5Lafw7TL/1x77iiZtoek6VrysueUpQh0+acj8rsbIpxFCL3Dcd1vzsPbODcPby9fL48
 2Xxb1uy1tBSwFzEcZUufmoTEuHYGG2sXnI0pm/WB+R+FJ8I3E8vR5uw5xcvL94bdCbqf
 iFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711306630; x=1711911430;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w8EKsV+yihlR6CzqwroFmnT9wtLXmcrhrPbnC7zLk2c=;
 b=MT2IxKMznL6jMeYkiGWslCHQQivrpVF03jCkmRHGGX2BWTEMeb1hMBagQM637PsSd3
 fbyUzUZgXXQZh5Cb42PuOdb8NOw3bBekWbK+1078ZaSF9R8rZ+j/tuRn75tLSfliOdxY
 /5LoXwvd9RKD1BfDD5yl0a5HG3JYhGRCy0iWXRL8hYMqL7hD1Opo4ASu+YHB77a4lOpR
 j1B4H/JEpO9IA4IX6TRylcgv5K0JjUbvLBlObUM4GoOB8ueeL+ZJxrR/cuCxPU5OH3FE
 msGd6hKwck9c5w+yeyl4MVcJrJMuR5wAOlL2oP4Xg/Waz3xsvO5HGCO+ods/r9ntth89
 1Qhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs3ryoLBDHnni2TbHOkuRWfBmXP7l7Xq/D87FDX72RK3NkUpD1VQ9jHfJdfeuuztVgVlGhf/Jgupi3dXiTSqgVdwRMsqvDVyNGfM+4AqjA
X-Gm-Message-State: AOJu0Yy8EMwI/TnqvXURW0omZO5ShQGd4zI/EF1+vscOJHLkx7N+WNWj
 pmG1y/Rymtu/EpVcWzh1FnQ9WtCiiJit5z60MS2PdUSzw+tx9fBOQlTF1eRm1M8=
X-Google-Smtp-Source: AGHT+IH2KHBBOkQYLt8KmkDQpzHDjSFYkXQ0RrpfLOMZ+n+CDoSZn6CkN/xUvljvXZTQc2SKZiVisg==
X-Received: by 2002:ac2:4648:0:b0:513:7e83:b3f2 with SMTP id
 s8-20020ac24648000000b005137e83b3f2mr3924620lfo.45.1711306629505; 
 Sun, 24 Mar 2024 11:57:09 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194]) by smtp.gmail.com with ESMTPSA id
 m19-20020a1709060d9300b00a45c9945251sm2194008eji.192.2024.03.24.11.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 11:57:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v4 0/2] drm/msm/dp: Rework the eDP/DP modes and add support
 for X1E80100
Date: Sun, 24 Mar 2024 20:56:50 +0200
Message-Id: <20240324-x1e80100-display-refactor-connector-v4-0-e0ebaea66a78@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJ3AGYC/43QwWrDMAwG4FcpPs/Dkt0s6WnvUXpwZKU1FLvYI
 zSEvHuVXLqxS276hfh+0Kwql8hVnQ6zKjzGGnOS4D4Oim4+XVnHIFmhQQsInX4CtwaM0SHWx91
 PuvDg6ScXTTkl3iYGapqja8mzVSI95CY+t5bzRfItVjmbttIR1u3qO4MIu/wRtNFtQ4aB+3Bk+
 r7H5Ev+zOWq1oIRf6O4D0VB++Cg+woDse//ofaN2r2oFdQP4Ag7P8hT/qDLsrwA7wPZ6IEBAAA
 =
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2619; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=oMPQR/xSsCiEnea50bPdQBfX/S0LEOHiccm2F6hjWeA=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmAHd4lgu2vfGbLvStLsNULe27rIa9BA4g7Xdio
 tjyiTt5mviJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgB3eAAKCRAbX0TJAJUV
 Vte3EADN9Ft9g125gXKPgtlGKbDrMlRtX+co+XctSgpggauUDYyIaT+mHbnRoXN1i4TgyNYMnOp
 qZoKBJU04N6wh8PnEBISjNU2igSxkl6pMG9wYwHA5YVrHdkKvIsSXDD1G5o6Kltxtoiw5UDvdvI
 BO6kOWuyCMpfGlXRtKALj9BClWGWlYkE+bVW8rQJV8+lBaKhNQCKcUySEAmQ6WXsoSUZHaYoKIc
 1OXf1RUaU0Oo2U4olAiasUKpHwmj5bi26v51o9w1YTXf3kvgjIXN8DY4g4NAvmjoEVadE5VfRAt
 jCxQFZK/cvePxHCvfMto0I9LIJqiWVHy6BoqQ4VS5H7hM+kJszdjDsMzADh7HV4vKuXS1B/SXaH
 7nuSkyOYKlmV6+6vH3MOdg26HNc7+1vNdvhdIWfxZd+141X6rlCD8N5LmNdt1aZfgv/gbshipmR
 S6daXCU/g2VbQJL7YRuVYFHpo36VtTZIDB2xuuDMmzNKgYgWuj9HKEHMamQlgRRaieqOYxcbU7R
 7IwGWkQjEbdsTGHweGWNgr2L4D40Qreth9SMUbuCy/MmzH4o4bN4OBgSN/tN0yHagTTT5pgvrPb
 NSTj46q0EU/d4AvjI4U7SP+SdlxGs6cH3flD1RUP0SCtSVrRD2O175ip8+mFcXnQUKf4AxU7JvQ
 b7mFfwR2RSMz3qg==
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

Since this new platform supports both DP and eDP, it's the perfect time
to drop the dual compatible (eDP and DP) and figure out a different way
to specify the mode. After some off-list discussion, one suggested way
was to add a 'is-edp' property to the controller node, but that approach
has been dropped due to bindings concerns. So now we lookup the panel
node in DT and based on it's presence we can safely say if it is eDP or not.

The PHY counterpart patchset is here:
https://lore.kernel.org/all/20240324-x1e80100-phy-edp-compatible-refactor-v5-0-a0db5f3150bc@linaro.org

This patchset cannot be applied without the one mentioned above because
it relies on PHY_SUBMODE_EDP and PHY_SUBMODE_DP.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v4:
- Reworked the dp_display_get_connector_type to be more readable, like
  Bjorn suggested.
- Dropped the unrelated change w.r.t. dp_aux_get call, reported by
  Dmitry.
- Re-worded the commit message for the first patch, to align with
  Dmitry's suggestion.
- Added Dmitry's R-b tag to the X1E80100 specific patch
- Link to v3: https://lore.kernel.org/r/20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org

Changes in v3:
- Dropped the bindings patch as this new solution doesn't involve
  bindings update.
- Dropped R-b tags as this has been entirely reworked
- Reworked to lookup the panel node in DT and set the is_edp and
  connector type based on panel node presence
- Link to v2: https://lore.kernel.org/r/20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org

Changes in v2:
- Added Dmitry's R-b tag to both driver patches
- Dropped the if statement around assigning the is_edp in
  dp_display_probe, and fixed said assignment by using the connector
  type from match data instead.
- Moved the qcom,x1e80100-dp compatible where it belongs
- Re-worded the bindings commit message to follow Bjorn's suggestion
- Dropped the RFC tag as the approach doesn't seem to be questioned
  anymore 
- Link to v1: https://lore.kernel.org/r/20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org

---
Abel Vesa (2):
      drm/msm/dp: Add support for determining the eDP/DP mode from DT
      drm/msm/dp: Add support for the X1E80100

 drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)
---
base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
change-id: 20231219-x1e80100-display-refactor-connector-e1c66548cae3

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

