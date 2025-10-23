Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB16FBFFC82
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1F410E8CA;
	Thu, 23 Oct 2025 08:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGD9BSUY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E849110E8CA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:39 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7B8KE026077
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=8KBOd7N1OKL
 iYG+vESUSEumwgDK1Wzblv22t5BjCkZE=; b=OGD9BSUYkdsHfq3VHtFPabJsc9u
 UYlYcsPlkTqGGK2S8wI86fHNHN0RWetH1lYN2CCaDD/vghhdvjPgM47OvXWb/J7k
 7KX0Qx6WqENpeRCM9oqr+nqLOx48jjfd1lHV3lW6GYgwJmgoqaUoj1DGWwoBBzPj
 ggFWdvhWe9/41nl317bUTeciWMppkFRv/pkJ59g0lq3mcaAh5164P12yo0xkti/7
 TJKOe5jme+mSTa2fmNlXTqVXqB5FAQU+b4aluaiKD61gtj4T0aDVr5g5CsXGkrz9
 iqSJABmxx2BAj03e08XTQY70W8mAOED/8CcFXWNIEShH3ryXWRJRB911peg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfchb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7810e5a22f3so1317017b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 01:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206859; x=1761811659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KBOd7N1OKLiYG+vESUSEumwgDK1Wzblv22t5BjCkZE=;
 b=MFHCzRGhJusVdFj7e/m81DfPQtajd7ddXdnBx2zw+m5kGUn0rj0CU1kH6R4cXzSRc/
 6ex2emJZxsI5tjQDkgvRSK2TKFpSOZk+H0kqQIz/X6M5xZ9ylopwAicxFBHvfnhp12BZ
 v7pQqWFL265+C5tulK/YMUXXghylOKFGD0egSaPWZlSR8aMk+VCrS2VxjqgrmQQR14ur
 u5Srx7/SMtSvBpYSwyBLaaut/F+Xzh7SwcYOemvnsYHL6nVg4heFQVWeEXcqVSPEme4r
 bhm1VmMSOh02021D6lq5QJqj8hehsOFeIMtkRTtbKaecmtDAEPgq0dJt3wRE2ZMHb4hZ
 dzBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3+AgFxJ4KJDWZ1gO8Yx8QHSLg68G4sOShgUiMvQzqtE5NotyPtGtHK4BHOOTzFmVqVBHLiCy5zOs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMYgmtqUHPIBP+SHsaWylyZcOBuQZHzI7lMa9Eyc+qWttyh04w
 eKKAp6c2iG1D0WTWwZQ5bm+2HRRDEBK83euunQfHHE9HvrPsr0RV/oEEX6GpOCTistTikkDqLz/
 G1Nb2shJkOzFEoMzQeui3doEIXgOovXpyY4Pn7w+c29+ibb8RPkBCvX9j+erbGARUysaSauo=
X-Gm-Gg: ASbGncsC7R/09npKvBw0uuFh1L93F0Cg2fW6d+QcA3lw96eAb9j3XByzmH+IJRM77JZ
 tGR72maaSKfw7cn70At0QbkgQV1/iXOqQxA1M0LBB5BJLEvyk9EeQ0i1DBVhYSOMKSelcoY/FrI
 h/CS9bOhDdjq0ogEEMX4ey5hTkD7hx1FyPsW9X3yt1quxuqmdkNRotDwInEHa2kqSFPYgmAQ+Ej
 k1zE861FpXAnhdlNZ3az+wxW/E1KCkdOIJbDFlMU44q6PmtHfy/96ubftkEcPDMDlwtdrdszOJW
 2Q8zrNOvrVobVyjoSMFYEYNbLm0iexGphxVf7/NYbxxujWKRYAfcmY6E/XKMerR5q6N3PjfOPNl
 OWWTd8K124mCVbxZuCFE5K/x0CRooMDi0xRVsL+RLsFX5F8EzBA==
X-Received: by 2002:a05:6a00:2ea3:b0:7a2:7b5f:4ce0 with SMTP id
 d2e1a72fcca58-7a27b5f4ed8mr378344b3a.28.1761206858620; 
 Thu, 23 Oct 2025 01:07:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjN7fa3hxvdx44/dyiL/lnUELFXzcTVbvL2kEGiyf6x7H5jfmpkQeVPZyeTMdgcZNq0ouTxA==
X-Received: by 2002:a05:6a00:2ea3:b0:7a2:7b5f:4ce0 with SMTP id
 d2e1a72fcca58-7a27b5f4ed8mr378317b3a.28.1761206858186; 
 Thu, 23 Oct 2025 01:07:38 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 01:07:37 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali
 DSi PHY
Date: Thu, 23 Oct 2025 16:06:07 +0800
Message-Id: <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RS8SXjVaz91AbQjvD7Zf50X2Mm2CPokY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfXzv/yP4nBdjmq
 FiyCK0igWRaNChHwgjsGIr6Qd1UZUERqkaaEmmwRPhNdnAIXmvNkSPnHB+6gCuxxgYa746f8mv3
 ffEMnJSd9OXYMmoUFZTp2eekCm7421L+LE/aORBckdBE+SOuKqh2BAK5/OxPEkbfKXkRAqIKbiP
 EYVF0K7kwn4rP0l9Sg3UOE0L/I84pRXFrRttKvbcW/rixNQuFLoZ4EySfdbtnkknKhIDlsuVql3
 lKDtsNnnQ1w+T2OlcejkTdot8rnL6WqVuCESq8uZVjsizmjg66h7STJx1fJuMR10N1rpRWwWAWK
 uNdDPT5kLoqK9o0YdnEag+EKnNTvvySdmgPBG+WYIRCAB2ErHrx77ViRAcxBR11cPFMADN1CcbF
 lFBURKkI71pklV8VKesFiS/pAPp+Lg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9e24b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=tNVMJPnUsVqa3Ada0T4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: RS8SXjVaz91AbQjvD7Zf50X2Mm2CPokY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI PHY for Kaanapali.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 1ca820a500b7..a6e044eed3df 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,kaanapali-dsi-phy-3nm
       - qcom,sa8775p-dsi-phy-5nm
       - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
-- 
2.34.1

