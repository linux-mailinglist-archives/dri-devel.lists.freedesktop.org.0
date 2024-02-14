Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA6D855764
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 00:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8352910E2AC;
	Wed, 14 Feb 2024 23:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mEHIfEHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E5A10E0BE;
 Wed, 14 Feb 2024 22:44:40 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-5ce6b5e3c4eso208489a12.2; 
 Wed, 14 Feb 2024 14:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707950680; x=1708555480; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tNSjlTo4Un9VoE+0QgCQtAv3NTq/mfIF5b+pI8WjNJs=;
 b=mEHIfEHrZAGgo9eZHcQ9gvUTCBTs5pWEh0Cr53y3Njy21USGOi1hVuSaqWdU27Abtz
 CyWICo2vLl7DiWzDsQyPefbA2VNPQxUejdu72DWIQYDCfTB9UXpJGJpDefEknYTsWfBn
 Bl+tG58E9Ye7cvDoUNxuWwA/syp5w505Mxw4GYROWQkaTDLn5xsgP0vX2TH6Cm3aJ4f3
 ImXQNoM7oGHpzy6uJDYz5o+QwPxYsRJvHxUnGAMJkxeXOkA9FXnezUYB6+jQhJ46U6RJ
 BC30CqWibGhRjyGR2HeTwwm/Az8TIJQoFUtaXbcyESUI4P863jHZ3BFwaCe5YELLddk4
 XSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707950680; x=1708555480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tNSjlTo4Un9VoE+0QgCQtAv3NTq/mfIF5b+pI8WjNJs=;
 b=uJwfB8eAyK92HaOKIu6hU8ysYppAQE0jY1UaZdQDRU8TsKnNB2VmRtNonhGw2ATO6a
 c6Cj5iMCqWVuzXAUvtRSgF+esfha9PcL9qZURzSE3wtlIFsc9S4KcZqVD43PKwfWAKlD
 ZHEUPHS4mnkyu6ipVs65CGshxKWNfwjH8+FZeAvvHzvJFIO+NA9jBdBpypQpueLU33mG
 tQl70RYSjsJKMgfj+GtArANVb9+W7qFboZLY+bWAeWTDhXVgcdXpzbcKKIxIwwL8j+cC
 RdhJ8tHhUWpvKgkQ5TC4B7n72BejUhoIAsWJNJQEUbxYq+NVMLV+FpuXA/hAQ5gSr8KD
 V8Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcQSS+1X1MxgfP7QjK1NVgRXjROYbVmlxu5bHUNo4AYw92Sg8e981VNq4xIUF73IcNhGC1r8xxdBlKkE2HJUMr3MlBV7rt7CkljHPIgkRvIFnmGEVT1L4mOv24kxwTMIFWj4Z4rBMw5JOLHj8KZw==
X-Gm-Message-State: AOJu0YxxIgjy+FQl1jvSv/w795U7pgpS+8Wspg/78j2fhQvxXMCK/h7b
 vuyrr1PwDdohY0LrZXgUYQypYEowU+hGyXg+fbcM/hTiniHo9FNW
X-Google-Smtp-Source: AGHT+IFDP7b9H74wYM+4qv6D0tK5kCLbgdVNv+1sk5mLmQDX6JpbZsvSHGqwKvrlVSk9/+ZMzmZoIg==
X-Received: by 2002:a05:6a20:b906:b0:19e:c5cb:9667 with SMTP id
 fe6-20020a056a20b90600b0019ec5cb9667mr205435pzb.16.1707950679728; 
 Wed, 14 Feb 2024 14:44:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU2YBFlWV9rLOTXbrwONAWRh8iL3BI6QPXjJXt+RoXuos8EP4YDteEt7Ki8PqM7bVGMi3WB2iECBYs0AGpp+OVrHZoHmrUbnXUDKGAUzDFQ4xZRWXhkRWDC98G7iaf/LG9+rXDD60PE+0brac/xJrrzAzqUD0isowt5SKiWjSgsUXvOB4uLcMU3stQ/bGpNwrKlUAy0BADMA8x8cLY09voDF35p94qJRSr+enSV2TuF84fV3HfGVyBK/c016hRG2uZTjDZZa2fGWJqRQQmQ0NzTj/XS5AdfQua8PCvHdw7wHZm51/T6pMM50BxHRJrU/ESx+84k3Xgo/YcrpyER8iyQenVpTS3IkEJg
Received: from localhost.localdomain ([179.225.251.251])
 by smtp.gmail.com with ESMTPSA id
 jv12-20020a170903058c00b001d6f29c12f7sm1077950plb.135.2024.02.14.14.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 14:44:39 -0800 (PST)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amd/display: clean codestyle error
Date: Wed, 14 Feb 2024 19:42:16 -0300
Message-Id: <20240214224217.15514-3-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240214224217.15514-1-marcelomspessoto@gmail.com>
References: <20240214224217.15514-1-marcelomspessoto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 14 Feb 2024 23:40:07 +0000
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

Use () for complex macro in dmub/src/dmub_dcn32.c

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c
index 0d521eeda..db9bf55f5 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c
@@ -35,7 +35,7 @@
 #define BASE_INNER(seg) ctx->dcn_reg_offsets[seg]
 #define CTX dmub
 #define REGS dmub->regs_dcn32
-#define REG_OFFSET_EXP(reg_name) BASE(reg##reg_name##_BASE_IDX) + reg##reg_name
+#define REG_OFFSET_EXP(reg_name) (BASE(reg##reg_name##_BASE_IDX) + reg##reg_name)
 
 void dmub_srv_dcn32_regs_init(struct dmub_srv *dmub,  struct dc_context *ctx)
 {
-- 
2.39.2

