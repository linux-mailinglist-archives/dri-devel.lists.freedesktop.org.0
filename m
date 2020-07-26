Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F7C22DFCE
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D9C89D49;
	Sun, 26 Jul 2020 15:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6862D89FEC
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 05:07:23 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id a32so9911761qtb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 22:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=4fBbTXl0es9SI3RqVvzZLJMaeaB5Sye+SLS57bBCWEQ=;
 b=gEa1dPISUTZ4vnR9iujU0mYuDOKP6FYT5i36LpU2njvmiEJJuY96e28Jcn7jXLQLuv
 FU+1J6h4PvCEZlz/HYlsevsMABM2Ob/QQq8OSBC3Oj+rSOSl2Tfx6u6hMWWa4lr7coFV
 E5UgQLcBPJ2VCIbs+F5uiAPo0dxZtOQDQDccDP9DKlgRDrfOmls2lCJ/Gu8OU/sC5gO/
 43jSFsQRrg2RxQUolhHvvoKN0ZBMrYO4EBQUnlD45ga3ZurPYXE/UzdCV2vy4nmPDv5e
 VTwtbdGAif7CCsrBp0FSagPrxQv8cMjCy8mHPVmyD0DPDEMtVQrqdmgHqEobN+xGQ7QB
 Uu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=4fBbTXl0es9SI3RqVvzZLJMaeaB5Sye+SLS57bBCWEQ=;
 b=thP+tz5tPGatTCaUeEqtDQtIW+STs7SpQZkqkgfOxiHZmLdj9JBkxRq+dXq3paUjnx
 Rj6U3b3obScyct6VwFuY4ubMIQWXg7DkPf30qV635fbX0Y7kCdEDUYSrYQhv5evO+oi/
 Wg55L9J1BBILh/+WN+2nt28BE5C4aKnem6nlD4IRK1DjHeXxoFnites7ajXUgkP7sG79
 mFvcXP1abfkIE6S3S0VvTyO4nWAAz6tQb+nqGG+HtJ1c6AYyEMNLmXBB3rUquHd8jydd
 69nhc6Y3OlqvM2rD0f4h9GcUNVy3QYStFXal5sfrzOJNm7nukvAiv24xCw8G/SOTuSyt
 Ms5g==
X-Gm-Message-State: AOAM533jaLgsuAreRbGRCcQtiSpbL41JBRMRKtKDd4hq4cHUKcRPMdtE
 rLLuLzgTP6IeO/9NoHgv57A=
X-Google-Smtp-Source: ABdhPJzVLYO1jw5cwaoddiKoAy8nGvr24KNbXCFB88quHOGR8Gv8ZnKamOxuPgsfretq9pBCjof/XQ==
X-Received: by 2002:aed:3947:: with SMTP id l65mr3946373qte.374.1595740042255; 
 Sat, 25 Jul 2020 22:07:22 -0700 (PDT)
Received: from linux.home ([2604:2000:1344:41d:159c:94c1:6e96:1b7e])
 by smtp.googlemail.com with ESMTPSA id
 t127sm13031881qkc.100.2020.07.25.22.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 22:07:21 -0700 (PDT)
From: Gaurav Singh <gaurav1086@gmail.com>
To: gaurav1086@gmail.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Qiujun Huang <hqjagain@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Rosin <peda@axentia.se>,
 Nathan Chancellor <natechancellor@gmail.com>,
 dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] [video/fbdev] fb_flashcursor: Remove redundant null check
Date: Sun, 26 Jul 2020 01:07:00 -0400
Message-Id: <20200726050713.9461-1-gaurav1086@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ops cannot be NULL as its being accessed later without
checks. Remove the redundant NULL check. 

Signed-off-by: Gaurav Singh <gaurav1086@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index e2a490c5ae08..9551f40c6d14 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -401,7 +401,7 @@ static void fb_flashcursor(struct work_struct *work)
 	if (ret == 0)
 		return;
 
-	if (ops && ops->currcon != -1)
+	if (ops->currcon != -1)
 		vc = vc_cons[ops->currcon].d;
 
 	if (!vc || !con_is_visible(vc) ||
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
