Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F4AB54B33
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6995810EC19;
	Fri, 12 Sep 2025 11:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLLgVOkZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C553210EC19
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fP8G012880
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 59rj00Uo3zScXl9anw4BJDMpejse5yew5Wz5zTlZCs0=; b=ZLLgVOkZwD/EGXgm
 dwIgV9pApQ6cleVbKK/6af2p+jTjrCAf0btvIdQt1Gq59Q5onQ40i0l2fftMY0Uy
 bYXxTC6pMBGGGs4MDMse1hoxCl7qp6s4827o67SpP4PAbhtr+jV3JYHrQY2OwN4p
 +hZnyDluBu46ibXlKN/9NRnC7B9mpX811b0UnyHrT+iId5//9RRiKOYpUt7tpg1g
 5L21OvWn5MYRQFRLU318bQmJ0Jh6AflzMCYVB1+B+bVsc5tPp9Dqpi74fTmuBmlY
 7trrIUyTiD7WZIyDymViiP2uZl4hXwgx8scU7EBpA6nh4WkqaEOG7tEda/MwlFH2
 ecN2Bw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqgb748-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-329be00e966so409598a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757677184; x=1758281984;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=59rj00Uo3zScXl9anw4BJDMpejse5yew5Wz5zTlZCs0=;
 b=DbFfHGarB5nEA3URCvYgrqC1h9mi/6eH2rLWvrvRtWVsC3sfih0sKipcXrWJXYgyJK
 2k2Pxbf9oA7ZfxL87G3ewZEdCjN9OCxTwZZoKMAaZN38TxRCpB9PmAa0y6xtjqS0kVZY
 hYp9q+t3YFAZktldgTU71dUI/JOICeUzzVo2yUHhubjWIEeIzJ5mieL7G5+hf9gVH3jY
 19kmpHOhK/pn7sagcYksuiBzc6eh4zx8X/mCI+qkhKf5ll5Xh5ISAnL9tawK9pkdAwsk
 Kq8qcGGpI3XD0cncbsdVqxpv3KilLs5pFUfynPpnYwU/GMin1HVy86N7BdLqMZZ80Ysl
 GyQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTl44UsPSgWn21H+x2elAnbaOLSqzMNVyOFDz5EUfGPhFI3A/xVsfZPqhZ87SaGTQoRWaxH+nE9eU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuTw1a38wUnVGwSSofKpDTK/h+sepceX85PF/1Dfh3KaM+tPfU
 1rMFRCgb73CaBwta1jQHMIg6dDlmqLhVqSMYNxHSDlAkJx3A2WmRWRX2PMnuUM/U1Bj0xd+MG91
 TfqF8RvBh19skHDIrRHB4FBAlfgH4j6NGgyy0p2jSeZhEhc6T0M9pmtqbp0sFypDXUOTAFxs=
X-Gm-Gg: ASbGnctY095qWVO5dFQNz4OpV980pwXrTOgP1os4SAJDKWQlakx4W6BL8LZ5w1tTHIt
 xhCpHuac+m7makSga3J1lUEPPHuSDgyYgcCgewtq0F9RN+S9iOPn0qe61gDmwbp3sBJMKWqjtu4
 Uk0ajFCt9DIRHzUPw4JXMi3tSZzJZ9Q7g//EA9A3hvICGvuraaOASq2C1f92/PUnTXioGs6wTDf
 c+c6z/VNrnxI5a4IgqGduqeTnCsSS3pS5jPj5loDqblkSyzmM+UQxayULIXdDgNpVBEAfOT5ozF
 /xiCkPlqXZZI61bdcUI7dWswxaMRq93/jyEXMSfGiKbPIa5S9KvCn7OjegQKfsPLgsZzKdJwjFV
 D/srf+jGg95+HgcP3O7QeJFbatoydStwSRtP3VnyjI/mvKz7I1n5XoHfc
X-Received: by 2002:a17:90b:1c8c:b0:32b:87ef:5faa with SMTP id
 98e67ed59e1d1-32de4f80998mr1685177a91.4.1757677184270; 
 Fri, 12 Sep 2025 04:39:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN8J7dSHJlf1bK3eu79lm+dW5G5Xfjiiq4Mp8bFzHbfNDPDpKNxRTqTagtKWQGq9O7pdVh8A==
X-Received: by 2002:a17:90b:1c8c:b0:32b:87ef:5faa with SMTP id
 98e67ed59e1d1-32de4f80998mr1685136a91.4.1757677183700; 
 Fri, 12 Sep 2025 04:39:43 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607c45e34sm5278760b3a.91.2025.09.12.04.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:39:43 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:39:16 +0800
Subject: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
In-Reply-To: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757677171; l=1295;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=iXID0C097LlDUB/zo7wU7HLlfkLmr4ASRlNP6RgIyjA=;
 b=CP5uTwRTZhS0ty2t+/L3sSCKvXc3+Xx3YfkllA0kqvsxBtN84bm7Wx5HahYy8qmEBjjDQ6yiA
 coC/qz/R7eIA9rz6ilS1Q6EwxYQAyEH5WSf4CprNO34jp9ZMzzCVT7I
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: na8DjwdNpK6CpA00dR0Bq5LtsnLtVGMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXyam0S15qnHrp
 TRyAVR3sVkQbB803v0snbi7QPKAqJN09lSeoHhUvsAjd1mB3DTIGb06JoBQJCeJUnUfmEinZLaw
 3brg83Gv4SJzmZpa1pYu9JX1cdbRAs47+rqwk49mu+2iIywbdUtpOn/n8HRD4OAuMKJcXPH+7Se
 om5TezCy+uKXk+jmy2DSOJq8GC9y7tR+IEIQSi77Mdc1u90D8My6nYPzgGJ2tR6X9U5/bcDn3l5
 oAU7kVtvXh313iOCnVdsVlZsp5AuX5Q6UWG4dfaeV5U+iRcNyoraCPkZtOoi3uBhMwbEnsHscRr
 uLoAn5bI6NYUkTkHz8pPCBiMIe9p+b4QzSCOumSzCxf0NrmSX6vq7T6DHKnBYbEYcaalAtREhJ1
 9lcEr7oU
X-Proofpoint-GUID: na8DjwdNpK6CpA00dR0Bq5LtsnLtVGMK
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c40681 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2t1bcwrjeadYucq94KYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

Add DisplayPort controller for Qualcomm SM6150 SoC.
SM6150 shares the same configuration as SM8350, its hardware capabilities
differ about HBR3. Explicitly listing it ensures clarity and avoids
potential issues if SM8350 support evolves in the future.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..2bebc182ffe348fd37c215a6bf0becea11e5ac15 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -46,6 +46,7 @@ properties:
       - items:
           - enum:
               - qcom,sar2130p-dp
+              - qcom,sm6150-dp
               - qcom,sm7150-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
@@ -261,6 +262,7 @@ allOf:
             enum:
               - qcom,sc8180x-dp
               - qcom,sdm845-dp
+              - qcom,sm6150-dp
               - qcom,sm8350-dp
               - qcom,sm8650-dp
     then:

-- 
2.34.1

