Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A60486C2D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 22:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BAB10EE46;
	Thu,  6 Jan 2022 21:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB4E10EE37
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 21:46:04 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id z3so3402154plg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 13:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+OZEUzbJkhEl2ueO+0tubjfHfZwZ/3lRZTTLw8nIUe4=;
 b=QdNjIAobt/derYc6c3Gs9KGKe+gcE2F48axRhJXhDfWd037tfkRhiOvU+6INALe1xW
 l0X9pnu/3HJXfqPLowTbh129vmKQPv4Yba8RdqPUG4CGzbjJgcRNO4VLW6C4/gLrecXc
 hkmq4B3C/LNmQfiTrtbuw0RBZRXj4anmUvV3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+OZEUzbJkhEl2ueO+0tubjfHfZwZ/3lRZTTLw8nIUe4=;
 b=adRrXcJiBQr2CJTdodOLw+o2cBj1Uuybz789TQpLI5mBljfDojRpEaggU4YKqrULFs
 kg2UjEYqDxmnkf2QlRLZsn7zge2WOJp4xhO84vESnnqkk2V+bDlU3Dg8BdrFhWQ/aIRd
 ttpM213GKbZAoIqUTB0OpuLZgbcIUst3UhZYVkyVR36wcIWjSQqaHxMW7trBl7TzERrO
 oQBzz0A+GajjfXz5Xn6BLMLJSUD8LL1d6YVakpkE/hxs2wV+0fJcHYVzES/iy9vvMLeG
 PMYBNowTkc8J8P4VJoCf4V1O88jaWOLbLNR2YDqSsnOVLTFgAwCaiEbTg8dQByisCmdZ
 Z3Ww==
X-Gm-Message-State: AOAM53340pnwbuJJS12Pjq9+3t+zU10EPLlug0HUX4k3Sc5TkWFfdbvH
 fGfLimxpTeJjZIpFFNYIjg0/FA==
X-Google-Smtp-Source: ABdhPJx2Rn+if/ljePBBBfU5FyTBFf4xXawEJ++3znnA8VPOwm/9Zu1BwYB/KNJZYwq/dJQOifJsIA==
X-Received: by 2002:a17:90b:384a:: with SMTP id
 nl10mr12390792pjb.203.1641505563694; 
 Thu, 06 Jan 2022 13:46:03 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
 by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 13:46:03 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v5 03/32] component: Move struct aggregate_device out to
 header file
Date: Thu,  6 Jan 2022 13:45:26 -0800
Message-Id: <20220106214556.2461363-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20220106214556.2461363-1-swboyd@chromium.org>
References: <20220106214556.2461363-1-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows aggregate driver writers to use the device passed to their
probe/remove/shutdown functions properly instead of treating it as an
opaque pointer.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 15 ---------------
 include/linux/component.h | 19 ++++++++++++++++---
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index eec82caeae5e..dc38a8939ae6 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -56,21 +56,6 @@ struct component_match {
 	struct component_match_array *compare;
 };
 
-struct aggregate_device {
-	const struct component_master_ops *ops;
-	struct device *parent;
-	struct device dev;
-	struct component_match *match;
-	struct aggregate_driver *adrv;
-
-	int id;
-};
-
-static inline struct aggregate_device *to_aggregate_device(struct device *d)
-{
-	return container_of(d, struct aggregate_device, dev);
-}
-
 struct component {
 	struct list_head node;
 	struct aggregate_device *adev;
diff --git a/include/linux/component.h b/include/linux/component.h
index 95d1b23ede8a..e99cf8e910f0 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -5,6 +5,8 @@
 #include <linux/stddef.h>
 #include <linux/device.h>
 
+struct component_match;
+
 /**
  * struct component_ops - callbacks for component drivers
  *
@@ -39,8 +41,6 @@ void component_del(struct device *, const struct component_ops *);
 int component_bind_all(struct device *master, void *master_data);
 void component_unbind_all(struct device *master, void *master_data);
 
-struct aggregate_device;
-
 /**
  * struct component_master_ops - callback for the aggregate driver
  *
@@ -80,7 +80,20 @@ struct component_master_ops {
 	void (*unbind)(struct device *master);
 };
 
-struct component_match;
+struct aggregate_device {
+	const struct component_master_ops *ops;
+	struct device *parent;
+	struct device dev;
+	struct component_match *match;
+	struct aggregate_driver *adrv;
+
+	int id;
+};
+
+static inline struct aggregate_device *to_aggregate_device(struct device *d)
+{
+	return container_of(d, struct aggregate_device, dev);
+}
 
 /**
  * struct aggregate_driver - Aggregate driver (made up of other drivers)
-- 
https://chromeos.dev

