Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AFDB595CD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 14:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA1D10E646;
	Tue, 16 Sep 2025 12:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUyLFPT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B1710E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 12:11:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA0stP020559
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 12:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=I/1QUiWOzVEO3VoHMdH+VY
 /0cv7c//ZqTTeZogz3nHQ=; b=bUyLFPT12tjtAzwgTMPn3I3T2WZ7iNGjVHJMMQ
 SrYwZskuxRslLu+y1pngDjZdKlTX5tne9cQhgc742xk47DJpMFScSmcpJysro6W2
 v8UIV7/cJ4vn+Hz3t6QPhONHmUHWiPDYtAcsCDXUvqE2oBzLi3jEUg+Qimhsy6jx
 nscsgl93QZAvYqedv8Ixxcl0ep/xWYtbqGj1zUYoAGnA7svkiiIGbVoEs9Cy6zhd
 1sbHM+t4cZhoNEkO+o6CdQELMcuzrzNEHcuTuoEpRq0rBOgdd9/dzcjtC6I85DDg
 Oj5AOPaQqavJDb3sCIbBQCp1wHxZxGMrkyxPt7del/a/7gaw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1sm9tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 12:11:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2645223059dso2619245ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 05:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758024688; x=1758629488;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I/1QUiWOzVEO3VoHMdH+VY/0cv7c//ZqTTeZogz3nHQ=;
 b=Z4zY9fU54Gpmjb78czCofMyJQ8ChMNFf/GH+rWX8U/EADOAqWoPEEYz3TlIX2JNYBd
 WDP+Z4pKTkru6hxVpRSGE2jhg0yMZiBA6y3SexA8/eepwQeWGGlfkXyY9dYQtvO30Unq
 g+dcemSPUrkYB3ObTOco4tkmYMxc2f6MunjzQk6Zob1YCPWfhUPrkttHOqILA0ZuIBRa
 A0dFLnjT/d+KRnY/GuwoWQE+DRmjjw8Sv+b1QroV71QF17z/1Jv0yFniWitgw4gkFLT4
 /QAubU31nbTrf7SueuAbbScf1rBBZkm0bKWPr9BJZsONaiqMv27xTtr11CXzOJO0QGqn
 t2sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU98yPHUkSWX2L1G5EDpVCu0zhMjJTxO/0BTzzLdU3W9Po/1sRDpgcxQiBrImQzI7IttFXFGCWeagU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjwV+ZqUUg2MyTctoK/Ry4EiQJ4mJzqlqfHm3ZFcaM0kmh/lU2
 QBsvsoWlELRYJtdRQsmE7LgFoxuEV80uZJ6ywiAD//PA5ypu7zmYf0xEKdWyqolVlYoWObqJXWy
 tjb2B/svnUDzOYTr/iSvIo8CH6ja/Ean+Td+Qa3nlFCAI5J0/2Bm3C/p6L+MEF4iBj77/XAA=
X-Gm-Gg: ASbGnctnl3/mqXSsOZiB/eyXVxYT8oVXEQkSZGiigCKf7Jt42w2CyxDr7xaQTAw433X
 Up0LRL51twfzjVwGr/2Gb2oyV9K8ughADZHvKTWSyx6oppoWds8oJ8RdErON6t8rTjZYpiLtGE8
 LDYHitTdebK/F9PduKEgXWGX5P8liStjaoqjJC5jZyG2SnqwJObf9lRZvPj5Wzl9BGKtx+wMMDH
 bGnOp/K+vZS+NVa5Zteh+bVj+vwspOFv93URSl8hwROtWeh9ODTxsv5EibHjYSp7PSP/3VMUIRw
 6V1e432i9vkKFFoyuo0V8A3dbB0xxmfbeDRbBrYhBDhL8IAhe+EFjnoRspAjSXVgnOQ5UtZ1P1a
 0EH6lSos8Ct42Sg==
X-Received: by 2002:a17:902:d4c4:b0:265:faaf:6786 with SMTP id
 d9443c01a7336-265faaf6aacmr57817765ad.9.1758024688223; 
 Tue, 16 Sep 2025 05:11:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1RFXVSoXe2CpCJjQa/I6g0IBtRjuRx1HyyBA7zcwcg518iVOozlceyedzv3YXnIBdF0x/fQ==
X-Received: by 2002:a17:902:d4c4:b0:265:faaf:6786 with SMTP id
 d9443c01a7336-265faaf6aacmr57817355ad.9.1758024687596; 
 Tue, 16 Sep 2025 05:11:27 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c37293edasm154917085ad.37.2025.09.16.05.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 05:11:27 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:11:03 +0800
Subject: [PATCH v3] dt-bindings: display/msm: dp-controller: Add SM6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANdTyWgC/42OSw6CMBBAr0K6dkhboIgr72Fc9Ic0AVpbaDSEu
 1tITFy4YDOZN4v3ZkFBe6MDumQL8jqaYOyYoDhlSHZ8fGgwKjGimFa4IQy4UqAcSDtO3va99hB
 m56yfoLVpHxipMFS04pJqdZZnhpLKed2a15653RN3JkzWv/dqJNv1G6DHApEABkxFUYpa1KRRV
 xtC/px5L+0w5GmgrRPpr/vg85ECAV0ypngjRF3/c6/r+gE47R2zOwEAAA==
X-Change-ID: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758024680; l=2207;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=gN1Yn0VpAUn7s61raHRdCxjlHvOYYRG1fBqsrSDL2Pw=;
 b=dnWAH94x2hSw2DgxOZu5/hAEMxbWiPfFDHoqjvA9O6N5tyLlk8u82ECscoUEsii7po37OjmpQ
 2qAE0CjTfxMDn/tNwhtFcML/kBMWivwzwELwrpA0amJOZPXyLg+1r8Q
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: Sm_12O3JPJ7RcoqS7UDRL1z0MjdsCsMU
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c953f1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6qpd5Zjz4k7RSA1uLzYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Sm_12O3JPJ7RcoqS7UDRL1z0MjdsCsMU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfX36naP84uUKuw
 FSONEkWtWMqP9YlortxjEzYPtrWCpC+M7LjGFCBXWLCvlZU2LZ56BdAOl2R49Ohnjl9iNj6p8/N
 1D7kULGowZHdd0a9oc0o5BSCV8/HTIRjq6nbn56L+qNirHy1vIuGzwYlQVgjE7C/j8S5nHtm1h0
 gXoazyCGhj08jof/X4b9BBe5DujVdltk6FLWmQ6L8y+aHE4+4B7JqiXa01nh1viNM7HthjF3O0p
 8ghdlB9LpKLPmuzvMmRVLwaoLvjY9nEa44bfMabeFKj2NAAgnUPCqXGLkjFkWJ1GlkXqQZXwFV0
 Er23Lyqx8sjx3pbZFXOlyMBMAzm1fQQDZiZ8ltYMcwYgUU9+1edrVI3RFRRbN5HPoxj5qotrEhB
 LXnXkWH6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098
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

Add DisplayPort controller binding for Qualcomm SM6150 SoC.
SM6150 uses the same controller IP as SM8150.
Declare 'qcom,sm6150-dp' as a fallback compatible to
'qcom,sm8150-dp' and 'qcom,sm8350-dp' for consistency with existing
bindings and to ensure correct matching and future clarity.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
This series splits the SM6150 dp-controller definition from the
'[v3] Add DisplayPort support for QCS615 platform' series and rebases
'dt-bindings: msm/dp: Add support for 4 pixel streams'.

The devicetree modification for DisplayPort on SM6150 will be provided
in a future patch.
---
Changes in v3:
- Update binding fallback chain to "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom,sm8350-dp". [Dmitry]
- Link to v2: https://lore.kernel.org/r/20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com

Changes in v2:
- Update commit message and binding with fallback configuration. [Dmitry]
- Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
- Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..34d5b2984b163ef80501ae403db9c2d7c1c4ac59 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -53,6 +53,12 @@ properties:
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
 
+      - items:
+          - enum:
+              - qcom,sm6150-dp
+          - const: qcom,sm8150-dp
+          - const: qcom,sm8350-dp
+
       - items:
           - enum:
               - qcom,sm8750-dp

---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

