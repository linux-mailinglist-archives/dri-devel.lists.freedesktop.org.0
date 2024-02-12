Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D236851471
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E442710ED2E;
	Mon, 12 Feb 2024 13:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GYQzmiir";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6428710ED2E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:14:30 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-40d62d3ae0cso19821375e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 05:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707743669; x=1708348469;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=RCSDKBlfQwozprcRZ3oUdFL3KROvOog8qplv+oCSSMA=;
 b=GYQzmiirX11oqBwvdZN68TfMi8KItV5ad5nvfX6JOug9fHmS6O03qJIoeG6nLaiCKY
 Fcg/aLztipntg3Y7ZmcBAeKpWfPAj3wYMMTPQLQsHNlhkEQLN8wEC9QhT9yybDr1PiCY
 SMBy8hNDvZJrvvyRlJ4F7VBXGvoOYS1C3NyvtWGPk4tyAZnKlqV1bENCozkW1Qj46HpJ
 jM32unpOOpXyoimxxcm1ENxPmJaBT+lYZautpVopOSB1P55HM23BhFvSxI1feoXMI3Mw
 5MQ06M+dpk10L8e6yVvaOKSAy7/ssf9tepTkvdZi+lmwE41t1mjjK/Hz9uVQRwKGM8nl
 oKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707743669; x=1708348469;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RCSDKBlfQwozprcRZ3oUdFL3KROvOog8qplv+oCSSMA=;
 b=Iv9JngNQni299W2gUvWmR7tE8/Eva2oOHv9tJdj0GlpX8zVnkU8nt2YhATfcr2gZIo
 zayNy3sSLtD3ScL+JHjh7dM7m5aVfBeJ6f88fiXmkrfOFRgj+Ep+DIAaFBW/aY35tazM
 oAI/0D/6vEvmKmQNRGnEoaV+ZammNnB3y9dOq/nN5DYXq05IZCut9+o20om6fBuGuRJH
 u1GsQBkUT8WRi6K/e4teu0WX7Zn9g0L/RfxJ6xtBacobgJ/C2QO2oVOJvn6ZaLNZz0TP
 oqK4QU113GlIqn/g46no5k7MYV3rqnQw23zQQrYmTOEyEf5f+4gGd3zRGB+A8ffm3MIe
 pJIQ==
X-Gm-Message-State: AOJu0Yxgpr63CgGFEOhGSGAVjXycdKC87cNgp3PqMUfrpnAFnt95fa5m
 y4OUhtTj5Rz8/t/QwJK9mZPlnIQkVhVZE3gNxEXqvYhC1tX/QKdcx09q0sW6u77tVIsZ9ubc6i2
 94izoXC03ow==
X-Google-Smtp-Source: AGHT+IE9OvhFws010e2ne69d30ZH4LLamrT1DYOdh40Fj0M1L/BfU/9QYgsVvgd/OGJebKb8iXxYPr0SmhAS1g==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:6002:b0:410:e190:b1b3 with SMTP
 id az2-20020a05600c600200b00410e190b1b3mr5577wmb.4.1707743668739; Mon, 12 Feb
 2024 05:14:28 -0800 (PST)
Date: Mon, 12 Feb 2024 13:13:19 +0000
In-Reply-To: <20240212131323.2162161-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240212131323.2162161-1-panikiel@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212131323.2162161-6-panikiel@google.com>
Subject: [PATCH 5/9] drm/display: Add mask definitions for
 DP_PAYLOAD_ALLOCATE_* registers
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org, 
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
index 3731828825bd..9dee30190f14 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -733,8 +733,13 @@
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
2.43.0.687.g38aa6559b0-goog

