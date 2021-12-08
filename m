Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9411346CE83
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 08:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BA86EC2C;
	Wed,  8 Dec 2021 07:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C726EC2C;
 Wed,  8 Dec 2021 07:49:56 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id p18so982820plf.13;
 Tue, 07 Dec 2021 23:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x+r6igfAf/kslegJBovNbjh0dSnNN1eggHfhBS76iGU=;
 b=Adkx7HRAgXk7B0Yttk5KzozcClXve5ymmcn5bxXZFwjzzOJDKh4xAxa5K3jSkIg8qv
 tS7FsKM38KbcSR4ohgKDwiZ/BQA/2RFvhV4qxN2jHkPuic7V6Ik2cE1WKj9htcFA2Q8f
 mJXtEElhYd6zLpPFYHU9jDjlEupZRerFzNJoApJ+16eW+jy+nCaE7v2tOoD1ErWSWf+H
 sEIW1JRFOtLm09pI+tf3bWIrGYwd8FQcum+DD019nD+B7eBxcSZwTIvNXjvM1qG8rxQ5
 gLBtcJ0Z8TWMLJa6gjhoWaWrAwFJnJfdGgEzfExI6iw6KYQHaaf92NXIlJuLnVWboyg3
 EYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x+r6igfAf/kslegJBovNbjh0dSnNN1eggHfhBS76iGU=;
 b=IqPbp2qwXF+ZtunPt6h5o1IGNfx2cTvuUMDo+MfU0YypBbFWjD5mC84+c9P7fqdDCh
 3dhGOrvSB4lpxEE0FyhNADqfCiAiWge/IRw9/jgbrKHMlvmk605Ut8jNsGi9WEVhd7Gh
 +tA8srJjWPTc3Ridn9/k8nDxQOQU60tlN4ihWXdPrwuwutVqePY/ci4jPsXCbAiNypDm
 WBEei8+90zk9grpp/eTX8SICnLjrM/rYTlo7UfMB8z3bhjp3aTYdvDFmmeWQFcPQ7doG
 Kzl8qG7TGEzbs1RE9VASTnJT0XoifZZbO+SBySwsC+Vne6ZxhInIqcy5EP+83Yae1v7t
 tKIQ==
X-Gm-Message-State: AOAM532TbmrQErd1txiHimkNGHbPJdIInnG3vAPsAsp2yFW+6wXe/ZPy
 KyALDaShBP3FsWsY9dkiekU=
X-Google-Smtp-Source: ABdhPJzKB2STTgrXaQBp8/xtEHyw6/KqQ8cSUqipNRApmeAEKFN6GkhRvPSQ4rnENVP/L+q+n8rfOw==
X-Received: by 2002:a17:90b:1a8b:: with SMTP id
 ng11mr5322731pjb.3.1638949796472; 
 Tue, 07 Dec 2021 23:49:56 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id y12sm2251752pfe.140.2021.12.07.23.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 23:49:56 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: luo.penghao@zte.com.cn
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH linux-next] drm/i915/display: Remove the useless variable
 offset and its assignment
Date: Wed,  8 Dec 2021 07:49:52 +0000
Message-Id: <20211208074952.404381-1-luo.penghao@zte.com.cn>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, luo penghao <luo.penghao@zte.com.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: luo penghao <luo.penghao@zte.com.cn>

The existence of offset is meaningless, so it should be deleted.

The clang_analyzer complains as follows:

Value stored to 'offset' is never read

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: luo penghao <luo.penghao@zte.com.cn>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index b1439ba..a478b7f 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -964,7 +964,7 @@ i9xx_get_initial_plane_config(struct intel_crtc *crtc,
 	struct intel_plane *plane = to_intel_plane(crtc->base.primary);
 	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
 	enum pipe pipe;
-	u32 val, base, offset;
+	u32 val, base;
 	int fourcc, pixel_format;
 	unsigned int aligned_height;
 	struct drm_framebuffer *fb;
@@ -1006,14 +1006,14 @@ i9xx_get_initial_plane_config(struct intel_crtc *crtc,
 	fb->format = drm_format_info(fourcc);
 
 	if (IS_HASWELL(dev_priv) || IS_BROADWELL(dev_priv)) {
-		offset = intel_de_read(dev_priv, DSPOFFSET(i9xx_plane));
+		intel_de_read(dev_priv, DSPOFFSET(i9xx_plane));
 		base = intel_de_read(dev_priv, DSPSURF(i9xx_plane)) & 0xfffff000;
 	} else if (DISPLAY_VER(dev_priv) >= 4) {
 		if (plane_config->tiling)
-			offset = intel_de_read(dev_priv,
+			intel_de_read(dev_priv,
 					       DSPTILEOFF(i9xx_plane));
 		else
-			offset = intel_de_read(dev_priv,
+			intel_de_read(dev_priv,
 					       DSPLINOFF(i9xx_plane));
 		base = intel_de_read(dev_priv, DSPSURF(i9xx_plane)) & 0xfffff000;
 	} else {
-- 
2.15.2


