Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E11D01AE9
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7614510E6AE;
	Thu,  8 Jan 2026 08:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYskxefg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AOoeglXs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BE410E6A8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:57:27 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6088rik04050027
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 08:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=nhjJWLw/0dTCc3tfX82ZgRJq9vD0BpxCKJY
 dzLZlEnk=; b=IYskxefgt3QRAw3h5dijBTuGfQU6xrIVrgScfONlibyz30vOdJT
 TRlKwyNbA0VyR59BNjHD6yuh3hjKz/2Sj7XVCnw95EGgW0ZIeUqn1h9HbtA4A8ko
 ZBGLdijus7sGxVtiZ5LaaKmb+pSH71mCyIAU4IOmQ8WKM1SALWm3j93nM/gat6Zm
 wwSxifHphvqDc90pMmsNmqOhpw2nQzxGrTrzzrB0e/YTz40su8gMNlUyHPzGJNbP
 qpjFWLcJdmxnyA/nanIAoBaGgYS6xU0Mskh9AyptxX6mWexdC0suxNONoyT2jgf0
 hDDxZ+msI6BGJ14awRdvOlCKlG7KSilLZNg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8hagb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:57:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee0995fa85so91412071cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862646; x=1768467446;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nhjJWLw/0dTCc3tfX82ZgRJq9vD0BpxCKJYdzLZlEnk=;
 b=AOoeglXsWYHnljHiyGbcWMYkakkmBXZ1lEAAVteHSH3Lthi2hjvf+N8pfz27NwmOEo
 EYgdNKY3BpdvmUTZ5h92PHmU/accVbR19aHqfZlFjMMwNkCtaovKjZLPTWpHfC6QU8Ib
 y34WL73ugKQA5+GEsZ6YUEdYscPrFIlx7W1gdpU15BrVh2MyHzrZWiJ0IQW98oLpHdgT
 qHecr7MpU5V4sqbAJ7ApXtBP+tsfCXBuc+QV8oVPDzgrI5mr3oJJzDalmPro1McW+EzN
 9c55N8Y/0hG2J85r1f153x46+z4B2VOpfzol2MwPLTL7dPiHxoS0tQGZgShDEDzREFim
 yvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862646; x=1768467446;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nhjJWLw/0dTCc3tfX82ZgRJq9vD0BpxCKJYdzLZlEnk=;
 b=hLt+WR7waqAGKs4AeEM0Tk42vvnSgKupbqiTaOVFDofF2KIfJM+dCkj1oLX4f6QNty
 l/lsCPUyitHaBIxNRZszfjswTe9n0CGaiA+hf5P4lmFLU5fOfZTcdJn0a6VRAT76tADO
 Ca4Tl1HYqsX9emDkz9HIPtJioKsbYpKhRaaM6PbHoJwU6CR0USoogNNOmIIQexXo4x35
 kGasPdeoTdzQbDkReKkPeVaQpH+O1CDi97ksngz3pstY6g5pUfJOaHUvXK6TTG63jpjD
 h6V2MVx7BpLjtwNxgOPu5gfFNHHqJUVItMuBsVX/OXQgKJ8avpZMM4Re4MjAimgcxiQW
 VMAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOcLUiMqKOnurKCKzNs7Rv8xkvhOOSzzGfpdV1EswWdDw34cztbzguOBDbKKHLx+C6cJwnjJom71w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/rF/Hy2chI1tkpgYReeBstRTiMUIoNaj8J0W2zA/ZWoX/WtF4
 hWCZPzSX87TtMUuGRb09O+GCCfb31GWyYXMPRrAKBXSxcIE+9IE7yZfeYPpAdAOhA64skyH1ET8
 l0GL/aRrD8e0pcnHjnsK/ky7LUbhyR+9S1QsGn/7OQAmrWvHttcEUq1r4desmgZPNQQWCJFE=
X-Gm-Gg: AY/fxX5GQHJpL4gZ0UQFxx4UN+6v7siSZgq62UHgr3x9j/6TO3PETeFkrlC5JlWi1JC
 YII+9djWmHTB7FDBOu3GgnYUpIIOB8T1rcfuAghSBNXy99Wq6UxhMmt2df2hhTyGV+DlwkfhKxE
 Yc5akOT5IKyl/b7YQcwu6yEDFcfL6YYOvPbWnybSA7P3T+4mdBFLUnwhm6A9ry031r4id/W7pbj
 /bjmJCOAq2b6IFoCazGIyNuFWBkmQBl+rAMjFna+70A65XZHkrENDOKzYxHPqxxVVznFTmiAnAQ
 mR+39yP+XneAX6iMVIwEx4MAmjxTqQFvucM3gYFxpzU0QCeGbQYUWQzJGcHybT9Qs8v3mW0a3C1
 SLEnxdAChIQ+jPf/CgnuqGIZhZyllggw+m7JaYtXSC9wAI5y9dxBYiIQaRiXqh+BnzeQ=
X-Received: by 2002:ac8:7f0a:0:b0:4ec:a568:7b2d with SMTP id
 d75a77b69052e-4ffb4900996mr79700621cf.34.1767862645649; 
 Thu, 08 Jan 2026 00:57:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyRmRDDK3+l294Ljo8xxE2VOV3QjuBD6c9wXCfd+ibx7iZUs2A25kanf0Sz570Uidz1c0qdw==
X-Received: by 2002:ac8:7f0a:0:b0:4ec:a568:7b2d with SMTP id
 d75a77b69052e-4ffb4900996mr79700331cf.34.1767862645168; 
 Thu, 08 Jan 2026 00:57:25 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:57:24 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v5 00/12] drm/msm: Add support for Kaanapali
Date: Thu,  8 Jan 2026 16:56:47 +0800
Message-Id: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695f7176 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Bo5jAF1uHjWhBEmHg44A:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: PxdK9EL5vfP_tiUb_Qi8H_gD7NE_yWuJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX+0fVrXt1b4jq
 cb1/wRgHjcdaUd7ncMVr9/2DvjXdhc2wOKv7/dcpWDHU8jTkCN57C4Ok7GOoGJXzdW2PwiWIUXw
 lrD6DRox553dP5TSukV49nqw6yzZt15Tp3fxi9fFrCyXfs6hBJsTHirQh0TCGyKjnmGN10NkGoI
 4/2DBPGcdf6WCHB96es1LeS9VxXJkthydJHONE0TCHLFWVwmVTvFZU61S1IFyZ2NSZD2w+tqRWR
 etArZXWbj8Z5wej1R3cEs+76rgYFMffsDJ0SLBN6Qo/2z7KaWZ3PUW2sE5F6pu1SNs/dxSJ5nOK
 GAQQf9JAESMALyU3OTHtUqOTQF0DTBvXZ8jUsNQavNM0wfqhxQeLFO6CNbl/rgY46ReDUJV5k1A
 bY5mDtl5W0JeC2HlQQ6yGR7KIzQR8iuD9k/Rs0meWBp9XbQag2FFfUkJ7xhAKRa+mucXNXfoL4J
 9Pjc6bDoldfAIfcZ3ig==
X-Proofpoint-GUID: PxdK9EL5vfP_tiUb_Qi8H_gD7NE_yWuJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
- DSI PHY/DSI base address have some changes.
- DPU 13.0:
  - SSPP layout has a great change.
  - interrupt INTF layout has some changes.

This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
in addition to the driver changes.

We have already tested the display functionality using the Kaanapali-mtp
device on the Kaanapali branch of kernel-qcom repository.
Test command: "modetest -r -v"
kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali

[PATCH v5 05/12] drm/msm/mdss: Add support for Kaanapali
compile depend on qcom-soc tree patch: https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v5:
- move sspp v13 related change from refactor patch to sspp v13 patch
- move sspp ubwc change to dpu_hw_sspp_setup_format
- split wb change into a patch
- Link to v4: https://lore.kernel.org/all/20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com/

Changes in v4:
- fix qcom,kaanapali-mdss.yaml compile error
- reorganize SSPP patch order
- fix Dmitry ohter comment
- rebase on top of msm-next
- Link to v3: https://lore.kernel.org/all/20251215083854.577-1-yuanjie.yang@oss.qualcomm.com/

Changes in v3:
- split SSPP refactor patch
- add devicetree email list
- fix Dmitry comment
- rebase on top of msm-next
- Link to v2: https://lore.kernel.org/all/20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com/

Changes in v2:
- Drop panel patch
- adjust patch order (bindings then drivers)
- add dpu_hw_ssppv13.c to complete kaanapali SSPP function
- fix bindings example dts compile error
- fix other comment
- rebase on top of msm-next
- Link to v1: https://lore.kernel.org/all/20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com/

---
Yuanjie Yang (12):
  dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
  dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
  dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
  dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
  drm/msm/mdss: Add support for Kaanapali
  drm/msm/dsi/phy: Add support for Kaanapali
  drm/msm/dsi: Add support for Kaanapali
  drm/msm/dpu: Add interrupt registers for DPU 13.0.0
  drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
  drm/msm/dpu: Add Kaanapali SSPP sub-block support
  drm/msm/dpu: Add Kaanapali WB support
  drm/msm/dpu: Add support for Kaanapali DPU

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 +++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml |   1 +
 drivers/gpu/drm/msm/Makefile                  |   1 +
 .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  89 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 124 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  56 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  13 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  23 +
 drivers/gpu/drm/msm/msm_mdss.c                |  10 +-
 22 files changed, 1475 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c


base-commit: 538113b88e9809ffdf2fbcf1392c510181ac7967
-- 
2.34.1

