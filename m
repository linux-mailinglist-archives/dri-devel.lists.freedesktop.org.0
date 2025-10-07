Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B1FBC20C9
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 18:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F0F10E1BA;
	Tue,  7 Oct 2025 16:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCf3OOsa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA0A10E1BA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 16:11:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET7Ge016046
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 16:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=D+Ak4gwFqAVs77B8frtei1K3dA7jAuRqHZi
 zyd63ZVE=; b=lCf3OOsaE2Y2HIgebXZ1kyX0VFqvAziM4CxVbAA9dX4Cgb9R3b9
 wJOtGrQj9GGJiWYEhsbDehpMxXsxUq+0PZFgRd86tsWE/F7tFgwMC3EaPh87iYms
 WljItPflwG1/Qq8T8S5Jb4OCPpThP5n7GGgYicdWEfpxUzJUKmw6BJdesXY/fWOl
 NsTABBB2LRLMmcOBGAbxAAxRtNDGXfutq6sKWou7fSDDHmJlfm3fJ3XkpuDxRlA3
 HJaJuFxW1hQA76bHIeFZsmHXnEWAZgXQ235Eo+eaHONcHRm6KBtjU3cEeDIGYOyc
 mrLcQGLQLy/AJ6HPBfFW8xK5HJeYPEB/gsw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6abj0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 16:11:51 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-54aa22d5862so3236793e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 09:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759853510; x=1760458310;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D+Ak4gwFqAVs77B8frtei1K3dA7jAuRqHZizyd63ZVE=;
 b=l+CrYZq4seqFJqrkYC/1xss/N3M0PLFRS3k2bh5t2xKJwHH/omyFtZufYiBH6ITVcG
 YywX8TwWpL5eHQg84X+U9WHOItMBt8OfkkYmGy+aImYYlTx6ONoFcPUZi+gVldUWrFCp
 /cnddYECXxqtW+MqrfTU+h+MFbI+F9FYLSee8rortr4trJHbXyUNHVGTJb87pifcAQPs
 AY9FELjSRUSHkOECdoWfcci3IJ89ZQVUvOUwbsOFhnQGj3nNJQPC2TyKcREKNxpImhrB
 t8M/R1sx3AszykrZQZTeOA1e8B7WLDMyQW8McVxO4knV3NQST2t5Mjhjt8eZ0pUMOlzb
 pJag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLHW5qfpHqVRSD6KHzS6T/RQtdZuWugbIVuodpqpTu8rxyr4LNZI7bmatEX+nkWTW8mR5wbLds3DI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8YhMcj7G747HrrRwKkQeNorVAlWAmqFzpwGQUeoRIBDHCW7Iz
 uhaskQHRl24wRFzF3kPDWfWVe2Y73GPh+w/FnhSYaQFXsyfnXZi3gxWLkC9vIC5oxGDoiyTT09D
 potWmWGyiBmuErzyyvH+kZpLVvXPGLl/q2FVVF+RaXmgWwdUzvZhwZIKyyTeJ6R0inDPYdAs=
X-Gm-Gg: ASbGncsVDMdEhPE0ngUSBOb4ubLRsVcv3Cr6ZxgPAm11NQ8Kv5zPzHjQxqQK2v2B5q5
 eJjKoKkXJlKnGNk7ONRCTIQOwMtepXGIsPqxmvFQSyl0ktJV7nHBHLyZX+H+pm03HdN8f6VCy7e
 5JWOg0w6f2em9Jz+y33Hl6pu/M7bRCri59sYbbAlK/8wetZwmu7vr62CB51SKoLTIExB9cznfoP
 reAFlrIl/wfN2MWBcW8efXXuIa9nI5rsnqmUH9F0T858ms1YXZvZHqbvQTE9HFetiqct+aAlI7r
 k1hNqOL/1vZtDxDfxBTg6iSMMZ9o4Nos3MDH0PHup7z2F5/yiPWVKhB6uTysS9y9inDjUoxd+iY
 K9xuTUXL7eg==
X-Received: by 2002:a05:6122:1d11:b0:54a:8690:71a7 with SMTP id
 71dfb90a1353d-554b8c5298amr19653e0c.9.1759853510378; 
 Tue, 07 Oct 2025 09:11:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH758MjnEekfWoNbj5c0dYpqeOPnZYknAlmmCW5+WHLoPONkdGMestmm1pOExyAyyl+83B/5w==
X-Received: by 2002:a05:6122:1d11:b0:54a:8690:71a7 with SMTP id
 71dfb90a1353d-554b8c5298amr19575e0c.9.1759853509881; 
 Tue, 07 Oct 2025 09:11:49 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-637881000e8sm12820638a12.32.2025.10.07.09.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 09:11:49 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Remove redundant retry_count = 0 statement
Date: Tue,  7 Oct 2025 18:11:48 +0200
Message-ID: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e53bc7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iJyH9J4HpORdeUluUeMA:9
 a=hhpmQAJR8DioWGSBphRh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Phm2FCOck3cCU21fcKSRepFBRijMTgjk
X-Proofpoint-GUID: Phm2FCOck3cCU21fcKSRepFBRijMTgjk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfXyN5hXGi/r+dl
 MfNt+SGIGckh/9sLg27340gHBZY4xgXy+jGRdbyS68mZicptYHaCdP79f/oI2zwxZJIARSnT50c
 tPHUlNFXuPQrNOqlJIvEhXCKq4ICXYRXR8rZM25oSZvP8Q2XfmnCHhOhZoWYe1EYks2KhHiHvGu
 NsnLOZ8UIQivmsY1Tr5h8t2JD6JMRyetu3rJtXYypYFU+jGfESc+IzJIqkQN9mcB+Y6/+mqILnh
 pKyP0UP79Zc7EV9mAGMDqb5G9+MDuwsPg0w8KhX/1hNlvXIL4iWdDatDNmDpjO+hxV1tXsTd1eq
 8PceknSO61Ca8dqPp8pY/DsDox3u7S7anZkEiwdR19iiiHLEf9gBqbE0NfRwUwPPDP/ohXrXc1s
 Jp+8mXW/Y4ldEdddq16jcvFB47LOEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121
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

From: Youssef Samir <quic_yabdulra@quicinc.com>

If msg_xfer() is called and the channel ring does not have enough room
to accommodate the whole message, the function sleeps and tries again.
It uses retry_count to keep track of the number of retrials done. This
variable is not used after the space check succeeds. So, remove the
retry_count = 0 statement used later in the function.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d8bdab69f800..5aa49e0e1869 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -1079,7 +1079,6 @@ static void *msg_xfer(struct qaic_device *qdev, struct wrapper_list *wrappers, u
 
 	list_for_each_entry(w, &wrappers->list, list) {
 		kref_get(&w->ref_count);
-		retry_count = 0;
 		ret = mhi_queue_buf(qdev->cntl_ch, DMA_TO_DEVICE, &w->msg, w->len,
 				    list_is_last(&w->list, &wrappers->list) ? MHI_EOT : MHI_CHAIN);
 		if (ret) {
-- 
2.43.0

