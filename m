Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C30E5ADFCBD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AFF10E98E;
	Thu, 19 Jun 2025 05:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQYQpTIg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA4C10E98E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 05:10:34 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IJq4p3029414
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 05:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=yBSzG2njIyjzGMlaHr5sTGjTp0z/ExZCJsw
 dGgzeFLU=; b=pQYQpTIgtxWm/1W7ghUqnJkFV7qvxjQQ+QSzv7u9+f6EMrqz3+f
 AWnkeLqOK3ek/+1/FzB/qLN80ffRNf37VXDOkVatWWCRaKCMwSCA2CkPDKd4OtOc
 RfDVcYIspZPueM3umo5wPDzzmvV98bMDzGHcqoRrWp/UFJIygGkRFwhNU/Y6Lg4V
 vXKgTc/5iHInW6+wRXEpNNbyUsZseteUGgMu2gkgqY+fCqaL8tdTADI7hvE1Lj2r
 PE7Sg+OF8CXNvXiGNTlGZVv9uzakKHqhSCheK0ZMql51We85rqJJgMowzrJZqNTA
 AqFBNbo71S314pLaxxQZBYjINnfbuBp1tQQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mpgyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 05:10:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-748a4f5e735so303315b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 22:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750309833; x=1750914633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yBSzG2njIyjzGMlaHr5sTGjTp0z/ExZCJswdGgzeFLU=;
 b=MbpzqJ5dEI9d4VBfehDGccpi2OBxGLatdo95FeoG0Zp/SBu05gSAMik1OA+jnjVe05
 /GMwwKHsba9p5rpRcIjkUlzcJxAELI6ru6PPclCz8u4aZW7VqF1fZAJ34dPYotmACjUK
 8NbmU0q7z9eiz4boeSGV7nTUssYPI9bDAbTc5H+br6i4kuPA2aizEt730iGfbyaXuaS2
 LQ1qt15fWsPhrHmhYk4WaS5YO5v3VZjeMd6kk409eCdyp1ydXR8ki5P6qVHAH87pb4KG
 MkNRmGcBhMIZ8rwZnbmRQSxi6XExqoQzhZPpz8AjwVDgPrxct2Hi4FwYvtLx2ucCgl4J
 wFgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0+IyU4yLJESjAxvwJegXo+bksTj6IojueyhC9+d+rIGh0q0xtgBdvYGWRGjm+FMdoZP/PG9UPe7s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4V6labvGVwQSQd14t4usFK+XoPmV72PkIGkca6KrvNUxvSyvk
 iKL6qNTap1jH36e9L2EJVHd7PKFpkTf19MW5sJXlKbjACn/wARSUtxeN+gJ/V5OC/BYXGzcCSQV
 1NhgKj/+WhCbGfx/XQLBJmSvvMey5QKxl7vp6r2U2ORHd8HySntwuV6fyRmMy9naPt3j/KUQ=
X-Gm-Gg: ASbGncsVo3g9aar5H01ik1qsrhpkR5jMmkIP4kF8zfTfcfbyz0voiZT8ojyxqU83I4/
 19ILO8NRa2GJn8roNVDWQExhLLQvWYnxPCUmhUFQ0IFzmKoDOvtKx+d8ZqI4TC6ICKpbSij5OQm
 0TBINJLxBpILA1oU8m6E+KeBxNhjlQ575HYVuYNfpyZiGH7HnX93aSEWdYfoTWoqCpC0dwXaIve
 W3EyYhEqRBkYxdQw1bLjL9ZswWwUjx7KswdI8ALuY3/r986MYAfluEQODKnNKDWt+yKAaQyI/6L
 xzg0mf8lR2gdAEodD6m8ZIxd3yl2QdNufKJi+i3PapFG4Bq332SmuCY=
X-Received: by 2002:a05:6a00:2d8e:b0:740:6f69:f52a with SMTP id
 d2e1a72fcca58-7489cd5c0b9mr26579011b3a.0.1750309832741; 
 Wed, 18 Jun 2025 22:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA/WHenrVOufZGpGW9L1DNeVeFkF/dZeZeaY+6zyszeiKYWdLj6ZMmiPckF+pSaxxsR2z9iQ==
X-Received: by 2002:a05:6a00:2d8e:b0:740:6f69:f52a with SMTP id
 d2e1a72fcca58-7489cd5c0b9mr26578984b3a.0.1750309832315; 
 Wed, 18 Jun 2025 22:10:32 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900e3a09sm12124060b3a.180.2025.06.18.22.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 22:10:31 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v2] misc: fastrpc: Fix channel resource access in device_open
Date: Thu, 19 Jun 2025 10:40:26 +0530
Message-Id: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA0MiBTYWx0ZWRfX+RCxwZJGn7XV
 aMFWvSEl11y+HLsWiRoheoA4dLLXCXnhdESNqC79FEuugpYW9v+m1hIGU+7y514T0gpEKLyoUoO
 4J8311QA8eWc63wOyQWAaJx/xAhb4X3S6S6SpcI4ParT4XzOj2x61pgYAlSllZDp+p1sdc8N0Qf
 2IJUyugoC3aSABMsmLQ0F5xcb7PQfXSOrIdZN02UEMNwjmx0k8pNvc1KN9KvX3UPvgibI66uOot
 qeA28nEJ8vdI41r6WjYPhNhrZFNWu58MRyVTW7UtN2/3APKXlTCTB3c5ENfxXfhvEgosLSg8lL/
 CdBBPZPpPDps/l3aqoOTmvxMLEJ1S/BFUNd+ei0hV1cndnOjbuuKeTOMZZbqNeNlA6CLQykDwcP
 RdNwvCMix6uWbrRmP2RhBtR1EEdZ+WoVogLSjpcmjcNqHqoYOUvK0jKuMwhSOTzTi+wr3yyd
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68539bc9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pYQKlj0DQmeGCljNor0A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: vLJdB3Ud-ybTrSeu3Gmw4lDxc4_81leo
X-Proofpoint-ORIG-GUID: vLJdB3Ud-ybTrSeu3Gmw4lDxc4_81leo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190042
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

During rpmsg_probe, fastrpc device nodes are created first, then
channel specific resources are initialized, followed by
of_platform_populate, which triggers context bank probing. This
sequence can cause issues as applications might open the device
node before channel resources are initialized or the session is
available, leading to problems. For example, spin_lock is initialized
after the device node creation, but it is used in device_open,
potentially before initialization. Move device registration after
channel resource initialization in fastrpc_rpmsg_probe.

Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Patch v1: https://lore.kernel.org/all/20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com/
Changes in v2:
  - Moved device registration after channel resource initialization
    to resolve the problem.
  - Modified commit text accordingly.

 drivers/misc/fastrpc.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 378923594f02..f9a2ab82d823 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2326,6 +2326,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
 
+	kref_init(&data->refcount);
+
+	dev_set_drvdata(&rpdev->dev, data);
+	rdev->dma_mask = &data->dma_mask;
+	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
+	INIT_LIST_HEAD(&data->users);
+	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
+	spin_lock_init(&data->lock);
+	idr_init(&data->ctx_idr);
+	data->domain_id = domain_id;
+	data->rpdev = rpdev;
+
+	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
+	if (err)
+		goto err_free_data;
+
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
@@ -2353,22 +2369,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		goto err_free_data;
 	}
 
-	kref_init(&data->refcount);
-
-	dev_set_drvdata(&rpdev->dev, data);
-	rdev->dma_mask = &data->dma_mask;
-	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
-	INIT_LIST_HEAD(&data->users);
-	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
-	spin_lock_init(&data->lock);
-	idr_init(&data->ctx_idr);
-	data->domain_id = domain_id;
-	data->rpdev = rpdev;
-
-	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
-	if (err)
-		goto err_deregister_fdev;
-
 	return 0;
 
 err_deregister_fdev:
-- 
2.34.1

