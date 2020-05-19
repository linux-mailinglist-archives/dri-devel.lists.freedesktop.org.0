Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5511D9082
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2AE6E2DE;
	Tue, 19 May 2020 07:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FF46E087
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 02:57:01 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id f13so13067930qkh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 19:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lc2zMwWLXJOl3jyXXdBGRGX2X8SgERcHakgaWa3lWuE=;
 b=WCZctJlqU3L+DU3qf+gUaT3Gv18S0DgUIlnksWolTEz46G/GkL8tFFnM8YOYEqdm+f
 G+BL6kb3j9ZvYTtzTEJq0K/NlkjDQymzrhbSd4/3HdGukRUqYI6VSCbkeEGvGs1I/H2/
 QQlIpNuTN8IlVHhPcpeMwnMp+xcopxhviY2eozJYpO7m/DwpAYD3T3ppkpH7Mo825OCm
 9rnjG0niO1M/+ePpcnnSWatzJptOBJYCxkwaldZlJyYeSYiz5U6rZ1YcjNsiOc3+qSiE
 TEbeBBJxIAtcpu2xGJWIhS673gqx7P4xHOw1DXFNh3QvcdwIu8ZIz559H3RhtemZijO/
 RpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lc2zMwWLXJOl3jyXXdBGRGX2X8SgERcHakgaWa3lWuE=;
 b=axfS98WOPazRce0u1GV2BsoDOZ4q1SdMeKhB4WIjVZhMxjA34GBrO2UM65TKy9G7sC
 8a63oKh2ryhM2SGQUmElG9vPp/pGeMQEhglTXLRfd5Nu9gNuqFNhMrh7BwJ35m1vTmtD
 Gq0ptt8uG5MwHUhN1M3c0KefibKTYX2ES7i7gZnzf5lddnZw3U7Qi3ycMSaAxqSLdKkw
 Kp+WfPCTs9eiuKroHUjJF/Cdycfw/xtcRJJMklArrox+74sv8v9LSlQiWcm6jpkYHPJU
 IIDe4OvUilSNVkSb2gL/ZR0tECGgFXurrlV73ZIsz/9oMOQkW6Q/hYqzSmzw8N+Q7mS3
 mnpw==
X-Gm-Message-State: AOAM532MoUgKMJw4WVDvhxrxFN0r1qhYE65qfy53m53HKKPmvCCWlnKu
 vbTE/qkHwLJa3YM59bbaj0wBocQP
X-Google-Smtp-Source: ABdhPJy/ngg6pMqt/R7GU21yquKtp5+cyercUZDglxCmwc1iqCr/pW+shKj9+iUKg5b+RlBy/TOn8A==
X-Received: by 2002:a37:2fc1:: with SMTP id
 v184mr11352302qkh.444.1589857020093; 
 Mon, 18 May 2020 19:57:00 -0700 (PDT)
Received: from localhost.localdomain
 (nrgwon0103w-lp130-01-70-48-229-222.dsl.bell.ca. [70.48.229.222])
 by smtp.gmail.com with ESMTPSA id d74sm2561512qke.100.2020.05.18.19.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 19:56:59 -0700 (PDT)
From: Mark Pearson <mpearson.lenovo@gmail.com>
X-Google-Original-From: Mark Pearson <mpearson@lenovo.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Lenovo X13 Yoga OLED panel brightness fix. Add another panel
 that needs the edid quirk to the list so that brightness control works
 correctly. Fixes issue seen on Lenovo X13 Yoga with OLED panel
Date: Mon, 18 May 2020 22:56:35 -0400
Message-Id: <20200519025635.22846-1-mpearson@lenovo.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 May 2020 07:00:27 +0000
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
