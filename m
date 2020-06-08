Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4928A1F1386
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 09:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1226E49C;
	Mon,  8 Jun 2020 07:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818EF6E237
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 02:54:10 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 205so15943650qkg.3
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 19:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yWLNoW8KwtbFLEoTy9JRXC4yS5h7+K+nZ8ogvjRFT10=;
 b=lUwQr79nu0C3CUTx5rkUX1JM2BAtkwxCfNCE3s1x0fNiY1Ai8Oup/EwKIwZl7tFBk8
 imyo6wV2crCPek4sz6POKBBuGTzfNEAnIioM82j5x4sKLb3jTEzrt8WisrFNH9ljoReg
 sntjJM3Xr0qK2z6azZds/Oyt6hOeL0uCARX6/gmI+KgCo7d/BMeJYZjJj8JyyDWuQbw8
 VPuDpLRZpKoNqW3h+sWnPEWNx0xnRrQ/2bkq6QHe+Y8d820PmLmcGuxc0/+H2JE3LkG5
 zUYikng65h8Uj7adKCb3tyN4hs4V7MlP6HyJT9go5Tnx4My3H24EVbJIUHBq4oZlwfaP
 byPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yWLNoW8KwtbFLEoTy9JRXC4yS5h7+K+nZ8ogvjRFT10=;
 b=sbgB6t58Cuvt1pJh73ZIGRndi0SCbLhB4timgdlQCEI4/Sa9xGczGMtM0PlDYYfeMc
 WHIHlVxJ3P0rbFNlUx5z2Vuwe3LD27SMfyMSp6MlGUXCynYSic97LNU28t/ED9qKCOBD
 x7WMFrFHm2y2UhZlzX4WCc4whtHzb+mGvzk3OyUbB2VkFfLUQx7ZFGJrXLcS1yFW/ZXS
 qFfeFCrCJeEOV0+pMtmT6bWXqz84ABYqcIOargKhjYjhA7yC/IU9Io9bZsE0EtUUJjaX
 mxbUPBERIuXTmVY1ZzSk26P95NyYHLa0X69m2/usoMNu6NO5jr+NdJnQa+wwDK7tMNEu
 45uw==
X-Gm-Message-State: AOAM530uxEaTOfytjE40ySHEiw4d/bsQEeVPCWEfZlZGkSrAh3T9HAKg
 7Ms4kimsaVymvzIz0E4+YlJPpA==
X-Google-Smtp-Source: ABdhPJyGzJC7FOghKl0SH2kp3RlUIH1JilMo/46+zxMu50q5mqLmutt+XqNuAc3oTVPvFZkULek9Ag==
X-Received: by 2002:a05:620a:1407:: with SMTP id
 d7mr19353966qkj.89.1591584849407; 
 Sun, 07 Jun 2020 19:54:09 -0700 (PDT)
Received: from ovpn-112-81.phx2.redhat.com
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id x13sm6095629qkj.36.2020.06.07.19.54.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Jun 2020 19:54:08 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH v2] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Date: Sun,  7 Jun 2020 22:53:40 -0400
Message-Id: <20200608025340.3050-1-cai@lca.pw>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jun 2020 07:21:26 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Qian Cai <cai@lca.pw>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to select DRM_RCAR_WRITEBACK if DRM=n which just make
the generated .config a bit ugly.

 # ARM devices
 #
 # end of ARM devices

 CONFIG_DRM_RCAR_WRITEBACK=y

 #
 # Frame buffer Devices

Let DRM_RCAR_WRITEBACK depend on DRM_RCAR_DU instead.

Signed-off-by: Qian Cai <cai@lca.pw>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 0919f1f159a4..3304b41f5611 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -48,3 +48,4 @@ config DRM_RCAR_VSP
 config DRM_RCAR_WRITEBACK
 	bool
 	default y if ARM64
+	depends on DRM_RCAR_DU
-- 
2.21.0 (Apple Git-122.2)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
