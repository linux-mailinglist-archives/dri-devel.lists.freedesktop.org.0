Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50369736071
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 02:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE28D10E029;
	Tue, 20 Jun 2023 00:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573B410E029
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 00:08:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f87592ecaeso1583849e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 17:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687219728; x=1689811728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w7OWjaL+FXNpudHxCHDOI7HyMiIA5hklDMjolIe+wQw=;
 b=mqUlJF2tBzSFoNWT2HbgqoGJbMVw02B/z4yPBFiNXYA8ErP/nOxxyh+b2bphoGRGOp
 jdIu5BMnE/d14wd/+6pm/cAzA3yLsaOGVCi0NZ7cLJMn/m4zgricgBxKl3IraNDV3kp5
 iXuZH+Ash0v/VtNgtWj82N0Jub3k8qNORbah/zSdv8HEwCHUnDMbFxqRjfjGzowemxpk
 1OvKQH6N5bViC/EjLzNBBt9Y4GG8+aetxJrbW0aALfL26FC1xhWEdTi4q5To7ueLFkNO
 QyywttgTsj9kmH9+8mGzHJ8t+sVUx6KuIrgDP0qxBbscVqaEIlXG3An4ZD/wFM1Nq5Ti
 XyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687219728; x=1689811728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w7OWjaL+FXNpudHxCHDOI7HyMiIA5hklDMjolIe+wQw=;
 b=VqkvESgPM/yZWXdH8W4sTZsGXJM2r/Z+Cu+eljZI4bsmS97Aff0198rRlN7wcBUXLp
 YV/NAOmYvuGDPIzuCried4hzbQR+JnTIg3TROh5QqiTYfFyU7iNHGwDdfV2+h69gIJHD
 KH/E63f0PxmAnLqHs5EoYcrHJh6GHeUio7nxjrXD8BemAW4zHTAZo4ymy3DZIyBA3zs6
 BrStPcI6u5j5IuwboB/02Xz+AHoPhYhuLfsJPSX04Au34X7S5sJFUwTRfbezJB1aHIPr
 Gx7L/tbuVM6vqRQwUxM5jApuFPJy6bc3A/VxP4x4dFhd26Jk3go3/WentaPQGWq7P4GB
 3LQQ==
X-Gm-Message-State: AC+VfDyAus4djcquD67Z5IMkp6nH/MSYSeecpAiAKK9CCpBsC5uLzv09
 q5DaMN2eWDOr7x9KppJ++VkMxg==
X-Google-Smtp-Source: ACHHUZ5wHy2qK1kc1Il2EOPChzHpk185SQoGSGIIJ3/WYrIKx1fiOxoJ1wm7lMjlPQjK00i1LkiMGA==
X-Received: by 2002:a19:791d:0:b0:4f8:6f40:4773 with SMTP id
 u29-20020a19791d000000b004f86f404773mr2154256lfc.7.1687219728459; 
 Mon, 19 Jun 2023 17:08:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 17:08:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/8] drm/msm/dpu: cleanup dpu_core_perf module
Date: Tue, 20 Jun 2023 03:08:38 +0300
Message-Id: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apply several cleanups to the DPU's core_perf module.

Dmitry Baryshkov (8):
  drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
  drm/msm/dpu: drop performance tuning modes
  drm/msm/dpu: drop dpu_core_perf_params::max_per_pipe_ib
  drm/msm/dpu: rework indentation in dpu_core_perf
  drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
  drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
  drm/msm/dpu: drop dpu_core_perf_destroy()
  drm/msm/dpu: remove unused fields from struct dpu_core_perf

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 199 ++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  55 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
 4 files changed, 47 insertions(+), 218 deletions(-)

-- 
2.39.2

