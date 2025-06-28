Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB2BAEC456
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 05:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF8010EA3B;
	Sat, 28 Jun 2025 03:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnuOdl8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE1510E12D
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S2T5gT026577
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pn8lRprkqEuCtVcvMr9gW99dcctgojrtSe4TTaHQ1lI=; b=hnuOdl8PyC/YIDJp
 X68NVOQ312PUDICEvpyATg3ejvJz60foBVljFVZmBQYrZzUh5sjeqFLnlefVmvFq
 jkApPpDz2nCHT1NJ+WQRhg3rtzoBAVvml4Gh1QyBYECAQ0uyMh4ebVW9cpimTXm7
 xjsjKU65ZBBAF1QzjWg6RzvpG2ggcCuweSnaOw+PfEcShLBJoLhRgSXEQuqc5e5K
 jC+OtcV9gk/DqLlrr36y/5SIuGpahVYRNrTOyLQ5zeUcn32NI9e8fuKoebH/Ic8o
 8HYiT2cwTGi1ek8VtoOVjafFHeRQxrupJo1fqyGqH+pAaqGgczkknmLXE5IfEsxk
 6LiSdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j58tg77m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d3d3f6471cso57199585a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 20:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751079764; x=1751684564;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pn8lRprkqEuCtVcvMr9gW99dcctgojrtSe4TTaHQ1lI=;
 b=eC2ZCgcBGIT0d6g3Eq6CHxKv0i4jAPQmupmf4ofHI2F4tpN3ugXh+eCH1TTQ3kLvF0
 GfLsmhgZPa4v47JWNnNTY/F9Mcdc0L0FECvGbFrQJlTuszOyTUojW+QlsedXszoppx97
 BaySMAUR6TBV0YIzLy+PpgQXEDmzbT+CWpBIOp6lff27a/H2ET3TrydCXZ0PDOKPHIEz
 PLZpaZTHmFYdrogvFt05t/b2e70icpNnLeZKKa1Cf0SqqmvYhXYQvT7322HmQTeigOF1
 W1ueFyfEY5E2JQHJJhIqskeCMDryQgPdDghx2epU3bAWGhN74HqCXoJ7FEtwh4ywwUS1
 H5NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc2JExJP2SgLPM0+h9bpw07t618OWTcE5ZNflyX9kCkUkwR7K1HpySB72CDBvlD+MQgFtVjjMQ8Ks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwK7MSgTvK6bG5DaXpi6+2z2iXqzySjCnsDJaiA32cL55ZRu+QI
 5TkiZiymsJ8qkDTxeQIy2blpLfzQwJYJbZ+TFAP5wZhfACAY0cq4wfxy3pdjRwamFquBsBdzM5l
 rA2J5kiwRBgI46KplERVEmCazsh/KiT9fWHChtddF3enrI8uMsROg2jt5/z4mC1YOebOOtIo=
X-Gm-Gg: ASbGncuFI35OfXHa5mer/yOQAmcsvTlgv0Uu8GnVVtZ7ZJhWwewddDLEULxB/NIDztI
 9gyjsK/UNaqXfm6i/6grkPDfzmhDguv1jbshWWoMIQa4HtWeNWVfbIM+YDWk+auvmjTGFG67xe3
 N12zgkqrzL9qmKbiCPsEBR+aaIg5ROAI2EJ9BxgphJ6GzAsUsBZWEKPXMjRWyAqhlWY2EQbAjp0
 szMBWwKbhVR3a0KMNxazyxGl9VVJY9QIGuoxpHYdSHkB2QIaUfSc+OctFiViHfVhQFXPeNhTu7h
 ttioqPTQjR0Dvi0ABKHyGpR4BJ+MBJgjE61xm1zN7HW9toXR1V8QdR/2FBgZQwYnPzYEEewvlFf
 8lMdBC0FOxN3A+JTvl5nU+FEKuP+aV9g6M3A=
X-Received: by 2002:a05:620a:857:b0:7d3:f63c:7ee0 with SMTP id
 af79cd13be357-7d443994e32mr745061685a.27.1751079760520; 
 Fri, 27 Jun 2025 20:02:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB6sLiLugweO26s+56NBhBPiiwhHw8p8mHSNpYn0MXz3xXHY1sPymiLX/dVkwjFIvSygbaNQ==
X-Received: by 2002:a05:620a:857:b0:7d3:f63c:7ee0 with SMTP id
 af79cd13be357-7d443994e32mr745058085a.27.1751079760122; 
 Fri, 27 Jun 2025 20:02:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2cec36sm652162e87.180.2025.06.27.20.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 20:02:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 06:02:35 +0300
Subject: [PATCH 1/3] dt-bindings: display/msm/gpu: account for 7xx GPUs in
 clocks conditions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-rework-msm-gpu-schema-v1-1-89f818c51b6a@oss.qualcomm.com>
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1390;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9YGIHaPZZVo6xs/Nujkqpj0XLB0+skv7YqMwQaw0Vhk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoX1tM3ZQjq4fHNRB4zWahpGOQAMg5wqPQjtru0
 jA5BsH+jqGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaF9bTAAKCRCLPIo+Aiko
 1fraB/0ZgBnsS9r93leQrl17L1FgdnbkPwM6M4aMOHWDeMy62TP2r4PIX2Bz6oUb7DsbvzSkIvD
 5DBQ6e+uEoJ/5xfFhapiM7DO4/mXWypigKZxqk8ZUxu/bEgzCyNGryBDMuiyCASKd77Y5qmCZfq
 FRh3t95lu9UQR5xb3uL/pt/v/fuys3dMw2okqnYCa5w6yQmaPBN6wTRDwoqe9kNZTiqkaVByF2M
 SxaOCNCmEeVbvGKwTtsSze05O/DuL9mlGtu+Jm8rN3C4W+WbJaoh1p9mJSHlcp1v9omtZ29y25o
 jNJjxvsfFdS+8BRvmk8/E2mSw8XWisiLxMAG8/P2i9qseZyb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyMyBTYWx0ZWRfX0oStPjNuMCUe
 49CHBOnLH9HPgvnDfV4u7mrblJlAMwmJ3SUqzAU9bScVm058PSGEIfeF1n5IiL+0Sve4aMqQoCz
 7G5X43O+IRKZ/dTlMv2nK5ZSpC0dqM61kIEAXNojT8L1UJH8GOlj7EFABubjDQgt7JTSVMFSkaQ
 LIRWrTHJKW7DuGA5MwJ82M9SxUiJp5LDKsC8c6slB7cNQ++lE2biHNajsAIONMKKPxzQiWh3P1h
 r4yNcDhjv7xxV0VH8c9jg1A99PXXy/Fgo7zK844b3eYhWy+OOn/gZYwIr2YmQvUbY6eqwFH4fqT
 FY07p+jTsoNaq5fRqhepXBA52gPF6UzG6b/uvt4uLP6H7usChy/bqI5djmqSi6/wsGVijks9OmO
 8g5DdEBX9ql8phzNJf0/J+KJbqFyoy0ufD/Kj8+m/GgOb1kTdvsuwjVrI9EbHwhIA7TRsvHC
X-Authority-Analysis: v=2.4 cv=UZFRSLSN c=1 sm=1 tr=0 ts=685f5b55 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_Kd42T_lrbdN2LGistIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cqH_kaYNNdOTNdD7yWwLO7hOYJGzGUYo
X-Proofpoint-ORIG-GUID: cqH_kaYNNdOTNdD7yWwLO7hOYJGzGUYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280023
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

Handle two cases for Adreno 7xx:
- Adreno 702 follows A610 and A619 example and has clocks in the GPU
  node.
- Newer 7xx GPUs use a different pattern for the compatibles and did not
  match currently.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 6ddc72fd85b04537ea270754a897b4e7eb269641..97254f90926030c4a4f72ae5e963af1845f0dbbd 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -187,6 +187,7 @@ allOf:
             enum:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
+              - qcom,adreno-07000200
     then:
       properties:
         clocks:
@@ -222,7 +223,9 @@ allOf:
         properties:
           compatible:
             contains:
-              pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
+              oneOf:
+                - pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
+                - pattern: '^qcom,adreno-[0-9a-f]{8}$'
 
       then: # Starting with A6xx, the clocks are usually defined in the GMU node
         properties:

-- 
2.39.5

