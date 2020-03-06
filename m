Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA3E17CD93
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E213A6E188;
	Sat,  7 Mar 2020 10:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2566ECC4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 10:29:54 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026AQUmH024651; Fri, 6 Mar 2020 11:29:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=TpwBrpdQQqrlUxFFC4eAdtZrunIBuKKuXsI84SwClXw=;
 b=a/QzvH4MDdhmFn51FIqUrbUPlVIdToECcCJzEniaPetZ2gBZg00Ze/XDaw37C0twCha0
 Y+XESAHhaJLqidtYA971xB6digxKxhNX22TtToHzpN0j1gO2LgopxBlXqwtBPZ/UWCrv
 IznVYyf4N3kEIUWBdsfD2L8AEMakH7oxjiEy63uC3RhuTvZBgGohT7ltLKG1psKdqCaQ
 66xty9dEDN61AMz3JxGZvBfbD2NuxH3rPJRO5bN0x5V7NwJjkThvEFmUQaZqOBveL9I6
 j2gZsc/98PVZEB09dVYX8TTZXMQnrRFpK5WjV1P9uaMzza2Qkyg1IpOtx/OBzfBzkIIN lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfem1efh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:29:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 164C3100039;
 Fri,  6 Mar 2020 11:29:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 047B72A76CB;
 Fri,  6 Mar 2020 11:29:41 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 6 Mar 2020 11:29:40
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <emil.l.velikov@gmail.com>
Subject: [PATCH] drm: lock: Clean up documentation
Date: Fri, 6 Mar 2020 11:29:35 +0100
Message-ID: <20200306102937.4932-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200306102937.4932-1-benjamin.gaignard@st.com>
References: <20200306102937.4932-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_03:2020-03-05,
 2020-03-06 signatures=0
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix kernel doc comments to avoid warnings when compiling with W=1.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/gpu/drm/drm_lock.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
index 2c79e8199e3c..f16eefbf2829 100644
--- a/drivers/gpu/drm/drm_lock.c
+++ b/drivers/gpu/drm/drm_lock.c
@@ -46,7 +46,7 @@
 
 static int drm_lock_take(struct drm_lock_data *lock_data, unsigned int context);
 
-/**
+/*
  * Take the heavyweight lock.
  *
  * \param lock lock pointer.
@@ -93,7 +93,7 @@ int drm_lock_take(struct drm_lock_data *lock_data,
 	return 0;
 }
 
-/**
+/*
  * This takes a lock forcibly and hands it to context.	Should ONLY be used
  * inside *_unlock to give lock to kernel before calling *_dma_schedule.
  *
@@ -150,7 +150,7 @@ static int drm_legacy_lock_free(struct drm_lock_data *lock_data,
 	return 0;
 }
 
-/**
+/*
  * Lock ioctl.
  *
  * \param inode device inode.
@@ -243,7 +243,7 @@ int drm_legacy_lock(struct drm_device *dev, void *data,
 	return 0;
 }
 
-/**
+/*
  * Unlock ioctl.
  *
  * \param inode device inode.
@@ -275,7 +275,7 @@ int drm_legacy_unlock(struct drm_device *dev, void *data, struct drm_file *file_
 	return 0;
 }
 
-/**
+/*
  * This function returns immediately and takes the hw lock
  * with the kernel context if it is free, otherwise it gets the highest priority when and if
  * it is eventually released.
@@ -287,7 +287,6 @@ int drm_legacy_unlock(struct drm_device *dev, void *data, struct drm_file *file_
  * This should be sufficient to wait for GPU idle without
  * having to worry about starvation.
  */
-
 void drm_legacy_idlelock_take(struct drm_lock_data *lock_data)
 {
 	int ret;
-- 
2.15.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
