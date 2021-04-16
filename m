Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD8A3622A0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD596EC28;
	Fri, 16 Apr 2021 14:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7A66EC0F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:38:10 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id d21so12453799edv.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4gQV8mJJSsa7/geg3uIIMju4DuwjY0BUG1OfqH4cLSs=;
 b=u6xbTe3xnS1gxy5a6K6GfhsnvR+yi1tODlvBP0VAE7+3t8Yro6VDBbKwS753lIQs8W
 p8WxAHkE8yRXaFTsQ38fO6gNDCMye+0iXJ/bugUjU/Ukti+9nG2YiCz6A+JztQ2Ikvj5
 eMvhwvqeXTPrDQRWGMaC3DUQtFfLgU2G9nWqHX9QFDcRjFNRv/K/LgJOJLy+KZ6XETul
 PJHcTwK+yLHk4N6r3Vq/316CC6LRR67mt+GiT8UKl3AieE0d2tNYrCmuYtEKNFiRIE+6
 iwlq0JUnw59qA52zPXYh86eRrO/5DQMhpYcgBvdCYWqrgvhyuNJ2iJlb5LDEOnIdIn9W
 HsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4gQV8mJJSsa7/geg3uIIMju4DuwjY0BUG1OfqH4cLSs=;
 b=I05b3a42cVLWsEZNq6/CdmoxpYpiFh5h/IrlpEQswOr8fEYpymdieTsDxzmZhCkVhj
 YWJT4TG9NPkGFJey533qiI80EF8A3rzICl0F2AR+QGOwx68ZYIOvxq9KBVsE3wRwjTpe
 gJo6ef6tXdASH9eAktFpnYGbJE7+RiLmvwri33VhTLvlK0zI+cHUN3JOlC+rjl9Vbsz+
 3SuzdbmwLjLjjIlZuoZtB/4IJHzZ+LwVBM2sDkIeOi+GRaRnREbXYvH4W2HH4IQffFR3
 GQFwvxXLUmLFRd9M1Ffb0aQdzx5ZkA52K8uduQuo74iVgu+08XJCG7ema5tzVPHe1cYP
 Mg+Q==
X-Gm-Message-State: AOAM5334nSII/O+Z2Fh331IUw4+JJmIwOWMJcIgCapV1KYdFIhlW+IKH
 lii65CHxp1BsdWT2GzZMnJEz4w==
X-Google-Smtp-Source: ABdhPJx6hl0NeE9v7r2wwoPvU738KX9/i1DbfaWlqv4VwG0bItjiP/oOEsDadsPe3idoRSOBEDjryg==
X-Received: by 2002:a05:6402:b07:: with SMTP id
 bm7mr10115095edb.82.1618583889302; 
 Fri, 16 Apr 2021 07:38:09 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:38:08 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 37/40] drm/panel/panel-sitronix-st7701: Demote kernel-doc
 format abuse
Date: Fri, 16 Apr 2021 15:37:22 +0100
Message-Id: <20210416143725.2769053-38-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/panel/panel-sitronix-st7701.c:42: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 4d2a149b202cb..320a2a8fd4592 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -38,7 +38,7 @@
 #define DSI_CMD2_BK1_SPD2		0xC2 /* Source EQ2 Setting */
 #define DSI_CMD2_BK1_MIPISET1		0xD0 /* MIPI Setting 1 */
 
-/**
+/*
  * Command2 with BK function selection.
  *
  * BIT[4, 0]: [CN2, BKXSEL]
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
