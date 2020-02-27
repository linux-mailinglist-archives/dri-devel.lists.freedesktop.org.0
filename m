Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E8F171809
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09D66ECAB;
	Thu, 27 Feb 2020 12:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF656E875
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:03:11 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r7so717712wro.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBk1mOoIZkyy9kqJiXLBO3UKN8y6Y0f/CztnD4P9tt4=;
 b=hv+UeTqhEqBHGOJ71CcKZK7jNNFHkqb8OREk/ICLS/IBO0ochCWX+7fYTynoHXyfrV
 XOkxQ06JhpmEmD4pze6CpmWcSmLyvWkmJvDaOYM0zAz3crWlm0NZvoS3pxLw1ClY8rTy
 Hj7vrv98j/kmDnErCzwPbHSbRMebWWANg5yV/7BHW/Ipc22cU+5pVJid6m9bG8gIRmNj
 A9fmYw1Rqejt/Dus6KooWECm4Re5iNeqJSy2EyI+YkEqemsP8htTpAxXenssNKJiqmD2
 s+TcvN8vNYANeMzyKNvdVpxVw4Rox1bcFNC6Qqq9xqmWnZXGw3+SkJPQnC2Lz7UfMxMV
 ksXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBk1mOoIZkyy9kqJiXLBO3UKN8y6Y0f/CztnD4P9tt4=;
 b=TBOSNskgjo+G8Q75Eqir/z00EXiEOAIcai53t/zSBdH2b/6shk626mnD8EDeWRBDTS
 +MOmC5Rg9+FwEJfCHE983oVRLO+PceHt7yQS5J+Qfe65vtomIn52E13oXaYN1xpnYMjt
 cLQnhO45rm7/hzaJ0zzArpm9MlG+8rkk4Xl45ZQFZxVyZDGzNvZZ3IfE5UTlYiTK+zy2
 NTmbNZKvFmhrgiDqJyL/MQzk7y6vzClbxaa8YHDODgmi1OYwM2i57RC6FFXXlyKUtJgW
 PrEMtqDR1E6LqHqJicqwy5PlIDqSg2ZteXdUyTL8+VP4k5UjRTU95fv0bt4HUyuuwOlA
 Af2Q==
X-Gm-Message-State: APjAAAXnkZPSaKDEyUAw8zjewQ6iVm6m+GMcP6aQgKP6BrE7dF11TFfp
 titzCn0RkjlYVVUc9lrbgW4=
X-Google-Smtp-Source: APXvYqwHljKkgGdkShlOylDLJXesMCIatBDxUYDaXf8JUNo/KPQvR2rE6Fv76uPz2LtaEEmXpQ0exA==
X-Received: by 2002:a5d:4902:: with SMTP id x2mr2687634wrq.301.1582804989529; 
 Thu, 27 Feb 2020 04:03:09 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:09 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>
Subject: [PATCH 07/21] drm/arm: make hdlcd_debugfs_init() return void
Date: Thu, 27 Feb 2020 15:02:18 +0300
Message-Id: <20200227120232.19413-8-wambui.karugax@gmail.com>
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files()
never fails, and should return void. Therefore, remove its use as a
return value in hdlcd_debugfs_init and have the latter function
return void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 2e053815b54a..194419f47c5e 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -224,10 +224,11 @@ static struct drm_info_list hdlcd_debugfs_list[] = {
 	{ "clocks", hdlcd_show_pxlclock, 0 },
 };
 
-static int hdlcd_debugfs_init(struct drm_minor *minor)
+static void hdlcd_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(hdlcd_debugfs_list,
-		ARRAY_SIZE(hdlcd_debugfs_list),	minor->debugfs_root, minor);
+	drm_debugfs_create_files(hdlcd_debugfs_list,
+				 ARRAY_SIZE(hdlcd_debugfs_list),
+				 minor->debugfs_root, minor);
 }
 #endif
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
