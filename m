Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319917180F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250F06ECB2;
	Thu, 27 Feb 2020 12:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0E86E86D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:03:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j16so1455390wrt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5/va7+F8irn0jXAyeut2JlQRX+et9as0O+Q8UR0d9EU=;
 b=Wx2LFnuM84ELcCVBI+fQsZSjh7OAQ2zWLmhPsZmeMoEGTYqS/ZVOQAMceU7fMMuifW
 iRWw/x5KEMneXJz2CVvUOE8YuMRwsO6hV4vXH/2e929QQ51klNhimRlF7j4QeFsLKYBS
 aCkov2QzKZm2cbU99uBdgTJDwV94BoKaUJtsEpM6CqDPahTcdZT4E7TLfkg3UWCTOYkG
 ZUBaJhPHvG9AldY6Z0PowTmpaAW1hwBTBOcbMlZ8Tqw7iM6mc6C97tdZdPsmRAcRZYwe
 Y4vx9zToGdo97CLUm0jJT2BwF0cG99iZTF1Eg9golfhZfi4yMZdYkSjSQc0cJUCSsx68
 JJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5/va7+F8irn0jXAyeut2JlQRX+et9as0O+Q8UR0d9EU=;
 b=JuEDc9wjblBTFXyommJb5Odg4S3/YZcl3JaTJlDELpO2OmWsohgQ9K/2mP+T3NbBum
 4Q4KSDAWw5oCAhscOpDeAhgF7Wkcd+wYYAYFNez5fC7VWcDV8IDwVpjM/J2aptndAw/Z
 947mVdB1lNBi/xjjftM9Pg48nWReH/mpk1OjyPTIhWbPKXpoXPZbInA7fUkiKbEwGf/9
 pMBqhWPIzksFulMbm5LzvE8c2fY9zx7vpTp8y0AOledEVJOW89RB2pmFT6Pg8LBelxpp
 jxZcCEReExVfxvYU/F+C53vGW3dY7U0v+abNLKTp66yO5MmwqgSQ2+j3fbGkaCK24W+3
 lQFQ==
X-Gm-Message-State: APjAAAUF1sqv9bAlpb77LxUsF/j6/CGlzp+S1GJwRp+c0fNJJMCpZNC5
 uUXgq84Pwd0tzU41BCH/XAc=
X-Google-Smtp-Source: APXvYqz7QyLiZZ3viPcMv1W4f/pZTLGJ3nj6EoflfhAnaBTBu+uKHbrIVlh2oDh/yh4cCsiZZk0pdg==
X-Received: by 2002:a05:6000:1147:: with SMTP id
 d7mr4646817wrx.142.1582804985519; 
 Thu, 27 Feb 2020 04:03:05 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:04 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie, Alexey Brodkin <abrodkin@synopsys.com>
Subject: [PATCH 06/21] drm/arc: make arcpgu_debugfs_init return void
Date: Thu, 27 Feb 2020 15:02:17 +0300
Message-Id: <20200227120232.19413-7-wambui.karugax@gmail.com>
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
drm_debugfs_create_files() never fail), drm_debugfs_create_files never
fails and should return void. Therefore, remove its use as the
return value of arcpgu_debugfs_init and have the latter function also
return void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/arc/arcpgu_drv.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index d6a6692db0ac..c05d001163e0 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -137,10 +137,11 @@ static struct drm_info_list arcpgu_debugfs_list[] = {
 	{ "clocks", arcpgu_show_pxlclock, 0 },
 };
 
-static int arcpgu_debugfs_init(struct drm_minor *minor)
+static void arcpgu_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(arcpgu_debugfs_list,
-		ARRAY_SIZE(arcpgu_debugfs_list), minor->debugfs_root, minor);
+	drm_debugfs_create_files(arcpgu_debugfs_list,
+				 ARRAY_SIZE(arcpgu_debugfs_list),
+				 minor->debugfs_root, minor);
 }
 #endif
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
