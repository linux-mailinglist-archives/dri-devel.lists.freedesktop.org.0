Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D650B41DED
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 13:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547BE10E7BA;
	Wed,  3 Sep 2025 11:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLSwWccP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2A810E7B9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEqBN013914
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=; b=lLSwWccP/S8X0gGs
 /cG78VTf5BfHVkCrsLKglvpXJYWGlJVm6hGZ+2P6SL5LUHvGPYTeT+4n0jvqyYCf
 bCVetzjPN1mOQBbteGN4fTSfpY791tuEEV63CpEO3Bbxm9yuYmLw3LCYy4a/8qi/
 Daq6/J88J64Z279Ta8hLhVsbtFmXmhmyIlb4XxT9eC3T3L19bUTgtVt2ZYhU9sI+
 r0N1nIykjxUn90aBK5jZkmb8EnLKvGTQVN1BHrf+kZHpKqJ/qH8wQpZyWApHFRlk
 lo9gOF95G53aMS74mvc9POfiosXmkc3wr0Fm9deoUfNgPFszqxiZ4BVJ/mluI87G
 pkvsyw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy7dxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70faf8b375cso79540636d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900709; x=1757505509;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=;
 b=HU/90CPZ8IKGWuR/yD0VzFUueeqxkOysKgTvWo6rEX1hJhmM24z2dBhazsB7Op/Ytq
 fett8AT8+vjwn8ygtQgQMmwUCRmLc+IRSoVYWstRQbv2h+qIFAjM0QJ3ox2ixqALT6oW
 KLlazmpUvE4S+QbF/zBVpIfFtdgeSaSp3UvubFJK8qvGpmPYu/n8Zh0Mp1Qh+yPTE0X4
 /1PUdt+ONEEXrpk+MiB3qKtHklVjtpuV74OIS5f5oyfdCxQgPIsbzhmdxz/12nNlVp+S
 4em52SBXQjtHOr3pUkxutL38OeQdblgtruJKkwj5A3g1O84iNNSgf7go42l/s4bz7Y6K
 r+rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdpUbWQp6mt0cbBQhXVeJCF9ybzH4XsXtOCA6kpfz/8A8aJiMPE3x1TC12aeKJcZNEORcJY/OmgV0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPXBMrECsxJOBEaKVjEYEeKl3vlEESaJXuGnLzmIeApDLLLAQs
 QWJqq1BM0TCPDXt7NpKrYOzeJekj74LU0yqMOk/gxLYYoDNVIiwAt6AaYFpUTX5WJgrbPsCmIf0
 AqFnEiXc9+TtdDstf+k654T9hTWNE+OPQfi6nVOmHWueoGfuZ9/LLGkdcw2x1BUlKnkJlMWQ=
X-Gm-Gg: ASbGncsoVIaw0n1cQFBX3LJfYnTzK2yXp4VXsmGi6Ygiori1diOixRCWKgyoTN4DS+0
 lww3sKg/zpcOGezSZGOJURXNjsORIElRU9ivQK4ZeHNO/KwrlqxC3+Ad/G28abdD8AK1Ehpf6Rs
 C4z1mHlzGJ0nj+B0RyEIzBxK5g9/A/EsQJwh0ZZ1JdyBkRLmwq1BVEfoMVA0s94WXbqlCKecWh6
 JQ5va+CCdYYDZYlhnxO2US+6zbk8vb4fip8ZuoVAFHa+2pVlQj9eHCZHAE+N6GxVVJTZrvjE2VJ
 ZIwUqb3ZA/hC81qShUbkD4aLoZUyDF7+kgq+0P9z+qzdFX6tbdT0jVMjBoTfWDNp/OwJ6UKSESC
 IK4AmquzQyuR+G9yguIJ8+GUhdr16XDfU6ppz3rmC3vuMQi5hoUrW
X-Received: by 2002:ad4:5d4a:0:b0:721:f7e3:b339 with SMTP id
 6a1803df08f44-721f7f2f87bmr56509026d6.59.1756900708661; 
 Wed, 03 Sep 2025 04:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOxz+WdI3lYa/0i/KAsvn3bz2F3oaUn75lIwMhkLzpHl6K7aeiGWJnGPQJrpg5cLSzZ7bzBA==
X-Received: by 2002:ad4:5d4a:0:b0:721:f7e3:b339 with SMTP id
 6a1803df08f44-721f7f2f87bmr56508616d6.59.1756900708191; 
 Wed, 03 Sep 2025 04:58:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:15 +0300
Subject: [PATCH v8 4/9] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-4-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jGBROFXef1Ek+8wHh+Y3Ci+prYLBgIDZTxGb8ga6KTM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1Xu+km2KutgPERGGGo2kmA5xB9BSqQJXCB3
 M/GRKa1pVOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtVwAKCRCLPIo+Aiko
 1UVLB/9YvA2KNMlz3x3H5+BzWFNN7BkMCqdYEVllZZdSqpy+8dpZskxN/+586UCbKEPZGR0bPZn
 4rdUTsDG39PBRf3R9cGWP9e7Do/37ULaPUA+o4+nFcT/twphNVdMqEnAo2gkQqa5hTaxiVmICN1
 TFmroiajto+0rDQ4o6RG2zC5CK4hHc7naZKZLLmmo/nRz+qgbXbPRIAJdJw37Gxy56us3l9wHQK
 arLxfpFM/chb466xs9VErsOjWEL6he67ag4MM6Nn9dZpv5JacZHqPxwqbKIydIXovMXjAtc/gwy
 qfeQbAL43bMZLtSmzet3FrhNh6lpd/0IQS+XaeiS7V+FY8QT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b82d65 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fNztvJb90i9w2mBC5VewFIzkZr8RciRJ
X-Proofpoint-ORIG-GUID: fNztvJb90i9w2mBC5VewFIzkZr8RciRJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX1lDM0u4+L195
 CC3mb1dVNire7R8U94bYB9qjSzXG1ce567vTRuTQRddLnFJekY0AyaSXnIEVbkG8dEcarycX866
 SqzfQ3WCah0MwDjnRVpYLQPmKsthZiVxogi3iLreHPa+iW0M6j4Vmz9kXR6kqOV8q/LLwzVsiN5
 Capg/cdKfqOCa0GOlEnQ/t10IVNJ5AIMcWfshWRqupSSUfFawSGdC7vv25EZ2uPY3du2pdsIWYw
 4sEEcsPYhCXzaJ8qhOawiJEATRNIUIWeDkhbqwN3+BkHGUtnrKFR8i2369PNgpM+rjkaAI92uoB
 MW0ppZYVu0R1kMWTLUj/VBF0exgV36uIjqHH6AhBDJ+NwL96C/yalJmEAHJ+y3/qs9KH9J7swWh
 CllEZ2Fd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

Fix c&p error and correct example to use 32-bit addressing (as the rest
of the example DT does) instead of 64-bit (as the platform does).  It
got unnoticed before since DP controller node wasn't validated against
DT schema because of the missing compatible.

Fixes: 81de267367d4 ("dt-bindings: display/msm: Document MDSS on X1E80100")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e473332c331be36f7983fb8012652a8412..e35230a864379c195600ff67820d6a39b6f73ef4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;

-- 
2.47.2

