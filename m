Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F27B1F38F
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 11:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5402910E2B9;
	Sat,  9 Aug 2025 09:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0OjB3f7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1044310E2B9
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 09:16:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793UGT1009156
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 09:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wukwq66wPKvNOpEVoTlqCM/dX5GluHetZv+gB4FYahg=; b=C0OjB3f706CYlkxv
 cwXbx7kRj/bM0XIwbNTToqwZRPWZhWTPCp+3Mah37qeICbPpTy0U8ZmJSQ+ZCifg
 zNiy7YCbzrDIGBtjGhiqzUXZgKNgQebivI4RKE2jPqS3FHcgzOfyhgGSnaJFxybY
 0pBp0XXUwlVL7zqPwFXnZdf+m49P7ybBGLOevma9W8oN4V/DELGlwWuPuYioFcqV
 sbNyj1cWVOSrsCBF9dNzhoKByaKTBdd6PgfN3EsrqwW7yOe6BU8LC+YhVyzs3TdV
 4NkqrcW5RWsB7TazjODnvaACEtF2QcDiQRjhiYuMZZEVTJ2anoH2oPlWZ8ges7jn
 h/xZbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmgkds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 09:16:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e7ffe84278so576084485a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 02:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754730990; x=1755335790;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wukwq66wPKvNOpEVoTlqCM/dX5GluHetZv+gB4FYahg=;
 b=WLrNcCcJKWSO2M51daLZNnWDN2cVgysLHgDEmqCBOOzRos4drNp1Bhq75yWsEwbIho
 N8AeriBMFYHfcWfHg20Q+nqkNaqmjnT8UQ/Azk3Le2fuSXQKm8C63rutzZpDSUAdrmJm
 Tg+FDxvf5WQt2OTz5mq0JZLQyXByaYcx7SG/mSMeAYb8IiJ2Gyg/4tj4xihLIWwakLGN
 aikz0/dIq3QpsVru1KtFer/dpcbM4M01WND9mLonwMZD2ZUQOxGXnTUrRwrcbwcvdYum
 z73OwMhNyihVuDqFdgjucWuxVhd9oLWDqqjs0vh2VV5wuFL5rL4iYk7ApW/Bsj6Dgf0F
 W5cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp0RWYWgFwRPBn1OZmApPBPMil1w29OUgTN2c0YlkZY9MmSi+YnkW/4u7bn6Nx0j7Tl8p+Gmo33f8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxq1cx0v3tz2SbWflGpHZccoyNi67EaICd9exaDEoEA1QhlH7+
 MjRbkVToQ0SKe2AFjBSJFC6Leuzgm72Zhm0X16ARZovqZjXATo3YICqdWWzIuLiVEC+KqwzRyYP
 4jy0iuCR5jhVcpU3IEg+xpX+l/VFN124NaDT1kFEvl99Zoy9dKejdhK6jsIy9cHVPMGp7hPk=
X-Gm-Gg: ASbGncuhScmxE2rxa7N2xw2GK0W9lzeH0VyWCBRbby8fp8xKnqrRcR5gbnzcz2QKhbX
 2Mg5p+fOFUmPI8DQ5mig90pbXJf9ZYD7ryaA7cTcIMjbKeV54dY+g9GWywtlfhvpCLal5+ABhHn
 6TcgsaDAdWzu1WuaHFbTS6b+elfJNZUGzTFbkd/1DHUAXAmmzf7Z8GDTLJPB4kopNZAm6QLAxha
 PDvE5it5roA3F+ak7xa3eWeyk2Zy1ST8QVft8/tZg9I/s0H7pQLIAdO2HHFe64BikdJ7xFLibFk
 0Ycvpqo6QO042Gtu+nnTvnHVXnwcfmR1oKHbH2VBdrzKcfAMBOrLOWVclBqfKo7avCcsCxyoydC
 BEGYFs8ynwzkFdwurN9Ue9plNofjxNglHkm+j4uLjRN8FaiTleMOZ
X-Received: by 2002:a05:622a:2d6:b0:4ab:7cc8:1552 with SMTP id
 d75a77b69052e-4b0aedd7d11mr84492441cf.39.1754730990067; 
 Sat, 09 Aug 2025 02:16:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPjyRAUyTPcM8WjrcEB+3Rkbk5GGRbERk2o3qm81l1UEMInYTDTY07fgMwvBEs7bG4cUrOlw==
X-Received: by 2002:a05:622a:2d6:b0:4ab:7cc8:1552 with SMTP id
 d75a77b69052e-4b0aedd7d11mr84492021cf.39.1754730989488; 
 Sat, 09 Aug 2025 02:16:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beb4sm3361989e87.30.2025.08.09.02.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 02:16:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 12:16:17 +0300
Subject: [PATCH v5 3/6] dt-bindings: display/msm: dp-controller: add X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v5-3-b185fe574f38@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
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
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1DHFOJ/5Vedl1A10IE8+ZyGBBk+aXq5TcrqsRnBV7aw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolxHiSpd85CuK/DvwuBUFFI5kVBcK7LTK068hP
 V/tFn2s5oiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcR4gAKCRCLPIo+Aiko
 1cfBB/92IEVyNDnG5Q7zSljS6tiy2BKiQ6l6UmbPq1QGjtSFEUPS3PRb/NKZx4qSoMzUL0J9kVd
 aP4GObjTYqgE348Bv/hT0KOnue04WmqSQDXmBA+829EGsW3rVf07K0ByxGCYQb/mamYWPOrliUZ
 pDlNty8T8N7/RNEGT1QMs0X0+H8YNhg/HAejEx+bOmCL/g4jJEb+XR37jqM/lPgP5Md7xkFAbpF
 hnC1JpyGG6DW5t51jZ0D9+iUdaWaPrX1UzClqtNu6vo7MbZE1pHC3OMUZvOd84u8Lsc+t5AaE52
 Jx9Vnjbo/0u5yEo55L/1D4w9AW6CdjXwOgzgWiyWhmEp3Fg/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689711f2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LXTjkAqqvG_e-hvHT3MA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Ec84PsJdiJ9HRlIsNQdYzwjDJBo9EExT
X-Proofpoint-ORIG-GUID: Ec84PsJdiJ9HRlIsNQdYzwjDJBo9EExT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX/8uC/fb4zfh/
 kI7LJbUCzcSbwrzKMb2WOYPp3SndiLDjwLukFbC1sfdk855hbkNhS7mv9pNP+WirIPfm2h7Z4xx
 yjI+rED11VRoX+4rG2MFSN5hG0OZVWmz4QRPfg/tacfxIdWVGwdniPmM6slnzH/OwvLYylbpIfH
 ZQ38EaCv9lbUPP2yppoSb3USI8DPju+0fwyVXK+uRDXx5bT586bejDs6lGEdaltG4FdAM/m/53T
 Lz5UX08vPLbvBCMeQivJ8Huy5h+Gt09ZgNwZTTEw/shJXZwqmeQmW/FGGBvH9ymntKMli83ceCY
 9bvc8Dc9gaMVgZI5qVRK173MgksxXiUKvl09Xc8gDHjnBXOZvOzoxG4XThVKK/Sj7eKze6bgebB
 Kv6iAlhQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add X1E80100 to the dp-controller bindings, it has DisplayPort
controller similar to other platforms, but it uses its own compatible
string.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aed3bafa67e3c24d2a876acd29660378b367603a..55e37ec74591af0a1329598f6059475926fdd64e 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,8 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
+
       - items:
           - enum:
               - qcom,sar2130p-dp
@@ -180,6 +182,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.39.5

