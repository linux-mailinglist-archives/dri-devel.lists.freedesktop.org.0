Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B51BC26B98
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 20:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACA310E0D0;
	Fri, 31 Oct 2025 19:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lAkL5RMy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964D710E0D0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 19:26:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59VF7Dji3210518; Fri, 31 Oct 2025 19:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=vm9YST1ru4TYMKmjdDri2q/ayDMdiVpiKua
 QAplEIl8=; b=lAkL5RMyi5ujl6xXEJFfa5WCz6/V96AIo8u6qLrWkyClth5mrh5
 Z1fiRYZ2hW7D4ZoouhQcmw1IZaebHzexoIIXkEeI5qccwV26nDMeuE08epdQBp6f
 L/LsdHvQG83WvUVMtYwN5Gt3nfpvoKXQ4wpJoQvAaWTXvRGmkSavUWA+TfUGoLyR
 1cIlHrD0pmrKk+vaEzRaCsGrMU8bIuiOxQxBS+QoEQhLLJk0kLAqlrll6GYkch4i
 9ULvLeqtTC3hUZLwwlWP4NJ/aCWtMdgORES358NSG54YB9dzxMXb8PKEdFp1thLH
 kiwNBB5404nJ0pj7fzHfpMVC/sBfcVgG7lg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4yfpgnxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 19:25:57 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59VJPuDM007885; 
 Fri, 31 Oct 2025 19:25:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4a4er43ntq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 19:25:56 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59VJPu1S007880;
 Fri, 31 Oct 2025 19:25:56 GMT
Received: from hu-devc-lv-u22-a.qualcomm.com (hu-zmckevit-lv.qualcomm.com
 [10.81.26.129])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 59VJPuk4007879
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 19:25:56 +0000
Received: by hu-devc-lv-u22-a.qualcomm.com (Postfix, from userid 4696302)
 id 5988D5B6; Fri, 31 Oct 2025 12:25:56 -0700 (PDT)
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andersson@kernel.org, Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Subject: [PATCH] accel/qaic: Add qaic_ prefix to irq_polling_work
Date: Fri, 31 Oct 2025 12:25:12 -0700
Message-Id: <20251031192511.3179130-1-zachary.mckevitt@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE3MyBTYWx0ZWRfX51mrDTPl65//
 zHbxNO0nCXPLR/E+XGkHyDeXKlQza4zC9N48ngEruXtdiLXEkfEUtZjPn0hb6RcusdJObgCs+sG
 eC7gSkrAgi7W7fuWhHqSmK37ig7qE0OJuBXuv49jN+5qZrDP8Pqsifw5Iw3Rk4nYSjhwdkO6gFo
 BG5MFTlhbAAn9cMijd2QNvxGzq94nuXTWjJXb8Qo6wSaFrRpzgWqMGW1bN2+fSGO0UKs6owE2vW
 vDi0NwQfOXUC75GSG/Dp1QrDSJncNBc1181qebTB5WbzS/ZgbN4TzZfQI7ts0IFJiB/UsZNOAE0
 xiA3obvE2T1d+ce5ahra2Z2BkgJabKnKsNomTxMbBnhrr/WtZMQSpBaw7z6NUOEfgRTyOmL+2cy
 4I5FWSGoGHigotLP9TrPo0DW5KhMWA==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=69050d45 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=D7IMJj08by8z0Juzub4A:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: pT9AYa4h78UlQaVsbEajeO5bMA7RjnuG
X-Proofpoint-ORIG-GUID: pT9AYa4h78UlQaVsbEajeO5bMA7RjnuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310173
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

Rename irq_polling_work to qaic_irq_polling_work to reduce ambiguity
and avoid potential naming conflicts in the future.

Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic.h      | 2 +-
 drivers/accel/qaic/qaic_data.c | 2 +-
 drivers/accel/qaic/qaic_drv.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 820d133236dd..7a18a617bd1d 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -317,6 +317,6 @@ int qaic_partial_execute_bo_ioctl(struct drm_device *dev, void *data, struct drm
 int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
-void irq_polling_work(struct work_struct *work);
+void qaic_irq_polling_work(struct work_struct *work);
 
 #endif /* _QAIC_H_ */
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 703ef0ce9da1..4e12a1d1742d 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1504,7 +1504,7 @@ irqreturn_t dbc_irq_handler(int irq, void *data)
 	return IRQ_WAKE_THREAD;
 }
 
-void irq_polling_work(struct work_struct *work)
+void qaic_irq_polling_work(struct work_struct *work)
 {
 	struct dma_bridge_chan *dbc = container_of(work, struct dma_bridge_chan,  poll_work);
 	unsigned long flags;
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index e162f4b8a262..4978f5864892 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -545,7 +545,7 @@ static int init_msi(struct qaic_device *qdev, struct pci_dev *pdev)
 			qdev->dbc[i].irq = pci_irq_vector(pdev, qdev->single_msi ? 0 : i + 1);
 			if (!qdev->single_msi)
 				disable_irq_nosync(qdev->dbc[i].irq);
-			INIT_WORK(&qdev->dbc[i].poll_work, irq_polling_work);
+			INIT_WORK(&qdev->dbc[i].poll_work, qaic_irq_polling_work);
 		}
 	}
 
-- 
2.34.1

