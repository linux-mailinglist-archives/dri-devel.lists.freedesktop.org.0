Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965D9A1B9DA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 17:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD5F10E080;
	Fri, 24 Jan 2025 16:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B0310E080
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 16:01:59 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so14882855e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737734518; x=1738339318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MrwFiV3RW+qHn9CtrwJGXyZXB8oN5L4VqyOUj3FL7CI=;
 b=aNDKNlv2zf/TVEhJcBvTRO6yaC1O4w/AG9vnZH5b45Rl0WwuAD5qyKthU2Tb5ye3aq
 lQLVuokEYVBU0BeX+Az/slkz+u98OqbyVKIQ30R14Sza3jn7Vo+5kXoAzMaWUAC+jAtV
 +8iwFl32lExcE5vSA+K9FIgdFSxV8z7f9Pb/SiMQYPHMvzyDkLny81V0cu4QXdh45zOD
 5XgpKngQVFn5yEYYesBHMpJhoZhpGhfWopp8bnfkz5XNIpMG8puv2ZsFOrWBvooDgR0r
 EVpaL7HHTqun6obFfhrClukpuFhFia8/r8NabT5t7+7YbrA6rvXMsKjIV9YSNIRvY/yc
 U6lQ==
X-Gm-Message-State: AOJu0Yx7vJtAM87iFMB3JT2R044kaqovQQd8l3Rv5t97mudqmnF/mFKB
 beh0YMARpyOf2uO0UtYzJ+P2n+x/SUCucr0IY3+pDJRNh6Xpiu6dkFCMJg==
X-Gm-Gg: ASbGncvHqBU9L5yFW8yLVV+ZUIbOfvSyL4UQP+4YRMsUJbOyfFBXjVanL6hefkUZYBF
 VJzU2bd8News2QQSg5UHrWUUt7M8pZCAxMD/uyLR5iCqT3kmg6MeZipdcK0xLQk4UW0mW/sB2Di
 lQTCTJc5Qegr98WEJzdExWgxkODr/QLJv+3bmHT4TV2VZeqt0nake6KPLp0TpYZTu8ZMHsALGxh
 LsnmmdWzShD+VCjdoqmaL7ZcNDf5RTct7DQyhcthvPp5YncPINyDc2WCQ9a9tj5BrGqNhZ9lFsy
 wv2NBaO6VPEScrRxRAPKq9OW5A==
X-Google-Smtp-Source: AGHT+IEm2pZ7FI9J9VwHvrbmPvAkkRUkjzhCP8jeQyh3mjoUDbAW0rU14sT9mFi5iZFbjHquLJSNWw==
X-Received: by 2002:a05:600c:3b94:b0:434:e2ea:fc94 with SMTP id
 5b1f17b1804b1-438913cb620mr334333415e9.11.1737734517928; 
 Fri, 24 Jan 2025 08:01:57 -0800 (PST)
Received: from xavers-framework.fritz.box
 ([2a04:7d84:aacc:28f0:9649:9df9:aa43:547a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4d34e3sm31004365e9.39.2025.01.24.08.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:01:57 -0800 (PST)
From: Xaver Hugl <xaver.hugl@kde.org>
To: dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	Xaver Hugl <xaver.hugl@kde.org>
Subject: [PATCH] drm_mode: document that pageflip events must always be sent
Date: Fri, 24 Jan 2025 17:01:55 +0100
Message-ID: <20250124160155.980186-1-xaver.hugl@kde.org>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
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

There's no way to signal failure to userspace, so if the ioctl requesting
the event succeeds, the kernel must *always* send the event, or userspace
will be stuck, forever waiting for the event that never comes.

Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
---
 include/uapi/drm/drm_mode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8..30611d561c5a 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -962,6 +962,12 @@ struct hdr_output_metadata {
  * Request that the kernel sends back a vblank event (see
  * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when the
  * page-flip is done.
+ *
+ * It's the responsibility of the kernel to ensure that, if the ioctl
+ * requesting the page-flip event succeeds, the event is actually sent.
+ * Because there's no way to signal failure to userspace after the ioctl
+ * returns, this must be upheld even if the page-flip never actually
+ * happens (because of a GPU reset, hotunplug or driver bug).
  */
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
 /**
-- 
2.48.0

