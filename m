Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3046A7D74E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493EF10E39A;
	Mon,  7 Apr 2025 08:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MlECh/tj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA67810E39A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:14:42 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so26106295e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744013681; x=1744618481; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PcXSp8pgzSq8wNXoM27HycQqegwL//5YxnDgqXeVDvc=;
 b=MlECh/tj5OXKpHWx4Ovn+BY2w1Az+yVie+JclAVQTZBEYe1nppGSGq+ifg/MLuaGAO
 QXWHdoX22HLACKbMSjq3Dzc1e/47TpA9C5meTkj9FMreajjpWKEJferPNT66gNEsFBGf
 eXZBtFFUBMEe0+A0I57oUNMgBF933ku9y7D1FEolMLiAGUW46shoHwxlLfKlMSoMKzpq
 DdIlsJITo+nXKkm2/00xiJL3qGJ5Gt54xUX/2O4m1zEa5YS4RoveCAQV5QqVZxmBTx/U
 gj4gMbJszXJCdqixCPawu9YyhLg92RBkG0eCC071LcWeV2+NZU3qijJ9URE82kpLc/As
 ecZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744013681; x=1744618481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PcXSp8pgzSq8wNXoM27HycQqegwL//5YxnDgqXeVDvc=;
 b=E3SHZZVXbjQxbFK++8DUu3yaegsKDrjDxRh7Jslz/sIejFRzvsVE2wCiarequTFxtR
 7KM8eCB0boO2De2xwUrsCj8n8oikqdNtZ6ZfWvjTslpQtJ8jO5s+Knwi5x4UhRdO7lxV
 wweklabDcTrQrnFGMnAnMgpkDojxqtvDrXZl4vYvO9yVxg9OJxRWhXh8MT4mwQxVwoyU
 WRkRbgrzgFOLQoFENwexlTcaw9m0VmLh02M2TnZ0wr2GdXD7i1G3Rm2Ye+XeN1uwOTKU
 6IwCH/lWHAT+LVxSV8qbK9t+xFMR+Rar20An+gHxF4dEqZFhHFFFF2jozeZ5Hxhp4nzB
 SNxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUBL5jgJA/Eg0X2T2wHWufQri5graOIY9owcTfi9lkxaMZGqJO1H9aV0nPRDF77MAnygnKj+Q6dvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx96iGMDtXR6ZQ/o5DKYmY7p+wSmdMvJ81GGjWv6YG00dW/s0YX
 FZ4jwt5o2G0wmOwAxFFco6sguZDDprgwQCavtNT8lJ4jJw26Nl4O
X-Gm-Gg: ASbGnctOU9JB1jY3T8GQI6wo+AIx5KUlS7hUpJWIU0FYPfm1O74Z//o/O2ui+JlWwmR
 SdJgM/erCdhOl3uW8CZOp6zJm55xhJWNcK7+omurt54gg6ysojp1cng5KDWRYX30Mt0zwjra7lb
 o9RmUis/XrBbIt7BCb3MMmg3029M76JOKhEGNkWCM8DoDn/n1ZpphzGanUQLhamGSxIxHeJgckd
 qe5yv112sTpvQ4HHAAgCe7Hf2XROLOgL5ZyRWTBhC9CIpe066ztCnuIttEmKjeqmtMZf5v8wwxn
 KhhNobDxySBVZMjr8fXHC/704FtEuZ8yhhoGgLWgTXQ+
X-Google-Smtp-Source: AGHT+IEOvcCjqwHYmHo/+QnfasqodtrBtlPdfu1XAaFA0hX44c5bBU1IaftsHeJH9DXHtC+DkVS0zw==
X-Received: by 2002:a05:600c:3484:b0:43e:afca:808f with SMTP id
 5b1f17b1804b1-43ed0db4006mr115955245e9.31.1744013681104; 
 Mon, 07 Apr 2025 01:14:41 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:14:40 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 06/16] drm/vkms: Allow to configure CRTC writeback support
 via configfs
Date: Mon,  7 Apr 2025 10:14:15 +0200
Message-ID: <20250407081425.6420-7-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

When a CRTC is created, add a `writeback` file to allow to enable or
disable writeback connector support

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  4 +++
 drivers/gpu/drm/vkms/vkms_configfs.c | 42 ++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

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
index 62a82366791d..e9f445043268 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -74,6 +74,47 @@ struct vkms_configfs_crtc {
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
+static ssize_t crtc_writeback_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_crtc *crtc;
+	bool writeback;
+
+	crtc = crtc_item_to_vkms_configfs_crtc(item);
+
+	scoped_guard(mutex, &crtc->dev->lock)
+		writeback = vkms_config_crtc_get_writeback(crtc->config);
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
+	scoped_guard(mutex, &crtc->dev->lock) {
+		if (crtc->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_crtc_set_writeback(crtc->config, writeback);
+	}
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
@@ -93,6 +134,7 @@ static struct configfs_item_operations crtc_item_operations = {
 };
 
 static const struct config_item_type crtc_item_type = {
+	.ct_attrs	= crtc_item_attrs,
 	.ct_item_ops	= &crtc_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
-- 
2.48.1

