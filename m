Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C7A9C43E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19D710E919;
	Fri, 25 Apr 2025 09:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9ujEnMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2666910E917
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TAwS025097
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 E8whSwmbROd5U4SW4xj7rGIwJr7viTDgjWVNxw4D21I=; b=S9ujEnMQR65qi47W
 HroSG4bST6eVXaxvIeG5r8dhhrSiZnEwFALHjWXSesZ21v0H2tEfaMpf2hPn8JKe
 o566I70ANHDNfFeIMpN4Kw0vp5Sh60cAAXTjpieLbeb+/Wq6m/k1YPD5fOK72Nqz
 DCxq6jSVvVwJagGU/2kk7RctbFx/x+Xn056EvcTS0CfoOJmsdjggz0FB8mRaxNP0
 OCcieAbc2cMV6IkVMFmBea9qud6nLRuGu3BurbSX6tb5mBPUYAHAzR6gOMlNklxZ
 jue7t46m21kJV8ZoslxemP1g4N5RqWENOir1RGoxK+YmNp+LNriF8UZDgQJytQZR
 DObfHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3rg1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5f876bfe0so343762185a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 02:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745574719; x=1746179519;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E8whSwmbROd5U4SW4xj7rGIwJr7viTDgjWVNxw4D21I=;
 b=iUWGocd2k0bLk7D4s8oc7jRDNo+eij3AXtM3q807iyfgcdZK5x5oEgMlY1fI25SawW
 8AsC5gQ4N+telYgGEGQeDN0T5D6JfRwi1bl46xTGNSHS+xSPZuRkyMTUT9TEChD8GKxv
 GTPeM6/cY+lbymjSm0qRZzXJNQax4iyJxBrYU5NtJiPmTfGrF5lkwnobkgIPZL66xnGc
 TLVhaHbPzJPE+jw+6wvy1wlhD2g9Tmk0q8A5krjsJWzocj/lYdCglkRNnZMWJ6eh1huU
 zRT+RVsPZKQuNImfWEopwUsDY3OxYGS51i4K5nD2+zvUE7oe596n7CbgalvCdMcHTm/u
 F2Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3Xw0EGermNvl2Zxfp6Z2Q655YkyhK6lxiFb9JPA7GhtQ9luWon5w6HaC51T8WMqCJ9gFbyYMBYNI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhf2KOyguueCObu4Bsd4vED3tTmkhThxMkRB67WH8k3oOpCSXD
 Cwfof0QTu4FbmklCGsxRdKZ+R9Ipnb0fr2vD+aDyVTlV+PO11hpc6+CEyQNX/kaRvU4V4gO75qq
 LCrU/MJC7SqrEwCbE8RwrRLDt6yvS4ZcB/Th5Cr0Id/dOesesrejNntapWo4Xnsnp2Sw=
X-Gm-Gg: ASbGncsSWgdch/jlCzp4njobtxJWTm+8zGTUujQ/YQYNz0/LLIDoOW+03GUof0KxSWZ
 ZR7J4yYaMLa7x1tBHL2wwvXc4cclTCvAHNzEI2LKgnzmmdRSjIswQ10tFW6A8CCMzJVRN8HhTTQ
 vJCdweb1QKEJwuLB0mmLycpVTwfFA7OoY/k441Mr+qcf3TjxiQ4fK13y1+rqlylOVEqpHDYZnHe
 4einSdHqzDk0P74yy3oLyxkdrcAnJxZ6pK/4xkPsvtDLWlFVqeQ5w4J1tEdY4VqkUB7mSJJHeef
 kd8Dcg+746ekhUSBfSipqI4MJL5hUTkVjuarOVIju8ZRzebF0vNMXCQJA+a2a6JtVC/kxxYEPzp
 iXC95qleuXI/hgJtLs5MPPvm3
X-Received: by 2002:a05:620a:3727:b0:7c5:4673:a224 with SMTP id
 af79cd13be357-7c9607ac4e5mr267490085a.50.1745574719232; 
 Fri, 25 Apr 2025 02:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmYWemUx6sBPB/T3b50nXsfecUg6EReTeevtS+qwLs/fKOYNGbkFlAmCHLkfS2+zEw/XB0vQ==
X-Received: by 2002:a05:620a:3727:b0:7c5:4673:a224 with SMTP id
 af79cd13be357-7c9607ac4e5mr267487785a.50.1745574718908; 
 Fri, 25 Apr 2025 02:51:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:51:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:52 +0300
Subject: [PATCH v4 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-2-6b212160b44c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jcu7uq6H+6YPyRALgxceXQ2tUNztuo1HlOXKZXH06DA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5U3r9aVtf/3nh7d3cM3tjHy0GNVxGrgrty
 ABAzdzfrgiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1RSiB/9bNTmnNuezj2sMP5aBdfaObPY0aMItydxeikXSRb/vuIv409ORenKD0alhIeO695iE8lZ
 aG5XdPUWHO9fgXhk3Iuoxbuxrke/rAONsRKGZc/9lP5Cc/gIG27iuLqTcCd6aGGdxiA6QegYMVK
 aVQhcrHrsfGfCIzaOueCHAES5+IThttFM6yWt9Prajk8UQJ7WDcF0UjWQsQe1fN/QquDJgTqAer
 frSmwKpldbpltLgT+QZysn3Nv8m7wXjSqg9pRpBzrmnHwz39Ep6rRk7FlUr5b0I6NxBvVcVfZvT
 OI79VECVQEcvGp2ACXiZFRqyn94aSdIDp0KjjUupWPN/3uXn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: P5cvcJ2NdRVCKrboT4x8VIPPKHQvUrIa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX/YNhiNcy/wYt
 uTwvLEf0XIPoWDwadgF96nMk5XXMNKm3mu9XFQzToKX4ULlVuXQpMojJHIqvgEGUHujUPTyVyAX
 1/8WrD2x0DquNZmBJ+EkwGvc7pYkoFsvpeA2d54F2by0xCJmoGxRZgnwX3aQ8yHt8DubonHjDRR
 79Rzkz5fdJcdRVwvfFGkfEjK8cH+QbhstKleoNpV2Qd4VfNWeEPnLoKsI7eURpfz0aFp48f8/Hm
 dbb39xn63nNrin3kR68TzB3hln6U8ub4gOjWgBVwRq9ozF5FCvfuueI8rOYiEXb7l3ftbwZocDG
 RFKjkxIWaCpQpv+G5r7NwOH/UkFYXAzvy5ZbvC+AHOda91IHpYZTxj3Dq/Bzxgz1UYG7CFVteOl
 wExFkSNoMdSvFpMyu1mvjeJwEpz4ZvpZypq2wc/tPfx9bfDekXrMGjppfDNUeqaEsDtO5cFE
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680b5b40 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=QS4NkVPmAqbJGmbYc4kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: P5cvcJ2NdRVCKrboT4x8VIPPKHQvUrIa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
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

Drop the !COMMON_CLK stub for mpd4_lvds_pll_init(), the DRM_MSM driver
depends on COMMON_CLK.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 94b1ba92785fe55f8ead3bb8a7f998dc24a76f6a..142ccb68b435263f91ba1ab27676e426d43e5d84 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -207,13 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-#ifdef CONFIG_COMMON_CLK
 struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
-#else
-static inline struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 #endif /* __MDP4_KMS_H__ */

-- 
2.39.5

