Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60566574E6F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 14:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4906C10E517;
	Thu, 14 Jul 2022 12:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AE310E517
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 12:56:04 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id l68so981565wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vbTEm3oI6IgJFHsJWIHl+dQRVX68qV+BiPO2Jb+Qzcs=;
 b=aYafQQptpaj/jiAhls31/DMXbevapRrMNC4lYXGqKMk+WxvJH4CEUhd337xJdMlAtx
 dJHTi98XvDkj7TcURAng17HC0quMVUlP4guZ9gldHQIpnwAqH8d6CHvn0BaVRg2Kie80
 /9NQn4Ip4tsAOi8c4oKzTnJJ5BTv6s62RrZCamuIl3IhaKwxhRJOdSVYLrYGa6zYNXk9
 Y31qtNkjgej7UuTcd39GDn082uEXjZFzbXGUvK9k9MQmLqr76xDYcrJiomvItGQzKcoD
 wQOuDUrVVwaLl8bE9c+W0GCJKuJHsxS9flAKqEUR8KZ79u0C647AhHF2znv9yZGaaQ+G
 7RPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vbTEm3oI6IgJFHsJWIHl+dQRVX68qV+BiPO2Jb+Qzcs=;
 b=UsW7l9jrxUVX5Zfn3WfdKjW4lrUUAs4J/5arpDThOqvFlN1RNpeEUarQa8hZybRBRy
 INDnuAPPTduZ76KAkPYEhB/Y1gl/XoFbio8KchmUqb/8vvoX8RZsMeuohvNjAF5J/DH4
 4DDvxEzCt2fCqf7GjniU1/ntZSxJR3YQFtHGnZ0nBcdvPiDr6iOO/p1299fByt0tywLe
 3b2YBkGxhC0ZnptKtrnrmalZvIJGQl6Usr9CMU+ky7M0aiyprAouNJTmsVqS4sfZE+2V
 mGzYMb/WGUZcmw36wSDIxdL/VpUxbwpp+v3ooQZ/U2I210pDCYtQj2aMCZ8vSBf94CdQ
 rk9A==
X-Gm-Message-State: AJIora9WQE5u4iPMif0PiMZ1JVjBL1mxR3LQEJX0w9Qe5CH3nLLwZB1t
 usxaOJ0xDEzWeZwYpbCuSH1ajNJrEU7XtQ==
X-Google-Smtp-Source: AGRyM1vphDRTHe0FjntvAsam/bcOuRYiK+SBQJ5eie6byGyPW63ldZxb3fv3ZQMexvhYOitoK503uQ==
X-Received: by 2002:a05:600c:1c0e:b0:3a1:9a4b:28ee with SMTP id
 j14-20020a05600c1c0e00b003a19a4b28eemr14609203wms.203.1657803362957; 
 Thu, 14 Jul 2022 05:56:02 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c3b0200b0039ee391a024sm5733425wms.14.2022.07.14.05.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 05:56:02 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: flip-work: rename commited -> committed
Date: Thu, 14 Jul 2022 13:56:01 +0100
Message-Id: <20220714125601.34812-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in the list head variable, rename it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/drm_flip_work.c | 10 +++++-----
 include/drm/drm_flip_work.h     |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_flip_work.c b/drivers/gpu/drm/drm_flip_work.c
index 060b753881a2..8efb5f2c5773 100644
--- a/drivers/gpu/drm/drm_flip_work.c
+++ b/drivers/gpu/drm/drm_flip_work.c
@@ -104,7 +104,7 @@ void drm_flip_work_commit(struct drm_flip_work *work,
 	unsigned long flags;
 
 	spin_lock_irqsave(&work->lock, flags);
-	list_splice_tail(&work->queued, &work->commited);
+	list_splice_tail(&work->queued, &work->committed);
 	INIT_LIST_HEAD(&work->queued);
 	spin_unlock_irqrestore(&work->lock, flags);
 	queue_work(wq, &work->worker);
@@ -122,8 +122,8 @@ static void flip_worker(struct work_struct *w)
 
 		INIT_LIST_HEAD(&tasks);
 		spin_lock_irqsave(&work->lock, flags);
-		list_splice_tail(&work->commited, &tasks);
-		INIT_LIST_HEAD(&work->commited);
+		list_splice_tail(&work->committed, &tasks);
+		INIT_LIST_HEAD(&work->committed);
 		spin_unlock_irqrestore(&work->lock, flags);
 
 		if (list_empty(&tasks))
@@ -149,7 +149,7 @@ void drm_flip_work_init(struct drm_flip_work *work,
 {
 	work->name = name;
 	INIT_LIST_HEAD(&work->queued);
-	INIT_LIST_HEAD(&work->commited);
+	INIT_LIST_HEAD(&work->committed);
 	spin_lock_init(&work->lock);
 	work->func = func;
 
@@ -165,6 +165,6 @@ EXPORT_SYMBOL(drm_flip_work_init);
  */
 void drm_flip_work_cleanup(struct drm_flip_work *work)
 {
-	WARN_ON(!list_empty(&work->queued) || !list_empty(&work->commited));
+	WARN_ON(!list_empty(&work->queued) || !list_empty(&work->committed));
 }
 EXPORT_SYMBOL(drm_flip_work_cleanup);
diff --git a/include/drm/drm_flip_work.h b/include/drm/drm_flip_work.h
index 21c3d512d25c..2e1342cdc568 100644
--- a/include/drm/drm_flip_work.h
+++ b/include/drm/drm_flip_work.h
@@ -67,15 +67,15 @@ struct drm_flip_task {
  * @func: callback fxn called for each committed item
  * @worker: worker which calls @func
  * @queued: queued tasks
- * @commited: commited tasks
- * @lock: lock to access queued and commited lists
+ * @committed: committed tasks
+ * @lock: lock to access queued and committed lists
  */
 struct drm_flip_work {
 	const char *name;
 	drm_flip_func_t func;
 	struct work_struct worker;
 	struct list_head queued;
-	struct list_head commited;
+	struct list_head committed;
 	spinlock_t lock;
 };
 
-- 
2.35.3

