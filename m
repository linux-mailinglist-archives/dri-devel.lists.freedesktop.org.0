Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D639179437A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 21:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F53810E718;
	Wed,  6 Sep 2023 19:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B2B10E70B;
 Wed,  6 Sep 2023 19:02:35 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7926b7f8636so2792939f.1; 
 Wed, 06 Sep 2023 12:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694026954; x=1694631754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A7euIhAUxsBgqAycWxnasjxETI8zYNC1RLZ3qD73WsM=;
 b=ctHx0Vur9+BAW8YMU62p6Y+6YLm7h0Y1i+eDqN0a2/qOcK/Nfo0jYBFc03Zt+TzAbs
 +XPq3MZaLq6rJznjmmDCseE4gnh8o6UmT+ik3W4MzwKeQQDRovje3qit1MJEhV6uWAl4
 A7HASvBcPn91ddy34xlDcdiwH6PewY9g1ULletE3BvrNfzWS7eltsFaiNHTpY8maMHwC
 o3FSh6mLENQN7FNHgpxdf9y4XEMdDYeL64GN+3W84PRZHAZDn2mdwfkNOmFJrCjnWbTY
 8MoL8Dz0u/KS0KHwjQsMMQHuGmKYoXFe377KVQiViluDaSfvDB1swb33uiUCshgbfLhQ
 GmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694026954; x=1694631754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A7euIhAUxsBgqAycWxnasjxETI8zYNC1RLZ3qD73WsM=;
 b=CvQGsGzQ6bJHkka4DQ/MIXLnGPbxtUjEk1AGDihJgFSuLJpB8uDlnaFmBpMU3k7dGQ
 3XmCoR6MuxTUlS7lfuHRoArpWIa45jDZAbFEjHWi7dcyQPF6f0nV5+zt69zaaSztcWaQ
 x1eyatKzFA98fsu9I2s9nu8qilYReii3E++SlCIO/y45Us5/tf47+/AvGaf9YLb5Ef/B
 aYtyuLDX1sjMicKZ2M20ZKby6yuMyKDzyPjBGQgDOOAF0RCPZr8+1dOXCDrQ9J10V9p2
 bTIRhKWdPo9Bn7b3hIs/s+5phA/DKoh2OPR0tW43M8yTU/aVxA1JiLQ7Y0wV+KVFiCsS
 DdMg==
X-Gm-Message-State: AOJu0Yzzcb1kyFn2gk1Wtu7Ubt3dvj1q+wUxL63fhzGeBXUEXE7xIBZ7
 9BGPEn1x49VyUj5IPcA8SlU=
X-Google-Smtp-Source: AGHT+IEerlB6JrUC+Z/0QRgCoRQoVs5aiPA8URhXDpxxGTJSTcPFuBIaCE9H+Uno/nfLK9zvHQVWkg==
X-Received: by 2002:a5e:a718:0:b0:794:c9a8:27eb with SMTP id
 b24-20020a5ea718000000b00794c9a827ebmr544496iod.5.1694026954382; 
 Wed, 06 Sep 2023 12:02:34 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 w11-20020a5d844b000000b0076ffebfc9fasm5152306ior.47.2023.09.06.12.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 12:02:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/vc4: add trailing newlines to drm_dbg msgs
Date: Wed,  6 Sep 2023 13:02:22 -0600
Message-ID: <20230906190224.583577-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906190224.583577-1-jim.cromie@gmail.com>
References: <20230906190224.583577-1-jim.cromie@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, jani.nikula@intel.com,
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
 drivers/gpu/drm/vc4/vc4_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index bef9d45ef1df..959123759711 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -592,7 +592,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, old_state);
 	struct drm_device *dev = crtc->dev;
 
-	drm_dbg(dev, "Disabling CRTC %s (%u) connected to Encoder %s (%u)",
+	drm_dbg(dev, "Disabling CRTC %s (%u) connected to Encoder %s (%u)\n",
 		crtc->name, crtc->base.id, encoder->name, encoder->base.id);
 
 	require_hvs_enabled(dev);
@@ -620,7 +620,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	int idx;
 
-	drm_dbg(dev, "Enabling CRTC %s (%u) connected to Encoder %s (%u)",
+	drm_dbg(dev, "Enabling CRTC %s (%u) connected to Encoder %s (%u)\n",
 		crtc->name, crtc->base.id, encoder->name, encoder->base.id);
 
 	if (!drm_dev_enter(dev, &idx))
-- 
2.41.0

