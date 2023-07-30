Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144697688AE
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 23:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E5D10E16B;
	Sun, 30 Jul 2023 21:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1298510E156;
 Sun, 30 Jul 2023 21:58:25 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-790a590237aso27571139f.3; 
 Sun, 30 Jul 2023 14:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690754304; x=1691359104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zbdMUo5HBcvY3eA/Wfik+1Hzr5RoZnPa0wj8fbM2oVc=;
 b=agVaMhk3pEDzjsQ5PJyT8TavFw+ZA1YIJ4H/s3iaFPJoI8A+JU9zgKcNSrJCgxUl/r
 gYWsjp9fZNe4vt7RemD5oACo4VCjF07da+eVPFlVJIkfktYDXcy5Oq+0ekv9WXTj7pcm
 hmEnSEYYhhmntvlDW4g70h2LR2HkvQn5FqAST7z6k08AS8fAEwVkjuN8tRLiIF0a5ZIV
 zqZnaBhzbuwwTxWL4loRMEodWBeftbndPQeDTMmB1/vwK4WwDkrY7l5AJVSHTEYTFO29
 s5w0iqu/j3yx3l/WX3aD+U1AhW9tHhIrbBDMXu+ZSBw+XLzelPALaICnC91VG1juNtbi
 c5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690754304; x=1691359104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zbdMUo5HBcvY3eA/Wfik+1Hzr5RoZnPa0wj8fbM2oVc=;
 b=eul4y24WC/BOoZcBOL5LdVrLRg9Y2ADh+3GcKsukRL8YlhyKNhijG7WhyMqQPKyhI0
 n0pBdBySwxmt5sJ5BSoVQJ8DGSkObxIUCzOayhcMqKtaAPCxOkhv8VmZJVBVKyNvWg0N
 ekOphuFcYbZiL0zSI8cdeXc5jXkEEfn7rGhAogDMs+JeF3u4y2ytVQpPQin/K6+fmIEo
 fVQQvlCAbJKJ5xv/es185iXK1Q9FmNzpLr9ueiowX4AL1iKkaCMCtgAdDbQQJ5orPkjO
 ipT6C3XGlQ5/fG4YchSDtjgIy7WWlaPbe58tlicrrA++FKhlitLfuU7HBSt0r3RciC1t
 XkLw==
X-Gm-Message-State: ABy/qLaGxDdmPhiPPZbezGo8V6KGQD+Not2SX9eUpbJcKHb4Au3zGrFQ
 FcRKm/XWC4r1nLVGI5jqOQ8=
X-Google-Smtp-Source: APBJJlHWzXyQhdHLBN6Z9svWK4MZ1KGWPcL9B/eTSCudiAIzkRE+6jckTWaAdZVRO5La86sBKnRHQw==
X-Received: by 2002:a05:6e02:1aad:b0:346:50ce:d602 with SMTP id
 l13-20020a056e021aad00b0034650ced602mr8965298ilv.1.1690754304330; 
 Sun, 30 Jul 2023 14:58:24 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e18-20020a92de52000000b003424b3d6d37sm2747520ilr.24.2023.07.30.14.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 14:58:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm_dbg: add trailing newlines
Date: Sun, 30 Jul 2023 15:57:54 -0600
Message-ID: <20230730215758.54010-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230730215758.54010-1-jim.cromie@gmail.com>
References: <20230730215758.54010-1-jim.cromie@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 48df7a5ea503..39eab45649c8 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2868,7 +2868,9 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
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

