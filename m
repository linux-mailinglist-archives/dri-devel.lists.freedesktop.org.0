Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C00A49414
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 09:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B1A10E1B9;
	Fri, 28 Feb 2025 08:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aFIwnjzr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438A410E1B9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:54:27 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so18339175e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 00:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740732866; x=1741337666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4PU3VROE0VC3jFwJOOb4ASIIAwndMW9ZvNWHPQLq2Hc=;
 b=aFIwnjzrM4N9dtqmxQnnlwPSqeM/boS4DGvQUL9xMubSpip557KxpLnxUSRCz4spUu
 wruX29Q/bK/Ir2aCNs50hwPezVSPBS/Xihwej3m4LcJR7TjslnOZsiBw3eLMaEdsezjv
 0KIALpPR+ZGsl+YttOGEM/AILaeKCRvA4dm3U/4g9aYv7SFfNnemFDEth1rxBhoJeYn/
 yrZ08/sHsz3w4kz5Hz/oxSNQRZj+0FhXwn6hlVT5YA5Mi1HmS4YTsMt+j8sLYUq4M2fV
 PwNJBtx4eERDURrcUvJTqJthXOGu9DZLEMIgpyQHjk2LzUvN3DTLAocDxmWpLblhvuZp
 H3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740732866; x=1741337666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4PU3VROE0VC3jFwJOOb4ASIIAwndMW9ZvNWHPQLq2Hc=;
 b=sel97Zm63Sac+6fZmcZ4lUAJEP+V3j+5dS5d+HSav9P+RTJtbKQL/QbxfO2SORbn6k
 KHs4uMMkjDR3oRJT4dW+H5e4eHYq5kALcHQKzKQyPIeeiQRtZLa2kYI8S8uBlyeNC/Fw
 wALXZgu9Qv7w13+8j4JjPr+nPgIpxPs3+Mt6MpIYZQGga5PWjyFbewdtcE7CAV095kXh
 PE652Ih83n3c1phkE0y1wwUYs8V3pDQFM7gxBX8Yux2d8ro7YNR6QoZQwQ5DMbJwyak9
 hlg6TbwLitOYaAaEEDEOvl1K4sb3HPE1Lz5GqIXu6AljcCEZnrIZ8ZpEr3UJWWwuh4mr
 jeUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXodz6QKi+9kbD6NJ4xTAhZsyQxjV4cXq5+voIhH8wNyqn8FYUhUAnDxzgg7GlGYoF1ClnMnFD7x88=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNzMVDa8zg4AqGusLGhaA4l87yEMLn1+3GXY30MJVq9EIvJXLY
 dZRFMePa4OYU7k5xM1xNtyJPKQTzFao2AFAT3UYM42JgDNKeNBPl
X-Gm-Gg: ASbGncsAO0hq7WG4RimDvj2I+CEF9XOSLZchYwI4iUzKctoMudoeqWsbnlWWG7JjTAe
 bAW6TBit9EIP5hlOlYgBalK6lh6d+j/qcVOajHHTbc6SkcuhI0gEFQ8URj4q+aYHRXpKyRZB8kq
 9M/O+LTJCF4+Fd4h4wOq0TUuUmUOJCWOueDJdLe1uVJg0qj/jvX2RteuWfiaLPkGjL1lZ0PBnlZ
 fGjgFPA9+8vj4i+M2l+iIs1sGliEQDKaZyDFcBscYNUxY7AiwERc1hEVg1qpxJBgulV4s4SD01c
 CSFJr19g609J5lUNPCzrPrFIv5I=
X-Google-Smtp-Source: AGHT+IFdN9QWjQoWfvRrcmLYLHSNfLWzrvfKg1j1asn0+L35lErLU+3cgXYWH8XIqwOdFUt4mobwmQ==
X-Received: by 2002:a05:600c:4193:b0:439:9384:7d08 with SMTP id
 5b1f17b1804b1-43afdd934eemr55383815e9.2.1740732865675; 
 Fri, 28 Feb 2025 00:54:25 -0800 (PST)
Received: from localhost ([194.120.133.72])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43aba5871d8sm79843175e9.37.2025.02.28.00.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 00:54:25 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/connector: Fix spelling mistake "provded" ->
 "provided"
Date: Fri, 28 Feb 2025 08:53:50 +0000
Message-ID: <20250228085350.678446-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There are spelling mistakes in drm_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 5f24d6b41cc6..9cf347f70643 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2525,13 +2525,13 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
 		return 0;
 
 	if (!supported_colorspaces) {
-		drm_err(dev, "No supported colorspaces provded on [CONNECTOR:%d:%s]\n",
+		drm_err(dev, "No supported colorspaces provided on [CONNECTOR:%d:%s]\n",
 			    connector->base.id, connector->name);
 		return -EINVAL;
 	}
 
 	if ((supported_colorspaces & -BIT(DRM_MODE_COLORIMETRY_COUNT)) != 0) {
-		drm_err(dev, "Unknown colorspace provded on [CONNECTOR:%d:%s]\n",
+		drm_err(dev, "Unknown colorspace provided on [CONNECTOR:%d:%s]\n",
 			    connector->base.id, connector->name);
 		return -EINVAL;
 	}
-- 
2.47.2

