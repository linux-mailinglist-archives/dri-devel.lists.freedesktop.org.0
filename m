Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB1ED106C8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 04:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDD110E08A;
	Mon, 12 Jan 2026 03:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVfFGHWA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWKz4NSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571C810E075
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:11:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BNGMPN4186301
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=SmAanZecvfrl/Lhr4noCk5
 ILjd4wByVA2hHixuPHBcc=; b=aVfFGHWAmTwCzV80EvKhnMH+NRVveMNdWWIVyV
 zc6EMF70vXpLqHWvPosjqH90c9ztSA3EqYiM8jRSlJs1vRv9oid2uf/Fi7SE1vZ+
 /PR607xfRJejRto50cNEZu6tFJ8hYSdWB2yuXvRfBNELhXUe8/WYtiLnr850kg5H
 zvNIdWD5u1aM4S2iqlPYxudRuZhwsQ+ByCw6/4Szfbx+rBfKtc/HRWu0o5vDHFEh
 nTFsEtMhzb3iJuXaZFe5fyxDl1I/GzzDLvZf19nfCCO7sdwk05LlG2x4judUyqsk
 p8UhiOX/oFKE85AfOsFDM9njZzyT4ubpCTZxLzXygVX5YrxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu3cas-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:11:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b24383b680so2393005885a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 19:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768187493; x=1768792293;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SmAanZecvfrl/Lhr4noCk5ILjd4wByVA2hHixuPHBcc=;
 b=DWKz4NSHdjElqCIFxhY1v3ceUKD9NWrJJRmJtKp5AohFrioYK5edNB/z9bk/88lb2B
 nQPM6+JnF5D9JCBtzJOCqKUI7JhhqylivdV+a/S+bfd9MwORg4b2jfA+bgE0RGcjwxmU
 pKKupme63b982pgqiquvlfRXvKcmieWqNmY0a+4Z5D7PoEKUarhSsf+w7V8UCYQwHhMp
 CtAaLedrRvrVmMDYS98X/3nFtdMH59KMSLrMi24EtWidHUrW/LXiRdZM6RNcPZhWiIUo
 k1vEdOxj3jMkxFy2bhQPavVeERSXPvNXeWHUe6zf1slId4QTZPZQCA8hnRPvZgbSQvaO
 68Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768187493; x=1768792293;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SmAanZecvfrl/Lhr4noCk5ILjd4wByVA2hHixuPHBcc=;
 b=PAEtiiD0A80FWeBrH7A81GpH4EGVv16eZyNMfAyV43GVRBzTKZ50ZU3anAJdmyrEHy
 dw7vqsAg+1W8PN6MVFa4MkJNgTp8dQu9g/fd8/Z+7uE3+h4qpAUxsyajpKATiE3WJy83
 w+D3o3Leow9OOK3CmcGttY0RfLjXPVPXN4QEAxOjc2T6UXqWS5tQrIV+/kbFmedtYQd/
 04shg5/Gh+7SwnyXu01PFv5QukS0H4meLU5MpQzXk0RaN8ilsntx3iPDgcGwtRjxEyLH
 3fIHssvdxVIlnqHb/oV6b6xapvJj+wFb6eVkts7ao1mZ99wfgrMNgaB9YiWSQJCZsHz6
 7XZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnVc5DSgQ7KV46LGVht1nGIe1AL7PlW4E7+zFYUGEz2rVcf4fcriwFkE5IiGKECfZx830Ewqd9ubU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOu4zbdtz8OBsARAxC/X3VWS0JWUQZ8tjfVMmtkQ0zJl6kkAsA
 sUAGO+YzZJUPnkHxR9BKnZ6GDNgO2snqUnx3tXcuHRd6KsFowsOxHTsUFT0oGdWDTuI9E3iemHj
 oIPOvUksl9n/WjLNbDvVY4AkTVW990pgzHruV51iu8xPayX5peNVctDahD+61GHokdtAJIf0=
X-Gm-Gg: AY/fxX5icp0Yy9OuYb8eSl7CwQIdh0wRxnZjAoLj0FDUp9t2TSReRBf+aUcMdzMSn74
 btYOMs2WkmAg+f7MLJoIr/1lPic82XA2soF7HZv2BR1cOrFyf2XJTcQ+MtxF7+r0YQ8TSO75Bdl
 h4D0JJStXAwxBrje4aIBzUdEXHS9lbXR2MuXx3QxvIJMTcHx2vSWGQzh30+ikQhGc43+Hg+JipN
 /yA90jzEkdPxNcO/0QVuUiV5j+Phvon4RRhVksnG5Du1ar+r/H5guLKAzcYllat7olnqWnWCx5G
 d8LGxBy/VTKXNxNytk5VBDxmXwm4+YkGfoW9bw4Z2A61wxuqdrj+WIFNEgSjyaHqeODnZv10CKh
 p8l/dGxtvFLYHIDGbmSdKjYyA442uf/7YnOvdwlx63SvWRu4f7MZXj984MqlUk0hscPkZdYvwh+
 E8g/UixrfSlPo8LdQAg+Mp5SE=
X-Received: by 2002:a05:620a:4442:b0:8c3:1719:9b84 with SMTP id
 af79cd13be357-8c38942be70mr2180329885a.82.1768187493330; 
 Sun, 11 Jan 2026 19:11:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHLaEWJ2Yf+pziih9iV72c9bcmxhj+E/000f08ui5BBzBDG6B9/krd+PeYLYwsZgAyqTIcgw==
X-Received: by 2002:a05:620a:4442:b0:8c3:1719:9b84 with SMTP id
 af79cd13be357-8c38942be70mr2180326685a.82.1768187492846; 
 Sun, 11 Jan 2026 19:11:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b792cf330sm2758871e87.102.2026.01.11.19.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 19:11:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/3] drm/msm/dpu: Drop max_mixer_width and
 MAX_HDISPLAY_SPLIT
Date: Mon, 12 Jan 2026 05:11:28 +0200
Message-Id: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBmZGkC/22P3Q6CMAyFX4Xs2mk3QMEr38N4sZ8qSxzoNhFDe
 HeLxCu9aXLa06+nI4sYHEa2z0YWsHfRdS2JfJUx06j2gtxZ0kyCLKEAwb0auHcDBv50NjW8Nrk
 BaYrK6B2jrVvAM41n4vFEunExdeH1OdCLubuwSlH8sHrBgZtKK7C11lVZHboY1/eHuprO+zUVN
 iN7+cVsQUD+i5GEwXNpcyuL7Q7qP5hpiRrw/qCf05KXaRWRzyaXshaHtPEqJgxkn94Pdj1GKgE
 AAA==
X-Change-ID: 20250401-max-mixer-width-9c3c02c48cb7
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3298;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tNgz2lDbieKSqbwdX1I2JXup1Xb5aYMuuxztq5LLcQY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZGZjMly8OhnWdEJzfcyjRQ8MPvuTExdlpe8XM
 0+RGDQgFoyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRmYwAKCRCLPIo+Aiko
 1VepB/94Hf0Ch3SfS+7dI+V16ADq6yTITaFKtbgaC8QyDVbn3YbYhJnsu29lJBRNtrYa7qzlihC
 1Lqh/DeJDoWHxocEyaUXdNLUiGGhIzJw43eA6KFAAsX0LWOuUwGBLshhUfZhbs3VahEfj1Sn+Zh
 NZt8gAy7TzRnfzDsdLzWhIasIk2qHvPHpT2mTGZaf1ForLeATZIcJEn0o/PxfSYZEC/llD+I/AK
 WvBT5X9ufsr7HZCPH230u/yFdAQZg4fG+JDz+1uWZiuMyxmIUoLXJNf2chLvXjBHL2QiY9c5iyw
 AzMwnhYCRnL3RrGvcNvPVhmW1LlcTiTlgMEWSuWolRb3Fg4r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: kgdNLdk-rUfTaIWLXqqTSOw0hMEZ_I6_
X-Proofpoint-ORIG-GUID: kgdNLdk-rUfTaIWLXqqTSOw0hMEZ_I6_
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=69646666 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d6ssToJDxaT8U7i-MUwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNCBTYWx0ZWRfX0m+5Mv/rOLgi
 TsnvzhtAN7woSAf5UbTNptiMkkb66W2bpumZyvGEoiQGUdrWBxrmCYPj+ArhZCMYo5+O1mEpNvj
 wLXr7v7taQbvAMSvDrwqmDBaXbneNYYcvDqY5fo7exN/J2OB8xFih9tYmLNYXd6YRo16tKi1G9e
 8/zCsTMVTZdZ2inulHL3ly1xqsXkWxunvLO3XffKOi+T6OCkGRgEAAyYt10sdULneOCeycz/maH
 RskFdotVyHyallJNuKo2+XXCEvzc66PiLkJS/fXsr+28uu3hz/mJJEZNETTTpaRWSs2nC5ExTCA
 Q7/ANfVLsnmVCzrrS/fujv0zW+6rpBlcbm04TXfngOpljU9eDt/m+uCbmRXtuXyR5d5tIRhD3R+
 5LxUwI7cVACu4h4SYLT8ItX2TCAKjfiNbtxnXJZ/RkLGktli+fcokihPHYD7cqfXFe1PO0r/s/u
 MgvUD9Rut/XwmYvjerg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120024
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

Currently, the DPU driver bases LM reservation off of the maximum
supported width for the layer mixer and an arbitrary MAX_HDISPLAY_SPLIT.
However, these limits are not hardware limits meaning that a single LM
can support higher resolutions.

Switch to basing LM reservation off of PINGPONG and DSC encoder hardware
limits.

---
Changes in v3:
- Rebased on msm-next, fixing conflicts
- Updated commit messages to describe the actual issue.
- Link to v2: https://lore.kernel.org/r/20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com

Changes in v2:
- Dropped PP and DSC encoder width drop the catalog, they are now
  determined in the code by using the DPU programming
- Corrected DSC encoder width for DPUs < 8.x (2048 vs 2560)
- Link to v1: https://lore.kernel.org/r/20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com

---
Jessica Zhang (3):
      drm/msm/dpu: check mode against PINGPONG or DSC max width
      drm/msm/dpu: filter writeback modes using writeback maxlinewidth
      drm/msm/dpu: remove max_mixer_width from catalog

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 44 ++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  9 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  9 +----
 33 files changed, 45 insertions(+), 47 deletions(-)
---
base-commit: 739de27232378a4a125583153cf9d5bb651b2bd8
change-id: 20250401-max-mixer-width-9c3c02c48cb7

Best regards,
-- 
With best wishes
Dmitry

