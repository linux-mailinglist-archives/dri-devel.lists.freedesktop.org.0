Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C7ABC04F7
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 08:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BB710E023;
	Tue,  7 Oct 2025 06:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkHgWGw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E8310E023
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 06:18:40 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5972ruDf015546
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 06:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=CvVAhQAfNLcTGM/vG6Rm69/dUho9Nxx7Jaf
 86sBi5ko=; b=nkHgWGw+89M0BCpEVqUAXsOCTIGSCQMKtZqRCA9HNC0O2I6UvG+
 Ec0IbnaGuChPd7hJvbOQ+o9WRYcmR2cUdkEfJ42gkzJ0YcEJ+5B3PCCq98EtNrd+
 zdOI/qgmb5NJlGxznYXKDGHC5/TXeCnigf3GOpSaI9SXubrd6jkPAsa87NSLnSJw
 kySuMIROyj4tCQVlL7GUc/jvXWkTO4ZEvFHhtsST2yGLyVDq/tMg2XMylLGnQdhS
 +zrPGMCaRsIKZqnF6qnA7x0B2TE/sXTVz6WL6BAxtTHuGZEDlIbOZvaOzvaUgKIP
 ProPa+nKOH8ouAYa74h+bKeLtRGxwtJUwow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu67v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 06:18:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e576157d54so97205801cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 23:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759817919; x=1760422719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CvVAhQAfNLcTGM/vG6Rm69/dUho9Nxx7Jaf86sBi5ko=;
 b=vRwUk2GAgutEMmtuGYLOjlGxC+A2nn+Z8X/ic6hmvFNmUn+AmFIbhlR1LjntvwpfZS
 ra9AMkVseYaCB9kBDEenhc4iZlgrWAy/4p65AYWGn6NCFqBhQHyRNsod5mN7mf/igXS0
 7ByezuMAUZ7ei9CWgMTkdfkWqafI+QPPFr1dP3YL2B5B8DI6DSuEfQKz3ebKxeiGBQzQ
 8k6Sag+5RpB6LHcnt4n55MP4oRaziYmcmyPaK/5hb6nZfc3OKVbSOl/6yV+2Mj86/zAz
 spuU2CPc0Ws3+oOvGZ8+rk1nRDfUfGFZdEpplSoY2KxSwoOqLbtZpxc8ZxoEuUeZ/OgS
 reqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWCR8/ZCbtnpaLGhsmzmuyMPKuadlzqQcHWjN+acBa5sRaZPBa2N6OTawiJjqqFF/sTG6f6JLo09Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi3XSJGygZRNFgosoGNpkb6x+J2OLrU0tI/ZRvM8Ae3AMG+7gG
 IZZOmoXeeKpglw56aCfIxtaOaE/4uO7E2amNbbmVW8MDWiKss1BUwW8eIIdCRvuxbwk8mVaF4ME
 ziW29U2u1fH+o+CCNkBSLNiM3Iyq26shSOjTIADY8rzAxFrqDzKaq4X3JCb6dwFoHG2kgu8M=
X-Gm-Gg: ASbGncsZdKYFNsqqnePP/qDMRzpB0I5d2VpXokCRW06geYvm2Gde8KM0W7k6aIV5EGJ
 0q4qjOCOzqQjpZgSx7S7fbNXM3WVgJUs1NwoeeZ+d+bwkT0zUol6jbmhyhm/GOZtGiOB3kom+wC
 ahxxlZ2MH55QMxPCWqVVPQnUQDZ5odsC5VKUQGXeH4HlsUSOkIuh2ej4s3f88CgQFGgL1UqXroR
 b3M6wIRCRvSrP4CGxlLJjDMI4Wkl3R1oe+EZbRBG5DWOxvX34orjpMFkzomObeUqHEdLQ8Rktb6
 tJlaz4EBOBeOAgkclZt8aWVJgeC8CSegl0R90xt+pKc3ormf6GkBjWzkLWpHF0cutkzi5iIITrV
 M3FVMnOnUZA==
X-Received: by 2002:a05:622a:2590:b0:4b7:a44f:527e with SMTP id
 d75a77b69052e-4e576b0dea4mr215667881cf.76.1759817918941; 
 Mon, 06 Oct 2025 23:18:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFJrfWMCsFZ1Rs7jGV7XjlmrBbdRdCEQ8jIKTB0560Sw5sTHLIUZVcwwvmG8Bg0Q6IP6cLtg==
X-Received: by 2002:a05:622a:2590:b0:4b7:a44f:527e with SMTP id
 d75a77b69052e-4e576b0dea4mr215667711cf.76.1759817918499; 
 Mon, 06 Oct 2025 23:18:38 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-639773d4d8esm5864519a12.30.2025.10.06.23.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 23:18:38 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com
Subject: [PATCH] accel/qaic: Synchronize access to DBC request queue head &
 tail pointer
Date: Tue,  7 Oct 2025 08:18:37 +0200
Message-ID: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yJdNhUI_sh56HoiEKSCmKB119jvGcb91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX+sexK7w0dPEh
 KZeFFI7sTmFd+m5kJLExBIfq1BEVWQvLmXk/vvKnKoHwly96GZWUXKxxQnUXOkXGdK79cU5Kaj/
 1ZY0byEEBFwQoCvOcnxJ69pzSH0algaLco/lAqJ6eroVlVb0D44IuFmDMDITxLX5tIJrgF7Qqpd
 MNm1z3m1gR8hlFAlPbtJEVCyMXn+O3hyBNWX8NotgSxbL2QHKJtUhT/moj7RG3PnuXjmRdHB/Et
 JagAoQAvn2y5vp9Jrud9/Cs7akYy8CQkuPdgL0qMv0LWJJpZ62WYUKUf4l8A9QXQG1rAKqdMQ9G
 //TbJoMMq2LxEQppDjHgddq4EHQug0DVNLr9qA+jy/b+Qb2P0IwBZOfN/gYgIzcVKcv25GWCAXn
 sKORv+p4SeB7Eut2bQZNYMDzxRVdSA==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e4b0bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=L090aUOemVNa8NMnONAA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yJdNhUI_sh56HoiEKSCmKB119jvGcb91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023
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

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Two threads of the same process can potential read and write parallelly to
head and tail pointers of the same DBC request queue. This could lead to a
race condition and corrupt the DBC request queue.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic.h      |  2 ++
 drivers/accel/qaic/qaic_data.c | 12 ++++++++++--
 drivers/accel/qaic/qaic_drv.c  |  3 +++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index c31081e42cee..820d133236dd 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -97,6 +97,8 @@ struct dma_bridge_chan {
 	 * response queue's head and tail pointer of this DBC.
 	 */
 	void __iomem		*dbc_base;
+	/* Synchronizes access to Request queue's head and tail pointer */
+	struct mutex		req_lock;
 	/* Head of list where each node is a memory handle queued in request queue */
 	struct list_head	xfer_list;
 	/* Synchronizes DBC readers during cleanup */
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 797289e9d780..c4f117edb266 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1356,13 +1356,17 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 		goto release_ch_rcu;
 	}
 
+	ret = mutex_lock_interruptible(&dbc->req_lock);
+	if (ret)
+		goto release_ch_rcu;
+
 	head = readl(dbc->dbc_base + REQHP_OFF);
 	tail = readl(dbc->dbc_base + REQTP_OFF);
 
 	if (head == U32_MAX || tail == U32_MAX) {
 		/* PCI link error */
 		ret = -ENODEV;
-		goto release_ch_rcu;
+		goto unlock_req_lock;
 	}
 
 	queue_level = head <= tail ? tail - head : dbc->nelem - (head - tail);
@@ -1370,11 +1374,12 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	ret = send_bo_list_to_device(qdev, file_priv, exec, args->hdr.count, is_partial, dbc,
 				     head, &tail);
 	if (ret)
-		goto release_ch_rcu;
+		goto unlock_req_lock;
 
 	/* Finalize commit to hardware */
 	submit_ts = ktime_get_ns();
 	writel(tail, dbc->dbc_base + REQTP_OFF);
+	mutex_unlock(&dbc->req_lock);
 
 	update_profiling_data(file_priv, exec, args->hdr.count, is_partial, received_ts,
 			      submit_ts, queue_level);
@@ -1382,6 +1387,9 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	if (datapath_polling)
 		schedule_work(&dbc->poll_work);
 
+unlock_req_lock:
+	if (ret)
+		mutex_unlock(&dbc->req_lock);
 release_ch_rcu:
 	srcu_read_unlock(&dbc->ch_lock, rcu_id);
 unlock_dev_srcu:
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index e31bcb0ecfc9..e162f4b8a262 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -454,6 +454,9 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev,
 			return NULL;
 		init_waitqueue_head(&qdev->dbc[i].dbc_release);
 		INIT_LIST_HEAD(&qdev->dbc[i].bo_lists);
+		ret = drmm_mutex_init(drm, &qdev->dbc[i].req_lock);
+		if (ret)
+			return NULL;
 	}
 
 	return qdev;
-- 
2.43.0

