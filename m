Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B94180C83
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C616F6E8FF;
	Tue, 10 Mar 2020 23:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A426E2DC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:31:36 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z15so15913286wrl.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RoPg/pYX4FGcX/lLbU+K+rHDxbRsiBx9Tndw7mbnSB4=;
 b=V7oz6rft430UpiTzqhHw7x6W4QMiLAcf51mGV0vsYZV9NufJLFcjqLY3cAPBliptgs
 aPcSOukGCB3tFxqqk/MNwSEVWaAJR5mR0DWnxWlqKORPWS167uhJ9tzsIezZTUUm3az1
 Om8dnr4PJBK1UVpCDImGfsMmSG8ii3sfwMLDXwK+M16SgUn30eGpEwztxS+5emgBga9i
 BERy2LdddL6mwJBC18D3Ykc6klY/gGr2vBH+bZtJn1kxqoQZrTRA8A0HGUXilEGw+0Rm
 9OgzMFd24TIw0w4ymDcbv4cv7gpeEujsT8Ul78gsFxlB8i/I3Gw1JNjqKtfNUkvqkd28
 1g8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RoPg/pYX4FGcX/lLbU+K+rHDxbRsiBx9Tndw7mbnSB4=;
 b=jOWBF9OJur8YiZAsdvoud6pqPgzIVd7QI9waJ7qf/fCxni6DwYDgObjr5J0H65YOAx
 rlgtk2zhn/MWimP4V+LnQEqHThcLuYnkkdvMH0psm/KvEHXERUUKSshfy51GO+dc20ZQ
 vwf9y4AnMyc/eXLW7/Dxu6qxcb4UIAbdl6aG2mcIKY8/35dUa+1Qd5GC01cPXgMQ+Ai5
 9Y5JE6alL8j6uyBZ1zUtxy5UC8iCiLeW09KEnXglDQSmvjHlziPpGK5dKiF5YcPiTJvK
 xLBRrgBAVf7HNA6Hmppze02WIvellS6VbOT69q0pTCcJh/WhPaPuPQuRvDkOU06R8zPj
 hAOQ==
X-Gm-Message-State: ANhLgQ07EC/AMWNUTYJmvTSzVbdAJldYfHw4ScImNhrso1ZPUQUkh/Tn
 qu6icQXqzRbCrVKluf8lvvg=
X-Google-Smtp-Source: ADFU+vv6uotQoNEyj1oOp3mfCzDz945g1BQc199VHpzdxA/Ou52xZ4QZVH6ENoJw+Q35b8Djvq5OhQ==
X-Received: by 2002:a05:6000:1186:: with SMTP id
 g6mr27257446wrx.331.1583847095288; 
 Tue, 10 Mar 2020 06:31:35 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:34 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	eric@anholt.net
Subject: [PATCH v2 03/17] drm/v3d: make v3d_debugfs_init() return 0
Date: Tue, 10 Mar 2020 16:31:07 +0300
Message-Id: <20200310133121.27913-4-wambui.karugax@gmail.com>
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

Since commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
fails and should return void. Therefore, remove its use as the
return value of v3d_debugfs_init() and have the function return 0
directly instead.

v2: remove conversion of v3d_debugfs_init() to void to avoid build
breakage and enable individual compilation.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/v3d/v3d_debugfs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 9e953ce64ef7..57dded6a3957 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -261,7 +261,8 @@ static const struct drm_info_list v3d_debugfs_list[] = {
 int
 v3d_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(v3d_debugfs_list,
-					ARRAY_SIZE(v3d_debugfs_list),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(v3d_debugfs_list,
+				 ARRAY_SIZE(v3d_debugfs_list),
+				 minor->debugfs_root, minor);
+	return 0;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
