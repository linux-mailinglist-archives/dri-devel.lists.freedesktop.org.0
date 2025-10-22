Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC9EBFC6C2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCC710E7B1;
	Wed, 22 Oct 2025 14:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6NuJbze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8531310E7B0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:16:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAPJO8031255
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=zSVmBGXhp89LLakLqt63pmwsBW5eaBUwdfU
 ubrpC18w=; b=d6NuJbzeGuRwEx5D+DQ0dSfBwqu7MitpxAnOaIig2TtG1eaoXN6
 YhZW2P1WQymi9rPl/ajhMhAk6FSWpermj+WTT5GybauA/91sx6fyW/yDW9e1f1I8
 oEmEQNaKOaWCdcO+ZIn5zYLKHlA/RROsmgfqDt05n8jlo4AQNrSAN8cs5THG8L3j
 XnGcDQLjHSUI01dtVYcJg5GzchLWaXtMO6k62akzKWpHt0PoKNVntNmWLDMh39Py
 446xVKp+yd/9mG00efBNaoD0kHW3TJKvhACaT/jPnbNg7oQm9HMHzLU5r+OxZ7eS
 9+bi1U2hRclVX/zeDbZOIQlYf9DQ42hECSQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kcpup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:16:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-556fd0bcc47so322966e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761142568; x=1761747368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zSVmBGXhp89LLakLqt63pmwsBW5eaBUwdfUubrpC18w=;
 b=usid3bAYCgUH3V16e9TT/sBjSSVU8bq3R6ySFwlEVE6yy95KZQb7ynW1cq9d5IcvMv
 bzBxmBx3dtcLt/+jAp9W4vJidtJeyQQJVfEWaUyaAmUZafEJIcZKtyQTa74SFmjWgufV
 bXPhp+GoszE0DWNDt9kZmdDi5QrnAsWU1is1kK8eiJyXllqLGRnCL/kAeBtvUFaXerc+
 1BuS2tXATB9i+rbFGrskHdnZvgo2xJ5VPsTyVgEX8vcY/aHgmNW6iHbcJmhEPrar78QZ
 UFDU7LaV+gGYBpHh6MMI9wVNZWVfspjc0bhUt7gDoO1DjrbLEz0fmh6j5eLvn21RQam4
 XLTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiUl4cYuGqoyYYXJgM70BcbSMd/1uaoE0KkaaZP+eKik2zW4lU1Vgu8fz8PUeKxFTdmBK3SKfBqko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZdBKI4Z8+30emJwuIKP87Ao4f1xX/e+BovAiKkgPtYiH8nTQv
 E8Cmp7jzJxWy/uyUlON6KTm/V2lh4LDJeMdSRfgVfxCNktr/i1D+5gQEwozrZdgAujFoENkWvL9
 C/+vT/XoHG+TAd1M7p4juH/rdRv/xYWSEU+9h9xQCwZVMAj4NjG53G0E75U7xYD7K4LKPzU8=
X-Gm-Gg: ASbGncvjBxjpAjsNDYlBWKvJhd3TquFst+02fFm5f/e61l5wLMQUXftzU5m2XN9+IR3
 p7QIFi0aoT/WASpiD78FC2vK4mEHZbnNPqZuJ0WuUrUJAtDEi4Jpe50djqgqW/EozV/6TSsDEde
 d3pwNRuONOERZYF7DPBcqw1h5lUkAXGLAJIET+kHfNpFBlwx0uEvr25hTZAjQTtR32ecL69AUCp
 0s4lDQTKimjyEbqs13T9Kzi+qnXGBiFiRhfN1ZIdGwhtJNTG52nj37qtebJi0HATBrNB+sFIj5u
 9pA0cPvoI52WNNt/axVABEem7oh1D4yfXnUO2eww0eAZKCjcLTiYYNrZdYYSPV5sApKDjMPVJTK
 oRJVO2+RkZw5tZ9iCYQv9JM9yXYU1NInXBygguAU=
X-Received: by 2002:a05:6123:e:b0:554:e726:7818 with SMTP id
 71dfb90a1353d-556a1e67ce5mr587392e0c.2.1761142568467; 
 Wed, 22 Oct 2025 07:16:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDNbG74qQ/1QqT42r3mAqC8kCcPXgjlYDbBT6zot0YQc5vXp2D139VS2lNTvrDU3pbAJuVRQ==
X-Received: by 2002:a05:6123:e:b0:554:e726:7818 with SMTP id
 71dfb90a1353d-556a1e67ce5mr587323e0c.2.1761142568008; 
 Wed, 22 Oct 2025 07:16:08 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab5553sm12143412a12.16.2025.10.22.07.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 07:16:07 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: rename constant for clarity
Date: Wed, 22 Oct 2025 16:16:06 +0200
Message-ID: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eXnb0gSX2hYGMBRbplL5-MLFcnMYAc_N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX1qBpGQoXMCIL
 P8bYuNLSNCMzW7BqvM4dCyZweMt0Nlm/iay9H8woEvwIC51Ot0PGR+S3XUQ55OzLlBYlcEkACx2
 DRkgbH4xe28vrwtJlt08KfQEJmHKtVVW1pAfpPO5PSImzvbtpIjlP8J4hqRAMhSDsdkTDrDhCx4
 4xENV+LepxUkc0rKVzBrl0ceeenRtxv7VsT6fRPDv3LEh9XWqDWAudYz0eYhNL35VbbBcb3OTQU
 e222vytgEemsgp25okGhGMEk7tzakLxlt6Ele1FRcUlF1dFWEdos8CiO3kULLhXKy6wF6uew+q+
 j8rxBhl/NVhoIE8neD59ZhJFW69N+5dWATmwXUM2WPQ+jlsDHFR+ePZlJq1CYrb/vg9bUylaZ7d
 CpoK40Va0/1tMdBJWrVFdEj7Xb4Oyw==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f8e72a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=jxz3m821_weTZxENAOYA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: eXnb0gSX2hYGMBRbplL5-MLFcnMYAc_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031
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

From: Troy Hanson <thanson@qti.qualcomm.com>

QAIC_MANAGE_EXT_MSG_LENGTH is ambiguous and has been confused with
QAIC_MANAGE_MAX_MSG_LENGTH. Rename it to clarify it's a wire length.

Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index b86a8e48e731..079176013da5 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -30,7 +30,7 @@
 #define MANAGE_MAGIC_NUMBER		((__force __le32)0x43494151) /* "QAIC" in little endian */
 #define QAIC_DBC_Q_GAP			SZ_256
 #define QAIC_DBC_Q_BUF_ALIGN		SZ_4K
-#define QAIC_MANAGE_EXT_MSG_LENGTH	SZ_64K /* Max DMA message length */
+#define QAIC_MANAGE_WIRE_MSG_LENGTH	SZ_64K /* Max DMA message length */
 #define QAIC_WRAPPER_MAX_SIZE		SZ_4K
 #define QAIC_MHI_RETRY_WAIT_MS		100
 #define QAIC_MHI_RETRY_MAX		20
@@ -367,7 +367,7 @@ static int encode_passthrough(struct qaic_device *qdev, void *trans, struct wrap
 	if (in_trans->hdr.len % 8 != 0)
 		return -EINVAL;
 
-	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_EXT_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_WIRE_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers,
@@ -495,7 +495,7 @@ static int encode_addr_size_pairs(struct dma_xfer *xfer, struct wrapper_list *wr
 
 	nents = sgt->nents;
 	nents_dma = nents;
-	*size = QAIC_MANAGE_EXT_MSG_LENGTH - msg_hdr_len - sizeof(**out_trans);
+	*size = QAIC_MANAGE_WIRE_MSG_LENGTH - msg_hdr_len - sizeof(**out_trans);
 	for_each_sgtable_dma_sg(sgt, sg, i) {
 		*size -= sizeof(*asp);
 		/* Save 1K for possible follow-up transactions. */
@@ -576,7 +576,7 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
 
 	/* There should be enough space to hold at least one ASP entry. */
 	if (size_add(msg_hdr_len, sizeof(*out_trans) + sizeof(struct wire_addr_size_pair)) >
-	    QAIC_MANAGE_EXT_MSG_LENGTH)
+	    QAIC_MANAGE_WIRE_MSG_LENGTH)
 		return -ENOMEM;
 
 	xfer = kmalloc(sizeof(*xfer), GFP_KERNEL);
@@ -645,7 +645,7 @@ static int encode_activate(struct qaic_device *qdev, void *trans, struct wrapper
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (size_add(msg_hdr_len, sizeof(*out_trans)) > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, sizeof(*out_trans)) > QAIC_MANAGE_WIRE_MSG_LENGTH)
 		return -ENOSPC;
 
 	if (!in_trans->queue_size)
@@ -729,7 +729,7 @@ static int encode_status(struct qaic_device *qdev, void *trans, struct wrapper_l
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_WIRE_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers, sizeof(*trans_wrapper));
@@ -1052,7 +1052,7 @@ static void *msg_xfer(struct qaic_device *qdev, struct wrapper_list *wrappers, u
 	init_completion(&elem.xfer_done);
 	if (likely(!qdev->cntl_lost_buf)) {
 		/*
-		 * The max size of request to device is QAIC_MANAGE_EXT_MSG_LENGTH.
+		 * The max size of request to device is QAIC_MANAGE_WIRE_MSG_LENGTH.
 		 * The max size of response from device is QAIC_MANAGE_MAX_MSG_LENGTH.
 		 */
 		out_buf = kmalloc(QAIC_MANAGE_MAX_MSG_LENGTH, GFP_KERNEL);
-- 
2.43.0

