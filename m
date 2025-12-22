Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F53CD58B7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5196F10E180;
	Mon, 22 Dec 2025 10:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sqqol7of";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZ5NOOSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAC010E180
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM83cX13812883
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=FZWGu1DL453pQLAG88Qmw79qrBszzLEnUD4
 gV/dA3ig=; b=Sqqol7ofOMa1Bir8T0XN4p0JDMmS+Jd7hvvIlHgzjamkErhWdQZ
 WSkq1b7Fy6OPQMaRnLFhTEmkEsUc0vstin5WnIwLOtXykA1GwOh6HwMz7IayUYg5
 jaqV3nruUxYzYdrcdJSnFvMrrLAzRXK7W1Pd6/MoLAdyF/HxelEFEWUBXxVso+5U
 CHpZtyeebCHbmff7OxWsR5xDkDwJrnSzvZwgwSVb6699b2LX6veQQLdlizVBchHI
 6qN3aF7Slq6SGhfD/OsLQHqSHwTjgtpw9A9g4KURQ9z1oUqyQMnRTkG47qAk2X1s
 GACkwXn5PHD9sWAhkeTOnqO+E9gkuibV30w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru4naw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee0c1c57bcso128898451cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 02:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399057; x=1767003857;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FZWGu1DL453pQLAG88Qmw79qrBszzLEnUD4gV/dA3ig=;
 b=GZ5NOOSEGTf+cqC+Uf7J4gdNjOkkr/z3I68pUp9TRqL6vFJAA48ROFSND7iR44zrxy
 TZU7NOXRmFhd1e8G41No5H9+f7HHetSpOC44xPc6SfLAPTs76dxo0Pi5DVhRywmZXeRd
 hV3EkC6iHJVJa2SaekjSZJtYy/kMP9xWvH0gSiSbzUIwCA/ZMF0KrJ0t6JU1+CE+lcBj
 G/pXwyrOwe0ReYFKb0Gt5r3kZr1QjtL3JUD3mtRcSDqQfjSLiseOTBALDnGkwpOY2Bvm
 gXYa47vwxUIC+iZOEtl1q4xjQ/wMBhB7eWRmqMsKGIPAH0hhpd6kWljIZlQ5CCgFx5O3
 QG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399057; x=1767003857;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FZWGu1DL453pQLAG88Qmw79qrBszzLEnUD4gV/dA3ig=;
 b=L27BMKiBbG/yAEOnR7KgsCno3mFWGJmMYPgcWH3nQKsHYN888QKEdE0uonT4ZxAsW4
 v14LJjs329ICqeaAeHiuaoAIuVjinmuKshZSYvSCsfvr3Ac8tKt3DtigYLwyzMIaIuY+
 MwBK4wJDyLK6pSlemHdHaKUoVM8RyrQyT3NLja1fbgbbUPWoJiVp43sxJ0SKd0SG/8VT
 wJcW+cQo0Bbub96YFEecsjgmYSYfi9W4vGiSRQLKi9njwBWqkX7VFBIUtddRWSKiUSjO
 i9ZdIJe1Spouq5c8/agKVppcUxstdJ27satMI1OY42L59HA9+DCogYhqe0eKjyQ01Ml6
 tEoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYFYQsr6WaUsDNrZZFxnBUAv6JDe/ho8PW2N+xnUXkLpXdJLoa+OOg0AxIjcQ++IS0cgjg4kuk9cc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybCUZNwUvPRB/5m7N2JCzjUNaV17qD15DOnkMnDZyMUlw5YavR
 se2AHtzZYpXEHzefd3qD9rFJ/snGuSoJ5WZcKL2SUK291i3MmxmCtu22gOvZ3EszPapld0K72tm
 C+4oCO8ScMMxfLJCQfNKC/fxzhrvXUcCgHoN1O9HDFJQPyKkULuhhdMpeWIGtaupLteiTvvY=
X-Gm-Gg: AY/fxX4PVvBD5f7Wh6OshldDf2N4phx6c8OkgRbaWFqVxOnmVQBLBB8WQIhKI1sqn3A
 wxC2a+MOI+15H1njJO2Y/HgzmmeuvebwgGtX9z7p3gHcM6PaeviXpRWi+8SZyz3OAucxty1ME2/
 eCiDYcAk5TArLfJ7rjIuDl9XxwfspCE2F6BT3jQsB8lKM3EHc2wlbvp2TQKkcSav77dDHKNm3Rj
 1mkcfYjXa56p84NJ3HXLhBGzCcNozym9S0BG1wvX/1SAxXTi06aboGjTEBCukwDOfB8UGbqg73D
 QXF1vNTa+gl9Be3JNysk8vNg+/BLjrag0t3FUrorPRh7AqfNXyTFok/SSVdntmsmEw/HwPajHZ1
 L5+RzaYQqc8LOiBUFMwiIfc0/DkpRKPEsR1by3yBfDJmaCUvZVZVV4Yx+5mRqOPtF+Bw=
X-Received: by 2002:ac8:5745:0:b0:4f1:e97a:db01 with SMTP id
 d75a77b69052e-4f4abdbc47dmr162929641cf.78.1766399057173; 
 Mon, 22 Dec 2025 02:24:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrsfs8pegLciKMntDLwPh4gHdtWkKuNF7kiUQEp7MKj3Ke2R+dIpQ0ybat95iqy/IK1BOirQ==
X-Received: by 2002:ac8:5745:0:b0:4f1:e97a:db01 with SMTP id
 d75a77b69052e-4f4abdbc47dmr162929431cf.78.1766399056776; 
 Mon, 22 Dec 2025 02:24:16 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:24:16 -0800 (PST)
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
Subject: [PATCH v4 00/11] drm/msm: Add support for Kaanapali
Date: Mon, 22 Dec 2025 18:23:49 +0800
Message-Id: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfXx7BmwhhSi6Ur
 cM9hnjK9G2kmwUyJMrPitlp54EBK/o6rI9ok9OLsWb7eeuesd/HzOTl9rURzKHncq3R/X1OnEM3
 rfj2AK73J4aI9qGM8bGdGDxTdCHpPX4fnksCi2Khns4qZRVYCilNmc4NeHF1cuUEIGzfvgRrrRG
 kyt9CKokTD5r8sBKMMBaKq1d59YV/pe0Npl/QL6u7BqI9EhLJD7TYNFSCEpCS/k2zJJ6k5CWCGa
 XR88KYbItGAjwJE34kFf8Brb+2+7qiM2H8yZrHd6jPPyflG+P1jr3WP2etM/neEGBP8pUEclq6g
 c1jSNf0OUfdQTNZzWCNE7rllciQ+My+5vYN3coAaVOuz8/q+0+u8h0UJYmPK/D09MnWeUW9u5TI
 6IXiS0ncwdbmcUSNQP84WvoPcS7xetqZ7BAkE5achfVzsafPghGcNZ8PNC9hOpsthL13RMLKIq7
 q+EmoU8VEhhoTi1ZvpA==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=69491c52 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=peVRiwUDOWJauV5v_QkA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: A9923qHoJ28xednGlymentJdEBMcKjRm
X-Proofpoint-GUID: A9923qHoJ28xednGlymentJdEBMcKjRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220094
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

From: Yuanjie Yang <yuanjiey@qti.qualcomm.com>

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

[PATCH v4 05/11] drm/msm/mdss: Add support for Kaanapali
compile depend on qcom-soc tree patch: https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
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
Yuanjie Yang (11):
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 123 +++--
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
 22 files changed, 1474 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c


base-commit: 06aa394d58c11406569bcbd4a69b81290edf3f63
-- 
2.34.1

