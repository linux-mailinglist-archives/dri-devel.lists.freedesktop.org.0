Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8493AA8A1E
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 02:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB2410E158;
	Mon,  5 May 2025 00:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vra3753X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633D510E158
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 00:15:04 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MxxMO002814
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 00:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yWQo4Z5PDmysZkCoY6xDQm8GNhU23pomDWkcqd41CLs=; b=Vra3753XLpzj9XhG
 rLOCnw+ZFpvaLCo9PQmpjqii9BLcl4fPJP6eJIkYRm4Qd6O7pBeIAeRHfQkmnX2K
 239xwd0UcID43in+N5PcRWnA+4gYf8hyFLeWpC2XLYsg/ftQjk/udiPeyVyqRGh9
 UyIHVXBgRSUoa59ZSXNAWdTiDBQVIc3a8ie+43Xr0TOazFJgnCGKRsYH6mQJVKun
 OEtJx6Lx48Qq0T0GHbmT0M82kW9a5DNN37EZAsTBHKUb3va6vVsbM3Q00PK5xwy4
 1aU+1BQDorWitpwVEsf9cX7cY8weDartyI44uADGL0tteX4PyJbGd9bW5Z9wcib8
 LBw0yA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakjhhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:15:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c7c30d8986so491028885a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 17:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404102; x=1747008902;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yWQo4Z5PDmysZkCoY6xDQm8GNhU23pomDWkcqd41CLs=;
 b=LR1k88cydBH+ckl5uUCBt6KHWN8l4KK3gCzzINbOPM7MNDF33jdy8wzMbEgls7qX+Z
 JA0HwsCozdnqB29kiuxFMkgHTIuWbNFLTFi1ROzMw/tUtCXsss8RzJ2k+TZedu5ve7Jd
 7ECbL47xlEPQNfLLDTg1qx+JeYmEXcMykZu2oIY01wQp57QPzRztRzsJEYdn8xaTEF9H
 UxkJPEI+w2SLft3J7BGbrSUUX/lI5T1wDRGqSmMVZkAhKMtoFCCazRckxiuDNv6KLtpk
 DZVeb0N1OpD8bzdwf/FkUKHhyB0/Ee9fZQw8891lijpXriTrjWKNUrPXpohwbAVBuuPf
 WGIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrjumstnYQnSEl3uMLHo51mI49x3RANCWZcihnXjuwSyknyVZPDyKCB1V6xZ4aezQx6eKDjdnMHxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxfmr8wkyJcZeOvFtel5nyK0F5iM/mfBmsG0rftnO3r+jOJr2fa
 +r5iaWSSgXPeabbigiVjQKxDXvVXujBlgV3xoAlPKvS/EghEQZlFwTB7xo33PtOYRsjefqqRD0q
 Hl6l3eXZtcwgPVU4JTFxk5H3et6K5rxMeZwn7PYw4MlhYIjFEWgJRB2YBxS4nL24KYg4=
X-Gm-Gg: ASbGnct1eWM+eg0WLPrufG8NnKlJOfhb9E6i8kkrWEB/eYH3yC4awyh4fANV77n1YNZ
 9Aw/WiHugQHlKDvH8XoaabuUPaIu+WP7Uybh38IBX2cYcQMfda4Gz4awF97G0QZ+Zro7UnEJi/p
 3IeEfFScnNAKGqu28qVqvtJE/qXF1ddb9crRE4twEIhn3xLTGr5lSt+uUfXWEncpykGgUrMy1Sj
 bTLAWQsrCZFn4Yd0xFSVTuooVIRj40lKIl1RSDvzPRspQnOxAbZYhNjGtwCOw15k2gZ33OXAp1g
 DbKRdxpIHSB3dWHFcYU/HxTEiUnmagFlQSZtXUq8hwPiK96mooQpW+aSD6uskP9kRdbEAhljOJ3
 1fNNAzMgCQUg+iIHDq842l+z3
X-Received: by 2002:a05:620a:414e:b0:7c7:a524:9fe9 with SMTP id
 af79cd13be357-7cae3aa3a7cmr896858685a.27.1746404102525; 
 Sun, 04 May 2025 17:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdrC3ycJxwH2BFRg4EiyOh6BromHc5ZkAaskVVGgI4h6Va9/YdT+row9ABNiVdh8lkwLCRUA==
X-Received: by 2002:a05:620a:414e:b0:7c7:a524:9fe9 with SMTP id
 af79cd13be357-7cae3aa3a7cmr896855485a.27.1746404102179; 
 Sun, 04 May 2025 17:15:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:46 +0300
Subject: [PATCH v5 02/13] drm/msm/hdmi: convert clock and regulator arrays
 to const arrays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-2-48541f76318c@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7lUrs50zxWBMH2nsFJkOQKE5+V0if7+ZVLc7E3wO528=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL7jjBvGfEJeiKcCCLimLWwORrs1iML3cwOS
 v/PWWa5PVaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC+wAKCRCLPIo+Aiko
 1cgSCACoTdcO9lLaa/U2BZvy7Z0dCUC8lk/IbILad1+ifw9OHX/97i8usZKH82EYAQIhmtN/8xZ
 r7N2D2jMw3qQD8XiC6JXCjURIVn2GMhFPrln2fHBzkqGM0YsvPlUG8GjspEtpokQudAAqxGQKiX
 E/tUoubpyVWIZH9XrXMPjzBthY5I7eDgLc7gBPcmf2JF1FSKZ1LQSkd5SmQN7xwyQ4oMmZFJSod
 nZPasXJcwNAqBBoKCNJSvwoW15Odj6hNSGbsrnQlXq5SkKJd7gdZyJZM0mIgfEEs36X8uxvMamz
 B/0kp9bpsiAhwUDA1RD7uzFikxbGam8B4Eo6RfrgQXyXCfil
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfXxG/IpR9BC0Mc
 /13syZ0cpbOwnWHruzpeMEzyUkn0b7JKz+dpeO74E7xsFrRymLycmKaleyhbfnHCDkGTAIiEQsC
 5kh8ePOWbhcsO3JByek17vUPZs3/xHCn97jL1VAZQEsOOsK2MQRqu0lRQDKsLS1wkZ+bolB3fHD
 D+NwKfR/RS6dke9cwjbXAVz9zMmEhtZKl7AhTdy8N3fazOjdxtu2OEtfJ8aay7FnqX2i09v41aw
 Cv2MZDg4QlymZJd49ZtxQOs04Hvb30aHCLVsTk7NxZqI3UIuxH3rBzefgWUjm15EdQrpgsgHudz
 kJaLsuWEwCisyDtgahwCECsfTNMddxWA29ohZmOmc9/h07UdRATNl7YTN61peRLIxY2oId5B5Q0
 gdYa3nhDL4Sq0oMo+iPnwcuE8ouhrbAjtVp/IHiXiV1mTUqICUTch3y3slqk5TrzmkOx7A1a
X-Proofpoint-ORIG-GUID: goqL48wEG0hT0jRQtRMxBObJm6nbD-RH
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=68180307 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=cMmCfeQhgp6qDJoOuqgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: goqL48wEG0hT0jRQtRMxBObJm6nbD-RH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050000
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

As a preparation to the next patches convert 'static const char *'
arrays to 'static const char * const', as required by the checkpatch.pl

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 10 +++++-----
 drivers/gpu/drm/msm/hdmi/hdmi.h |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 248541ff449204c72cd444458dadb9ae4a0a53d1..9e9900882687fa2ae4a734d5cf10b5bae5af2f87 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -224,17 +224,17 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static const char *hpd_reg_names_8960[] = {"core-vdda"};
-static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
+static const char * const hpd_reg_names_8960[] = {"core-vdda"};
+static const char * const hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(hpd_reg, 8960),
 		HDMI_CFG(hpd_clk, 8960),
 };
 
-static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
+static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
+static const char * const pwr_clk_names_8x74[] = {"extp", "alt_iface"};
+static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
 static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a5f481c39277631b7a19d294b086d6208be26511..381f957b34305494cb4da0b7dccb73b6ac3a1377 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -84,20 +84,20 @@ struct hdmi {
 /* platform config data (ie. from DT, or pdata) */
 struct hdmi_platform_config {
 	/* regulators that need to be on for hpd: */
-	const char **hpd_reg_names;
+	const char * const *hpd_reg_names;
 	int hpd_reg_cnt;
 
 	/* regulators that need to be on for screen pwr: */
-	const char **pwr_reg_names;
+	const char * const *pwr_reg_names;
 	int pwr_reg_cnt;
 
 	/* clks that need to be on for hpd: */
-	const char **hpd_clk_names;
+	const char * const *hpd_clk_names;
 	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
 
 	/* clks that need to be on for screen pwr (ie pixel clk): */
-	const char **pwr_clk_names;
+	const char * const *pwr_clk_names;
 	int pwr_clk_cnt;
 };
 

-- 
2.39.5

