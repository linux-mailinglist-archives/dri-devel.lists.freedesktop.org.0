Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5524D163EDD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69686EB18;
	Wed, 19 Feb 2020 08:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0AE6EA56;
 Tue, 18 Feb 2020 17:28:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q9so3606228wmj.5;
 Tue, 18 Feb 2020 09:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oxzxVwtma/sV1OQLWFOvLbYDQnp164egmH9oHWBKQVY=;
 b=SI/uH1xIfGPD62vOdOEf7CHgVLuavz+9UnHb0QSFE1QC7srr+PLLyPC4Wouwv/q3wb
 EghJWSRtEEmtL06aNjYJVegEuXoSCBPSXvT3hz3216Jrcleq1EXIeFyThIdSwhUGjg7s
 lakD2jP63CuPYBsWpVDEOLF2orsp6BAHUtYZ4Jl+QY89p7I+M9n6X24EPrZxgCgvvbv6
 2SGkyWXj8erV/x2GssFTXboxcMLFMuxpAdTa/8mAdRc5h2Q/TjPTkdA3YODmdPinCsRj
 J/pLbAl0iEq8OrEsBQSsZkb6Gl5CoLoZzsnVOPM6qnVstc1X9cZth1qHLRtNCEhdrG6F
 Yd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oxzxVwtma/sV1OQLWFOvLbYDQnp164egmH9oHWBKQVY=;
 b=ZTIGn7spS4o+rIgtRvq+pwLEiXF6l+J6ouwHdusYMpXhNhZG8kehaSRbVkPAX6mOtv
 4uvcDiMYcgZvKbd9C1Y5LZeQGzMPFCiM/XbAa6PkYI2pZFmQkN56KOnJvUKNEWVsP22U
 HMDJhrCr5RGGnu3lxoOd935EHHqPM0EmwQqNouWfLfoiQHOrusG3FDskhHVcwxUuEw++
 HvZbHn6J6SFXXZow68vZVn4zualy8s7rO0z+RC9yLrA+cXsg2kqhHMDnruWCZksvxWrh
 ss8sZJgmfGrqrqtrR+rUtbJr68bavBq0Qamco4i5EWyUp/9oCXQHWGaudZSuOh20mD/S
 HHJQ==
X-Gm-Message-State: APjAAAWK/B3BFUZcuzUlTlKnvBdo3uXLfZR/KAH+xwFtpbRHGOWa+GGT
 WAns3fszvx2EcSIMy8nOWmk=
X-Google-Smtp-Source: APXvYqzYLL3egDD8D+n9GtknUJLIOCGz2zsS+wJ285OUyyD0DtU9qnJklm62Ceb7raBfb6FtI0omRw==
X-Received: by 2002:a1c:a952:: with SMTP id s79mr4442372wme.83.1582046923100; 
 Tue, 18 Feb 2020 09:28:43 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t13sm6998757wrw.19.2020.02.18.09.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 09:28:42 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: linux+etnaviv@armlinux.org.uk, l.stach@pengutronix.de,
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/etnaviv: remove check for return value of drm_debugfs
 function
Date: Tue, 18 Feb 2020 20:28:15 +0300
Message-Id: <20200218172821.18378-4-wambui.karugax@gmail.com>
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
Cc: gregkh@linuxfoundation.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As there is no need to check the return value if
drm_debugfs_create_files, remove the check and error handling in
etnaviv_debugfs_init and have the function return 0 directly.

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
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
