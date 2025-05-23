Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0365AAC29B1
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 20:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C7A10E85C;
	Fri, 23 May 2025 18:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dW5Gx9Ne";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D680410E0BD;
 Fri, 23 May 2025 18:27:41 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NACJPi013417;
 Fri, 23 May 2025 18:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hFAaKeO5PhbDWINfyNgGobfdIMngVF65rCxba/gRUnY=; b=dW5Gx9NeFUoFRJRU
 tld2de2bLXLJZXyTr4GlovKX+ZlCZr7AG0oDv/KhHT6xB6YvqfnBwWL4ojCZDTjc
 Db2PhbBYDx1SawgHkyX7d1rzRHfv4Hh8PYTH1wpjE5AXVPHpmE8mkrpyl0nwPw3/
 5mswPMqR3KqtTOe7M/sR5Iq0A5G+RAXz1vShwKOO4md1ZushfqjfTl+azdXSkN3G
 pkel+1b4J01UtlogHBwZ908x+rE/0V5INbSayGeYfKUKJU0uyYPtydM0hFYLsXHF
 Jw2wCBNaool5QYxG/YeApyg72NOPOAV5QQfjPaDhnH9YxJYCVVrhFXHq18JzOWOk
 XY2+7Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5k52f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 18:27:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54NIRbv8019489
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 18:27:37 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 May 2025 11:27:37 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 23 May 2025 11:27:26 -0700
Subject: [PATCH 1/2] MAINTAINERS: drop myself as maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250523-maintainers_update-v1-1-0396d439d6af@quicinc.com>
References: <20250523-maintainers_update-v1-0-0396d439d6af@quicinc.com>
In-Reply-To: <20250523-maintainers_update-v1-0-0396d439d6af@quicinc.com>
To: <linux-kernel@vger.kernel.org>, <jessica.zhang@oss.qualcomm.com>,
 <lumag@kernel.org>, <robdclark@gmail.com>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748024856; l=959;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=ywLJeoXUiNKXH78l5ltsqvHLQhBhi227sGk+1sr2kZI=;
 b=IrpiyfvQ8TDL8oBVwGCg1pQqJt0P49PQwWuV0OjWNDembgAcEsyya1EwXgSo4BrVYG7eOIHF7
 Dk7qMmSYibUD2CgZoX1OwAaKHtZTOLshT78dcAJqPrkInmxQKilGfPi
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NyBTYWx0ZWRfXzO6JppbQsrzO
 Str1ACU+Bx4Rkco1DlXfo/CIwSK/RursvyDfiVrKzrWKzU8iJ+84Mh2rQ8+qlpT/D8TV3pbO0Wb
 8rgQGwu6WRl/dLxSe8GcZx8UyQ6a04UpauTOsEX1fZRJ1s++eG1wvOSCuf/+oS4kiBMGJ9NC/AK
 nvzULY2udrkwVw5RCm8GqlFeJ/i/tvHIBlz/7PVKLjsrZ9wVpmptZaww94IyLVw7bBuZAIuJGfA
 iP0XwOYVi2Tiup4MFrUGYmH89rck0W+hhn1vCD+9w6wwsfkWurDF2wfVyApzeF7mo2mN2UnNVxx
 TdToDVh09N9hUz2ol7CJMxApKGeN10niUpaRw9xFLnxjwxW3qrDnXj7wX10pBDkPQVTw0jLxUM1
 9bAOIApPpWEkiECSub0JSUIjK9gehg8Ma8Dx5nhNGXNg2PgLFwZ1KY7Y0ThncWtZ5fP9smr1
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=6830be1a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8
 a=Fi2JDnilOXRJ-d80Q7gA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: yUqDXkNgnS7TY4WSdO5gUbOHGMeEXRf1
X-Proofpoint-ORIG-GUID: yUqDXkNgnS7TY4WSdO5gUbOHGMeEXRf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=891 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230167
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

I will no longer regularly work on this platform. Hence will
step down from maintainer duties.

Also, add Jessica as a reviewer to the MSM DRM subsystem to help
out with the reviews.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90b70f37006dbbf3baaee2c7a481e4fa49bfb3f8..3bc0da6f9033be0d5da35210a84ba189be4e5c0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7638,8 +7638,9 @@ F:	include/uapi/drm/msm_drm.h
 
 DRM DRIVER for Qualcomm display hardware
 M:	Rob Clark <robdclark@gmail.com>
-M:	Abhinav Kumar <quic_abhinavk@quicinc.com>
 M:	Dmitry Baryshkov <lumag@kernel.org>
+R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
+R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
 R:	Sean Paul <sean@poorly.run>
 R:	Marijn Suijten <marijn.suijten@somainline.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.34.1

