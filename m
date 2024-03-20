Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5123B88199D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 23:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B7510FFCB;
	Wed, 20 Mar 2024 22:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ysD5QrpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94C110FFDC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 22:48:53 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-60a3bb05c9bso5575227b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 15:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1710974933; x=1711579733;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cuJsz9UlwEA6zdfjk+8N140o8FRIcxJ5QLG1a0ozWdY=;
 b=ysD5QrpARvaAH3+SGJVgal8wwN38enQtvqmEcgpE/trlMMW5Cbunasao5aGpygVuv/
 A2SXsnyGmM15lLKwFn4xfM/s7UanG1JFkRbxp+g3w4jvM8qAwpY9m/4s8M40WCPDjUVU
 QZTjvk9IVl4uRoKRnUpVqOE1ZTOyaiJaLica7GM/Www3neSMIcXGcE2oVPdh3lHYPnlD
 ZWizhrogEYTmmNMMH6JbIAEOXpohvD1r7eSDhVSysPI5DBrIRYYfYI0OyRq+7yOvfsRw
 OnSngfeUla5u4hgiQ9ZodBZo+c6Ipt4qvYS0QN63Gx7DhWdCpdmr6mD8CKHWZPdXSqr8
 69cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710974933; x=1711579733;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cuJsz9UlwEA6zdfjk+8N140o8FRIcxJ5QLG1a0ozWdY=;
 b=wzq1oFyVjhb8ZqVQJp0GkAtpDSHnhiEgTq92WjidfUbShfdZGbvat8psLTJut/7GkX
 M80SdoF+JFk47bbRx5gIkSF5b+eYgkepsADYwQfwRPb8cDs7U7lovrlLmKx4crFnwWF5
 tfBz4SZXkUaosWjv1e/uFwW6fHmSQrVRF0IIo2d/oHZPZjOYTzHofTIXBH4PINVHj5Fd
 7DOkHk+jD9RG4Tqg2DuPj0JPYpIN5oLcrJ+J2IeocjxH5RKeYH//0bvWFWNKFnP2nQFt
 Qij83gerdS3/FoiKXr7J3b+1amE6OxCGXXgc7Gknehv+SasvdDeebY/GEzXUaErnq5IE
 enZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHB9RUtl7kK3zG8Oa2RREopxl9XmEJKFtwMg2nEA1JJy9EpMr+ESY1npt08fjPTKcW8tHg6NLvOFHpCcLhGyupPmr6OEKZ3tu91gLpbLxe
X-Gm-Message-State: AOJu0YzdzfjwYX+ihggQlxizJ579/JrKG7MrfKY1wUh9q90CJVLRe7c9
 07XbUxx+F6yLgij8E4DeWCm7W6yka2VQoE9TG23F12r3LlvQ6qXCjTw3hM95qNtRc3uV3t27aVs
 ZMG3jNaB8hrca9EvPfCyVEQ==
X-Google-Smtp-Source: AGHT+IEAdJhJ6XWsfWFvKxMRCTCL0rFzhCdAiYFkka5BbblT+BLyG2u8I3I/0FokOi0qCRO5wy/EMOMrrIZr/UuKig==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:91d7:0:b0:60d:6e32:2f70 with SMTP
 id i206-20020a8191d7000000b0060d6e322f70mr3604527ywg.0.1710974932857; Wed, 20
 Mar 2024 15:48:52 -0700 (PDT)
Date: Wed, 20 Mar 2024 22:48:50 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANJn+2UC/x3NwQqDMAyA4VeRnBeoVgT3KuJhbVINjCqJlg3x3
 Vd2/C7/f4GxChs8mwuUi5hsuaJ9NBDXV14Yhaqhc13vfDuiHZrj/kVSKayGRYg3TIG4YLI3kpx
 VGDEMo/ND5OBTDzW3Kyf5/FfTfN8/1lDuSHoAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710974932; l=1938;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=V7XSTOhNvjEuLafgGT0fgGD4qu2T4mLPqEmu44WjLQA=;
 b=igy7d94UFbUM0TkUAgMVJDxriGbnH+DPKvEXXYKfS+CKktomyiqlyOLzVVQxq4ZffMDfFel3O
 h2XGTp+4Dh/Asd4C5wNyBMFsacdao+pZNwmAm8/6HIhl+l027RuOSV+
X-Mailer: b4 0.12.3
Message-ID: <20240320-strncpy-drivers-video-fbdev-fsl-diu-fb-c-v1-1-3cd3c012fa8c@google.com>
Subject: [PATCH] video: fbdev: fsl-diu-fb: replace deprecated strncpy with
 strscpy_pad
From: Justin Stitt <justinstitt@google.com>
To: Timur Tabi <timur@kernel.org>, Helge Deller <deller@gmx.de>
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

A better alternative is strscpy() as it guarantees NUL-termination on
the destination buffer.

Since we are eventually copying over to userspace, let's ensure we
NUL-pad the destination buffer by using the pad variant of strscpy.
- core/fb_chrdev.c:
234 |	err = copy_to_user(&fix32->id, &fix->id, sizeof(fix32->id));

Furthermore, we can use the new 2-argument variants of strscpy() and
strscpy_pad() introduced by Commit e6584c3964f2f ("string: Allow
2-argument strscpy()") to simplify the syntax even more.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/video/fbdev/fsl-diu-fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index 0191141657fd..ea37a60da10c 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -787,7 +787,7 @@ static void set_fix(struct fb_info *info)
 	struct fb_var_screeninfo *var = &info->var;
 	struct mfb_info *mfbi = info->par;
 
-	strncpy(fix->id, mfbi->id, sizeof(fix->id));
+	strscpy_pad(fix->id, mfbi->id);
 	fix->line_length = var->xres_virtual * var->bits_per_pixel / 8;
 	fix->type = FB_TYPE_PACKED_PIXELS;
 	fix->accel = FB_ACCEL_NONE;

---
base-commit: bf3a69c6861ff4dc7892d895c87074af7bc1c400
change-id: 20240319-strncpy-drivers-video-fbdev-fsl-diu-fb-c-b69036ceb3f4

Best regards,
--
Justin Stitt <justinstitt@google.com>

