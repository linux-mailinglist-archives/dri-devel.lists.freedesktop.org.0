Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9E7CB658B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 16:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3216810E81D;
	Thu, 11 Dec 2025 15:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OeRhmEtF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4389E10E81D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:28:12 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-298287a26c3so2949325ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 07:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765466892; x=1766071692; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IeE1L9lCPfTWMZGJYdbjvoHvkM1Avioc8h0oyJcvAGA=;
 b=OeRhmEtF44YNzHERHZHPq8Qz0seB/NNyx0lzdgsVCNv5wA72xSjowpyMy/swtLy9kd
 iGYxPvMtJlpEENtlbl+oIIdNInlrCLG8hVkZzjfVm4EkVll3N/9YvVZRfbaBm5Ve1FxN
 w2cD6Z4EMZQNcoevXiAu2HjDh/St3jOHqG9FtoMwdWoFNmz/WNo8thdW/FVA3Az2suzP
 EzHSzFeQDSp6KdpAtGf1YD9p7YpjjCeaHQISQlMO7SUq88ja7OecokboPmj7sZNk10ZM
 nrkPmJJ6WU8TUgzx5gjnZQpoCjhB6dOdJt8n4lFT0wXl6+vwHiEOFZHK821H6GrXaJyP
 w2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765466892; x=1766071692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IeE1L9lCPfTWMZGJYdbjvoHvkM1Avioc8h0oyJcvAGA=;
 b=obdONogudy7fRbobx07m/yQoocqQzGLEwj7mU3bmGW4Kso7O3JhwPWiRVyxgITo4gc
 wsiK8DEFEehSiiT8pBNgiR6T3kTJ5gP+XiR/UbBZupjiIJqmUXEWu3gKUOmqTtvb6SSG
 7+iyZvxSmRLVKfWtqRZYz+SR7HHRgapCf7ihVR3AYuUlNjRAH32QafyCQu1Ar31kCLX2
 Jo0/xUXQtBx4bYoVfAlfm3OIgZv0X6c3N9NPwfnjgxPdpo8nlmOJs0hXf2NnVI0gWQ+b
 BINrmCaoCXOFq4EZtOYI2lRK+6T1bccY0ACg52+hD4ZSPlYqxlFb+Up39c0q8YO5k49z
 4zmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv21nZbeqWm62kPi1gVxIWFYZ2UnHzV0j8kwGHvszH4hCr8XNuUH46ZE9IdJoF2P/UwaYmdmOJDQ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLNfKx/vjpJ8BrEF2jEu8f+J72A+6HpTsUSnEyhccRKQxKFuzh
 agt2kNuj4zB/MxHp2311eyDHPd+scQ8SYyXoZ7yIrt865x27vk9oKp/J
X-Gm-Gg: AY/fxX42NqLVgfSP2HnE5o6tql6p+iPsshYRimxbDfnBYiPzwrKlZ1ry11Qq+MAmSdH
 DgLuQ2wdXcBqQf/d9CKiWzWZKTvNxHLU30a0KVozt6GX7IyTlBgBRPXOScqkUvsxIqAchODYHEh
 /YGbn3VYssP+GcFXdUIcC40s03NC3z4BEauF+3aRytFoxEfQ4+CQtBW5HYWrkOEo6KAQTbj0LT4
 /HJ+T93pXhlYHNUr5i6Sija+gFQ09b1HCFnnBHxeg3UC2Pvs+DVCHZhx6GXcCdr3yEB6ULeP3Ze
 MFIDcBg1FPwrDxHZq+6rhtubDDfcRqkp9BJ1beH96nmeq95SL9kY205/9SWQGULMwRYQ2E9UhG9
 WjEKyGQP6tPwMu1iAATfOGQ6DvaTDg6zjNpcAnLYKkL+1Z0uhpo6WaGdrKirB0dAmPIHDpaxbfU
 YVfgyYqsSe8kpJtlZT+JgskEE=
X-Google-Smtp-Source: AGHT+IHlArwVcYz3DUfciqyKswTQ68mcxdpSevFo5EUCuZKAfdt91RYKMdSWdPGZCDeyqbGrwmzkjg==
X-Received: by 2002:a17:903:2ec7:b0:295:745a:8016 with SMTP id
 d9443c01a7336-29ec22ca8e0mr60093495ad.11.1765466891603; 
 Thu, 11 Dec 2025 07:28:11 -0800 (PST)
Received: from c45b92c47440.. ([202.120.234.58])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-29eea0169easm28614045ad.50.2025.12.11.07.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 07:28:11 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alan Cox <alan@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/gma500: Fix refcount leak in oaktrail_hdmi_setup
Date: Thu, 11 Dec 2025 19:27:59 +0400
Message-Id: <20251211152759.2421435-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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

pci_get_device() increments the reference count on the PCI device.
Add missing pci_dev_put() in error paths to fix refcount leak.

Found via static analysis and code review.

Fixes: 1b082ccf5901 ("gma500: Add Oaktrail support")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/gma500/oaktrail_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index 20d027d552c7..2be12acc93d2 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -712,10 +712,10 @@ void oaktrail_hdmi_setup(struct drm_device *dev)
 	dev_info(dev->dev, "HDMI hardware present.\n");
 
 	return;
-
 free:
 	kfree(hdmi_dev);
 out:
+	pci_dev_put(pdev);
 	return;
 }
 
-- 
2.25.1

