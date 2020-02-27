Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9487171800
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1250B6ECA6;
	Thu, 27 Feb 2020 12:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729CF6E885;
 Thu, 27 Feb 2020 12:03:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a5so3257897wmb.0;
 Thu, 27 Feb 2020 04:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mlvu3hS2FOo3jvYAFvg3HmupOT4tMbHUqUGMTdB0I0E=;
 b=BZv8TNIDUFwIG3XR5jTpC43/0HS4ISDRzsQP4QhE3dlcUIz/WeFLHmAXHaeIvwSsUq
 R7SxGRHjkL0zokvs3HwE2JaguZE7dCCSigW1UQSHM9lYsy4YaVzC7uJWR9YoDmutR03x
 rDkXLppqNkYUyr6cMX8MVshvl31rWo7RVgktxVt6SbKEj01xt2iQSuf6cY4rxAzdaSa+
 yyIxaYMV17Z8s68a5LXeKaKJpYZ3EitjrqNn85Vsp2s4h3NmP3WfGn0efg86p0CBe3s3
 P4zTMd9ufsIk4i2z03Exow5d+8y8vG29XoBfOoDj6fqkgMckKEEdc1+jeVPdvSyFCvak
 vHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mlvu3hS2FOo3jvYAFvg3HmupOT4tMbHUqUGMTdB0I0E=;
 b=HXSVLqq/b/+Fc38AqkpPPnG7+TSoQN7dgRUuC4mJER57/HfWcMtlShWLUwWBGXI+M2
 HR8KiTLGp/zqCtYmg9YdQ+TXBXnZxz+49In44WfKt7ziZKj55d2B8YVDeSwq+UakfkiJ
 DxwXU7jyS2Vit4nH4FmczDXpioGHJA7eQHPt0fX6PXE0qiRX084Gl7OmRDry/TTiSYfy
 NhxagjJrVvFy466uzAME2RnLN9BrapKbKR1FWAncBAALbzQCM0hqdLcbJljUXKEqVbcZ
 9ZGZk8om5AxHurfIobq8TFHcOvLYpGq5gY9Ncgmjb26QqIBXHa5pHANOBLlRcLtq0Fmb
 /qNg==
X-Gm-Message-State: APjAAAVu5wqKyJldChIKgR9eH8htPniM/JLKRKx3tduaGHnqp/he7fwK
 Dlu9SWXLK6TqvMrEVr+KL0g=
X-Google-Smtp-Source: APXvYqwLTKlxTSe9jq6sfhmtWPDKx6ENvxFA/rCWw8/Sac/kMbjC4rIqOFLUs/Tb4QLjqA2V3FeKrw==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr5079981wmi.116.1582804994162; 
 Thu, 27 Feb 2020 04:03:14 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:13 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: [PATCH 08/21] drm/etnaviv: remove check for return value of
 drm_debugfs function
Date: Thu, 27 Feb 2020 15:02:19 +0300
Message-Id: <20200227120232.19413-9-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227120232.19413-1-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
drm_debugfs_create_files() never fail), drm_debugfs_create_file only
returns 0, and there is no need to check the return value.
This change therefore removes the check and error handling in
etnaviv_debugfs_init() and also makes the function return void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6b43c1c94e8f..a39735316ca5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -231,21 +231,11 @@ static struct drm_info_list etnaviv_debugfs_list[] = {
 		{"ring", show_each_gpu, 0, etnaviv_ring_show},
 };
 
-static int etnaviv_debugfs_init(struct drm_minor *minor)
+static void etnaviv_debugfs_init(struct drm_minor *minor)
 {
-	struct drm_device *dev = minor->dev;
-	int ret;
-
-	ret = drm_debugfs_create_files(etnaviv_debugfs_list,
-			ARRAY_SIZE(etnaviv_debugfs_list),
-			minor->debugfs_root, minor);
-
-	if (ret) {
-		dev_err(dev->dev, "could not install etnaviv_debugfs_list\n");
-		return ret;
-	}
-
-	return ret;
+	drm_debugfs_create_files(etnaviv_debugfs_list,
+				 ARRAY_SIZE(etnaviv_debugfs_list),
+				 minor->debugfs_root, minor);
 }
 #endif
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
