Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D32A89828
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A6C10E6B9;
	Tue, 15 Apr 2025 09:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Crry7EYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7314E10E6B6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tNGP005961
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 boXGEJ9vm7laFVs45kpF+i7DaEsEXFuWOHSJOklGi48=; b=Crry7EYQoQ7jclKC
 t2LkwXKWi3UGPmFyK4i1sqV1VOjGoUvZR9vAP0XeSwg8+YsbGEnENEbXIQRzeEV5
 BMh9agY8PrayU9Uty3JzPLhIj7uokz0VvnQKnaOhxWj8mVMFkh1Iv321fTU4QF5s
 4Il9Pf/tIFhmokJKlKT8DbTW0jLbGkb2/5GGH8+RTBfnuLWmlkALWogr79m0h4x9
 wrPjuNzXSHfBXb6PDKc0qCqFmGlPz05aWQMCeobtH+OBbTDKFttO5zoNgnUWAmcB
 uFWyEZ+MWQ+cgVahOmCINpKvW/+oQS3bAWvAhTnwjRwcSR2Kmyd/g13CbXAT+a7w
 ML39aA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj7qfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6ed0526b507so92980166d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744709983; x=1745314783;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=boXGEJ9vm7laFVs45kpF+i7DaEsEXFuWOHSJOklGi48=;
 b=hT+Xf4+2rxcdp0H7jOyMfjroMY4EruWpeKwPpXJKFg5YguzQWgugjrWLyEFpwGAk/m
 XSooiyvzv8BKBUfoKVIq1v9rfJWP8EYH+91LVxmM1CrSmAZwLVhiZ14faGn2nIYBTH4k
 ZSxwkm0c1IpYlNnnw4zaLxEViYNvx7pfdZhSanSqmLJ2FnZvV0vRgE3WkBalDrHOivj9
 Bvge0g6OVUj7kJiyb/+alzhQOGTXaOFQvueQP7LP7zTiYXu58TyZvL+ldXvFTDQMMkb4
 1HlpO57nd4A0Aw5T9QhWsID/acndEyJaCyopyZutZnOSl4U52jsBGDk8dOVEzTLygNS/
 Y99w==
X-Forwarded-Encrypted: i=1;
 AJvYcCULMRBWMOb+QAaNZ9GTzvN8RFjJR+LjeCN5MPyTN4QShO9aK4w+kK7O11/vsAJqu1gxtg73JyjciOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX4IVU5JTkMzJVSAZywzycfFuqU1KA1jRtYtSza/vu5+hv6D+V
 poO5Ok88TE6Pb1j2JOgrSfWt3as0+KUM4iieROVNyP6o/VRxQppc8C17asR+n5eiPOXi0HH8HhR
 pq+k5ZDm6cHVIELiSikfImYhVuquiKss7ShPFXCHh7ocU+uI6TLSYO8nOU/HPC/JIuuk=
X-Gm-Gg: ASbGncu4Q1U2c13+xrJmcJeWT+WQCBZNlJXMZDrnPwuzfQZUMMv9wKuBuv9nD7mWkkt
 hxeBTBslpTHghM2khEn9ctIVbZZaI7bmiBrDSSkvz3mUYQ0/ZQHtGwEm41L/1VBbP5cX/vMd3Y3
 FiXdV1BTHnzWnYiioMr3duTlJxZJaZTRViJi2AYS3ND2Qz5pXB0CGrA4FZNxwin7+O3qVly9V+G
 KvXFIVJwymGj+7rCGkfSahm8Fi7Ua6OS+5BHRy//V+sz3E4BgwMyCLXaP3xUUPG/qNkFgvgdOKr
 /NqUp7lNmY5CcHouS/WkOy1w2jcHni0DFeJtvcTwRST8Kb4hyJSgdCM3pXwgo0bttCeDYtAcqh4
 sCSN82EpwoBnYEGbmNKEQ91IZ
X-Received: by 2002:a05:6214:cc6:b0:6e4:4011:9df7 with SMTP id
 6a1803df08f44-6f230d1a647mr271627446d6.16.1744709983541; 
 Tue, 15 Apr 2025 02:39:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgv+l2YW7FLqgyNzvGDxI7BnqBldiXe67Jqf8Q0JmqBPbVtUaiY4utPWnf5VS4nhStjkZWOg==
X-Received: by 2002:a05:6214:cc6:b0:6e4:4011:9df7 with SMTP id
 6a1803df08f44-6f230d1a647mr271626936d6.16.1744709983180; 
 Tue, 15 Apr 2025 02:39:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 02:39:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:32 +0300
Subject: [PATCH v3 04/10] dt-bindings: display/msm: qcom,sc7280-dpu:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-4-62314b1c9023@oss.qualcomm.com>
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJ0quqH+dI7r+sJavUIADWzzAqD1L2X/CIVzw9kCDtE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilWDCo+pRdd0GrlabWfVcz8v6zf4ozWEeLZA
 /Fu3nJWwiGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVgAKCRCLPIo+Aiko
 1ZCmB/9c4hLwLkqR989lkSnfX7RFd+RyXe2921PtOP8h3L7D9zPDDrRiPBsEIoM2IWDEgcRu29V
 TOK54ArIZFVtHuBzxHBrMKjeGTaEit0RHjeaueqX/uUaeFVZY3ZekNjO95YrhwBjDam3HZh5c3P
 KM6XNV83M1FHTLgDV4JtQyPebgUeMio3Rkb431dyZ450VyePsBt408lhO6oM08G1dvxgHIZ2kNH
 sGaQTCgD/TxOiRxM1flWQ2L1ost0uIylgYTY93Tavz3lOMs7y5XPP72eGnK6y80sGhBIcEll8cb
 FXyLoKPZm5mLpXx4et9YY0hagzeFfwiWKhu7H5nZHb7ecY2x
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe2960 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=P0d4iQPpJQof_2lRNe4A:9
 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nFYD1_yieEVCyc5rLWpEu6smG99YxPDQ
X-Proofpoint-ORIG-GUID: nFYD1_yieEVCyc5rLWpEu6smG99YxPDQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=986
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
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

From: Dmitry Baryshkov <lumag@kernel.org>

Describe DPU controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 6902795b4e2c249c2b543c1c5350f739a30553f2..df9ec15ad6c3ca1f77bebaab19ffa3adb985733d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -17,6 +17,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dpu
       - qcom,sc7280-dpu
       - qcom,sc8280xp-dpu
       - qcom,sm8350-dpu

-- 
2.39.5

