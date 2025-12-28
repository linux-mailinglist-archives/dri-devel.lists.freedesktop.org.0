Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA36BCE48CF
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 04:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8099C10E14F;
	Sun, 28 Dec 2025 03:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QaBQxW9B";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+o7itZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CFE10E14F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:57:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS2rlA0906751
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=5DiAqw1ZcG0Aq/fFC+FSh7
 8xdWoL0VHM+R2OMDl1/kw=; b=QaBQxW9BLnwlb6go0IfMbEqTj8FNFrCPwySpgk
 VDFzLOLogkoMLRJje1sIqgI9p1ZLq6rpw05sf5q/YvJEQ/ON7rcltoynF9tb3X5a
 dttcc/2QVtoF/7BXmFriTnQav/opH0LlaizWeo+JNJ8hgF394p6MmXmrbOsglWdf
 kneot73LupPicCq0Z8zhYVqb0S1+xgXwzWn1LNUjdpqoPwiaGpg1mK0BG5iMyK0S
 5h8aqjq2GLU+yrxLycoybkd3VzhEfR0+tBW4EepGPT84Ks+Ut+kW+uZavsVWZanu
 vnLz/nkKZnCy5Wxx0KAnd8gGCGcDmyO/k5tJUN9hkjz1O7qQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r69j5t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:57:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a344b86f7so299172266d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766894238; x=1767499038;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5DiAqw1ZcG0Aq/fFC+FSh78xdWoL0VHM+R2OMDl1/kw=;
 b=Y+o7itZZdEOjh2xcB5+ebiDUNJfEwqS2tKUeeW2rA4HlJMORAjpgsve4ap5xjzBIuv
 BrYGDHE30d0terj60hazbWENoeyJJ9qN98e2uiQvb3nq1LAZ3pPGf9h4XLZQVXfixcor
 q+UahoqAdFAAA1OjhfhT1cCIT7ZBTSDMgAEI+hdb0zRyr1teaR/wx0xiRxzje12wVJWR
 rHPrzB+S5EGbpCcHjtRifKz9qsr0nv1U1qYN8z7E83ptf6g9asGKX/aFI3VKZfCtDAWl
 oCl4kZW7jrkx5JRG5vroEXcKRklm+IX3kGy//OUMZxZYVSu8HLXrW5cxQVcgwAtDDgB8
 bx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766894238; x=1767499038;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5DiAqw1ZcG0Aq/fFC+FSh78xdWoL0VHM+R2OMDl1/kw=;
 b=MBPzaa3HR2KknWrM96A+8kAVxhBkf76VL2NOF7E1uhve93onx3mlBUHT4jaHzlsF/X
 fEa01LZaTvWQTaOFRPYamglPUsqsSxyWPoPEUkuxLfiiXKdne8MCNubn50cbK5zvDt0q
 1SSWrrOLfTa1PpSSanPvgEDLMCE31ZyFVVlz3f9hyOFdRenxTwGrMcRFACQc0TB0LPiz
 WF3G0NnSG6S4WYkCYMwE+xpSbroQtcvaMSPXR7y1gnWhhuk0NKTnN+wGq+Mvwd5eAH11
 WlW7tu1FdITvD57HWtyNuynH1inCGQ6zZkMA3Se0oWKLQ3DlyLy/DqT4c7XtuHUVYWrN
 EMVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLJFlnr3xKFKQ5G8sVYGyLMj+uRjv/NPwphgTyD/72s1XZlVt79AtRyaYw9QroLMz2r7d8bY5eCkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDD/dpcJ3zHuTpHwm75dP7xtEW8xhWYj8k/XlrFoqGfXCCzbUQ
 OcNECZUJI5n4BByjSs3ubmhbedxivOWi0lWJvRwrMGPHI8L3IzOFYaGZzhB6+7LUUmP8jJiJXgI
 rqiUCR0NKgxMXIIHexea7wkpdl0r4TIf5ICc4pqg2JJjS7BGuu0He9WCvPA4+gDAVw4oSAaG1zR
 rEOZ0=
X-Gm-Gg: AY/fxX5i3FfGS+yk0mpTe+QilJj+6J3i1qEzPQ7s2Ty3LG/9n6nVw7Unk3ry4Mw4sXH
 7Rw6rxUXfdZ+d3FaqWFzHYcPyl9OBmBBaxZhP3HvuToAW/sOQw61z7YVIenTYhy6+hgLJWnzajK
 VbVqlKk6/ms+qIGtpp6s/L9vp7XjaXiZNqRc7D6N0+GE2AS3HBwQqODZy88GFn+hB5UpNroCTwH
 INrAcUBgLsrfz0+JHJw/1HvVpWj+BMM4z7Mgcn3ji1cK4eOXECk1u+n8nmnMonY2HV2fIdEL+ll
 TssI5BEVtu2w8jt5aP4DHGLcUStLiwIu+7uxCCS+NAkZPijXFqslzFqVIdSp7y6P2RWOSxwBjL1
 WeRJ2OuzttshYgelM1/ZpjMaWOWtruB6DhTTesVAQ0slpUrO0bgonhHviYA1pHUmyiyCRmy6mQK
 FvQG7AXsVKUO1tUIb2VwqtS/s=
X-Received: by 2002:a05:6214:5f01:b0:88f:ca7d:348c with SMTP id
 6a1803df08f44-88fca7d35d3mr363207056d6.14.1766894238535; 
 Sat, 27 Dec 2025 19:57:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB33EtJboK/KgPGBeUpD01j5/RSStbmZSdsrkvyWaeKXqPomK83RZhgY6FEfKvWZqUGyTtfw==
X-Received: by 2002:a05:6214:5f01:b0:88f:ca7d:348c with SMTP id
 6a1803df08f44-88fca7d35d3mr363206896d6.14.1766894238118; 
 Sat, 27 Dec 2025 19:57:18 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185d5d37sm7883586e87.7.2025.12.27.19.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 19:57:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/2] drm/msm/dpu: fix vsync source programming on DPU >= 8.0
Date: Sun, 28 Dec 2025 05:57:10 +0200
Message-Id: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJaqUGkC/62QMW/CMBCF/wryXFvGiZ2YiUKaDQkhOlRVByu2i
 VWSS+2QFqH8d5x0qtSR8enufe/e3VAw3pmAVosb8mZwwUEbBX9aoKpW7clgp6NGjDK+ZCzFru0
 ttu4Hf2sseS6YXYrM6gxFR+dNnMy094+orYcG97U3amYc3173Byp2G0Gl3PJEbgq2lUlW5iKhZ
 Zm/FEXBn9d/1ojqqs5rKkjnQRO49GeAT1JBMwXWLvTgr/P1QzLFPjpkqjGkM/nfFwwppphmiko
 mrLKarSEE8nVR5+hufhHjON4BV2HQiWgBAAA=
X-Change-ID: 20251224-intf-fix-wd-95862f167fd7
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IxKkHlJfGK7EIDe7WmG8uOdNaTCNZBMfy/15odjwZW0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKqaPfxCPvQoDz+Gk1eRb2fiSIz/KJjGppgul
 ltUwZybMSqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCqmgAKCRCLPIo+Aiko
 1SdTB/9+FZOo/k16YwouZfjY4lczCT8CKZWjxl7t8IX+J3GRcQJRzZyzbXOdk3x0FqJR9hV9cmu
 5ePoLq70earhHc9O1cbxxQAb0DDNKuo+kkcZjPl78dplxB1vG8lLyqe3bcbj9Z53LfQujRjOZIA
 GZ8zL4ga8V7WJJaIse7FjFBGcvNbPwiICi+odcYJzvLuX8xlZC+OBkWMRrOhYZnMuSls6Y9Bk0V
 s867NYcwquv7OhwF/jOtN5s+MfPmgNLlw3ImCkfmAekpHp1YMnYFbZFzqEXmeZ+FtcTGRmqOAvF
 JpkjqZqUvp3nG8eNZlXrD6TgobKZi3PAaCpwEH1j5qzKnk7k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=6950aa9f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=4r7oZHox7d71xAMh2p0A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: tTt_VLX5Pl5Cw8LDmgvqrURnYjNDtodf
X-Proofpoint-GUID: tTt_VLX5Pl5Cw8LDmgvqrURnYjNDtodf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzMyBTYWx0ZWRfX9ekyGxzvX9vd
 iyyf1Uyx/BZu28K8DhKzUcslTxHUpA7Mi6+ErkjYZUxCPtXE6u2K6k/GEbQTGIszjqgLdlvXhtB
 nmwG0s0RY2sked/KAV0kcLWc4LtWakXSPU3e/Tat0kD4oCsgAxFI971q053pTHnfli+QeB+drRn
 /uuj3IE2rYLlKyKHFI4+WXpx78chZPl9A59kX0yZo4UYo8Dc0SeaP+Uwf2De8kbEUikJ30jFqR6
 hQYjP629pXaC1bSZnyrk2xI8U16MzvvUMucsnXvV0kp/hTctkuPwVQmLec9WKugkvz6yp0e8lx/
 lXi4D23Ejw/Ab2LARqjTMSIE4AFVg0/SUtcNwy0qzAf3XqiqDLeIVu6BzCT76qtO9amfLs9powB
 QMxUm19iGiGTgnkpSQceOZTbIAJKI1a8Q5ZK7STsQO3Uyoj55b6h4aoTquUHC1L9zGCZbA/mkLY
 POjiDbeiEQZa0aXE8ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280033
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

Currently VSYNC SEL programming is performed only if there is a
corresponding callback at the top block. However, DPU >= 8.0 don't have
that callback, making the driver skip all vsync programming. Make the
driver always check both TOP and INTF callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Fixed typo and white spaces in the commit message (Marijn)
- Dropped superfluous comment (Marijn)
- Moved vsync_cfg.frame_rate init (Marijn)
- Adjusted the Fixes tag for the second patch (Marijn)
- Link to v4: https://lore.kernel.org/r/20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com

Changes in v3:
- Picked up the series per agreement with Teguh
- Fixed VSYNC SEL programming on DPU < 5.x (Marijn)
- Implemented WD timer support on DPU 8.x
- Link to v2: https://lore.kernel.org/r/TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com

---
Dmitry Baryshkov (1):
      drm/msm/dpu: fix WD timer handling on DPU 8.x

Teguh Sobirin (1):
      drm/msm/dpu: Set vsync source irrespective of mdp top support

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 48 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
 5 files changed, 63 insertions(+), 20 deletions(-)
---
base-commit: d2b6e710d2706c8915fe5e2f961c3365976d2ae1
change-id: 20251224-intf-fix-wd-95862f167fd7

Best regards,
-- 
With best wishes
Dmitry

