Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A96BBD2DA
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 09:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A1610E329;
	Mon,  6 Oct 2025 07:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="klmO7NrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3FA10E196
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 06:31:13 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2680cf68265so32556725ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 23:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759732273; x=1760337073; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kAl5ud0fiOLEIeLKR9WAaQrnRBmvWYDt4oevdTsfy9Y=;
 b=klmO7NrS1UrILmO2BYMoCgxR4nrC+DKa+S6VxEkG2WkO4UjhdajPqk8nXiHAKU3XhC
 b4ws+ILcOwYAcs/F3p76NBRzgQZqnS/wN1hPSRcJsxZQ3MrfAzyAimUPkj/m3Kr2IOjt
 eabYbhiSgD3Jp/gOgbY06ibHUKNwxO5lpelwpGgpuZ0NQy0+WUbwXQDXXQHRjV8eNZcM
 MrTlMf6VlCay5GlrFkbkfyo6I2NW05R8hJ8WrEr2ooeF95ME36ga3DDYs9EyUhjotNRE
 UHjnASVKe/aUVhRCV4MgfRGz4vGBXyNBAU5tVvywdZljYIoemnqv30U827hujQ2t+J0W
 iY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759732273; x=1760337073;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kAl5ud0fiOLEIeLKR9WAaQrnRBmvWYDt4oevdTsfy9Y=;
 b=s/LSeUtDByztFiSDh4rj2rIbVJ8zJY1SyQ+Ona6U4CBrErQDz1C43sTUjJd9Rt3OJ4
 lkZ/FTsZVaeQ8DI+LqWTaKogWGsad8+WLY9okB6AgjIqjManbSBmliDGUsZ74VzFhQy1
 N/0ItdyfH8g2lrm87z2irRjjrbMEOOjmnYlCkI/cfjhKYmuhMIW8ABC2Q/KxWB8APoxn
 0hCVQQgBuyX67riknDwWAA11xhgva2uKHgUTuC+2OUtjY758ejye/XSc4GCElyo+q1kR
 YO6I5Ag8eD3FuVQpoo/M9ANWTLdgS9sRG/Wa7OQsCsB8fcup7WPgO15WHkCfkIJQHOzb
 uBqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZZihGmwB4864tu5EFK6pEIzQfkkd2hj3CW435F1Gy5JrR4tOOTxoAXs12+U3iTeBmCGr5pA/NDgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK9+QEsyqpZijQjjKZWSsdCJSmsRZWGyFzF1vB2Ty5y01Mg/VG
 T/wb515oavvMwG/aWgOAdCwVYOmjKiy2aPMX0QfkpbZB9RK0Wa/llWV0
X-Gm-Gg: ASbGncu0usuvVEv2hUSvii9MWp4JJaXgMkLWT781Suz8wQxLTLJV5gk3escbJYBGhzE
 P98JiWpgIQ6zxMU0GEMcPlyqUx6wvR21iXqS00h+sFhG2FXow+0JVG4wa7KvoM/SSsLnT4fXjCI
 vwXQWGOPBFoaFdYRaP40VQ9/FXpZ4JZl/DgEDtAnQMoM/PNiSIQaghx3GCBZ1pXL9yhZn87uOSx
 5Jkyld0jxsysCdEUCYRnHPyh8B9W0Mja5g14z+BA/lwOVRBKJipONJIOvOdgCetPYI07+RfOy5r
 vi6kph62LG8d1kA/CwPnRzQAHbuyTnticrYnxNjIn6a9wYUDDdhnIGgoCrw3IEZcl2HyVkEpv4c
 znIlaEvff4YalFC8Bi/H90J0GIhBII0cROhK+Sl2u14PhZL42TbGTVD8jTGGfxD4CsQ==
X-Google-Smtp-Source: AGHT+IGMU7hrj7U1FkXheOsivtz2T+wK280erwvJlu/0py0PentU5hAcc1tVeLRVpzJrKs2Jah4LwA==
X-Received: by 2002:a17:902:c94a:b0:267:776b:a315 with SMTP id
 d9443c01a7336-28e9a61a914mr137570535ad.32.1759732272761; 
 Sun, 05 Oct 2025 23:31:12 -0700 (PDT)
Received: from LilGuy ([2409:40c2:504c:58f0:9c58:4a8b:65a6:88b4])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-28e8d1ba184sm121008085ad.89.2025.10.05.23.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 23:31:12 -0700 (PDT)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH] Documentation/gpu: Remove duplicate kernel-doc exports in
 drm-uapi.rst
Date: Mon,  6 Oct 2025 12:00:09 +0000
Message-ID: <20251006120010.17976-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Oct 2025 07:04:43 +0000
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

Eliminate redundant `:export:` kernel-doc directive in
Documentation/gpu/drm-uapi.rst to fix duplicate C declaration warnings
during Sphinx builds.

warning before this patch:

  WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35
  Declaration is '.. c:function:: const struct drm_format_info *
  drm_format_info (u32 format)'. [duplicate_declaration.c]

The removed export was already documented elsewhere, so this patch
does not remove any meaningful documentation. Post-change, both
`make htmldocs` and targeted builds with `make htmldocs
SPHINXDIRS=Documentation/gpu`

complete cleanly without warnings.

Based on commit 47a8d4b89844

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
 Documentation/gpu/drm-uapi.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index d98428a592f1..80cfd9b7c908 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -604,9 +604,6 @@ DRM specific patterns. Note that ENOTTY has the slightly unintuitive meaning of
 .. kernel-doc:: include/drm/drm_ioctl.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
-   :export:
-
 .. kernel-doc:: drivers/gpu/drm/drm_ioc32.c
    :export:
 
@@ -761,4 +758,4 @@ Stable uAPI events
 From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
 
 .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
-   :doc: uAPI trace events
\ No newline at end of file
+   :doc: uAPI trace events
-- 
2.51.0

