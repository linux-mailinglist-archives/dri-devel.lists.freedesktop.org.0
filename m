Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0E5A4493C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DB210E67F;
	Tue, 25 Feb 2025 17:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cuCsOpiy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9134210E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:49 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4399deda38cso36716245e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506388; x=1741111188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+1Ilm0hsqaAWJ6FLSDKxA/oNa1o2785HX4v9RhTC7S0=;
 b=cuCsOpiy61Sxv7IzB5EmUHpMIvjKRTNlhRrDvlCT/CKLve3TOoL9QLvxPAdLIt2erO
 wTOj6qa/WA0W3OOw07FZgFFNBfz2NvVDz4nqHz6dJi4JB2XFBi6Q00PWFvfpeEDtfJeB
 iqYfBpH4h8hJrveUCPtxyWvOkcoktKCLNKigxEri8HvBzlBVqJz1wFx4Ez16qNwbVZtC
 Wu96tjC/rQsyUwgteaIXy5dyMmtgBfXaCuO6Tt7HeEkkbVTpNx8B7pA+IJLE/OxGutmC
 n/Zv2nTS+/5aiFmPlYpkLcxeRXDYYGTwfUHWPCOPVHNPB/GJ2DfVmIQYmQlfZ+AcxUZV
 BHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506388; x=1741111188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+1Ilm0hsqaAWJ6FLSDKxA/oNa1o2785HX4v9RhTC7S0=;
 b=BEg+kbFLi5643hgEzIMVWixTkmz6kDhm5tOdAVe0E0B8fSoPH9KHf9F7v23VgnrNQs
 MCpiMxK/75wzhZZkpoooWUKK2ymYDH452xj5mdj0bKAtM4UVrzqeu+evygukUuYcbD0b
 ajeV+02K1G5VV1lsMQ1JuOTqXSMnpqc8CtmuQgF3+9sHPeAEG7lm6BRQAXGBohooBjK4
 8dzQcweZd3WUwV8O7CQnSiNvHdDM8Lt1/WmRPvcUkYpkUti1kzXSidm0PDzvC48iAixw
 OD/YF2ZNqXzXL2y00EQUq6MiNSASk76RKgzEG20/tO7JXNda/AEVLp2/2Spx/m/Y0ywR
 5+2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk9iodSA5FE7bNrPi/qhELZ2d+DGgNLrso8Fm3Ft0CMC6dflmfMH3DLy8m42p5D1jMiJtqdJTouPs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwK984KMKI57ggzyURZzcj4u5xNfAftmCzoANIKKrTrVHhwjr4E
 hD7iBr8hW97cRm7szr9Ev2mnm9/vOXfV4s4aLRAAtv/7aRFUkmQr
X-Gm-Gg: ASbGncsrQG1RXe1JYgyJO9hWG0KXVll9iM33W1gFZNL+SGAgqEaAYFLsmlFFqg2M0DV
 pKxsNr4UKUNsI9z7I6Q611J6gHBzk/rbrHHy1t9gifwyJgDc2fZ3j0xJhEVHm7nRdY+3jc2Fu1E
 Xp07P74nhW73MKhJPXpPrs9Ji0xEgdRv8qOIkOlvi7L43j/1tD/y1nGYgAjoQrJlxSAA3vMJ8oj
 /pdOneH4favJqaA7iaUwwEi4l9UlK4YT7kDltXC6d8v4fbQLLamLko6NB27JI1AeqThkY8gqGYV
 CM8t6a31ZQqB7zECx4XEn7vJIJY8
X-Google-Smtp-Source: AGHT+IG/Jg6sQzfteNDw1Z0ZLJPWyZtj1UzkuvnZQYZgwvyGWiXUaguZlAArqY4qPHtreL4LKbBH/Q==
X-Received: by 2002:a05:600c:1989:b0:439:a6db:1824 with SMTP id
 5b1f17b1804b1-43ab0f4271cmr48566515e9.16.1740506387928; 
 Tue, 25 Feb 2025 09:59:47 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:47 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 06/16] drm/vkms: Allow to configure CRTC writeback support
 via configfs
Date: Tue, 25 Feb 2025 18:59:26 +0100
Message-ID: <20250225175936.7223-7-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225175936.7223-1-jose.exposito89@gmail.com>
References: <20250225175936.7223-1-jose.exposito89@gmail.com>
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
 drivers/gpu/drm/vkms/vkms_configfs.c | 40 ++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index e0699603ef53..abe7a0f5a4ab 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -94,6 +94,10 @@ Continue by creating one or more CRTCs::
 
   sudo mkdir /config/vkms/my-vkms/crtcs/crtc0
 
+CRTCs have 1 configurable attribute:
+
+- writeback: Enable or disable writeback connector support by writing 1 or 0
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 1483f47244e6..233a3d4ad75c 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -74,6 +74,45 @@ struct vkms_configfs_crtc {
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
+static ssize_t crtc_writeback_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_crtc *crtc;
+
+	crtc = crtc_item_to_vkms_configfs_crtc(item);
+
+	guard(mutex)(&crtc->dev->lock);
+	return sprintf(page, "%d\n",
+		       vkms_config_crtc_get_writeback(crtc->config));
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
+	guard(mutex)(&crtc->dev->lock);
+
+	if (crtc->dev->enabled)
+		return -EBUSY;
+
+	vkms_config_crtc_set_writeback(crtc->config, writeback);
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
@@ -92,6 +131,7 @@ static struct configfs_item_operations crtc_item_operations = {
 };
 
 static const struct config_item_type crtc_item_type = {
+	.ct_attrs	= crtc_item_attrs,
 	.ct_item_ops	= &crtc_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
-- 
2.48.1

