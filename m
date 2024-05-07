Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEC58BE7E1
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6317B10FC78;
	Tue,  7 May 2024 15:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LppYheQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C0E112132
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:55:19 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-41ec8ef128fso12105855e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715097318; x=1715702118;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=RzknyEmyvVzgzBEo4OMYewpyUdmIS0YAGmrGG+LYZzk=;
 b=LppYheQd9d5eKNLHCD4Zy7dad6Il4YPArXh59sWqE2RhSI7MbOut+FsiF28SZRYM8D
 0hs6NwephEQuRiTSVZn7qld1X6w2p5ekv0yoQg0rogj6Y7ium9SuaDP7Ngt/xaQbJW2Q
 /NdkZcR64gIT5frBoIgxP7g8cIckzdIlwD+RL/Hn2lUpua4evgcNHti5WVkqUJOWQrXv
 UvmPppOSCkxQV8muLXXhamCX214ZSSNBxzITtTB8i1a8h4BtKrpfBfUchlx4M9siQHUt
 jpwj/DIwTzsMqukyQRTbpogoj4e2s0s8MKJhiTN1CjCKX1qkcEULet9ONiO+DSNWHbNW
 m0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715097318; x=1715702118;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RzknyEmyvVzgzBEo4OMYewpyUdmIS0YAGmrGG+LYZzk=;
 b=rIHixjamq/ewfKsE8waBdhXIdhVA798RQtOpzB7IGpYqcr7OY9j4q8hB1gFDnTi7YW
 42dxkG6TlV+hwpDGS5f1tEtgUexVeW9c9PF7uo1DjpmbhNxmcSx8FP36/CcH5+taX782
 G8KNTFXwfraOD8zmJIw8xPyzaJ213puIaVHP+MXEAEbY4I/9RZ/I2dNvBCr1v5TeajHH
 I/KGZGyDcQxOuCT8hCLLocikVxAsFWRcg83B7xA4BFXfRmP9Vlgz8He8Tyk1hE63q6Uk
 j62Ila7s3QOSc3XvLEFF0PI5IwCAReZ+y8Wu4ejiDTgNayA12/d7sGfd2SdYSh33rBnS
 /xPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTRIerJPR7bnjt14N4EpYkl5DjK6Rz9cikQ1oWRU+inBIkw1wO463djxj+h9t7+ewJRAjU6zlyT2qc44Q/En6dBjo+WBAC6jJaZQDkh65E
X-Gm-Message-State: AOJu0Yxdbuqh2z83S1bOHgHtFQmraCz7DJmqtHy+8Q64owxvryDP/XBh
 xSvkqO/63245SkP+Z3z5Tm9pDn/Vmw2BNoyRgKAfXRo+8yPOiWbQ+eOvySoXI7jYrlG/AkJLJ+W
 LpmDEvKIqcA==
X-Google-Smtp-Source: AGHT+IEfytt8Dhiq2I47yZrUwHQciNP88LYTB/g+cEA/4WS4cOKmFtLwYQq3o/Xf4ToqYtBf6nBzC/fJeCL3Dg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:3b8c:b0:41e:a06a:1688 with SMTP
 id 5b1f17b1804b1-41f719d5d8bmr35295e9.3.1715097318342; Tue, 07 May 2024
 08:55:18 -0700 (PDT)
Date: Tue,  7 May 2024 15:54:07 +0000
In-Reply-To: <20240507155413.266057-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155413.266057-5-panikiel@google.com>
Subject: [PATCH v3 04/10] drm/display: Add mask definitions for
 DP_PAYLOAD_ALLOCATE_* registers
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, 
 "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Each of these registers contains a single value, but not the entire
8 bits:

DP_PAYLOAD_ALLOCATE_SET - Bit 7 Reserved
DP_PAYLOAD_ALLOCATE_START_TIME_SLOT - Bits 7:6 Reserved
DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT - Bits 7:6 Reserved

Add definitions to properly mask off values read from these registers.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 include/drm/display/drm_dp.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 4891bd916d26..1c397a5f8fc5 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -734,8 +734,13 @@
 # define DP_PANEL_REPLAY_SU_ENABLE                      (1 << 6)
=20
 #define DP_PAYLOAD_ALLOCATE_SET		    0x1c0
-#define DP_PAYLOAD_ALLOCATE_START_TIME_SLOT 0x1c1
-#define DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT 0x1c2
+# define DP_PAYLOAD_ALLOCATE_SET_MASK	    0x7f
+
+#define DP_PAYLOAD_ALLOCATE_START_TIME_SLOT		0x1c1
+# define DP_PAYLOAD_ALLOCATE_START_TIME_SLOT_MASK	0x3f
+
+#define DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT		0x1c2
+# define DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT_MASK	0x3f
=20
 /* Link/Sink Device Status */
 #define DP_SINK_COUNT			    0x200
--=20
2.45.0.rc1.225.g2a3ae87e7f-goog

