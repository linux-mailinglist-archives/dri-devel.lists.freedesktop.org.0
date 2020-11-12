Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA9A2B0D22
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C986E3A0;
	Thu, 12 Nov 2020 19:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8652E6E372
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:16 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a3so6420009wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3tJhB0Hg6HAWYXnosRdlVU8vKZOSyhLIYiRgTEXQL+8=;
 b=eFZ0nyMEgcF3m/AhK2jWUr98teTvtyaCoUBu+csBEw/gH1A2K8TWUlHFEXj1H91Dhn
 zPTWKrK/hpTxawzZz18YGICA+DOS7OBbLkgfxRLIi164sk5OCFhSHC0gKW8nKeJ2yYFX
 zxcyMqavnIwUKukY51JfOoe/m9NGE8DjSAutaGM3HWFbEshT2qAqyB6d/qAcohmVZAZ+
 Q98TrI7uBD23HyyG5tmr481OLoDvvqDo/wIhi5G0bR+C9ChfGJ4LThfR/tcrBrtHKsGz
 ptHhlRvurdkrblutEcv7VJ6CIt7MB2tocfQ+Ofw7vPVJiEKl4z/5fGc0Yo7i1ICnKLuW
 /CNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3tJhB0Hg6HAWYXnosRdlVU8vKZOSyhLIYiRgTEXQL+8=;
 b=NfpViVBn42UoHOuEmhndDrpyyBpmkYrfodPv/doypQ9YFqP4EWfZsvclWzWFWPPi4K
 YJ2DUlJOwiFS+c1rLHNagPcJp9DirWi/e2cBSkp3OxJxnLBgTjoVtVPOsz1sk6B0yo5I
 BW6bigza++SwT8Ee2KkZAHtmfciYLxNhjfJRgm9/qUMIQdOiDf919fn8kl/mE5lr2/kx
 XVZJStJJp0RZqVDtnES39Quo3nPZ1AL6lt7aIubSfDlT7ilXN9vo9B+LNHamiiYoz8M2
 H9On3zf9P8aoD4nYHt2zdxoI+qMYrMIfWNLmRXFJs8adHtfIhh/YwEYyTFKIeMwkqYcc
 Qbpw==
X-Gm-Message-State: AOAM531Sm3YVnUnehvEpnlHMI6ngXHoagMV6fHwRo+3TVFsip5hTy+eN
 IZqEK/bJfBniA4bMRu3wfW4l+A==
X-Google-Smtp-Source: ABdhPJyYloRTMiYF0nhZqEBftHyP2DamMNba6JvD6twKnF8vw60286TxWnCuWt58PP87X7470thDow==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr1088162wmc.36.1605207673415; 
 Thu, 12 Nov 2020 11:01:13 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:12 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/30] drm/atmel-hlcdc/atmel_hlcdc_crtc: Apply correct
 formatting to struct docs
Date: Thu, 12 Nov 2020 19:00:22 +0000
Message-Id: <20201112190039.2785914-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

And fix-up a misnamed member description.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:33: warning: cannot understand function prototype: 'struct atmel_hlcdc_crtc_state '
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:52: warning: cannot understand function prototype: 'struct atmel_hlcdc_crtc '

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index c17571a3cc2bf..c58fa00b4848c 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -25,7 +25,7 @@
 #include "atmel_hlcdc_dc.h"
 
 /**
- * Atmel HLCDC CRTC state structure
+ * struct atmel_hlcdc_crtc_state - Atmel HLCDC CRTC state structure
  *
  * @base: base CRTC state
  * @output_mode: RGBXXX output mode
@@ -42,10 +42,10 @@ drm_crtc_state_to_atmel_hlcdc_crtc_state(struct drm_crtc_state *state)
 }
 
 /**
- * Atmel HLCDC CRTC structure
+ * struct atmel_hlcdc_crtc - Atmel HLCDC CRTC structure
  *
  * @base: base DRM CRTC structure
- * @hlcdc: pointer to the atmel_hlcdc structure provided by the MFD device
+ * @dc: pointer to the atmel_hlcdc structure provided by the MFD device
  * @event: pointer to the current page flip event
  * @id: CRTC id (returned by drm_crtc_index)
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
