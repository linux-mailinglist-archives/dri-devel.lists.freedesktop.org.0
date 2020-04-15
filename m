Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D3B1A94DC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BB06E8C8;
	Wed, 15 Apr 2020 07:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3ECC6E8A6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:36 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t14so4649889wrw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m8LdowvRj6y5F/lzc0z+wTLajfnWKM9lBo0QaQxdrxw=;
 b=dDWOltVkXSOBk1IiL8MGDd4W/Djoa1TmmKBWN/ACzBJhTGB6DVnNb+bdfp7yXv+ILx
 bPVlegHUcpx/jn37fxJlmy6MggQXsKXqt1jbmKh2owgqv35hUekH2fvR07MARNAxxDcZ
 sKHEmL/k4jUdpxWPK3HUwx3VS8Y1uye7JNtWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m8LdowvRj6y5F/lzc0z+wTLajfnWKM9lBo0QaQxdrxw=;
 b=M3jiLTrBrqd46RHFyS3t80e1aV5vfKVAWIruLQgjRZsWx3IqLSLohYG9XXpbOJtc75
 iYW6qtm8bALPNoVyHVF1wB7Jx9uTO3LpEJmS/BBlJRWxuWNojQX06d056+oPw7HEen4R
 46UaVoQKDKoYWvHfjMcXP3PTNEt+WeS4H8qa6Ni53aaFqV597XQKjZc9HawivmYlkZEg
 go5Qx6PXoABhNEtVI+Z8W6t0cNqvzjgG53IFG7eyLuxxrS6gvYDx08QMWxINyuq+G7eo
 1H9pDXg/y02jeYljhn3bSkS7cgt44fgLeL1Kfns29dxW1uNLEU8M9ornAUzriZge/csv
 Xi+w==
X-Gm-Message-State: AGi0PuYTiWYjDRSq/q6h92S54Lgw3wb6Mo2VDc7LPOdJs/uLcKc8674M
 R+cTtHRzP+OyCZdPRBgAxjodSWO1KRo=
X-Google-Smtp-Source: APiQypIr7FTFgGbKeiSR3G8G8hKb8rSC1ydf5oz/DSRkwR5KNFKQJDnHsecYRWgMt0sIJI+cp5eSjA==
X-Received: by 2002:adf:fa41:: with SMTP id y1mr26643336wrr.131.1586936495555; 
 Wed, 15 Apr 2020 00:41:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 54/59] drm/aspeed: Drop aspeed_gfx->fbdev
Date: Wed, 15 Apr 2020 09:40:29 +0200
Message-Id: <20200415074034.175360-55-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Joel Stanley <joel@jms.id.au>, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No longer used since the conversion to generic fbdev.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index a10358bb61ec..adc02940de6f 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -12,7 +12,6 @@ struct aspeed_gfx {
 
 	struct drm_simple_display_pipe	pipe;
 	struct drm_connector		connector;
-	struct drm_fbdev_cma		*fbdev;
 };
 
 int aspeed_gfx_create_pipe(struct drm_device *drm);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
