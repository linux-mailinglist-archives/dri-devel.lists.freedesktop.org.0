Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27077A99A12
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBA610E259;
	Wed, 23 Apr 2025 21:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JiQLKLD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC44C10E2CA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAgJiV016813
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8CK0oIxLXlNXLe2M+og8oCajclsmxhm+HTivn4MwCF4=; b=JiQLKLD54AV8fGbE
 JgrgQbTq9hzIDbGebkfNqWaip20T/olSK9thn3t4Reg+qPNd2D6s6ovNAkLi3Bua
 VT7EMvC62fwpgrW/0LR68r744tUv+DeCYNbMakd2UP5hmUSCEGXo+13+1qFPWGzk
 2lw8Ca+ydUhVXs1dv6L699KundDYVs0oBxuirS2ZtAEmCkDey/InXIV1orLGzRfw
 4U+uLEW1ro3ZfZUpUYlCyZRPq7D3F/bUWyrYauWR2O/6BQBJzRLsJA3DF3pyT2yL
 b3GAyx8O2lHjTZ6wc/9bTPsK31cgOqa840Mj+r3RZLvtBIUOgW7e/iWVYjiHla6c
 niMB2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh03djn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c790dc38b4so60349685a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442644; x=1746047444;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8CK0oIxLXlNXLe2M+og8oCajclsmxhm+HTivn4MwCF4=;
 b=mcZW29wzhvqK5u+OdoLZIdL/C3LHHdscVDy00uTHeJviGWmcEy1MIKHhZlHftnRSVC
 8xQKF7lH9aHvsfonl5fDcWy8vrJdmAhPBzRrV6IuZlHUeaAg8AGYlz1j56hntRu9/PSm
 8OG+pDuvG94J3K/AvRjDap0aJbiEWxTXIJt+KTPRD4xdtylg5Cnh4s/6wIQmAoR/kXGy
 +09220u0qmi3D0bc0ZdirTzGRJeqEfEMYSwRv1n12UJ5Dty/hmh1zOC0iOxq+d8L9c/o
 IiFGnhJXid50tc2jqWV1yy1HdXZnuIP8/p9+x4K90od5rMdVwvOqgHi5Qxv561ECBWEa
 58eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXXgY1uA6cjKYx/5SDvs/e0JBI+byVPgsghJW/gs5i/0spZn0dizUrxg9rWntHuwgffIQC5nN5oe8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw171MJKL7pLnXO7klFwEBy7pz07MiEPOO1z6BxMNxllT7QuuPO
 dTWEKm1ILaHZPQvUbal2e7f8R/sGDQitt3/oOxhSjXnr2p8BJeFmQ7cZb+UtbBv1DOcZfA4VAw8
 75836phlBvbP+VWrCclKQkql3b52uBr/KNszmMj8xv3I7qhlYCfuXhEjxwvBG0lF5jxc=
X-Gm-Gg: ASbGnctv64QUv7a3J1P8yYSG6i4eg/BPa7sUDOe0T1cuT8VjswqqqfNshZBqu7neEbt
 wTGE9TBkzMoW9Vx46AIltqRqdFARcZp/z+MJa5ncM2UD8SH2H0g34YBDgLWpA4Kv7y90LclWMc4
 oB0QHkkJ8zr6LWFLBuiE7KvZkECGmtIe5cDToFmbsFNq2sNdZAFQ3stz7c7k7aQ/g2e/0Ns3FzZ
 zuGqdXQAagAp9tOAQpj1yu6ciZhG32eyHIZPbEfqZZ5ilNP5Y8vNbwGfvPSZJtFiWjXq32AmJOl
 bmH7Ovxq/eRITzXtihreBsl4HLazIs7rElh7ho8i+Kb07ifw95Ekr9p4UJFbXFnZ5O4vptdpcBo
 5/I5NxlHeShGuOQ5LoBUVgXd1
X-Received: by 2002:a05:620a:199e:b0:7c7:c1f8:34eb with SMTP id
 af79cd13be357-7c9578ca099mr10270285a.23.1745442644444; 
 Wed, 23 Apr 2025 14:10:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhnp+Q/B8Q7VW/ZDiLoOBWrIE7Og1xrlQbSxL3cMCa4YPv8VVuYmFRVbG1Ux6b/tgKba9J8Q==
X-Received: by 2002:a05:620a:199e:b0:7c7:c1f8:34eb with SMTP id
 af79cd13be357-7c9578ca099mr10267285a.23.1745442644131; 
 Wed, 23 Apr 2025 14:10:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:10 +0300
Subject: [PATCH v2 14/33] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-14-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Nt4QhnpHTNYrhzhqV0xbi5+n74LJmsNMY4VbVunyJu8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwZnuM5sSy3+wGZ1dgufq0aaqlIenCe4exYlfm2sY1jcu
 PD6xF2djMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjI3Sj2//GWFbzcOTrLHh8w
 r3p2saX1ZvzLDJl3flNNprQm/JzWzv52u7tPYf0+5cDd50oclhsn+70rb5K38fF2L/WKlPmxvfP
 Zt+sX4ia9kdp37uHSNx8SOqNa+IqD9qcYRHNH18y5eafinpLPwd0WWxsj+Bcb9EvwZd6LKPG0UL
 0WOMGkbO0WzWMWMt73dec9X5nHLvNBeXKe3Ynk4J4dmy529G9+L3tj3rNdQjq/tzaFJdRPZvKRd
 zr00fivhgyHzWMXffmNxinb7qye8lvu6RXVi2ETudcZLvg0aUp0/cJNX12NNu25YfR1kVwQ94zj
 zAqhTOl6ck05Trz2rA/f2/wyDMg2aS/vqMmcM0HLes9tAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX3bSeT6GRCC2v
 VUfSHJZvikDoeI0K7YEfjTCKGXf4pwsvfMa+ak70eqMO4KgFOzCh+FPwVvjxq/iQJWrVFOAT31x
 W6C9qNnIk8ZKO1b9vdRKg9iebyQMJpKeW5WceTPZYQHY7Cewe7ggaRUMOjcyCojbcEekcLgC/p+
 mZmS6eoQRUeSFqvemVVGo2iyjLQhh0yD8I6DrgqTNB6mE5/VHFrukMLFYoc/Pgb4nX/sc9AXMFd
 GCaEzF+lsMGYVZlPr8rOl4nVapfwOmWWXdznLC+OOsrENaMsHVDy/JHsmPg/+BTBKNxt5f5hT3J
 pY1FmbGbDAqJgDx7HKzTQ5/kihLIjbP5KgO7NuUKcb3oOzkhEQ5gsBwy6dPJ4rgHoqfoHt6pwC4
 VlYyZrPgayk7EBgQE1lYw9lWDOBg8e8M2VmzPdU0jaP7XrMn/XZXw75Ubd8i8Gei64YE9beG
X-Proofpoint-GUID: oAfQHCALMnc9KAqr_yakdx48QDsuijOx
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=68095756 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=z6iiZyybfqEMMI01lysA:9
 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oAfQHCALMnc9KAqr_yakdx48QDsuijOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144
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

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 +--
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 20f4700ef9969003cfa4728049b9737cb9eb6229..8808be27593b303a2a199a740827c92ea5339b0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED))
+	(BIT(DPU_INTF_INPUT_CTRL))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 36100e21135fba09fcafdd5d36ac919cd17f63c0..858fd73e0ac3a92fe402001d4796eb86945f61b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,12 +145,10 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8f9733aad2dec3a9b5464d55b00f350348842911..54c2e984ef0ce604e3eda49595d2816ea41bd7fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -308,9 +308,8 @@ static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
-	unsigned long cap = intf->cap->features;
 
-	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
+	if (intf->mdss_ver->core_major_ver >= 5)
 		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
 	else
 		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);

-- 
2.39.5

