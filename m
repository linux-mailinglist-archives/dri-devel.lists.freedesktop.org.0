Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 556D56C2746
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 02:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4D610E6C7;
	Tue, 21 Mar 2023 01:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4648B10E6B7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 01:18:27 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f18so17234460lfa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679361505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xno9EDcJdCx0dzvy6MPkn9poprdciCTjrjdIL0N1NaA=;
 b=AMhqXIdGn1Cq1onGhg7y9uVnd4SKB2A4gTrV2rO8AUurVo+aYk4GwKasRjk8DMY/Hk
 +80U38aJXN3L4XpxRohz2z1aD90QpUDntpuwcNYUCyXmZd/j9SsGDjQ3aCVxAWmJwUiR
 ZIn/RfkNxDl2MR9100jGa1RnBEhXIOzb2/Dn7g9Kp9tz6LmHmnqbbe/KPkoZub5ThmGz
 BI4Esa7BGeyGyVEjDhuuAR61lwJ+FTCMFtjChLk6rvcQBPiF6Kc8wxMWta+ECPPrraGo
 QjeAkYO6tbxt7DbbbA82BBSS45KJf6BqOPzJz/C7yd/UK9lhWXWBe3+s7zb3vwga9J3M
 YTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679361505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xno9EDcJdCx0dzvy6MPkn9poprdciCTjrjdIL0N1NaA=;
 b=vekwFJ7x/SLl4rNK5cu1w7G0Raq03WK+atR1qb0pyeCU0eAAF48k/BJ6J855b8fBCz
 WzIlEKX6N3w8OpIJNJ68CV7ChH/LZmMsEeCo4ry3SIVuJ2jUG6RydjoeqgDvdgtkYT44
 27AaNI8y7IK4dIpReLf5/leX2kvgVqtnzmNd55xCJYpmCgb07YmEVijMyArPs/yJgbMy
 fzqchqOnLSUJMI4S/qQLgblFajFU9GC9HQ0Z3MNynbuTaOioC2vUtml1GWPVIMaf22V+
 YlwbgGcEcIcESDs/C/srOe3E474ZTObd2ZL3G8cUDKzfIbRDTdvaJDTMCdZWBhA0NcoU
 WFCA==
X-Gm-Message-State: AO0yUKVbRfL6z+GEPLmlLc3t1bhqbEzO6ZJwKcq0Bf8U5phEpwVZxqQT
 4Q+4fhXcqPWXQQRAB4nQ4vmCEw==
X-Google-Smtp-Source: AK7set9PLOY/fDZbKgoIWxlkExftChjga9g06gkjC8pZxISpuEGh8pc5BfqIol/UoCRafG/u9pg97w==
X-Received: by 2002:ac2:598c:0:b0:4e8:5718:d7a with SMTP id
 w12-20020ac2598c000000b004e857180d7amr253959lfn.63.1679361505552; 
 Mon, 20 Mar 2023 18:18:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 18:18:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v2 04/13] drm/msm/dpu: remove unused fields from
 dpu_encoder_virt
Date: Tue, 21 Mar 2023 04:18:12 +0300
Message-Id: <20230321011821.635977-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
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

Remove historical fields intfs_swapped and topology fields from struct
dpu_encoder_virt and also remove even more historical docs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 28729c77364f..4ee708264f3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -130,18 +130,12 @@ enum dpu_enc_rc_states {
  *			pingpong blocks can be different than num_phys_encs.
  * @hw_dsc:		Handle to the DSC blocks used for the display.
  * @dsc_mask:		Bitmask of used DSC blocks.
- * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
- *			for partial update right-only cases, such as pingpong
- *			split where virtual pingpong does not generate IRQs
  * @crtc:		Pointer to the currently assigned crtc. Normally you
  *			would use crtc->state->encoder_mask to determine the
  *			link between encoder/crtc. However in this case we need
  *			to track crtc in the disable() hook which is called
  *			_after_ encoder_mask is cleared.
  * @connector:		If a mode is set, cached pointer to the active connector
- * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
- *				all CTL paths
- * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
  * @enc_lock:			Lock around physical encoder
  *				create/destroy/enable/disable
  * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
@@ -160,7 +154,6 @@ enum dpu_enc_rc_states {
  * @delayed_off_work:		delayed worker to schedule disabling of
  *				clks and resources after IDLE_TIMEOUT time.
  * @vsync_event_work:		worker to handle vsync event for autorefresh
- * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
  * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
@@ -180,8 +173,6 @@ struct dpu_encoder_virt {
 
 	unsigned int dsc_mask;
 
-	bool intfs_swapped;
-
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 
@@ -201,7 +192,6 @@ struct dpu_encoder_virt {
 	enum dpu_enc_rc_states rc_state;
 	struct delayed_work delayed_off_work;
 	struct kthread_work vsync_event_work;
-	struct msm_display_topology topology;
 
 	u32 idle_timeout;
 
-- 
2.30.2

