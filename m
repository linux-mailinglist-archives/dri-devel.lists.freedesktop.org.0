Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899F469FDE1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 22:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95F710E1EA;
	Wed, 22 Feb 2023 21:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E13810E1EC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 21:47:14 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id r27so9771458lfe.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 13:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LtV4gYlZb6movFpbhLNmgY7hQ5iw08LpCzFT54yrzAs=;
 b=xvsApw/xe6eVzMexS8gyRb6PnkjYi1+vYZLtmPdAbOIy6zgwklwpIdeAXa9DXgEkDz
 CfaOV8wYg5bcvQTLuWodJRkW5QgnXUZafwwLZmgQwWn98oXneVQGqapGcvtfPoWtfsDl
 wLqjjFlhJ1SD305vnKdaKkAQNc/yLQTru/SqkDujMAvIgA9ssESu9k/iZeSfs4z4PKX5
 pdi/G9vqxjcpB1gJhm1RBslHkg0dZAZzvwuPMeTC7mr/ALQNkPxJdVE5seFij5pIg/06
 Dy1imCqafD3J75cmgT6WdXXQwBMcRpY7O3iJH0jYLnVo1xqjinWY/YliM09JkylO0hmI
 Kw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LtV4gYlZb6movFpbhLNmgY7hQ5iw08LpCzFT54yrzAs=;
 b=owIFKXLI50LP5AF/14Aq2sgUMmLC3Jg4yXvLzjXix8dGL8wzdZAzNW3maVPlqPU5VR
 n50M/6pGurdU2pBvIL6WLIoocJfFoc45xUPugpYjRtWJJsauWz9l++VFGF5q9DQX+mpC
 OBdQ6Nikg6aU/t2i+CKJsYU7sMo6HURFS5SbtMWVyT4bTWC11f2XWpAUHzAM36iebFyg
 njLrhph0UvOuPbC7MVBu656nshbv1bK93v8IRejZ3vJPUZrPOei846fox63RaBiab4nn
 vVm97/TaLOhKRrkxkFmD9Xj1K4Uy2yRo3pmtYseD4f/wWullhEUvVDmQtdenJr+psyUC
 ZubQ==
X-Gm-Message-State: AO0yUKVErUROzVh6MhFJWdwHo+Er2nJM1Ku5emdl9QG4WgCa5UFjyBP6
 b0UE8KJjTvIgMx1EsvDuY+JruA==
X-Google-Smtp-Source: AK7set/RP4wCH5nANpTc//nQoM25cOa7FJpbemhgSn3yJ/9VpW6trH+TvUn2C8GStdji/Y+bwdm9gQ==
X-Received: by 2002:ac2:5202:0:b0:4dd:749b:2d5e with SMTP id
 a2-20020ac25202000000b004dd749b2d5emr3245594lfl.13.1677102431997; 
 Wed, 22 Feb 2023 13:47:11 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 c23-20020ac244b7000000b004db5081e3f7sm505126lfm.46.2023.02.22.13.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 13:47:11 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/5] OPP and devfreq for all Adrenos
Date: Wed, 22 Feb 2023 22:47:09 +0100
Message-Id: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF2N9mMC/x2N0QrCMAwAf2Xk2cCW4VB/RXxI27gFSyrplMHYv
 1t8vIPjdqjiKhVu3Q4uX61arMFw6iAubLOgpsZAPY09EeGrmHPCXGwORSuabCtepjTwdD2PFAl
 aGrgKBmeLS4vtk3OTb5enbv/X/XEcP343Cs57AAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677102430; l=2087;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ocr3jeuvoRq3y9CSWJWmDlXSkvIkpCb9rcZR7Ldt8y0=;
 b=GnX5hx4k4NEFLxBrvnFkBrpW7jm1Yg1bxr4NqiOJ1CEFH/5VtjvD1XT/pHQKEdLz6RaWIHFdv0a9
 l2zbUi+tB7Th6+9ZQ07IS4Xo5xNTXebzV60EY+88yeyROg2CK1qd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is a combination of [1] and a subset of [2] and some new
stuff.

With it, devfreq is used on all a2xx-a6xx (including gmu and
gmu-wrapper) and all clk_set_rate(core clock) calls are dropped in
favour of dev_pm_opp_set_rate, which - drumroll - lets us scale
the voltage domain. DT patches making use of that will be sent
separately.

On top of that, a5xx gets a call to enable icc scaling from the OPP
tables. No SoCs implementing a2xx have icc support yet and a3/4xx
SoCs have separate logic for that, which will be updated at a later
time.

Getting this in for 6.4 early would be appreciated, as that would
allow for getting GMU wrapper GPUs up (without VDD&icc scaling they
can only run at lower freqs, which is.. ehhh..)

Changes:
- a3xx busy: use the _1 counter as per msm-3.x instead of _0
- a6xx-series-opp: basically rewrite, ensure compat with all gens
- a2/4xx busy: new patch
- a5xx icc: new patch

[1] https://lore.kernel.org/linux-arm-msm/20230130093809.2079314-1-konrad.dybcio@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20230214173145.2482651-1-konrad.dybcio@linaro.org/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (5):
      drm/msm/adreno: Use OPP for every GPU generation
      drm/msm/a2xx: Implement .gpu_busy
      drm/msm/a3xx: Implement .gpu_busy
      drm/msm/a4xx: Implement .gpu_busy
      drm/msm/a5xx: Enable optional icc voting from OPP tables

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c   | 28 ++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   | 11 ++++
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   | 11 ++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 94 +++++++++++++++------------------
 drivers/gpu/drm/msm/msm_gpu.c           |  4 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c   |  2 +-
 7 files changed, 99 insertions(+), 55 deletions(-)
---
base-commit: f4ed0868966d96203fee6f2782508746ded2ce3f
change-id: 20230222-konrad-longbois-next-86d1a69532c2

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

