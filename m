Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6845E6CFD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 22:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5CA10E275;
	Thu, 22 Sep 2022 20:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62ED410E275
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 20:23:57 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id cc5so17320181wrb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 13:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=+2wEh3WqE1UPPivBT67hsuwj5Z+xEmJEnWlrZNS8rx8=;
 b=ikd5Szt2FhwWcMNJrGCDBjLEqoe8jIj2NTahYdL87VRwuKYQ7xOQO109lgWAwIuZKI
 hu6acIBgwi9Ma0KIK86FeJv0iUWz1DlVGZqlGoN0/U3IFvsBKCMNbPbKMvs7zyemoDHE
 6BfdGMN3FHIyKeqj4n5Jerg0Rxe0hTZ1BR0MVSRz88Xkx82BcaQGGbhxTCOqucPvjeBy
 e2hiPoYDUAGUoPbdNQXrDzI0XXn0yqTrMcplQZMZFH0KmbKscuimYZi7exKTHFpOqJwM
 hTrKfxNAEYX8gG+knfTf/7QfwfZ57ckavFcpaEqnK59gZ0noO3Snqz+f8MIA+Rq954tS
 jOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=+2wEh3WqE1UPPivBT67hsuwj5Z+xEmJEnWlrZNS8rx8=;
 b=XhtSfwWpXngc0UGRoZNWVexr3oND3UntYh7arFSa1RYMMWBeLD/v8owODqzjw2qMG2
 /Vir3UbxpGfZ7a8WEMSUux3BQcFaQy9HGRQkHAUKiYxeoSQ2qRTG8j9GOQ3P/YgF0kb4
 qyx588HT0fUSdlQH43y9dltQrDcoCkcmi5mMR4mW1NFp3PCUNtZ15tElDF/GFRrauB7/
 nvRYxOiOPUtfPrqPMjeup2+MfK6jywyY9gZnnoB/x0NtHaQbhFr+tG791zHAmyoY1+BH
 5MO4uJNg3Y6NUM3DPyeFTnX3u2o2WhAy1RpZ+FyFXO9tVvqw6SsHSmgOWw+xosdBmFDs
 zZZQ==
X-Gm-Message-State: ACrzQf2PZsVTOX2bU1sflMgqXTevZ6VFq0Qxw06X2Vr00e7hUPmM2OjB
 oqs8cWHEtow3Lc1JvMeuwkQ=
X-Google-Smtp-Source: AMsMyM4a0qwhA26q6LRWbALbKOZ/AtCsNhByKmT//UDEz8gzuLR3JMTbyexpEdapXxLDTZJWzV6nqQ==
X-Received: by 2002:adf:9795:0:b0:22a:f421:5d0f with SMTP id
 s21-20020adf9795000000b0022af4215d0fmr3117691wrb.644.1663878235728; 
 Thu, 22 Sep 2022 13:23:55 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 bg34-20020a05600c3ca200b003b4ff30e566sm5092355wmb.3.2022.09.22.13.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 13:23:55 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Remove redundant assignments to variable count
Date: Thu, 22 Sep 2022 21:23:54 +0100
Message-Id: <20220922202354.2465482-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable count is assigned a value but it is never read. The
assignment is redundant and can be removed.

Cleans up two clang scan build warnings:
warning: Value stored to 'count' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/drm_crtc_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 457448cc60f7..2467df7a7a95 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -632,7 +632,6 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 	}
 
 	/* a) traverse passed in connector list and get encoders for them */
-	count = 0;
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		const struct drm_connector_helper_funcs *connector_funcs =
@@ -678,7 +677,6 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 		goto fail;
 	}
 
-	count = 0;
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		if (!connector->encoder)
-- 
2.37.1

