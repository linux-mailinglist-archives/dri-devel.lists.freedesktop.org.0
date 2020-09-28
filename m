Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBE527BDB4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4F189F3C;
	Tue, 29 Sep 2020 07:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F8989E43
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 19:16:58 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id l126so1961389pfd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 12:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2qNdYqoOUB+OZLN8seN5bCPLMM8MM4+7n2C6OfWpomU=;
 b=befVspTYDlHN4DlmLZsupFoi7jPta5gqC//lynZ5l53i2YXbB5O9eUUcoZFndL1WxH
 nZejR3NzvUXWKromiDfWv0Wl6OM3HQNv+sUSTzwBG4bOViXUpGY0WGpXO4Qbo5OEKpf/
 3ZmXqnV2ju2plBqQ6AJfNFbd8xkjW1XNzA1go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2qNdYqoOUB+OZLN8seN5bCPLMM8MM4+7n2C6OfWpomU=;
 b=XvRKBL2ObxD2jdd3XZ8+YZoVApsvKPsJBEPtP2mCUEJxE14SypbFzfkYc0YPo68b7t
 0VIeMnWJqGiOojpTmWWFdRkEIxR6oMG6pCAsDPI0ho/jYkAbymLFvpQoPZCIHR5wZXbm
 /l8/cJtzFeNWAJ5dgVcGiaKHfMZO5rGBBejoshOoPLKq95zqi11BovXJW9aPHsU9FBaw
 Fvm/8SDYod85PY0UqQ2/37PxBuoN0TKWlfmJZV7KRL/qdsiaQ2TZptaTYAiBRYD5z9kS
 hSXD9CfwA4KS+jQT3iiB/3g0RffLMZn3Bhphmh7iB7YCsaLNFBklGs3TeFb2z0+wZXaL
 Ip+g==
X-Gm-Message-State: AOAM532XcqdXixzynkp0x7kku2hd/WsUHpCmeTg+S4hhm5wrfIdZAJG3
 u97f24dQKuHvAzYIqyKNcoBbUGxrHiIC9A==
X-Google-Smtp-Source: ABdhPJxl1izvLcsXx/2TwQ3vV6O+f5joDNou6VpY62cP+9NybxSHwAN8LcWiD0crnjsEwlkj0C6/bQ==
X-Received: by 2002:a63:c5b:: with SMTP id 27mr463688pgm.80.1601320618567;
 Mon, 28 Sep 2020 12:16:58 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id 201sm2532090pfb.173.2020.09.28.12.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 12:16:58 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/msm/dpu: Add newline to printks
Date: Mon, 28 Sep 2020 12:16:57 -0700
Message-Id: <20200928191657.1193583-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Printk messages need newlines. Add it here.

Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f272a8d0f95b..cbe0461246f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -906,7 +906,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	}
 
 	mode = &state->adjusted_mode;
-	DPU_DEBUG("%s: check", dpu_crtc->name);
+	DPU_DEBUG("%s: check\n", dpu_crtc->name);
 
 	/* force a full mode set if active state changed */
 	if (state->active_changed)
@@ -1012,7 +1012,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		}
 
 		pstates[i].dpu_pstate->stage = z_pos + DPU_STAGE_0;
-		DPU_DEBUG("%s: zpos %d", dpu_crtc->name, z_pos);
+		DPU_DEBUG("%s: zpos %d\n", dpu_crtc->name, z_pos);
 	}
 
 	for (i = 0; i < multirect_count; i++) {
-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
