Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48463B34340
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9619B10E4CB;
	Mon, 25 Aug 2025 14:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pe2zFT1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248E510E4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P87RKM010519
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YmocC4ftyVaWVSgyoHNfTRGjizwe6D9zwARFQ5cI7Ho=; b=pe2zFT1FxGnv316U
 x/vKPLvcGuINyo3poA+wFMjeutaALnAlPilwcpB6vgFS1lPIGlquxi/k/GJ1uXiK
 LSp1Uhnp5dMRKjH6DkmmL3xHaVHSIGMK5YryFB+AfC6+A/qtpGF20xqaG56FaU8+
 TmQAYov2Lu46rQBe3zC4lqAglAZx1+Y686du93YO20Z4umjuVXUcDfZ4bwufjFt7
 wG9R6Ufqki8kR4eKDqI9W3y6iOqZK8N0IgSS+FVSvxdCd2tLAGh3N/sHo3z/2rGc
 UZsbEyLchC0X1I39+HOp7Ac77zEAeR9xhxDLUIR9FwcNmsA1sUa9Fb6yX4KPlEuG
 uSz+Wg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwbm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-771b23c0a6bso1836255b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131551; x=1756736351;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YmocC4ftyVaWVSgyoHNfTRGjizwe6D9zwARFQ5cI7Ho=;
 b=DULbxbvBDsUIESkX3lB/uJjWx5dexEk19a7cOP7axSJA9XkiHy5HYTScdTAVjoIU5c
 cf2nCwSQuoeoDnKdQiaLZNMkUHZCbDs2X+gF7K7uxE/Imd2j7UEIUWqmR5lPTYxnckYo
 Q0B5fH1EEwyosLF+UVc0YGYuyE7mkjswbtgWWi85+D49T4jYDDdOWJZK5xnlMfkDK6g0
 KJDOPlFM9BQXk5HTy2zyP3276xYPrTAIv/TRYw9TCod08zj7NAw6a4G3ignMom/D20Jr
 UVdTa7eFZFfPZ+Bm1LCAjN2z+502bJnjzdfGMieOG7kqLmTToQTN/gN1RKyVaCy0H0dE
 t49A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM4aPpBnrTJjhh7c8imm8BmmWhZuU8N7ANdUq5rxpoop7wOdTkB6KZRFp9qKklEC2S22o0oQOYUsI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUHPLGV4bBmXVLgEZl3y02Y8NNx670HdmTPpL+qtb/61QfNGYb
 abvBeba1Db5fvRo1rwMecEZ3qti//xC8cbDKoq3YOFta2YW7tWXb1erSL3XtZBRQXsmZnP69U22
 qx9XYj0ZXjyGz68/82ml6nuxaYxWGLJCyIwYbEHgiT7pJxtB8Nl6XoTP2cdD9nMx0V6vk78k=
X-Gm-Gg: ASbGncsepA6qwP4NSHQAA2gMASPshDVlNn7WlmkfGku41oJacOCyxkqk0KTzW+Q2G72
 XEqIvDewn7FGUNgFdKM+5Vu5mASYVywZI10G4sJpVdftlVOaS8vx6sfcuMMeiqhgkRFVMQEeew5
 EApbF/wM2Jzo0IskFvcMeRWwBNwl8RNRJNLRo1arNnZTzV+hcRuTDPMk4uFm1xTB3dNRw+Lvfv4
 /TwoEmBSbFBWDNkCFoXd3E7FLy5AR/XBlsRRLKZSqlnU/QJO8m+Pq//Td1sKQ1w9BTB5l3cRnue
 Vy0bFgGj70/thxKK/HXXPL/KsPrba9oq6lwDP9Za/TDtpQQhZLGANTNc61VQwYlCIWLtnXY=
X-Received: by 2002:a05:6a00:a17:b0:771:e8fd:a82a with SMTP id
 d2e1a72fcca58-771e8fdaaa5mr2803032b3a.23.1756131550515; 
 Mon, 25 Aug 2025 07:19:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcDnzJ5RfYiEwv9A01WhZOmceWuXE7FYxb4e0UXQzViegEhpR06sENZJcy5WADZk5aDdU7VA==
X-Received: by 2002:a05:6a00:a17:b0:771:e8fd:a82a with SMTP id
 d2e1a72fcca58-771e8fdaaa5mr2802997b3a.23.1756131550028; 
 Mon, 25 Aug 2025 07:19:10 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:09 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:15 +0800
Subject: [PATCH v3 29/38] drm/msm/dp: add MST atomic check to
 msm_atomic_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-29-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131423; l=1376;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=8m/NmAVanmnv53nLnyrBMfNFZLTXWJekt8jy/qfdBFg=;
 b=u8gitSXMth4muAJp3+xoeK5RxUPyF1SywZCDE5hkinXcdd5++I3Vd2b6CfisCybuJNCaw3Sx+
 YU79iwt3eRbC9x0AI8+HP5lq7cTUavE7xpEFgbcoDFnLiqoiDewyvDz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX0/CIBIqxxHbO
 kxALsP/jfgPDl66ZlC469TvCI3hVJz1BH3LtB2cAbz3mPkr8jGUa3RlqSfEOjaMoK8dkXAem4p/
 T89lJujJjDPaLji8/Vyi/UQPsNkt9WW+unOlbyiZDGTpbae+wPVkSCffb9m1+N4bz/A9EJ5LH1V
 v83jMM/yQqqpq/i08TioTh/Egn/voCQ2t6RaHAbSQxrtanWikF9vMuFU3+W4XK4dalQ7CmV3d9T
 au3aHt7MEn62riAzIlq11SVKjFqhyMBbeCCdRoGjB6pOWjuQTQyVT9yttzoz1OM+GfTLU71XVtd
 70CZl3lIvBDqhgkF9aKHFh0pf4Csk/YR2IzsKQOqS0u0Kt5Ah0BRQNXgEjZjls5GBTmYkofhWF9
 Oxt0H8Lf
X-Proofpoint-ORIG-GUID: ddZux7Q7t7XU7CSGT8qy_cOAns6LO7_I
X-Proofpoint-GUID: ddZux7Q7t7XU7CSGT8qy_cOAns6LO7_I
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac70e0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=V2CHa5tHbzOdfKvFleIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
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

Add a call to drm_dp_mst_atomic_check() within msm_atomic_check() to ensure
proper validation of atomic state changes related to DisplayPort
Multi-Stream Transport (MST).

This complements the existing drm_atomic_helper_check() and allows the MST
framework to perform its own consistency checks during atomic updates,
such as validating connector states and topology changes.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 87a91148a731dc911f30695add4c8f5002770220..3aa0020dec3a90b693ad3d4171cfcffc091aad4c 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
+#include <drm/display/drm_dp_mst_helper.h>
 
 #include "msm_atomic_trace.h"
 #include "msm_drv.h"
@@ -207,7 +208,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 	if (ret)
 		return ret;
 
-	return drm_atomic_helper_check(dev, state);
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	return drm_dp_mst_atomic_check(state);
 }
 
 void msm_atomic_commit_tail(struct drm_atomic_state *state)

-- 
2.34.1

