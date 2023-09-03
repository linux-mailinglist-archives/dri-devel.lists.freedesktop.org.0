Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33339790D8F
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 20:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D756C10E1DD;
	Sun,  3 Sep 2023 18:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D893E10E008;
 Sun,  3 Sep 2023 18:46:13 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-79275d86bc3so37875439f.0; 
 Sun, 03 Sep 2023 11:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693766773; x=1694371573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WS96irfNC14gdmDiFClarh9DIKJfgD77OErS65jXzQY=;
 b=Ttp4JPd4Jj33/XfdzSQIdkJBIO3nlWazutzzx51ULrEwEF1Yziiucpvzxs5gwI/BBL
 Cl1L/Jru9SyMKz3LfqT2RzVpgG7QjZGotFCHYuKcyUkmaXtBIpD5F9jc1tVpuNIIBz5l
 sJu/tSGY2s47xNcjnjqt6lANvMwsFF6hedXiGtqOZEVcUAGBr8n0iG4rFcxKAa+LSpfC
 M8ew2XY17k/PdxXb+1CCKHuOX8qUHSoBXuPBM4CDvJ9FptFw5cBZCc4gx7b0Fxy1X2uF
 ANweDl0OJoLBDHljRqBQMvO/INzKOjAYEtTzjQ30FnpVN68i2TMy+VYq43yo/yY9VuNG
 vkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693766773; x=1694371573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WS96irfNC14gdmDiFClarh9DIKJfgD77OErS65jXzQY=;
 b=k52w/YLPBhDQpKh6PgwiEGbhz61XwNyHTy9+UkxrH5cY2q3dWueHlfQ4uBbxhwvrlW
 +0bnVUFu8gJ3XvJfICmpA0KVH+Eryoyv+qSbGMJ690yYvvhlmef8QutIcccZsh2fZwis
 T9KwRLxLkuX32lC1nl438lca3RfIQ16/pHEX3uSQe7aR1SLdM4l7Cy0bgGBCXBqvv8x0
 3Wb8GA6ctuLsw4ipND+h2t4g8/HVq2SwiBJca2EpUGy1UXIlGQ4gDe36B5UVHytdZrwK
 bKYWeWFmFI5P686tjG1eN1G1jvdCoNM2z/lscEXbjP0j4nmvwvqZx7CQSAoTyHwn7Bxg
 STfw==
X-Gm-Message-State: AOJu0YxJ3JlauzFd12+OkqOjVWW+8axqtdtuET7DjiFs35FyCHp35mxa
 PTUz/n/SlS+DZ91L0rN+VoI=
X-Google-Smtp-Source: AGHT+IFYCmR7Iv8xnRYnf/lKtlWv1bE7hNxZ00vdtzELzd9ulSSSQd6sJ4F8ae9sGd8UtxCQOEjWOw==
X-Received: by 2002:a6b:ec16:0:b0:792:82f8:6f90 with SMTP id
 c22-20020a6bec16000000b0079282f86f90mr9317430ioh.16.1693766773070; 
 Sun, 03 Sep 2023 11:46:13 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 u9-20020a02cb89000000b0042b37dda71asm2519968jap.136.2023.09.03.11.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 11:46:12 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/6] drm_dbg: add trailing newlines to msgs
Date: Sun,  3 Sep 2023 12:45:58 -0600
Message-ID: <20230903184607.272198-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230903184607.272198-1-jim.cromie@gmail.com>
References: <20230903184607.272198-1-jim.cromie@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, Maxime Ripard <mripard@kernel.org>,
 seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By at least strong convention, a print-buffer's trailing newline says
"message complete, send it".  The exception (no TNL, followed by a call
to pr_cont) proves the general rule.

Most DRM.debug calls already comport with this: 207 DRM_DEV_DEBUG,
1288 drm_dbg.  Clean up the remainders, in maintainer sized chunks.

No functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f28725736237..14020585bdc0 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2925,7 +2925,9 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 						     dev->mode_config.max_width,
 						     dev->mode_config.max_height);
 		else
-			drm_dbg_kms(dev, "User-space requested a forced probe on [CONNECTOR:%d:%s] but is not the DRM master, demoting to read-only probe",
+			drm_dbg_kms(dev,
+				    "User-space requested a forced probe on [CONNECTOR:%d:%s] "
+				    "but is not the DRM master, demoting to read-only probe\n",
 				    connector->base.id, connector->name);
 	}
 
-- 
2.41.0

