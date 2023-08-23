Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C078531C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 10:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D3F10E3F9;
	Wed, 23 Aug 2023 08:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A26D10E3FA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 08:53:32 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5009969be25so275558e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 01:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692780811; x=1693385611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6rtQaBEI7tcum+ap0HtQIWPfUh5EA2GW0hFh/JypvjU=;
 b=ousd/9SnCNrM7UrVLsSp0ud5aQ//23wl/uzIK+EDEqgxreLiEngAgHDxq0emhhQrk0
 l9+Hd+pKJayIcIJR8zpA1DEk2H+6eltlic8h+1OF56BKlB3x+UfMTQMR2VMFtIzKo9F7
 N7A8jdVQg+nSxYwl75ZANi4s+PFwWJuLfuCLHkHjiU5iPFuIUWqYsSXSgBvhE40TWM4E
 oyo6qu7FEw99Qq/i8nxXkqMCMjAwT+T6YG9WW8oz9zgA4+m6Ko24Unez/2Xbok1GlXIg
 lrky1QbVLf8Wa+/Dk/1OhQ8Gh5t/GGoHXgwy+cBjR/djwYvCUob4cmC23OdbhierDAT6
 P/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692780811; x=1693385611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6rtQaBEI7tcum+ap0HtQIWPfUh5EA2GW0hFh/JypvjU=;
 b=OULNQfvnlgy97C++3R+jqdXjp4ynAO7V0P3/+Wq6jg+eP/cYgYkaIjdhVsVRKbot4T
 0n1uY3+sMzfpPpz9yYG1s3GGspK5nET+pqGqBcv66nT6tKGMagVNuTfmNI+Oz6rInOzV
 cv5+3EcNZn7/1Q/nKzpTy9ZNI8FqHbIhwYnoRhIqcjbShGoA6Gr9DwHAX85VFswSyZAU
 topMFL1dNqETj9z+4AgFQL+3xAonEp5+ZLZ4vBf6qt/mxW/bk3//x+rinz7Zn0sVXh0b
 gHTM1+0UbmQHqEwPBd6Q99tTjDakRPEOmNaSQB9eXX5LhJnECwt/F+9U8iaJaHJg5Ntd
 +Bgw==
X-Gm-Message-State: AOJu0Yx9EbTWeeewOeoVsPjTudwuj6MLZcjJkmmsvVkqWZHjG5FeEShm
 CJj9RKkMb3u8xp76tpL6yz+ebQ==
X-Google-Smtp-Source: AGHT+IHE3Y3ECLsbSn1t48rbWWmPSFBaDbfM70ZDZzl2s39mgCNO5GszDrC+GL+RkbUyVOXmaIhYzg==
X-Received: by 2002:a05:6512:689:b0:4fd:d64f:c0a6 with SMTP id
 t9-20020a056512068900b004fdd64fc0a6mr10560928lfe.48.1692780810728; 
 Wed, 23 Aug 2023 01:53:30 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198]) by smtp.gmail.com with ESMTPSA id
 k9-20020a056402048900b0052540e85390sm8940966edv.43.2023.08.23.01.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 01:53:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: use capital "OR" for multiple licenses in SPDX
Date: Wed, 23 Aug 2023 10:53:11 +0200
Message-Id: <20230823085311.113751-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Documentation/process/license-rules.rst and checkpatch expect the SPDX
identifier syntax for multiple licenses to use capital "OR".  Correct it
to keep consistent format and avoid copy-paste issues.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/drm_client.c        | 2 +-
 drivers/gpu/drm/drm_format_helper.c | 2 +-
 include/drm/drm_client.h            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 037e36f2049c..a67db38cb4e5 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 or MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright 2018 Noralf Trønnes
  */
diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index f93a4efcee90..ffb09938b0f9 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 or MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright (C) 2016 Noralf Trønnes
  *
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index c0a14b40c039..3b396567691a 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
 
 #ifndef _DRM_CLIENT_H_
 #define _DRM_CLIENT_H_
-- 
2.34.1

