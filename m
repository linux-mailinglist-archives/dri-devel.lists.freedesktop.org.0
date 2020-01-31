Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDC615024A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53036EB36;
	Mon,  3 Feb 2020 08:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614A76E95F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 09:22:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00V9IkTY032507; Fri, 31 Jan 2020 10:21:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=C0Udf40gju7kySCbmq3FPOBzpyJNDU///ikc7Ctm0u4=;
 b=bkzfrPgwN4UkwYBkFw3XlpDYeW6SpPQVhepmPzcOOUnoanMSmDBHdOp/nBezteQOUCeg
 iERvVz8jvPoOpbzCu2RVsXJCqchGcCQxIEQRqNwUOTEkBX7EjaWYaOFYmGnKWBJA5Y4x
 O5mPx5riyf/b9/i3jvA+oqi7/CP2rVi2D7Kg/BeVtB95zaBPjHGqxNHQUMocbO9f+wa7
 HehJY3+6XtBhmArbw66+7OSLvG/MqYpuJGPW9CYYOzu84HyJm2YLGvCOOh9n+pKrhX89
 6XF2GLvnpNb8+/3iWuaBenZob4VTg/t6DjH26x4OVd1CUgrHnpbvtOZmBRMJrsuKbFXa /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrdekvx63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2020 10:21:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 026A5100039;
 Fri, 31 Jan 2020 10:21:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC9D62A4D6F;
 Fri, 31 Jan 2020 10:21:49 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 31 Jan 2020 10:21:48
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] gpu: drm: context: Clean up documentation
Date: Fri, 31 Jan 2020 10:21:47 +0100
Message-ID: <20200131092147.32063-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-31_02:2020-01-30,
 2020-01-31 signatures=0
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:10:41 +0000
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
 drivers/gpu/drm/drm_context.c | 145 ++++++++++++++++++------------------------
 1 file changed, 61 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
index 1f802d8e5681..54e64d612a2b 100644
--- a/drivers/gpu/drm/drm_context.c
+++ b/drivers/gpu/drm/drm_context.c
@@ -43,15 +43,11 @@ struct drm_ctx_list {
 	struct drm_file *tag;
 };
 
-/******************************************************************/
-/** \name Context bitmap support */
-/*@{*/
-
 /**
- * Free a handle from the context bitmap.
+ * drm_legacy_ctxbitmap_free() - Free a handle from the context bitmap.
  *
- * \param dev DRM device.
- * \param ctx_handle context handle.
+ * @dev: DRM device.
+ * @ctx_handle: context handle.
  *
  * Clears the bit specified by \p ctx_handle in drm_device::ctx_bitmap and the entry
  * in drm_device::ctx_idr, while holding the drm_device::struct_mutex
@@ -69,10 +65,10 @@ void drm_legacy_ctxbitmap_free(struct drm_device * dev, int ctx_handle)
 }
 
 /**
- * Context bitmap allocation.
+ * drm_legacy_ctxbitmap_next() - Context bitmap allocation.
  *
- * \param dev DRM device.
- * \return (non-negative) context handle on success or a negative number on failure.
+ * @dev: DRM device.
+ * Return: (non-negative) context handle on success or a negative number on failure.
  *
  * Allocate a new idr from drm_device::ctx_idr while holding the
  * drm_device::struct_mutex lock.
@@ -89,9 +85,9 @@ static int drm_legacy_ctxbitmap_next(struct drm_device * dev)
 }
 
 /**
- * Context bitmap initialization.
+ * drm_legacy_ctxbitmap_init() - Context bitmap initialization.
  *
- * \param dev DRM device.
+ * @dev: DRM device.
  *
  * Initialise the drm_device::ctx_idr
  */
@@ -105,9 +101,9 @@ void drm_legacy_ctxbitmap_init(struct drm_device * dev)
 }
 
 /**
- * Context bitmap cleanup.
+ * drm_legacy_ctxbitmap_cleanup() - bitmap cleanup.
  *
- * \param dev DRM device.
+ * @dev: DRM device.
  *
  * Free all idr members using drm_ctx_sarea_free helper function
  * while holding the drm_device::struct_mutex lock.
@@ -157,20 +153,13 @@ void drm_legacy_ctxbitmap_flush(struct drm_device *dev, struct drm_file *file)
 	mutex_unlock(&dev->ctxlist_mutex);
 }
 
-/*@}*/
-
-/******************************************************************/
-/** \name Per Context SAREA Support */
-/*@{*/
-
 /**
- * Get per-context SAREA.
+ * drm_legacy_getsareactx() - Get per-context SAREA.
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg user argument pointing to a drm_ctx_priv_map structure.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device to operate on
+ * @data: request data
+ * @file_priv: DRM file private.
+ * Return:  zero on success or a negative number on failure.
  *
  * Gets the map from drm_device::ctx_idr with the handle specified and
  * returns its handle.
@@ -212,13 +201,12 @@ int drm_legacy_getsareactx(struct drm_device *dev, void *data,
 }
 
 /**
- * Set per-context SAREA.
+ * drm_legacy_setsareactx() - Set per-context SAREA.
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg user argument pointing to a drm_ctx_priv_map structure.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device to operate on
+ * @data: request data
+ * @file_priv: DRM file private.
+ * Return: zero on success or a negative number on failure.
  *
  * Searches the mapping specified in \p arg and update the entry in
  * drm_device::ctx_idr with it.
@@ -257,19 +245,13 @@ int drm_legacy_setsareactx(struct drm_device *dev, void *data,
 	return 0;
 }
 
-/*@}*/
-
-/******************************************************************/
-/** \name The actual DRM context handling routines */
-/*@{*/
-
 /**
- * Switch context.
+ * drm_context_switch() - Switch context.
  *
- * \param dev DRM device.
- * \param old old context handle.
- * \param new new context handle.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device.
+ * @old: old context handle.
+ * @new: new context handle.
+ * Return: zero on success or a negative number on failure.
  *
  * Attempt to set drm_device::context_flag.
  */
@@ -291,11 +273,12 @@ static int drm_context_switch(struct drm_device * dev, int old, int new)
 }
 
 /**
- * Complete context switch.
+ * drm_context_switch_complete() - Complete context switch.
  *
- * \param dev DRM device.
- * \param new new context handle.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device.
+ * @file_priv: DRM file private.
+ * @new: new context handle.
+ * Return: zero on success or a negative number on failure.
  *
  * Updates drm_device::last_context and drm_device::last_switch. Verifies the
  * hardware lock is held, clears the drm_device::context_flag and wakes up
@@ -319,13 +302,13 @@ static int drm_context_switch_complete(struct drm_device *dev,
 }
 
 /**
- * Reserve contexts.
+ * drm_legacy_resctx() - Reserve contexts.
+ *
+ * @dev: DRM device to operate on
+ * @data: request data
+ * @file_priv: DRM file private.
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg user argument pointing to a drm_ctx_res structure.
- * \return zero on success or a negative number on failure.
+ * Return: zero on success or a negative number on failure.
  */
 int drm_legacy_resctx(struct drm_device *dev, void *data,
 		      struct drm_file *file_priv)
@@ -352,15 +335,13 @@ int drm_legacy_resctx(struct drm_device *dev, void *data,
 }
 
 /**
- * Add context.
+ * drm_legacy_addctx() - Add context.
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg user argument pointing to a drm_ctx structure.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device to operate on
+ * @data: request data
+ * @file_priv: DRM file private.
  *
- * Get a new handle for the context and copy to userspace.
+ * Return: zero on success or a negative number on failure.
  */
 int drm_legacy_addctx(struct drm_device *dev, void *data,
 		      struct drm_file *file_priv)
@@ -405,13 +386,12 @@ int drm_legacy_addctx(struct drm_device *dev, void *data,
 }
 
 /**
- * Get context.
+ * drm_legacy_getctx() - Get context.
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg user argument pointing to a drm_ctx structure.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device to operate on
+ * @data: request data
+ * @file_priv: DRM file private.
+ * Return: zero on success or a negative number on failure.
  */
 int drm_legacy_getctx(struct drm_device *dev, void *data,
 		      struct drm_file *file_priv)
@@ -429,13 +409,12 @@ int drm_legacy_getctx(struct drm_device *dev, void *data,
 }
 
 /**
- * Switch context.
+ * drm_legacy_switchctx() - Switch context.
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg user argument pointing to a drm_ctx structure.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device to operate on
+ * @data: request data
+ * @file_priv: DRM file private.
+ * Return: zero on success or a negative number on failure.
  *
  * Calls context_switch().
  */
@@ -453,13 +432,12 @@ int drm_legacy_switchctx(struct drm_device *dev, void *data,
 }
 
 /**
- * New context.
+ * drm_legacy_newctx() - New context.
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg user argument pointing to a drm_ctx structure.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device to operate on
+ * @data: request data
+ * @file_priv: DRM file private.
+ * Return: zero on success or a negative number on failure.
  *
  * Calls context_switch_complete().
  */
@@ -479,13 +457,12 @@ int drm_legacy_newctx(struct drm_device *dev, void *data,
 }
 
 /**
- * Remove context.
+ * drm_legacy_rmctx() - Remove context.
  *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg user argument pointing to a drm_ctx structure.
- * \return zero on success or a negative number on failure.
+ * @dev: DRM device to operate on
+ * @data: request data
+ * @file_priv: DRM file private.
+ * Return: zero on success or a negative number on failure.
  *
  * If not the special kernel context, calls ctxbitmap_free() to free the specified context.
  */
-- 
2.15.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
