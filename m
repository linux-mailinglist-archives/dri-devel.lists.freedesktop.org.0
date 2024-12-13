Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 644779F153C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 19:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0CB10E041;
	Fri, 13 Dec 2024 18:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="N2q6o1a3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6121410E041
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 18:51:29 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDE7D86017173;
 Fri, 13 Dec 2024 18:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=1xaiTnWC9VjsubjFbr1gJW
 9bo2r170m60PrakqEreCU=; b=N2q6o1a3OuZzAbBlFxWvYTaJNfEMWKhsob7iYF
 bfJr/k9uuQ5G12a2uTWeros1BjUfWATanDnKmZHhB/L+d/bqnwhC3xohNW5ud3e3
 1x6gIncPRyTO5DbStPESiaC7rkrTKKooU/3G7OvNaT2pfllgVvP30kY7ruRDqnjp
 mZI1Z9qrYf3iT2fHYsfjfK76OpvOetlFoKJ7a3HiZI6vcvu3r45Lbg9LOr3af7Rh
 V6Ldevwnfb1sf5s6JAj006JjBiTcFdDHpiXIgOtPQIu82VQ/Fd0fwVn4RD1a5rxR
 d3eshrAWj0h0OBrXxaWCWC3E4vcbuz74KTUmBW0KtIdYkdQQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gdkn27g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 18:51:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDIpR1H014794
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 18:51:27 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 10:51:26 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_yabdulra@quicinc.com>, <quic_carlv@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] accel/qaic: Change aic100_image_table definition
Date: Fri, 13 Dec 2024 11:51:10 -0700
Message-ID: <20241213185110.2469159-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: baUrJS8H45Ov1NzYspAwC8lv0WfGIMA8
X-Proofpoint-ORIG-GUID: baUrJS8H45Ov1NzYspAwC8lv0WfGIMA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130134
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

aic100_image_table is currently defined as a "const char *" array,
this can potentially lead to the accidental modification of the
pointers inside. Also, checkpatch.pl gives a warning about it.

Change the type to a "const char * const" array to make the pointers
immutable, preventing accidental modification of the images' paths.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/sahara.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 21d58aed0deb..09c8b055aa81 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -160,7 +160,7 @@ struct sahara_context {
 	struct work_struct		fw_work;
 	struct work_struct		dump_work;
 	struct mhi_device		*mhi_dev;
-	const char			**image_table;
+	const char * const		*image_table;
 	u32				table_size;
 	u32				active_image_id;
 	const struct firmware		*firmware;
@@ -177,7 +177,7 @@ struct sahara_context {
 	bool				is_mem_dump_mode;
 };
 
-static const char *aic100_image_table[] = {
+static const char * const aic100_image_table[] = {
 	[1]  = "qcom/aic100/fw1.bin",
 	[2]  = "qcom/aic100/fw2.bin",
 	[4]  = "qcom/aic100/fw4.bin",
-- 
2.34.1

