Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8538785E3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 17:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3717010E833;
	Mon, 11 Mar 2024 16:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kDU6ejAV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4294D10E833
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 16:58:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42BE0Pk8032728; Mon, 11 Mar 2024 16:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=rpcthLR
 0mBvq8qMKT3UoYrbDIjogMGsET5ftEho9vrk=; b=kDU6ejAVquPjAtkQywgdg4t
 x9sQ8jMMnV5VeIfSFZd5Ysf0KMGGQ9k0Ut0irlx+cguFpEigp23KjOy1TCXkn7L9
 3kWG3a7IrZtugKgS0YjAtXZXLapH0i8oVDHqRoOFEsdRq8YUUleTaGVb1UJsNsxb
 EWyRGJdZdj5zbbW+/fhFE3xaqQLoNIqTTfns1U3W29rq78R01QxShaw4Kx8elD8h
 oa/7uVh+0mA3rOKMagKZ3N0XzMZpfY4dXT3YJxuN309cou4N3clCaXFy7FRQbY09
 hmyuGZL/I2s2hMYM/qA68IHxocUu1/JEmP1nedePG9dFKVlsztO6y07sumr4Jkg=
 =
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wswrssgvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Mar 2024 16:58:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42BGweH3011643
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Mar 2024 16:58:40 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Mar 2024 09:58:39 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 0/3] accel/qaic: Add debugfs entries
Date: Mon, 11 Mar 2024 10:58:23 -0600
Message-ID: <20240311165826.1728693-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: AD-Dn_zBAxR9Hku_6v_hNxnm66COyOSO
X-Proofpoint-ORIG-GUID: AD-Dn_zBAxR9Hku_6v_hNxnm66COyOSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_10,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=742 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403110129
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

Add 3 debugfs entries that can be useful in debugging a variety of
issues.

bootlog - output the device bootloader log

fifo_size - output the configured dbc fifo size

queued - output how many requests are queued in the dbc fifo

Bootlog is unique to the device, where as fifo_size/queued is per-dbc.

Jeffrey Hugo (3):
  accel/qaic: Add bootlog debugfs
  accel/qaic: Add fifo size debugfs
  accel/qaic: Add fifo queued debugfs

 drivers/accel/qaic/Makefile       |   2 +
 drivers/accel/qaic/qaic.h         |   9 +
 drivers/accel/qaic/qaic_data.c    |   9 +
 drivers/accel/qaic/qaic_debugfs.c | 333 ++++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_debugfs.h |  20 ++
 drivers/accel/qaic/qaic_drv.c     |  16 +-
 6 files changed, 388 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/qaic/qaic_debugfs.c
 create mode 100644 drivers/accel/qaic/qaic_debugfs.h

-- 
2.34.1

