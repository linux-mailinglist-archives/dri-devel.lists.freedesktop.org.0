Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD4C13BADF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CBB6E87D;
	Wed, 15 Jan 2020 08:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 411 seconds by postgrey-1.36 at gabe;
 Tue, 14 Jan 2020 14:27:18 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E011891CB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 14:27:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00EEDJ9I002429; Tue, 14 Jan 2020 15:20:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=WTFGUCLWTDzRKhLgs2q+UxAA1l4yHovIjS8c0XHL7Ts=;
 b=eS83FUjgp0iLFkBIkXcu/qIBlD3rdf4FW+3ea+xyHP71BDP3H/ICWz+eX+s0YAz4mjud
 05NJ1HvOgeFPWKYBkhAJPzKGvLgupHTzn4oNqI6Ek828o7VbY3b9irWi52Qlp3ht3l7E
 NUaiCPJP+S8gsOXJsQuW6TBv5UWBZPpKuQlGNr85eIiaLxj5LmISYQKpDpCjSieW+Eb8
 YTy1AG6LziF/fPIlLY+u40e7qx7lxbKPgPgh41Iq/77PDfENGSFwYR92Socl3SNKCEOo
 6bUkNG+adXmauv4zw4tfeaRPnSriPMCkzSu3h04bZvmzY5J7brDM49uJU360Lzh9UVBO AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf78s5xb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 15:20:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBD02100034;
 Tue, 14 Jan 2020 15:20:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85D832BC7AB;
 Tue, 14 Jan 2020 15:20:14 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Jan 2020 15:20:14
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm: fix parameters documentation style
Date: Tue, 14 Jan 2020 15:20:12 +0100
Message-ID: <20200114142012.14389-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-14_04:2020-01-13,
 2020-01-14 signatures=0
X-Mailman-Approved-At: Wed, 15 Jan 2020 08:27:50 +0000
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

Remove old documentation style and use new one to avoid warnings when
compiling with W=1

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/gpu/drm/drm_dma.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/drm_dma.c
index e45b07890c5a..f90bdd4ac69d 100644
--- a/drivers/gpu/drm/drm_dma.c
+++ b/drivers/gpu/drm/drm_dma.c
@@ -42,10 +42,10 @@
 #include "drm_legacy.h"
 
 /**
- * Initialize the DMA data.
+ * drm_legacy_dma_setup() - Initialize the DMA data.
  *
- * \param dev DRM device.
- * \return zero on success or a negative value on failure.
+ * @dev: DRM device.
+ * return zero on success or a negative value on failure.
  *
  * Allocate and initialize a drm_device_dma structure.
  */
@@ -71,9 +71,9 @@ int drm_legacy_dma_setup(struct drm_device *dev)
 }
 
 /**
- * Cleanup the DMA resources.
+ * drm_legacy_dma_takedown() - Cleanup the DMA resources.
  *
- * \param dev DRM device.
+ * @dev: DRM device.
  *
  * Free all pages associated with DMA buffers, the buffers and pages lists, and
  * finally the drm_device::dma structure itself.
@@ -120,10 +120,10 @@ void drm_legacy_dma_takedown(struct drm_device *dev)
 }
 
 /**
- * Free a buffer.
+ * drm_legacy_free_buffer() - Free a buffer.
  *
- * \param dev DRM device.
- * \param buf buffer to free.
+ * @dev: DRM device.
+ * @buf: buffer to free.
  *
  * Resets the fields of \p buf.
  */
@@ -139,9 +139,10 @@ void drm_legacy_free_buffer(struct drm_device *dev, struct drm_buf * buf)
 }
 
 /**
- * Reclaim the buffers.
+ * drm_legacy_reclaim_buffers() - Reclaim the buffers.
  *
- * \param file_priv DRM file private.
+ * @dev: DRM device.
+ * @file_priv: DRM file private.
  *
  * Frees each buffer associated with \p file_priv not already on the hardware.
  */
-- 
2.15.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
