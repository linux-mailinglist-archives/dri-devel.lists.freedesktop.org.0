Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9141D8E07
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 05:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31966E087;
	Tue, 19 May 2020 03:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADEF6E087
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 03:04:52 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id z5so5830951qvw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 20:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lc2zMwWLXJOl3jyXXdBGRGX2X8SgERcHakgaWa3lWuE=;
 b=R/g/A24FWLHAz+WKIjwpeZDp2gBjRZVdZGUhDaTyrLQquELfaivMeibQl8n1Q7uuTR
 /K7u9Blp0cs/lg7fwYx19t2fHAVd7TdWYcnhkwtueB+ZuT7BZoHIcM1kgJL65B7rXVNY
 JIIS5/0gcqmvelnFyDsVTpmn+ynfa0sH8pYqs3BECgClHE5hZe5grOH4qTznwsJ377MM
 ORxlqbVDIMUL9pImLr8IG7mEOKVxYQz4RFgfrexOgiwVU3ROMuGdfC3vq/3Yg1ZTl4F2
 313xUjEuMalHSME2Vqq0A4KJHg4nPwqxpA09bZ3ICmDDemd50CMghJFn+xnX9Z4dTfrO
 waPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lc2zMwWLXJOl3jyXXdBGRGX2X8SgERcHakgaWa3lWuE=;
 b=sjZPJ9G1tRIrrQVPRElvMX04DzF5IrMT/JJd5cdqlVoshqlG0dRDaO6VCkvdNnVKcA
 6EtQjVfDDhoXevMI4+MlmJPkznkTtJ6VM9+ozxXlqNgAkr8l86yX9MTPwJV0L0C8pqkQ
 kEoLje6sbLY+FTAitPWXSzNFrnH5czvLlej9rY75dA46b9H1TSawoOx3LKJFLTPEjxzD
 jYhKOH8L6yChAh7kyocQ32WdVJWChG4Amh52Vk3G0FbvBeoawvkH4LozJPpD6/U6S+ix
 9eqPqjsZJI42hYZ4WQMLN3jmQkADuUU3Kqs57wBSkvYTVbbNd9/clyZ+D4A1HYBmKxE3
 o25Q==
X-Gm-Message-State: AOAM533Bd79CmmNuqwAIrVrNekt+TtkLYtMBJ8vBQM9FIpMvpEfY4FDp
 tSMhpSwTpIJT+1CQidSFj0lOTeUR
X-Google-Smtp-Source: ABdhPJzYP9ZyukICdtjkaf+aoQS/RxmnINipGy5c5tw3SDUWTadafQwj97XIHw7aHg8dJV+smEvrzg==
X-Received: by 2002:ad4:57cb:: with SMTP id y11mr19129673qvx.26.1589857491512; 
 Mon, 18 May 2020 20:04:51 -0700 (PDT)
Received: from localhost.localdomain
 (nrgwon0103w-lp130-01-70-48-229-222.dsl.bell.ca. [70.48.229.222])
 by smtp.gmail.com with ESMTPSA id h134sm9713229qke.6.2020.05.18.20.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 20:04:51 -0700 (PDT)
From: Mark Pearson <mpearson.lenovo@gmail.com>
X-Google-Original-From: Mark Pearson <mpearson@lenovo.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Lenovo X13 Yoga OLED panel brightness fix. Add another panel
 that needs the edid quirk to the list so that brightness control works
 correctly. Fixes issue seen on Lenovo X13 Yoga with OLED panel
Date: Mon, 18 May 2020 23:04:45 -0400
Message-Id: <20200519030445.23625-1-mpearson@lenovo.com>
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
Cc: jendrina@lenovo.com, Mark Pearson <mpearson@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Co-developed-by: jendrina@lenovo.com
Signed-off-by: Mark Pearson <mpearson@lenovo.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index c6fbe6e6bc9d..41f0e797ce8c 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1313,6 +1313,7 @@ static const struct edid_quirk edid_quirk_list[] = {
 	{ MFG(0x06, 0xaf), PROD_ID(0xeb, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
 	{ MFG(0x4d, 0x10), PROD_ID(0xc7, 0x14), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
 	{ MFG(0x4d, 0x10), PROD_ID(0xe6, 0x14), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
+	{ MFG(0x4c, 0x83), PROD_ID(0x47, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
 };
 
 #undef MFG
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
