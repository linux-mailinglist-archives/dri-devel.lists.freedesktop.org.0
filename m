Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BC1B2F806
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0583210E969;
	Thu, 21 Aug 2025 12:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ItVzZvYw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAE310E969
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 12:30:59 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3b9e41669d6so756523f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 05:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755779458; x=1756384258; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mxR/dg8k3HLUiS1lV7+VyCFpJVOb/C+SddN5AU6mmSY=;
 b=ItVzZvYwcydYVMgfBs9qpzkB6M44ZdoXgbVYhqvIHV2R2gc3s1g0foG3VBfY/EH3Hm
 Yg2+U+zeqc2FyP4da69D5k2dDGcutlAYADWbhUwL4OMUvAiNLa+PY7ubUKUd0dnIJirA
 CLTgi9XLWwTd4Xo4Y2JXSob50n/HcSGEY52hU+apCvTojKesKGY1JPa+cq4N43F0izaw
 RWTACxQV1cME4cnWvKmPF1ymYhPx0F1HaHBS9f7Ot0rLcNjK5IE14pVpB9nNahCYTOen
 C6MA4zFPl3EdicjejHoGrWugSG9rNsC3Rirymgny5KffNdpsC+mgL9Ff8IkZ0KWjAOqu
 mL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755779458; x=1756384258;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mxR/dg8k3HLUiS1lV7+VyCFpJVOb/C+SddN5AU6mmSY=;
 b=Da7TtKO2qSWg5zyfGf+3VvVVwVUzUXrrkubmR8/4XAL1rHKm/YHo3YouBxgzuupeJt
 tI8HjqN2tmUll7FEQgZBOeJJTltBNaD2eSL/4b4ZzmJV4lFibYp2i4R7bxmGayXp7m0g
 9xLQue35tNOBZgTkVH6OnI1NeEFTUUj8XjXsnRBn8mBEzjuIJoWkHAfrvTqRmLGfpXG+
 H0jHUENXp1SxQYc2teOp8two1+e4Yr2tvVe55WuaA0UX8/SfelhPTcPH4dZh+VqnVniL
 VNwTydTlD+BH8UY9N1p+iGU1SHkBpZHcgWdl8zrFc1vyA8ipI1h3oGCMFoksfyDFp28r
 4DsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqLYm4wbnd+VI/pbLJhpz+gwyrr4LBw67/zqI40GvwgBYiXxoW9Nqof3zuBAFcYGy6f+QQzBFQjEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXaAToHh/T7mEpohAzgtgd69teG5TD3cafuEIBABoQw7fjPnv6
 Spk0g8j0e+7C1S/XCjlJoD8xg3qZ75D3ZlhaL3zrQavBJQV/nomkaU9ySePvVsAkGP4=
X-Gm-Gg: ASbGncs1toqoddIQoal7WBlOex/tZ2TbtCo0g5cJYkki7P4bAHLb7NTOyhKIyTyLYGA
 y/a8RV9DB0vN7sv622HG9fwgXORts4hm0J1BIsm86oQ8fkdrg6R5dFiNBAkHLcftZazKJx4Ipwo
 0rfqVRoxqmCIU/HFars8nOxyC+EBCCyXD+3apATu1/A1wYk5kmrmY34jYrQNfg0dW6Erj/YkkaU
 8avhhuFJP7PTkKImwhhR75P9JqDX0Td1aEjey4Cv81i4J78Erq5EwSbD+rki39Hw4gQRORCPne8
 BHipdYDmD3xblORtJUGiO+8OO+mCFjWts83ocHIJfC4QIwW7KM8d0FHiGh/X/MyMv7edYCLDZEH
 eXxFedEVTaJw/FFce+KAbGgsiSFFpsS+pJnHmTQ==
X-Google-Smtp-Source: AGHT+IFuPjndS1sGpXpxAnUf6FSnfiNYp7Zpbio33Qd34o3QKqntyeIWA/EHXuRLsADAhCMT72Ozng==
X-Received: by 2002:a05:6000:40df:b0:3b7:6828:5f71 with SMTP id
 ffacd0b85a97d-3c494ed18eemr1595254f8f.9.1755779458355; 
 Thu, 21 Aug 2025 05:30:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c3e673aaacsm4966796f8f.23.2025.08.21.05.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 05:30:57 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:30:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/panel: jdi-lpm102a188a: Fix error code in
 jdi_panel_prepare()
Message-ID: <aKcRfq8xBrFmhqmO@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the mipi_dsi_dual() macro fails, the error code is stored in
dsi_ctx.accum_err.  Propagate that error back to the caller instead
of returning success as the current code does.

Fixes: a6adf47d30cc ("drm/panel: jdi-lpm102a188a: Fix bug and clean up driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 83656bb4b0b2..23462065d726 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -233,8 +233,10 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 	mipi_dsi_dual(mipi_dsi_dcs_set_display_on_multi,
 		      &dsi_ctx, jdi->link1, jdi->link2);
 
-	if (dsi_ctx.accum_err < 0)
+	if (dsi_ctx.accum_err < 0) {
+		err = dsi_ctx.accum_err;
 		goto poweroff;
+	}
 
 	jdi->link1->mode_flags &= ~MIPI_DSI_MODE_LPM;
 	jdi->link2->mode_flags &= ~MIPI_DSI_MODE_LPM;
-- 
2.47.2

