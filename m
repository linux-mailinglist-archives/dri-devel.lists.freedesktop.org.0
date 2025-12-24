Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A83CDCB6F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 16:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5F710FE66;
	Wed, 24 Dec 2025 15:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qfl/h3JJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gCvLpJw3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BB610FE63
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:33:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO7s2rv1056227
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fPAB3lyJE+/otMlNhYYLlA2GvBK65FIoSyAVZliZqgU=; b=Qfl/h3JJ70TLkeCp
 qQFe9PUtZtTGcE7hRkyAvxnHNBT/mtAdMb9pEuWhn3Gj1Hc1ILQEc3cA+HC10fqZ
 3A/4QUVfiUxdx4HDGhWcJCZ92MBiL9Hi4c9S4oTt2mOt0HW6ELDwt9+MkV4I+COb
 R/8MoIIHhx8KsO0438RVTLgNOsKrHMMPRL7QQ6UNeSMyMTtM7zLu1aahpO76xBBB
 +xmMKKvwLISCktPlH+17A0Q6456JitR3L6VU1l7ehcFsva3ZUiBgXTKq3kPkB5QI
 Hy5ajt22mA9csYkv6yaFgJ206pECOdzwFh85RMqIgKhpLfMpDl/clqkz35kyQxtH
 +uVJkg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v2tar-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:33:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed69f9ce96so194075191cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766590433; x=1767195233;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fPAB3lyJE+/otMlNhYYLlA2GvBK65FIoSyAVZliZqgU=;
 b=gCvLpJw3m5i2FOlb/TYZXyF1KO9LkAa99dwKuHJOgJvZDvKWP1Y1DHgqoSb49tMdDY
 NJpc/piFWzutwXy3N6xs0lelV8e2MOn68LvODgAkvGghFiFM4dXMEmaDrcvEzZZUYarP
 /Hv8xMKb5mf/pzaQViok7hTzebY8xIYrNdciGP1NwSBVac9VS4aRWWqPMPmFvcGDwDHq
 RNlXAn9auyT33ex9RF4fUbcdLCNHrRHlKaqSx41Yi8Tv6GtMGo7lqVCl8C9fkjNeuJY7
 egDjUTpEi7SNgwftAfQjqq+6iHdbFLxj4/m88NW1WnB4JbF4sICsL4/sKBHjrcBg9YTD
 2t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766590433; x=1767195233;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fPAB3lyJE+/otMlNhYYLlA2GvBK65FIoSyAVZliZqgU=;
 b=D6b2sQf9RRSAARSL90DkXFYBofPOCJHrr476tjpkQ9Z4ys27aRfKx9Z/HoKYDbR9//
 ixHcJfrpml5yxke7tYb4mFbNycbM3wcF2XNQKsLN5ECe5CNW+jWBIEERHzJbTiOHy9Xw
 fn262uvTcDhsqxoeAyGzvBPQDLK6u+WUgSjVlOs+DQ6s8WuQUvJFTYUIoEh4uEAw+x+4
 /WwQ5yiIKih8G2WQ0Gz6GkxpI16ehfo94cy+QPr4yUA1na9hzlyEbNs3MiEDPRDwLflM
 uJyxIwel++7bNARjg9daEA10pgyigo6VXWJ1/xKhEkXiuB3zPxTGFmTQ1TPxPC6G5EkD
 6ikA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrHIOoVFM7UKVm0Ix+i3Y4j8lj/CRmHYpDkQLiggG8dSYaltN5vIHSRh6lHRPyxmc2pJKnLfxzP4E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxcNBe64QY64n0hE1z71E/y4zzDNQXbTB9MV0bnY5s+z9TCcDi
 Iu4V/MdmgZkceDjk8QRp7/K3NQciZJnKFPKTF5E/i9Jk2kkXvEhgC+mZhJJRq1Vx3dBI7gukS4z
 RTLgdz+fdHadnOu3uIIQm88DAPg7O93GUwqt92xSZ0/+PvWTSxgVgArWX8v5gZAudSI1zr0o=
X-Gm-Gg: AY/fxX6fZw5A5R5qska4UtXabqwuQNSGyU2FJsZQwik22C7A7sRSMFODdv6fuxFtsNB
 qEeRj9c+HqXKx41ZcYlMjDIyQF1MJznlccP30SrMptvpQFiDQpoA+s1gHgyRbUaXEjt9hpU/kaj
 msDFTDz/n5DrHNqX1RXGSIj+wDaEKmCOuOcbGoSrjlICRtZDfNfZ/gEb3/fyfmkA26++c0HtgdF
 IRt2hITTq0p9Gs2N4xd1Lv0ujtsv8HKmqakeVu6lduO8jfeLguEbU2XCIfjO5u8yeuR2aUA5dYg
 jhMCOTKtEAob7+S03Yup3eUX6YAJ9vRMh+rZEt3RmIdqg7OMJ2GfSNVuDcbeaoxI5JcgRuZVzex
 P+9/iHZGFjwz8O8IDEA9BACl7kaF3v4k0HKyW4igsF0SzBpXDCo0gjds+q10gvr8Vwuc1RTzL6K
 EFp8nFLlDceOgUms1Vq5i45gw=
X-Received: by 2002:a05:622a:4d3:b0:4ed:42a2:1281 with SMTP id
 d75a77b69052e-4f4abcb8d02mr251613561cf.8.1766590433349; 
 Wed, 24 Dec 2025 07:33:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy8qUi0xeWx0iGCNSIgAQhPtuppf9D8vhc4sFFnom9zYvqxkc1Z4gZQfkGBsYXhLd9phBdQQ==
X-Received: by 2002:a05:622a:4d3:b0:4ed:42a2:1281 with SMTP id
 d75a77b69052e-4f4abcb8d02mr251613291cf.8.1766590432979; 
 Wed, 24 Dec 2025 07:33:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18618cf9sm5115105e87.57.2025.12.24.07.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:33:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:33:49 +0200
Subject: [PATCH v4 1/2] drm/msm/dpu: Set vsync source irrespective of mdp
 top support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-intf-fix-wd-v4-1-07a0926fafd2@oss.qualcomm.com>
References: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
In-Reply-To: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2330;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cYm0vhLoKqA2PBsfl+wS9rx0q7aHEWOFtDsgpCz+I9Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpTAferAB2TUEQ1WhDBlHehg6VFbE6pjSp/CfWP
 7fjPuiPKdaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUwH3gAKCRCLPIo+Aiko
 1TKIB/9gCUDK2YB7407yFykOcDkHJk8KsO426K6fmECYOOTiCiVMsnp7zAT3st9H4z8ckEoiFtX
 PEz868HYa/toZJo0B3hKpw3FeSRV+qtvbzfQ3POlOG3cwtaBtOu2y5uVfHbnqzRL9xWNJQJYstK
 i1Dqhjv9u5H4nGBkad2tyeJ0X4HLvg8AnSYEAkDx7eBhvEDb7FmNvVZbZvEjvYIE8pfZxT5hKbe
 aOXla86xAepBu4NTqQHzorXof82UpmN/pVnDS4Fl3Yzv9zxEKobXAMkmKwd/MPwo8WvzXQLNHXB
 67FFtXGPzrY0jlK4v3klbH4IJsdKL+nsUvSubIgqGu/YoLSx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzNyBTYWx0ZWRfX3E4FGKDvLMs1
 Ns+u2a7MT0UDqPqpJy5GDkHZc/P0itPkKvyk8XL27sH6/79pCM23VdPiOqGip3idWbfkY546mSl
 Gj/gKQ5NGPDHF08t06dgk9mQ8DG3bDhq7Wgst5Bb/DrNyG7Hn8bSLhtIZABY+PyDeFUw28XC63I
 Rp0vBIrIfm50lxpsJRvsgMpOcF+Kj1Z1/Hrbg1aaXNbNbYjAlzr5mDaSoTosDkxbuXIEd12JOty
 HY5RG/WgQDVclsgrYuPqioyU2jZfuCaMrn9wm2Be7Tslj3qit52jQG8tOSdOAHM5uswGP7ILJv0
 adZe4EfbjD+CvkJKwnckKJwlO2pCRJ5HxlBX/5YsGhMjSyxi3ZA/LwEKloSvuGpfj+UlJrO6Q8k
 lKTxqMBWTWZUwmtLFTPsPZFcTcXv4ZqNJuEf7+OcSWss2Skg73kHKNp29vrhuSeLN7ywcLFEgm/
 ybrGNcuJvQXAs0xBsjA==
X-Proofpoint-ORIG-GUID: jgiswtKri0RdwQf-axk64Zh6iClUtzBN
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694c07e2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3fIW1a8P77-jr8MUMFIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: jgiswtKri0RdwQf-axk64Zh6iClUtzBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240137
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

From: Teguh Sobirin <teguh@sobir.in>

Since DPU 5.x the vsync source TE setup is split between MDP TOP and
INTF blocks.  Currently all code to setup vsync_source is only exectued
if MDP TOP implements the setup_vsync_source() callback. However on
DPU >= 8.x this callback is not implemented, making DPU driver skip all
vsync setup. Move the INTF part out of this condition, letting DPU
driver to setup TE vsync selection on all new DPU devices.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")
[DB: restored top->ops.setup_vsync_source call]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1cfe81a3373..0482b2bb5a9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -774,6 +774,9 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		return;
 	}
 
+	/* Set vsync source irrespective of mdp top support */
+	vsync_cfg.vsync_source = disp_info->vsync_source;
+
 	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
@@ -781,17 +784,15 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
 		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
-		vsync_cfg.vsync_source = disp_info->vsync_source;
-
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
+	}
 
-		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-			phys_enc = dpu_enc->phys_encs[i];
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		phys_enc = dpu_enc->phys_encs[i];
 
-			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
-				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
-						vsync_cfg.vsync_source);
-		}
+		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
+			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
+							 vsync_cfg.vsync_source);
 	}
 }
 

-- 
2.47.3

