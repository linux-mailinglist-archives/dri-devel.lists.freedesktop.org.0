Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234B725A61B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 09:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EF66E911;
	Wed,  2 Sep 2020 07:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F036E0BC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 21:59:46 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id j11so1231987plk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 14:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yyHMLM4ELnE5TBLINkhsx/ZOVL6DEfANxYCpgeB+3ig=;
 b=KqeOaddw0AfZ2GYLkBfVZzt+5xX3DH+bRc8mRKnuHFvU2QprnK/RboHxIyhnRrOFo5
 ze6fnI+TGS5qcwk37ySRDIq9F52AnduHRqbazGPz5qi0XY1RIxerNTytyTZ9LgNJQGwH
 nQHwvSwhZvqL0EWuiF+c1ZhwgHwjOYWt8SwTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yyHMLM4ELnE5TBLINkhsx/ZOVL6DEfANxYCpgeB+3ig=;
 b=E32mrk+I9lt8mFaUeBfCcul0mUeahiPxg/87jo5x5LYuyMncSt/b16XURxeIrbtIcT
 WLcdAHKImtKc0PM8VMgzLznaC3z+5Ck93j9g4kDHPAo7arpmJk91H1a/AFQ/YQuJuW9Y
 8Ib6j1FQYcSacUG3+2ODdvKqNoIrtpIaCV1BKrPr3RlCNdJd6EGo7sURwXyIFuR47FHE
 LZj9/YBiH90xw+q9KbZqF0aAYpIHb292zJzIBGn6b+UT6NSPgWxGG2WCU1YWOS0a1MIa
 EgJceYBpjBjVc1y+4XEc6kt7TTz4XxRZirQGCxqru9kThR1FdDtPcwxGlc/ROyAMNx1a
 7qjg==
X-Gm-Message-State: AOAM531hi6bffOqIFXlgK7Lnxjnri67iv6pI2FTKlz+BomT7cTqoObSN
 WkzyQBgsatczES4HPd3z/FKEyg==
X-Google-Smtp-Source: ABdhPJygyY7debsqFH8WtQ3Zg2VOGcIsIKr04QOPYsplwKI/0izan3soYosz9Lol7HtneM2yH/v8rw==
X-Received: by 2002:a17:90b:95:: with SMTP id
 bb21mr3454393pjb.68.1598997585709; 
 Tue, 01 Sep 2020 14:59:45 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id q5sm3044037pfu.16.2020.09.01.14.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 14:59:45 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 2/2] drm/msm: Drop debug print in _dpu_crtc_setup_lm_bounds()
Date: Tue,  1 Sep 2020 14:59:42 -0700
Message-Id: <20200901215942.2559119-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
In-Reply-To: <20200901215942.2559119-1-swboyd@chromium.org>
References: <20200901215942.2559119-1-swboyd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Sep 2020 07:07:59 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function is called quite often if you have a blinking cursor on the
screen, hello page flip. Let's drop this debug print here because it
means enabling the print via the module parameter starts to spam the
debug console.

Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: Sean Paul <seanpaul@chromium.org>
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 74294b5ed93f..2966e488bfd0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -421,8 +421,6 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
 
 		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
 	}
-
-	drm_mode_debug_printmodeline(adj_mode);
 }
 
 static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
