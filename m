Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 526497CB6A3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 00:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B5210E23E;
	Mon, 16 Oct 2023 22:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24F210E23B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 22:38:23 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5a7daf45537so74094447b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 15:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697495903; x=1698100703;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rfGwHPiYseuIB04WY1jIM0LXVs+wtH1jXMPtU9N43zs=;
 b=yZ5VtyXoUtU+/xiuYQYiFxs2lriYXQn2vkV8pJXYayUd54Jy5cB72eMv30kHjb/Afh
 N1aUmgnanlJZYLWMkcvvvQS4v25Wch8aoBf8wOQI9sH3j32H0OjNXkDuBTG34MX7L9hC
 TbqKHsn8pMMHwbJ89xdOX5gbckTBP8s3BlYl8i1+FMr0yw+MZKtfFhANXXMBAQT+ZmJc
 7YdC+h89784/gs2Rr4r7reHJQ+FfGFiTXYrIN1+kMzXGTwhnaVnr0LRaGaloqRA3NfBg
 zOrpjxdqncfvM0S7gawNfc7d51gZDVKbjPUlvJCuhVHW9pE7Ps0EgAQ04OsknpBuDzjH
 bNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697495903; x=1698100703;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rfGwHPiYseuIB04WY1jIM0LXVs+wtH1jXMPtU9N43zs=;
 b=OWLhohTreZxSrxIm6yZINim/iMPSlkr9h3LSJLmpbVBNfr6OvNoPhJq6stv5MKScPY
 SMl3wmwKTH9geeSIbWz4zKz3oPcjJsWQnTD0gIV/AgI8U2n4mu6i+0kOLydWt+IRJMjJ
 8jIKbJ92/CSEXrRZ7Ftz87UbYhlgkFFfJ98PdmnhMjqqm1tcHJ3SbJQzWsw/+e7tRGzn
 DHqz0HBfMhsbFGbGoLVKBYDFNcftIKMu8/QkoNld4U5Eitotvo/BaocK4dBycZBkojoO
 SL/RP0/NpizBZZ5Ql8+5ClqpiICaiwvh0gwzKqGtX0HdJZ7suvQDdRG7pnWDgHMKWd7D
 +woQ==
X-Gm-Message-State: AOJu0YyWuDRggCNWDs5lv0aDkdaVqlGGn12hEu5RlG/SlRnMdabTc0JY
 CA+HcUFU7hmfOCwWSc4dZ/wp7oBC2ZSZjd0h3Q==
X-Google-Smtp-Source: AGHT+IE7UKckRpGvTsEyas9ajW3OpcUNBDlz8M6iI1mSjq5sbYon/JJP4IFvS+a3lHmzLj+l3IZgZgtqQhvVSDAs7g==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:a214:0:b0:5a7:af9a:7530 with SMTP
 id w20-20020a81a214000000b005a7af9a7530mr13026ywg.1.1697495902914; Mon, 16
 Oct 2023 15:38:22 -0700 (PDT)
Date: Mon, 16 Oct 2023 22:38:20 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFu7LWUC/5WNTQqDMBSEryJZ95X8NFi78h5FSpq8xgfVSGJDR
 bx7ozfoYmC+WXyzsoSRMLFbtbKImRKFsYA8Vcz2ZvQI5AozyaXijbhAmuNopwVcpIwxgZ8+pQ9
 7HkNwmMCCUdrVV2mN44IV0xTxRd/j5d4V7inNIS7HaRb7+p8/CxDA6+apldRaGdX6EPwbzzYMr
 Nu27QepuXgo1wAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697495902; l=2621;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=TJW5gbFFOQpXDfDl5XUoO1+aPZvb/beyqblsIzLDODQ=;
 b=Jr8r8/EvJkzNSU8MDRFRbOGBeDpanyMebo+SVS5CU/dprVV/kh/VtN1BGAtRJ27wIjeHTlzp1
 6/VI8g3xYjjDTFjHLJgbeHe+TZzGUb9EXm/g4j4Wiey/482jTTXVbq/
X-Mailer: b4 0.12.3
Message-ID: <20231016-strncpy-drivers-gpu-drm-drm_modes-c-v2-1-d0b60686e1c6@google.com>
Subject: [PATCH v2] drm/modes: replace deprecated strncpy with strscpy_pad
From: Justin Stitt <justinstitt@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
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
Cc: Xu Panda <xu.panda@zte.com.cn>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`strncpy` is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

We should NUL-pad as there are full struct copies happening in places:
|       struct drm_mode_modeinfo umode;
|
|       ...
|               struct drm_property_blob *blob;
|
|               drm_mode_convert_to_umode(&umode, mode);
|               blob = drm_property_create_blob(crtc->dev,
|                                               sizeof(umode), &umode);

A suitable replacement is `strscpy_pad` due to the fact that it
guarantees both NUL-termination and NUL-padding on the destination
buffer.

Additionally, replace size macro `DRM_DISPLAY_MODE_LEN` with sizeof() to
more directly tie the maximum buffer size to the destination buffer:
|       struct drm_display_mode {
|               ...
|       	char name[DRM_DISPLAY_MODE_LEN];

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Cc: Xu Panda <xu.panda@zte.com.cn>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- use strscpy_pad (thanks Kees)
- rebase onto mainline
- Link to v1: https://lore.kernel.org/r/20230914-strncpy-drivers-gpu-drm-drm_modes-c-v1-1-079b532553a3@google.com
---
Note: build-tested only.
---
 drivers/gpu/drm/drm_modes.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ac9a406250c5..893f52ee4926 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2617,8 +2617,7 @@ void drm_mode_convert_to_umode(struct drm_mode_modeinfo *out,
 		break;
 	}
 
-	strncpy(out->name, in->name, DRM_DISPLAY_MODE_LEN);
-	out->name[DRM_DISPLAY_MODE_LEN-1] = 0;
+	strscpy_pad(out->name, in->name, sizeof(out->name));
 }
 
 /**
@@ -2659,8 +2658,7 @@ int drm_mode_convert_umode(struct drm_device *dev,
 	 * useful for the kernel->userspace direction anyway.
 	 */
 	out->type = in->type & DRM_MODE_TYPE_ALL;
-	strncpy(out->name, in->name, DRM_DISPLAY_MODE_LEN);
-	out->name[DRM_DISPLAY_MODE_LEN-1] = 0;
+	strscpy_pad(out->name, in->name, sizeof(out->name));
 
 	/* Clearing picture aspect ratio bits from out flags,
 	 * as the aspect-ratio information is not stored in

---
base-commit: 58720809f52779dc0f08e53e54b014209d13eebb
change-id: 20230914-strncpy-drivers-gpu-drm-drm_modes-c-a35d782cad01

Best regards,
--
Justin Stitt <justinstitt@google.com>

