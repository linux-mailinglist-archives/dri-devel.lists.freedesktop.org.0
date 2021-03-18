Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E6534038D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 11:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BE86E0FD;
	Thu, 18 Mar 2021 10:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866D36E0FD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 10:39:58 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id s2so3641344qtx.10
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ayz9aKoCpmgg1fa5GkH0c4F8DTmBCEZswDCuyy4H59U=;
 b=VPeK7peaPO+/n0vISlTMqyEBVPghBkM/1ol/hphu+FgdyYVVD4vJddbg/9tMDcbgGR
 kkrgjS5cjIfxCDI2W7qfookjrZm2Qr54yBLwxJm9JeiE4/+ld5YVrUAjKreTHJChtyJP
 LGYUr9Qvrt5u+YF/Ynyrd06aDmbEbmg548EsUt1KEcZqok3jfP0aIb5KyQ0auJydWb2J
 hn4fgLp6rnOPwx/XuAfAFPq6qw55PV+mwzm0t+I6ajSQJrIXhTHG/EvLz1tqWkFfgAdx
 06y9TlKpEmonkFVAnUctoqbEX8kGi873cXytjcrMYHtKqHXt6Zz7RwDD4V5Xvyq0VlWu
 RccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ayz9aKoCpmgg1fa5GkH0c4F8DTmBCEZswDCuyy4H59U=;
 b=BqgdPoJ+jqFrav9Vbi5yqNv+Gzt+Z3VZaq82lEykql46TkyMG+jA/vh0zTK3i4dKNe
 j6vzoYYe2G8Voptf/yA8/WsUuWfs5fl4EsWwRFntIcwR5Kb2P/BrcqovZYRoG6I1ICQk
 hWlgWGe8y88FVRCAftZSTlq3eoO00MZrbTQY7KRo6zxrJT7UEph9QL7wuf9FLGfmOwQL
 VhnSEjeFhJT7+bFSCcaAcigyyEvrk0sWcbR58RLL+UXh9Tv1v9CQxcLhEsZEe6G2rM8t
 lmv08tGO0Po0tgL/H3pFsZiM7RSrH5MH+p1v75yvANinqc8goAy3ZIvFky3kctoQbGzt
 wJjQ==
X-Gm-Message-State: AOAM5301fj6hwGugDw295Mhg5jOEN4CNbL+YyxOa3weT/pCkFucjrgho
 ayUSBaP+IYlAtfAiCd/0Ktc=
X-Google-Smtp-Source: ABdhPJz2sFx7quTsW6EZ/nxZQyM10WClx2kdtxfnDKii5Bcz1/kx8S+pTP5fLGpv3QZ5qKK8cqvUGA==
X-Received: by 2002:aed:38e9:: with SMTP id k96mr3026870qte.162.1616063996680; 
 Thu, 18 Mar 2021 03:39:56 -0700 (PDT)
Received: from localhost.localdomain ([156.146.54.246])
 by smtp.gmail.com with ESMTPSA id 46sm1127507qte.7.2021.03.18.03.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 03:39:55 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Few typo fixes
Date: Thu, 18 Mar 2021 16:07:39 +0530
Message-Id: <20210318103739.27849-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/instatiated/instantiated/
s/unreference/unreferenced/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/drm_property.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 6ee04803c362..27c824a6eb60 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -43,7 +43,7 @@
  * property types and ranges.
  *
  * Properties don't store the current value directly, but need to be
- * instatiated by attaching them to a &drm_mode_object with
+ * instantiated by attaching them to a &drm_mode_object with
  * drm_object_attach_property().
  *
  * Property values are only 64bit. To support bigger piles of data (like gamma
@@ -644,7 +644,7 @@ EXPORT_SYMBOL(drm_property_blob_get);
  * @id: id of the blob property
  *
  * If successful, this takes an additional reference to the blob property.
- * callers need to make sure to eventually unreference the returned property
+ * callers need to make sure to eventually unreferenced the returned property
  * again, using drm_property_blob_put().
  *
  * Return:
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
