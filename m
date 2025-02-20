Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC54A3D67E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E68410E916;
	Thu, 20 Feb 2025 10:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QFgDu+Yq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BD010E916
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:26:21 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30a3092a9ebso8204921fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740047180; x=1740651980; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O7kUm1v64pAlfTNgHXT9+jQTHsgrWw2Fb+swiiw/lqg=;
 b=QFgDu+YqKsvTOzBeCsLTKiDd1351qJIwwQ6i5aI65uHxCw66AA8hSEdFZX3AMztrUm
 a7k3g5dcU9PjNFDGg+smDIEhJ5Q+aZml8CK5BY4Sd1s5EAo5Rx01qcmBzKuZ1m37R/Bu
 tVMZvfe7ZOQGeyWqBhxHQf7AhlQWcl3tb/26eFXqVJL+vW7+9CvQJLfJsyFPTrJGrwkb
 +897Lh6Ke0ekthXZECRaBH7kCZrYShITPTdQGgaMUrrIjs4AMrIrv6lUl1K2GFBf5x4n
 As/aG5YbNi4V+BZISCEFZUCuIPaEoTkjhs/1G4vfpnBL1ei2fOUQHY2kGWsvm7nt3wdI
 sfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740047180; x=1740651980;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O7kUm1v64pAlfTNgHXT9+jQTHsgrWw2Fb+swiiw/lqg=;
 b=wBUAQSa6UkZSjUhfjzbkaV8Vjq4sfGHzCU/UWfAasjX476CVHKX8nKb37CQilqsdHX
 tpvIxt8EjZpbCkfoS4MUAU2eYflLE0OSOXNDmgz2PLD+51cGvVPS+BLaoUqCRXv35E7t
 k9EfKrtEwdm5eR3fVvP//NLHMmRLoYcY3ORwpkh+2JqGG59DJuIjSLSeNlNvgzDJTUvh
 jqiAdDWBq6ddYpR9HLL82s39Su24EwacaAOIINeH+UiqYHdWagAUDMR93cvxVMCGWfo0
 OfV3uSSLcOCsw1tP0PZ8I3nGI9zJinPEniUfIHkI5SIWF2UzifJeit4Q3naRyioKq1dU
 HF1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdfCdeRZ2lE1SivorzlNYxl2yqKY/m2Km4ugm9GPwAYICgnJJ2uIj1wy3Maa5flOV5epyQaDlBChk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQt0mVJHt2J8Y3nokh3mLNjKduA0QkDnzIcDjWvwdrGQO29EAj
 STckOA9ninuQoFaSgu/gmlceqQCrPoycxBPBrexVt8jeZc9N+RwkK9WrMSaN7HM=
X-Gm-Gg: ASbGncveyHICRdVR5D6eqh9p8eL4BpFpueAk1XOLTdQNpZim1z04atYHx+Bpt5kxxiw
 GwcQ2LjVV8pFlsSeh3sCSBgUdmujpEO6mSKKr2RktTcAwFLZUq4OkYxu9kA+XnOJx6m6bZ7Hmlx
 7mn23DeXJ9EzB1cR/XFLqmlP+xFxGTmOSv0Qy4OaTXKSoWz8eHisF1O0q2GJoYa9czaupFKE6T7
 29dh2xjd5ooWUcjjbICWxYpAc5Bv/G4t1Qcto/u8spksyos+126SQ6dcxUSoeWXMkrz563NXJLl
 +5DAksK2+0jt3K0WIzW1uHQ=
X-Google-Smtp-Source: AGHT+IGlXUzn3hUtO3qI4uZIYQwTOom4ZNCtperoIH7T9iwqU09YHCrm1fmNkZnNsMT0VEKdIAouHg==
X-Received: by 2002:a05:6512:3d28:b0:545:f90:2753 with SMTP id
 2adb3069b0e04-5452fe65418mr6812551e87.30.1740047180139; 
 Thu, 20 Feb 2025 02:26:20 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545e939224esm1588052e87.135.2025.02.20.02.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:26:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/7] drm/msm/dpu: improve CTL handling on DPU >= 5.0 platforms
Date: Thu, 20 Feb 2025 12:26:17 +0200
Message-Id: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEkDt2cC/x3MMQqAMAxA0atIZgOxKFSvIg41jRoQlVZFkN7d4
 viG/1+IElQidMULQW6Num8ZVVkAL26bBdVngyHTkKEW/XGh41NvQT5XJMvsam9Hsg5ydASZ9Pm
 H/ZDSB7a1VLJgAAAA
X-Change-ID: 20250209-dpu-active-ctl-08cca4d8b08a
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2280;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YyvVU2M7joMcm6kj5ecMLcRcuQdUfBOt7Mz2QmcKpMA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntwNKz077CpwnHsET093pRfGyj2RJD7zbmGJM9
 MlqG+6ye5SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cDSgAKCRCLPIo+Aiko
 1XSmCACCpPXkFLHWeGP3ru9CD7CIQa+/GkF+9BR52tm4Fr7Um5rFL3qRex3TPMfI8cBBY/PO+oH
 lk+HugPCgmD8QAwrqrQJjbyyLtTNhd46sBP50hhpLzQapJHQiUanAb8o6S7yqNXeuP/qSCvoku6
 atL/fSRrZZ5vpPqZ4s3saodLzO12QfdpBIgOJnNHM1yR22wCA9yZR6K3dqnOfG5hfFsXdCP0P+O
 6DCM2YASFcARwe8IDUzeyKAHoKow9QSs71o7sayKDSshDtqUmxfDIxHRnbynaXsniBYLChvZ1+x
 j1sdyqSsZpkGCqjmtMBbWcV6JiXesfFmNnLe5q2U+wcg+898
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Since version 5.0 the DPU got an improved way of handling multi-output
configurations. It is now possible to program all pending changes
through a single CTL and flush everything at the same time.

Implement corresponding changes in the DPU driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (7):
      drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
      drm/msm/dpu: program master INTF value
      drm/msm/dpu: pass master interface to CTL configuration
      drm/msm/dpu: use single CTL if it is the only CTL returned by RM
      drm/msm/dpu: don't select single flush for active CTL blocks
      drm/msm/dpu: allocate single CTL for DPU >= 5.0
      drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h    |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h    |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c             |  6 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    |  5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 11 +++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h              |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                  | 17 +++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h                  |  2 ++
 18 files changed, 59 insertions(+), 39 deletions(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20250209-dpu-active-ctl-08cca4d8b08a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

