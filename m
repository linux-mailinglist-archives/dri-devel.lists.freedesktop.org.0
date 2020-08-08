Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B8523F856
	for <lists+dri-devel@lfdr.de>; Sat,  8 Aug 2020 19:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB91E6E0FD;
	Sat,  8 Aug 2020 17:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5536E0FD;
 Sat,  8 Aug 2020 17:28:30 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id ep8so2594196pjb.3;
 Sat, 08 Aug 2020 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v4VG68yjsSgJtRppBPF3uOrudyHEUR7Dzur3xN68sJo=;
 b=LrumZTBTGBsFlxmSWq3tdNULI4G/LxjTqO7lrauGcYh59HaMmOQ/HpjplxEAKGw3Wr
 jnZC8tOCSXmxU/n9HkWPLYthFW4fCWd13GtKO5vG6VJfRz4I/IkwnAeddxRxGNOKvhBI
 yGRkyfpKht291PbtrNkaNHspu/bkYnSPFQFoKTpeo5EXO20TcjjCrMPq3F9y1HfXXFVu
 C1INfLwg9aSZiLnCDM7h6sAecEmB2JjpviqYLyw09Wp+Rr+rkHxHwbeTJBdu4Q+sGBFG
 Cns1iJ+Rd4NQL+vC47RX4oLc3fCFhwP2Iv8VDSWc2a7C5RHJ2jccZXAvKzIypxC3SqU6
 prbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v4VG68yjsSgJtRppBPF3uOrudyHEUR7Dzur3xN68sJo=;
 b=btZ66NId1K/cShDeYwgH4/xradUm6+p67MbE6pd5XirgPmyzhDMExu7+eagoESXagY
 G/FgDwjZ51UzzXCdxRmMj8EhERFKaScnMsdu+DESSLYV7+vb4E2dupuPt/7nEKz7nrC/
 dMal8Ifvt15tmC0CsGXhZ3xqjt+6ORdZV/utWqlW0fJ8aA7Me7m935RWkB3aJOK0yrAX
 /XFM6O6U18Jxo5w8Uvp6H/VFijUjQ2sObg2Z5OEO7put8mHhjUvXVli/SHrSAJIOXaha
 iZ4PTPx/lrleK7CqUzMiqa69CS6q7aG0nrkLCCGN64WEVdqSVNMzRlm+IX59Im1n0Wx/
 IF1g==
X-Gm-Message-State: AOAM532EK4P4BmH1u4ccbqPVe/sndc+EAL4Ho9TMD1L1oTAHU1UJYmBk
 O9A5javGX4zhf0s+6Mlp+UjpFQWhYsg=
X-Google-Smtp-Source: ABdhPJzYr7usx3fGNyyPrJWCnyL3rFFa3Db/Q54TjWtTPXqE1GkwwM99QtEJztB1F3g1c1ejhy8NjA==
X-Received: by 2002:a17:90b:378d:: with SMTP id
 mz13mr18857396pjb.98.1596907709800; 
 Sat, 08 Aug 2020 10:28:29 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id a7sm7594801pfd.194.2020.08.08.10.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 10:28:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: fix crashdec section name typo
Date: Sat,  8 Aug 2020 10:29:11 -0700
Message-Id: <20200808172913.380050-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Backport note: maybe wait some time for the crashdec MR[1] to look for
both the old typo'd name and the corrected name to land in mesa 20.2

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6242

Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 846fd5b54c23..2fb58b7098e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -372,7 +372,7 @@ static const struct a6xx_indexed_registers {
 	u32 data;
 	u32 count;
 } a6xx_indexed_reglist[] = {
-	{ "CP_SEQ_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
+	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
 		REG_A6XX_CP_SQE_STAT_DATA, 0x33 },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
 		REG_A6XX_CP_DRAW_STATE_DATA, 0x100 },
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
