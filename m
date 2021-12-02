Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F65F466C47
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 23:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD84A6FBEE;
	Thu,  2 Dec 2021 22:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D2F6FBE7
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 22:27:40 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id n85so932086pfd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 14:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+OZEUzbJkhEl2ueO+0tubjfHfZwZ/3lRZTTLw8nIUe4=;
 b=hc4JGce2pZd1DWKE774zOsNlhycYp1UvUWX6JaKj7jkGVvKn09HeEo7ZeEZwH6iH84
 6lnSrvPwcvrHX7MVjsAsHF7vhLTuJNPOa1CHcN2Pa6KWDtVndA4i97T1Noic7mdhhGt1
 rrPEQOT78bWT9O/4PWfmzKoteAtSm/JQq1Gmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+OZEUzbJkhEl2ueO+0tubjfHfZwZ/3lRZTTLw8nIUe4=;
 b=RbE+d3Z2/HMDh9LL83xyPYaCXusoZj/Cx+nwhs/NdUAA9qlMvJmj+Sl4CDSWslxXmj
 oVSWFNuoMc5PnTKwVRkMNVJXjc6mZ3tEpYsEshw1V1Y773mne+QGlwRF5jr/gWRrekpT
 xL30RiBkKZvaVvOC+MDf/iFUYE9hNNpznCERHsjoiFGPlu3rMbzvIvFdLbl40vQxpbJu
 yBSMkixePJ4MHaIlzWgKVyP5YchBvy7I4SCZ2INtowfGQbevExqwoLWxcYU4qaVbFyRO
 j60WIt/sS1QYJKJN7DdUdF7pO00INbcYz1xY3mGZsb5c/M1M7xbFKIVlR9JE5witmuEY
 Fs8g==
X-Gm-Message-State: AOAM530giGqNntbfeuiJ+ckJtIb09NzLkDQOB3GngJg1MNyIgWu80San
 LoVcurlY5UMixf0WeLqppIKh+Q==
X-Google-Smtp-Source: ABdhPJwiY55jDA28x9n5iZ6VVhrQyYsyqFFR5L0DFKk6xLstxRqZjnkU4tFz0X8NjRuNCvXhZFCd+w==
X-Received: by 2002:a65:5ac8:: with SMTP id d8mr1555647pgt.258.1638484059598; 
 Thu, 02 Dec 2021 14:27:39 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
 by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 14:27:39 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 04/34] component: Move struct aggregate_device out to
 header file
Date: Thu,  2 Dec 2021 14:27:02 -0800
Message-Id: <20211202222732.2453851-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
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

