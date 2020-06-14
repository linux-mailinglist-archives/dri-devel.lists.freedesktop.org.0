Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 178321F8F9C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED35F6E091;
	Mon, 15 Jun 2020 07:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983E96E077
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 01:41:59 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49kxyv2G4lz9vY7L
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 01:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Pxl_a_cz3At for <dri-devel@lists.freedesktop.org>;
 Sat, 13 Jun 2020 20:41:59 -0500 (CDT)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49kxyv0NlJz9vY7G
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 20:41:59 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49kxyv0NlJz9vY7G
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49kxyv0NlJz9vY7G
Received: by mail-il1-f200.google.com with SMTP id k63so6850239ilg.17
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 18:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RpBLca7Vpqp9NG1nh6LCEacLvQmpL511GojbmNx9nJ4=;
 b=Wjxn1rKfuw9BdNj2jJqRd7zUXS9Idph8gy/wDlJtPVuwZrLE8Aka8rkIwQd9yNRv2j
 mp6xtnBdLpUQvYUCouBoe9YCvCw1QHEELjP3WK4Wxk9OXb6mMtjzG8CQh0GtUppw9Gc6
 dWbbxPDrdmVsUt4miSIsz6UNxBDG5POTtsldrhrjfLt2vmWM2qnFUamAhzuoCEMYvYRM
 VXIZ7l8w6zQBftrBD7x8nr4Uxx/FaS3nOoynwTxUiZnFUjE+pGvrkpZBhxP+mMpisWO8
 TKz/cSX1R2QUiUafPIrU5iN7W6xqcwTwaJHIvFlhxLmt13rKt5GEnbhqL66pT/WMeaE2
 wadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RpBLca7Vpqp9NG1nh6LCEacLvQmpL511GojbmNx9nJ4=;
 b=MGGX83gKOCy8kkr5UKVnxxNTfiNvoGTuJLNax//ATlPSmOEO9DXIdjFdhgV6i0GxiY
 6/Fpu5ZJLHTI4ilVb5x8D91/vpdbmN2wi+rIUvH+lKOXIf1qyF+CJYKsYVT+ACqnsY1P
 Ch5TTLDth3I/D0I28A34aEUcQuHeEpO5lwQJWSPT1AKJ3F/Jl7vuR8bM7VR+PpZzmafV
 n6i4g4Fhcq613y4sOMfK9iMXkCTq/14x/QTOGqlOa2M5V3OKbo+s47mor1cvKGITfr8v
 VVksJ3lQS4B4e+T9OXK/ca+e5NskUpN/5W3FBkwpBbnRT91f+B9YzuSDwp6Cx6bd2IDx
 JBjQ==
X-Gm-Message-State: AOAM530Z9ZWedm9fH5I7Z0ICyFWz6ZbSccDLvsh5CEK1i3T5sWO5HaQ6
 QWF2psqGO+YJ3P1EOvo3Vir8TGpeda92MRWU073LoBDyO6ri0lm0v0TaQ4yqRrKWxYs1HFJxEHg
 f6SNc/j0tnxBAnxWgqatqmLvKCrwwI9b3
X-Received: by 2002:a92:d704:: with SMTP id m4mr19565772iln.248.1592098918707; 
 Sat, 13 Jun 2020 18:41:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBLK54k4OZ8RbUQudZFJkUsqfkSvb0zM96jD7mAQJP4d+aXqcGxn5UyF7jykVx6il8g76RcA==
X-Received: by 2002:a92:d704:: with SMTP id m4mr19565762iln.248.1592098918550; 
 Sat, 13 Jun 2020 18:41:58 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:d65:8ac4:1b02:86ac])
 by smtp.gmail.com with ESMTPSA id y5sm5644372ilp.57.2020.06.13.18.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 18:41:58 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] drm/nouveau: fix multiple instances of reference count leaks
Date: Sat, 13 Jun 2020 20:41:56 -0500
Message-Id: <20200614014156.122729-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On calling pm_runtime_get_sync() the reference count of the device
is incremented. In case of failure, decrement the
ref count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 8 ++++++--
 drivers/gpu/drm/nouveau/nouveau_gem.c | 4 +++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ac93d12201dc..880d962c1b19 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1026,8 +1026,10 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 
 	/* need to bring up power immediately if opening device */
 	ret = pm_runtime_get_sync(dev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_autosuspend(dev->dev);
 		return ret;
+	}
 
 	get_task_comm(tmpname, current);
 	snprintf(name, sizeof(name), "%s[%d]", tmpname, pid_nr(fpriv->pid));
@@ -1109,8 +1111,10 @@ nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	long ret;
 
 	ret = pm_runtime_get_sync(dev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_autosuspend(dev->dev);
 		return ret;
+	}
 
 	switch (_IOC_NR(cmd) - DRM_COMMAND_BASE) {
 	case DRM_NOUVEAU_NVIF:
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 4c3f131ad31d..c5ee5b7364a0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -45,8 +45,10 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 	int ret;
 
 	ret = pm_runtime_get_sync(dev);
-	if (WARN_ON(ret < 0 && ret != -EACCES))
+	if (WARN_ON(ret < 0 && ret != -EACCES)) {
+		pm_runtime_put_autosuspend(dev);
 		return;
+	}
 
 	if (gem->import_attach)
 		drm_prime_gem_destroy(gem, nvbo->bo.sg);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
