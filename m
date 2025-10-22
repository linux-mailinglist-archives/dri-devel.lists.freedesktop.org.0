Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C802BFBE46
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 14:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68FB10E773;
	Wed, 22 Oct 2025 12:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pfVvjU1P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BFD10E773
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 12:41:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M9pNt2018743
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 12:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=RfeB47HT/QiUsh1/oI/2Si/JRWwIwPFsYvk
 n2bnCrfA=; b=pfVvjU1Puhj210Xunm3F+HooWC5NkWy44nmwuuXx/Wrr0B8Hd1n
 WitlIhtMgQLaMxgUPDduF/HWN9G1aTxdoHMEakAIPIrX5AXLETOw6pZAmmAM9U8/
 fkG2ALQnvdNzJhJRra8Zvelp7xJrl3flPacVrZ+AcHmSna1GA13rPYJuiu5i/uS7
 kt1lJQFyaHRNPqbhIWGQuF5yviryoHH2Fjve51v0z7ZyJuIciOjfI0j+xDrLzvd/
 PL7fyP/1Tabwxj3xakPdH6kpCHLdwJwSf5mwihW7GtlGTi06LzFkxb6z+ZE3fuDm
 8+d4HaImfsySfnmFM5YFtjLwpHWnfi4rEQg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469mkbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 12:41:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e88ddf3cd0so36984611cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 05:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761136869; x=1761741669;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RfeB47HT/QiUsh1/oI/2Si/JRWwIwPFsYvkn2bnCrfA=;
 b=hNTFkW0k94a1Lgfs44T24MXz4MCAesJVuvrBMrvS4xfDBzb7ylwQS42jJ5j8zCKGP4
 UyALNvyaEn3+fWTnk+pWbaZfaqvhP/Z5G/RW4bYtfnZgS/LJmGAZ8Q8vxvQonCf89kmD
 Z+9t+vI9FSPFj3TtiYjCTc9/8t/ddhvrGUZP9IOtGoBZX/VbfuKYCCb2zowtzsmciqfF
 73+O9NSIBNTYtQO0vNa1FfgdlDq+U3kjFnN6+9y244sQSYME2rRPQ0wcqj9IBiNrYgZQ
 cCnEuZY8kl5PqKYHUhGqJu54/aIVfWi0y4zaB5wA+296tV8e+ISmUtg3PxrnbUBh1Cgt
 Twfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDkutFU4de/wQu6F7KaellSzMDLdJT+rEvvWJfm4jeXg5BGsUfzCITBug6hiKbTmEx/rdGV40Yw8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh4uAelwcPS0WfA6yS063RRqIYE27RB5N++Oyo9U1yyjc3u2P/
 k4mYIIu4vBAPGTIgPEghwuC62nWYiFJCcPkX3BRdmdu7kwCq8SUSkedoAeYzDGMuCLrF5ShIm/B
 5R+PawCAbTU/BUnwZGMbFpBgv0rGADF7MLS61XJAFqPuqtt03Vo2bJjdtOLL22Th1I5dflDg=
X-Gm-Gg: ASbGncv42pyOqhofyVUn4J+J32+dTSLZT+b4pao3L2GeqyGSCCJDfLnadIlOicoqCZo
 wPhnNT+W2Qpth4il8vsIfBK6QVZoPK1Te0ulGU8vQSTLEy3cBWVDKItTwKk0FqXCuIkLtkSqYYE
 3sw5NRecN5/+zHrA1kX4TgA+I4qJh8VPPrrDGqB5fTK2iYzRXINSQDaWx0M0MpNrgTQTLnM001b
 WxL8p9N8hILwALmuCExma/fQlEK59WkHwV2ZDTrhgcSUuQWSv/sua1rIwOk0hvvWdD3ExUMHapz
 5zA/ADRPbRjIUe1CK7QnykSJ/kvx5aYomMF8YvANvmvcRrpYHa9GK0hRWzT8OuTXbmTMuIe5gPs
 7xQVqe/E463Mp7SRrk6GqhgrFZn3Rr3NJ+hGJUc8=
X-Received: by 2002:ac8:590d:0:b0:4e8:b8d4:a79c with SMTP id
 d75a77b69052e-4e8b8d4b387mr164900521cf.80.1761136869151; 
 Wed, 22 Oct 2025 05:41:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqCfqyUzXWxiXG0l7vjX+HSWH2fQ6hXaF+mWu6DPoEfJooEHAYpGwfxJnETVGQVv5KJ8VGgQ==
X-Received: by 2002:ac8:590d:0:b0:4e8:b8d4:a79c with SMTP id
 d75a77b69052e-4e8b8d4b387mr164900251cf.80.1761136868622; 
 Wed, 22 Oct 2025 05:41:08 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65ebb4ae4dsm1315965766b.74.2025.10.22.05.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 05:41:08 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Fix comment
Date: Wed, 22 Oct 2025 14:41:07 +0200
Message-ID: <20251022124107.3712466-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _yt0arM1TlLfXUYDxSawtbAmH-t40feD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX5LvICT+QC+/Z
 D5aFX377f8G1J3H96PchO7jQtyS7c1qkCf5z1+w5gVS9ek4lPEajyEOOM5TbL2b1qCCOAW3Bjug
 AVMyRV1waDUz3qaWQi+bk1iKI+eqHlMbw/sdg3JcxnFxOKnbztiUb6+D1IvX5wrkyXGPRYf+F+c
 MWD3OZIlSZeyETisgdx45i7WwWtIJzKu7hj2SPwfnxo2+zJlxT6vD2R4TRqy9xyneZaqkrRsIeX
 QhmZGljFdebb6sHXOw7coglljk2JklkhPD7b21FACurRIUpqKANka6ADsdAAUeBaUxTJI4oaAxu
 hcnaDXW2r+i5eONjBTt7CfQIRjckvhDk4W9ES1A6lwm98YuzqCUr49/+Y3eeerp9EVMIkb21ovE
 XR/ayGqd7Gl/SXn1AeDjBudr2eaexw==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f8d0e6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=jbbOOnZT4aFDcoY3tVQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: _yt0arM1TlLfXUYDxSawtbAmH-t40feD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032
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

From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>

Replace the word "Qranium" with "qaic" in the function parameter description.

Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c4f117edb266..8751b5381d27 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1941,7 +1941,7 @@ int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr)
  * enable_dbc - Enable the DBC. DBCs are disabled by removing the context of
  * user. Add user context back to DBC to enable it. This function trusts the
  * DBC ID passed and expects the DBC to be disabled.
- * @qdev: Qranium device handle
+ * @qdev: qaic device handle
  * @dbc_id: ID of the DBC
  * @usr: User context
  */
-- 
2.43.0

