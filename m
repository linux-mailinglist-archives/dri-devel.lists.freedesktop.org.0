Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2FEAC1402
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A0010E8C3;
	Thu, 22 May 2025 19:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UamWd7ZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294ED10E8C3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:14 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHWmIh000836
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tuF7BT/smpyZ5hksDUNBWNXde57Xof9XJdw38MQS0rY=; b=UamWd7ZIFliem7G3
 biad8ghYhaYxm7+v/HQ0u1vTpLv/Kp/R+1WwBmXlZCa9lLQzUauD2yotqJz8jFC2
 Aob3MGt4xNCeOtNFD4GuKcozmE+ycDTWLQBw7hkvkiLJp2qcWKVyw9ZTkrvBhiZy
 PGZlVrdsbgTGGMASZ7pe4VlGT+a/h5gngetKGz/MCnstfIFFwIHkDP7ut7pW6yg+
 vaG8rVsDtUq2Wxp3jKnAWym6i+1nt4cuvYUAyUOey/9eQYa0MvYUJjSrWBmOWC2a
 JRCmM1nnJmusTwy+AvHWDbgyBSoNo15NFCwPz/utXwct75Ct/oqLqYX3YMjNKZVJ
 4ky3xw==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6ybfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:04:12 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3dc898196bbso2128695ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940651; x=1748545451;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tuF7BT/smpyZ5hksDUNBWNXde57Xof9XJdw38MQS0rY=;
 b=OTWnOuoGBzThyom9RV5XhoQa/HXKjNXvQ/SkNqWNJJnYS2QVXkYZAjc8QWrJTrVVzH
 HEf3hRSwgMDJQ1jF+des2scmyspTeufLNd1in33KZ6cjTkpdG6ZxofvIDCutorrEbx61
 uWJwtoD7td71pvQ+QKfxKbRr/2KmIX9OLae3hTTtPqbuX7cZjGZouHIGMYJq0+FcKQjw
 exfv2kZNyZYXMEB3ZGS00hej7bi+JfS3vNW2vQsaRotv748mltha2+ikZEIxqZSzv76C
 iZQZ0g6A7Ggo6zsDpzcmH4NIyIXVIEl736m7A7D6ufJxd04lvHOHuOm0dwBYhpofwUdu
 eWqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBUEkCHx6XdlmJU/NX13AbEirDwh6q0CZmjROzSRdWWuyX+YXqS6Qewhcn0vUQQemO7dipvx6XDkY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiHCUN1sjiMHF4kDB0B9YJ3ylX4NeCOYy/GDCUqbtRX88hxGeF
 DaCdn1hp5yTYGgUj+kkisU/HJy84BksX0LSkk4/JdzqrtPQXXLe1IZ5sJnxPU807hn44DAeu9FG
 GDGxXTJHJmfP2ApYUgzyFNAI/KyLSuB8YtimZJW9LeMGIyYsUUQQWM10Ow0ZIkCwD9H7x0TU=
X-Gm-Gg: ASbGnctRX6ft2UaB4q8qpQP0bIrMg/mDqVir17ZjXNJ9W2OnifQ3+NkZYgzEl2NQGZb
 mF1PkUwynXm1CleC1MiTBCjW4LQqcjDSt+qKM0/qk7IarIfgGKaDEjxhmt6YQkY4SU5DXBP9wKt
 uGvYSb10GiYo+J9lLXl21bRL9oQcjeyyV+Ak4C2tksghdpm7IvvHki6Fnd6fGK/NoUSbuwdTotH
 1AcHP26dvDZgVKSjNX0STB1LkdM+ePaHVb0WtXF2WSxm+dq/ehgmFVna3Kchvyg10ltPG7ik+Yv
 3PDJA+aEKaAzx6oc0ojHPjOHU2kOq33sbecHc8GmiZTT+HQ3Svwka4Quwt5rT7Gr0rBJkpuK0DV
 JSGCgtnVVRC3MMwVecj9r7hGW
X-Received: by 2002:a05:6e02:1fcf:b0:3dc:6615:c0a2 with SMTP id
 e9e14a558f8ab-3dc92bb10ffmr9217285ab.1.1747940651121; 
 Thu, 22 May 2025 12:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKwx1VFjT/7lIiX0OUkq4jsGktrukNf/vR//viyzkUZqWvQ9ptNiCoeXJJ2QcNjV4QDDaMkg==
X-Received: by 2002:a05:6e02:1fcf:b0:3dc:6615:c0a2 with SMTP id
 e9e14a558f8ab-3dc92bb10ffmr9216855ab.1.1747940650730; 
 Thu, 22 May 2025 12:04:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:32 +0300
Subject: [PATCH v5 13/30] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-13-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2871;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4PLdtBToyaCTWjSOru20Q+hzOpy3/IdoLPd2nM633h0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z+yV/vzMuZf2fFSGU9dFwi9afmwU5BYZepFX8sV0XIn
 k0xZ+jsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEQk6w/1OSS81s11H+vyA+
 ZPOVU9yuR0o2LTFn7Va7vvjEoeneUgpX9yV6c5uY97SpJAkZ3FGYtyQh0//SKw8xFaU9CqUvpA9
 HC9ypLFA3c97aW1Xdz/hxyUWr3kOK28+cO7Rz1g+uuNdz7y7/E60k85IhwV6waapwr4brR/1Zpt
 kL64NbmDcHtoUndUu+DDqdfuntbZk6q4X/qkN23y5eJvm44m5QS+OzSs+Htz+/O35SaefMu8lsG
 iqF9Vfaop6c73m7ppg7cm762sdcZc+NK96qb9xs4yO8sH/9/GWeLKUJZXIZVuod6eUxZbGn36/Q
 S0gSMQivEmR7EBuxuLdDP6IroeLcVV6NrTecmBaahu0EAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: o357Hj7L2vAaogUO4onzk6sBxLYYA3mw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfXxozwR08RPK5H
 Pim6gwg5dcPj6QfbF9yEHfKwgF0rzP4OUR4WHtABYmG5MVcCxXBthPHMaTvNTREzX1umMhYPzw0
 way+0vJdlAkATH1P0A0wYi/t12lufGRBZWyS7jZn2Z6PV+dKG8/854CRheNNYMEiWMl6fvo7yGi
 nzud98TTm2HmeRe8PEiONwIHbDmYU+V0zRTIL7ubhT+DBnCl2a7fB3hFASyBHIM9kMKv+sQYG3M
 nl0FDCZFhbz00Ty6xvmVu9kJX6FDnVbFP+WNzDWpQDVz+zpDy66hdeDg4Zfsu7UhaqBfwDj+WB+
 NgLFi8m3pgOK4MJ19qkU3MlQyRmi71wYXhi5S1ZywnOXnBSF1pXYyo0vbALSxG30ZEOFvhSxwSF
 0o3mOePFprAt7Nq+Blk30Gf2LAsIrLMlpTQiawCrp28we9dOH2gYXQX6aycrOEAApA2fK5Bx
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682f752c cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=BlGH1-kmwhya4yQ-KWAA:9 a=QEXdDO2ut3YA:10 a=Ti5FldxQo0BAkOmdeC3H:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: o357Hj7L2vAaogUO4onzk6sBxLYYA3mw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220191
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5cd87b13e839e7ad60356cde162405fdfb6f9498..1244dd59648d11123c507a1369f28f952d047fd5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -106,8 +106,7 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
-	 BIT(DPU_DATA_HCTL_EN))
+	 BIT(DPU_INTF_STATUS_SUPPORTED))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3b6133e1bb581741fe87b049ad0c89bf30b76019..bf6b2392efb47fa8c3e3c5d17f1a72341872e18b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -143,14 +143,11 @@ enum {
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

