Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB52BA608CD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 07:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5190510E95D;
	Fri, 14 Mar 2025 06:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1kMUQdc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7877710E95D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DMuqTE003493
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=; b=g1kMUQdcqMAybrFS
 15GvE6JaxHBE5W65B5Fv8RhwbVVBdkNQmpiUAKlEuLQ24c37qZKaxW6tsMf9JEbn
 bGaD9RfgzU3SKXA0YwEVk6AwXWPcN9v4LFTKelQ0b5GGwBx7JP5mt1PUAopkGbr+
 DkyKUTLcOvO/2WzcUwuJY9PbgWHIQeuD+ZI1F8RZhwF+Jd76frO0vWlfw9iJvmB4
 ktRIPr3faHxl9/9Ih+q8BdtwBFDcv0PmL11jsp7+Pf0rZiYIZuWXSRxO123R9/is
 YE1xciPaY2Se+6Pu5BdSEarjTsjHg2vwAeQci8tIxOvvUkCFJ6ANvApyRf/ryzBN
 mCHTQg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45b96ye4m0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e8fb5a7183so31282516d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 23:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741932567; x=1742537367;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=;
 b=KMWr5ASznppNOKrv4Ii4psj2piXeDKI/mqOpSqReZC2fyTLI1qvF+dOsx84fUUq6gr
 D0DLywg5Fv1ttQnmgTOGKfGuvwTMbrXDQA7pi81i5qz/OVv6m8WwqMulO0kxMa01riLT
 JRPSvjRV7hptgWpCIeGMTe0+RjwjgkFF54XVN6IhJ4Zj8k41OZFyYLkeFlnHfGtJM/Cs
 8jxj76A4p75+k/dXm/BicFIfDSa8GL6yb9jsnGijDQeFF/B/nwRe7agbkvzs/QrrZhX4
 wgYdO4cQ32O6AzV0QoyCxkVlJJOqtU70P6+IQujJssT8zxhrQx4ehdVk/3/r2DOkVCYo
 C1WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhNCc0ahuPB2yH9UGG4WfG45iOvGIOKKuIHfwrtdbbjJWsBxt+3/IUEH7fa72azoY/fP4psDg9cKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywlwyge5yl2S+Uw/nBbuvxSFGb3P/WnVhBh6WdHKZfxY+nCjW1L
 aVfxvrMasa50a/8/RSsi4CVfTd0RkqBV8LnrNgN2INsh9zvw/AXV4mBoDLc9HvGKdgxY04zBv9i
 dGYhf0pkRVsHoTBbw+sVd2+jZbWLic8izWlJ32XcfTT02jCYgZA3qr0uFkvQgH7z3UZxmKikHLO
 QPRQ==
X-Gm-Gg: ASbGnct9Cd9KJKbWdPs404OqA3OyJH74XqoPX89MZ6TdVt4KZdVk8+w308e0Loch2jE
 8IIjVbwxsvAYua9i4hcBo/d03eH3Z+YWc1PwRy8zlOlY2RrN9m+YFOojJyAIR2twUpws/A4ZdSL
 svBKdejlSR/dWQ+OkEPGOpm+w4qKpQaaF8u8t2ga3WnboidRUgZesFCWeIgLxKemcfl0WJXtrDL
 nwrG4AkjZ8aR53xcUe3X3qfitz6f/MO2V18yb+QaZg4YaTbv4mcSnRHDT4WFn+TsuTPSvC+sKgr
 CWSTtnMVEjd+SJB/ueZMBBl+vf35u64yXCdsOGSQpIwfDlrdhBEVrQLmyOBv1Bwj8Pj3PdNYkqC
 XIuwJ4i3uoxVFsDkwkUFHWauVP5i5
X-Received: by 2002:a05:6214:1d04:b0:6e8:fb94:b9bf with SMTP id
 6a1803df08f44-6eaea9ee3femr18760566d6.4.1741932567074; 
 Thu, 13 Mar 2025 23:09:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcEa9Bc266rkd2ufdSrH8URTSt0lvVJ8rYD1A4CatJi7rKwY9bNrmzWb340X/FvEigsaAADQ==
X-Received: by 2002:a05:6214:1d04:b0:6e8:fb94:b9bf with SMTP id
 6a1803df08f44-6eaea9ee3femr18760376d6.4.1741932566765; 
 Thu, 13 Mar 2025 23:09:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 23:09:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 08:09:07 +0200
Subject: [PATCH v2 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sar2130p-display-v2-3-31fa4502a850@oss.qualcomm.com>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=azlck2n2u+qrgsVJ0BAEOEuqH2At8nKdcftYTsEljlc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/rlE2xpFfY7J55afOHaOk75u4wJM7Vmfn2Tzptv+fXHQ
 e5PC/cs6mQ0ZmFg5GKQFVNk8SlomRqzKTnsw46p9TCDWJlApjBwcQrARISl2f/HFLg9zFjh9/3j
 l6lpXunJ9YFcvwUSXKYlFYuXsrTG+vlEyUm6Ho8P/6xrJd5etletKXnebQ/2hWuCDO9N3GLf/fm
 p9Qvuuev1TX0mnuh/MCdlPnu8Kv+WzVcyHpdm6Iny/77XzzejZf20Xln29ccdPS402nXsEPseeU
 ioYH5945MF3DyXp8nL28k9n7SrdqJMv7NU+dLbFe8mWQfKVfwsUzox0X7R2RzmpZJvDi6x+8+co
 Onq8kCA8Yvr75cl/9iMSjoc2Dev3+HHdELR4DZzuOJkrpBb4Z/ZWerY13SqXyv/YpPxoo6V0aGA
 zeecwgLeSNV/xR/1PKw4VsbXSp/n7jef3sIgVrhPp/YpAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: BC3VUhlLSVMTyimvRCXG8HUvgKjDoT4j
X-Authority-Analysis: v=2.4 cv=I+llRMgg c=1 sm=1 tr=0 ts=67d3c819 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9 a=QEXdDO2ut3YA:10
 a=eRSyEd_ZPWdY3HzJaUvg:22
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BC3VUhlLSVMTyimvRCXG8HUvgKjDoT4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=995
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..f79be422b8892484216b407f7385789764c2de1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm

-- 
2.39.5

