Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45809815D1B
	for <lists+dri-devel@lfdr.de>; Sun, 17 Dec 2023 02:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0915E10E128;
	Sun, 17 Dec 2023 01:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BB610E128
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 01:54:17 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2cc6863d43aso3065931fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 17:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702777995; x=1703382795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6uo5Lzxunvm9Mynn/2j9jUQRRy7PFq4vPnnfrTSaOqM=;
 b=gy6k3rQZWC63ZeNq6N5piOoV2Hm42vR+5FcXNEFir/lBybiobuoFf+G4ikTdi+R6XF
 UzXrNwfvkBXXl0JQj6Y80++F8eyH8zki9xbdh3jdDWa0JQTj8/0Mi9kk0geK2Xagw7L7
 /pTcRuaSI3LacBGb3qQwS68eRDuMUGTmQY61KkQ8+SHtcusR9KlhauQ1ipHkcFMsSqY7
 EUNHeu8O359BD9923KPlyCx3y3MPAKAwR4jMQGzCw68ZvWWlVJfKfcbRrp+GR2K2Bee8
 TEuY9GlO6kanz356L9dubcMb2c6J/T4Yw2Z/BDArxeYBC6FmJWmZYYPCIXdIILeVyBpY
 /wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702777995; x=1703382795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6uo5Lzxunvm9Mynn/2j9jUQRRy7PFq4vPnnfrTSaOqM=;
 b=xQWWVte/WIdZvGORkxjxzVBQLSmtymdeNo2JAl/VwHuufJSEnzwzFFHASf0GWOqNf+
 tClpfMM2I1hUT1BHrfTLdpAkZ1KEAfHrA3O1uC5g3UbqtIf4zEd8NYG+IAta8LymQATF
 hMKBhxvnu+DL1YJ2ZL434SLzddiQcod6ijElFL6IB/miTNurSfWLKBmq2pXat3Tw6M8e
 pEcIB7lNkhONo4g4OXkZhbkI+lrtnCPQsHlz0E8hFgpPxO+dT+pgBQ4BR5Ui1L4hFXzk
 W23cGRd8uG8WSD4RnCmz78UW2p2BKND2cVBfptyPgzpa+f8CiInMtJpCpKCPFVZcfubi
 0YZA==
X-Gm-Message-State: AOJu0YxIGj+5dWXSS8KuYczfS+wT50VqaKLvkJnMvpZWQYtpJvaW9l2i
 t6sk63YfduEjUHJAOyOHd7/GOtlbU+B0h5v92uo=
X-Google-Smtp-Source: AGHT+IFzE8rG8RHeKf3trBTPvFqBV9VmDl0XIPR+mfv5S97Pwe963Auef5azXGURAwcyY531Rm+oKQ==
X-Received: by 2002:a05:6512:2211:b0:50c:a89:a70e with SMTP id
 h17-20020a056512221100b0050c0a89a70emr7926725lfu.94.1702771319064; 
 Sat, 16 Dec 2023 16:01:59 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q1-20020ac25141000000b0050e356b61c2sm30387lfd.179.2023.12.16.16.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 16:01:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/dpu: drop obsolete documentation for dpu_encoder_virt
Date: Sun, 17 Dec 2023 02:01:58 +0200
Message-Id: <20231217000158.912062-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop obsolete kerneldoc for several fields in struct dpu_encoder_virt

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312170641.5exlvQQx-lkp@intel.com/
Fixes: 62d35629da80 ("drm/msm/dpu: move encoder status to standard encoder debugfs dir")
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 83380bc92a00..f2b82ca5efb3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -144,10 +144,6 @@ enum dpu_enc_rc_states {
  *			to track crtc in the disable() hook which is called
  *			_after_ encoder_mask is cleared.
  * @connector:		If a mode is set, cached pointer to the active connector
- * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
- *				all CTL paths
- * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
- * @debugfs_root:		Debug file system root file node
  * @enc_lock:			Lock around physical encoder
  *				create/destroy/enable/disable
  * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
-- 
2.39.2

