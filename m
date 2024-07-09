Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF1F92C614
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 00:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC9210E089;
	Tue,  9 Jul 2024 22:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="MIywN/mT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0830910E089
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 22:14:31 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38028so7234883a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 15:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1720563270; x=1721168070;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VOArJoxyilSSGPXrWTqG3U1GwRFgQOeHlN66KV6fzR0=;
 b=MIywN/mTmt30UmXZgj8leTyIJrbS6gErJILu0DLIGPtaOM1Km5VJgK5CIL3fa7chK4
 I3wMLc8U/JfEkDzpM71KR9WWC7EvsceJ/Yx4LoZUtttkhXcRDGvGCDldCrLOcnSESHeE
 za2xLGZD6QVrim6+CCnSo0jsjDq7i2TmDQ8d1VcSGFLrl3ZsxJcOe9khk2IHAi0ebqf/
 GBk8krJQglIxUJuoeAHPxDXpseOlPMvNpyUatUAo1fjLpEGs4TtL4e8NtE3BR2DnuAL/
 a+JDh8E0HsRbLgqnuPRo88Zf56A3jUNT/2SfAzuc5Cnc0JkvHJHYqps/mRZMN2LGqWgT
 sKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720563270; x=1721168070;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VOArJoxyilSSGPXrWTqG3U1GwRFgQOeHlN66KV6fzR0=;
 b=LXmoslSz3Dhb7ngkMV97f1Dj5lP14ObmwiFWGKf+RoDQdQz3UedJXQp9dHv3zaPW7g
 uL8Z4Oe6j2qvRnxLEoib9R+5SXWOgbiPZM3X6/c4Myq8tdVedRudTnl127Aa69HfWm2R
 hmUU0epKER8VYHpWAXZmJUHNrwYSvAcF6PXvlAe+Q8Qk0xL+Nph81jPvcVUJKR7LqMLN
 IJhHUpBRDAHI9F7pTxV3S4M8ATpDpzuZHiPKvfgV1kOziwjZzZ2S++5K4j9y6dsLCZ0g
 lXB2axRycHm3aKvsnZcSuF0yZyvssRWz7oBbw/fIzGHrkK37moPkH3qN6JMRuOL5iFj7
 Htbg==
X-Gm-Message-State: AOJu0YziHFc+MLP7L9MU1A+x3vW4yNMzHz9VyXXS/WneAMppXk0ICv6i
 um2UbdC+xhOHHwKhuPLYYHuSz22kBLEZs0TOVM9EH3BtJ8CW4cRR3MavD8hXCVk=
X-Google-Smtp-Source: AGHT+IEhMAL/BeK0wEsG7YU7fKP6fiy2pWaYrVzNziHBWN4NIwYK04hTgd/KylGrRGQJQSml0I410Q==
X-Received: by 2002:a17:906:81c5:b0:a77:b788:d760 with SMTP id
 a640c23a62f3a-a780b89f711mr220469166b.76.1720563270129; 
 Tue, 09 Jul 2024 15:14:30 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-224.dynamic.mnet-online.de.
 [82.135.80.224]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc7c9sm110342266b.42.2024.07.09.15.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 15:14:29 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thorsten Blum <thorsten.blum@toblux.com>
Subject: [RESEND PATCH] drm: Combine identical if/elif code blocks
Date: Wed, 10 Jul 2024 00:14:02 +0200
Message-ID: <20240709221401.322731-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
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

Merge the identical if/elif code blocks and remove the following two
warnings reported by make includecheck:

  asm/ioctl.h is included more than once
  linux/types.h is included more than once

Reverts commit 00c9672606f7 ("drm: Untangle __KERNEL__ guards") because
make headers_install seems to be able to handle this now.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 include/uapi/drm/drm.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 16122819edfe..315af7b19c97 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -35,13 +35,7 @@
 #ifndef _DRM_H_
 #define _DRM_H_
 
-#if defined(__KERNEL__)
-
-#include <linux/types.h>
-#include <asm/ioctl.h>
-typedef unsigned int drm_handle_t;
-
-#elif defined(__linux__)
+#if defined(__KERNEL__) || defined(__linux__)
 
 #include <linux/types.h>
 #include <asm/ioctl.h>
-- 
2.45.2

