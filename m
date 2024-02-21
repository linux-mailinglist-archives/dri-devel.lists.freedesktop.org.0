Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5BD85E268
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7642310E7DA;
	Wed, 21 Feb 2024 16:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="aCKKga3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9008810E7D9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:02:42 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-40fb505c97aso3960215e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 08:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708531361; x=1709136161;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=jnqnjQDU6WxVzzZ+ac7V7PyPPfIa26jAPZrzYY3D8HM=;
 b=aCKKga3Vs2tnCZ6st9bLKs9OyY641u9yXIskSPl5fzdK/aEtnBxRJr2nBRqGfG9ZC6
 Ld8oZ3+1bica9HusvsFTbKYfl/0s5FAAHNnv767X2di+S3xVWWcJcgec0lgIRn4DFlwZ
 1r7GUAK4Z+m9fzEZzbEvSohQNZ4jjg9Gb/onNvQ0ufe0iu2/wdGOATZhA67gelYCGWTx
 7E+T5fJtffgogAbpAp5kbszw5pFVaod6J/YvyCyOmy/zi9GhaoVInWEOxDeS6oKmNTKh
 nBie5FWjXBFpSEM4W0Ckk2bkAQR9AtOnv8ShBAUzjbRHcp8xgsSQ1pOWc+ernmKIHhja
 P3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708531361; x=1709136161;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=jnqnjQDU6WxVzzZ+ac7V7PyPPfIa26jAPZrzYY3D8HM=;
 b=dliAhBKKU+ktURYuOilfWS0Re7TfoRItmKZUm8OJeq1VS/bOBkXDUe7LjuongcihtD
 z1QSzTtUbJDEQAxF+OV422qziBuylWBhxiz8nrz6tRRSIkI1pl8Hv4B2GE4HSSOcVzCy
 tTg34HDXbKZm+DqXd8Nhqfth6qZB0AOoSoIaSxVVtx/rOyp0uoe6UcMCjSW04Od1DvrI
 PgzxnbWythJV4TGO7adApdAJ3fDmyDj7FB+w1KZ7mh2AiG+K2fpskwkdyw1Pi9IB4qOs
 I65D3KQtRdUARYYAGQsh6Kpl0RYCsCRnU85UORktuOOP/gQWUPP1iwUjsRd5TXWVHZ75
 SRog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVF7+ww4uZbV+hxxW3Vxeu4FXywZizsTzzdEj5lAJNtFv4UlDisBKGQ7UUwz3fOW3XYiA9es7XViHk2kfVgAaRzExYs+LCLFQrmWS6yKgX
X-Gm-Message-State: AOJu0YwXpzvdAq3Lipjle8dJgyqS+tHcebSsKmr3q7+4sDouNKTGSmUw
 I1gkkN3vVIMy2un8SfAf9kHUP8eSxjcLgm3Krmax9EreUKwIDhW2hV8BkpXEST9IRtLmFGX3taq
 DwL6JI4BJBw==
X-Google-Smtp-Source: AGHT+IGyGabF+LHiG1n4tuK6dy+R8/udpYeRM3SpXuvYBxKMLaSa38Huig22OKd177ctxAO306bDTgPWtaTLDQ==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:a399:b0:411:efec:cf6d with SMTP
 id hn25-20020a05600ca39900b00411efeccf6dmr101907wmb.3.1708531360602; Wed, 21
 Feb 2024 08:02:40 -0800 (PST)
Date: Wed, 21 Feb 2024 16:02:11 +0000
In-Reply-To: <20240221160215.484151-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221160215.484151-6-panikiel@google.com>
Subject: [PATCH v2 5/9] drm/display: Add mask definitions for
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
2.44.0.rc0.258.g7320e95886-goog

