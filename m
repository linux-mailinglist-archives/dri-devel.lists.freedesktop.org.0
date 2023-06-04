Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B587217EA
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 16:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFF710E149;
	Sun,  4 Jun 2023 14:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D666D10E141
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 14:45:17 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so4827612e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 07:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685889915; x=1688481915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oxZWGXFLzU5SjPv5ySU8WvbrkPwdtjbQ7fatHEgs/dk=;
 b=miw8oSyMD6hAqoknkccaxzELs8RXrO+IjJlpakE8SFO/lGd1TlTqBMTdOuC4kOuMfa
 CVMKCRZGtEjOC+BFuoc+cGBpIYmtLmOeIxOZ3df2MOv743FPnoXmos8mBG0z1rM80P8R
 vV5Y60uwGfwaTyheP6hK5yMwRxy63PllqJ967lvL3GtN4aODqJMgGoUTxGooZgocrTTy
 tKgJ1kJ0h2yReGPwBUCMOOGNwDG8LXKdBp0Ek7AE8UxwzKE0LuUvaWMm8xn1GAiy6HYk
 UqQzH1delj3v+3DsVs765Cg4+h5MUwJEyInFYIBFvkDmdD37rveYJABwbmsf913t+1CV
 hryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685889915; x=1688481915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oxZWGXFLzU5SjPv5ySU8WvbrkPwdtjbQ7fatHEgs/dk=;
 b=ChfTw8qcK6sYTKizH8pGspZP/4Ev0qL9p7KdDbU1oMAH9QlkUJpwL1lU2Eh9bdY0Sj
 U4y5Np5zh1zdcTUlmKU3PtCC6ZebTiJKq5WR+JqbIxJKFI0Szz2MIfGQZbmpkAyPG9U5
 gF0upcoChqGIB3Dx3jyDwpojRmJJYKsr6hTxNgPixrdPN1pmvvQTe93MTcGRfCXKb32+
 wQQVVNl7bMURtkGsLJ9xL3Q1LcThv4XJEHBXtEekIQj2U1oU+jo1SszWyZI9qElvtqcB
 7L4F8TW2TrWNYM89EXiRm8Vxm27GXuRAm1cgcS6KLOZa58nEu6pyVrsIwiGkRk4kYsqm
 hRtg==
X-Gm-Message-State: AC+VfDyAX3n3Mzfj2Brad8vSCHM2gdhFgoP1bTB/pz6d7bhEKIY35Zex
 8Rn9FqBxhO4Fo383dtu5AR+w1A==
X-Google-Smtp-Source: ACHHUZ7yILlKBacoYg0phC6bYxRhDyQn5tt//vNZh6TPswnOOCFQJt647INfiAG+7lN5v/5QT5N85A==
X-Received: by 2002:ac2:46e7:0:b0:4f1:3d7d:409e with SMTP id
 q7-20020ac246e7000000b004f13d7d409emr4493775lfo.0.1685889915437; 
 Sun, 04 Jun 2023 07:45:15 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a22-20020ac25216000000b004f42718cbb1sm788912lfl.292.2023.06.04.07.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 07:45:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 0/3] drm/msm/dpu: remove dpu_encoder_phys_ops::atomic_mode_set
 callback
Date: Sun,  4 Jun 2023 17:45:11 +0300
Message-Id: <20230604144514.949628-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dpu_encoder_phys_ops::atomic_mode_set() callback is mostly
redundant. Implementations only set the IRQ indices there. Move
statically allocated IRQs to dpu_encoder_phys_*_init() and set
dynamically allocated IRQs in the irq_enable() callback.

Dmitry Baryshkov (3):
  drm/msm/dpu: split irq_control into irq_enable and _disable
  drm/msm/dpu: split _dpu_encoder_resource_control_helper()
  drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 79 +++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 11 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 93 ++++++++++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 61 ++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 34 +++----
 5 files changed, 152 insertions(+), 126 deletions(-)

-- 
2.39.2

