Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD29DECAF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 21:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2317510E596;
	Fri, 29 Nov 2024 20:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nn8A0dv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD6C10E596
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 20:29:00 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT83fIL004209;
 Fri, 29 Nov 2024 20:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ozSH48AQ8QskLuRPYuvhAv
 nTRX0ybLsc1XXKdSESFJ8=; b=nn8A0dv3tfNtWN09jGDmZS2zZSH77jYU0f9Cz0
 iz/L5czq8Y2i4v4l+brZ0jWCQs0wuYqZEhmqbCIwNnL8YeP49Fnu14pHoGzPoOmA
 +AfPkZ9nmAOsQdEXxjFDI1cBIvPPowU5XT6ydB+59WNKnp+moaIA4ThzI6Mh0pJm
 kihf0GCbEXnFHUxDSjess7Vbpoqo9oRvb85nAXGRAnqCle4PRdFYlmK5cvdhd/0I
 7x/CLDQgnLhHTa5BUZEOk9PKP3sdi1Oxd2TvqEtfMeT4IMiSQzFG/g7+r1mk/LSG
 ErrA0UGvkJ+RZBGF3FmDV5NiK3iwUaqyUh82E4wN3zLzr0tQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4379s6sqdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 20:29:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ATKSxw7009206
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 20:28:59 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 29 Nov 2024 12:28:59 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_yabdulra@quicinc.com>, <quic_carlv@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] accel/qaic: Fix typo for struct qaic_manage_trans_passthrough
Date: Fri, 29 Nov 2024 13:28:45 -0700
Message-ID: <20241129202845.3579306-1-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Ygur-hW5AQgDp1zp2f89XbymLBy6OBtf
X-Proofpoint-GUID: Ygur-hW5AQgDp1zp2f89XbymLBy6OBtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=671 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290163
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

The documentation header for struct qaic_manage_trans_passthrough has a
typo - "t" is missing in "transaction".

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 include/uapi/drm/qaic_accel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/qaic_accel.h b/include/uapi/drm/qaic_accel.h
index d3ca876a08e9..c92d0309d583 100644
--- a/include/uapi/drm/qaic_accel.h
+++ b/include/uapi/drm/qaic_accel.h
@@ -64,7 +64,7 @@ struct qaic_manage_trans_hdr {
 /**
  * struct qaic_manage_trans_passthrough - Defines a passthrough transaction.
  * @hdr: In. Header to identify this transaction.
- * @data: In. Payload of this ransaction. Opaque to the driver. Userspace must
+ * @data: In. Payload of this transaction. Opaque to the driver. Userspace must
  *	  encode in little endian and align/pad to 64-bit.
  */
 struct qaic_manage_trans_passthrough {
-- 
2.34.1

