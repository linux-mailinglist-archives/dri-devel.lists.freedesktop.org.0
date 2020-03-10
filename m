Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C055180C6F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CB86E8EB;
	Tue, 10 Mar 2020 23:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CC66E2DD;
 Tue, 10 Mar 2020 13:31:46 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s14so2231329wrt.8;
 Tue, 10 Mar 2020 06:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGZgsH+padUygQ4Cia7cE9IFr+EvRgTaa32npdrtzWc=;
 b=dg7L82DWEiw0rdSwNr2DyRTaCTid+TPApdVxlafYq4AipWASzO9UjWBGoMzbQJU6Zn
 FcVLsljOgCFtV5tGCTDxvDcuENshSrjaqclQu4DLXYnyd8VwAbcmXaWptQDIIYRw0Mvk
 GfnIfAsgFE5LdRwk/p4NdBb6D+Uq0KG6pshRkMgRIvf6pPtcA8H2C1Ld55MdENrIXKZu
 mkPa1OnuzhVbyD5tQK6tLNKfwzIiV3aSe9+2HBqE759pdILSJw5zeVMxsZck4Utc0qZ+
 C6UhWibz+kjEltkkuyRd9QtNDvhPDu8h1CTszvI2gctrxNmY3IxCfDWcM8Y3KUJM5hWP
 6ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGZgsH+padUygQ4Cia7cE9IFr+EvRgTaa32npdrtzWc=;
 b=VWY2grKFAV07r3nLBG5mUF+FnuNbbIIbbgKPu5J6A/avzwYSshGlf15dRvmrIo31ob
 4+Xah1r1Xwf3tOPoINNakLrdUe2jNDuRd4ZcSDc+Z6yajIWiP1kC+g/gzMqev+TCV6SX
 TCxOooz2fQMf5CVcqeFOU3Z5iNiqXOi+AAhzCC3vDFEVsPN5MqGE+/BsJGAOBCQ1g/De
 t2KUs9/gXr6+Uku28S+cstDnJ9u6hz5f8qtlOou0m2O96HDL4Rd1yzlWkaI+2dUC73gM
 1LHAd0mmID3+kki1mPQYNzuNbhi0cf0x8+pa6f2Uaa2GknOui66lfT/ncDmALm39+yID
 uWvg==
X-Gm-Message-State: ANhLgQ2aDK7DNit0iQoNnuaT0CYYsKyJCU9Ms/Pq8A9gquAiMxzTYKG7
 oPeJh85+foJDHCa52qxLL90=
X-Google-Smtp-Source: ADFU+vuTm8NKlxrWVPle4ZIU7qSC/syjzXhDqkYplHXSPQAFccyI2BA7t9nw37f8vOWSAuPKPa5K7Q==
X-Received: by 2002:adf:e74e:: with SMTP id c14mr28701764wrn.128.1583847105552; 
 Tue, 10 Mar 2020 06:31:45 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:44 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: [PATCH v2 07/17] drm/etnaviv: remove check for return value of
 drm_debugfs_create_files()
Date: Tue, 10 Mar 2020 16:31:11 +0300
Message-Id: <20200310133121.27913-8-wambui.karugax@gmail.com>
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
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
fails and only returns 0. Therefore, remove the unnecessary check of its
return value and error handling in etnaviv_debugfs_init() and have the
function return 0 directly.

v2: have etnaviv_debugfs_init() return 0 instead of void to ensure
individual compilation and avoid build breakage.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6b43c1c94e8f..a65d30a48a9d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -233,19 +233,11 @@ static struct drm_info_list etnaviv_debugfs_list[] = {
 
 static int etnaviv_debugfs_init(struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
-	int ret;
-
-	ret = drm_debugfs_create_files(etnaviv_debugfs_list,
-			ARRAY_SIZE(etnaviv_debugfs_list),
-			minor->debugfs_root, minor);
+	drm_debugfs_create_files(etnaviv_debugfs_list,
+				 ARRAY_SIZE(etnaviv_debugfs_list),
+				 minor->debugfs_root, minor);
 
-	if (ret) {
-		dev_err(dev->dev, "could not install etnaviv_debugfs_list\n");
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
