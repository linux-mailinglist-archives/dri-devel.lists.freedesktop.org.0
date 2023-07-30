Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 235777682DB
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 02:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6A610E232;
	Sun, 30 Jul 2023 00:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2006110E1DE
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 00:35:22 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b9c66e2e36so35703521fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 17:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690677320; x=1691282120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LAbWbSfrjAJXL01M6Z3Udbs8b9DnT7yJqHEur/XSDic=;
 b=DSr/Om6fzFiz9i6efc8fkAF+21qOKuIW0ddAujS3XSdmW0VxPUI4mYmT6h/1oIst2u
 bzrknbPqmaN2XCYFve+iHcXFBY37x7FZN4GQ1pBTlf4BHFbebmeyc5u9lrb/6UAmEg9q
 4r1aoKB/jYpT6zUXxHtTy6Ft5f4QEXxmFuqQghBqs+8Eq/a95iStQ6d22o8Q1D+IQApp
 NSYgjCi57nvYsqrVeI+wfPOlPznJkz2TWWf3D/mxzpS/RRtduL9eqe13glfjkDdKtKQy
 bjxqpan0dmgNeeSNnIJQ31v4u/OdmjMrCsun2kuEjwvc+luIUU4ALEkGyUwBuoVvtCmu
 KOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690677320; x=1691282120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LAbWbSfrjAJXL01M6Z3Udbs8b9DnT7yJqHEur/XSDic=;
 b=SzpfciO2T07LQnyyiczI7tv2SxAGupPhpQ7aQgi5v/Gps0hnN1UxRrL/TE1bbMVVmu
 cddDXyj0bYbsIFXRzokr82AmXC6HVuU4/NdXHX7AQfA5LLAnTBG1hE6zOLn6JdKB4rEz
 jPxUtcxrupAPBWT1bUN74tmQ2jNxKtww++wUNCyOcNK/r0Gc6qrbPiAaHlLNV4nsOQlX
 EqiVV/xEmCFnSW3DUwdM6nWtAjs2ZNxVkCkxKhl3LeyvpDDu2E4tElGMo3rGhi2UuKL+
 6pq1D0JBpSpR/A//Mqx+8ygntdnabuxpZLyz6sWhvjqIosmry1CXG0ipc2fSPzwORlaD
 Rjkw==
X-Gm-Message-State: ABy/qLZvIM+oKk2pKWyirFhjoX7yzy4biNXC67BNWx3A7f9EDpDtAoG/
 ETfEMjtOQX65lkxVPSe7FLXr4g==
X-Google-Smtp-Source: APBJJlH+z2podrmuC7Iatzg4fJ0yg2/rK9ZTkFuqESYst25YRswpz9UFoGjWeEu2xrp3QWFvdW6t/g==
X-Received: by 2002:a2e:8755:0:b0:2b6:f85a:20af with SMTP id
 q21-20020a2e8755000000b002b6f85a20afmr2181867ljj.4.1690677319718; 
 Sat, 29 Jul 2023 17:35:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 17:35:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/8] drm/msm/dpu: drop DPU_INTF_TE and DPU_PINGPONG_TE
Date: Sun, 30 Jul 2023 03:35:10 +0300
Message-Id: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
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

Drop two feature flags, DPU_INTF_TE and DPU_PINGPONG_TE, in favour of
performing the MDSS revision checks instead.

Changes since v1:
- Added missing patch
- Reworked commit messages (following suggestions by Marijn)
- Changed code to check for major & INTF type rather than checking for
  intr presence in catalog. Added WARN_ON()s instead. (Marijn)
- Added severall comments & TODO item.

Dependencies: [1], [2]

[1] https://patchwork.freedesktop.org/series/118088/
[2] https://patchwork.freedesktop.org/series/118836/

*** BLURB HERE ***

Dmitry Baryshkov (8):
  drm/msm/dpu: inline _setup_pingpong_ops()
  drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
  drm/msm/dpu: drop the DPU_PINGPONG_TE flag
  drm/msm/dpu: inline _setup_intf_ops()
  drm/msm/dpu: enable INTF TE operations only when supported by HW
  drm/msm/dpu: drop DPU_INTF_TE feature flag
  drm/msm/dpu: drop useless check from
    dpu_encoder_phys_cmd_te_rd_ptr_irq()
  drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init

 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 54 ++++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 51 +++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 41 +++++++-------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  2 +-
 7 files changed, 77 insertions(+), 83 deletions(-)

-- 
2.39.2

