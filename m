Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2DA938AA7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FB910E3D1;
	Mon, 22 Jul 2024 08:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hD9a6OWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110D710E3CF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:02:29 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46M0hSHI019032;
 Mon, 22 Jul 2024 08:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R6rDmevpspTo4e2w7t1idKO6q/ovGrfS7kPM2SwT32w=; b=hD9a6OWvg+ptBUSi
 vKTud1K8c3Lc5M21hbvLhIqUMFyDcSRX1vbO8To36+6hetYKlimonCDgIiLc5rnX
 xyMtHKkAwL29koCHB2MgXGOuT2nMP4fc9DMI7cmp+TBCja7xtvl88fke+l8uxPOn
 4c9q6HJPbjYr9LKahE5U/9ZWmPRwlkgBnLZdulem4MJ/+QoeZEKkRveRBomH/Aab
 zTDDj94Jmp1cqnSUuIl8ra1vGCleErbbFFUMdxOvRbpd6w5LSv2XZUb7V12fUdr+
 3k9x6xuLWRCLIPj4GYrJCQWiYfrAt3tGn/GNDayqrffieEELSx8eiwmb1+qRbfdH
 hB9zfw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g60jtvya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jul 2024 08:02:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46M82Joi027452
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jul 2024 08:02:19 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 22 Jul 2024 01:02:15 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>, stable
 <stable@kernel.org>
Subject: [PATCH v6 2/2] misc: fastrpc: Increase unsigned PD initmem size
Date: Mon, 22 Jul 2024 13:32:00 +0530
Message-ID: <20240722080200.3530850-3-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
References: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: CgdwRxgxyExIaY_5IDW6EMcO2Wvz5gnB
X-Proofpoint-GUID: CgdwRxgxyExIaY_5IDW6EMcO2Wvz5gnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_04,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220061
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

For unsigned PD offloading requirement, additional memory is required
because of additional static heap initialization. Without this
additional memory, PD initialization would fail. Increase the initmem
size by 2MB for unsigned PD initmem buffer allocation. Any additional
memory sent to DSP during PD init is used as the PD heap.

Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a3a5b745936e..9daeb039c2a2 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -40,6 +40,7 @@
 #define FASTRPC_CTXID_MASK (0xFF0)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
+#define FASTRPC_UNSIGNED_EXTRA_LEN (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
 
@@ -1411,8 +1412,15 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 			goto err;
 	}
 
+	/*
+	 * Allocate buffer in kernel for donating to remote process.
+	 * Unsigned PD requires additional memory because of the
+	 * additional static heap initialized within the process.
+	 */
 	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),
 		       1024 * 1024);
+	if (unsigned_module)
+		memlen += FASTRPC_UNSIGNED_EXTRA_LEN;
 	err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
 				&imem);
 	if (err)
-- 
2.34.1

