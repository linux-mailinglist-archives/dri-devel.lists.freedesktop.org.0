Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC3F89463E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 22:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD3910F513;
	Mon,  1 Apr 2024 20:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gWUhY/nD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF9810F512;
 Mon,  1 Apr 2024 20:49:30 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 431JQQrU010966; Mon, 1 Apr 2024 20:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=SDPpPZr
 Ybjlj5SIHl69Y3/3Hon0AHxjShyC0S7sqTuw=; b=gWUhY/nDw1O3b2HSJpQdJ1S
 YLecUNRaBOdOmUCT1FsK7GcH0MCJacbe4K2KKMjypFqphpo9q6zvpIHfDFiRJTpn
 hVmuGtYstGQvCtIWILH0zktBsJV5G/bN9eYwxI4fY0D5dK6kEEdNnUoCOcH4jXTp
 52jDKptCDyrTb3Bo6tXIWxf+dE4I3WzMwOCQHw8O+YIvJRVLqURvVVZ6YIPUCKk6
 /f7mC9YYjhc3gUrvUYLQ9xI9rb33rythwSWizub8ZFygUxj4/iQNJ0bAW0bekVU5
 ggPT1uKZS9f6Mh+19isyr6EUaInRhg5QcdP75bSk99a7jNOTbhqHl0H/hcvR6Jg=
 =
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8320r41y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Apr 2024 20:49:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 431KnKoA003393
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 1 Apr 2024 20:49:20 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 1 Apr 2024 13:49:20 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.koike@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: ci: fix the xfails for apq8016
Date: Mon, 1 Apr 2024 13:48:58 -0700
Message-ID: <20240401204859.24223-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: WUNq6n4cZHd7jJtRqt-PHtW2RFpAY2OW
X-Proofpoint-GUID: WUNq6n4cZHd7jJtRqt-PHtW2RFpAY2OW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_14,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 clxscore=1011 mlxscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404010145
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

After IGT migrating to dynamic sub-tests, the pipe prefixes
in the expected fails list are incorrect. Lets drop those
to accurately match the expected fails.

In addition, update the xfails list to match the current passing
list. This should have ideally failed in the CI run because some
tests were marked as fail even though they passed but due to the
mismatch in test names, the matching didn't correctly work and was
resulting in those failures not being seen.

Here is the passing pipeline for apq8016 with this change:

https://gitlab.freedesktop.org/drm/msm/-/jobs/57050562

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index 44a5c62dedad..b14d4e884971 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -1,17 +1,6 @@
 kms_3d,Fail
 kms_addfb_basic@addfb25-bad-modifier,Fail
-kms_cursor_legacy@all-pipes-forked-bo,Fail
-kms_cursor_legacy@all-pipes-forked-move,Fail
-kms_cursor_legacy@all-pipes-single-bo,Fail
-kms_cursor_legacy@all-pipes-single-move,Fail
-kms_cursor_legacy@all-pipes-torture-bo,Fail
-kms_cursor_legacy@all-pipes-torture-move,Fail
-kms_cursor_legacy@pipe-A-forked-bo,Fail
-kms_cursor_legacy@pipe-A-forked-move,Fail
-kms_cursor_legacy@pipe-A-single-bo,Fail
-kms_cursor_legacy@pipe-A-single-move,Fail
-kms_cursor_legacy@pipe-A-torture-bo,Fail
-kms_cursor_legacy@pipe-A-torture-move,Fail
+kms_cursor_legacy@torture-bo,Fail
 kms_force_connector_basic@force-edid,Fail
 kms_hdmi_inject@inject-4k,Fail
 kms_selftest@drm_format,Timeout
-- 
2.43.2

