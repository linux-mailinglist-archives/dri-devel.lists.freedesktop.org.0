Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BF17EF737
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 18:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A4910E2FC;
	Fri, 17 Nov 2023 17:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82BF10E2FC
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 17:44:06 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AHFSGFc013124; Fri, 17 Nov 2023 17:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=ELGprjDCWCLBgZMCc4MhIGy8D4h2ygp8V/1+4HZmZq8=;
 b=j5HBdPodm9o1B8L5+gp4Y4pzscrSkBsQEh8YNPKT6CMClB8vExv4q+16os1iq3Ew7t8Z
 BjCzneVDOel4Z/B5/r2EQfVvaxxRLtLyiE+6LR1rfXK04X6ZEyI1p/DMXd8UV8OWnKnv
 8Fo+QLeRJnYjzvk/tF1TX2g1xhkCUG8BrpM25Uav+UttFCm0GxhAFriXeAUJJz6Y058u
 +mTUlrP1dL7yBvEGFQI6CyXrDndHWNqUdmITgKOjMJOuVZSOvaq0LaA0S8fSZokFw6Nk
 yqvIvL5Sfggjk6Lygy+p9Qs+TyszWAfAWFl9pJqg2OwxamWZA/Hl9A+zJymqJQzU8rK7 Nw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udxs39tng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 17:43:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AHHhtRf021032
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 17:43:55 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 17 Nov 2023 09:43:55 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
Subject: [PATCH 0/2] Convert to persistent DRM devices
Date: Fri, 17 Nov 2023 10:43:35 -0700
Message-ID: <20231117174337.20174-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: O4ykXcyHRHombWNA5s5HfjrRb1_5Soxl
X-Proofpoint-ORIG-GUID: O4ykXcyHRHombWNA5s5HfjrRb1_5Soxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_16,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=774 mlxscore=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170133
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
Cc: linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The qaic driver currently creates and destroys the DRM devices when the
qaic device is in an operational state for userspace. This does not match
what other DRM drivers do, and leads to a few race conditions that need
to be handled.

Instead, create the DRM device when the underlying PCIe device is detected
and destroy the DRM device when the underlying device disappears.

Use KOBJ_ONLINE/OFFLINE udev events to signal to userspace when the
underlying device is ready to accept requests, or has entered a reset
state.

Carl Vanderlip (2):
  accel/qaic: Increase number of in_reset states
  accel/qaic: Expand DRM device lifecycle

 Documentation/accel/qaic/qaic.rst   |  9 +++++-
 drivers/accel/qaic/mhi_controller.c |  2 +-
 drivers/accel/qaic/qaic.h           | 15 +++++++--
 drivers/accel/qaic/qaic_control.c   |  5 +--
 drivers/accel/qaic/qaic_data.c      | 16 ++++-----
 drivers/accel/qaic/qaic_drv.c       | 50 ++++++++++++-----------------
 6 files changed, 52 insertions(+), 45 deletions(-)

-- 
2.40.1

