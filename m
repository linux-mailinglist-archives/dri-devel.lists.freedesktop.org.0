Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDE08476FF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 19:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C6F10EE49;
	Fri,  2 Feb 2024 18:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cK7qwIBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC9510EE49
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 18:03:36 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 412FPhD8023312; Fri, 2 Feb 2024 18:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=Una
 7WlYaez5PmcWlUF1uNafCq9+QjpMwZztlXuDyaFg=; b=cK7qwIBcwzJt2qFd0yW
 qHcOvug0IQasDxrWE4APSd1eN8iRLcgjHgXY0SJg/jDSlbKWYMSByZl8aALhyc5o
 OSf1HYUsDIWt47gwTkelTFQhp4hxaCVXGbYp+cAt3rXrnLjapbbW4FEKowzdgZEa
 g8v0aHf1ituGeBFMSncs00x7cv0r5DnDj12MYVwbl1GsUvFHfilGsXtYaPyWxHyE
 x5lsUsBXf0pKQNaDZgG7KqgnzrLBKza5SeDSSeiBxD3Kn4sOGYgw2bXdtWLFsWh1
 pxi55q6Yc6JtEzHuh7r3qQPTPTFXgGSsssbnYmVddTbChx2DHvHoY5Rmy78oCLIf
 XQw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0ptvj269-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Feb 2024 18:03:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 412I3QAv015830
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Feb 2024 18:03:27 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 2 Feb 2024 10:03:26 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 2 Feb 2024 10:03:11 -0800
Subject: [PATCH] dt-bindings: visionox-rm69299: Update maintainers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240202-rm69299-maintainers-v1-1-423aa40f344f@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAF4uvWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDIKFblGtmaWRpqZubmJlXAsSpRcW65qkGZpZp5hbGxiZpSkCdBUWpaZk
 VYFOjY2trAbVABZBlAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: <quic_abhinavk@quicinc.com>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-2d940
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706897006; l=1230;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=kzlBvr0aP/B5FRnAIbvezcL3LTjM0zwGckpQKkSHedc=;
 b=qQpgZM8HQmHnxJuQ4l4mhjgIvdWxD/GfFXRYqXUuREXsHNV8hAdSg7cOZ/Isdn/MGSIXDPM1F
 W/hcrGFTEQWBTbYgh9XnxnRBFrClocNPEaT3OFewODBb3eKw8HnXOui
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vTpHZNHFYSI8YyLMPeYrtWc4yuLnJWCN
X-Proofpoint-ORIG-GUID: vTpHZNHFYSI8YyLMPeYrtWc4yuLnJWCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_11,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxlogscore=882 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020130
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

The current maintainer (Harigovindan P) is no longer reachable through
the listed email. Update maintainers list to be Abhinav and I.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
index fa745a6f4456c..7723990675158 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Visionox model RM69299 Panels
 
 maintainers:
-  - Harigovindan P <harigovi@codeaurora.org>
+  - Abhinav Kumar <quic_abhinavk@quicinc.com>
+  - Jessica Zhang <quic_jesszhan@quicinc.com>
 
 description: |
   This binding is for display panels using a Visionox RM692999 panel.

---
base-commit: 51b70ff55ed88edd19b080a524063446bcc34b62
change-id: 20240202-rm69299-maintainers-7e069f78334f

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

