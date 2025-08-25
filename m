Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F50B334AA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 05:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0BA10E2D6;
	Mon, 25 Aug 2025 03:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGgDr/Fz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F287010E2DD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:18 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OLTEiK012652
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=; b=pGgDr/Fz3Upj9d+I
 At0CdDfKw777H8QMjqQCBobmuLqKx+uNxEtgVEHKcwfFRS7BV8ezxeX6Yci6r9Fq
 NmyNYzh+kIrNMNtV3Amcyp343N1OPnFk+oSJGDlOQqTm5iu7SL//qTbvWU0mucvN
 1Ja5TsExp3z5vqtLS9ygTrR6yPdS+4rxwwbzI/9/3jiCDWRPQDHFrHiw3qS50eAc
 n4c5oFlmPnGeuOK46EGE1S+Aychkxpvk+l4iqNIO2oys6eZ0SS2NNgtiiqYlO1po
 m5A4M0PmBR43xwbmlA0P1pZKgYX/uwGMihjnDSc8fDHPj1Kr3qFJjP7QuxXnTA14
 rkQ5hQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpkm16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24458264c5aso43073855ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 20:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756092977; x=1756697777;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=;
 b=pUlvLj2WPRJuA73yi6qPLGtWMUQ73GtajZKoA/2BT87D4GnXHPmic/ia5+t8Xu3cCM
 emxZA2+R8/ScaAI3UcbrtqDJrM1fDQYcgGqASre/FP+3tO19V4vhQwbgz/I41i9dmzeo
 qVGJzkwZDdyALb9VxU7Cf1uGl/+oYfZy4Ng4qAYDQGn0RtMBW38BcdpTpVBqYw0T6/nF
 lLJswEMMij+rksu1c6X3sJS5wmuH9xugXX2ryAKa26EGBMFAo825kQCuoOCM3SJfQXqO
 qF+DFvMpCg/aU6Fo8jXIqRcb00SyYg3UYQOU38dcY5bpnWX502fHy2DFnKpI3M5yAQ23
 2rIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsN0pW7AsVJMByVXZeAeKq6TcOLftiC6W7fVdQBHL6Qfp16XldbI3Ob9bkXyQxHbRP4BbGX3pDHO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF+nwWqgzZ07QHePKLedIsZ+jCkch6rmbGU6n+9+PR9K7q30wJ
 dJPpVuKcXofpQtNv6DzmYSZwjB+Monz8yQvsomLDYTzi0ge9sb4FB29Vxit4K94XAIIEUvu/VA/
 GYB7Qzq9S5mIuFnK+ryGWSqUwK+Lz/3furNDflgH2LZ9HeP0BFfW+BhECpEWKg0EocK/iYSE=
X-Gm-Gg: ASbGncuk5Zxiv2llKCCy++/cMsqXVwZ9AWaJtafZPkwOwSOYiGTHFdTTnABPxzjz0Ki
 G8/PnuZuDKGVmR+6rkaS0iyjpjqL3tORgkDpdQgXn2z6RHpdUmarKg9/3OEyoi4MWRgZOq9sj8z
 m/1d26KH8S4f7pn6kYF12jFaobeYzvnROlLZc17MudNxc3oPfhsvBUhyWyoJfkY1Wf2DmAxtnWJ
 MqXTXHGEmNzAuGSTvpXu/J9NiruVeZO/iuZ9L95aNMge7FdlDXInNSIGLokiK0v2loLdFTmuBc4
 OD0x3P1j9oZcM92xaVL7VS97nQWYZGAjWuhR4k68FI/LEucR3a6aqRzAIIEfY4dBp760u1k=
X-Received: by 2002:a17:902:c94c:b0:246:1c6a:7026 with SMTP id
 d9443c01a7336-2462ef5fceemr147015245ad.40.1756092977442; 
 Sun, 24 Aug 2025 20:36:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUHF1EOpueF6zxgZFcVMl7eVaFCuRiBqihrB66vAAoQ0pqCcjvsZWuWh8z1BidLoA1l+DrmA==
X-Received: by 2002:a17:902:c94c:b0:246:1c6a:7026 with SMTP id
 d9443c01a7336-2462ef5fceemr147014785ad.40.1756092976954; 
 Sun, 24 Aug 2025 20:36:16 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 20:36:16 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:34:25 +0800
Subject: [PATCH v9 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qcs8300_mdss-v9-6-ebda1de80ca0@oss.qualcomm.com>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
In-Reply-To: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092927; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
 b=+HddgfRGfsccGRo6kGLEJNIBQn6m5wNdaACaxKf7tyrPNIGgvaclwhJLOqcbQW5QheaYxKVIC
 zxQVvicexOkAOWG5myMhf6iDOKDelASLJfIQjhcr7u8lGqcq2fdmsdi
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68abda32 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=E9mFum2VwHQHOKsBOicA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: NADGNjQmBHafkCsy5J4rl6OPKnzf2vIw
X-Proofpoint-ORIG-GUID: NADGNjQmBHafkCsy5J4rl6OPKnzf2vIw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX6oI5f/DqBtf5
 rS7Uq079pg+efDCYWb4cmiiW8pdoxFTXzY+tCewY0mW5h+rdus3FaWq1kOoxh+yZE/hpcsJilka
 cx0RnGB8T4Sesv5oiJdolXxOqw3iQgMAvAcg1Df0g2OjUP9K8BujtfruUJpHHVlkL7yw4zvUVvN
 iQBlx1zxEh5TPjvr9uH2kJoEa1ybheHTYVupxUavIFAHe7A5f7OgEiM/vsfHdsNGNzxAZzA6iEY
 bWEKmhnImrhaIVNMBGW271EfxmtzOx03D0UHnNGVL+M62Xzw+0gW0IuZ1R830TUg7FCT7PqAPpj
 PhVUBdxyILSkK6JhCO2Zt+i5F+zgvgGrfYHImWTlAEhjouwT7Hqof5cVeXm774c2wA2XVC7Rudf
 hi/pEB7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

The Qualcomm QCS8300 platform comes with one DisplayPort controller
with same base offset as SM8650. But it requires new compatible string
because QCS8300 controller supports 4 MST streams. 4 MST streams will
be enabled as part of MST feature support. Currently, using SM8650 data
structure to enable SST on QCS8300.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..bb4660585849d1a67921a28e7e12422e0c327ab2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -187,6 +187,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
+	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1

