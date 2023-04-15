Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E79D6E32DD
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 19:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067D210E0EA;
	Sat, 15 Apr 2023 17:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D7010E09F
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 17:19:29 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8b8aea230so3911451fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681579167; x=1684171167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m4nST20IPKOcYwIOfUgXQCsK+huSDja+HNRFSncxwf0=;
 b=LgKEaTXc6OQ5SGY4uM0igrni/yv0F72lQYofAl2Jcwh6IQk4EoQIBACu1lv6nrg0oY
 0Vj6Q1gZ21Us7Yc7Mo2cU6MGBMIqILgC+3MVPYw0ztSlfrQirLp5A+Qb6OXqBDRopNEv
 gaeRI3au41K4XeucsIpCmnmPCkPX0X0K9eyNwL0mKyWc3E4gYQnfLshInMAI9zqadQA8
 YBKMK37nlD+9uFH/WFHETV4tMKtZ7AKMu950fXiVt8bXo4P54Yp0xCQuSqwqpxXtmdN3
 UylZFec81EPEBAiZ9LN/f7yLcuPtVK5FF81VW1W1JpbZ3nOuQFyGLapHBhETHbQ4oFUK
 fJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681579167; x=1684171167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m4nST20IPKOcYwIOfUgXQCsK+huSDja+HNRFSncxwf0=;
 b=FkWxLFSik1Nd7jZp+BY8SeJKR8blUdZY/YP0afraprSe7oxf6KsQOYsW1VxRMlrfbB
 rN5jTh0Voq78RdEuBJElEyajs+o2AtybvRYT04y/BeBG3t4btqrwQ6ST7H/3iwYz7qVG
 xweQPCjO/rqMW7iVSewuIyLYJcwnuB3PO1OiZuayhbGorLsUm2wzQuCpShBIklnM/snW
 ITE1iCc0Kk2aAEkUx9DrkNTXLavOV/M8zpanyz+n/A9GT7v+qq/eS7fBhFhoyOkb85wo
 Vo3eynVOf01YkyZpodrlJ9Hl5QPAj0+zcnKo1BdZKVNgr5thV9HH0z4woTtmkJrc5b9a
 HOgQ==
X-Gm-Message-State: AAQBX9foGRlQaOTT6WU8YLQbzVw/ZUtmaOpRCcJBUXc4ZuKk+tnNUnkM
 oM9h4Do8N/f6xHJ2M578FyE8Lg==
X-Google-Smtp-Source: AKy350YXm6X841XzMI02HB2vU2HU4LiEUQIdFGYoiHVC1a+x3tyGIIwXZM3o79RTKkgXnv6Rafv5OQ==
X-Received: by 2002:ac2:5390:0:b0:4e8:3d24:de6f with SMTP id
 g16-20020ac25390000000b004e83d24de6fmr677665lfh.14.1681579167425; 
 Sat, 15 Apr 2023 10:19:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a056512096400b004ebae99cc1dsm1355834lft.159.2023.04.15.10.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 10:19:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/2] drm/msm/dpu: enable INTF_HDMI support
Date: Sat, 15 Apr 2023 20:19:24 +0300
Message-Id: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since msm8998 and older platforms (wip) support INTF_HDMI, extend DPU
driver to support HDMI output. First patch was submitted about a year
ago, but received some pushback ([1], [2]). However it becomes
absolutely required to properly support INTF_HDMI as both HDMI and DP
should use DRM_MODE_ENCODER_TMDS for encoder_type. Thus dpu_encoder can
not make a difference between HDMI and DP outputs (however they require
different handling).

[1] https://patchwork.freedesktop.org/patch/473871/
[2] https://patchwork.freedesktop.org/patch/474271/

Dmitry Baryshkov (2):
  drm/msm/dpu: simplify intf allocation code
  drm/msm/dpu: add HDMI output support

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 39 ++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 51 +++++++++++++++++++--
 3 files changed, 63 insertions(+), 31 deletions(-)

-- 
2.30.2

