Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B71A9C448
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A117110E91F;
	Fri, 25 Apr 2025 09:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCHfUH2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4EC10E918
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T6YH015996
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TZfczLUxnWTdMqDmkRvetbnLGF6+K+kBxElbD/jIQGQ=; b=mCHfUH2eedgMf8ua
 ulLCCbT8l+iO9zEcYHxVfAEbKNLEPjskH6QYR4aFYBOmJXnpSM03V2bXh/F/drKQ
 4cVAJv8UBOyV0M3gOz2X9rGsOD5iIk6ASu/EMV0ASJHRuaV7azWaakkhKWt8P2lu
 jVl5mCOHytZiKDKP6xtUHuYCReLv1ihhWOAE2jjARbQOkPpNca5xqI/1vsDBgsi+
 1bnaxGr+CEn0H5uTpuS1Tp0v6IICM7smLCuzmSnISk383jrM7R6+fZEfvmV+gnoa
 ES3SH7dV2FBN9zonP10IKL7rv8Hcwf4jhzzm349/LSj46EfuYozOQyeye9dy4Er7
 aoPQ3Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh08jjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c791987cf6so422905585a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 02:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745574723; x=1746179523;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZfczLUxnWTdMqDmkRvetbnLGF6+K+kBxElbD/jIQGQ=;
 b=HLPvoy7M9GyMjVl0kV30EE4mu8PONfi7XMKeJMbHnnir0eEu1hPZnq8G+8YRKMrycW
 WwKDqYTsOdubKdLHrWodlZ8AXrIw4HwfOu4B9HA+5sokmVcQIZmmuRW4soctQzwYmvuQ
 FnRBfcbmqUQLu9JrF0r4ndfUTAhKcEuc3rkW+iaS8XkYwfmbiZaaZsEFsSXG3i1R+hyq
 mLjNJVdhYLfELg0uBaOuxyWL9Qxtb6lT163W8LFYou9lUBfG7hm5at0sluU3B+qT+i2V
 f85ECFJ4LzyNNbLa6gcUdd7xzFF2D5dxHBLAt6s89u3bX47Rb6mX93JdefpcSnz4atpC
 eV9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWojWH3ekm6BiRy3n1/deyf9MUxVRF51S34wWMk67vhbs1UYqWQeQ/ltFgOTWysLI5I6udpLQZIe6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJdVUgEom6E0BQjHL2OoM4ZpJOqHpZJTTXqb2YJBL9i1lJxavo
 VQIV/PqghCexOhvV7KCMBTxP+OQ1niQ6ALMrt74ZYPSpDzXRx5kt/NzTLjHb/e7RooJpdHvnKeg
 CPhBAohWngCJacnssgC86/zu+JJaft0ir9IzL1u6tusoxc2+vvhtfajQ7pww0B2085rM=
X-Gm-Gg: ASbGncvueNm4w6qSfCLrj5YMd7nrybRGSTANHwi11wEOSxTarSf84yvGQTTHtqRQ69O
 zyDrHesd4+dB4EwXbG9bokdE+fk9EdJZ+zGLO/NEUKAJuS7+DN29vj2+UanRjIJsmBMZxhHPEiw
 rOhHkYbO40hIOrXRNHz9WxoxUSl4vwOafE4GFVlm9WdwYiCoJKcGUI8AcFxyT0RBBq+dpDmQyXo
 YQ7MEVxAJXRodUPFdQYvlv/M38msRu/HOng6zJ1wnL7R0+W7lPH2k2FoSNtgFnvb3beN3Bt/Bvt
 3IbNH07q2F5ssta9whzJixEisZQe6FiCDpzVS/XTGbnzOD4stPLHz0vTj/+6SIqSeiiwQUEweGg
 fXniP935hyM+T7Q3x4uqvml8A
X-Received: by 2002:a05:620a:40c4:b0:7c5:53ab:a745 with SMTP id
 af79cd13be357-7c9607a9524mr306226585a.36.1745574723408; 
 Fri, 25 Apr 2025 02:52:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcOR5RT8Ys3lrOEeDC6ELuWjVuKpQ4U7qX2eJ0JrlAWEm5qUDXGcz5n45dHFY2oJeOok/1nw==
X-Received: by 2002:a05:620a:40c4:b0:7c5:53ab:a745 with SMTP id
 af79cd13be357-7c9607a9524mr306222285a.36.1745574723063; 
 Fri, 25 Apr 2025 02:52:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:52:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:54 +0300
Subject: [PATCH v4 4/7] drm/msm/mdp4: use parent_data for LVDS PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-4-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5QLeLaZ4u0g3jUxOIWPZIeS25ToIY4u/0NRZi3Wj6kk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5iD+ue7B/ncg0smiCdmNNJbzhQ7e2zXxwh
 CKQDUKIPP+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1cVsB/952BXavkqHOo9fTgYGdajfI8ZXs/aaV7h12vKdVkwrLrXZPXL9YdKOWBEsnBCViNDKJz1
 Sirzb/XOt5rdGdbbG9Jrkkkl3EHLgHvvpAIuJFeOjVv28YnIr0Ik7nKELJLcU8pxyNLsIsSvHQC
 cXg9YZFkfWhqvC6M/UNgNqLj1hmh3Iy8qx6I4osKefG/0EhTWPYMk1/K/Hfff00JHQ9PNlExzay
 1poSB6PmItQqmNE+OcyvBHWJQRi6YyL4gps1DDO4CstG++o/Rk3da71KT5wnhpdKvpLd5W3Zbig
 pZ739t9ddffJrjlDV923QPmg3hLU/Ov+JyVSbN091wfkTz+9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX1OaKbsm4v7xW
 KIqIX4e95Z8O/X33EzQswWYRRRMcybXPQG2J8Xor0xbySXZ7BG/ZXTluk2PK6ATV097XNUWLhUM
 V+W8h8jfwV5Z9AaJ3NEZrBWwxBtxljFWxgR92yUyFHSgKWfWLbGZIpuWVq7PJ0Y2UhJXh0pnfUP
 tAe3MkuYUleXpQ6ohJOTTlsR0r8AOfqnxMDz2qzqsPhdiNWw8/usjT5VnpWnGr86RHehgeOREyO
 N4Dhu2u+mEGLaT+BKj4YGf9Cg3hMtUe5C2tPY4G1fgEGqAZV3bngd7Eol7blcMM1bxkuzQaixZ4
 9bVqZRDs/EHFJ1uaDiqII2gAlRjxtuaPe7ZPWHCdzeGAehMQm2+J7B6BQkG0cEavbDQCwIIxaTU
 FkJYke3jzKZNkj/q0gQfI/Zkj4/mFffRgo+Hj43bWpWRTS2/9jn1t5sporUp9l5Pfe92UFti
X-Proofpoint-GUID: OO-ihLkenksY6JM69TJIX_6-m9VopwJY
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680b5b44 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9KfIv9cJTkqftt8VF2oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OO-ihLkenksY6JM69TJIX_6-m9VopwJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=989 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071
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

Instead of using .parent_names, use .parent_data, which binds parent
clocks by using relative names specified in DT in addition to using global
system clock names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index df2bbd475cc2a11da20ac07be8e757527ef41ae8..fa2c294705105f5facbf7087a9d646f710c4a7fe 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -122,14 +122,14 @@ static const struct clk_ops mpd4_lvds_pll_ops = {
 	.set_rate = mpd4_lvds_pll_set_rate,
 };
 
-static const char *mpd4_lvds_pll_parents[] = {
-	"pxo",
+static const struct clk_parent_data mpd4_lvds_pll_parents[] = {
+	{ .fw_name = "pxo", .name = "pxo", },
 };
 
 static struct clk_init_data pll_init = {
 	.name = "mpd4_lvds_pll",
 	.ops = &mpd4_lvds_pll_ops,
-	.parent_names = mpd4_lvds_pll_parents,
+	.parent_data = mpd4_lvds_pll_parents,
 	.num_parents = ARRAY_SIZE(mpd4_lvds_pll_parents),
 };
 

-- 
2.39.5

