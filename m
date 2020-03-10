Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32677180C8F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D934A6E90E;
	Tue, 10 Mar 2020 23:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB32C6E2E8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:32:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m9so6898767wro.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTSKNjhkTPUhvHieKRKNo9OKCglUUf75Y8SFUIDPF94=;
 b=oe3lLYb2VJTK/cYnJvNzU5OpK0mPTfzjuJD+F9YMYyfVJ/t+AmHIugoNuGmcIvoU9Y
 EeaUpH9h2OXprhwgbtCo9n7yECDhrSNI1W1KhdqizKavVDcvAWqf3omtZ9zzt51I0rPh
 h6n8jnL8mmLbY2JW9OuXFp79v0Ch1liAMssyOQ2Oyau7CmcMZMNOM+f6XbF7zI2k1nE+
 V4b39W4ErWrRKaKpgiwNul6qpNgyxC5b7vpERvT2JwBGXuydMDuNzNy4GxDLoZhR8WJ0
 PMrRcjVi8KmQqZyQJkWIiL98QIAAMxqIIycH3EAM2ivmIjfS89SD8dxJyP8gbviy1U++
 ktOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTSKNjhkTPUhvHieKRKNo9OKCglUUf75Y8SFUIDPF94=;
 b=QQUrFa1UcBunUMOqcxiL+XKUKMgnc2SIZ4TFDH/fqzXWlmLXhsrJd3UYxFjIlmioW4
 pX1u/g9rhRKaBMHax4MC+b67HvGROACP5NQsJD4vaP1+3lY5rpEb6A6EK+8ig8FqMAYO
 RVoqIqfJjl1GHMn81K7UaGGlzQFkvh0SNMJaFdTfolUj9e+kQWb7kJocR8yLrRq0TBwy
 M/09Npd6zYPKSJaur/9UQ++m+BcNYzcfK6cr32RGUWknG0ctM1uRT1xL8Z5lawKY73cn
 vMswhGE8ESeUsgFelYUm9RkaMS6UR3hEpby5UbFlIu5UGxqLangSN6/yAze8r9YC4OlS
 M5Cg==
X-Gm-Message-State: ANhLgQ0Qs2gWA7kx7Lt8Y8Qg0jbEHor+Y5RSZTROPwUceYwF689pI0UW
 QjsJ4040oUPxUqCq0QhPRR0=
X-Google-Smtp-Source: ADFU+vsr5MTGUh6MoLka24KREcQMiRot37IVhStzHILNYiCyak9Qotha1lzAWhWg9+ITuaIsmaZ1Ew==
X-Received: by 2002:adf:8501:: with SMTP id 1mr29345378wrh.56.1583847125462;
 Tue, 10 Mar 2020 06:32:05 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:32:05 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 15/17] drm: make various debugfs_init() functions return 0
Date: Tue, 10 Mar 2020 16:31:19 +0300
Message-Id: <20200310133121.27913-16-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
fails and should return void. Therefore, remove its use as the
return value of various debugfs_init() functions in drm, and have these
functions return 0 directly.

v2: convert debugfs_init() functions to return 0 instead of void to
avoid build breakage.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/drm_atomic.c      | 7 ++++---
 drivers/gpu/drm/drm_client.c      | 8 +++++---
 drivers/gpu/drm/drm_framebuffer.c | 8 +++++---
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 9ccfbf213d72..c0056d9cc139 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1643,8 +1643,9 @@ static const struct drm_info_list drm_atomic_debugfs_list[] = {
 
 int drm_atomic_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(drm_atomic_debugfs_list,
-			ARRAY_SIZE(drm_atomic_debugfs_list),
-			minor->debugfs_root, minor);
+	drm_debugfs_create_files(drm_atomic_debugfs_list,
+				 ARRAY_SIZE(drm_atomic_debugfs_list),
+				 minor->debugfs_root, minor);
+	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 6b0c6ef8b9b3..82fbdee407b2 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -459,8 +459,10 @@ static const struct drm_info_list drm_client_debugfs_list[] = {
 
 int drm_client_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(drm_client_debugfs_list,
-					ARRAY_SIZE(drm_client_debugfs_list),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(drm_client_debugfs_list,
+				 ARRAY_SIZE(drm_client_debugfs_list),
+				 minor->debugfs_root, minor);
+
+	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 57ac94ce9b9e..46be88271fe5 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1209,8 +1209,10 @@ static const struct drm_info_list drm_framebuffer_debugfs_list[] = {
 
 int drm_framebuffer_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(drm_framebuffer_debugfs_list,
-				ARRAY_SIZE(drm_framebuffer_debugfs_list),
-				minor->debugfs_root, minor);
+	drm_debugfs_create_files(drm_framebuffer_debugfs_list,
+				 ARRAY_SIZE(drm_framebuffer_debugfs_list),
+				 minor->debugfs_root, minor);
+
+	return 0;
 }
 #endif
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
