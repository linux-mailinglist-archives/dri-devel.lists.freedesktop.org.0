Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4689E4539
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 20:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDF110E1B9;
	Wed,  4 Dec 2024 19:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="RJmuq6mS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89EC10E1B9;
 Wed,  4 Dec 2024 19:59:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4FfhmK023308;
 Wed, 4 Dec 2024 19:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=y6fk9H3NDt759WdvQan1se
 azgqXTkpLD8a9wnOIDlRg=; b=RJmuq6mSgdBytxin4Anl2QpEb4WQPWPzBgHAlW
 n5+4lfoBcjoJ4erS79BrsZqobZQVgqkFMHDqqC3slwT6NUT7sY33oBU4mLvGoLuG
 7r8G71HFNPSkcZcxYP8OhAHl+UJPwJikdXTMZec+arWmC0WWs+aIsCsqaXvYn9BF
 ZDUAIqjpytTdQGN7IawpGRuXiBhCjjaxoANBwNBN/P9/oslySuZN60n9/7oYsE+5
 ph2u94rNqAZYwsPPzP5pvi2uneKoFdLC+dSknLP1P6hTcDaTd7neWKc84sMQsjvW
 4W9o6XgDW5+Pl9OJeyBf6q0BzlNx03IR7OtwabnRPoNGOuxw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj42a22y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2024 19:59:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4JxVIv019421
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 4 Dec 2024 19:59:31 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 11:59:30 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 4 Dec 2024 11:59:20 -0800
Subject: [PATCH v2] drm/ci: add kms_cursor_legacy@torture-bo to apq8016 flakes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-cursor_tor_skip-v2-1-f03bcbc4b455@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJe0UGcC/3WNyw7CIBBFf6WZtRgg1NfK/zCNKQPYibFUxhJNw
 7+L3bu4i3NzHwuwT+QZTs0CyWdiimMFvWkAh368eUGuMmipjdLSCJwTx3R9VfGdJnF0Sh+c22k
 0AWprSj7Qe128dJUH4pr9rAdZ/dz/W1kJJUIbpLV968Lenp8zIY24xfiArpTyBbQMT42wAAAA
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 "Abhinav Kumar" <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733342370; l=1312;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=xWstmY3Hr31E1fOJtGGF/va2mLQR04ZEhwXpM0EJlDA=;
 b=VthJSGD02NrSGUscc1VXqVDgeERAWahgL9ZvP95E8CAo5SILOb5/8KW5/gBXen/7svHqGfNww
 vJIbC/KkO9SDHU7b5d5hs1IaZidGjdOmjZZ293Qc8Nkzrb7EkwBB5MR
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TCErn7gk3O4HiumVDxaWSNPQoMf8NNho
X-Proofpoint-ORIG-GUID: TCErn7gk3O4HiumVDxaWSNPQoMf8NNho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=822 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040152
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

From the jobs [1] and [2] of pipeline [3], its clear that
kms_cursor_legacy@torture-bo is most certainly a flake and
not a fail for apq8016. Mark the test accordingly to match the results.

[1] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481
[2] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430
[3]: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1322770

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
Changes in v2:
- Fix the failure rate from 100 to 33 as thats the accurate one
- Link to v1: https://lore.kernel.org/r/20241204-cursor_tor_skip-v1-1-f5f0bba5df7b@quicinc.com
---
 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
new file mode 100644
index 000000000000..2fb192c92559
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
@@ -0,0 +1,5 @@
+# Board Name: msm-apq8016-db410c
+# Failure Rate: 33
+# IGT Version: 1.28-ga73311079
+# Linux Version: 6.12.0-rc2
+kms_cursor_legacy@torture-bo

---
base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
change-id: 20241204-cursor_tor_skip-9d128dd62c4f

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

