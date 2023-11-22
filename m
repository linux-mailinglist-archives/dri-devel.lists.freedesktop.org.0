Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5DE7F4840
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 14:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE2A10E635;
	Wed, 22 Nov 2023 13:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070C010E631
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 13:48:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AM9cmE8019629; Wed, 22 Nov 2023 13:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=kRLjiWkafDJYF06vr/3OJ9/aGHRTxVUHSlMfQx8SFQo=;
 b=o3aQWRUQeFKqHV1EHPT4x1rcBitP+cSjDedUMCQ688XoeEUGmxCdlogd6K/T7OQF0Adq
 nAviOLT9uCCk8aG+LVpv211DqYufBVXwAF1X1C8vLCyGUHL7cClh54Gu6xlqAnPBv1X9
 YnTrThUoOJMqPbewquiK9+WdM+0xnlKFBxJHHmFr4+RRwBxewIgrNPt+/4kDZyAyp5Jw
 stgJfotbMSdhBYh15Yx4KUf60u6HNCeP/bNBQOgHaNJDi1iCuywTZIee5vAwLQvgRBZf
 APix9nJTNJT8GZsD2QUhCCQU0hyZQaVxnIoN3DWVmm20PK5oEOAuSy99qHz8sQui9MYZ 7g== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhf668kc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Nov 2023 13:48:12 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AMDmBEO005280
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Nov 2023 13:48:11 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 22 Nov 2023 05:48:07 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
To: <sumit.semwal@linaro.org>, <benjamin.gaignard@collabora.com>,
 <Brian.Starkey@arm.com>, <jstultz@google.com>, <tjmercier@google.com>,
 <christian.koenig@amd.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <quic_guptap@quicinc.com>
Subject: [PATCH 0/2] Add qcom secure heaps
Date: Wed, 22 Nov 2023 19:17:45 +0530
Message-ID: <cover.1700544802.git.quic_vjitta@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <y>
References: <y>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: vBiTNP9YsZc5lBQg9comOWQGsHORWSZU
X-Proofpoint-GUID: vBiTNP9YsZc5lBQg9comOWQGsHORWSZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=495 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311220097
X-Mailman-Approved-At: Wed, 22 Nov 2023 13:52:55 +0000
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
Cc: Vijayanand Jitta <quic_vjitta@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vijayanand Jitta <quic_vjitta@quicinc.com>

This patch series is based on mtk patch series [1] of
adding secure heap support.

This patch series adds support for qcom secure heaps which
include secure cma heap and secure system heap, this does
use qcom_scm_assign_mem to secure the memory.

Video would be the user of these heaps and the corresponding
VMIDs are also as added as part of these.


[1] https://lore.kernel.org/linux-arm-kernel/20231111111559.8218-2-yong.wu@mediatek.com/T/

Vijayanand Jitta (2):
  dma-buf: heaps: secure_heap: Add secure ops for CMA heap
  dma-buf: heaps: secure_heap: Add qcom secure system heap

 drivers/dma-buf/heaps/secure_heap.c | 207 +++++++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 3 deletions(-)

-- 
2.34.1

