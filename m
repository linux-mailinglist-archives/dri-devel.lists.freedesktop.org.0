Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217623912EF
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCE76EC6B;
	Wed, 26 May 2021 08:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFE16EC3C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:48:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so55519wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kVk/K6SiOopKBeZrOFr3ETwL2h0sUuVeJjHQIvLbemo=;
 b=nP2v/yOq7y++OdxD8esKUXZCbD7knxLYxvNUMGe8eczAbKtAZB0Noi4WYds+F5h4nF
 aHEDPl4vj4f/qqvIdFUNo83sIAVBvdjTgk6IAVHC4XA9RTrRO7lUGH72cSg7RAQ/IbuZ
 ozf7cJcgZzhq6Oo6M9Xmg1dWZV054Ha+tCTpbtll+jmQpmcuWwUxfL1eRhlaRGIVhRen
 04os9v7VPlmlAlSZdYJO9oNMQ32kKvCo5X/PcNFikiqHPyBk6x1B5XJdzCz3Fy8zVAIU
 /mr1dy1c4bpQ6K7zWoMUQjifoDJkObY6Xqe0TS7+2tr2IbmPkzsvr01ABIRkB1uRroVF
 aSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kVk/K6SiOopKBeZrOFr3ETwL2h0sUuVeJjHQIvLbemo=;
 b=dfA4i/166u/vkj9cCyT/PlAm3Gq/AHjMzijFtz54aK1D7O/FvB8U5YZhEr46T64uUH
 4m6JwLt80L+MSm7Pvy5OJQxP13mQ6RMaWn/9GC0nqtQXNETVJt0DEVjTwS6jit2CdiIO
 iEu/1fGyluHv7vM+JvQGVeeopC1ekDnNDNaIhYqipdSkCsDVnsGKyMd2ESzT6BnbkDo/
 6Av5ffjtFlVIhsnC4aqVtfn7WvpAtvMU4PfrWentdUac4IIsX0lzRbuAIdrpV5B+BehP
 jfEeCOggCQVvXhnjOds7WxCxmCV21ZD4JlrXAFqe5+kQXCsOi/BewToo2J07usf/iJHk
 RIaQ==
X-Gm-Message-State: AOAM530nvrtyb9vWu04Tc9V0NvHobJp9glSG1g9atvk0FV5oVa+A1XqL
 xL+Y/pKp0kZ/pkerEiGSADHaZg==
X-Google-Smtp-Source: ABdhPJwPUsJd89Hlud9WCfrbJsuLZuyhv1Vh6sXdRQBlQX/zH3fwxRZXrKlzShfCGJ2d+PE2esLA1w==
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr28151212wmp.164.1622018889518; 
 Wed, 26 May 2021 01:48:09 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:48:09 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 34/34] drm/vboxvideo/modesetting: Provide function names for
 prototype headers
Date: Wed, 26 May 2021 09:47:26 +0100
Message-Id: <20210526084726.552052-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vboxvideo/modesetting.c:11: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/vboxvideo/modesetting.c:54: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/vboxvideo/modesetting.c:87: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vboxvideo/modesetting.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/modesetting.c b/drivers/gpu/drm/vboxvideo/modesetting.c
index 7580b90023792..10b32d986b956 100644
--- a/drivers/gpu/drm/vboxvideo/modesetting.c
+++ b/drivers/gpu/drm/vboxvideo/modesetting.c
@@ -8,9 +8,11 @@
 #include "hgsmi_channels.h"
 
 /**
- * Set a video mode via an HGSMI request.  The views must have been
- * initialised first using @a VBoxHGSMISendViewInfo and if the mode is being
- * set on the first display then it must be set first using registers.
+ * hgsmi_process_display_info - Set a video mode via an HGSMI request.
+ *                              The views must have been initialised first
+ *                              using @a VBoxHGSMISendViewInfo and if the mode
+ *                              is being set on the first display then it must
+ *                              be set first using registers.
  * @ctx:           The context containing the heap to use.
  * @display:       The screen number.
  * @origin_x:      The horizontal displacement relative to the first scrn.
@@ -51,10 +53,12 @@ void hgsmi_process_display_info(struct gen_pool *ctx, u32 display,
 }
 
 /**
- * Report the rectangle relative to which absolute pointer events should be
- * expressed.  This information remains valid until the next VBVA resize event
- * for any screen, at which time it is reset to the bounding rectangle of all
- * virtual screens.
+ * hgsmi_update_input_mapping - Report the rectangle relative to which absolute
+ *                              pointer events should be expressed.  This
+ *                              information remains valid until the next VBVA
+ *                              resize event for any screen, at which time it is
+ *                              reset to the bounding rectangle of all virtual
+ *                              screens.
  * Return: 0 or negative errno value.
  * @ctx:       The context containing the heap to use.
  * @origin_x:  Upper left X co-ordinate relative to the first screen.
@@ -84,7 +88,7 @@ int hgsmi_update_input_mapping(struct gen_pool *ctx, s32 origin_x, s32 origin_y,
 }
 
 /**
- * Get most recent video mode hints.
+ * hgsmi_get_mode_hints - Get most recent video mode hints.
  * Return: 0 or negative errno value.
  * @ctx:      The context containing the heap to use.
  * @screens:  The number of screens to query hints for, starting at 0.
-- 
2.31.1

