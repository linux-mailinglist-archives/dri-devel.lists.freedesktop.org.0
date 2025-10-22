Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF968BFE31F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 22:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FC110E197;
	Wed, 22 Oct 2025 20:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7UjtbL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5E910E18E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 20:40:14 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIem1U015958
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 20:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=vtYqLWCW1JlzDtLcDpkmF7TsN4Rwb3nWFpn
 RFVM5IJI=; b=m7UjtbL2ekBewHJaUgYsIIEgt+K71GIpG+s+rVuzpOca7vy5fHT
 H4gybk0bnFbXcB7+ZbwhLNmvSCDB/lgTcR4z0kEy93y6SAoutp39d+E8T9X6LdJU
 xXe2DCKMDDvTQckMfY6Bzwdt6ATR37yGIRpyurK2aStb7hPH+zyZgogStLyEtI8p
 yThRJw+GgN6T5S2yZyJhNVysm1eIPr5rU7z+Q4RD9T5U4RjQ/tY/Wk6fRfBtEW/i
 tHZDKl+kQp+tm1h19aOBX60Fc1Hib493OH5rcOtHMKOkJjwWjHsTPS1hj0dAq2Zs
 TdKWGkou2B9h3CrY2+Bcfs+Q2YN4kgqWNUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsbn3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 20:40:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e899262975so1316481cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 13:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761165607; x=1761770407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vtYqLWCW1JlzDtLcDpkmF7TsN4Rwb3nWFpnRFVM5IJI=;
 b=g887ZD16DW4Jcfuh6AtQDwaoPvbipUcIBY9NRNHYk6oJ1ON/QwGa31WVWrbfXAtHa5
 zmpAMTHJPToJrYRt+s3qKz4KSHXqLEeswnj1gnnzWzRb75ljMSmeZ58j13tmpNEzBzhR
 GuawhqMRtqvVq0MNAw35dTCW/2OGJ7DWTrgbDDYZwhch6tqd6jkk6dT6qvztYu2Ys2Fk
 GZ48nBVdOOsbrGSZNN6DUoUY5h//bYmGNqwQHiNcXgK1G52R05Tfo34mpg4zeuJRli+1
 sT/bU+nDwdpvqkP+rRKN9BiPqEuPyeoKsJ7apnWe00LRxHarXzm+KBxU3rIYn129DsQ2
 NSgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdXeV7hb+/1lU7pAtckjCgQRl1AYrud+1yydBNiYX4x0JKF5ZhTDs+sw4MttxSf5KXTSRb3nVtWNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq6AY1P5j/oajQAF+Wsk28KCcz/IP/yjAOlo55iRYVNE2R26mF
 KPaMMGTiwY85tSt3YN1LFr6QSXHNSpBW689TBunNn1JKxe27H3jIzVkJbUJ29FrwuLZya/TvRIt
 HxE5PvU6ZGuZavKNr9TDZnnsY5Onaw7Fyff4Y3ESuQ66n9Xcsi6DgxIW6WyxfOD0nRYknKcaFtZ
 TA9pWM4l0c
X-Gm-Gg: ASbGnct9o4tKj2AhBzj+iqLZzRhnIVIbck01Zr2Za0nreVjrtP0eu4izToj2bGYHSwG
 9UWVGmcqInEid6S/6AapnT1yUOmurxr1lZmP2R2D+3boLlKI655XrSXJlnhdd/4FD2c6fofHp80
 pIblK49CZmtMm+Hs3Ftm2PgedGhPTicrrZEkmrqQi8pGbVP7Cum+NDKRmVAfC911o69gts/FZh9
 5YWEvGQFmxf1yA+fMNrj5VavXtczB4GEv+NsSDc4uEYNnSWyT0GCqRNJ6SR9jASR4LNB2HrkSkw
 uhrnHhCivaljJhRnEJWdgztqbR9+Bm09m8zWyIEtgz93/5T6rPbxc0/zn9y3D+APG4Fzx9VjLTD
 evy+Iy1CwVPTM0Vt+4SM3Rm7hPFFRLHzfX7uJRpw=
X-Received: by 2002:a05:622a:181c:b0:4e8:b4fd:de34 with SMTP id
 d75a77b69052e-4e8b4fdf3f3mr188326921cf.70.1761165606727; 
 Wed, 22 Oct 2025 13:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl0MXdSBAUurKqzT8VouwoZ39qwMBqfWrgvNqsoRIiE/caEBea9tWKCpOKHB+jDFBaQs0Arg==
X-Received: by 2002:a05:622a:181c:b0:4e8:b4fd:de34 with SMTP id
 d75a77b69052e-4e8b4fdf3f3mr188326481cf.70.1761165606159; 
 Wed, 22 Oct 2025 13:40:06 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d5144d61asm9399766b.62.2025.10.22.13.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 13:40:05 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Add support for PM callbacks
Date: Wed, 22 Oct 2025 22:40:05 +0200
Message-ID: <20251022204005.3888195-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfXzvIQ994t8vSj
 6b41IGd/bt2VcHJ6CXSO46pXTjWzbd9V8cm95Ry++ekR7FHMnRmXY0vjYVRlfvrxwwL5nl17PyI
 /a5yq+87ylDTwghWHXn5zgSGIpMbpd35qM+rQ42nMbn0EFxgBNHP5MgNT9ru3uy+s/xXxkE+qnU
 /iK1GQZecWjirIIyncH93afhFuhIBLVzpF/otaS5uh0PcP8Q3oSb+AK2SMrTbA4RrGlEOey3oee
 sDrTAzhq79HHoC5bQrlKSLP2JOCCkrPN0WrKHnzZ+1Gld6iY//nzSeeq6T3tmuYVjh5huK0Aady
 UBLUC1RZEorUaMpMsgW4R1ik58Hf5ktht9d3m4h4DhtdJ0n4QOgy3VLNoyD4ZR8j717GI32sb8+
 NQjdwNayRCxDId3vHokJE2kPOvrr3g==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f9412d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=69-lKJUwG6m09LcNS64A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ZO-M40EfZ86SRNiJPVv29m1N0KLVGkRD
X-Proofpoint-ORIG-GUID: ZO-M40EfZ86SRNiJPVv29m1N0KLVGkRD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190
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
 drivers/accel/qaic/qaic.h          |  2 +
 drivers/accel/qaic/qaic_drv.c      | 89 ++++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_timesync.c |  9 +++
 drivers/accel/qaic/qaic_timesync.h |  3 +
 4 files changed, 103 insertions(+)

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
index e162f4b8a262..6cf0f42c9add 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -660,6 +660,92 @@ static const struct pci_error_handlers qaic_pci_err_handler = {
 	.reset_done = qaic_pci_reset_done,
 };
 
+static bool qaic_is_under_reset(struct qaic_device *qdev)
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
+static bool qaic_data_path_busy(struct qaic_device *qdev)
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
+
 static struct pci_driver qaic_pci_driver = {
 	.name = QAIC_NAME,
 	.id_table = qaic_ids,
@@ -667,6 +753,9 @@ static struct pci_driver qaic_pci_driver = {
 	.remove = qaic_pci_remove,
 	.shutdown = qaic_pci_shutdown,
 	.err_handler = &qaic_pci_err_handler,
+	.driver = {
+		.pm = &qaic_pm_ops,
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

