Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C579CAD4D2
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 14:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F7A10E17E;
	Mon,  8 Dec 2025 13:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O0a8cyce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49AA10E128
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 11:17:51 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-37a5bc6b491so36836171fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 03:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765192670; x=1765797470; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pOCG7eO+IOYvs+xd7ddninCpQb0paex7uyJ3Uh9q6PY=;
 b=O0a8cycetJsajh/ROJVdH842fVL2KIysqNdsoUMSJuoB9l4TYLRdQaT3BdIXUjcLEq
 gF+TZr4yeQOjnw57F6szzcanBjhk4ZIg/O6TjxNo5AaWbbUNn9l0h++zmGKTSYPqwJTY
 moDPPIgaPClZE10GknKjISPgwzkU9CMPrbHq6jnZcZf00oG2/rKcf9I5Ok1lIlaAE2K2
 g6jVxb2cLRE8wj6hHQjvQ+YUXaeJjfFBEJ38FGl55z9Ft4PD26NXrqrA3jg/MJiJVlLW
 JNs3tHxMrMbYyfRg/8ViUB7ZWaUyVijva8TZ2+cjLiwkP65V6GpMxz7WPle1dMI0z5ce
 lkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765192670; x=1765797470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pOCG7eO+IOYvs+xd7ddninCpQb0paex7uyJ3Uh9q6PY=;
 b=ZZzuCg6aA4i4qfSQAlSrYKUFNSwByNjbt4B0EWgRL37OIgkgGt+eTg11uxlJIV4LXc
 bA7N2xLL5mN3Vgoaokhs/ooYi/wQgGM9EmQIVn1gQw1KGZCAm7PTpC+Akq7yxmxVtrOA
 cbC3RO/wje4QeeUUN5TaIK2WB43/s/bSzaekBTsc/YgFkIYa7fnNOyC41zNIwJw0uYYB
 H4/MIzkb7IdsbDorC1oaHudGvdzgpBFEuMsunmlMwhhfSzZ/xpSxuDKfqL/zOUhNhPKh
 +1p5E2TeEFSU7v87rUalVWitAPcOc7d9qcjxxkQyiSlMTWFex9TJ3oNEbBRIfiD/qRtg
 MsAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN9CgSxAkkxAFP+BSJGTx+HZSOQan9N6qxps9smUui4JVSZ3AHC6iLDeMNi+eMAaEtCa8MT1I928w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCH8IYmzWNf3lN3ULntKP07iH3TgxVkcDJwVNbhagFBYKbj5CT
 mSlysr+NM53Xo1DxAQnK9Mrfo4hHSHqAuUfK9vMvLyLois/bpJeZfp9j
X-Gm-Gg: ASbGncvVjyeG19E0J3z9k58GIxvQbbfPehVIASppue7TkHGZnInyMr05XQ9hBwCNILr
 tn/+EqnlP/yXw57Zb/aZ1OsSaILJVXdEAytcycEQkDq5Sw559KJnkNGrDzbEEwXfyKp5cKa5GUT
 695dy0TNBJNQzbRghN3m2OVEvgJvJhU9UTo7oYfJrRBL3u+w/uzjRdRNGqZrNuekyXqce0jcmG1
 vNe2aSgpexNkJ41vWzuqrrXfKaaHwFjZTSAbRk0mK04heeJThPqAK9YLaG6Fog9gK6BK7/j0IM4
 +yCVit9Eyqs+ZaTJNYrAO99PFvzcuPvvrUjGd87k01rs9gpx5ume0s+y6zHYCEPzE6FhH5k9Ymz
 Ki36PwLQng2EVdzQL2o4lElXMFtCs+1R1cDeujEuy9uzJ78yGV8OhtcNq8IFOtporRT/sgNUsq8
 YOPo/ll7Rps53w3+B5jCavW/YEYdkgfSKhxGNNn9eVJIobKHTp
X-Google-Smtp-Source: AGHT+IFWmyERvTDs7Paip7pT+B/ATRQZHULExlPL+PNu3lhsbGI7kGlW5/9g5j/0woCl75JPzc8beA==
X-Received: by 2002:a2e:a989:0:b0:37b:a395:fd68 with SMTP id
 38308e7fff4ca-37ed1fba490mr19694081fa.10.1765192669416; 
 Mon, 08 Dec 2025 03:17:49 -0800 (PST)
Received: from home-server.lan (89-109-48-215.dynamic.mts-nn.ru.
 [89.109.48.215]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37e7065591dsm36754761fa.43.2025.12.08.03.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 03:17:49 -0800 (PST)
From: Alexey Simakov <bigalex934@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Alexey Simakov <bigalex934@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [PATCH] drm/bochs: avoid sign extension in video memory size
Date: Mon,  8 Dec 2025 14:16:41 +0300
Message-Id: <20251208111641.4160-1-bigalex934@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Dec 2025 13:40:14 +0000
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

When bochs_dispi_read() returns a value in the 0x8000–0xFFFF range,
the expression bochs_dispi_read() * 64 * 1024 is computed in signed
int and then promoted to unsigned long, which can lead to
int -> unsigned long sign extension.

Cast the multipliers to unsigned long so that the multiplication is
done in unsigned long and covers the full range of the DISPI video
memory register without sign extension.

The QEMU stdvga device using the bochs dispi interface exposes video
memory up to 256 MB, so this change is made against malicious or
out-of-spec return values from the device.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Fixes: 0a6659bdc5e8 ("drm/bochs: new driver")
Signed-off-by: Alexey Simakov <bigalex934@gmail.com>
---
 drivers/gpu/drm/tiny/bochs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index d2d5e9f1269f..943bceadd2f4 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -258,7 +258,7 @@ static int bochs_hw_init(struct bochs_device *bochs)
 
 	id = bochs_dispi_read(bochs, VBE_DISPI_INDEX_ID);
 	mem = bochs_dispi_read(bochs, VBE_DISPI_INDEX_VIDEO_MEMORY_64K)
-		* 64 * 1024;
+		* 64UL * 1024UL;
 	if ((id & 0xfff0) != VBE_DISPI_ID0) {
 		DRM_ERROR("ID mismatch\n");
 		return -ENODEV;
-- 
2.34.1

