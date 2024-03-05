Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000EE871EFA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 13:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA62112A8E;
	Tue,  5 Mar 2024 12:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="FT7/iUAn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6081E112A8E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 12:21:26 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6d9f94b9186so5364744b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 04:21:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709641286; x=1710246086;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:dkim-signature:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EB+zvigNjipJqZrGtyuvHVekbcDWdJOO5TYIKi4KvqM=;
 b=EqNkUabIa2zg/GL3aZm3UtdW4ra2GfH/JVlTgnrcDg+RiHlsnwVQnvBBj3x6/L51BG
 NGtpdO6IYxM9u8gYrPPgNRPcRi+xKbF3cTLLxFzjhM2C+RM9NLE7wt2tE/l4HRiCnW+R
 jeqKXMWdlQdp0sgtTpO9Agt7UiJ8lEWfiYs85kO3Ob2601rgR2uMQdV3wsxysxh7ZdcG
 Z/e4kH0ygqjAsNtsjAwab9ZnRqBt4WyZ6kCb/6DLjcqKelAr58QHd/f9gvnHVkYLsiSG
 SCq3aVmxOt12OKppacMsczbm6FLeBFQsr1+O6eS809a5Bg1W807twZ4vZQNkjcwnuJsi
 yeHw==
X-Gm-Message-State: AOJu0YzLZg/20CBCQd6FMlD0VkGtVFV6OU4d0WLNUa5y5oHx3lQvK7iv
 1N8f53u7cHwiKB18xLbYxe9dvBBCu6OjScsY4g5CIILS7lBBq1pI
X-Google-Smtp-Source: AGHT+IEsx2oyGpXbYX5zFlR9y9i1MJGRXxMf1XwxwrBx6v8x/fHt2MRSi5W1e5+ZtQQm1dIQybLYIA==
X-Received: by 2002:aa7:88c5:0:b0:6e4:f4b4:9ea2 with SMTP id
 k5-20020aa788c5000000b006e4f4b49ea2mr16673906pff.32.1709641285659; 
 Tue, 05 Mar 2024 04:21:25 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 du6-20020a056a002b4600b006e5933a0da9sm8833564pfb.165.2024.03.05.04.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:21:25 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1709641284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EB+zvigNjipJqZrGtyuvHVekbcDWdJOO5TYIKi4KvqM=;
 b=FT7/iUAnqYSX1LAYGofJsvMLqVcEZ5Vp+GZkvigG5oabTdXc+QhEgU2Vz2W7ukhClIFg6M
 hnagd15E1pJ75mZMc2US/FdDKhZREZOKezgQICrnczAMcy6Pjv5eOW7fD5kF5bOfAMrEnA
 Hd1wMF9gDMUOnrLkQNp9naj0pVxRjjPbRB4wRl+Q6Sg3+Z6LXNns13JVMxeDLXGIGqGY2b
 mXqZc8zGvJ7J2v7jMgSKadHWXRYZri+AoJKDS24Py1YrvE8HSxLKuXXBth6QHQ8LqWZvo4
 p2v4rRP+RIk4hpGUnDkA93rU7AIxr7m2kWW075vKTTzIHj16NBDAJT4Q0y7Kag==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Tue, 05 Mar 2024 09:21:17 -0300
Subject: [PATCH 1/2] video: backlight: make backlight_class constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-class_cleanup-backlight-v1-1-c0e15cc25be1@marliere.net>
References: <20240305-class_cleanup-backlight-v1-0-c0e15cc25be1@marliere.net>
In-Reply-To: <20240305-class_cleanup-backlight-v1-0-c0e15cc25be1@marliere.net>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Ricardo B. Marliere" <ricardo@marliere.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3316; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=wPqgO6x1c97ZMRaqAAcxuPo7qKZW50BhJ1TgJiyowRg=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl5w49fb2fHi43ZPpQ2hgetHTWppuTBPoASWbre
 ej/ze4OJJaJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZecOPQAKCRDJC4p8Y4ZY
 psSXD/9N3DmlQ1MjAQcQFB7xpnrLJU/FzcyKQaoKqqJgaoAY6UJcBawC55DUL1mkUBMICTknNau
 KYRSOjxQG6RnO5VnKEZk8sCzO4MtM4ZO0pUG9whq3ga8adY/wTOIbWEYwu4PhSba20K3sPDk5lu
 /0mAzm02RUfz5BCOkoIzHYfFUp/KbEkT7In7xSQ97MifeVOHsWyfCXNSiVmW/Za/zM3vLufhL4R
 lYnAk/A/oZgmH2FcLHcby9FWNLlvpgp/lW/4xAJZ6/jKZXW76EC4wKCrrTOWrVWfliY0ZfnCCLq
 xlS3jxoM8kt2sm7yubV8BDM0R8PPXgIrNphespzfGNUxPA/f+pwSwVzCR870uMOzwb+LdgUZeL+
 hVt/O0/UUn7Da+oqvVqUeTVgvgrbpitdNKGHzxXNabcQ283dVbymV9VFNxvtL7UGDEhAryj8m48
 T4Vi95NdTluJNgsMzznNP4ncWNKu7UmIKhcs0ZiuFOKEADWJQ8sZd/UVYvu/XwalFp4/hZYA7uP
 ljzVoFuGyZnsXoIYBb1RFzSl473QMvQZU/pbDJolgn6SZyrnEJ7jFMVWc9/12CaWnlDUscbS+cR
 SP46VN9s2gs2oEYqWQoh6VEpm0lsI5VcoOTpl3ZyrChv9LGl5t+7Zq5RP/0S4SOxbPuJa2RhQ0N
 y1mxM9Oy9FBAhGg==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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

Since commit 43a7206b0963 ("driver core: class: make class_register() take
a const *"), the driver core allows for struct class to be in read-only
memory, so move the backlight_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at boot time.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/video/backlight/backlight.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 86e1cdc8e369..d2feaebfd84a 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -317,8 +317,6 @@ static ssize_t scale_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(scale);
 
-static struct class *backlight_class;
-
 #ifdef CONFIG_PM_SLEEP
 static int backlight_suspend(struct device *dev)
 {
@@ -369,6 +367,12 @@ static struct attribute *bl_device_attrs[] = {
 };
 ATTRIBUTE_GROUPS(bl_device);
 
+static const struct class backlight_class = {
+	.name = "backlight",
+	.dev_groups = bl_device_groups,
+	.pm = &backlight_class_dev_pm_ops,
+};
+
 /**
  * backlight_force_update - tell the backlight subsystem that hardware state
  *   has changed
@@ -418,7 +422,7 @@ struct backlight_device *backlight_device_register(const char *name,
 	mutex_init(&new_bd->update_lock);
 	mutex_init(&new_bd->ops_lock);
 
-	new_bd->dev.class = backlight_class;
+	new_bd->dev.class = &backlight_class;
 	new_bd->dev.parent = parent;
 	new_bd->dev.release = bl_device_release;
 	dev_set_name(&new_bd->dev, "%s", name);
@@ -510,7 +514,7 @@ struct backlight_device *backlight_device_get_by_name(const char *name)
 {
 	struct device *dev;
 
-	dev = class_find_device_by_name(backlight_class, name);
+	dev = class_find_device_by_name(&backlight_class, name);
 
 	return dev ? to_backlight_device(dev) : NULL;
 }
@@ -678,7 +682,7 @@ struct backlight_device *of_find_backlight_by_node(struct device_node *node)
 {
 	struct device *dev;
 
-	dev = class_find_device(backlight_class, NULL, node, of_parent_match);
+	dev = class_find_device(&backlight_class, NULL, node, of_parent_match);
 
 	return dev ? to_backlight_device(dev) : NULL;
 }
@@ -746,20 +750,19 @@ EXPORT_SYMBOL(devm_of_find_backlight);
 
 static void __exit backlight_class_exit(void)
 {
-	class_destroy(backlight_class);
+	class_unregister(&backlight_class);
 }
 
 static int __init backlight_class_init(void)
 {
-	backlight_class = class_create("backlight");
-	if (IS_ERR(backlight_class)) {
-		pr_warn("Unable to create backlight class; errno = %ld\n",
-			PTR_ERR(backlight_class));
-		return PTR_ERR(backlight_class);
+	int ret;
+
+	ret = class_register(&backlight_class);
+	if (ret) {
+		pr_warn("Unable to create backlight class; errno = %d\n", ret);
+		return ret;
 	}
 
-	backlight_class->dev_groups = bl_device_groups;
-	backlight_class->pm = &backlight_class_dev_pm_ops;
 	INIT_LIST_HEAD(&backlight_dev_list);
 	mutex_init(&backlight_dev_list_mutex);
 	BLOCKING_INIT_NOTIFIER_HEAD(&backlight_notifier);

-- 
2.43.0

