Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582ACAFE344
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 10:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A9710E1FB;
	Wed,  9 Jul 2025 08:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNz/8eR8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF0D10E1FB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 08:54:44 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697mNtX024565
 for <dri-devel@lists.freedesktop.org>; Wed, 9 Jul 2025 08:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=bMGiynhWKxSPuqq8fZmj2e2BYO/cDjhxVXX
 /4HP0dVA=; b=nNz/8eR8lZ1FGvMqck1Y2S5lME7NXLQEOwFeoKfTl+Z1CPmkXeJ
 m8v/BgumpvK8sUg81ALVLZSvQcL80+3uPIImUqecJVOTNNGEjGjgCbHP6Rpfr+cI
 DSFyQ+7K4akT5AFkqYDVXObienidneGnm6/FWcKQEwY9CEMu0mp5YwzoXz3nmyK8
 ZxJe9h4QFuxxMMmpdOSRryYgJli5ESGufz2aTEDpijjiL4SZgH9pbHoZ5Ibcd8ev
 20ZVJRjxnB0Y5cmKEitR/tD6K+u9czawb6o6HqsiKhfrzWGUehxseepWqkSMceYL
 m6yzJHmca8RapRIgdFRB0Vzt6JWE81tm7lQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbnr6sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 08:54:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d45e0dbee2so846278185a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 01:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752051282; x=1752656082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bMGiynhWKxSPuqq8fZmj2e2BYO/cDjhxVXX/4HP0dVA=;
 b=Yl4Ut+LzM1zXcS+F0UOcn3Ph9kpsu1UX/c9/GMUEQLgMJrPF9vj/YmDCqwZXxxkK8a
 8vSTupbghxDpQugpi2OsCYkwt++G1+1Rsdw7BmkFkH+zR8mNfE2vDyHFJ38JLlotKRja
 34SsVL1KdVzwYQWiB+Lkqg3WR1tjeYQ3Av3sOCIngY7mGazeB70mdc+kbW0DaZDhg5wV
 yD5NAiLSb3OuSr5jmJJAti8u9fV1w1xf8bV3tpaaBkShiK6Q4JaclWTvIpQeqq71X3sx
 Fqsea2UBqLLRI7mXrD2WsgfqcASccYwKEv3dPeGfbURW+EaKxJj+rFl0vYZteAs5Hn7x
 Sh0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh07ujS778Ww80RXWD0a2b2DSrWmFhBGhSh9/mlnrG3jJIPBhV6aN1FasnHnwDZJcDUnQ3r4w38Pc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9qZVfMjEWVkxhh1dOUpDfHhLaCJB3CwefyLwh6HpUR83rlk4h
 5NevgmCLdcgWUtYCgKsnGZoRbd/SRVDE+RWgQscoRBdtAlF067cyLj8AKLxYGTzSLN4Isv6NtjW
 q9PnNbOD589qeDX/cB2RLnDsS/CKhO0uL/btEcN01sQPNFs+qYzw0EabmO8q+UtnVz45NxS4=
X-Gm-Gg: ASbGncvidElhro+8U6wqR8qYG4ckQ7+qqDlD+Hs1gmq0ZDbC9+j5oGl13sjF7AUwEdv
 aXUoTDOSqVy2aHMwZWRemdSXUR+c4+SJJkTa5gYJLcgDFXUA54LrXpvYdD0jOWOyxlqQBgJErY5
 iUknceBWBjpZA9xJvpAEmhHwje7/XqfrUSDmtyih7QLuUyOqgjJa4rJePNh7tSYL/24G4wG9DwO
 /ReAQI9O7+nUV+KDpO/1yQEAkQN6XQXkj8qlMvHGeZqkS+xR2wt4Wk8fG3RHcr3/t5cGor6VzgZ
 vKqe+xlBjMjxQnAlCamhsfQRUDBh+mC5YJ7wuKvR5awH80f+entfShVClA==
X-Received: by 2002:a05:620a:2a07:b0:7d4:4552:600d with SMTP id
 af79cd13be357-7db7b125507mr230424685a.7.1752051282485; 
 Wed, 09 Jul 2025 01:54:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbGruPdO8SfeX4B3rqtkzSwhb89RfhR5zaYsiZv4ITt4IGj64rrbJiYQzyRkwvHJUDoEgEdw==
X-Received: by 2002:a05:620a:2a07:b0:7d4:4552:600d with SMTP id
 af79cd13be357-7db7b125507mr230422385a.7.1752051281908; 
 Wed, 09 Jul 2025 01:54:41 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com
 ([2a01:e0a:82c:5f0:3186:b629:3be8:a0d7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285bdf8sm14997874f8f.87.2025.07.09.01.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 01:54:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: lumag@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] gpu: drm: bridge: anx7625: Fix NULL pointer dereference with
 early IRQ
Date: Wed,  9 Jul 2025 10:54:38 +0200
Message-Id: <20250709085438.56188-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA3OSBTYWx0ZWRfX6FdoDfAukbDR
 umjF2pcMBkIOy6168p6nXmof/9XiS0TgY/jNSiPiytFOAJ/+b3bfXfEBI+5+bH088lxGpjAppt6
 d+6FfzZMc8FXE86bHX0Oi9l0UovO+yZwfYHokm0qF1/xIVP1jtKJktDsb2DzgScJmaT104Jx+Ei
 ajNuH3bIPtbCvK8tu1CaLlTaooE9RWRTdXlirOgSE2lhjBWGKnbkEEWDKt5drSloejiMFdTFBSp
 UcZxb14mKyITSqHYz7PL4/+38EDaZtZClPbNXxtxhfbURHnHsvdHTZdBPJ7z1Bg+EMXv2mgdZyv
 RrAuiFUyJFni2Kxc9KeupyEPf6rnmIMMlcb0C07t4Z6HCxCxtF4gSEZkQcdRAow41pSdG3d4nTH
 4lRTLO0A3y3Lq9pRoh2wr3Znnz6r1v3IvAg1MWJ/ZxSNnBVe6ZlQxCTbeZ8M8QMc/bqQl/vl
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=686e2e53 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=bu6cTATwPyPPLne475MA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: yToUInmoC3NmW4bccFBKvSCMGs3k0_NI
X-Proofpoint-GUID: yToUInmoC3NmW4bccFBKvSCMGs3k0_NI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090079
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

If the interrupt occurs before resource initialization is complete, the
interrupt handler/worker may access uninitialized data such as the I2C
tcpc_client device, potentially leading to NULL pointer dereference.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 5a81d1bfc815..0d8f4cc05387 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2678,7 +2678,7 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 		ret = devm_request_threaded_irq(dev, platform->pdata.intp_irq,
 						NULL, anx7625_intr_hpd_isr,
 						IRQF_TRIGGER_FALLING |
-						IRQF_ONESHOT,
+						IRQF_ONESHOT | IRQF_NO_AUTOEN,
 						"anx7625-intp", platform);
 		if (ret) {
 			DRM_DEV_ERROR(dev, "fail to request irq\n");
@@ -2747,8 +2747,10 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 	}
 
 	/* Add work function */
-	if (platform->pdata.intp_irq)
+	if (platform->pdata.intp_irq) {
+		enable_irq(platform->pdata.intp_irq);
 		queue_work(platform->workqueue, &platform->work);
+	}
 
 	if (platform->pdata.audio_en)
 		anx7625_register_audio(dev, platform);
-- 
2.34.1

