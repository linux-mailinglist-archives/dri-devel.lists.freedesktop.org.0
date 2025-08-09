Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B96BB1F352
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 10:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0256810E29D;
	Sat,  9 Aug 2025 08:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1ujCWNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B0E10E2A8
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 08:34:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793l0XN028703
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 08:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0noH+yy2UERIjrtWf5Izm7M0t2Ukl6cXD864r/H8zL0=; b=W1ujCWNL3lsMnAur
 4iZbhjWF6Er8Td52ISK4x37YPIryNw3NBgcRn/WQnU6hNORUuaFXIWl2/2GzdILc
 VIp/1tnd1nH9nGdW9Lez+GNzzroQrnR2s/a9GBKEpOCxKEkKtPl3K3K01SqxiWTX
 yR2RPuBOufH2c5puaPOoBfun9rUs9JA70+jsEaF0kJIz30TEKbkikSrHYKQwd+Pm
 dnNIu4h2nEXtHkdhedWvuesUBF/Lw1ejMjay40yRdMvM+P6vcpK3WP20f8tcU15z
 8tmZ26BET/ISWQ2FpmaMoy0z+5DHkxYswrbpVnO524SCjbvIYmUF/drFbQ0U+Ipf
 Od0mxw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sgeun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 08:34:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b08898f776so67906451cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 01:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754728449; x=1755333249;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0noH+yy2UERIjrtWf5Izm7M0t2Ukl6cXD864r/H8zL0=;
 b=iq7x69HZLJT8Y6mYL/zR7YVnx05bZW5ZNhWeDc99+bpIPbCTAg+/4bOsbNF4zU7JGe
 cEWxxm3hwGZJFm2Hn43NyB9IFWbOhDALpORFdtmnGNLVYD+ETesMxeM8vr7/GQXzJJVU
 4DZoq4h7udMU8oekNDD2ujBRaNsMTrW8mksgQrDFM8TVvM7li7bBnF3HeRhAQiU8DSxR
 t/VBk+Whoo2yawZNQPhye9TfnzC28XXf96Xz57QowAAAdIKyfPsEvZqLy8Qrn771XHG8
 TzPPCUWEp8RxZp16foy3VbYlIHKtg7NQbgpMmLZJuAp1FIMNNAwHZr9aUfpACSgBUzBs
 5RqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeBdwz3wsdyhcH3Grrz5lQKG+hHAmJFWdXr32U0wd4xJqDUp8b4rgz91qoZyjWQ+OaFtQnFVeuy50=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVmcxZOcCrDY0Nq1ZNDBCGPBuo9A8AKjjvXzZOJ29iOYWNKMPl
 ZEBEyS0KzonraInTWzQB45NZj3nduPmVRNqDYin0HM5xDy5RGH9PX8is60eQ7SAg1700qUEv8bL
 CuKPM7EXdyChn5g5iut9JdbNEOJDi4oCziMjZcnosQDYfbLg+tF/GNf6iFUy3tQ3xyHBftZo=
X-Gm-Gg: ASbGncvReN+8EwjN4PSCXFiXT2E7y9o6JAU8iQz0qsCb21Oo23N+JMg6lPClarg1YJF
 WGPtjnb4yRhlarvIcqykBUjRN0cZyzuVJkLHleqq6vCbo0VYiiyw7g4Fi74eRbsr6xwdU21Yaeb
 BawC7sHIdzt7qNcR2MbgTJyCbYX7jn3RqkQLqAP9eTbbgiWHLxC5sCVRXNkYxy7q6yH0xA+/KJb
 MqVSQncdCONh1QwT15Pv4ET+FMZS9lVXn4P+ytLYldird/DxO/agF5x9uHXArI0Xq84fgUR++lM
 7+KRYeM8hmL12GNpsfHWzhSKYcspIFCia7ygNZ8j04PaSVjKIv+twprS7vWQsz1GCLiKuIonn8+
 ojo5oBg73S1TpIWSlqeTP7eS4o6mXAS/oLtltNLZXOfRL/hR7+n4S
X-Received: by 2002:ac8:598a:0:b0:4b0:6965:dd97 with SMTP id
 d75a77b69052e-4b0aed46000mr62115071cf.44.1754728449241; 
 Sat, 09 Aug 2025 01:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7Ab4avSwq1zZ5d2YBZYLBo3nOHk9zflP4onqWeB1kJHzKmCxLZZa6pyaayGdxAMVuH3MvJQ==
X-Received: by 2002:ac8:598a:0:b0:4b0:6965:dd97 with SMTP id
 d75a77b69052e-4b0aed46000mr62114791cf.44.1754728448780; 
 Sat, 09 Aug 2025 01:34:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 01:34:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:33:55 +0300
Subject: [PATCH v4 4/6] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v4-4-bb316e638284@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rRhj4oU1JzHT8f9jk9qa6uf5IjtK4GGvxWKFr60GaGk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwf0g4u3a1NCs2Pi954EIn8pKAWuyUrvgWY4u
 8s5Au3R/ZeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH9AAKCRCLPIo+Aiko
 1eLiB/4ji4EZcId3I+Gipm7fUItEaEkdL4jBiSVpgDbR58hgGaGfh+rgg1iUC2K1H2n77wSd8Qr
 SVc9HGNGyoO+RsgWs2Q7TnCVDiYvrZUQnkVc2p9Nd9vNYCrpW87YySLDDgKLZ4bn8BDwb2nwefE
 ffzgcvATuCl1rekKNCxLWqIKz5PUxhd0rTjRXQgcaMpRDZ24nximOaUERVaE8jgKNGqy4nlXPe4
 PHmMFyHM5RlrJhBRvveyw+dPfy+4nluaTtsx3GrtM9qhNowxjd2B4f+K+Bs9fCSSwbTBJFKzuzQ
 klbUlOK1fCXVmzkHriccIeMu1IBi+WdzUkpz5G3GGtC0O0CN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=68970803 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VjVaSBsDX57WhQYIrYsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rxfUH3XaN7RAZoXAlINC7ogX4rnSIvl6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX25kqqAg2rPJ4
 5RC9KxIK4PiZVUv1OKhXZ9faVX79Pz1UBZaPowcfQZ1hDrYUqBgiT6A2kx3J6sydz9YxCAHN0Uz
 GtqNvK1XWdkLvM9m1MqcZBco50flspNoQey2yYgP0LsRHEataVBPKXWBPubRUvPy4gGNn9FMgIp
 /GkUvMs7sfQpzoYKO5RtsYY3QTRKs1bIdt1bUy9wv9HF1+8NEEzG6B+aFcJ1tcr5+Neq/qUDz5g
 N7WqsHd8sX9PQXo7o3BfK+4LEZra8p0/zIFNxntUcZ6rB4vu8l8Jv4K4E4VTU5u4wGZPRj4CqtL
 9F76Zrga5DIZl9DrF6cWGZx/zynziIg54NOHz4Wk19wASuzxvwxL8IR8ojj7vxpQLW/kNVbp5qZ
 nuMzMSta
X-Proofpoint-GUID: rxfUH3XaN7RAZoXAlINC7ogX4rnSIvl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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

DP controller schema documents assigned-clocks and
assigned-clock-parents. However these assignments should not be a part
of the ABI: there are no actual requirements on the order of the
assignments, MST cases require different number of clocks to be
assigned, etc.

Instead of fixing up the documentation, drop the assigned-clock-parents
and assigned-clocks from the bindings. The generic clock/clock.yaml
already covers these properties.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 55e37ec74591af0a1329598f6059475926fdd64e..352824c245224d7b5e096770684795625fc9f146 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -73,16 +73,6 @@ properties:
       - const: ctrl_link_iface
       - const: stream_pixel
 
-  assigned-clocks:
-    items:
-      - description: link clock source
-      - description: pixel clock source
-
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 

-- 
2.39.5

