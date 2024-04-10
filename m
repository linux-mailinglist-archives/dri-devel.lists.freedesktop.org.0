Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CE689ED74
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 10:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA7A113240;
	Wed, 10 Apr 2024 08:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PFr8d6nL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B297E113240
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 08:22:06 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a519e1b0e2dso672218966b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 01:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712737325; x=1713342125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W08OGW7A4d8BhMW37wsOsXgyIhwpe4nsHm/mzDoOZ2s=;
 b=PFr8d6nLmKCsaDf50PfTiDtM1QvAEsEEwcxEl+gzxlOHGHP39qmG5zoxluXGo052SN
 1iTpLja9CFtZ68XCiup4u3pI8ww4MGTptULD0Ms10ffnOxspk+CLU1jMSOJxgZiaUhIA
 YKnYkX7CvS/yAMhwWIBggNErVuUgxWidqRsoSxXdHXwPS6zLuc2x/ZWJkLi4v1QFfRuZ
 59gRf9irnFdYijXIc/UPpKxevkU3B1GCWULzryIewJdVBA0oaUfbyshmiksNdOYMTD0q
 cQfPjzrwAo6zcmSzeQr+VjJ4NIksiIMAbl+qhiAvrcX1z8J4/XfjDSaP7vA0s+FiEOC/
 RK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712737325; x=1713342125;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W08OGW7A4d8BhMW37wsOsXgyIhwpe4nsHm/mzDoOZ2s=;
 b=sK7yZ0wh02zGp7jh7knTFXKpgOKtJh/1aZbURiK5OvNee9SN2HAkw9Tra1WWLbdKK9
 SIsrTO/M3MNqpCQhfc12Xc0o+jvhMCCWXTX5Td8wMD24GATPxVbT1gkl6l6exiaGXpAP
 phtTT8FmIvJ+nf4Zjx5vodeJR2g8r5k+93yOblRlOr9nnLTo8pR9Wgq7g8/5wlMbzT9G
 GvIpM/07Wemii7uIKzz8RSQkha+fJgWMP8JCEeWk79GsowqkSgr3Fu+h1Q88fdqwB4Tp
 /+66NhrsnwHOew1rPq6EjKdUJ293hkbl0Ud9S9nq6pcu/MJquN6mJ2yvT5MWg3iK87Qv
 RLCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFQ4jE0Q/pfSFPwjPNORAIdV88AeycfbjyaTJaRHCy6tLf7ZTNZRbxH524FwMFpetwrmpjPfmmGAESJRGWaIRnHQIh5Gv60BpzmtGK8L4R
X-Gm-Message-State: AOJu0Yw3OawGf3L/Fya/fps2KfDiNl6lYHzGWwb0GNrPKq0L3GnLdfxN
 NLBqhtPzwtTux1nusGV6uIvpmTdanG5nMlNhEBz74j40TcfZG0st2FWZGAZL0pw=
X-Google-Smtp-Source: AGHT+IHO73OLzGBnIHP93WS1ck0o5UXo3asRI3ASj0p6/gpvUaKa0lWpEeuhDhRuJT5EmaJztPtzzg==
X-Received: by 2002:a17:906:dac1:b0:a51:c332:45b5 with SMTP id
 xi1-20020a170906dac100b00a51c33245b5mr1733543ejb.7.1712737324817; 
 Wed, 10 Apr 2024 01:22:04 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 y15-20020a170906448f00b00a51d250a1a4sm3902836ejo.80.2024.04.10.01.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 01:22:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RESEND] drm: use capital "OR" for multiple licenses in SPDX
Date: Wed, 10 Apr 2024 10:22:00 +0200
Message-Id: <20240410082200.44966-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Documentation/process/license-rules.rst expects the SPDX identifier
syntax for multiple licenses to use capital "OR".  Correct it to keep
consistent format and avoid copy-paste issues.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resend...

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/drm_client.c        | 2 +-
 drivers/gpu/drm/drm_format_helper.c | 2 +-
 include/drm/drm_client.h            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 77fe217aeaf3..d8e3427ae205 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 or MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright 2018 Noralf Trønnes
  */
diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index b1be458ed4dd..2348135fb6c0 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 or MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright (C) 2016 Noralf Trønnes
  *
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index bc0e66f9c425..1b907709115e 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
 
 #ifndef _DRM_CLIENT_H_
 #define _DRM_CLIENT_H_
-- 
2.34.1

