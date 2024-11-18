Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45AE9D0B10
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 09:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBE510E448;
	Mon, 18 Nov 2024 08:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="e8LTFzhW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9575010E448
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 08:41:08 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5RjBM029054;
 Mon, 18 Nov 2024 08:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i7TS+CMWl1Z1e95N/mX5sBAqoXbfzgbHRIPFgYRsp9E=; b=e8LTFzhWgw+9phsf
 Vce99oE9JUqlggya9Op7g86R4UBp+N/mXQl8BMNs+lH7UStfP88GP/83PYvKPwYJ
 g+XHnwQ5hiHgfvzgQRfamvnLkpPNjZAs8kA5j/BooEiBs3A84hmKc5/31Wnvk4kB
 4pYd+TQCJXPWzjptzvq2zSGM0GJGfclFhC7Sc7KsjLMSci3sLkti8JDLztj+bMgU
 /ET8W2eN70538tx9NfQXB9SHFQFjEZ63EBbftTWTlW6d5FPQUQOEL4jc2tetf03A
 L6h3+Q+zA5za086gt2MCIfvzTVKz4ya4CHXNKwKJ/ZSMfsnxAiIA3YfgzN+403RV
 gmb9OQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xmp7bvqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 08:41:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI8f39h020897
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 08:41:03 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 00:41:00 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 2/4] misc: fastrpc: Rename fastrpc.c to fastrpc_main.c
Date: Mon, 18 Nov 2024 14:10:44 +0530
Message-ID: <20241118084046.3201290-3-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pjYBEE0cZRrv9SakxYTWBRGpyV5JaFaS
X-Proofpoint-GUID: pjYBEE0cZRrv9SakxYTWBRGpyV5JaFaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180071
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

Rename the main fastrpc source file to accomodate new files to be
compiled in the same kernel object.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc/Makefile                      | 1 +
 drivers/misc/fastrpc/{fastrpc.c => fastrpc_main.c} | 0
 2 files changed, 1 insertion(+)
 rename drivers/misc/fastrpc/{fastrpc.c => fastrpc_main.c} (100%)

diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
index 77fd2b763b6b..020d30789a80 100644
--- a/drivers/misc/fastrpc/Makefile
+++ b/drivers/misc/fastrpc/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
+fastrpc-objs	:= fastrpc_main.o
\ No newline at end of file
diff --git a/drivers/misc/fastrpc/fastrpc.c b/drivers/misc/fastrpc/fastrpc_main.c
similarity index 100%
rename from drivers/misc/fastrpc/fastrpc.c
rename to drivers/misc/fastrpc/fastrpc_main.c
-- 
2.34.1

