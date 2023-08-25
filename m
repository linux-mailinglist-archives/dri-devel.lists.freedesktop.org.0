Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E9C789258
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 01:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5743710E160;
	Fri, 25 Aug 2023 23:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8CB10E160
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 23:31:21 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68a41035828so1171755b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693006280; x=1693611080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T0DooFBD1A8V10MBqW1RginVqDYC6KQwP0qswiVYI6g=;
 b=WVNH5UzkHhUt8AlEXn0wpzIIigCdumsWXPrsEG9O1FoqdJ0I0WBT59w8oTPTTaw0Zx
 7C18046fBSkNWPvkDUSv2a4OoqV1nf/nL1PbLMzzJ3udjSxmHb5KdEpiiNWeMiqSVY4Z
 j+Mk6aYQcNWFp01T5LvipK/5CECUEUYyWumpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693006280; x=1693611080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T0DooFBD1A8V10MBqW1RginVqDYC6KQwP0qswiVYI6g=;
 b=Jo+laQEVT7jhUlfwRsZwB2kPaj3aLAwnLHSjxR2jGk28W7dFgLj0kf4ibBeGYJ2Tfo
 bmtsq/SNLViB53NcKrNL3438bPsMLFkR9Paa0jVr7JRBFpLeg/FDmnDRrYxwf5E+hho2
 eaariICUX3y4tSssI+VrffupN5lJLU6hm1r7tNkzMGlIkYeLW2c0hSklW5xVz+ibfFMI
 Dw2PJKtZxMHzyELF8g/wsWXakXFjisaGN2XVaKirGd2Kr3gxKbcoZMzVgT/Ek851u0Xu
 ukmljQK4dgqnzIKMSqQOFWPQtG2c23s3peDuVWI3QMUfP24mcmL+3goeBCxE4puZZ4E1
 HrSA==
X-Gm-Message-State: AOJu0YzF7wNDuW8VWR2zs7I2sp5JsrRBkged66tkPUDyC1IGsEUW/XgY
 FPTsbJF7CqT09n2Ej55wv9AfSQ==
X-Google-Smtp-Source: AGHT+IFc6FIYdzvhev/WzyfpurbheqorRd31Zx1H4S9htxQ8xUE9T/owg0Q9qpe5SIifQWpPxwDP1g==
X-Received: by 2002:a05:6a00:10c3:b0:68c:1a0:46ac with SMTP id
 d3-20020a056a0010c300b0068c01a046acmr5243310pfu.15.1693006280672; 
 Fri, 25 Aug 2023 16:31:20 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:d711:d7a0:fa61:8f24])
 by smtp.gmail.com with ESMTPSA id
 u11-20020aa7838b000000b0066a2e8431a0sm2092016pfm.183.2023.08.25.16.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 16:31:20 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Subject: [PATCH] drm/connector: Add newline to debug printk
Date: Fri, 25 Aug 2023 16:31:17 -0700
Message-ID: <20230825233118.2689222-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This debug printk is missing a newline, causing drm debug logs to be
hard to read. Add a newline so that the message is on its own line.

Cc: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Fixes: 8f86c82aba8b ("drm/connector: demote connector force-probes for non-master clients")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/drm_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 3ed4cfcb350c..ab1467a15f9a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2923,7 +2923,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 						     dev->mode_config.max_width,
 						     dev->mode_config.max_height);
 		else
-			drm_dbg_kms(dev, "User-space requested a forced probe on [CONNECTOR:%d:%s] but is not the DRM master, demoting to read-only probe",
+			drm_dbg_kms(dev, "User-space requested a forced probe on [CONNECTOR:%d:%s] but is not the DRM master, demoting to read-only probe\n",
 				    connector->base.id, connector->name);
 	}
 

base-commit: 706a741595047797872e669b3101429ab8d378ef
-- 
https://chromeos.dev

