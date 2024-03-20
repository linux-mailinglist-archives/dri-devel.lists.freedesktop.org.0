Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57078881A0F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 00:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEDC10FFD2;
	Wed, 20 Mar 2024 23:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="hFfOztwA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f201.google.com (mail-il1-f201.google.com
 [209.85.166.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47EA10FFD2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 23:04:47 +0000 (UTC)
Received: by mail-il1-f201.google.com with SMTP id
 e9e14a558f8ab-36696c9cb23so3476405ab.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 16:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1710975887; x=1711580687;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=g2+RO3cMaS60sPuOhp6UDFq45HF6306U2TZ9coJYJqo=;
 b=hFfOztwAMZkMYkEU5fAa5uufBhCEvpionuXZ74dZwqaOF0HVq85fJ28XEjpcPbK7P6
 UMlTWPbyZnzmELooqY9ZwXJL1nSgnNgjtC76ffmmktvGI6/YROp4ns2o9qFb0ooERsQo
 mtMJsFgHbFOeJ0GJ1FtpEHkfkz4Z5yoy5JQJ8iNrvemBH6udLZpBqZmLbOIR0unJp/vi
 PNHHATS8TvlHfKxnKl/91gYBdjWabNnrdmEghN4LLmtNxCO8zS7JBuJEMDLSwQOr5DvI
 RInOzeY4iSoL8Noz1YqeBsrI2gIRXF8edZqwyZtE0ntvwX5ygS16RmxQKMhEK+DYuXRu
 XaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710975887; x=1711580687;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g2+RO3cMaS60sPuOhp6UDFq45HF6306U2TZ9coJYJqo=;
 b=le9G06L3htYRIylEi1WSAXUYOC7pVRo+YqGEI22Klf9p0KA9s0/ICojEuzt6mDaHUI
 J4/SvBh1jb41IBtnmLUPp1bRSvQwuKnS9ajkaVkM/ncbnNO2rLgOknmqzuXwYokXP/JN
 DoRIUHMxe2u4dP3lirj/bGTdOhxcCzcTu2+oj3oNK70q2SDcTBFHlgTbqO9QvFsRzggu
 oCIW4pwkDYPZrr5saT3Tls67zgMBM0ng/V46MYrzWa0eIktk3wSRwdtzCrywHKsQjzw4
 2Ugj6suYxi5vGS7rPnNsJVzGk+hpPl/tCJZTJVr/YPc+Jx2gOh9T4APxtnnr6A86J8oo
 TaUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGaIc6WfFgouZkIy4w01HmAOgPSIA8WcqDnS7pQzRdsdO91QA2Oe98ON+MX1WCK6iluAPGt+lxjnQ34UNoNsCm/z3Ks8vMU/L18/QXYLwI
X-Gm-Message-State: AOJu0YwSLz4qFIjF5MFtA2XfWogvISoYsuDJAF98ArIMWimoS9QyCKMy
 3DGPI4dN92YrI3RjJGy5XKJiOmzzy2Bc/Nb9Kvava+VlmfBx5UbSd7SZWQZhFj2SFkZm+prjjtC
 hHX8hUSsUtKyWgyBk1kVs3g==
X-Google-Smtp-Source: AGHT+IE0SUB2ouJtetdQjpyRX2R1ogJVbIpFy4IGejw06L4AAiIp+tvbaFIe6uUWSz0Q/ZKxotmWusw1YlBBb6OKEg==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6e02:1d92:b0:366:a77e:62dc with
 SMTP id h18-20020a056e021d9200b00366a77e62dcmr201298ila.2.1710975886819; Wed,
 20 Mar 2024 16:04:46 -0700 (PDT)
Date: Wed, 20 Mar 2024 23:04:44 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAItr+2UC/x3NwQrCMAyA4VcZORuoXSnDVxEPW5pqLt1INEzG3
 t3i8bv8/wHGKmxwGw5QdjFZW8f1MgC95vZklNINMcQUxhjQ3tpo+2JRcVZDl8Ir1qWw48fZ5ro
 gYRpznihxzTRBb23KVfb/5/44zx9EVBqXdwAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710975885; l=2023;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=xdt3WcZtzp6V+dVSO0oQ0nQ4PjO+mTElm8qjYyLdYhc=;
 b=f19YsudHfgvlM7ugu8UM5KyMcxaGHMzV60fbyToO/flwakuV05BaMfUOCc7dw5o6ikznP7JLg
 lq8Lb1GsU1SB6+LQuJnlOA6neOghUGwiYYU+BFbN8vqiabgKJN2iJdY
X-Mailer: b4 0.12.3
Message-ID: <20240320-strncpy-drivers-video-fbdev-uvesafb-c-v1-1-fd6af3766c80@google.com>
Subject: [PATCH] fbdev: uvesafb: replace deprecated strncpy with strscpy_pad
From: Justin Stitt <justinstitt@google.com>
To: Michal Januszewski <spock@gentoo.org>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
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

strncpy() is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

We expect v86d_path to be NUL-terminated based on its use with the
C-string format specifier in printf-likes:
|	pr_err("failed to execute %s\n", v86d_path);
and
|	return snprintf(buf, PAGE_SIZE, "%s\n", v86d_path);

Let's also opt to pad v86d_path since it may get used in and around
userspace:
|	return call_usermodehelper(v86d_path, argv, envp, UMH_WAIT_PROC);

Considering the above, strscpy_pad() is the best replacement as it
guarantees both NUL-termination and NUL-padding on the destination
buffer.

Note that this patch relies on the _new_ 2-argument versions of
strscpy() and strscpy_pad() introduced in Commit e6584c3964f2f ("string:
Allow 2-argument strscpy()").

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/video/fbdev/uvesafb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index e1f421e91b4f..8b554fcf1bfb 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1867,7 +1867,7 @@ static ssize_t v86d_show(struct device_driver *dev, char *buf)
 static ssize_t v86d_store(struct device_driver *dev, const char *buf,
 		size_t count)
 {
-	strncpy(v86d_path, buf, PATH_MAX - 1);
+	strscpy_pad(v86d_path, buf);
 	return count;
 }
 static DRIVER_ATTR_RW(v86d);

---
base-commit: a4145ce1e7bc247fd6f2846e8699473448717b37
change-id: 20240320-strncpy-drivers-video-fbdev-uvesafb-c-43668c4ef6c8

Best regards,
--
Justin Stitt <justinstitt@google.com>

