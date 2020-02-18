Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1491F163EE1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AC76EB21;
	Wed, 19 Feb 2020 08:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E014C6EA60
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 17:28:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s10so3620243wmh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 09:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ie5YGPYxd8lGggojJkvA6bITgwj0tY3zWA881s73+aw=;
 b=uevSn+j9agd4NIGL1xvTzNef3JpFjWh25FoMaLWR7noN8FpOOjdrTu1/yWss/4GUvs
 aRbwOiDPK5p5Y7CS/jAnFupVAfywCQtQ8uDECPMKnxSp9fut+BezKaonLeH7i/I4ffQq
 /EGU5E3QQGqsv+Ukk3jhGyRaQJeq403NFp4Vi0/M2wxsdbatjKTXCOmwRVS3p3chVUbX
 2zE13WHmRTYAaLmLl/PEe4qY0oy9Ein0QWAQntyPM3bF7L3zqmsQMZ2SSR1hae04NvcY
 k0sRW+qYoI3G/nb2t2Ft7YnYHbNgtAZb6mS2Vqhxb68G4hGhndap7ZWc/O9u9ddxK2gV
 fm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ie5YGPYxd8lGggojJkvA6bITgwj0tY3zWA881s73+aw=;
 b=fZbF4LDMXehERYtEq2faAy/NQ0z0eLuhp0Ak9GkckzycxMfHF7BE6q6OK4u7enySeu
 H6kFa8zHAmazBZuK3XNCtE7qDR2LNQ2cjqcM06y4WlFZCKCwh0VHNiCQR97P3IFznN3X
 m4aNDrPyb/9F4M7sR3AWcB+S8ophpx/U7qvsxnu7nDhkLDz3wWv2zYSgJp0Nilv1fpPz
 ljpUpoubw/erwR2DgKqCT4nD1dw7Sy2ISl8/RLjz7xgudIniO9G9O79ZGd+sx6/zfMJ2
 aAU+5bzyvfJCny9tzwlWELh2/P3vl42WbJwrUq2oQ9CDyHJaCnxSrL3CYrJRSm9nBjsZ
 NUQQ==
X-Gm-Message-State: APjAAAUavdFaJLft4J3A5Brtte0tOLJzjH3rJLKzWceMp4j56BsvFFER
 Cvh+ySZq0ObdigXG1ZzcVEQ=
X-Google-Smtp-Source: APXvYqxlLNXuC7m8cYGnNtZkvw2jXBqqjJApovuUMRpVfZCcm5M+2hds6XYi9gNneV08MEAMJLbSng==
X-Received: by 2002:a7b:c389:: with SMTP id s9mr4043429wmj.7.1582046914607;
 Tue, 18 Feb 2020 09:28:34 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t13sm6998757wrw.19.2020.02.18.09.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 09:28:34 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: liviu.dudau@arm.com, brian.starkey@arm.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/arm: make hdlcd_debugfs_init return 0
Date: Tue, 18 Feb 2020 20:28:13 +0300
Message-Id: <20200218172821.18378-2-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218172821.18378-1-wambui.karugax@gmail.com>
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
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

As drm_debugfs_create_files should return void, remove its use as a
return value in hdlcd_debugfs_init and have the latter function return 0
directly.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 2e053815b54a..bd0ad6f46a97 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -226,8 +226,10 @@ static struct drm_info_list hdlcd_debugfs_list[] = {
 
 static int hdlcd_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(hdlcd_debugfs_list,
-		ARRAY_SIZE(hdlcd_debugfs_list),	minor->debugfs_root, minor);
+	drm_debugfs_create_files(hdlcd_debugfs_list,
+				 ARRAY_SIZE(hdlcd_debugfs_list),
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
