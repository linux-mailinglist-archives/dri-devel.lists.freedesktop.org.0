Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DE03FA6D5
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 18:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC896E03D;
	Sat, 28 Aug 2021 16:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB976EA48
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 12:40:08 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id c4so5797357plh.7
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 05:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=Zy9gkrL+JNg6cRW4icctxicuy4ZeA0G5BPg5O9lEsNU=;
 b=bwjBnqx4LEGWPO1ua6UvMdtVFJQGbeRev3+UpUcHQGbuzxEJ2ReH569Qo0oF/c+OVm
 xenJdUNtkbo4C0M4/yfDu2VMy2+SwdEYYavcPlxwWEypx+Zc9xSaUJBtWrnCTJBOYrHE
 aYprmhZnHHk0Ixd8cGEu3aJD0mBeV//r3D8VjdN2kzxSiADJzfOmEd+zZSU/m38qo/FS
 wn+lVLIPupqW6Vm1T2YwdXNQ6PJOL1f3Uia+1cly3357KNXcQ9FExymCIk/hoiviZwhw
 mTiZnqUwICb3nUIy35RvBee2EJFur70+YoecPqRtUiqOzXEghtKnzhoOQX/CukIaQttZ
 Acdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Zy9gkrL+JNg6cRW4icctxicuy4ZeA0G5BPg5O9lEsNU=;
 b=j90VApqphf4hoXfqJnI7G/nEDUlYyJOZPIJE9NJA1p9d4NYSSr4dMfoPyjaeFu4G2I
 As8UnpCYwH1JFYexDHntNW48tWpmNh2wrMg3/0Buyrg7N1jlIO4j1Ey5dVGXHJ9o8bta
 oGYy+2ys4+WIiCnz9rONY4de+GH++U5HywTVHyxKMpm305zCiqA1rfwqiBp52DWhaVIN
 GRVao6cWimXl8N7HHQuTK6Ms250EQjx4bgmwpl+bX5rDAgVlnqSYm2XzJbJpP6NiIrus
 jGfwHqZO8kuXUSWVbrXsE0CR1fmGiJtujUJiev9hDIJgyfi0PeG+PbISE54LWCFEBZBe
 rAvg==
X-Gm-Message-State: AOAM532o726J1GkrXLk5+TwyNfopp3eg5h5IOJxesrTcbR5J8j6cD7Tr
 jRPZkJX1kwfPhWa3I/VYy9IEZCPxLINo3mU=
X-Google-Smtp-Source: ABdhPJxU5fwbsuc0VGnWo5NfZ2kAr86vT5sENmLWWX05JxS+Ngw0j7+c9e6KFEnnaOUnwcJuGMeSeA==
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr13385759pls.17.1630154407725; 
 Sat, 28 Aug 2021 05:40:07 -0700 (PDT)
Received: from localhost.localdomain ([123.231.122.209])
 by smtp.gmail.com with ESMTPSA id a20sm15116122pjh.46.2021.08.28.05.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 05:40:07 -0700 (PDT)
From: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Cc: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] GPU: drm: fix style errors
Date: Sat, 28 Aug 2021 18:09:42 +0530
Message-Id: <20210828123942.1556-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 28 Aug 2021 16:54:49 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fixes style issues in drm_ioctl.c

Signed-off-by: F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk>
---
 drivers/gpu/drm/drm_ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index be4a52dc4d6f..1355879ab809 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -725,7 +725,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
 };
 
-#define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE( drm_ioctls )
+#define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE(drm_ioctls)
 
 /**
  * DOC: driver specific ioctls
@@ -834,8 +834,8 @@ long drm_ioctl(struct file *filp,
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
-       if (DRM_IOCTL_TYPE(cmd) != DRM_IOCTL_BASE)
-               return -ENOTTY;
+	if (DRM_IOCTL_TYPE(cmd) != DRM_IOCTL_BASE)
+		return -ENOTTY;
 
 	is_driver_ioctl = nr >= DRM_COMMAND_BASE && nr < DRM_COMMAND_END;
 
-- 
2.17.1

