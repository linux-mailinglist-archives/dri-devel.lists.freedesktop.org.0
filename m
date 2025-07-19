Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DC7B0AF6F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 12:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E8910E1F8;
	Sat, 19 Jul 2025 10:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfJfo+kU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1112210E1F8
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 10:58:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4exMC004952
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 10:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=TLTt+Kgzxpnjy4kQuQffEI
 bf+wnIGYH4UxSlHglzY1s=; b=LfJfo+kUy5MO8WMEi54kJwS/pUpeyHOOi+JPg3
 k66BvGATJtKnxbH7JcvO/XY4LTGF/8rLpilBYpaF128Df17cWnU281NAjM9eToDi
 upXUb+1Ul8OFJruvidT/Aa72oqhsQM9Q8f1ZZyRbw0t1Z/+L2EzmPp4sb7uKRXUg
 Qd+qs+oaFBl9hm30Xj/h22i/AdhWGJ0ZjMf0LDJ8I7bNdCNp9oGqKf6y2UAnAdyL
 EzzP4aebhgzZ1pkphhIEaJjTInVbnxuDNVPP/BLjx+DT7HK01pex48U692ukRIQ/
 EdXEFXtghiQplAjjO3iIIFL9KYcQYxHrDDF8pkGKaxz+wMOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804hmgfkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 10:58:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e269587d8eso505918785a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 03:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752922696; x=1753527496;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TLTt+Kgzxpnjy4kQuQffEIbf+wnIGYH4UxSlHglzY1s=;
 b=uW53yln/A1jFgIrL/ae5BneD8xg9HdrbZzO2sjtlD/lHazarlVrJCgchXAnq9lWMMh
 b+2spdl24OFtLk4JxUlFO6J3kWjEL9slc1Ypg45gnoTliEjrW1qXjTbSB7iTzF+SpEYV
 LzUt+0Z/NQYKSSfT4DuWoGd3A+CdxqVT8u2yocsBxOYs7L5d0CkFcb2WxWbPxhMhrGzL
 PAIgI1Ea+pWF4T1jJRKiCRwWVf6i1CMkng/rqYuIEjZYsWz6Qk0wYo/mYZj3CWmRgGNv
 kFCsDNTdVtHQAQzBEfFu/Jvcur14ZFRlhYYXjG6QL0jUdZ7P3eb4Wp0Jy6CCgJSIvI0o
 ilaw==
X-Gm-Message-State: AOJu0YxkXY1ASs4c4cW3A/OX3KXmJPu9B1uEx15VQ6Juqfbvn4HEV2L4
 N8rVJm36c0WGeSqsDZwpvR/iQULEaqSq1f25kx8ny50/47wdA0ceaN8FivGj7E0wmwaGk3mInXe
 FZE+O0WtGrA2MGS+vAl5ujzbQQu2CCZYAipHvOE2XXnvdHZaIYuf0HFQm3e+NDh+N8LrKWOQ=
X-Gm-Gg: ASbGncttpkNVeuWLZKq+Omk1nt/EGvzisi4qzDRHWY36+DjuT9QcgN2FVKD+EufFy40
 Sj1xKu0I5EPWW3bLVlhVWDH62rrcflbmV0qz0pC4yk3vUQuxPc0LZeIUua0souClkP9DzvQmgQd
 p6wfWrhkT3vsg9B0FUtxNlOPyT+dc36p77XZheG2yq1y3Pkd/k3YXcQObzJ5mfy9KPkUrCnfR5A
 iQ2IqbjTyeK5LvR7y5+a5xDnan5vt20p9RwzLXd/fHVO0ZfwL1C+Xyd+c1PNhfrL97Mvc3qr5IZ
 Hu+s47YJEx1iZGP6D64BcHDVERBkPc3t7vuKxyo+JnKojtoYDrzzst4S0frxLe7DduVDu8BdBQe
 TNMxhMsYaSsMJtH1Ia/Y7XFNVQHaS5j5RFeQF/NMjXHernE/UudVb
X-Received: by 2002:a05:620a:6284:b0:7d4:4d55:98fb with SMTP id
 af79cd13be357-7e34d8bfd12mr1478664685a.3.1752922695857; 
 Sat, 19 Jul 2025 03:58:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY0BHGOUuRUEUNYu555xldgxXmsl3zB0WiVhHizMQZ5e5kr22rMsp4Q/6NKtVVaCuJYMoqRw==
X-Received: by 2002:a05:620a:6284:b0:7d4:4d55:98fb with SMTP id
 af79cd13be357-7e34d8bfd12mr1478662585a.3.1752922695382; 
 Sat, 19 Jul 2025 03:58:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31ab0fe9sm676876e87.80.2025.07.19.03.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 03:58:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 19 Jul 2025 13:58:13 +0300
Subject: [PATCH] drm/display: bridge-connector: correct CEC bridge pointers
 in drm_bridge_connector_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-fix-cec-bridges-v1-1-a60b1333c87d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAER6e2gC/x2MywqAIBAAfyX23IJPjH4lOpRuthcLhQjEf086D
 sxMhUKZqcA8VMj0cOErdZDjAP7cUiTk0BmUUFY4OeHBL3ryuGcOkQoqY4PWJmgnFfTqztSV/7i
 srX3qnAwgYQAAAA==
X-Change-ID: 20250718-fix-cec-bridges-245d334d3712
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8lSraB1kCKp6zUtc5twvZ/O8hG+ysE1xMp6SG4owxpI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoe3pFCOEKIovqef4ooqEXsqP2R6UNGa6ufod0q
 Oro9jU0JAWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHt6RQAKCRCLPIo+Aiko
 1RtLB/wLKH70sl5ZQ72UOzH4bw8bJGnyUEqW471tIUtv3DgpZjr1XUHLDBZ0R/8ePIo4M7nLh4d
 ojyuXRZnESUnK8NEorvFsLzwrpcZoaa/rokSw7fCc8gPsh64T8aSqqqm9PnsbNkSOx/JF6736Ta
 WNU0SIUq3wFqfT/40GfaJIkjJpdVxUvyWTG/+CcX5ZXRZFd11olOQ4isPjOHk0PtBywnb1s+KPO
 EqtUmaJkRAmiGbppXX8zg4vceSUiN0qXTRIQXw/Veq909jz5IC0Hcj97pZGhS/so8Qt5+V8zmaB
 BeZwyCf8vl6VvB/wFy6kMxCAxHLc/pFj44SIEMLzSN8ftePx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 35pW5Glm1YJC02LqAAmFnCVfxx78X9eu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDEwOSBTYWx0ZWRfXzl5Odh/8JMER
 etrnOXEc2A9meivSiAJCKbF/jtGl/jB/M58esY39XRLy9crUGqLGV5aA6X2pJlCrg83UWsedCiR
 LLs2IMxcd6GScMGUxl2BXZ7MPdgjrZDZFG6yJ4/m+eaT8LuAeO6iyTassnhEzW+thCGD2gFAazR
 9E2qu46nnGOyBLG7No1UjUWGaPuwjFGcqwpvJdohTlXOc9NoEm9XNE8KS2LDt4AV8IkhEN+Ay3T
 dNA1ZXeMcsIkmbKH48wRBmprgidU5beuceFAjDW0JYnncFuLgI0guv5kmJYn+jqPHcgEM27pRCs
 MNeaj1m5cBbEZWzjlInjxvw0WTeXQyIVTcXCeUR/jdpLlCg081OWJ7ZdX/El/tkqc23ERAwwoe5
 ZxYIAIEDdwGHIqhjt0RNRGBUfGidHMpf5kDM4pl6HXKMQHEygyciTVnixuhYH+/bzpgeq/SJ
X-Authority-Analysis: v=2.4 cv=Navm13D4 c=1 sm=1 tr=0 ts=687b7a49 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=BxX408-PIYz4yfsoHs4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 35pW5Glm1YJC02LqAAmFnCVfxx78X9eu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190109
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

The bridge used in drm_bridge_connector_init() for CEC init does not
correctly point to the required HDMI CEC bridge, which can lead to
errors during CEC initialization.

Fixes: 65a2575a68e4 ("drm/display: bridge-connector: hook in CEC notifier support")
Fixes: a74288c8ded7 ("drm/display: bridge-connector: handle CEC adapters")
Reported-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Closes: http://lore.kernel.org/r/20250718164156.194702d9@booty/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5eb7e9bfe36116c9618cd3773f1c01e7ebb573be..8c915427d0538435661d771940efe38b462027a1 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -816,6 +816,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 
 	if (bridge_connector->bridge_hdmi_cec &&
 	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
+		bridge = bridge_connector->bridge_hdmi_cec;
+
 		ret = drmm_connector_hdmi_cec_notifier_register(connector,
 								NULL,
 								bridge->hdmi_cec_dev);
@@ -825,6 +827,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 
 	if (bridge_connector->bridge_hdmi_cec &&
 	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
+		bridge = bridge_connector->bridge_hdmi_cec;
+
 		ret = drmm_connector_hdmi_cec_register(connector,
 						       &drm_bridge_connector_hdmi_cec_funcs,
 						       bridge->hdmi_cec_adapter_name,

---
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250718-fix-cec-bridges-245d334d3712

Best regards,
-- 
With best wishes
Dmitry

