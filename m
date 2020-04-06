Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F283519FE61
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 21:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FB26E492;
	Mon,  6 Apr 2020 19:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964696E48F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:47:58 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n17so1036784lji.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 12:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uqwutzvD9lrYMVWyN+awiR9xZZTf42LK6xxKmLiXYAA=;
 b=pKhT78iqNm2hHA4WJESQJh804iicajRhY1/sRHRDYzpyCe1FumcZ1RUHUA0exOVHLH
 tVm0NRGPQZCoNuy2YelJwgf4ViM/IAsEKBN3tQGUB3WBBHGIt5i5/r8xQsZd4QAAouEk
 1jFvykex+1eXIoCvI/iriWqxjWt3AH4VlLyRcjemXwaPW5Am0dRtVdEJwcTp1QYZQOG/
 ymUOmvYb5G/9vB/lu+ap7u+IbcPgKTfGrWfkmbm2Cnr5mqEQ7+UlNer0k7MYiNeiK9xM
 CaaKMSX65vevIp0Fp2mVsrxwi5Xd4DgjkSSDPlpG6CgUNFf+5br9OsbXgfrsCK/YB4zI
 XbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uqwutzvD9lrYMVWyN+awiR9xZZTf42LK6xxKmLiXYAA=;
 b=EzXhfV4MlM3Rac3EBK7/hofsemE027440808GP3NTPIgStZgA9EIfks57kKSSafWuE
 ctAZ4aFMTw7njj/bCznsY3iJFC8DdV9Mn5MUuHL4sWgeildz5CC5VOLgr1A+evrlDxBJ
 Rw7BhhTjdm7sQ6fwCeLylfPKhFDKWij4g4HAdzM67Ms5WOYcKt+pKSl39K04ogH0uJTu
 TlCqLfpgiYOxJmDl48kEjrWM6g3TGDXxv0le/9XmQAWMboNESXqDTfF10eGSjDL09A5A
 knWLJA2VNhwvc0X8wSjvHbRYoKHtiaSo9jk+uT6El2Ok47JMNTZ6XuPdLLgxhMjZHtsq
 CuHQ==
X-Gm-Message-State: AGi0PuY/egNQExxP7StQhCEnWbjApASEl1V5wqxU8ogsVeK4Bj4ZxoDb
 a/F1TOkdjm6smhCI0wDHchDjpYy3fao=
X-Google-Smtp-Source: APiQypIT2LuEl/+KtMmFbY/zocB+LYM0FONnHiDHScfqbo8WDuW8j/1S5ZHcd0Mly81LJcaxX58jzQ==
X-Received: by 2002:a2e:89c5:: with SMTP id c5mr547644ljk.48.1586202476647;
 Mon, 06 Apr 2020 12:47:56 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 b16sm10525276ljh.20.2020.04.06.12.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 12:47:56 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 3/3] drm/writeback: wire drm_writeback.h to kernel-doc
Date: Mon,  6 Apr 2020 21:47:46 +0200
Message-Id: <20200406194746.26433-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200406194746.26433-1-sam@ravnborg.org>
References: <20200406194746.26433-1-sam@ravnborg.org>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_writeback.h included a lot of nice kernel-doc comments.
Wire it up so the header file is included in the kernel-doc
generated documentation.

Added a few simple comments to the two structs so they
get picked up by kernel-doc.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/drm-kms.rst | 3 +++
 include/drm/drm_writeback.h   | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index e1f685015807..397314d08f77 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -397,6 +397,9 @@ Connector Functions Reference
 Writeback Connectors
 --------------------
 
+.. kernel-doc:: include/drm/drm_writeback.h
+  :internal:
+
 .. kernel-doc:: drivers/gpu/drm/drm_writeback.c
   :doc: overview
 
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 777c14c847f0..9697d2714d2a 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -15,7 +15,13 @@
 #include <drm/drm_encoder.h>
 #include <linux/workqueue.h>
 
+/**
+ * struct drm_writeback_connector - DRM writeback connector
+ */
 struct drm_writeback_connector {
+	/**
+	 * @base: base drm_connector object
+	 */
 	struct drm_connector base;
 
 	/**
@@ -78,6 +84,9 @@ struct drm_writeback_connector {
 	char timeline_name[32];
 };
 
+/**
+ * struct drm_writeback_job - DRM writeback job
+ */
 struct drm_writeback_job {
 	/**
 	 * @connector:
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
