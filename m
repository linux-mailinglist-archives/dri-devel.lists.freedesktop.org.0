Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB82DB0651F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 19:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2E310E619;
	Tue, 15 Jul 2025 17:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zgdx9DnY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D17D10E231
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 17:28:24 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDIj4031250
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 17:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ga9LEiLYJZQSrksTrc649E
 EuSqapBL05a/sdzXt+JFI=; b=Zgdx9DnYQolsWxN3RaF4WTQGbUGMvVZwdqwtg3
 yJF5YxVONXbzLdUi1XY/eDsLKxU2qhpstoi1FcC3jj2BInJGpbcq+yXsVlopy+Kf
 a8BK6PSAn/pCcLYwkV8WvalxIWEXBzxO8EBijO9C3J3fsUCv3VswAji5OAMAFxk6
 o8cex1ZhIH/PR9WjhGJHxFXGbGuk95yjWfDJNu0SUZxblpNFnb5zZEEbb5E++JLH
 ynbvCpatNR4rcuPAcgnHYAKOdp1B4Qknxd2obMavVAm1HYR2ZVdC3eOOCKNVxxCF
 oRpaUcJ+4hpq50TDRzxgNOoaHDhTckmguXma1HcZMmDH9YEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut90kr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 17:28:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e1b7fe85b1so491242285a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 10:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752600502; x=1753205302;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ga9LEiLYJZQSrksTrc649EEuSqapBL05a/sdzXt+JFI=;
 b=dJ5Y7Vpu3UTVYAMO7LTygVrh/Nb8Rmz1LkdAC+VdQpQKHVLxVbmEzDBkz25uCKzoLT
 6eAHW0YPnf98fi8Zyh5xK4QHzQ1sMFHC08OFi7Htb7vgTcTBuPRIAeITYzHEzTsRAiiP
 hORi5uTcQwNkgwatPke2nQLWpHiGJ7ukZUWx3Yd95wiAbOdc2mxownH/BaQAAmowwwed
 9VVM7xoStR7TwnIrzVjLA5oyiXpBpjDtMjaeDgt1I0IBBX3nNvm/Mf1nlNvYxSZ8wGME
 q10RaGuifQh4P9NxhhsU08+o5rgMPPukkyHbFikWKdbCrGgTYFdGDYvzW67bXBfj7tcb
 auug==
X-Forwarded-Encrypted: i=1;
 AJvYcCU930gbjfWsg8WpNIcj0VMtgT5tHyckN4c/mfHvtKgoYlBf/AixOrj8T/1wXHMLCc+uG3CfjU5pHYI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQgu/KOtJPQlhcP5xTaQHbv3ll5/QuasNIbK8V+jn+n17pSvYV
 ed2kBOvDNwz9FN9eLrXGYbylNY/7E0c4JBryR5+wDu+NoU58lTQTaIncZixTBfzavKPxjFsJc/P
 BYZPK53qkH/nvvf1t5lDS5qXXUc1MQBo7IShmYEeDWN1V7g5a/yMVoWmgAT0awpVcZ/jcZVE=
X-Gm-Gg: ASbGnctQh4l55SgEpmWC8L3LRV3yiCGHf0OETm1n7kooP8y7gEl273xQGVcsbVNWN9N
 /NDl2yOa7O5n5tKU4jCE1ACx6nczqVLCplhi27kgnOL49MWy3YBuXDV8Ax458i4HnMRkH4Bw0qr
 lrMVGDzUxBozl2t7Dmye99USaSuE/JM25i/TVXNV5Id49dbOmTVi2kvuo06sf4nD/xVxCfBLrUO
 WOv19U/wz0zJ/pqCaUNPVCt/jEYV+N+SDwdqi4/B5WUcujvnkKMetaPc/YhckO7+ZERUeCiZCDQ
 EZHnRyDhcStBJ7jyM8/4vi8Db/w0rq5Wn4reI9sE1fRMR+RkbsgU0WwEJ94ZFgmz9vLC3gdOHMi
 SCwckYBohcAy4h1dGJ2giSOBZ52dJwqKuEhX65eePfIxZhZ4/RtaA
X-Received: by 2002:a05:620a:4714:b0:7e3:2bff:78d3 with SMTP id
 af79cd13be357-7e32bff8888mr1121107785a.48.1752600502315; 
 Tue, 15 Jul 2025 10:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZEzJG58hA6++K4A4OjwEpcmW9O7bWx0NfNEZFoHJsNZF3DRzQ7RzoezJtTWpqnzcFg4UR8w==
X-Received: by 2002:a05:620a:4714:b0:7e3:2bff:78d3 with SMTP id
 af79cd13be357-7e32bff8888mr1121102885a.48.1752600501890; 
 Tue, 15 Jul 2025 10:28:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b60f14sm2386192e87.155.2025.07.15.10.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 10:28:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 20:28:18 +0300
Subject: [PATCH] drm/msm/dpu: correct dpu_plane_virtual_atomic_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALGPdmgC/x2MWwqAIBAArxL73YIV0eMq0Ydsay2hhkYE4t2TP
 gdmJkHkIBxhrhIEfiSKdwWaugI6tNsZZSsMrWp7NTQ92mjRyIuPhBv17a0Q0sF0ouZuNGS2idU
 Ipb8CF/F/L2vOH3a4SG5rAAAA
X-Change-ID: 20250715-msm-fix-virt-atomic-check-ae38fcfd9e08
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QdqZrsXqEfuVxvLXTf6lvuSiH/gRiLYnrwqhir+p7vM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0ZZ/2YZ1c2H2Pj1pe32uqxj1Ftbcdjz97cdMz9dZrSOf
 nvDZ8mfTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBM5Jkc+/8gboGC1u+Rn+Oe
 fs5qDpzVuqJaZLHg9jlN395YqLoL/FjwvWXypUm9wfsNwj5+nigwM/DvepWmz6/elttbBF/iFmw
 /FdPpxjPhZZ2lmnnOtV1Jx8+l+nYlO3Rqr/julXSXSaT4kerSwExm48zSLTPvuAtGLls2zZztYK
 JS9PJzrpd1eWbndHzMOphqzrE3Il9+/pov+1I3T57JnZ7v5+oZmpnufZlnaUG+kjnzI82oo2t+9
 Mwsc2eIk28/1G16qjllgYyh56kbvzdq2b+yvicpwXVLWd3TuJhhWqboT6fypit3J+fraH/NzJ13
 baleq6214gxvli3MNntKWj7vnNqwVOE534K45pRa5w0PAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=68768fb7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=GxcwXDoS6YlZNtEUzcMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 2AldUvKvz2HQNAcltSm1JJPj3vYnw6qr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE2MCBTYWx0ZWRfX8gvX/qCknvFc
 7ITzYg6XuGcUAG2e8JTtvOoTLLJBxm1Dl6C/tkiCbFd9pTnoDBe13GdvruA7qLrtMb3SRkTqXwW
 a8sR6pjqDq0d+jAOYWOm76oizRYF9tdAO2XApc8lUFVZ4Eqt4c9TZnFZ4aj1lRAcvXXdircEPwr
 DJhv5CiUUecZdCb32j89FiK6fWznTiZY/YlqWpVjPbRVTErlUEYShl7WmPKbbuAfYvkcYK0d0IV
 lAZwASdiOVsvi1MG4mvQzbSeY+KaSQai7aoBuJEomfNjJXufrx6JEul00Zjc2Ek8M6UKr9es5Zm
 PYOMVrCwA3c9N6b1ugWxL+ScUbuXA9V8ypheMX/K2f6TkxrJ+n1EWBB/AY+5D1JhIhenWgt4dhx
 NLSmfSVp6yummyt+TPzTnQuv9qGhfcfhemSw5my9s1VnC+QjWoJufA1KfQrjv3wD3z4qcCnz
X-Proofpoint-ORIG-GUID: 2AldUvKvz2HQNAcltSm1JJPj3vYnw6qr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=843 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150160
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

Fix c&p error in dpu_plane_virtual_atomic_check(), compare CRTC width
too, in addition to CRTC height.

Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507150432.U0cALR6W-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 01171c535a27c8983aab6450d6f7a4316ae9c4ee..c722f54e71b03b78f3de82fec4f2d291d95bbba3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1162,7 +1162,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	if (!old_plane_state || !old_plane_state->fb ||
 	    old_plane_state->src_w != plane_state->src_w ||
 	    old_plane_state->src_h != plane_state->src_h ||
-	    old_plane_state->src_w != plane_state->src_w ||
+	    old_plane_state->crtc_w != plane_state->crtc_w ||
 	    old_plane_state->crtc_h != plane_state->crtc_h ||
 	    msm_framebuffer_format(old_plane_state->fb) !=
 	    msm_framebuffer_format(plane_state->fb))

---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250715-msm-fix-virt-atomic-check-ae38fcfd9e08

Best regards,
-- 
With best wishes
Dmitry

