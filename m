Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA72180C80
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD1D6E918;
	Tue, 10 Mar 2020 23:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC146E2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:32:01 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g62so1364368wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0PDXUNP0CNWIcOfZIatzfIp7MveLX2/j+5KT4VopvNc=;
 b=mqSjKHGj010PNQfFZwfvEAmV8ADnB1wWjI4PptouwtPF1tHRYa+/DX4AQxW14hNUIy
 yws6pL6lXIbp/OY5sKPGIpD+hiliV3ZIpgEaM2hRRoksOdzVTJhmUpUTPMkcXPQE70AM
 oaluGsvPDi9Ae258jTLONdHvwLzIaaLTz4ASzlhD0zMfanLXbc0aJktA/Z97UdNtnoTv
 BlxmaVfkLnP1Lg5RkSevCvFVdlINZNRcroScsQuOjIUz7eD8Q6v/e5jagkdBjmUsHTvL
 qP6T0H63x/A0Fxb38hSCohESNWEF3RklHtLnBF4BGVDPkpgdNNVBdGrnoVGoBT+JURVA
 KJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0PDXUNP0CNWIcOfZIatzfIp7MveLX2/j+5KT4VopvNc=;
 b=oT3iQyBppcNyAV+wD26tfLpKF7oRILVcBmGOME/uTH2M3R2nMY5gX9AMbt/tH9YnKi
 L371WBcDu0PieXDth1eNo4cl1LFBZiKfqJW7qZt2Q/fVa8UhxumBqAJPkL0dIMrglqJx
 TEt4hg1jgjQ/qRmqs0E/R3H3HMTJ7s+gY4GUAsJvh7dR1KmnpPof7NM6fUmlH09vADnQ
 dVz8r8QTXwW1iKAx/159Lk7Mo0qF2BgeyT9v0Z5+ksEXPZukyj8oc0It4MUWEENVXOzY
 99XGhFyg0bchKiqDCKXf8u3j9dSPj7ko4rHFsfO/HQCCE1FrzkfqXlRi8fLqAInQIagp
 yjeg==
X-Gm-Message-State: ANhLgQ2nET6qfTdvcn86cTuWthZVmblpchC2/Qci+R0vdjqW9g64iQqO
 OMSNE6n4SeFNN009px6n8kM=
X-Google-Smtp-Source: ADFU+vv+T6EX42I7QsCPKFPJNMq6GUXg9pANHhKWydd9YqyV4Y93WsRrc5JL+R7T0hRAGNFYQNCtDA==
X-Received: by 2002:a05:600c:c8:: with SMTP id
 u8mr2236586wmm.178.1583847120433; 
 Tue, 10 Mar 2020 06:32:00 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:59 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 13/17] drm/omap: remove checks for return value of
 drm_debugfs functions
Date: Tue, 10 Mar 2020 16:31:17 +0300
Message-Id: <20200310133121.27913-14-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), there is no need to ever check
the return value for drm_debugfs_create_files(). Therefore remove the
checks for the return value and subsequent error handling in
omap_debugfs_init().

These changes also enables the changing of omap_debugfs_init() to return
0 directly.

v2: convert omap_debugfs_init() to return 0 instead of void to avoid
introduction of build issues and enable individual driver compilation.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/omapdrm/omap_debugfs.c | 27 +++++++-------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
index 34dfb33145b4..ed63dcced79a 100644
--- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
+++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
@@ -82,29 +82,16 @@ static struct drm_info_list omap_dmm_debugfs_list[] = {
 
 int omap_debugfs_init(struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
-	int ret;
-
-	ret = drm_debugfs_create_files(omap_debugfs_list,
-			ARRAY_SIZE(omap_debugfs_list),
-			minor->debugfs_root, minor);
-
-	if (ret) {
-		dev_err(dev->dev, "could not install omap_debugfs_list\n");
-		return ret;
-	}
+	drm_debugfs_create_files(omap_debugfs_list,
+				 ARRAY_SIZE(omap_debugfs_list),
+				 minor->debugfs_root, minor);
 
 	if (dmm_is_available())
-		ret = drm_debugfs_create_files(omap_dmm_debugfs_list,
-				ARRAY_SIZE(omap_dmm_debugfs_list),
-				minor->debugfs_root, minor);
+		drm_debugfs_create_files(omap_dmm_debugfs_list,
+					 ARRAY_SIZE(omap_dmm_debugfs_list),
+					 minor->debugfs_root, minor);
 
-	if (ret) {
-		dev_err(dev->dev, "could not install omap_dmm_debugfs_list\n");
-		return ret;
-	}
-
-	return ret;
+	return 0;
 }
 
 #endif
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
