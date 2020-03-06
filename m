Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF9717CD99
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C267D6E1B2;
	Sat,  7 Mar 2020 10:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1ED6ECC8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 10:30:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026AMMK6009083; Fri, 6 Mar 2020 11:29:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=jaKUReuiylgb9hhjNohlRTAfMbgrJdojfG27pLy57kE=;
 b=mo1nW1S/4AoWu86mbCtTKxU15MAtFimYeDyj2zE6LD+m9BHymXUWmupm45Fjkpx8uWZM
 8OoDAYyexLGvvM6UWkuNDpeHKqP2MtMKe4cIoGDXKGS4wqp5iyG32g/4TGYvR8g3PPti
 BMbR1wokeKhb2dwDyhGn99P9P7XxUgRJO1Q9Wj0tHapEYqEh8gDUdusWmq0LdxEIxHdt
 QY4xffw6wOhli7X4SWnr3pUavkb/eI6VBdX1lY/ZlI5xJxs7fgs/tOqXrK/nbfeTS4Gt
 YX3YQHhgG6xfD+btUddghBpir/8KqxXRuPxLydfRaXB2Y6/HvQVGteTHKLtjehfZzAnM ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yffqqeknx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:29:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC30F10003A;
 Fri,  6 Mar 2020 11:29:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB8032A76CB;
 Fri,  6 Mar 2020 11:29:41 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 6 Mar 2020 11:29:41
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <emil.l.velikov@gmail.com>
Subject: [PATCH] drm: bufs: Clean up documentation
Date: Fri, 6 Mar 2020 11:29:36 +0100
Message-ID: <20200306102937.4932-3-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200306102937.4932-1-benjamin.gaignard@st.com>
References: <20200306102937.4932-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE3.st.com
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
 drivers/gpu/drm/drm_bufs.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index 19297e58b232..dcabf5698333 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -134,7 +134,7 @@ static int drm_map_handle(struct drm_device *dev, struct drm_hash_item *hash,
 					 shift, add);
 }
 
-/**
+/*
  * Core function to create a range of memory available for mapping by a
  * non-root process.
  *
@@ -398,7 +398,7 @@ struct drm_local_map *drm_legacy_findmap(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_legacy_findmap);
 
-/**
+/*
  * Ioctl to specify a range of memory that is available for mapping by a
  * non-root process.
  *
@@ -499,7 +499,7 @@ int drm_legacy_getmap_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-/**
+/*
  * Remove a map private from list and deallocate resources if the mapping
  * isn't in use.
  *
@@ -659,7 +659,7 @@ int drm_legacy_rmmap_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
-/**
+/*
  * Cleanup after an error on one of the addbufs() functions.
  *
  * \param dev DRM device.
@@ -694,7 +694,7 @@ static void drm_cleanup_buf_error(struct drm_device *dev,
 }
 
 #if IS_ENABLED(CONFIG_AGP)
-/**
+/*
  * Add AGP buffers for DMA transfers.
  *
  * \param dev struct drm_device to which the buffers are to be added.
@@ -1230,7 +1230,7 @@ static int drm_legacy_addbufs_sg(struct drm_device *dev,
 	return 0;
 }
 
-/**
+/*
  * Add buffers for DMA transfers (ioctl).
  *
  * \param inode device inode.
@@ -1271,7 +1271,7 @@ int drm_legacy_addbufs(struct drm_device *dev, void *data,
 	return ret;
 }
 
-/**
+/*
  * Get information about the buffer mappings.
  *
  * This was originally mean for debugging purposes, or by a sophisticated
@@ -1362,7 +1362,7 @@ int drm_legacy_infobufs(struct drm_device *dev, void *data,
 	return __drm_legacy_infobufs(dev, data, &request->count, copy_one_buf);
 }
 
-/**
+/*
  * Specifies a low and high water mark for buffer allocation
  *
  * \param inode device inode.
@@ -1411,7 +1411,7 @@ int drm_legacy_markbufs(struct drm_device *dev, void *data,
 	return 0;
 }
 
-/**
+/*
  * Unreserve the buffers in list, previously reserved using drmDMA.
  *
  * \param inode device inode.
@@ -1463,7 +1463,7 @@ int drm_legacy_freebufs(struct drm_device *dev, void *data,
 	return 0;
 }
 
-/**
+/*
  * Maps all of the DMA buffers into client-virtual space (ioctl).
  *
  * \param inode device inode.
-- 
2.15.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
