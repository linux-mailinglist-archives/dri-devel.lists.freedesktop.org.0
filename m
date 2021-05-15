Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCD6381B9D
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 00:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C2B6E455;
	Sat, 15 May 2021 22:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB2A6E457
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 22:58:01 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a2so3423804lfc.9
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 15:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eBTQmpM/Ml6k7hvWgriWTmEFhLechL8G1HA7n71TelE=;
 b=tPV/dGjVkXN5nq1h7uNLOhDPoF7XIcwERQ76MsEgF+PmQ+QNYbhhxO/i3T0iTCSlpk
 Id217cfqi0fgG/CyxbuCgmf6iN9tKMto3qPIUyecAs6aXtKd0C0vQM0oKdYgKzmzSdAc
 n1RlD/yevvkHZ1I1zlgXPVMy1D216pn9TCpDuwWM+K8WRnhjRSEpsl3HaBWgJnOH1udo
 Y4TabnrlRylsZzU4MUzuJTVWgMVbVMRkt/fjRLBUx6nc+0fFsIEpzN3jKHJcFw+LamsZ
 w2giAV0YkEuL+/jrweoT1nntGdN1hTwSxTo5u37CljFcQQmyM6d1VjHr9VccR+AZsYYv
 ODUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eBTQmpM/Ml6k7hvWgriWTmEFhLechL8G1HA7n71TelE=;
 b=M6uzQfeexkJVlD/0vMJ58jRXxeHNS8l4r+hVaeUrV6sDrI131qPSGhzRjuvIgJBz0M
 BJjFO2KkDjUXUa4i9+6yqBftw5Sn43d5a936i1oGP/Ll78P7VHNG8VK8dMWg4L1ijHRe
 Cb2c9ry8RD82gCpIvHN8kyQnP1ukVVyIh58+RrYudy+Mia9u2OmgSdbtmithkkwTpXpH
 D8No2BKdXwnN6hgXU8y/zPHnI3TvYfBIx13q04RF78gfWYGFB1U7uQx/wdkzUDwUU6PT
 hJZ5XRzZoNkzE0fJtlIaUmo1SkktbQS7TDOYiPX23VoNt7VGcNHO8ZNr3X1YEWtfybpU
 8OUQ==
X-Gm-Message-State: AOAM533sgftTdaFQT3NkbHeJTo1u5pZ2/oO/2bbLpcFmoNDCnCAGNcw0
 Te8kaPd++GJ463yUGOJKk45jkQ==
X-Google-Smtp-Source: ABdhPJyq+Rs0oTEyhmaCf7LKxlQ+Eibtf/uz0XmOMbZgMJIVeNGzdm5yvJ8vMU0kQV39Xg1tenk4hA==
X-Received: by 2002:a05:6512:22c2:: with SMTP id
 g2mr39209032lfu.305.1621119479940; 
 Sat, 15 May 2021 15:57:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id j3sm1499729lfe.5.2021.05.15.15.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 15:57:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: 
Date: Sun, 16 May 2021 01:57:51 +0300
Message-Id: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # This line is ignored.
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reply-To: 
Subject: [PATCH v2 0/6] drm/msm/dpu: simplify RM code
In-Reply-To: 

There is no need to request most of hardware blocks through the resource
manager (RM), since typically there is 1:1 or N:1 relationship between
corresponding blocks. Each LM is tied to the single PP. Each MERGE_3D
can be used by the specified pair of PPs.  Each DSPP is also tied to
single LM. So instead of allocating them through the RM, get them via
static configuration.

Depends on: https://lore.kernel.org/linux-arm-msm/20210515190909.1809050-1-dmitry.baryshkov@linaro.org

Changes since v1:
 - Split into separate patch series to ease review.

----------------------------------------------------------------
Dmitry Baryshkov (6):
      drm/msm/dpu: get DSPP blocks directly rather than through RM
      drm/msm/dpu: get MERGE_3D blocks directly rather than through RM
      drm/msm/dpu: get PINGPONG blocks directly rather than through RM
      drm/msm/dpu: get INTF blocks directly rather than through RM
      drm/msm/dpu: drop unused lm_max_width from RM
      drm/msm/dpu: simplify peer LM handling

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  54 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   8 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  53 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 310 ++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   9 +-
 16 files changed, 115 insertions(+), 401 deletions(-)


