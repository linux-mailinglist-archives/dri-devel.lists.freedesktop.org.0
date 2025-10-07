Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224BBC145A
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 13:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF94C10E11C;
	Tue,  7 Oct 2025 11:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZBVIrIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547DD10E11C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 11:57:54 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59738kmo005144
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 11:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=x3FrYPMxnfKh2xjFx0tCvhblzRITWQjtLSz
 NuYM15SQ=; b=MZBVIrIeaHSPY3TV+FU++iJ8jwgOjyqsV4ws6tuSLyXLBLkCxLd
 8pxWFllqE23Nud1i1oRKk43Kr85cmyexW5TUNRYzLl+00mN1GQVY0i1Kkk3qXszS
 TRtAz+lWTmNGQU40hjAMBFzvn2Iq+BELDX9iIgzu2SG2FpjPW3Rdl9I9SkZYQFhM
 S6Ny5M7IqHqz+PBxqE6naIHZo4NrmCxzHAsof4p6W6V4cyuuqmyAlP37XdOXXzgS
 yQgq0Hx8q41k3a7ThLSFLnej/aYEANtCDcYn1cTClvy0dvjttx1svwiL1tVJizdJ
 TW9hcPTb0epH/9aZNHdo7xWiVZOPcB0vHtA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn7d9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 11:57:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4de801c1446so133848771cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 04:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759838272; x=1760443072;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x3FrYPMxnfKh2xjFx0tCvhblzRITWQjtLSzNuYM15SQ=;
 b=Wm2pJYOe+nreTyK+sn3uv9AXY2l8YMANvhEtlzwZscXdEh8Afg995UR1KFcJ28wPn4
 wqUWx72V5MWQN6aOjszSjIC4fQXL2LVxj2e50g3RmH3BJtu+otA0+JnIiLk4MGgPfZOm
 MwrKS4V7+l5woKpGXD6DJfeg3DT1F0Qdj3FbGM2uxPEoab5jmlyNEA38ExcK/o/Fy82f
 rWGtJEpAUOs6iV0gRyFV9SCTrjO1ULihMGgCLqJ1YHgiedv+hKkZfGO819z/KzbwtFVu
 caE7tuzfJ+uNOoOmmNwvZ+GO9MUh4vpBQAPSbuVmcjqwqlEpyVFGtYXvQvyklRTxD2vJ
 XyNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoq5RoBpT7PuB0vz3fy7iKhPGNyo/rpf74RP5R7Btp0ORrOvCndhwGkHZ43c8mXlmTjUR4N3KW1V4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpFSHX+55aGkM5goycK4Rj6NRYVBrWV3godiAKE7l2Lw2/ddaz
 97v2zdcbto8Pay+pFKAGhLRCZyMkX10CmcEUALLLt4fSctwWEVknFmQe3b6myZidDf+b4W/2y1x
 Hi+3qtRV1bs8bigB5fanw+1AYtTq+/wkaSpUIXuP5qyaQV/E5At83c/zXor0Oqnm+4DbGZKM=
X-Gm-Gg: ASbGnct7ZA4dENqDAP7oqimvnmg5DPE8QXA2FaFstZhmATLOSYjNDLLG92STPIPLhxU
 DAJIrom9IZ59S9oA4vheJtLRQDs9JqgtnmQe+MlE+yktQSu7UYkcSgxQTEHgwLf4uRYMg5qtUNX
 gH49f9uyObYELQjqaCDWt55BLRFwag1BvEIoTbAFSC0kIxeVOPxzVXLYgKSG4CnGsI5IizNBXrN
 xHoCWll6YT2TZP/NPKt/6oAXTbQq6qfYKoCGwie0UG1UPvMK8Ni7dN7UChkJXwMZMCt5NuQ0xaQ
 iRgjOQgtdq9gbzB2k+i7l7Y1Hs2FHAKEDkLWU+h3KNeL5qPl5Pvb0eEiYwlXoVJAA6gPVQuccV9
 CjDtPhIke8A==
X-Received: by 2002:ac8:74d2:0:b0:4e5:834b:ca45 with SMTP id
 d75a77b69052e-4e5834bcae5mr105583141cf.63.1759838272434; 
 Tue, 07 Oct 2025 04:57:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU+Ujm7vTcAuTiF9tQ87c412Co2eQ7Yw6aihhoqBCStMmXR9FP97MI9cAvWh2to76AohJlAg==
X-Received: by 2002:ac8:74d2:0:b0:4e5:834b:ca45 with SMTP id
 d75a77b69052e-4e5834bcae5mr105582871cf.63.1759838271803; 
 Tue, 07 Oct 2025 04:57:51 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652aa62csm1339064066b.19.2025.10.07.04.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 04:57:50 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Fix bootlog initialization ordering
Date: Tue,  7 Oct 2025 13:57:50 +0200
Message-ID: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX0m/uzsPd+7zO
 aS/5gMYNnAz6e2RZ8k9KMp+223Z55ILa2O7YDIncGwUBzZExbdN+k+/5D8iBZFzFv4TO2v3HI1h
 3/QPHNfTevGoS5IRgygK8UhWh7ionaPbNBgWgipJYgYPCFKDV01r40uFSV1xKOf8BeeF1wB9py4
 niw9PaZnQ51xlJQzlclfA6PyVDYPOJ+Xt58yUS2KeaVACll8q2Lmwm5r5/eN0A7EfdnqCRqyRqi
 Sw89ZEs8b/7xix04g3IUVTGUcsUbpWyLYHpjBn1NMDAsHVUqNyKrOdpvvoOWDGFm7vnaVd4GXu1
 KwcpntCG3FH717V5trjiTHVz69dGX4JoUuK3xCyaO6nYn5305YjtlFAWa0w0YzQv6ogp2ZNclj7
 B8SWHs+LJXVKZYy8IGJz2Qzl4Z72zQ==
X-Proofpoint-GUID: wpoXHnhde5RiSaaFUVpIk49sUBMTi8Rw
X-Proofpoint-ORIG-GUID: wpoXHnhde5RiSaaFUVpIk49sUBMTi8Rw
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e50041 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=aVJJzlxB05kmw2s4GJQA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
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

From: Jeffrey Hugo <quic_jhugo@quicinc.com>

As soon as we queue MHI buffers to receive the bootlog from the device,
we could be receiving data. Therefore all the resources needed to
process that data need to be setup prior to queuing the buffers.

We currently initialize some of the resources after queuing the buffers
which creates a race between the probe() and any data that comes back
from the device. If the uninitialized resources are accessed, we could
see page faults.

Fix the init ordering to close the race.

Fixes: 5f8df5c6def6 ("accel/qaic: Add bootlog debugfs")
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index a991b8198dc4..8dc4fe5bb560 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -218,6 +218,9 @@ static int qaic_bootlog_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_d
 	if (ret)
 		goto destroy_workqueue;
 
+	dev_set_drvdata(&mhi_dev->dev, qdev);
+	qdev->bootlog_ch = mhi_dev;
+
 	for (i = 0; i < BOOTLOG_POOL_SIZE; i++) {
 		msg = devm_kzalloc(&qdev->pdev->dev, sizeof(*msg), GFP_KERNEL);
 		if (!msg) {
@@ -233,8 +236,6 @@ static int qaic_bootlog_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_d
 			goto mhi_unprepare;
 	}
 
-	dev_set_drvdata(&mhi_dev->dev, qdev);
-	qdev->bootlog_ch = mhi_dev;
 	return 0;
 
 mhi_unprepare:
-- 
2.43.0

