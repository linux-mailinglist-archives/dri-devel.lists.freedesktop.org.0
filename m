Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F7A2B1C52
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEEA6E56D;
	Fri, 13 Nov 2020 13:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5D56E511
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:25 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 10so8208479wml.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFGPsQBWaqIstUovZEQuV7ZoQw1xUxoIPu10HqknCTI=;
 b=hDDNRtwmjy7UzVPZNCJaQ+bu+PRm7kW3v0HnLqD/oaFNjNOldbhgb4hKirvW7RQ3XG
 txtByjBe8inFiRzGvNE+0ZhuM7fV8Syu7RL2PxTSw2iQ4LD1FFAVBa7/GJ93TuAgl0XA
 ACpV0/PDpouzHfBWTiLt7rJyhWBmcfvQ9qFIvNY4YbDDotBVfQmZZoxQ8vEKkrAwZ3DS
 i3XKYmnsRMMZb3YU7tGhZTUDY4RrTNSSIqPhVlTAfqW/ZFop7DarUDsHz7+LSVLhD4vD
 hnfZR+RX+VS+Bxjl5AVbcbeSDW5bYjOBDFd4HsO95GvFkJNQ/mV9Ogq4rZyjmic5vcYi
 FTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFGPsQBWaqIstUovZEQuV7ZoQw1xUxoIPu10HqknCTI=;
 b=UEQ4TbYCnEeXFTmqmqRHg/aW4SeZq+ifwuEOBTak37oN87OaF3ZYvX372dIvFz/zpd
 AR4c8ZJy36dTScHfmcBpmTSI9LbnQ4ocy83DLzvrKYxJhlGeZoxVU24rtgx9Da3X7v/4
 EKKTt9aJRw0iy8uhL8IhIpEWxt+feoJ0wYmnPdnYjMGCYuAdlAMMuYNwzjXY5PIKVZFa
 OkcV1o2Ke+OloiHH67Z+0eVQrZr3HzRW1qzf1394Hta6J3x1cm8qQe2JNQRy8OEWXv+Y
 FnUVcLMfJiYc6+AiGvUX7sHS/9SKDUUEi5iApgk0RUNfY9JVZGIS/ABWRDDg/m9pDUte
 CTfg==
X-Gm-Message-State: AOAM530icjkgbYv+L83G2jqYKyKjAUG4LZskGLoktOgu58q5ZGv/h179
 kOU2pJh8fYX8Xq70zmCf5gT0GQ==
X-Google-Smtp-Source: ABdhPJyRl6lkCY0QwpZX7ubai9WllsidpusPMAw7vEARujcTCQ0A8ompo9Cv1/xtXRSuPmAwCaT85w==
X-Received: by 2002:a1c:2cd7:: with SMTP id s206mr2533032wms.182.1605275424372; 
 Fri, 13 Nov 2020 05:50:24 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:23 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 34/40] drm/msm/disp/mdp5/mdp5_ctl: Demote non-conformant
 kernel-doc headers
Date: Fri, 13 Nov 2020 13:49:32 +0000
Message-Id: <20201113134938.4004947-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Very little attempt has been made to document these functions.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'enabled' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Excess function parameter 'enable' description in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'flush_mask' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'start' not described in 'mdp5_ctl_commit'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 030279d7b64b7..b5c40f9773629 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -213,10 +213,10 @@ static void send_start_signal(struct mdp5_ctl *ctl)
 	spin_unlock_irqrestore(&ctl->hw_lock, flags);
 }
 
-/**
+/*
  * mdp5_ctl_set_encoder_state() - set the encoder state
  *
- * @enable: true, when encoder is ready for data streaming; false, otherwise.
+ * @enabled: true, when encoder is ready for data streaming; false, otherwise.
  *
  * Note:
  * This encoder state is needed to trigger START signal (data path kickoff).
@@ -507,7 +507,7 @@ static void fix_for_single_flush(struct mdp5_ctl *ctl, u32 *flush_mask,
 	}
 }
 
-/**
+/*
  * mdp5_ctl_commit() - Register Flush
  *
  * The flush register is used to indicate several registers are all
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
