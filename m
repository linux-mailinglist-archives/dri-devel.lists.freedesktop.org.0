Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC06A9A7D4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2489810E7A6;
	Thu, 24 Apr 2025 09:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+fO7SZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC6F10E792
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F5h8028322
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QywQSn/YHjitxPlBIJbPhSL0qb3ubeGjN/MXA9O/FXo=; b=f+fO7SZZwcAoFk8Z
 46Ye7IAzGepfF1Ak08qs3OKavxtVBCWWRwN8qEoIzEzVOA6aHiit+tUq1ivF/DYu
 aSsvjnBtGBiWH/NN+OSScwKHElr8FKdE3g3c8N2HS4SQN3PhSmh9wmEjPcOBQU71
 bw0APT4Z3gFSdVj0cuN3vSZJn2JtJtAuhdW3x9Z7dLaDXIABvflwyNVv/pBowE2Q
 GzVY1mZBJeFkYAa9dfirKdHr5c7th7leRs+NhW0+mG5yZcCZqdeWRhQ8rKpHtGg/
 IJSmBxCP+2onbgeGVXFRRBpVijUa3lGZts+22beIdnIjQ2JqLG6VR8l/SMtBgVG9
 8bhK0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy4yya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5bb68b386so231195585a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487047; x=1746091847;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QywQSn/YHjitxPlBIJbPhSL0qb3ubeGjN/MXA9O/FXo=;
 b=Dlvkn/SXr4wkOwfKh5JYgX03tiSTscVjE8fYDUWmPgScYQCdvta7WFDr5S1ZT9PeBP
 q1bYSZzM0HsdQtVij7uMYdqrdFaXWj0F6EV14ieWt00AofXY6QYmWt8G7iZdmHJSvyPg
 qaKBQfrzanip09AhUA/lnx23B5/dGPJ8KwJ/gXWXX50lpZMKM2mN3N7odYuWzYbrcbUj
 CbZtfSwMdiKOdehnq0sm1H6OyWK8EV9iz7hRZRpceenRUEry9lLDes/6v3/zgWHFRC3v
 DJnRTH7lDXwvnUHSa0bHh5GDn8nIc0Jzww5ZtxQuDeteTzvZqNmb5ipkR0qel70KzXVJ
 FKuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9RNiYgSFH/PnZPH/aj+BcrNrFHCu6YqW+m2KVHqKEHyRp5toPIYZjY6OVgT7Sh3MhKV0E08xg+y4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdLJZfFBb1XD1TLC5H3j8yQqB/rR5KGr3wVMHihI6qpY+gx1C8
 EYxymxOk1ugt/kJlN++mCtCktmEG6HbYYPFY6vWC3YQPj55AyBPx3Ej8dxnVm5XNzOhbSD5Gf2g
 +4ZQKzsBsTXBiGcXRHp3KlN2MspxH5iywl9e3kdnuzTBejw3oz8P76g3iDNyeH1uIvvg=
X-Gm-Gg: ASbGnctX1DTNIMwntXhbxtuBGLaJrff2rfJvKl5nU+gaahXKj3KapTcqj/B7CDyasZ9
 MB0E2uErs//r1BP0L7/J/0L7zk/3IXUaxreCn5yq4rs7QatpdzBH2/jYMVf2+BBJ/ekS+9FIOAq
 u3NiOdLgeY2O5WdETTekwZVXhKVDpQsZIOCjcfKjqcHf/eo2r5nMn0UcFu36Yoz1NhaHnXs17eC
 Ek9xrLNOVzvSeVmkf2avC29HZHdd+xfq2gaUhiZNvpHPNfzpYvCYdpLcc812NhgB3TMc2PNh1Gv
 xFzv22d0aX74fWka0I7OCqNDTPL+VkGMHgW1Dbi0xpW/TTyc6dlH4mAwWOD4+O35+bJmzAKMeak
 jT8J+sPTVId9zmaMHeazNXoXy
X-Received: by 2002:a05:620a:4248:b0:7c9:1523:3f17 with SMTP id
 af79cd13be357-7c956f60603mr265151385a.57.1745487046521; 
 Thu, 24 Apr 2025 02:30:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYXB3qqSao1dvcIQQrC/bcdm4MO4pX3tX178JHk99SvJsxRtFn1KxSr1x2fmrSYlsEquMDTA==
X-Received: by 2002:a05:620a:4248:b0:7c9:1523:3f17 with SMTP id
 af79cd13be357-7c956f60603mr265146385a.57.1745487045996; 
 Thu, 24 Apr 2025 02:30:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:17 +0300
Subject: [PATCH v3 13/33] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-13-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2745;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RMvwZw2IoUGRGV6OIhReHxHfhgm4YrJasKj5L020giI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSsrXBB/I40QUDXp7j0Pla/+E9TO3fFw7wQC
 IshmHo6E+eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErAAKCRCLPIo+Aiko
 1eZEB/4sSFKY1+3onz1ptOWEABhrbuoYH6l8WyhMjFTRKQLJEzl5fOI19kQvvs6fi7qA7Kb/fnm
 qPZOLtqlGi4VWE75FAqi7F8ymnxcFWihZvu/rBDjgk/k0t4uIjFjUbmuZa7mkzdAtYHOU/oRQwn
 KBZcHjR3f70lmuLUvW06LbWzVYT+jKk6F/EAKofVdm7DneGFo6Af096FbWsxxCWND+988H+WFIA
 bjNndujTIRnb9qCXz3UlfZgvDsFQrTk39+a7S8+9FMB9kiUmsfsrR7ADczNTl9//KVpI6h4LiIA
 mcIO0FCMKHuUmAZaiVcYlkxIpEyQyL9RzvnTAuyKCcGAllX0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX/+Vexpuf6dXb
 cvyJwpuQuzxAwKflJKeSpnuQdv780UVbaKogyVHrCiUdWlwSLLQo0Hk5IEm06qrCuYQQgs+E5HP
 ASeaWzyvg+IHqTqdSxecVrhZs7GCXxwr3GrsuajnDQIsHyvr3oDbJZiDc26kjx/xNEr47Uku6gd
 2vrTiEiIpnyCQa8rN6y5rc+bkniq7P8pcDCTu9bymQ3ynVP/0NudIngWwMY2dc/cdkAEA9rjmvb
 nC6nsm73S03arEYYztIgNAQfOKAhdX6i86l0d8ZDpowpX4XILSzf+02izCUvvEsAiCOKqtZ2892
 b/gYA8xqBaHt9UvN1c/pYZ0L/FfcEGXZs4orhkIcykPxgWLALoo36VZaarCnP0llxaE5YVOf8bM
 wC6Aj05kRV7u810cWAIofntUkr8GKUhW2m04Js8Olc4AFiTlGi4ZyoAloj4Eh2vrZLB4RDkp
X-Proofpoint-GUID: Y4F48sGj-7yeI_9MnNC5_3PFENA-auQX
X-Proofpoint-ORIG-GUID: Y4F48sGj-7yeI_9MnNC5_3PFENA-auQX
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a04c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=BlGH1-kmwhya4yQ-KWAA:9
 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
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

Continue migration to the MDSS-revision based checks and replace
DPU_DATA_HCTL_EN feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 22ca093419059600f0ad7e1e7a0a4e443b977860..20f4700ef9969003cfa4728049b9737cb9eb6229 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -112,8 +112,7 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
-	 BIT(DPU_DATA_HCTL_EN))
+	 BIT(DPU_INTF_STATUS_SUPPORTED))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 27422a5a340b90ee02f36a87cf1bab9d97504c76..36100e21135fba09fcafdd5d36ac919cd17f63c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,14 +145,11 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
- *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 1d56c21ac79095ab515aeb485346e1eb5793c260..8f9733aad2dec3a9b5464d55b00f350348842911 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -237,7 +237,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
 	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
-	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
+	if (intf->mdss_ver->core_major_ver >= 5) {
 		/*
 		 * DATA_HCTL_EN controls data timing which can be different from
 		 * video timing. It is recommended to enable it for all cases, except

-- 
2.39.5

