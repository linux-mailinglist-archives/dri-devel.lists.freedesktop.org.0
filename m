Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F139F523170
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068CE10ED10;
	Wed, 11 May 2022 11:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D594D10EA6E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652268298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhuIDxij1dFQK1woz+U0GSNcD8pO0M2OCBta2I1W2Qw=;
 b=YeTT1c1v99wAwZXlNG2kAdcY1Ir/Oii2R+talj4eLWclgscDts+xtpuFs7z3OMOYWbkH+C
 qH+BZIr0QN8Cs30w2/AmTS6iZolKjo8TyqNfLR4nKohWfm2UPmLQXlFLGm3fGDSAfTvcVK
 OpSmKt0aiYTeraGxmO/hJWuL3erZGFo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-a32_32haNKSHEmqzVRwaNQ-1; Wed, 11 May 2022 07:24:57 -0400
X-MC-Unique: a32_32haNKSHEmqzVRwaNQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 j27-20020adfb31b000000b0020c4ca11566so716752wrd.14
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 04:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xhuIDxij1dFQK1woz+U0GSNcD8pO0M2OCBta2I1W2Qw=;
 b=Is4lqI+nYR58JnEJb9zRl1jvDtyVJNpP8EH0nGhmUX6i+QHJsOfNMMITcBk5SeYHjn
 jvdUBq+oWa2BjFN4xFNzp1gU/vjsSXX8CHuLckW74iWs7oXUXvm8C6Pl0S66bHkhMhs4
 quHE2thQVbE81eMEg8PJxX6Su1fGYtZBr4BT/gW5ano5UpvPeC7CQoQjBtWzutJ/1IeT
 boJmt2wFHL5nBp0QD4+s/vdC0rI6vy/XcgbMrr0D+bLU6F4iWh1L7Chg802Z+Jx9mYX2
 0AGIlln+FvI9ewqHJBAin1Fno5oawrYxgByT82JtKeqUg3Wq0edgbWrm1L0UT46vLNsz
 NgNA==
X-Gm-Message-State: AOAM530RQ9Nnbs7Dn6Zzkuu/4FNzhHWPFZrZW9/x40NgjNP8mf1H83PN
 l/HdOUBFyv2U0oNhr2Z4vtRQwMlH5cg6dd/jEkZ9HfA3dmpzv8MPXIbL4NImVRLds5YWiC4VDT2
 9Fho3JXxrRhvkdm/CDK+wEiAGXUho
X-Received: by 2002:a7b:cc93:0:b0:394:2622:fcd9 with SMTP id
 p19-20020a7bcc93000000b003942622fcd9mr4514978wma.20.1652268296480; 
 Wed, 11 May 2022 04:24:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRIFQcq1jQPPfql9v29OqbDwMo6HCFe2d4EHkjhfoYsd8KlDrK7oJBh/f5bYM9M/IMttgafQ==
X-Received: by 2002:a7b:cc93:0:b0:394:2622:fcd9 with SMTP id
 p19-20020a7bcc93000000b003942622fcd9mr4514945wma.20.1652268296167; 
 Wed, 11 May 2022 04:24:56 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4481000000b0020c5253d8d3sm1429174wrq.31.2022.05.11.04.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 04:24:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/7] firmware: sysfb: Add helpers to unregister a pdev and
 disable registration
Date: Wed, 11 May 2022 13:24:33 +0200
Message-Id: <20220511112438.1251024-3-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511112438.1251024-1-javierm@redhat.com>
References: <20220511112438.1251024-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jonathan Corbet <corbet@lwn.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-doc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These can be used by subsystems to unregister a platform device registered
by sysfb and also to disable future platform device registration in sysfb.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

(no changes since v4)

Changes in v4:
- Make sysfb_disable() to also attempt to unregister a device.

Changes in v2:
- Add kernel-doc comments and include in other_interfaces.rst (Daniel Vetter).

 .../driver-api/firmware/other_interfaces.rst  |  6 ++
 drivers/firmware/sysfb.c                      | 87 +++++++++++++++++--
 include/linux/sysfb.h                         | 19 ++++
 3 files changed, 106 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index b81794e0cfbb..06ac89adaafb 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -13,6 +13,12 @@ EDD Interfaces
 .. kernel-doc:: drivers/firmware/edd.c
    :internal:
 
+Generic System Framebuffers Interface
+-------------------------------------
+
+.. kernel-doc:: drivers/firmware/sysfb.c
+   :export:
+
 Intel Stratix10 SoC Service Layer
 ---------------------------------
 Some features of the Intel Stratix10 SoC require a level of privilege
diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index b032f40a92de..6768968949e6 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -34,21 +34,92 @@
 #include <linux/screen_info.h>
 #include <linux/sysfb.h>
 
+static struct platform_device *pd;
+static DEFINE_MUTEX(disable_lock);
+static bool disabled;
+
+static bool sysfb_unregister(void)
+{
+	if (IS_ERR_OR_NULL(pd))
+		return false;
+
+	platform_device_unregister(pd);
+	pd = NULL;
+
+	return true;
+}
+
+/**
+ * sysfb_disable() - disable the Generic System Framebuffers support
+ *
+ * This disables the registration of system framebuffer devices that match the
+ * generic drivers that make use of the system framebuffer set up by firmware.
+ *
+ * It also unregisters a device if this was already registered by sysfb_init().
+ *
+ * Context: The function can sleep. A @disable_lock mutex is acquired to serialize
+ *          against sysfb_init(), that registers a system framebuffer device and
+ *          sysfb_try_unregister(), that tries to unregister a framebuffer device.
+ */
+void sysfb_disable(void)
+{
+	mutex_lock(&disable_lock);
+	sysfb_unregister();
+	disabled = true;
+	mutex_unlock(&disable_lock);
+}
+EXPORT_SYMBOL_GPL(sysfb_disable);
+
+/**
+ * sysfb_try_unregister() - attempt to unregister a system framebuffer device
+ * @dev: device to unregister
+ *
+ * This tries to unregister a system framebuffer device if this was registered
+ * by the Generic System Framebuffers. The device will only be unregistered if
+ * it was registered by sysfb_init(), otherwise it will not be unregistered.
+ *
+ * Context: The function can sleep. a @load_lock mutex is acquired to serialize
+ *          against sysfb_init(), that registers a simple framebuffer device and
+ *          sysfb_disable(), that disables the Generic System Framebuffers support.
+ *
+ * Return:
+ * * true          - the device was unregistered successfully
+ * * false         - the device was not unregistered
+ */
+bool sysfb_try_unregister(struct device *dev)
+{
+	bool ret = false;
+
+	mutex_lock(&disable_lock);
+	if (IS_ERR_OR_NULL(pd) || pd != to_platform_device(dev))
+		goto unlock_mutex;
+
+	ret = sysfb_unregister();
+
+unlock_mutex:
+	mutex_unlock(&disable_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(sysfb_try_unregister);
+
 static __init int sysfb_init(void)
 {
 	struct screen_info *si = &screen_info;
 	struct simplefb_platform_data mode;
-	struct platform_device *pd;
 	const char *name;
 	bool compatible;
-	int ret;
+	int ret = 0;
+
+	mutex_lock(&disable_lock);
+	if (disabled)
+		goto unlock_mutex;
 
 	/* try to create a simple-framebuffer device */
 	compatible = sysfb_parse_mode(si, &mode);
 	if (compatible) {
 		pd = sysfb_create_simplefb(si, &mode);
 		if (!IS_ERR(pd))
-			return 0;
+			goto unlock_mutex;
 	}
 
 	/* if the FB is incompatible, create a legacy framebuffer device */
@@ -60,8 +131,10 @@ static __init int sysfb_init(void)
 		name = "platform-framebuffer";
 
 	pd = platform_device_alloc(name, 0);
-	if (!pd)
-		return -ENOMEM;
+	if (!pd) {
+		ret = -ENOMEM;
+		goto unlock_mutex;
+	}
 
 	sysfb_apply_efi_quirks(pd);
 
@@ -73,9 +146,11 @@ static __init int sysfb_init(void)
 	if (ret)
 		goto err;
 
-	return 0;
+	goto unlock_mutex;
 err:
 	platform_device_put(pd);
+unlock_mutex:
+	mutex_unlock(&disable_lock);
 	return ret;
 }
 
diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index 708152e9037b..e8c0313fac8f 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -55,6 +55,25 @@ struct efifb_dmi_info {
 	int flags;
 };
 
+#ifdef CONFIG_SYSFB
+
+void sysfb_disable(void);
+bool sysfb_try_unregister(struct device *dev);
+
+#else /* CONFIG_SYSFB */
+
+static inline void sysfb_disable(void)
+{
+
+}
+
+static inline bool sysfb_try_unregister(struct device *dev)
+{
+	return false;
+}
+
+#endif /* CONFIG_SYSFB */
+
 #ifdef CONFIG_EFI
 
 extern struct efifb_dmi_info efifb_dmi_list[];
-- 
2.35.1

