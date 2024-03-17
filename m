Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E6C87DF24
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 19:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BCC10F10F;
	Sun, 17 Mar 2024 18:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RSi2lMBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1E710E226;
 Sun, 17 Mar 2024 18:02:28 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-513a6416058so4992155e87.1; 
 Sun, 17 Mar 2024 11:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710698546; x=1711303346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8wp2smowMha26TyRXIyBdFC8IaxYcmjIqcsS+ZMuuc=;
 b=RSi2lMBydNcznsMWsvzKsvU40wJW3twQy4hykWsFt5QT7GVKPwxLHXcc82KbF/w5z6
 Fw0qgJd4eW3xvOhM/s+1Szewok+fnR2BY959vvVMda2dMGllkHlcRCHPRCJkSHLNEpLR
 W/4piP3I3QNQ8BEX6aRi+F09k78UdoK5plsufJu7R2QPl11SpgXPiuI5/NqhTHzz1cHj
 vcw+mEuQhC++ltvTaOkXVcBPMr0qsM9DEA4DlGefB92+bJxSVaCAGtoNzShBadzt6+24
 V3JsZl4rka7IT1gHAhJjJsVVjOSebUF6laeuYf8IV8k6D+5FK4qHHsGIfMKdwJC0Osq5
 4KXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710698546; x=1711303346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y8wp2smowMha26TyRXIyBdFC8IaxYcmjIqcsS+ZMuuc=;
 b=HdN9w6I6uywaJXtfQzcslez10dc1K6YlyUiEkNWwKz7L5ujmlJoCXVLVHm8nXnSuJv
 I7jfQW9cEQZzjUsr8bMJr05DO48Os7ixIp3yH1Id4V8zXHTvnoiQNCBXB72b946D6dek
 Q1smmFTYuQa0DWOfypv0kGegKoWV1SHXc9zUDwI/j0XWQrGYNd2Dbl7UlJNSTHxQbYJ8
 Q0So28kzNJCSWT67HhtgBn32I64t9aAvz1KcbFzjpu37QUlfwr0AGBc0FHn8qZyWjPj5
 n3LXwV0vQvD2EM6K5hewirvtFxblOuPLG9jhm3URXkLU93gosShP2FYq5oQC2MQaJ//u
 7qJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqwW6a6DlRVvYpDHvoEgik0Gt/bRsVXGeFQOOhd1orVNOwfmGAUiVoW0R8FA9wtmpDXr9BpodbbJWLOYiA6U2fIbXhSaBXqkL65yhxafT/l51ZwhJ8Sc2F771MtAsF63sF4dnktl7ocqMOidIQUvs=
X-Gm-Message-State: AOJu0Yxj+Jiqy0Sl8xjv8CVyX6RYe6SguQZT+iTBOT8rEuqImNpKj1P7
 v6Ft5SvzwZirXO21kg7BtI90HUWkdZPv+/o1rjEOLXZEL8/Pokr3JbCKWsXIFEI=
X-Google-Smtp-Source: AGHT+IHUgI5Sezk1PhaG2+7dJDk65J7BHCWI8DljUrvxtWv8CMT1sZFoKm99VOV2HOQpk7vxtEBCmg==
X-Received: by 2002:a05:6512:acb:b0:513:13eb:c99b with SMTP id
 n11-20020a0565120acb00b0051313ebc99bmr10151067lfu.62.1710698546509; 
 Sun, 17 Mar 2024 11:02:26 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 t13-20020a056512208d00b0051399d2418bsm1319908lfr.98.2024.03.17.11.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 11:02:26 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rluq1-000000005e0-2PMm; Sun, 17 Mar 2024 19:02:25 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 06/11] drm/i915: Use drm_driver_legacy_fb_format() for fbdev
Date: Sun, 17 Mar 2024 19:01:31 +0100
Message-ID: <32ba43a10c7e4abc1151bba59ddcb2ca0100153f.1710698387.git.frej.drejhammar@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710698386.git.frej.drejhammar@gmail.com>
References: <cover.1710698386.git.frej.drejhammar@gmail.com>
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

Switch to using drm_driver_legacy_fb_format() instead of
drm_mode_legacy_fb_format() to use the same logic as for the
DRM_IOCTL_MODE_ADDFB ioctl when selecting a framebuffer format.

Signed-off-by: Frej Drejhammar <frej.drejhammar@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org

---

This is an evolved version of the changes proposed in "drm: Don't
return unsupported formats in drm_mode_legacy_fb_format" [1] following
the suggestions of Thomas Zimmermann.

[1] https://lore.kernel.org/all/20240310152803.3315-1-frej.drejhammar@gmail.com/
---
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
index 0665f943f65f..1579c433c2c6 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
@@ -30,8 +30,10 @@ struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
 
 	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
 				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-							  sizes->surface_depth);
+	mode_cmd.pixel_format =
+		drm_driver_legacy_fb_format(dev,
+					    sizes->surface_bpp,
+					    sizes->surface_depth);
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 	size = PAGE_ALIGN(size);
-- 
2.44.0

