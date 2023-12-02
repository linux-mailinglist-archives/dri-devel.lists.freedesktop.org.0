Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD26801F28
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 23:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A0610E0CF;
	Sat,  2 Dec 2023 22:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB0910E0CF
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 22:42:50 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bc8e37b5fso4778671e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 14:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701556969; x=1702161769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ai6XN915UjgCfNQVVMBLQPU9SRXzrPP8kHsi76SggeY=;
 b=eKwvdyYCxVc/Rio7w1VIv7KDfjkfb319r2M7g5juXpy9AIdXWn2ZufrRlwccWHx6Jv
 Gy85g2DWoZE+U9J4CPZJp3Ic6+MO5lNhVKI8nTkTTVtrH0aNNzlKCProcQNqNCN919sG
 dOaoADRqOMDFzRHn0RbL/5aHYxacPXqofG7XhIiaXNHBPc47Rwy1y6X6Yk+G0II4X/S4
 9heDSZhQwpxij7nVfa4uarcDI9kE5KEECYYsi5ERtOWx2+PRxarm++SoiT5cBYPGVZn5
 Br5WCP3BXEohM4Ene9rb8asVG1kd81gl1m2Mx9gIvPDgzR9u4SL3T3PkfM3eueYskawS
 UJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701556969; x=1702161769;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ai6XN915UjgCfNQVVMBLQPU9SRXzrPP8kHsi76SggeY=;
 b=kR6ppW2/FUPpWLtsme+BPlbdLb+cjVbMrF1JACtnqBoAw9nytS3shkVxUmJKiBpF0k
 WMe5/uj/OWH10/uL3Bz5lrZ+dxlg6q1sgWdIeQcnLpnFV4ZcvZoTXvls6vL9zpbqUuVk
 SAp65YVKInLMzQUwZvHPkB8bMbV90NlYRrEiXoHKU/2xsHRJ6wy3lqdO8SfRv/dGawqX
 khR4k47O6atKjQvfitZzpg/nAHIfVCaGAfQe8ytmpc6HFzFbCGCZkT+McV85Ykhh1QsV
 ZLrTso9uZouxHUobdnpZx4scaxHs0ydMlZ7sQSn6/axMSoahrNrRUiKB9O7QiOPSKdE/
 Zl4w==
X-Gm-Message-State: AOJu0YwcOv9PF9vwywNDkQWOOMTnk8re7l1Wk2ibFeka3RUcsmUQuOyf
 3XWEMQc7oaq0ZaHRkCMwddsIBQ==
X-Google-Smtp-Source: AGHT+IFW1F/6RdXegvLCbya3Y/33/32qlBMhz6vRg5a/96ZhlFSn96wZguDHL+1XOk3ckfFnIiQ7VA==
X-Received: by 2002:a05:6512:23a2:b0:50b:e713:574d with SMTP id
 c34-20020a05651223a200b0050be713574dmr864919lfv.75.1701556968698; 
 Sat, 02 Dec 2023 14:42:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a056512051400b0050bed700f5esm187015lfb.91.2023.12.02.14.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 14:42:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 0/4] MDSS reg bus interconnect
Date: Sun,  3 Dec 2023 01:42:43 +0300
Message-Id: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Per agreement with Konrad, picked up this patch series.

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects. from none to otherwise
inexplicable DSI timeouts.

This series tries to address the lack of that.

Dependencies: [1].

[1] https://patchwork.freedesktop.org/series/126888/

Changes since v3:
- Rebased on top of msm-next-lumag / [1]

Changes since v2:
- Rebased on top of msm/next aka 6.6-rc2, Dropped merged patches.
- Dropped the *1000 factor from reg-bus BW values (Konrad).

Changes since v1:
- Dropped the DPU part, the MDSS vote seems to be enough
- Reworked MDSS voting patch. Replaced static bw value with the
  per-platform confgurable values.
- Added sm8450 DT patch.

Dmitry Baryshkov (3):
  drm/msm/mdss: switch mdss to use devm_of_icc_get()
  drm/msm/mdss: inline msm_mdss_icc_request_bw()
  drm/msm/mdss: Handle the reg bus ICC path

Konrad Dybcio (1):
  drm/msm/mdss: Rename path references to mdp_path

 drivers/gpu/drm/msm/msm_mdss.c | 96 +++++++++++++++++++++-------------
 drivers/gpu/drm/msm/msm_mdss.h |  1 +
 2 files changed, 62 insertions(+), 35 deletions(-)

-- 
2.39.2

