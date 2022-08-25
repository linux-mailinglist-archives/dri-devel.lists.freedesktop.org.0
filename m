Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBFB5A0A44
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 09:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CDD10E1D2;
	Thu, 25 Aug 2022 07:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB4814AD46
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 07:29:23 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso3983010pjr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 00:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=JbGIvcsfEVLV1RHydnmdeBi6HQ0+QJqGOf7I2WG/zUU=;
 b=Gn19uEzPb7lUl0trxaRTO63z3RoJGahgxtzhBIpVj3lyr1LRBHrAq8oJ4fIhKo0UpP
 to4/XSiJLyZp8ZrSe8iPg0bH8AGAwBKMhxdeYi5x5vMf3cnEngrtZptU8h5fVPvSKgF5
 aDoq1Kv8rbqLGTV6rMFZ4e1PBb3hOdxscLNsHHeGKxRGvCQAbQXEcin0v5ck4nsvEaIk
 4sWhjdOx7TtGh77Y28V0lmHH/yEhiOJgEfhfReaPAx63g8ad5etZSzv8F4sS9/8jIV0E
 4UdcllTUSpQDeWqWp/EjGbC/eBz1yfWZZrPMtmL6yYWUWhI8iyiPA2sHu1AFbc2a23c3
 UTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JbGIvcsfEVLV1RHydnmdeBi6HQ0+QJqGOf7I2WG/zUU=;
 b=ye3uhBkf+csn88AQjlhTew2IC/Z6HjZwNnrzsAtRt+G5+da5jJXGFW1jE+4q/n2Ogp
 9SBZJEfZp4pTi5qWCdwv62Xsp98sA95rX8ZlFl0Tx8a6PUBznaVWxcwhDGfCN6m+yDQJ
 yxCs04mGmGvbgbYmBTNWfnRZNCMMzae0OSvMXPdS+FrC1f2EQld3Smc1Lrhh/e8gbF9K
 rHnwM7PIS1+XfnMSUCxRmeS/hGdfFF1ujMLjTPQtO1hB3pNJXP/lX+gsaSINqmJUoSG9
 7mNNvA3Pg3pF3RDUx+Lu0Ovd0EV5HFWhPIpMN9zwEOo28/BYtMwKvoKfYL02Z0FMRLu1
 8DdA==
X-Gm-Message-State: ACgBeo3uaGOqc84EjV4GN1tUa368VolBui7lm32rlBs8hh1nJQHPTxdO
 S9ABTNaBO9feAM8w+yeNIks=
X-Google-Smtp-Source: AA6agR5eNdfyGjsShlxMUK2iVcd7RJHNVejWbYcPuno1FY9q/ArdYNJAmLGhc8KM1dSd3IJ5yeGo7w==
X-Received: by 2002:a17:902:b581:b0:172:a34e:18fd with SMTP id
 a1-20020a170902b58100b00172a34e18fdmr2500538pls.163.1661412557593; 
 Thu, 25 Aug 2022 00:29:17 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 u66-20020a626045000000b005363bc65bb1sm11213146pfb.91.2022.08.25.00.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 00:29:17 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: jernej.skrabec@gmail.com
Subject: [PATCH linux-next] drm/bridge: parade-ps8622: Remove the unneeded
 result variable
Date: Thu, 25 Aug 2022 07:29:13 +0000
Message-Id: <20220825072913.229357-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 ye xingchen <ye.xingchen@zte.com.cn>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value ps8622_set() directly instead of storing it in another
redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/bridge/parade-ps8622.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 309de802863d..c605cd725606 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -324,14 +324,12 @@ static int ps8622_send_config(struct ps8622_bridge *ps8622)
 static int ps8622_backlight_update(struct backlight_device *bl)
 {
 	struct ps8622_bridge *ps8622 = dev_get_drvdata(&bl->dev);
-	int ret, brightness = backlight_get_brightness(bl);
+	int brightness = backlight_get_brightness(bl);
 
 	if (!ps8622->enabled)
 		return -EINVAL;
 
-	ret = ps8622_set(ps8622->client, 0x01, 0xa7, brightness);
-
-	return ret;
+	return ps8622_set(ps8622->client, 0x01, 0xa7, brightness);
 }
 
 static const struct backlight_ops ps8622_backlight_ops = {
-- 
2.25.1
