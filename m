Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJVgJtaooWm1vQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:23:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B6E1B8CE9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE48E10EB94;
	Fri, 27 Feb 2026 14:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmS912TP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEtUy8gh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3524110EB9C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:23:14 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RENDrm1798215
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=LbWv1DraxFhV/1oko2gTlG
 J9gvfW5tsF984h+FYSIgg=; b=TmS912TPM8oZ0T1JYYWp2+GYljZJJQu1/xudc9
 HFvah1a9ToJEJwXgBOeIdUCULeHTsAPS3VHsbv3TaRltqzZjwrTvWVaO0vpEfZEo
 aUwzFCKXGLknRMCSGZZu5Fsmzas52i7UDLvTI08fqCAFHhqvBoCZbCNET2sHokQI
 uAClhIFEDZhK0rkZKhGerzE1kEYrOcU4+Am9c9GGduudzkrqUEiKBlt0CYK0m4Ye
 AUpxQMZFEPLkSLw/uFVKWtTgkFzgIScKYv9xBjcpJG0N32R/g2ty5cUDPpOGt6jT
 PczM88Ii7Zmo+/Cv8ZuzjmS9Y6Lec3627tgY7htdKiyLrX/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjx1xtv98-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:23:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8ca3ef536ddso1959504485a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772202192; x=1772806992;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LbWv1DraxFhV/1oko2gTlGJ9gvfW5tsF984h+FYSIgg=;
 b=QEtUy8ghYAipcRaQp+fzkzJjIPw3qkRjX/0y7Mi1M6DVQ5ue1Q+e1ZfkQovF2dRF5u
 wERKML/25hBWPmXWu7s+GpPdpmzKti6EpGHKUGkkP6NIogvkvoYCArR2qGinjddkb2ts
 AKQPJ+Ws75c4x9sblFUSfls3An0XGPZFFKRx1nHVB/fjw0Yod5Y1S0IjgEUXlK8p11sz
 WbGHS5E4RuB9ORM6PpKeQa1kD13curUdz96I6NiiF9DZIAkqWcat0Rvr8ZlvM9zwysgi
 6XlS7IA2OxytxI1dnnGD7Gyeo6opvrkxd+aeJyiVk6iZhk+1DtTUlW28QRTlzR/FLpqH
 xhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772202192; x=1772806992;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbWv1DraxFhV/1oko2gTlGJ9gvfW5tsF984h+FYSIgg=;
 b=mALb3tEN+pUJQf0E8lKdUAu5v82+GtaQH9PTZ/a/WASWyrOe3sp+ayKDQJVHro2vhv
 brLT5r9sT1Ix3PKJqqHyqWajzdecMZxm+Diakz9fqpSq3D1mSCzTg0X2mLtA7hOTW84Y
 QIEsYb/B3Dzt8czhlDzxoab8kqwikt4YrmM3tpkbzgP/ClBN4Nkh6NR0YRt50QXv9XLY
 GE2/TW6C/G5qn43RusaVa1G/l9pR2/AJFC+O2532bEM28Toyoric1p8mED46TG3r924d
 n5k/QnT0j/6CUtBmPpO8o0iVtYgKSn3Z0TksNTsCcbqdRwzkgDBCFHo+HvwAI8DWdFpT
 ZnZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL1eEs5aU3mRg32eTZrVr6mu0ZDfPzIG5X1vY9tTsEjRm1bjvfag0IBKTx0utqHD2VrclxHTb4SRA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy438ayWMtRrX88PE1tdpXNquy2aUfD5aiCrP11gQfAuOkbAtzG
 2/YiTXTkSP/hjhsg3dwZXvqEF91x/fMZ3WFiiT84YbDbHo4EzSlCVwE+5KMAQJv0XrXiQqIRcqS
 9QSTNUMtQq0NwDh0iJ6mhYUg5de66csBGoUOCqJxMUjWv9EgeMCQ4fHAQ2S2Y+nG5nIBMNyw=
X-Gm-Gg: ATEYQzwG35k6AFVOSP995MlJyLb3MUbZa4DnPxDH41F3i6/56ddeB/yPG1WscId1K4M
 cv3iyvQDRFYGoUPlFIUEjoX2oXTCGq4HKIoc4NPPaw+3t7lR3CRBU7C8obQ2Orm5du/7qUOMUIq
 PHlKrSKAE0t39azkVKzqQsE+m4dekMGwmmjv0wFZudBTFLW43jByl8nkgKlrw9l1Joi/QT//gKn
 EPSVzjLBPDqltfeLH3deUQgmB2jm4vyF2CcpiSKBQw90xIUXLQsdLhgutdpsiLaDixndbusDJid
 akjkrtUI7do8L20DZfKHXMDtK1rcYLfpjzDfqj1MMCLZNyuh07HJgm4GMZW503cp5z/KiWNopXu
 WiN4fD1VislBxR++7OJr+xHe31d9KEg==
X-Received: by 2002:a05:620a:4505:b0:8c7:d2b:b5c9 with SMTP id
 af79cd13be357-8cbc8d834d9mr328562385a.9.1772202192438; 
 Fri, 27 Feb 2026 06:23:12 -0800 (PST)
X-Received: by 2002:a05:620a:4505:b0:8c7:d2b:b5c9 with SMTP id
 af79cd13be357-8cbc8d834d9mr328558485a.9.1772202191836; 
 Fri, 27 Feb 2026 06:23:11 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcbd781sm120204765e9.8.2026.02.27.06.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 06:23:10 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 16:23:00 +0200
Subject: [PATCH] dt-bindings: display: msm: Fix reg ranges and clocks on Glymur
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-glymur-fix-dp-bindings-reg-clocks-v1-1-99f7b42b43aa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMOooWkC/yXN0QrCMAyF4VcZuTZQizjmq4gXNs26zNmNZBNl7
 N2t7vKDw39WMFZhg0u1gvJLTMZccDxUQN09J0aJxeCdPzvva0zD57kotvLGOGGQHCUnQ+WENIz
 0MKzdKTqiwNw2UDqTcln/P6633baEnmn+hWHbvje5QwiFAAAA
X-Change-ID: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2234;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qiHSzVHBwmKCmpWxCLWKkvn6EVGayWKBpsn+FNXo6ls=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpoajGiWV89MPuotO9j0TY9byhHx2MtflA2zy47
 idxX7lWc1CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaGoxgAKCRAbX0TJAJUV
 Vr9rEACSpY2faiOnGoMe8kzSd6PPC1vk5Lhem2qn7I5lzQiTwIU5M4S1kbzLpT5wYDWRjvjhBcI
 toEwyTpL8I/XsVi6s99yODDmyHebSPdTzrtpGvPpJzLgtBkKThB7pJ5hq9Kx7M15GfO9LllzYUv
 bLihWNPYWrQkaqonzlMhz+fm5SiH5ELbPpDrz71CTZD3ImLg7eN5XP9YS3K+OV0dJSz/LnddKe/
 +1PSUZM8/HLrjeHPKzdaO3rhp3IYRkYlO5+Q1nCL2unqNtFJNpg7ZKMYM6jKX3r3Ru8jJJj7PxE
 Kb1Ak3mCCD0BHFqcDdZRcwlTV7i9WUaCeHGu+01TImDY6IdQs68d4ysn49PANwloB3siaOkw6fs
 YsqHcuhI1N7Ujxbgbu7zB513FrJ1/21SUsVI22c9F0lKAR4HrHbBsUOplAmEEvlzn8XHU5FCEbx
 HaLIrLbB1Ftpw0cRgt2vNxMmNgl1CwrAgxvJNV++e9gC93a6xxdLD6gIEiTfMSGOsC7gBzTvp6r
 sXsLPuUfzG96aRpmKG6YvmZcSkWmWFgHle+dxO69kXw96UcpMM5UN9tm0zlsmc+QwH9z1WAeKXj
 cCtM5cNzwq5I73QXh3azZXJq2yW1o5ekJLewh3V6mBGACNw3dK4ciVgoXLoEvP3r48Ag4A/sPZ6
 EyT0FRCQFE7x5ug==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: KngBOFYcCEU5NlOwVRwMOgR4uy-lQpfC
X-Authority-Analysis: v=2.4 cv=Vtouwu2n c=1 sm=1 tr=0 ts=69a1a8d1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=feC5BgBSBr5ATEYaNTcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNyBTYWx0ZWRfX7KzE9032B/bt
 k35BK24DTtWCFDEQznX8raKf3TuiPiYa56ElNSNjuTM2ePB6a6iLnWSUuOYC/M4DAJdP6IFf6tp
 ZR8+xDDk3r4J2kbRzicgYvl6/RCTD1ZdTDyUtW/Bs50N744m6zB9TKO4G4QmCUYdp9/f2+g4iTU
 ckqAZxeKZQUGJIoyERpH8/q/183ZuVw5zEtBzRVYSHZDrUPaJ70ob9zS2OSGVumxTkOw7Ikms5f
 JjXli8d8AtmHcbRDWzYnkyUaLykhwtmrM4f8V2TXQASZmAsOk520XG4EArOvy7VK6HELWlYzmzU
 CRcUDY8hGobcRq42Bsiuk8lErZ33EChMEGXjCeFZDrH3l0zWNQEl7SplqXfnGOmHg66MzeGZQ6J
 JnqFTwru+nn5lbVsr443budsq8IWiBQlvYlKEOMeUK2VQI9AkV9+26BDEdklTEuYlDU+s4uwO66
 nXLe7ZHCjf94syYWThA==
X-Proofpoint-GUID: KngBOFYcCEU5NlOwVRwMOgR4uy-lQpfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270127
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:abelvesa@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: E4B6E1B8CE9
X-Rspamd-Action: no action

The Glymur platform has four DisplayPort controllers. All the
controllers support four streams (MST). However, the first three only
have two streams wired up physically to the display subsystem, while the
fourth controller has only one stream (SST).

So add a dedicated clause for Glymur compatible to enforce reg ranges to
describing all four streams while allowing either one pixel clock, for the
third DP controller, or two pixel clocks, for the rest of them.

Cc: stable@vger.kernel.org # v6.19
Fixes: 8f63bf908213 ("dt-bindings: display: msm: Document the Glymur DiplayPort controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml         | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ebda78db87a6..02ddfaab5f56 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -253,7 +253,6 @@ allOf:
             enum:
               # these platforms support 2 streams MST on some interfaces,
               # others are SST only
-              - qcom,glymur-dp
               - qcom,sc8280xp-dp
               - qcom,x1e80100-dp
     then:
@@ -310,6 +309,26 @@ allOf:
           minItems: 6
           maxItems: 8
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support 2 streams MST on some interfaces,
+              # others are SST only, but all controllers have 4 ports
+              - qcom,glymur-dp
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+        clocks:
+          minItems: 5
+          maxItems: 6
+        clocks-names:
+          minItems: 5
+          maxItems: 6
+
 unevaluatedProperties: false
 
 examples:

---
base-commit: 7c21b660e919698b10efa8bdb120f0f9bc3d3832
change-id: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

