Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF01BAA8A20
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 02:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F5210E172;
	Mon,  5 May 2025 00:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HL1NeU5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D1F10E172
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 00:15:08 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545002rL011348
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 00:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d0wLs0iVHofkv4RiL71eod9NJCAwyTb7zT17L0PQFSE=; b=HL1NeU5OLXXFcxXy
 TjxFc6NtarcUGFTLNJwNhYH30ubvXysRIKcrydvpwYpqJAErHlC5QSk7C69Ygyou
 oNgK9TODN1LMY8bueOKRi6Em/mCGU98zB5NLOoWx1YhFoE5GFGw9mKe1Nki20Bbi
 j6P3oY+ZlPTMpNSuXtV+fq38TqzNYDn5uW14MWocJpMZTM1Ml+lRVeTSUwYSRBrY
 wx1NcuuYHmbJteRKsUfc5VVb0H+o/DHip9hVaERvDW8VLET+E+p8/fYg5QgF85cY
 peBqqy2cdq0rUmC5rmyXtx3OcCrEOJDCM0lyeQPcTZimN/j6yBixzqHpFXw4Khi3
 asiWMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rtpn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:15:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4768488f4d7so62180891cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 17:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404106; x=1747008906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d0wLs0iVHofkv4RiL71eod9NJCAwyTb7zT17L0PQFSE=;
 b=a1nVAPvn7/ZgvKJHr9vA48atZwVt0wBqGLlOarADTab3SwcajTMKIuNxDAW29IY+JX
 P+ANK5XtLKcvUPKh3bOR6mdoihnRjP7VNPH8pmMlrliPndv+67qJsyarSRpIA1N4P6ln
 6VccPeODb5al4Pmn3rnRifRirYstrNo/CaDKBRMTsuemSkrQk2fu5vcQRa9r3Fjv6cKa
 ReHa6XEzdoNT2YzXQSkBXZtVATrL7GL391pUi+J2rxjg8f8FhF10SrghHPMDLv+6ok/h
 Rih86+b3oY0Pp1CR+l8WiRw5waGY8r503JsCnICxUFBNoLtta+MwP+8nWRNc1/tLNm/A
 0jaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs6ZYI/rlzWerQP7zO4ofgDTjyu3FVihGio1kPB0vaDl6UJB7sl3OoUMM0kCuCIQgnfrDnzFSbN9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoVlRqUc7mR7m4KO3imw5DREWlyH92LWQ5PW1HJTUPTrtKz6le
 uFp5G7vTNB21tEwnZ3TPe9pTlKv6rBT3pA9OdRG14YWiCSd16cLXgTeIah70yLHDCXj9C8Pehhb
 fjS49z7hz7ortZ4+o5i5tkHeIA4PMOjPFSqRh+z9N0uWls3io5xDZ8gUrnqKcJG7p2Eg=
X-Gm-Gg: ASbGncvpUuaZTCvdwEOyYcc1aoD+6X3wGqjuzKqAAdICW3keQ6FkPProZGvl4X7++BS
 8gxhOQkaLZdd4EbqiYIIgapLJOEOn45Ii5GVFH/w3L+z4kUSkA8LCBDn4wj4elwp+6U5LEXcqA6
 GjRkoAP5bUwhHroU3P605ukJMAES+WPHqH7QcEGhYVXpEA4TQme30Eh1cB3kyjtZm9R6ERm1ufn
 yV/S41lthZ77VNOY8380vqFGZoV0uL/8rQSCRWSSSSYiK+xLnoUAdjlit4VuE2Xvz3RpJ4Fo9+u
 mvrkShQqUulmCHOfYLR4+c7bFOzAaXWB87tQGfbo8/6INq+HyahSUZv5+lfOWbuWy+qFyyUM51m
 no27LrYeUdfMHzju6ztbzGBst
X-Received: by 2002:a05:622a:5585:b0:479:2509:528a with SMTP id
 d75a77b69052e-48c32ac7333mr177680201cf.42.1746404106142; 
 Sun, 04 May 2025 17:15:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSLLxowO0dJGPkvuX9RhOj9QBfPznkAxKoanIkxu8WWIzBNeIlJLloQOmPJXB6Ug9KK63z7w==
X-Received: by 2002:a05:622a:5585:b0:479:2509:528a with SMTP id
 d75a77b69052e-48c32ac7333mr177679971cf.42.1746404105839; 
 Sun, 04 May 2025 17:15:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:47 +0300
Subject: [PATCH v5 03/13] drm/msm/hdmi: move the alt_iface clock to the hpd
 list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-3-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OUSREmRh8249bUIyNnvM4Q8G4H+YLOauuOGWEq+Beno=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL7KLXUMBlRbyuEJArZP28ojba3pXgt+c1/7
 okMpiFlV4yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC+wAKCRCLPIo+Aiko
 1Xm6B/4gs76RF9xtIzBzLSkxCGgpkPU1UtrIEEvR2dHR8161J3VbiGvR7Ho29PviL72l057riaX
 NrQAUbxJjM3NBSI97ryLHmN3LAFCjIKCPLGGg2jC8RcYRV02KzNB5KcXvfLOAarTKfMRxxLCB09
 bZTxJOrJPbR9Q76Os5esA7DB7VasvSsJrub2zlYxD5WZTtMIZ68bCGJxOgkMkdsOS19tVutXkKZ
 DxpQifCrW9U8CIXk3GVAU95EdQUpTwBucj0J+6lRmtf4R9P80W4C2G+U2KBogFT5hSdvCU8MUy3
 vw/9EYy9LjHyseDqJIoZCglgw9ae8APErjI5wti7eMo6y7lS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: RFNEMoKB4XUo5XiBk7K8Z9xNz57q0XjL
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6818030b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=-Tkwmxe0xhrxJHpsn9cA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RFNEMoKB4XUo5XiBk7K8Z9xNz57q0XjL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfXz3XSH23+T844
 OCmPncMeiSw5Yj3KZb06LjQMrLWztmbAoPAVNMi2Ui15artxyddBQmTRlrye+vf0CItZdO5mP3n
 KrMrXD3RK5IK5I0mSVCSeF16o6VejUMx4uZ9uCdF/debDNeUxmYBuPnYZ+Kf3Mt37C2lygquM3P
 1adkO/cs2vHaXD8JwQtP8beJNPU+FUQYWC2ci7UzuYbnWbvUj2o/njyQUtORwAJJOBejTm4dX0w
 qqqDNlbUsQBBDsqdJ7Evb4rVgTpHDu1eMxMrkFs0TKSHaogrSo86I2yTVbBMEhBspexiKoFpHQW
 iklNTYyBXS6HoPalxttwAdC4K3dLRyXfOACyVRvzr4I1YfzE/4FZp4lOaWs90qPa6O2kYiLBKD0
 BQ1Z+LSQTYKqup4Guzo+Uoj2zijun87cfOJ2Vn4WmwgcSsL4RYFzHy+/OmfrXJ4s9Mvywmq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000
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

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 9e9900882687fa2ae4a734d5cf10b5bae5af2f87..ebf9d8162c6e5759a3780c74354b6c159598750f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -233,9 +233,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char * const pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char * const pwr_clk_names_8x74[] = {"extp"};
+static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),

-- 
2.39.5

