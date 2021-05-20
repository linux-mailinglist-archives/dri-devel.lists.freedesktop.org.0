Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D622C389A7F
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 02:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3416E5A2;
	Thu, 20 May 2021 00:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8BA6E4FF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 00:25:28 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id f22so2711798pfn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 17:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gm72nwXpdE7RmMD+c9dyNsOFYFMq7AQj3MbF+XKSlWQ=;
 b=UqC0yWQ9R5JvKixzeUdDD01pWSLv+fpdp/03qcIkZhAwK5Kap/ew8RZePWbSbXRD46
 q7WXLSHmfaKhKooj+IesNu1xcAVOJFXJF81IxZikgaJSTDZ0fwlQ2IFnCrPfQSqsVVO3
 Gk1Kmcp7VlHe8VSzzpXYjlL4s0Q2kRDPsORxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gm72nwXpdE7RmMD+c9dyNsOFYFMq7AQj3MbF+XKSlWQ=;
 b=RJXqH3YHdvOJhu5aBovdqSKkJNKFGxN38MX+bfkrU9pj2QQi+tvASz58e5iTSG4GpV
 7ETjBK97ABY6ZDKanhgC6CYFLKMIifESUUErMNej12V/Fff+Uzpfmc9AiswTUkwD+KxG
 olS6e9lMLTvMfScBQhW1jLuA4Dblt7Iy1qsnr9hpSN7LAW+Cd/sfNMBudu8LpNC1IL2O
 AMqS6pLO95sQRrMBtKQV0vIuDrqu13YIdEcE9EOsWvzHCmweM2n+NfEoq2iSHKi//2oJ
 YvCD0V7Y3JcV9APQLLlf+dLAVnoiBtsFIj+9emdTGDpqKXe37G2EY7Yb/YaKFtpwhfs3
 Y+gw==
X-Gm-Message-State: AOAM533VdBVRojpiRJXv3ZdrTfgtmrDtuwfToysn2gH59OwlW83jdRrT
 nkdnLtCVRpKrbNUD9sT+2eSD3g==
X-Google-Smtp-Source: ABdhPJwNWO63s1Z5yApVrizJPTmgihkFNM8TC2kJOBfC18nrxp5jGPb+J16z/e7HhYyam76qI+Pa9Q==
X-Received: by 2002:aa7:870c:0:b029:2a1:f060:f17d with SMTP id
 b12-20020aa7870c0000b02902a1f060f17dmr1648391pfo.24.1621470327798; 
 Wed, 19 May 2021 17:25:27 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:200b:db75:4e6c:8b96])
 by smtp.gmail.com with ESMTPSA id i14sm398904pfk.130.2021.05.19.17.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 17:25:27 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 6/7] component: Move struct aggregate_device out to header file
Date: Wed, 19 May 2021 17:25:18 -0700
Message-Id: <20210520002519.3538432-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210520002519.3538432-1-swboyd@chromium.org>
References: <20210520002519.3538432-1-swboyd@chromium.org>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows aggregate driver writers to use the device passed to their
probe/remove/shutdown functions properly instead of treating it as an
opaque pointer.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 13 -------------
 include/linux/component.h | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 155aab7eefa6..1b4c84453319 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -62,19 +62,6 @@ struct component_match {
 	struct component_match_array *compare;
 };
 
-struct aggregate_device {
-	const struct component_master_ops *ops;
-	struct device dev;
-	struct component_match *match;
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
index bc71d34a3416..d19cc3418d12 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -39,7 +39,7 @@ void component_del(struct device *, const struct component_ops *);
 int component_bind_all(struct device *master, void *master_data);
 void component_unbind_all(struct device *master, void *master_data);
 
-struct aggregate_device;
+struct component_match;
 
 /**
  * struct component_master_ops - callback for the aggregate driver
@@ -80,7 +80,18 @@ struct component_master_ops {
 	void (*unbind)(struct device *master);
 };
 
-struct component_match;
+struct aggregate_device {
+	const struct component_master_ops *ops;
+	struct device dev;
+	struct component_match *match;
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

