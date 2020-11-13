Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16C22B1C34
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76B46E536;
	Fri, 13 Nov 2020 13:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334FB6E52E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:49:59 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 23so9964940wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p3wgCBGmvivdJ007ItmhaKztBJ2SUW1onp/hFOY65gg=;
 b=DCwq41Tk7ZmgHAC/3+JoPkDNQ/4pMsacxYcZwe0I8Mhp3Y63vdk5PhXtNsTT1DKnj6
 lOrrm/witkSChNyeh3AmdSDIeiuWBN3AD3PZi96ahopOMhgO5n7Rtx1+spZwtSeX42dm
 tK8AYkULQSFwzudv4l1jezyqiksoFHxS4jHCJ+A8xUfjWX4f0NnICZ6LNb5bQYcf5Y6i
 iLadzB26xmshGMu2bAA7lU9Frx5nJeRKiK1bMvyOonMcwlYjhDZajlwgdZIAF+6+8hL3
 pBeEmtSSgi60N2XjVdnuJ0WhiFifGMogsnFtNuB8md5shdnSFpZ7cYIRu5vHxT6NV13s
 c31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p3wgCBGmvivdJ007ItmhaKztBJ2SUW1onp/hFOY65gg=;
 b=rLjHQMhIfbe7oGoFRuyAXYG+JB3KUfMgQSOwyjhCdncsatsM7j+mDlYg6ZszPQ/4k3
 WpHeD1sK7C6QVdUoDXQgsWIp+kJk70AX0oc+czXtqLjZEVyIi0be6a3MCHBLz7dtPJ1d
 BQ/93NHKl9NBCe2So+VJyVlrPIkMnYLf3El1UuuwvVIwYuibcEfGHMz+t0KIzNiR/qep
 1C8kKpNm/r/hotY/rRcna1nW1rLeyEm1xkvP0dXAWkLAZFDSRFWP1tiN722fslqN4m1v
 00kOnqCGBvdmehgsbkCcXDUcTuLtRXfs+ig5tFXT126pGUgHIhwY9gcGIAlZiIAo7pdh
 +YPw==
X-Gm-Message-State: AOAM533ihWN7Y/ONEH6PE4NIwhqP05M2oA3rXSdA8ht/vQr1R7zsCe9i
 U7uKhp4xYr3b1yo4Fcju8CBXXw==
X-Google-Smtp-Source: ABdhPJwoLZn4fi95tBHB/r7/O3Sw4PXT97CSOWLB5WHaG4v8CHxZVWR2ksL5mGMqPIW7yzbKsw7/AA==
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr3583701wrn.165.1605275397854; 
 Fri, 13 Nov 2020 05:49:57 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:57 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/40] drm/panel/panel-tpo-tpg110: Correct misnaming and
 supply missing param description
Date: Fri, 13 Nov 2020 13:49:11 +0000
Message-Id: <20201113134938.4004947-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/panel/panel-tpo-tpg110.c:94: warning: Function parameter or member 'panel_mode' not described in 'tpg110'
 drivers/gpu/drm/panel/panel-tpo-tpg110.c:372: warning: Function parameter or member 'connector' not described in 'tpg110_get_modes'

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/panel/panel-tpo-tpg110.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
index d57ed75a977c3..e3791dad6830c 100644
--- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
+++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
@@ -76,7 +76,7 @@ struct tpg110 {
 	 */
 	struct drm_panel panel;
 	/**
-	 * @panel_type: the panel mode as detected
+	 * @panel_mode: the panel mode as detected
 	 */
 	const struct tpg110_panel_mode *panel_mode;
 	/**
@@ -362,6 +362,7 @@ static int tpg110_enable(struct drm_panel *panel)
 /**
  * tpg110_get_modes() - return the appropriate mode
  * @panel: the panel to get the mode for
+ * @connector: reference to the central DRM connector control structure
  *
  * This currently does not present a forest of modes, instead it
  * presents the mode that is configured for the system under use,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
