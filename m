Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511C1C074F3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888F310EB0F;
	Fri, 24 Oct 2025 16:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wn4OyseP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE05F10EB0F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:29:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OC8ij1003518
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=pw/0dRIc2yb8mpK4+aLNe8trvdW00hvkyA8
 V8Kort4c=; b=Wn4OysePvWlp87TqGvVfHm/ofBf0+sKjh0gmKSGW/nrLK5JTh72
 KalAyYQchi/b7tiwshaXhdf0yW/RO6mbwhrX4jc8/VJfvPnz0Y3m0VNJrhflH8d4
 ICAI2K+HNHC6j6KTBkKPJRBI+DY6xW2532L/cSw1PIjXiHi0Nc+k3SKkDsPeLiNE
 8Aa6Zy8Zm8TCp1YurJIpt3oT7uZg04Qkz5vUMVqMAqUfRNEbKCwj/URyTiSpbj8P
 ytI2Xb6OXifMXCbTmE1q3g5EQzBPycOlp17YgpzZldIvcJ0mrzIqyT6aGDLWWvSQ
 ACXYPrUxcoffGwNGzSXRNI+Nvq8JCuHlPIg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jcgy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:29:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e892f776d0so94841431cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761323359; x=1761928159;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pw/0dRIc2yb8mpK4+aLNe8trvdW00hvkyA8V8Kort4c=;
 b=UcBmQB2L1BdJYM6ChaS8pwwNacs9N0mROeZ72FvdrcQDhFkfffLsSq+q7ZwP+1fbGK
 ASYp37Vs2JCzmfiBBSQtbrQ5tBmdmGKOKGjOQz/XVtpSdw9BK+6z16Te3knO97cfSHls
 7cGT/V/ioflgIaVXYTTzztd0Tj+ko3Tkc15r8tB8X6QntRNpEv0uCVx8olxmSMc+5MhI
 eUBrg82le20RTpadoHIQs+A2Mn9vwjMwmdzSnuOl/lb/TR6H7Dui289VJCwN802doJ6Y
 T2oIBuLNF5/DHCZ8dN1ys5v7ZQbzXKfOoHmZWQOMiLH7wYdwppbXjBYlKj8sUK49t9ps
 mRJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWchzxgcc4klXXZv7tLWCdTmzR5Q6IzfoRM1N19WDDe9tX1LAAlSyJpiFbj/Yn0SMLNixPaeQl5QZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIWye2Ye8Do/3se8EMGq8paIqqCXkAzXwf7ZLX/9+IB07GYuJN
 kAsSDeSf3AQikygL7HSJLYraftuD3MNUkqmqzZBsP+2ioumnQ6GMRCgJU/H6ptB39ZA+JP5lRIV
 yVPq1tA0/gK4LTW1Z+SJFS7YTmANeel8bMv4aO3bEmsPPjt5kU9TWLokckZopvvkjDPvMvHw=
X-Gm-Gg: ASbGnctPSvdn49UMQrDoX5GpRFehJj6lkdQH1YkIE8nSv7FDdLjARApmHRxCZa87hqt
 b9W0LrmDWKtzEoKlCWdnlklTUV1lVwcJ11661sqknUu7xobDs4BWQhxtyTBbYFfGh38XrvWu5Mp
 gSNRfDV4o11WeXHqcc0Uj1WXsMf0U6shfdXtWP7JqKGcJG25KXALStl2MFx8pwMF2fhjD0rbv4e
 8lHhFlUDAeY828eSZRZnUssjzmPWVd6ujBnUjZPxY1cHTaFq5MD/MDPFQrZpK/DVAddncBhj+HW
 ifJxCeVMJFU61fIH5ML+NX0i706aT4aziwZigW+VBSMlSz6k6TnuieqC8RI12v68kLTCF9HJ/nI
 U0A7ZPXEdqvFEjWwsj11GfP0kh4VcxZawJasVKj4=
X-Received: by 2002:ac8:7fca:0:b0:4e8:b446:c01b with SMTP id
 d75a77b69052e-4e8b446c551mr264172981cf.61.1761323358640; 
 Fri, 24 Oct 2025 09:29:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfT+6OUi0udWFhNaEN3ru2wRqYYJflB0i03RTtyj2bUwCeMFV+g1jHwOhPLgknYMxzkuzmPA==
X-Received: by 2002:ac8:7fca:0:b0:4e8:b446:c01b with SMTP id
 d75a77b69052e-4e8b446c551mr264172491cf.61.1761323358144; 
 Fri, 24 Oct 2025 09:29:18 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3f316c8fsm4645516a12.25.2025.10.24.09.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 09:29:16 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] accel/qaic: Add support for PM callbacks
Date: Fri, 24 Oct 2025 18:29:16 +0200
Message-ID: <20251024162916.801196-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfXwQMZCb+CvnKJ
 LaPYPffLUKo4saK1bG+SMKxcer+ZH80OFy6+uFFsqtW799z3cuWWWVIEVF0Aczs84hmUNoFKWBG
 OK58ysM0U7OSZ/4oqDnU+y0iLzb+861rCiGC5z5rkEoNGn7iV+cPdOAZsfRcsvoEHtH/J870mAP
 mis0tRIZLarI5ioVAKgOqC7Z8+YdXkyvjdGJNb5r5bo/oeaHTHb33qjlvaM7JGnINBSoct9lYGn
 y0M5EjcL7QwajsW+4co1mVDHHgVZAD6ZpFilJkD45nHRtql5haBCGipKfLoUxIbcw41CB1yJLE2
 uuE0AbsxUGF/lljY0QUwakPlrNZryIyT5S1h/Szcwp0E+H0D3FyCTdU8mLxi8dY1L7UAAF1cZAO
 PR6q4XwOHwWzBhavA0gV4SUI+kuAYw==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fba95f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=69-lKJUwG6m09LcNS64A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 35PMusu6Cg_RVgx2PlrprfkMBHB97KI4
X-Proofpoint-ORIG-GUID: 35PMusu6Cg_RVgx2PlrprfkMBHB97KI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

Add initial support for suspend and hibernation PM callbacks to QAIC.

Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
Changes in v2:
- Guard the pm callbacks with CONFIG_PM_SLEEP to fix openrisc build error
- Add __maybe_unused to helper functions used only in PM callbacks currently
- Link to v1: https://lore.kernel.org/all/20251022204005.3888195-1-youssef.abdulrahman@oss.qualcomm.com
---
 drivers/accel/qaic/qaic.h          |  2 +
 drivers/accel/qaic/qaic_drv.c      | 93 ++++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_timesync.c |  9 +++
 drivers/accel/qaic/qaic_timesync.h |  3 +
 4 files changed, 107 insertions(+)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 820d133236dd..2bfc4ce203c5 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -161,6 +161,8 @@ struct qaic_device {
 	struct mhi_device	*qts_ch;
 	/* Work queue for tasks related to MHI "QAIC_TIMESYNC" channel */
 	struct workqueue_struct	*qts_wq;
+	/* MHI "QAIC_TIMESYNC_PERIODIC" channel device */
+	struct mhi_device	*mqts_ch;
 	/* Head of list of page allocated by MHI bootlog device */
 	struct list_head        bootlog;
 	/* MHI bootlog channel device */
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index e162f4b8a262..8d42866d758e 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -660,6 +660,94 @@ static const struct pci_error_handlers qaic_pci_err_handler = {
 	.reset_done = qaic_pci_reset_done,
 };
 
+static bool __maybe_unused qaic_is_under_reset(struct qaic_device *qdev)
+{
+	int rcu_id;
+	bool ret;
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	ret = qdev->dev_state != QAIC_ONLINE;
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return ret;
+}
+
+static bool __maybe_unused qaic_data_path_busy(struct qaic_device *qdev)
+{
+	int dev_rcu_id;
+	bool ret;
+	int i;
+
+	dev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->dev_state != QAIC_ONLINE) {
+		srcu_read_unlock(&qdev->dev_lock, dev_rcu_id);
+		return false;
+	}
+	for (i = 0; i < qdev->num_dbc; i++) {
+		struct dma_bridge_chan *dbc = &qdev->dbc[i];
+		unsigned long flags;
+		int ch_rcu_id;
+
+		ch_rcu_id = srcu_read_lock(&dbc->ch_lock);
+		if (!dbc->usr || !dbc->in_use) {
+			srcu_read_unlock(&dbc->ch_lock, ch_rcu_id);
+			continue;
+		}
+		spin_lock_irqsave(&dbc->xfer_lock, flags);
+		ret = !list_empty(&dbc->xfer_list);
+		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+		srcu_read_unlock(&dbc->ch_lock, ch_rcu_id);
+		if (ret)
+			break;
+	}
+	srcu_read_unlock(&qdev->dev_lock, dev_rcu_id);
+	return ret;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int qaic_pm_suspend(struct device *dev)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
+
+	dev_dbg(dev, "Suspending..\n");
+	if (qaic_data_path_busy(qdev)) {
+		dev_dbg(dev, "Device's datapath is busy. Aborting suspend..\n");
+		return -EBUSY;
+	}
+	if (qaic_is_under_reset(qdev)) {
+		dev_dbg(dev, "Device is under reset. Aborting suspend..\n");
+		return -EBUSY;
+	}
+	qaic_mqts_ch_stop_timer(qdev->mqts_ch);
+	qaic_pci_reset_prepare(qdev->pdev);
+	pci_save_state(qdev->pdev);
+	pci_disable_device(qdev->pdev);
+	pci_set_power_state(qdev->pdev, PCI_D3hot);
+	return 0;
+}
+
+static int qaic_pm_resume(struct device *dev)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
+	int ret;
+
+	dev_dbg(dev, "Resuming..\n");
+	pci_set_power_state(qdev->pdev, PCI_D0);
+	pci_restore_state(qdev->pdev);
+	ret = pci_enable_device(qdev->pdev);
+	if (ret) {
+		dev_err(dev, "pci_enable_device failed on resume %d\n", ret);
+		return ret;
+	}
+	pci_set_master(qdev->pdev);
+	qaic_pci_reset_done(qdev->pdev);
+	return 0;
+}
+
+static const struct dev_pm_ops qaic_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(qaic_pm_suspend, qaic_pm_resume)
+};
+#endif
+
 static struct pci_driver qaic_pci_driver = {
 	.name = QAIC_NAME,
 	.id_table = qaic_ids,
@@ -667,6 +755,11 @@ static struct pci_driver qaic_pci_driver = {
 	.remove = qaic_pci_remove,
 	.shutdown = qaic_pci_shutdown,
 	.err_handler = &qaic_pci_err_handler,
+	.driver = {
+		#ifdef CONFIG_PM_SLEEP
+		.pm = &qaic_pm_ops,
+		#endif
+	},
 };
 
 static int __init qaic_init(void)
diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_timesync.c
index 3fac540f8e03..8af2475f4f36 100644
--- a/drivers/accel/qaic/qaic_timesync.c
+++ b/drivers/accel/qaic/qaic_timesync.c
@@ -171,6 +171,13 @@ static void qaic_timesync_timer(struct timer_list *t)
 		dev_err(mqtsdev->dev, "%s mod_timer error:%d\n", __func__, ret);
 }
 
+void qaic_mqts_ch_stop_timer(struct mhi_device *mhi_dev)
+{
+	struct mqts_dev *mqtsdev = dev_get_drvdata(&mhi_dev->dev);
+
+	timer_delete_sync(&mqtsdev->timer);
+}
+
 static int qaic_timesync_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
 	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
@@ -206,6 +213,7 @@ static int qaic_timesync_probe(struct mhi_device *mhi_dev, const struct mhi_devi
 	timer->expires = jiffies + msecs_to_jiffies(timesync_delay_ms);
 	add_timer(timer);
 	dev_set_drvdata(&mhi_dev->dev, mqtsdev);
+	qdev->mqts_ch = mhi_dev;
 
 	return 0;
 
@@ -221,6 +229,7 @@ static void qaic_timesync_remove(struct mhi_device *mhi_dev)
 {
 	struct mqts_dev *mqtsdev = dev_get_drvdata(&mhi_dev->dev);
 
+	mqtsdev->qdev->mqts_ch = NULL;
 	timer_delete_sync(&mqtsdev->timer);
 	mhi_unprepare_from_transfer(mqtsdev->mhi_dev);
 	kfree(mqtsdev->sync_msg);
diff --git a/drivers/accel/qaic/qaic_timesync.h b/drivers/accel/qaic/qaic_timesync.h
index 851b7acd43bb..77b9c2b55057 100644
--- a/drivers/accel/qaic/qaic_timesync.h
+++ b/drivers/accel/qaic/qaic_timesync.h
@@ -6,6 +6,9 @@
 #ifndef __QAIC_TIMESYNC_H__
 #define __QAIC_TIMESYNC_H__
 
+#include <linux/mhi.h>
+
 int qaic_timesync_init(void);
 void qaic_timesync_deinit(void);
+void qaic_mqts_ch_stop_timer(struct mhi_device *mhi_dev);
 #endif /* __QAIC_TIMESYNC_H__ */
-- 
2.43.0

