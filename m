Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8141180C74
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1138C6E8F5;
	Tue, 10 Mar 2020 23:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDC86E2DD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:31:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v9so15863481wrf.10
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8OGniJ9ezEM9gt13c3po2v7CvB5QI80dkjRxl/nZ7iA=;
 b=jS5iW+1Jof6k6J0551eCvEtxb5WxKQelGzXk2ev4iY+BuOC4Dw2up4/qy07IXyW8/i
 CdB9TlYia0CSKrj2j3Mg+IrkZS7fP6Jaly4fjJJJH9zNni9EIDYZDmO1pq+R1zkFuMQT
 2uw4deG9mOFaXb6reHgBkjA+IV6NN5lasmPYQXpZ/dTK+Ayn8tv6XtRWM4Yrj4ooZ9Ek
 qd8PTW1VVJcl4YHsNiYvD2A5zpplma/yH/Jzar4nywwLnVMwoi0153p1qWdjsYfLOEex
 xDcBhACS0V1cgnmYrO5vJ3QVnZ0jHprKwH/CKvLU258gbgFyTvqVBRh60uC0/s8wa71X
 +3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8OGniJ9ezEM9gt13c3po2v7CvB5QI80dkjRxl/nZ7iA=;
 b=NO+44XIpK+WMlImRWeGa9uknvv0HDtmhQHfQdvrNNWWfGcuAn01fsEqW0Bhax79/pw
 KOSU8JFt9DLHCIhrY2hRJwnWcQf7ZUzAqj9o2P2AsSMabU+pLBfWuIZ5Z+k2+J1+VNFj
 il8OQpbKO9VbdZeDDp8WbrKgYz6yNT35byk+4E9vErhs1tavgl2Njlyu007Qi4EIWKTz
 84tx4nQgm6gww6ykZxSK5ADB+0NIOTTY1i10NjgaxOI5JgT4eZRg4jxYWp1DcSY4YD7M
 TsghmGLHgLY8twWxZnDzbQPKCON6bCc2IbbJNUGl5t9dNhrZWZIkruyjut1nbkrVG4MF
 VuTQ==
X-Gm-Message-State: ANhLgQ3LqyPbzuDOs0lVYPfC+9wCs+3nwO4MwfIT/LsbKwGnIn989Dfu
 SonBEx/ukIYnqYXxm2xuSJE=
X-Google-Smtp-Source: ADFU+vspL/LCXzLaAIfKTgG0AZR6jwCAVdsIr799rs+CFgH0CQns365BUM6DqkgKpyIMWOMCb3N53A==
X-Received: by 2002:adf:e487:: with SMTP id i7mr9937328wrm.151.1583847118180; 
 Tue, 10 Mar 2020 06:31:58 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:57 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 12/17] drm/pl111: make pl111_debugfs_init return 0
Date: Tue, 10 Mar 2020 16:31:16 +0300
Message-Id: <20200310133121.27913-13-wambui.karugax@gmail.com>
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
drm_debugfs_create_files() never fail) drm_debugfs_create_files()
should return void. Therefore, remove its use as the return value in
pl111_debugfs_init(), and have the function return 0 directly.

v2: have pl111_debugfs_init() return 0 instead of void to avoid build
breakage for individual compilation.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/pl111/pl111_debugfs.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_debugfs.c b/drivers/gpu/drm/pl111/pl111_debugfs.c
index 3c8e82016854..5595b19c91ce 100644
--- a/drivers/gpu/drm/pl111/pl111_debugfs.c
+++ b/drivers/gpu/drm/pl111/pl111_debugfs.c
@@ -54,7 +54,9 @@ static const struct drm_info_list pl111_debugfs_list[] = {
 int
 pl111_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(pl111_debugfs_list,
-					ARRAY_SIZE(pl111_debugfs_list),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(pl111_debugfs_list,
+				 ARRAY_SIZE(pl111_debugfs_list),
+				 minor->debugfs_root, minor);
+
+	return 0;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
