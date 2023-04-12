Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288AB6E0282
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 01:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC0410E9F2;
	Wed, 12 Apr 2023 23:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9143D10E9E3;
 Wed, 12 Apr 2023 23:25:23 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33CNJnBL003497; Wed, 12 Apr 2023 23:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=x2U/7GEQAmyLIF1raM1xoJPaYlZ9vWdyT03UyDASMC0=;
 b=mNRYiW6M0ZGheiaAawRflht+SasMvHXg5bIzE7hyJL9sCN08226NgI3mfd+Zf5Adf48n
 aknjsv6uo/IGtokjyY5fGLvGtkiPE4J051W8MWlUKNtEeQP/pZcdiHUlBt7JWcGW14JD
 IrGRAcxKyIcf2KAlHNRqLCWFOf+/QE02qdV8l6C/51bTc51GbH6PYZ0K5YVE1AgPTl/Y
 LR3jphklVTjbSncJK/VZl/rCv679hKMijFZOEMf6TujHBEzAe5+QZr0sgsUPLiCIvLmZ
 hhBwalgLaVZgfkUIZBazujBvY5Ymib0x5t0/uq/MYoiSWEFSRIduDZXOroivSzeVLhhG uQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwqent0yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 23:25:20 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CNPJFE006942
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 23:25:19 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 12 Apr 2023 16:25:19 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v6 0/7] Introduce MSM-specific DSC helpers
Date: Wed, 12 Apr 2023 16:25:14 -0700
Message-ID: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANo9N2QC/4XOu07EMBAF0F9ZucbIj/hFhYS0BSUliMIej4klk
 uzaEIFW+Xec7SASKe9o7pm5kIolYyV3hwspOOeap7EFfXMg0PvxDWmOLRPBhGRSOFoS0KEONFa
 gPb6fsFBnuXcKYwqRkVYMviINxY/Qr9XH57+Fp+PDuncqmPLX9fjLa8t9rh9T+b7+MvN1+u/Zm
 VNGk8TOuKRc0PH+/Jkhj3AL00BWcBb7iGiIBC4Bo5I6iC0i9xHZEB0QWBTGeCu3SLePdA3hwTg
 wNkgWzRZR+4hqCOPMdoxHY63+jSzL8gN9WZVE8gEAAA==
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681341919; l=3930;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=ZYW75BS9qge31yoUH3gbn/FZyJ6L3LvAQjIs9FWgTKw=;
 b=QUB7jhr7lAqx4xnUH74Xs5LnnfBdGqZasvvbXz7SABN+xp9koh6e4N1Ag1gFylW/eOcbGBAaX
 zxoTAtAADDdDZVZ0wJqvibe3wZ/l5bma1kFwQZBcabM28lBuTNUwzQp
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vnhXvqMz0w_EpXz1UsOCcJvqlmJLjm20
X-Proofpoint-ORIG-GUID: vnhXvqMz0w_EpXz1UsOCcJvqlmJLjm20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_13,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120197
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some overlap in calculations for MSM-specific DSC variables
between DP and DSI. In addition, the calculations for initial_scale_value
and det_thresh_flatness that are defined within the DSC 1.2 specifications,
but aren't yet included in drm_dsc_helper.c.

This series moves these calculations to a shared msm_dsc_helper.c file and
defines drm_dsc_helper methods for initial_scale_value and
det_thresh_flatness.

Note: For now, the MSM specific helper methods are only called for the DSI
path, but will called for DP once DSC 1.2 support for DP has been added.

Depends on: "drm/i915: move DSC RC tables to drm_dsc_helper.c" [1]

[1] https://patchwork.freedesktop.org/series/114472/

---
Changes in v6:
- Documented return values for MSM DSC helpers
- Fixed dependency issue in msm_dsc_helper.c
- Link to v5: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com

Changes in v5:
- Picked up Reviewed-by tags
- "Fix calculations pkt_per_line" --> "... Fix calculation for pkt_per_line"
- Split dsc->slice_width check into a separate patch
- Picked up Dmitry's msm/dsi patch ("drm/msm/dsi: use new helpers for
  DSC setup")
- Simplified MSM DSC helper math
- Removed unused headers in MSM DSC helper files
- Link to v4: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com

Changes in v4:
- Changed msm_dsc_get_uncompressed_pclk_per_intf to msm_dsc_get_pclk_per_intf
- Moved pclk_per_intf calculation for dsi_timing_setup to `if
  (msm_host->dsc)` block
- Link to v3: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v3-0-6bec0d277a83@quicinc.com

Changes in v3:
- Cleaned up unused parameters
- Reworded some calculations for clarity
- Changed get_bytes_per_soft_slice() to a public method
- Added comment documentation to MSM DSC helpers
- Changed msm_dsc_get_eol_byte_num() to *_get_bytes_per_intf()
- Split dsi_timing_setup() hdisplay calculation to a separate patch
- Dropped 78c8b81d57d8 ("drm/display/dsc: Add flatness and initial scale
  value calculations") patch as it was absorbed in Dmitry's DSC series [1]
- Link to v2: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com

Changes in v2:
- Changed det_thresh_flatness to flatness_det_thresh
- Moved msm_dsc_helper files to msm/ directory
- Fixed type mismatch issues in MSM DSC helpers
- Dropped MSM_DSC_SLICE_PER_PKT macro
- Removed get_comp_ratio() helper
- Style changes to improve readability
- Use drm_dsc_get_bpp_int() instead of DSC_BPP macro
- Picked up Fixes tags for patches 3/5 and 4/5
- Picked up Reviewed-by for patch 4/5
- Split eol_byte_num and pkt_per_line calculation into a separate patch
- Moved pclk_per_line calculation into `if (dsc)` block in
  dsi_timing_setup()
- Link to v1: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com

---
Dmitry Baryshkov (1):
      drm/msm/dsi: use new helpers for DSC setup

Jessica Zhang (6):
      drm/msm: Add MSM-specific DSC helper methods
      drm/msm/dpu: Use DRM DSC helper for det_thresh_flatness
      drm/msm/dpu: Fix slice_last_group_size calculation
      drm/msm/dsi: Use MSM and DRM DSC helper methods
      drm/msm/dsi: update hdisplay calculation for dsi_timing_setup
      drm/msm/dsi: Fix calculation for pkt_per_line

 drivers/gpu/drm/msm/Makefile               |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c |  9 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c         | 76 +++++++---------------------
 drivers/gpu/drm/msm/msm_dsc_helper.c       | 26 ++++++++++
 drivers/gpu/drm/msm/msm_dsc_helper.h       | 81 ++++++++++++++++++++++++++++++
 5 files changed, 132 insertions(+), 61 deletions(-)
---
base-commit: 7417f9c699613f284bd4edc93adccac3ea3ced0f
change-id: 20230329-rfc-msm-dsc-helper-981a95edfbd0

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

