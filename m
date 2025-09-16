Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3687B58F2D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C928010E6D2;
	Tue, 16 Sep 2025 07:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BvlePUOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06C810E6AA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 07:31:57 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3pxpr019791
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 07:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=8CH1PNlJYICaq+xN+m08UU
 ZdW+oKMYDW8S3+NyltR0k=; b=BvlePUOASAWQFxxxwArPgrHIsLPQOk/9m4RglB
 syZOuWTGymdsSVo2xicjNmHKIfvKPst2uMROL4Zx+tOCGv6D7eDOXAchX0zWCe+H
 Qc+RW//UzkHYZuPOyVn/kfJad8Zc2e6HgDuW9Zc0YlMS+CQZ6fXhwYA1XG2XFpPb
 tcXyfMwZzYHksRPYBvPk4kXNf86P5nWIWHX4GYFu+JMk+UB6wtBCtbr+SBZms/se
 oONl5YSMEC7lW/UXn1yL14x6F3Fz3zI5962xBuUqRVxr9WLFOFeBkMdTqAyc20Vq
 N3AS/x6muc86+e9uhfZ4ZwzePQMY1bVQs2ggEPaFk7btS8lg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma7w5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 07:31:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b54b301d623so916008a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 00:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758007915; x=1758612715;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8CH1PNlJYICaq+xN+m08UUZdW+oKMYDW8S3+NyltR0k=;
 b=MzCFcgLELNktKKMi4iFBIum20vTRpE4jAtE0hzpa4idBQqeg3Hg0de23t8N56V59qD
 rGmcN4pAXst4iGgmPX/k1n7HA5noj5L/gUXIfqRUQaQC0mDK/4nEd4bptI1l0hkWfQJI
 acdJJzbBPS4Mdqrz+D/ZBFjGri/yAn22+fRc7PQ2zPHoXlkJa15XD8IqBgErGn21R6NQ
 vchpacsukQBbzg9qjQlRXvygSJw1+eKEV7ZblEeb/jJosigzf8cqTv/RMptTaYgx3Rrn
 f8n5ljY9o/9oKve3ZfCdc2a4fQaW12Hiwd56R/jZv08Mmki2j0tzuE9UuVZXt+sc8G5k
 TKjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJTru6pnT/b41vgSpCxahW30IqSYqKdTJvOxgg0xxJ/imCRubggFWUCE7oo1BPDUd11tTn1pGfFtQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx169LTICAggRrrVEa69WXPxSqjiJFubEzS2xFinrnbuZklTqeZ
 an6e2V/FQv4OODfkTvHooc72aajOU1tKb3al2u/qchaviZ6D76tKJon1qnIuzV4speRPE9F5gOm
 amhth9DyJozvf9D2dB+FUTu2SO36xSb9ah0Hz5mEWxnQHuxGVgKgKEmd0gVUyZMOiGLQFSwo=
X-Gm-Gg: ASbGnctPUb/U3p6VzRlUGNRp06MVz8Yw6ETQaZd3JwoQKeDKuVsNz+3I8/2HgwKzRmq
 JH8V54isSk5ks4Ej7XXCCfi0hA3LXUd5IOW/jEBV9kq19c+xdCG7K2wvKZpJmbYpaCes946nkQy
 pu4/V3B0owYCRYNWNAgkuGv53DF7pOzGOwQRLb/fkWJO0YgzL7csvgLQ1FH1hMB7ytFhtZUWW/a
 /5WCf9D/6rliQ13/esnymaBnaDp7sxYi8p4+SlAnxkhiVudTN4rJoECv9l+YsTtlgZJ306tz1oE
 DzdviTaW3I8bBBYi9EMhw5lPTzTcH6ol1ummtAKITZO3myJyo3awl1RB8/Xy1x4EZhVt+KuJ0q/
 VH/4y9J9NB5FpUA==
X-Received: by 2002:a05:6a20:6a10:b0:249:ba7b:e350 with SMTP id
 adf61e73a8af0-2602a49db95mr10679950637.1.1758007915330; 
 Tue, 16 Sep 2025 00:31:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOuY/+fNjx7hpbqu6n+05NZZcieklyq8hxAQX1LsQN7umar5jYiFVl460R7yZnKdRwQ7hEuA==
X-Received: by 2002:a05:6a20:6a10:b0:249:ba7b:e350 with SMTP id
 adf61e73a8af0-2602a49db95mr10679911637.1.1758007914773; 
 Tue, 16 Sep 2025 00:31:54 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32ded1ac2fdsm12995589a91.27.2025.09.16.00.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 00:31:54 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 15:31:35 +0800
Subject: [PATCH v2] dt-bindings: display/msm: dp-controller: Add SM6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFcSyWgC/42Nyw6CMBREf4V07SVttTxc+R+GRWmLNAFuvQWiI
 fy7lcS9m8mcWczZWHTkXWTXbGPkVh89TgnkKWOm19PDgbeJmeRS8VoUoK0FG8DgNBMOgyOISwh
 IM3SY+lgIxUFJpY10tjJVwdJVINf516G5N4l7H2ek92FdxXf9CeR/glUABy7b86Ut21LU9oYx5
 s9FDwbHMU/Bmn3fP/mBkwjfAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758007908; l=1877;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=s8BWyyAJ63Dlk1aTjEk5L9PFu4I14q5H4nUlYBpxpL8=;
 b=vTalDIO4NPgb/9aizwP/CTx/sKmRglc5T80Q8X0k/OzwPWggEd9F5UCFxlYbD/A8iGXuwbfLg
 NpPKQPOfeyVDbyvvuTAYxdaa+lqtOqUegXaF5tE9Gf/4aDaHTANLiey
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX6VHP4EMwTojt
 w7Uny8pFVP6Q1glZIJ1u8bNO2ceh8VBCXS5t29EPiUUXjX1If/1Ekjje+fdjOT200+NKZ8GOw5L
 N/9voEpL0leeMkt/61JUaYSmrfAu2Y1clqot9fZOhsgnqUP6ww7Vb0njjgzPf5kSZGt+r6wzrqT
 Gb2mcpdkmRDPN2dDc4/NtJWpKVfyTl/BrqwdDdddxYswR/s1CfNyfsXwqwV7IzBAA2RIbPw/hAK
 cfS8OHDVhDfCgWrpr1kg1DItaJwu3Mvh6n4N8y/LmpYU5Psk/QxNktcYEL5q8EK12cfyujCvtn+
 TIOMU2lXoMXh6786fGLmnC3dadlHf7miPIdQHo6PqNSvZc3RgKRvnb1K8vBXpXCDwzLpct0kkj1
 evXLkxpY
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c9126c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tYuJd5ZQnYzUV30UbPoA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 6vEd-TsD8qhd8JsIVAS066OXbhHaBDoI
X-Proofpoint-GUID: 6vEd-TsD8qhd8JsIVAS066OXbhHaBDoI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019
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
'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
for consistency with existing bindings and to ensure correct matching and
future clarity.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
This series splits the SM6150 dp-controller definition from the
'[v3] Add DisplayPort support for QCS615 platform' series and rebases
'dt-bindings: msm/dp: Add support for 4 pixel streams'.

The devicetree modification for DisplayPort on SM6150 will be provided
in a future patch.
---
Changes in v2:
- Update commit message and binding with fallback configuration. [Dmitry]
- Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
- Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
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

---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

