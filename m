Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B74CE8DF9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 08:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E5610E841;
	Tue, 30 Dec 2025 07:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwxeTQdE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T5iv7lmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1CB10E584
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:18:02 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU3jsHu3556583
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=RDfDov+21c9xI+NU/eqDWb
 Fpcvc+X8yxuZnrRdrgcdw=; b=UwxeTQdE1mzKRJHJcJZqpdvN7C/9A3JKeSyaEP
 qSnqQ0tnLXwamep9uGHftlLHqZoFCfgAcDzGAq3fV0DxoOFOQp/RTj+VcXwgBfd3
 qz+Pqq4xiw95geYp5h1Fg3pHlo7jA4PJbdUdnkEWmjV/5ceR3oOQnEz5q1OHKHx1
 3iiHVbd7CIoHLn8fLQ8oWAKGsGFNKFj1PE4coQS91suCMU4rfzCAYlH5ojU0TLKf
 578YnIR2GWlbIwIAd/LB5wnGsJskXAnK2fw2d79EGtrZH+Hf1NdjF1c7mcS/y1LH
 Upp/fwM9C+tA4uxEf0xNVkL+5ltIjR18IkROHq8vZJgGrgfQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7460du9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:18:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed6ceab125so260223461cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 23:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767079081; x=1767683881;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RDfDov+21c9xI+NU/eqDWbFpcvc+X8yxuZnrRdrgcdw=;
 b=T5iv7lmB0zbj+qmC3tuQ6IOGhmE3AqQ1oASUBkhS0oVwS9S8XF52aURPBVoC8f3Yah
 vYz5NrII13SEJwZB1YzdM3/XCczmA50nQ5ut9pi8iBsA8eqdWK1ed7H0CKfBbD9xng1Z
 fEc50sebKq8XyFQFr0oYz19mb15K3SSOgvDDyd60dPHm7RtLTDon3KTVwHwdfwGrBzYt
 S5IsU1ERrScb8+H8i+JmU+k6SZPrI4f1Kl4Aq9TIGDSbjDQws9VMO8s8AFZP15sd2VC9
 FsrK7lO2vKrQDU/5RxCEKtTss8cBRB8sEJnKsXaP4wJLBKY5bfDgkN7tvrK5Y7fdKWxb
 csQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767079081; x=1767683881;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RDfDov+21c9xI+NU/eqDWbFpcvc+X8yxuZnrRdrgcdw=;
 b=lVCvPW9j3TZNR+mkIa50yeT8SWVqNoQRiOt1gai/OItr1quPJsUYEVyTrdkpvfhz4p
 FtVJTZKgrnrbUJb1kfCA/4c79ce/VDwCBO4KNpl4+w9DS4rGQClwL9lHTzpryxfnxy+q
 KSH5+xT9axkVBaRecwi5aDEpgkFy3Vr7NV2RFx5VAQ6QuqXxnrMV8X+7VbgnnZOqDEx2
 HbjD97Pzq5BFiGSy3kCWSQ2zqtBZSBph4nUy/6VGmknuLH7v0PAfeV92oBuOcrUf5yd4
 T3V0K66vNFjyL7BpYPvP3a5f8AENC13VnsoZVbTQmv4PAzFgvqbJHC2CRPgnBZr0tu5F
 gwig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwouY2rr4q1Pc6pp/fJXeyiFQv0nL000cKibUHs7ZtoxvSNUsUVD0RWqS9ekBmYY0iy4ftx08UBs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKmVUbTFWmPqmiVGcvT8D5V5XpbzNGGhiV93CKuXqHdSSu3pND
 s/upE4Ue1eCyzd1n8SYU8Jw6t5hKTuLSUGU7O2IO5DwjgZBq9OYGrVRt9unriQenEapIPQtSrKO
 QocjLk6dGGAQVZKXqF3GADxwOnv9i8d0oRHDY1ndU8vhYwrTIjV3127vTA/iB495j4GtBlq4=
X-Gm-Gg: AY/fxX46c5wLX0KuznxnlnGzlgvpuV8AOUXL99UXN1Vzntt8AhmAqw8sKrv8OORcgR4
 K9FsJl6bQQpzJmkIa0xW26NoBZMPJTGhm5+5G9bZRvLGuiDCM++UBeg2eMD61Z6vFUar0LWXufb
 BNvA51HpztloujoKk+YbQw4hwiOQTcLF9dDcVUp4tzwN7RtFVpxcrdKjBKb9eLrfUB8UyewZPcw
 xjp0aoZQ29mDUTY5vfO9irRwJqk8DWhEfH9/Ymkf0L5Ly/Oc4Rbyac/6Y3W8/oPYM9S1/Jg9kL/
 lmiuplwerGdKy0Ek8v68zQ6CGuAZs1y+8gBF/aNuKlbChybH8pwhAU/SON4stZGMaQ0W9U3opIG
 TG0yD0h73dEkNenXampdmxM9cVfDMVhTX8DzGRlBxKuKrUotIQrPfgeprfqeLLEueSX66nAgr0f
 Vkfvkytfnw80fOBNdteHgqA/k=
X-Received: by 2002:a05:622a:244a:b0:4ee:1962:dd46 with SMTP id
 d75a77b69052e-4f4abdb6718mr540628101cf.79.1767079080908; 
 Mon, 29 Dec 2025 23:18:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOFJXh7VBC0CA1QEHfedT0Vh9YwUikHzXQJjpFbxXBPOzJd9y+5itmQlXgUcbEv9V2Tridsw==
X-Received: by 2002:a05:622a:244a:b0:4ee:1962:dd46 with SMTP id
 d75a77b69052e-4f4abdb6718mr540627961cf.79.1767079080388; 
 Mon, 29 Dec 2025 23:18:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185ea2d8sm9924615e87.45.2025.12.29.23.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 23:17:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/2] drm/msm/dpu: fix vsync source programming on DPU >= 8.0
Date: Tue, 30 Dec 2025 09:17:55 +0200
Message-Id: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKN8U2kC/63QQU/DIBgG4L+ycBbCaPkKnubW9WZijB6M8UAKW
 LK1VOiqZul/l/aiS3b0+Aa+5+XjjKIJzkR0uzqjYEYXne9SgJsVqhvVvRvsdMqIUcbXjOXYdYP
 F1n3hT40lF8DsGgqrC5Qm+mDSyaK9vqVsg2/x0ASjFuPp5fnhkcL9FqiUO57Jbcl2MisqARmtK
 rEvy5LfbS6uEdXXfdAUSB+8Jv40HL0/kNq3c2Hj4uDD9/L6MZtr/7tkXmPMF/nqF4w5ppgWiko
 GVlnNNj5G8nFSxzTd/hL8LyEuCZ4IC7Y2wIQBe42YpukHWDlk+6sBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rjcGmrYy9UrdPHnUVn7OH4gCfyt6FSy4sSqVbUoAeIk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpU3ymkVB3YAK4jAqFVE9gdL3SXXXvkLAOjZU8R
 hU0zIAxVfKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVN8pgAKCRCLPIo+Aiko
 1RLzB/9kdmTzpOnEuTSthFf6CdLwX9jvhDDNiPuAm1fsVzB9LeCYFkS1KtgR9qkDkQoWk/Uj6qU
 8SLT7RSNnTKNYfunPVMkvN6/FgNWouFy3TnXVttSJ6GoZ4iIkQlKVq3KkTIli+Po+OYZF6DloFx
 A5jbo/NeQaCOzVwHJIp+MDCj0V9wvikrhEI9lxVQc+XfhVLNnKf3WU7siPcAyhaWDJMp9xNka/t
 uTRkx4CXwbYj7PrQGbPSNg0QqfQGZyqheVfRRaIiqPY74WPby8YWZrVDUrYi1pCn1cbEg4rfx5t
 XQZcyPN375v7LhFAEPZi5MXRk8BE/ksVx0e+nzfzbBmID0eX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=69537ca9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=ytnKcm5597Xeg24-LCcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: XkYWL_CLJ77HoHOwgIEntAjdumtmyT2y
X-Proofpoint-ORIG-GUID: XkYWL_CLJ77HoHOwgIEntAjdumtmyT2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA2NSBTYWx0ZWRfX+VAbuzTDdVs0
 hSBZ60rqK0ZDKCqfEnsWDn/d0pEZX/Ex5tY4/VIO1BHIFb/nrifBrL7DZlN+gbX6zHy/xjfcfzL
 oIMiIOTkiFhJqNa2+xqrBMwDEoYvjDOEIbiVrbBb6kgXvZsqhe+W9h41vxsu9r+WfWc72LghZtf
 un0zHO2UXFdwzvsUdahwVqJJvjRMqI/KnGwN2YbtdHeY/8ekoe0L+77gtPAtxn3JmJQSDlz0Cym
 /r5Cjgn3MEV6yQrtpftzSetmBXp69HspVCIEOCbK3NHTkXtmqsVEKiITovXgOrO9ZmziZZ4gBYe
 bgq7qBv+qlbPbUkkwwey5ZHJjED0BtLLoHIUGEDRy5glDOyrFQjstlSFTNi0MIBIC3cM7anfTE8
 FGsKRtk3qk8MrhSWj5SCcQ09wbffzxqcdhdWMkI1LmMja6sUsQ0W+lrho5bcBufC9IQoXTtSgxN
 6RbfavB36tSm1OOHIMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300065
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
Changes in v6:
- Spell out all necessary bits instead of reading INTF_WD_TIMER_0_CTL2
  (Marijn)
- Link to v5: https://lore.kernel.org/r/20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 49 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
 5 files changed, 64 insertions(+), 20 deletions(-)
---
base-commit: d2b6e710d2706c8915fe5e2f961c3365976d2ae1
change-id: 20251224-intf-fix-wd-95862f167fd7

Best regards,
-- 
With best wishes
Dmitry

