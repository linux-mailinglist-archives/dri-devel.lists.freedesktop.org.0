Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B39B5163EC4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81A86E492;
	Wed, 19 Feb 2020 08:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983FF6EA4C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 17:28:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b17so3853533wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 09:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t79WR+N+O/xLx5EnVWrI0Bo3jvdlkHF5FexB0Coc0e4=;
 b=SXCr3MwKdGml/kqRlZx4Xh4HTwEskmbeNPapQbWyh/0AFZLtr7H0LjfEQ/QreiBVFZ
 yYR7oqLZp0tLk5n0qtUrPIY/YsoxjvX9WHdxo39RNOd/9ompVe//5LAONCw+ZvpX3c2e
 CcX1mtyKAL70MMo0vvlzbCRWKDZyjdpNoWFf5O8tPwsunHyazKYcpQX1CMD13poeMMFe
 vXegohfcsya/9OJxOU66FTUnUf8QO56vawRumP2jQgsPuzVnINSXgllL1FF0AUh4k9fm
 +IEw1P/m/TfUYtpaqnVrRyX/txLl4Zvy1bB7BoLUsuN3eyM0GNty0jskgQ9goi/lD/XO
 eAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t79WR+N+O/xLx5EnVWrI0Bo3jvdlkHF5FexB0Coc0e4=;
 b=UzIzoT5YPDVXWSH0GkS2vxo4Wb9NuJdyxOixGC11bqeMfqMWhaRTpLd+uaI+fQbElz
 bkZ0B7sriwpXQHTF58e1tBr1ty0ReLVRxRXyBAxY+s3HUeQGZuxLazrHoxGWuckZRsiR
 BXXjkdCBQ4Qa+waHQszf6UattM/D29rmZrwWcr/Z5QsEZ45HBYTXxWpgB2nTFFadjkbH
 FYUvvhKwvR0qwtkiw3o5Mxo19s2P2297+YGFCqmW3Lqz3T68OrQlD75FfX9RdMYgVvBf
 30pSeo9fwug+nNYJULi8xyUWZIxjX470onmRuyktFc0OTD5MTaz0kj5g9ceoqjH7HtGb
 Mkfw==
X-Gm-Message-State: APjAAAW3044OcBMrw6D6b0bYggPhCqYr6yi6Uo+IDz6BmYH3kHXHXz1T
 ervKBTMLNSPS48S9hUS8/B4=
X-Google-Smtp-Source: APXvYqzEklauFIvbHoHH6Q4TOD2OrcGCFpTLs5/jFW8oZl6MOSuEwmS7hrvyc7XPl7s5DXAKl7VxXA==
X-Received: by 2002:a1c:5401:: with SMTP id i1mr3986014wmb.99.1582046910216;
 Tue, 18 Feb 2020 09:28:30 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t13sm6998757wrw.19.2020.02.18.09.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 09:28:29 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: abrodkin@synopsys.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/arc: make arcpgu_debugfs_init return 0
Date: Tue, 18 Feb 2020 20:28:12 +0300
Message-Id: <20200218172821.18378-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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

As drm_debugfs_create_files should return void, remove its use as the
return value of arcpgu_debugfs_init and have the latter function
return 0 directly.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/arc/arcpgu_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index d6a6692db0ac..660b25f9588e 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -139,8 +139,10 @@ static struct drm_info_list arcpgu_debugfs_list[] = {
 
 static int arcpgu_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(arcpgu_debugfs_list,
-		ARRAY_SIZE(arcpgu_debugfs_list), minor->debugfs_root, minor);
+	drm_debugfs_create_files(arcpgu_debugfs_list,
+				 ARRAY_SIZE(arcpgu_debugfs_list),
+				 minor->debugfs_root, minor);
+	return 0;
 }
 #endif
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
