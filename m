Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B490BA3A3A8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD7410E740;
	Tue, 18 Feb 2025 17:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WKejIpoN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5911110E2B8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:22 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4396a4d5e3bso42449435e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898501; x=1740503301; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b1/MGJA6ABLV0I3ehMALxcBw1PNxhc/iy12fyDBkAZY=;
 b=WKejIpoNq0f22KnKBM+vZP4NUpda7A3g5O0Qjm65X3oMlzPN8G7DTsOTUQ3agYw8gx
 +dLMm0a0/RQHe8nINijGKCnbyD+S/CaHdbAGtUzNNniOj4FhwUqcKvWhQMIgPh2otGWS
 F5PKOk/1ndwqYKP1RY1ShSOUipHZ+eFNdh6pqzpYz3BEvXoTLnPzGyfmVQDKsDwXBXD6
 zyF6ejKTSZ3OyNMvy3d+DlRcXkhofizDojIO7quJBRHD6kipFOKQWFZ/hfv6oyFa1Gfl
 4WKSr8a9zfk88R1uFX0Q2q1GMoaJz54UXnQYUySJRhudlewYjK4Dj4toFY2snPTguAcT
 SRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898501; x=1740503301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b1/MGJA6ABLV0I3ehMALxcBw1PNxhc/iy12fyDBkAZY=;
 b=ZYcpoP4Xy3TKsKzGzLS/60JeVFCxZPL7eZBxYl4E4Bs5OQ7LRdTYesNkA0XcTdkH/B
 qUg1mdM9e3ZYXCLUxt6aqdXWPRwE5+eqsz5h3yaz4FI1cFCj1w6/oxY6VpMm6j96EeF/
 XQT4jez6a2zEQePhlZ7xBbZ9ngCnIWEbuu19G9VFXhGKhzdFWMigzFY2q1OYG5h+Kl9g
 P4IoxE1/qJgVPIxb/1174NfGtmWuCnOTxTS5UBd/6DmYuDIq7+0DjxtW9FhtCQkiqKh1
 5cin75gbugwAZz5wbwq62CKyT1HI1hOhqMuZ9kyykY+H11RZwu/ZHn3AcSmOE4th57LF
 m2og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfS+9aP6Jv856zmVNCbniH3RRxiYDhuT74V5he6vROwfPIyPvf4iFI7LYT2Mk8eWRu5Me3l9lq4lU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtqPe+flIB+Na+46auASCgQyeG1IIweZcfsFnzpcU3ofcZ4Xvz
 xmEjqvsBaMPhJ0wMhp8XkMAbfGJljwMvp9XRpe3RlA/nlvtWdZRo
X-Gm-Gg: ASbGncsBaJe0PDIZcUo1ijBDkbbdI7ZCyxfOYfgvEsPgeZcYSqV+i/r1Bk4ce+qud/q
 eZ/745E3ywQT5W14RNDVOjKKSQX/xesPWliX+uctYnvrdoRlSWKHiGmTwFVcN0YENJ8KVYnPMAU
 BTiOEETY7Jz9vWsG8TvkGCNYKEkI6PRfwj12uEwLsVUJiTcHWlTzlqTNOrL/DsSRYHuLzFkKYIr
 +viw6mEAyV+V48bcVyWZhLmxPsXArheytIHZ4iw50Zfy160Esvf/eBblW35M3BijzbJPLjphMwP
 5b4IUqXFs942ToBcVQ==
X-Google-Smtp-Source: AGHT+IF1iQmYZpMoTMMeqAXis1UUCoLwudIFl99fCClIyXGpAUbfavofD4v8daX3RdLtI67Xxu9Krg==
X-Received: by 2002:a05:600c:19ce:b0:439:6a7b:7697 with SMTP id
 5b1f17b1804b1-43999da70d4mr5526705e9.14.1739898500661; 
 Tue, 18 Feb 2025 09:08:20 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:20 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 06/16] drm/vkms: Allow to configure CRTC writeback support via
 configfs
Date: Tue, 18 Feb 2025 18:07:58 +0100
Message-ID: <20250218170808.9507-7-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218170808.9507-1-jose.exposito89@gmail.com>
References: <20250218170808.9507-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a CRTC is created, add a `writeback` file to allow to enable or
disable writeback connector support

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  4 +++
 drivers/gpu/drm/vkms/vkms_configfs.c | 47 ++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index da5157adfd79..4e87d8a81844 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -93,6 +93,10 @@ Continue by creating one or more CRTCs::
 
   sudo mkdir /config/vkms/my-vkms/crtcs/crtc0
 
+CRTCs have 1 configurable attribute:
+
+- writeback: Enable or disable writeback connector support
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 52205a8a9cb4..88037a57a138 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -73,6 +73,52 @@ struct vkms_configfs_crtc {
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
+static ssize_t crtc_writeback_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_crtc *crtc;
+	bool writeback;
+
+	crtc = crtc_item_to_vkms_configfs_crtc(item);
+
+	mutex_lock(&crtc->dev->lock);
+	writeback = vkms_config_crtc_get_writeback(crtc->config);
+	mutex_unlock(&crtc->dev->lock);
+
+	return sprintf(page, "%d\n", writeback);
+}
+
+static ssize_t crtc_writeback_store(struct config_item *item, const char *page,
+				    size_t count)
+{
+	struct vkms_configfs_crtc *crtc;
+	bool writeback;
+
+	crtc = crtc_item_to_vkms_configfs_crtc(item);
+
+	if (kstrtobool(page, &writeback))
+		return -EINVAL;
+
+	mutex_lock(&crtc->dev->lock);
+
+	if (crtc->dev->enabled) {
+		mutex_unlock(&crtc->dev->lock);
+		return -EPERM;
+	}
+
+	vkms_config_crtc_set_writeback(crtc->config, writeback);
+
+	mutex_unlock(&crtc->dev->lock);
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(crtc_, writeback);
+
+static struct configfs_attribute *crtc_item_attrs[] = {
+	&crtc_attr_writeback,
+	NULL,
+};
+
 static void crtc_release(struct config_item *item)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -92,6 +138,7 @@ static struct configfs_item_operations crtc_item_operations = {
 };
 
 static const struct config_item_type crtc_item_type = {
+	.ct_attrs	= crtc_item_attrs,
 	.ct_item_ops	= &crtc_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
-- 
2.48.1

