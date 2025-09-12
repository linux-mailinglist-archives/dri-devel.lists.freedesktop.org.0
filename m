Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D02B5608F
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 13:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898F110E12E;
	Sat, 13 Sep 2025 11:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S6F4x91k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B03510E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 16:42:46 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45dcff2f313so15242815e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 09:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757695364; x=1758300164; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wqiZoJVgMOmFeDlGNdTZ/DvTlXJdgaRd3JdTxV/yzP0=;
 b=S6F4x91kTag+6/cFr6tUK4OvGuYDbWvStwZdaUeEC3TFITzFxNk56O5AAtW4SkBBrQ
 Iq/zfnroo3yLWhGEjPnR+2xKapvlFm6xzXU3r9kODUTh5XQnlgsSpKzc/8saahLcJ3Sc
 5yTpPVabzrvC8qI/ImLXZfgvyIcj83De348QQ1i/nKopoV6It50PKvZW7Fj205rHltwM
 fy35Mm014VBOUv4tjQMiHzyBekxTM3Rg9Qz/TGyV+oR8jPELPpqLpuaP14GFIrN/Wn3j
 Dfac6KM9YQApHD/Tnl4h7aV1cdpCU35wDBGo6axdb6nFCPdgFa7nGphZsvr99YDwozw0
 OEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757695364; x=1758300164;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wqiZoJVgMOmFeDlGNdTZ/DvTlXJdgaRd3JdTxV/yzP0=;
 b=LbDkI7mOU8EZyWW+nSgPU4x/1whsLk+JpH/9e18W8Rkm0pDgvbv/1GQtpEhJYsw9KU
 BN99R3xeZ2fiPN7sNfkxmdfbg5a8+Z4u1qJpGPnTLI0HOl+UK8vvR8I/EDyCU5080DwV
 EAzqKGtrfw8uYipT3/8YMbzofp40AaggYZoFKFITa38y7BJBsbSiHjTOvxN4l0pCHbX2
 iWAITt1TcvCMxgbmqVs2ucmub3RmBrNiXg2hiyWtw03T0XJAxRK7l//gZnvGHdQTxXYP
 YfDD+b+9x74gx3XIlKuS3bLfuDyoaESD+Y9kkc4EB7/modSRK6uWyC9vDsJKJr7EabCL
 xcvA==
X-Gm-Message-State: AOJu0YwP91Om2ACxO8cPcNpF6WXe3WBTtu47bAdgtURIOyC7FAuJGtfy
 xKe4jWXRpZlv3Ye154s3kj+YKdQdHZCkJ3C2snabKdiLydd8Gk6T97+s
X-Gm-Gg: ASbGncu+l83NUkoWUHuCDuvh8C/RfKXdwV4gzwnfAkCnuKlMx9NltnggD37vFjjgYh1
 Wc5rbiWBE0e+1Pw4qPYrkfw+cafYiUT+Wcr0mA5D+y8xUQ71Uit9ByctuSXBiKIYovT7WGwOE3+
 JvoirTjesXaQDyLEvGE+Jjwi1k6uQivvrQQPbCk0bnCAfyD7CyIkkKbwc6xqsrN9YatXO1aDUxw
 2YP7blE8B06SaVVJLIZyxhSRlRtAx0OmNEiqXqeRKb7Oxu2Gkfs56xbVzIbllf2kdBkVRRW9e0e
 Tvtf/2mcp5iSW+zY/wRDmacJtSr9BtLZU4kplvXNbTfLjx8oxCovA8LieOueaMfDb/ZALdCDuBh
 VH6bNyCegmtphDA4Ao2UJE3uksUtpvT2X6FMHQ1qlrgLYlZmXik/VB12uhhz52B9ice8AZL7xAM
 MxBmVvH9XS2w==
X-Google-Smtp-Source: AGHT+IEXS2pOOoqyUGEyr9k2erY2e78Z3kuSD92aGvSLgW0w5dzdl2COsGyUAMxnuPKhgacOKyiX3A==
X-Received: by 2002:a05:600c:19c9:b0:45d:d291:5dc1 with SMTP id
 5b1f17b1804b1-45f211da6aamr36954765e9.15.1757695364107; 
 Fri, 12 Sep 2025 09:42:44 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.138.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd415sm7086696f8f.30.2025.09.12.09.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 09:42:43 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 12 Sep 2025 18:42:11 +0200
Subject: [PATCH 3/5] drm/solomon: Simplify mode_valid() using DRM helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-improve-ssd130x-v1-3-bc9389ed299e@gmail.com>
References: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
In-Reply-To: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Sat, 13 Sep 2025 11:45:22 +0000
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

The ssd130x_crtc_mode_valid() function contains a manual implementation
to validate the display mode against the panel's single fixed resolution.

This pattern is common for simple displays, and the DRM core already
provides the drm_crtc_helper_mode_valid_fixed() helper for this exact
use case.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index c6939377ec4b5a42ce0f40d070ce60d544d8516d..2058d188159c3eae28de1614b9fffb06ac5551be 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1470,15 +1470,7 @@ static enum drm_mode_status ssd130x_crtc_mode_valid(struct drm_crtc *crtc,
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(crtc->dev);
 
-	if (mode->hdisplay != ssd130x->mode.hdisplay &&
-	    mode->vdisplay != ssd130x->mode.vdisplay)
-		return MODE_ONE_SIZE;
-	else if (mode->hdisplay != ssd130x->mode.hdisplay)
-		return MODE_ONE_WIDTH;
-	else if (mode->vdisplay != ssd130x->mode.vdisplay)
-		return MODE_ONE_HEIGHT;
-
-	return MODE_OK;
+	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &ssd130x->mode);
 }
 
 static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,

-- 
2.51.0

