Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE26EBFE284
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 22:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19A310E0A5;
	Wed, 22 Oct 2025 20:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBFeBOLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD7210E04D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 20:25:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MK12Vv026940
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 20:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=viCarBWhfO0
 PFzk+8lVGpcJhiXJ25eHfPPGDk/bsnmo=; b=oBFeBOLN2GJAHUJuworUMv68LIF
 G42x9dzZYFtlv6COKzfZkxtAMeRwLXvZ0THFrOgRYI4YLShDxhsxHK1WIMUYMDZj
 ODKA5Nx+B2aUQHplxYpzjZdooSpeg63InJ4j6M4zQSgF2l70r0/B+s2V2zrB6WnP
 oelnui21rkzr+O4+uP/CdDP+Tkun/o9/SsylTCefuOyqjFGB4hXLQZOgCjlBCgoY
 cGgaCce/OsPiCheq5+3DhQLOeIt1vloxGwn1t45u6rJ3p4Ff7jI8gM1huvbOKKxg
 v6SJVTqf0aoZe5Y8Wf7748o5la9afd6XJX+oePyhFTpkoDQB4V6dojNYwaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8g1yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 20:25:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e8a387d01bso1120951cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 13:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761164732; x=1761769532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=viCarBWhfO0PFzk+8lVGpcJhiXJ25eHfPPGDk/bsnmo=;
 b=UN0sfEW37jOgLvy3c1SJJQ5Ypt841R12cViU1J7AYvMRyHIS/qFlHpseGTBizm0FhE
 fk/smxFdlXUL9SoXqG9e+UBQpxfneO9NzAwlRONFawvQL5s0NAaicNz6XXnxF2dt8pEU
 m+gnz3Ev5qZAbB0yc2Y9sbBYqLV8WEY3ErZU9aFycmjrGJ5nxroab7jMkjxh5luwbKzW
 qYvHN1ipI7mldqhjqlG5eD6EqxbqorQ7l617f5CkzRWJHIX3iTKmfMXXBNRfixtosYgV
 lpzr5DeZgOfbDuQWrTR3EiTwz5WqaQMjXL+mKmvfAffOV1Dt0QmQ9GfQM/TmMaZsBipI
 wnag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxUyMEcUJSpT1MAB3NOjPPJQrFa29xHf415bNKcn19AMSoRQIR4N4QKP7m+N4/yiI7VtUzVjIKmp8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybbAVBmi9rRf5WvcZ4K+CPFvplKEpkaQGVSTvR5jdBjPmxterV
 lsmqHXdDDyOtunfw8xUailwSppNSuCdhy6kqFUuc5f49gaWOhwG4pj8O4JOEBH79r5h71Bdgj9+
 yXHki1/Ua11etBffP0ZIMCLBHz42xi/i/BBSP4Tnl9hg850Dn2gGeqol/Y5YdDUvZ5+l2vZE=
X-Gm-Gg: ASbGncuoSsXaBZYVJFrXQ3ec91omOuOV0LPf5MbW4H1pDAQTMMtebJ/sdorOcxNGwkO
 Xz7O2+z2S38HoyVWNedjYi2FXfmBTF3FWfyVVZnyktNH3S6mW0aUgG6pMRNieKiCMJu5alJld3e
 1fKkFGz67B0yh0o+gSObAwOE/XiXD8J6tl5AAtEbmcgo1R+4UYhlfP5VVgp9CNGIPDx+GJ/VDR8
 Vs237M08kCpH4Ea0RNzbLTQlsHXZg4c/nJBFFJKIFfgBOa+p8tDjLTbqNOXn/K9CzpVw2eLO9HP
 8RHPbi6TQ3iEGgmJz28JOksROxJnxTcxpoTL9FgObN+16ikcxHxK4o1jTAxS7FtzegO4ep2h+GA
 wPpuFavtVwnZp6wP1BGl3OppMbfo48ZxADubA9ts=
X-Received: by 2002:ac8:5ad0:0:b0:4e8:aee7:c559 with SMTP id
 d75a77b69052e-4e8aee7c85cmr194739521cf.31.1761164731203; 
 Wed, 22 Oct 2025 13:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXPmZ2h4/R8yfqvgVQS/cK48YSWq2jNaOi/hpBNylvh0BZySobHWmJXwXNGmaHeJTbHu0xRQ==
X-Received: by 2002:ac8:5ad0:0:b0:4e8:aee7:c559 with SMTP id
 d75a77b69052e-4e8aee7c85cmr194739001cf.31.1761164730414; 
 Wed, 22 Oct 2025 13:25:30 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d5141a207sm4998566b.52.2025.10.22.13.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 13:25:29 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Troy Hanson <quic_thanson@quicinc.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Subject: [PATCH 2/3] accel/qaic: Implement basic SSR handling
Date: Wed, 22 Oct 2025 22:25:26 +0200
Message-ID: <20251022202527.3873558-3-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022202527.3873558-1-youssef.abdulrahman@oss.qualcomm.com>
References: <20251022202527.3873558-1-youssef.abdulrahman@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YLTA3obPApFH7LQiChBokJ2cN_Lowy8Y
X-Proofpoint-GUID: YLTA3obPApFH7LQiChBokJ2cN_Lowy8Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX4/EJs0U1VRfF
 hagiTrOFXFC6/2qft7lRy8700rJsolxelzvBbYzD7Z+9eYX5whpSAM1xec8JcIE7h4nyEgRiGl8
 MIzDwTbE2NC7hBLwCyVNWEfxitwspGmL9V/rlOPKbTv2lEgzXz0GKevuNOM3vQGiJJrb58N4ozo
 vTSj5/bk4vHZ+P9Y5JJnCAAHnx4C+GTMhJU992db/gOwpexi0cEDnoM8cHmLjC/qFuOw7NCxDXs
 PUY7sJNm7fEpZteEDPURuA2oYZ9r1FQZonWoR5g/3z8VfboEnLslFSxp32IuRuk4AHDZvBNRpbu
 iXhkzkaFdsfviiCyIqHyoa8+xvssR8gxa3ndqrBEo0rvJHI0xTXbvvaIPD+gP3AjV3kNatPaIel
 9WPKRIE9A7xbsoQvuz/ldyJinQ2RnQ==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68f93dbc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=3gQhxksPipYYRyOgJXsA:9 a=dawVfQjAaf238kedN5IG:22
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164
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

From: Jeffrey Hugo <jhugo@codeaurora.org>

Subsystem restart (SSR) for a qaic device means that a NSP has crashed,
and will be restarted.  However the restart process will lose any state
associated with activation, so the user will need to do some recovery.

While SSR has the provision to collect a crash dump, this patch does not
support it.

Co-developed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Co-developed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Co-developed-by: Troy Hanson <quic_thanson@quicinc.com>
Signed-off-by: Troy Hanson <quic_thanson@quicinc.com>
Co-developed-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 Documentation/accel/qaic/aic100.rst |  24 ++-
 drivers/accel/qaic/Makefile         |   1 +
 drivers/accel/qaic/qaic.h           |   9 +
 drivers/accel/qaic/qaic_data.c      |  61 +++++-
 drivers/accel/qaic/qaic_drv.c       |  17 ++
 drivers/accel/qaic/qaic_ssr.c       | 293 ++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_ssr.h       |  16 ++
 7 files changed, 412 insertions(+), 9 deletions(-)
 create mode 100644 drivers/accel/qaic/qaic_ssr.c
 create mode 100644 drivers/accel/qaic/qaic_ssr.h

diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic/aic100.rst
index 273da6192fb3..3b287c3987d2 100644
--- a/Documentation/accel/qaic/aic100.rst
+++ b/Documentation/accel/qaic/aic100.rst
@@ -487,8 +487,8 @@ one user crashes, the fallout of that should be limited to that workload and not
 impact other workloads. SSR accomplishes this.
 
 If a particular workload crashes, QSM notifies the host via the QAIC_SSR MHI
-channel. This notification identifies the workload by it's assigned DBC. A
-multi-stage recovery process is then used to cleanup both sides, and get the
+channel. This notification identifies the workload by its assigned DBC. A
+multi-stage recovery process is then used to cleanup both sides, and gets the
 DBC/NSPs into a working state.
 
 When SSR occurs, any state in the workload is lost. Any inputs that were in
@@ -496,6 +496,26 @@ process, or queued by not yet serviced, are lost. The loaded artifacts will
 remain in on-card DDR, but the host will need to re-activate the workload if
 it desires to recover the workload.
 
+When SSR occurs for a specific NSP, the assigned DBC goes through the
+following state transactions in order:
+DBC_STATE_BEFORE_SHUTDOWN
+	Indicates that the affected NSP was found in an unrecoverable error
+	condition.
+DBC_STATE_AFTER_SHUTDOWN
+	Indicates that the NSP is under reset.
+DBC_STATE_BEFORE_POWER_UP
+	Indicates that the NSP's debug information has been collected, and is
+	ready to be collected by the host (if desired). At that stage the NSP
+	is restarted by QSM.
+DBC_STATE_AFTER_POWER_UP
+	Indicates that the NSP has been restarted, fully operational and is
+	in idle state.
+
+SSR also has an optional crashdump collection feature. If enabled, the host can
+collect the memory dump for the crashed NSP and dump it to the user space via
+the dev_coredump subsystem. The host can also decline the crashdump collection
+request from the device.
+
 Reliability, Accessibility, Serviceability (RAS)
 ================================================
 
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 8f6746e5f03a..71f727b74da3 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -11,6 +11,7 @@ qaic-y := \
 	qaic_data.o \
 	qaic_drv.o \
 	qaic_ras.o \
+	qaic_ssr.o \
 	qaic_sysfs.o \
 	qaic_timesync.o \
 	sahara.o
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 4c2f25249e95..3bd37b494d49 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -21,6 +21,7 @@
 
 #define QAIC_DBC_BASE		SZ_128K
 #define QAIC_DBC_SIZE		SZ_4K
+#define SSR_DBC_SENTINEL	U32_MAX /* No ongoing SSR sentinel */
 
 #define QAIC_NO_PARTITION	-1
 
@@ -195,6 +196,12 @@ struct qaic_device {
 	unsigned int		ue_count;
 	/* Un-correctable non-fatal error count */
 	unsigned int		ue_nf_count;
+	/* MHI SSR channel device */
+	struct mhi_device	*ssr_ch;
+	/* Work queue for tasks related to MHI SSR device */
+	struct workqueue_struct	*ssr_wq;
+	/* DBC which is under SSR. Sentinel U32_MAX would mean that no SSR in progress */
+	u32			ssr_dbc;
 };
 
 struct qaic_drm_device {
@@ -338,6 +345,8 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
 void irq_polling_work(struct work_struct *work);
+void dbc_enter_ssr(struct qaic_device *qdev, u32 dbc_id);
+void dbc_exit_ssr(struct qaic_device *qdev);
 
 /* qaic_sysfs.c */
 int qaic_sysfs_init(struct qaic_drm_device *qddev);
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c4f117edb266..018c97e7ab72 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1023,6 +1023,11 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 		goto unlock_ch_srcu;
 	}
 
+	if (dbc->id == qdev->ssr_dbc) {
+		ret = -EPIPE;
+		goto unlock_ch_srcu;
+	}
+
 	ret = qaic_prepare_bo(qdev, bo, &args->hdr);
 	if (ret)
 		goto unlock_ch_srcu;
@@ -1356,6 +1361,11 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 		goto release_ch_rcu;
 	}
 
+	if (dbc->id == qdev->ssr_dbc) {
+		ret = -EPIPE;
+		goto release_ch_rcu;
+	}
+
 	ret = mutex_lock_interruptible(&dbc->req_lock);
 	if (ret)
 		goto release_ch_rcu;
@@ -1709,6 +1719,11 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 		goto unlock_ch_srcu;
 	}
 
+	if (dbc->id == qdev->ssr_dbc) {
+		ret = -EPIPE;
+		goto unlock_ch_srcu;
+	}
+
 	obj = drm_gem_object_lookup(file_priv, args->handle);
 	if (!obj) {
 		ret = -ENOENT;
@@ -1729,6 +1744,9 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 	if (!dbc->usr)
 		ret = -EPERM;
 
+	if (dbc->id == qdev->ssr_dbc)
+		ret = -EPIPE;
+
 put_obj:
 	drm_gem_object_put(obj);
 unlock_ch_srcu:
@@ -1927,6 +1945,17 @@ static void empty_xfer_list(struct qaic_device *qdev, struct dma_bridge_chan *db
 	spin_unlock_irqrestore(&dbc->xfer_lock, flags);
 }
 
+static void sync_empty_xfer_list(struct qaic_device *qdev, struct dma_bridge_chan *dbc)
+{
+	empty_xfer_list(qdev, dbc);
+	synchronize_srcu(&dbc->ch_lock);
+	/*
+	 * Threads holding channel lock, may add more elements in the xfer_list.
+	 * Flush out these elements from xfer_list.
+	 */
+	empty_xfer_list(qdev, dbc);
+}
+
 int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr)
 {
 	if (!qdev->dbc[dbc_id].usr || qdev->dbc[dbc_id].usr->handle != usr->handle)
@@ -1955,13 +1984,7 @@ void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id)
 	struct dma_bridge_chan *dbc = &qdev->dbc[dbc_id];
 
 	dbc->usr = NULL;
-	empty_xfer_list(qdev, dbc);
-	synchronize_srcu(&dbc->ch_lock);
-	/*
-	 * Threads holding channel lock, may add more elements in the xfer_list.
-	 * Flush out these elements from xfer_list.
-	 */
-	empty_xfer_list(qdev, dbc);
+	sync_empty_xfer_list(qdev, dbc);
 }
 
 void release_dbc(struct qaic_device *qdev, u32 dbc_id)
@@ -2002,3 +2025,27 @@ void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head, u32 *tail)
 	*head = readl(dbc->dbc_base + REQHP_OFF);
 	*tail = readl(dbc->dbc_base + REQTP_OFF);
 }
+
+/*
+ * dbc_enter_ssr - Prepare to enter in sub system reset(SSR) for given DBC ID.
+ *		   The device will automatically deactivate the workload as not
+ *		   all errors can be silently recovered. The user will be
+ *		   notified and will need to decide the required recovery
+ *		   action to take.
+ * @qdev: qaic device handle
+ * @dbc_id: ID of the DBC which will enter SSR
+ */
+void dbc_enter_ssr(struct qaic_device *qdev, u32 dbc_id)
+{
+	qdev->ssr_dbc = dbc_id;
+	release_dbc(qdev, dbc_id);
+}
+
+/*
+ * dbc_exit_ssr - Prepare to exit from sub system reset(SSR) for given DBC ID
+ * @qdev: qaic device handle
+ */
+void dbc_exit_ssr(struct qaic_device *qdev)
+{
+	qdev->ssr_dbc = SSR_DBC_SENTINEL;
+}
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index a8a16f20320f..4aac8d1eba8c 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -30,6 +30,7 @@
 #include "qaic.h"
 #include "qaic_debugfs.h"
 #include "qaic_ras.h"
+#include "qaic_ssr.h"
 #include "qaic_timesync.h"
 #include "sahara.h"
 
@@ -390,6 +391,7 @@ void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
 	qaic_notify_reset(qdev);
 
 	/* start tearing things down */
+	clean_up_ssr(qdev);
 	for (i = 0; i < qdev->num_dbc; ++i)
 		release_dbc(qdev, i);
 }
@@ -439,11 +441,18 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev,
 	qdev->qts_wq = qaicm_wq_init(drm, "qaic_ts");
 	if (IS_ERR(qdev->qts_wq))
 		return NULL;
+	qdev->ssr_wq = qaicm_wq_init(drm, "qaic_ssr");
+	if (IS_ERR(qdev->ssr_wq))
+		return NULL;
 
 	ret = qaicm_srcu_init(drm, &qdev->dev_lock);
 	if (ret)
 		return NULL;
 
+	ret = ssr_init(qdev, drm);
+	if (ret)
+		pci_info(pdev, "QAIC SSR crashdump collection not supported.\n");
+
 	qdev->qddev = qddev;
 	qdev->pdev = pdev;
 	qddev->qdev = qdev;
@@ -710,9 +719,16 @@ static int __init qaic_init(void)
 	ret = qaic_ras_register();
 	if (ret)
 		pr_debug("qaic: qaic_ras_register failed %d\n", ret);
+	ret = qaic_ssr_register();
+	if (ret) {
+		pr_debug("qaic: qaic_ssr_register failed %d\n", ret);
+		goto free_bootlog;
+	}
 
 	return 0;
 
+free_bootlog:
+	qaic_bootlog_unregister();
 free_mhi:
 	mhi_driver_unregister(&qaic_mhi_driver);
 free_pci:
@@ -738,6 +754,7 @@ static void __exit qaic_exit(void)
 	 * reinitializing the link_up state after the cleanup is done.
 	 */
 	link_up = true;
+	qaic_ssr_unregister();
 	qaic_ras_unregister();
 	qaic_bootlog_unregister();
 	qaic_timesync_deinit();
diff --git a/drivers/accel/qaic/qaic_ssr.c b/drivers/accel/qaic/qaic_ssr.c
new file mode 100644
index 000000000000..1ffb44767b3d
--- /dev/null
+++ b/drivers/accel/qaic/qaic_ssr.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <asm/byteorder.h>
+#include <drm/drm_file.h>
+#include <drm/drm_managed.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mhi.h>
+#include <linux/workqueue.h>
+
+#include "qaic.h"
+#include "qaic_ssr.h"
+
+#define MSG_BUF_SZ 32
+
+enum ssr_cmds {
+	DEBUG_TRANSFER_INFO =		BIT(0),
+	DEBUG_TRANSFER_INFO_RSP =	BIT(1),
+	MEMORY_READ =			BIT(2),
+	MEMORY_READ_RSP =		BIT(3),
+	DEBUG_TRANSFER_DONE =		BIT(4),
+	DEBUG_TRANSFER_DONE_RSP =	BIT(5),
+	SSR_EVENT =			BIT(8),
+	SSR_EVENT_RSP =			BIT(9),
+};
+
+enum ssr_events {
+	SSR_EVENT_NACK =	BIT(0),
+	BEFORE_SHUTDOWN =	BIT(1),
+	AFTER_SHUTDOWN =	BIT(2),
+	BEFORE_POWER_UP =	BIT(3),
+	AFTER_POWER_UP =	BIT(4),
+};
+
+struct _ssr_hdr {
+	__le32 cmd;
+	__le32 len;
+	__le32 dbc_id;
+};
+
+struct ssr_hdr {
+	u32 cmd;
+	u32 len;
+	u32 dbc_id;
+};
+
+struct ssr_debug_transfer_info {
+	struct ssr_hdr hdr;
+	u32 resv;
+	u64 tbl_addr;
+	u64 tbl_len;
+} __packed;
+
+struct ssr_debug_transfer_info_rsp {
+	struct _ssr_hdr hdr;
+	__le32 ret;
+} __packed;
+
+struct ssr_memory_read {
+	struct _ssr_hdr hdr;
+	__le32 resv;
+	__le64 addr;
+	__le64 len;
+} __packed;
+
+struct ssr_memory_read_rsp {
+	struct _ssr_hdr hdr;
+	__le32 resv;
+	u8 data[];
+} __packed;
+
+struct ssr_debug_transfer_done {
+	struct _ssr_hdr hdr;
+	__le32 resv;
+} __packed;
+
+struct ssr_debug_transfer_done_rsp {
+	struct _ssr_hdr hdr;
+	__le32 ret;
+} __packed;
+
+struct ssr_event {
+	struct ssr_hdr hdr;
+	u32 event;
+} __packed;
+
+struct ssr_event_rsp {
+	struct _ssr_hdr hdr;
+	__le32 event;
+} __packed;
+
+struct ssr_resp {
+	/* Work struct to schedule work coming on QAIC_SSR channel */
+	struct work_struct work;
+	/* Root struct of device, used to access device resources */
+	struct qaic_device *qdev;
+	/* Buffer used by MHI for transfer requests */
+	u8 data[] __aligned(8);
+};
+
+void clean_up_ssr(struct qaic_device *qdev)
+{
+	dbc_exit_ssr(qdev);
+}
+
+static void ssr_worker(struct work_struct *work)
+{
+	struct ssr_resp *resp = container_of(work, struct ssr_resp, work);
+	struct ssr_hdr *hdr = (struct ssr_hdr *)resp->data;
+	struct ssr_debug_transfer_info_rsp *debug_rsp;
+	struct qaic_device *qdev = resp->qdev;
+	struct ssr_event_rsp *event_rsp;
+	struct dma_bridge_chan *dbc;
+	struct ssr_event *event;
+	u32 ssr_event_ack;
+	int ret;
+
+	le32_to_cpus(&hdr->cmd);
+	le32_to_cpus(&hdr->len);
+	le32_to_cpus(&hdr->dbc_id);
+
+	if (hdr->len > MSG_BUF_SZ)
+		goto out;
+
+	if (hdr->dbc_id >= qdev->num_dbc)
+		goto out;
+
+	dbc = &qdev->dbc[hdr->dbc_id];
+
+	switch (hdr->cmd) {
+	case DEBUG_TRANSFER_INFO:
+		/* Decline crash dump request from the device */
+		debug_rsp = kmalloc(sizeof(*debug_rsp), GFP_KERNEL);
+		if (!debug_rsp)
+			break;
+
+		debug_rsp->hdr.cmd = cpu_to_le32(DEBUG_TRANSFER_INFO_RSP);
+		debug_rsp->hdr.len = cpu_to_le32(sizeof(*debug_rsp));
+		debug_rsp->hdr.dbc_id = cpu_to_le32(event->hdr.dbc_id);
+		debug_rsp->ret = cpu_to_le32(1);
+
+		ret = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE,
+				    debug_rsp, sizeof(*debug_rsp), MHI_EOT);
+		if (ret) {
+			pci_warn(qdev->pdev, "Could not send DEBUG_TRANSFER_INFO_RSP %d\n", ret);
+			kfree(debug_rsp);
+		}
+		return;
+	case SSR_EVENT:
+		event = (struct ssr_event *)hdr;
+		le32_to_cpus(&event->event);
+		ssr_event_ack = event->event;
+
+		switch (event->event) {
+		case BEFORE_SHUTDOWN:
+			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_BEFORE_SHUTDOWN);
+			dbc_enter_ssr(qdev, hdr->dbc_id);
+			break;
+		case AFTER_SHUTDOWN:
+			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_AFTER_SHUTDOWN);
+			break;
+		case BEFORE_POWER_UP:
+			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_BEFORE_POWER_UP);
+			break;
+		case AFTER_POWER_UP:
+			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_AFTER_POWER_UP);
+			break;
+		default:
+			break;
+		}
+
+		event_rsp = kmalloc(sizeof(*event_rsp), GFP_KERNEL);
+		if (!event_rsp)
+			break;
+
+		event_rsp->hdr.cmd = cpu_to_le32(SSR_EVENT_RSP);
+		event_rsp->hdr.len = cpu_to_le32(sizeof(*event_rsp));
+		event_rsp->hdr.dbc_id = cpu_to_le32(hdr->dbc_id);
+		event_rsp->event = cpu_to_le32(ssr_event_ack);
+
+		ret = mhi_queue_buf(qdev->ssr_ch, DMA_TO_DEVICE, event_rsp, sizeof(*event_rsp),
+				    MHI_EOT);
+		if (ret)
+			kfree(event_rsp);
+
+		if (event->event == AFTER_POWER_UP) {
+			dbc_exit_ssr(qdev);
+			set_dbc_state(qdev, hdr->dbc_id, DBC_STATE_IDLE);
+		}
+
+		break;
+	default:
+		break;
+	}
+
+out:
+	ret = mhi_queue_buf(qdev->ssr_ch, DMA_FROM_DEVICE, resp->data, MSG_BUF_SZ, MHI_EOT);
+	if (ret)
+		kfree(resp);
+}
+
+static int qaic_ssr_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
+	struct ssr_resp *resp;
+	int ret;
+
+	ret = mhi_prepare_for_transfer(mhi_dev);
+	if (ret)
+		return ret;
+
+	resp = kzalloc(sizeof(*resp) + MSG_BUF_SZ, GFP_KERNEL);
+	if (!resp) {
+		mhi_unprepare_from_transfer(mhi_dev);
+		return -ENOMEM;
+	}
+
+	resp->qdev = qdev;
+	INIT_WORK(&resp->work, ssr_worker);
+
+	ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, resp->data, MSG_BUF_SZ, MHI_EOT);
+	if (ret) {
+		kfree(resp);
+		mhi_unprepare_from_transfer(mhi_dev);
+		return ret;
+	}
+
+	dev_set_drvdata(&mhi_dev->dev, qdev);
+	qdev->ssr_ch = mhi_dev;
+
+	return 0;
+}
+
+static void qaic_ssr_mhi_remove(struct mhi_device *mhi_dev)
+{
+	struct qaic_device *qdev;
+
+	qdev = dev_get_drvdata(&mhi_dev->dev);
+	mhi_unprepare_from_transfer(qdev->ssr_ch);
+	qdev->ssr_ch = NULL;
+}
+
+static void qaic_ssr_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
+{
+	kfree(mhi_result->buf_addr);
+}
+
+static void qaic_ssr_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
+{
+	struct ssr_resp *resp = container_of(mhi_result->buf_addr, struct ssr_resp, data);
+	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
+
+	if (mhi_result->transaction_status) {
+		kfree(resp);
+		return;
+	}
+	queue_work(qdev->ssr_wq, &resp->work);
+}
+
+static const struct mhi_device_id qaic_ssr_mhi_match_table[] = {
+	{ .chan = "QAIC_SSR", },
+	{},
+};
+
+static struct mhi_driver qaic_ssr_mhi_driver = {
+	.id_table = qaic_ssr_mhi_match_table,
+	.remove = qaic_ssr_mhi_remove,
+	.probe = qaic_ssr_mhi_probe,
+	.ul_xfer_cb = qaic_ssr_mhi_ul_xfer_cb,
+	.dl_xfer_cb = qaic_ssr_mhi_dl_xfer_cb,
+	.driver = {
+		.name = "qaic_ssr",
+	},
+};
+
+int ssr_init(struct qaic_device *qdev, struct drm_device *drm)
+{
+	qdev->ssr_dbc = SSR_DBC_SENTINEL;
+	return 0;
+}
+
+int qaic_ssr_register(void)
+{
+	return mhi_driver_register(&qaic_ssr_mhi_driver);
+}
+
+void qaic_ssr_unregister(void)
+{
+	mhi_driver_unregister(&qaic_ssr_mhi_driver);
+}
diff --git a/drivers/accel/qaic/qaic_ssr.h b/drivers/accel/qaic/qaic_ssr.h
new file mode 100644
index 000000000000..7de1eb4086cd
--- /dev/null
+++ b/drivers/accel/qaic/qaic_ssr.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __QAIC_SSR_H__
+#define __QAIC_SSR_H__
+
+#include <drm/drm_device.h>
+
+int qaic_ssr_register(void);
+void qaic_ssr_unregister(void);
+void clean_up_ssr(struct qaic_device *qdev);
+int ssr_init(struct qaic_device *qdev, struct drm_device *drm);
+#endif /* __QAIC_SSR_H__ */
-- 
2.43.0

