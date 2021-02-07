Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AF631213E
	for <lists+dri-devel@lfdr.de>; Sun,  7 Feb 2021 05:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3E26E55C;
	Sun,  7 Feb 2021 04:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99B16E55C
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Feb 2021 04:19:00 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id d2so6888767pjs.4
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Feb 2021 20:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZuUSwDW1QlcZo//J19uXwwWVGrMnsuuGUvOzqh+LAAY=;
 b=XbbuIvVB/Ar1MJ2wdsGeAVmm5p6lIIZF+uPoC8txf+bsyY+gXm7mABMOlXwcXtMySh
 IgKTNiebjanc1weOVklTRdteWOdNyAZnvKgBSPlksrIeCsPCJx5MfazXzP9otQ6hMPuE
 ExCwcvR0YnaeyPfBJ8uG+HlkNc8RkYzTWFUpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZuUSwDW1QlcZo//J19uXwwWVGrMnsuuGUvOzqh+LAAY=;
 b=gY+w/iRru+Fr+n/sJENpKh2uoEormIoKLP8CH5LYICfkFZdAyExnovYDzg/si96SnI
 aGj4dHRG4YxqdWZ7lHKNR8qFd1OVHbRC3t7C/Zuk5Kk+HG3it4J/ULMrlqIV+6JadR3T
 aySzS7gQbEjcQoGtFUiuTfBt4O9NnYkSm0VZC9SsGkx8hCtR8bu2BS21bVkqsKpqAD/D
 W9DD7MJHvTMF1WZK/md3exTqVikUAxfXX8XsVFn2gqmRGF0IcGURQwSQVVNDJXP4oboE
 AIoLW/KlE7TSfUG72AByicW3w/nWRpJzHwpGcDhAdF2TBMCtGJqDr30deM7AMJsqH2je
 5Ptw==
X-Gm-Message-State: AOAM531FQ5bgpfuKXcFvaLLZnYLlvC+GTeOy3LSFMZL3+Ip7KoNAIJDw
 jkEXdp2n9ksbBpPgkrN1LWCdWg==
X-Google-Smtp-Source: ABdhPJzCyWtt6C/0vpNQnL1jkMGfNzMDP+aZniFfVTygDhZAtTN6sXQlhcGUh44k9O7mvq9Xen522w==
X-Received: by 2002:a17:90b:1a86:: with SMTP id
 ng6mr10787360pjb.113.1612671540567; 
 Sat, 06 Feb 2021 20:19:00 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:2c64:7ee8:fefb:fab2])
 by smtp.gmail.com with ESMTPSA id 76sm14392262pfz.174.2021.02.06.20.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Feb 2021 20:18:59 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] drm/msm/dp: Add a missing semi-colon
Date: Sat,  6 Feb 2021 20:18:58 -0800
Message-Id: <20210207041858.3317171-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Lee Jones <lee.jones@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A missing semicolon here causes my external display to stop working.
Indeed, missing the semicolon on the return statement leads to
dp_panel_update_tu_timings() not existing because the compiler thinks
it's part of the return statement of a void function, so it must not be
important.

  $ ./scripts/bloat-o-meter before.o after.o
  add/remove: 1/1 grow/shrink: 0/1 up/down: 7400/-7540 (-140)
  Function                                     old     new   delta
  dp_panel_update_tu_timings                     -    7400   +7400
  _dp_ctrl_calc_tu.constprop                 18024   17900    -124
  dp_panel_update_tu_timings.constprop        7416       -   -7416
  Total: Before=54440, After=54300, chg -0.26%

Add a semicolon so this function works like it used to.

Cc: Sean Paul <sean@poorly.run>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: Lee Jones <lee.jones@linaro.org>
Fixes: cc9014bf63a4 ("drm/msm/dp/dp_ctrl: Move 'tu' from the stack to the heap")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 55b7d0edffbf..95913db97616 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -631,7 +631,7 @@ static void _dp_ctrl_calc_tu(struct dp_tu_calc_input *in,
 
 	tu = kzalloc(sizeof(*tu), GFP_KERNEL);
 	if (!tu)
-		return
+		return;
 
 	dp_panel_update_tu_timings(in, tu);
 

base-commit: ce5226625a694fa5a46db241ac4c77a1430e37fe
-- 
https://chromeos.dev

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
