Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C65B0B5D0
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FBF10E360;
	Sun, 20 Jul 2025 12:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVvYvTWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0C110E363
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K9dx24007840
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RghYj3as/mFUON2I1wz5/fAj1x0bQSOJ2EkHGXZdsjY=; b=MVvYvTWT9/RfiFAT
 mRu0Jvbz2/SOQ/CrUd1Mu1oI0E+n2YTXKicJ2IkAFeIwuVOoaQdV19qqpE3sk6mT
 FrfaEr5UdLhTAlrdCpGFF8IyEUshtjAL0Vt9zkLgoq20I/TKv0FSNxN1OeZZxPpL
 pm6t8qP5RVtz9aYEZLSFMvqdiThbKTcrTaGvZl7rT0M3ZEPzdJbBtdN4qFzG9Guv
 m/yfhQHYi+Um0DquLTB2hQs23iOlvWFsOEfp0gIFv8Qsoa9YnBxmTrU/rDgbOcpi
 tSmpkvGSQGFYP4RGikOok6ahRlS35RMdK9VhaoLjzqR9fuxnfevXNBhQgx2I52TK
 /VtpMw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804hmj3yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74b29ee4f8bso3202107b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013814; x=1753618614;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RghYj3as/mFUON2I1wz5/fAj1x0bQSOJ2EkHGXZdsjY=;
 b=bsbjd3x9D1MexMoIbnicfQwUEJKGeSM4NYj7dV9J7RmKb7tc//vE0w8i/2srJ4Esos
 CdQXGLSm9WpzKjWFNVXuzPdnixTlwPeqdGq4zrr4VPukf5wF7ggYs++39/4Ikem5P8NE
 mR2EZUtDxBmaL2nwLTsO8/mqlchWnquO1fUjQjPi+z8EQFg7KbIH7YdTAOx08xUV0nUA
 WBQb4QAxlI4A6cLD4xx/JA7hNgJvzSKAQjxpefctp9vmu8txUcP4gOsNpK2XRCArf8YE
 ORV14L9FFL+E5Q2Wo45sYDj2Q75KEGvAa4CKgTPwEyw//tE6jcnQpdByOKKlcp1Ae59s
 5PSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSQdpcP5E78wF0idSGXIdY82Vs7lfv0VSJqW0cA0ST+qQGmegnGMS2RD/6xkLV2CFo8bxeXApzRYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoDzrY8dC6kfOPcYyp+5EGJz5cRqhGS1nFhc0d3+UUPJiBlGHn
 AgAs1Y+Xm7HMMsJg8pw7dkQihUYTkFE9SJWASvpYFu1inR3PUAwie5Tfpste0E1exxuql248NLr
 LrF4WtVImc0JSRiGw7mSG31p77c9b2F4MAD5UiXLrUEW+OyUFyzKHILA9vX2hlx6h4Zp3qlo=
X-Gm-Gg: ASbGncsyX6XEB4zfFAiXodqmwZKPvA2cuEqnjmny5NSGt+KRh4G49VsrpwUc2M7IcLF
 DYt4m8HLJNaP/1Dgrad9LgJLzKiEIw7Jh79YcpdqMSJ8V5IsONjSfhSQPNqu5COi4wmlzzMqG7i
 BUmUPKoR0iwA20BV1TPMI6XoJJRSPDepJElU+jm3Hx1hDSK84urAccQ85FiKF60PJqcg7EA6Fp5
 Lu2QLaYP7MrmBPQyiMYFP5KPTMk+pFv3qLN+Xyc/7LNPO0aqOKDTvYbBij+5zz116rzUYrLDOYk
 5x3AgWf2WZCPMUlxUtamdBBTMuHigu1KF4fQxLnwkKTS71vDuYaZjgFzjK5Qtl2N
X-Received: by 2002:a05:6a00:2e27:b0:748:3a1a:ba72 with SMTP id
 d2e1a72fcca58-7572427e405mr21973327b3a.20.1753013814138; 
 Sun, 20 Jul 2025 05:16:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm+33dVG/fds/ip7b4Ih0P+9rPGCwWYA2APgeQY1skgsNIAhOHZiM8LTIZzxoKQic2JN+5Ew==
X-Received: by 2002:a05:6a00:2e27:b0:748:3a1a:ba72 with SMTP id
 d2e1a72fcca58-7572427e405mr21973302b3a.20.1753013813630; 
 Sun, 20 Jul 2025 05:16:53 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:16:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:02 +0530
Subject: [PATCH 01/17] drm/msm: Update GMU register xml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-1-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=2416;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ji+f74TQTXhSJNywxVcexEvz4zhxi/UIu3IXlExTfoA=;
 b=DzsW7cZ/8jSLmGH8hgbMy+4u7Cb41SK7Sn6nWDaSM7JFVA89fFUVKAqxE9i28wKmCfy1N64KW
 xs8lQx1uahLCy34eKdSSDxVvUFlIXiaM0Kf1ehSyEE7hj7qDtvNcXvD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: TmtxqgCIGaxe202gf3W0BklwzpwArggm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfX/TkJydVsGp/C
 RNGgsppqJMsF58pa2PnvyHOiQPVNujxl1t5fW4y5k2uVwOE/FN+yVklNrr/7GtkJAH5o5bxxUOa
 jFSzFypPKlqaJqPLwVjlojQ/y2I8WfIRrh0gzaawoX9MITVKRemv0r7IAkLYoSciAXVu3VR1oj1
 pWa/QdnEwId+NLJrD5DdP5mQ6SBYKHRXR8ybnEv+yOjkmXxaeAOIri1QM4oECOJvpGJfSB4jkBb
 +//DtWYfQYXDeKWPaI7tPgqtCWHIyBAxvD8UlajtTa6p0kgIzwsvwxqGW/yw+fpApX6mIMYwYtd
 J9shxre0wsZkC18UknNm0LcJ113ErHPxusuF8kH+z3XAyzsrMjvrv+sXQqDnDNdCHjQyN9voeDl
 dzZ4T1k6uCcMpGy9LSz2cCS3IpPAfY+cNxPwS7P7ZRl2YK0rltvSGn/RcKITG3RZBB7vQ/sc
X-Authority-Analysis: v=2.4 cv=Navm13D4 c=1 sm=1 tr=0 ts=687cde37 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=FORX3M3cBL6yUa9eRaQA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: TmtxqgCIGaxe202gf3W0BklwzpwArggm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=964 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200117
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

Update GMU register xml with additional definitions for a7x family.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index 3d2cc339b8f19c8d24b2c9144569b2364afc5ebc..b15a242d974d6b42133171c8484d3b0413f2d3a4 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -99,6 +99,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="6" type="boolean"/>
 		<bitfield name="GX_HM_CLK_OFF" pos="7" type="boolean"/>
 	</reg32>
+	<reg32 offset="0x50d0" name="GMU_SPTPRAC_PWR_CLK_STATUS" variants="A7XX">
+		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="0" type="boolean"/>
+		<bitfield name="GX_HM_CLK_OFF" pos="1" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x50e4" name="GMU_GPU_NAP_CTRL">
 		<bitfield name="HW_NAP_ENABLE" pos="0"/>
 		<bitfield name="SID" low="4" high="8"/>
@@ -127,6 +131,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x5088" name="GMU_ALWAYS_ON_COUNTER_L"/>
 	<reg32 offset="0x5089" name="GMU_ALWAYS_ON_COUNTER_H"/>
 	<reg32 offset="0x50c3" name="GMU_GMU_PWR_COL_KEEPALIVE"/>
+	<reg32 offset="0x50c4" name="GMU_PWR_COL_PREEMPT_KEEPALIVE"/>
 	<reg32 offset="0x5180" name="GMU_HFI_CTRL_STATUS"/>
 	<reg32 offset="0x5181" name="GMU_HFI_VERSION_INFO"/>
 	<reg32 offset="0x5182" name="GMU_HFI_SFR_ADDR"/>
@@ -228,6 +233,12 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x03ee" name="RSCC_TCS1_DRV0_STATUS"/>
 	<reg32 offset="0x0496" name="RSCC_TCS2_DRV0_STATUS"/>
 	<reg32 offset="0x053e" name="RSCC_TCS3_DRV0_STATUS"/>
+	<reg32 offset="0x05e6" name="RSCC_TCS4_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x068e" name="RSCC_TCS5_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x0736" name="RSCC_TCS6_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x07de" name="RSCC_TCS7_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x0886" name="RSCC_TCS8_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x092e" name="RSCC_TCS9_DRV0_STATUS" variants="A7XX"/>
 </domain>
 
 </database>

-- 
2.50.1

