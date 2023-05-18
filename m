Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F25A470773E
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 03:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBCB10E4C5;
	Thu, 18 May 2023 01:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F4110E4C4;
 Thu, 18 May 2023 01:14:43 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34I0n7Bj006261; Thu, 18 May 2023 01:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=IsAaFVfYz5ton3uLpXHOIafii5ZCrKimCQ+9YHVoMuw=;
 b=StyrjRTimHopU27V3IJIpZbKr6BwqVXMC0jDSCYIo1rBj2Hg3DSHa9xAgn1vJi7qVWzP
 7zCh+lV5fQfL2Kj/19/7elFw+N0F2L2AdkAmPCbLukXmiPUGl9kBwcTi6CiVSi0rXtoT
 wMZC+PvLrJbAWrbmlk8RLnCJoZFxVXVXaiiqlxJ+3fpAYycO+sH3fsZ2Qlo1qT6/f1cd
 owuRLkDMItb+VZ5hlH6Vz2ImyY2PXIej79riigg86h/pMi+oj9MFsLMrGH4vOsGChYfJ
 va2thh+Hf6ykzCbLLtgqwpsmiJySFTLbWAKxgx40ZKLxVLihCdN652tiWmh/33IRr2iU OQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmt5gt844-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 01:14:40 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34I1EcMn001628
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 01:14:38 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 18:14:38 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v13 0/9] Introduce MSM-specific DSC helpers
Date: Wed, 17 May 2023 18:14:26 -0700
Message-ID: <20230329-rfc-msm-dsc-helper-v13-0-d7581e7becec@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPJ7ZWQC/43SwU7EIBAG4FfZ9CyGGWgBTyYmHjx61HiAYbAkb
 ndttdFs9t2le9NuZI9DmG/I8B+aicfMU3OzOTQjz3nKu6EUoK42DfV+eGWRYzloUKKSCp0YE4n
 ttBVxItHz255H4Sx413JMIcqmNAY/sQijH6hfWh+e/jY83t8t9/Yjp/x1mv78Uuo+Tx+78fv0m
 BmW03/HziCkSIq1cal1oYu375+Z8kDXtNs2CzhjHcGCKAJFHFvVBVwjqo6ognSBSUY0xlu1RnQ
 d0QWBYBwZG5SMZo20daQtiARptYRorO3WSFdHuoJQMGWrSSaTwhoxdcQUJCZtPVKrNcIasXXEF
 gTJBQwBUDpaI66OuIJYEz17JiTp1wjIC9JWFis0BQToLCGe+R+4JLRLapVEIxmYPZ3JClwQW1h
 y6ygGU346daB/M8fj8QchsDQS3AMAAA==
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684372478; l=8509;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=qFSauQniphGGCZcxUtWeeAAVDVd+Rs31p63XwC20f3Y=;
 b=vY9R1pAGuBImgum1njKnf52aishsbVRHx2wuwDY9jXabx577SzgaeWF9X3BKIu8imBXxbye/r
 U21g6lyQumbBiu7iKPoAdS1oNMGfkCc8cDPxpOpobx9DgXZg/1NUZKP
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CMDBqESeszkHNGdi8WlAzRu8z-nD8l_U
X-Proofpoint-ORIG-GUID: CMDBqESeszkHNGdi8WlAzRu8z-nD8l_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180005
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
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
Changes in v13:
- Reworded comment doc for msm_dsc_get_slices_per_intf()
- Changed intf_width to u32
- msm_dsc_calculate_slices_per_intf -> msm_dsc_get_slices_per_intf
- Link to v12: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com

Changes in v12:
- Reworded summary comment for msm_dsc_helper.h
- msm_dsc_get_slices_per_intf -> msm_dsc_calculate_slices_per_intf
- Corrected total_bytes_per_intf math in dsc_update_dsc_timing
- Rebased on top of latest version of "drm/i915: move DSC RC tables to drm_dsc_helper.c"
- Link to v11: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com

Changes in v11:
- Fixed mismatched return types
- Moved MSM DSC helpers summary comment to under copyright
- Moved msm_dsc_get_bpp_int() to drm_dsc_helper.h
- Reworded MSM DSC helper comment docs for clarity
- Added const keyword where applicable
- Renamed msm_dsc_get_slice_per_intf to msm_dsc_get_slices_per_intf
- Removed msm_dsc_get_slice_per_intf()
- Reworded commit message for "drm/msm/dsi: update hdisplay calculation
  for dsi_timing_setup"
- Link to v10: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com

Changes in v10:
- Removed msm_dsc_get_bytes_per_slice helper
- Inlined msm_dsc_get_bytes_per_intf
- Refactored drm_dsc_set_initial_scale_value() to be a pure function
- Renamed DRM DSC initial_scale and flatness_det_thresh helpers
- Removed msm_dsc_helpers.o from Makefile
- Link to v9: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v9-0-87daeaec2c0a@quicinc.com

Changes in v9:
- Fixed incorrect math for msm_dsc_get_bytes_per_line()
- Link to v8: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v8-0-2c9b2bb1209c@quicinc.com

Changes in v8:
- *_bytes_per_soft_slice --> *_bytes_per_slice
- Fixed comment doc formatting for MSM DSC helpers
- Use slice_chunk_size in msm_dsc_get_bytes_per_line calculation
- Reworded "drm/msm/dpu: Use DRM DSC helper for det_thresh_flatness"
  commit title for clarity
- Picked up "Reviewed-by" tags
- Added duplicate Signed-off-by tag to "drm/display/dsc: Add flatness
  and initial scale value calculations" to reflect patch history
- Link to v7: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com

Changes in v7:
- Renamed msm_dsc_get_pclk_per_intf to msm_dsc_get_bytes_per_line
- Removed duplicate msm_dsc_get_dce_bytes_per_line
- Reworded commit message for "drm/msm/dpu: Use DRM DSC helper for
  det_thresh_flatness"
- Dropped slice_per_pkt change (it will be included in the later
  "Add DSC v1.2 Support for DSI" series)
- Picked up "drm/display/dsc: Add flatness and initial scale value
  calculations" and "drm/display/dsc: add helper to set semi-const
  parameters", which were dropped from "drm/i915: move DSC RC tables to
  drm_dsc_helper.c" series
- Picked up "Reviewed-by" tags
- Removed changelog in individual patches
- Link to v6: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com

Changes in v6:
- Documented return values for MSM DSC helpers
- Fixed dependency issue in msm_dsc_helper.c
- Link to v5: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com

Changes in v5:
- Added extra line at end of msm_dsc_helper.h
- Simplified msm_dsc_get_bytes_per_soft_slice() math
- Simplified and inlined msm_dsc_get_pclk_per_intf() math
- "Fix calculations pkt_per_line" --> "... Fix calculation for pkt_per_line"
- Split dsc->slice_width check into a separate patch
- Picked up Dmitry's msm/dsi patch ("drm/msm/dsi: use new helpers for
  DSC setup")
- Removed unused headers in MSM DSC helper files
- Picked up Reviewed-by tags
- Link to v4: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com

Changes in v4:
- Changed msm_dsc_get_uncompressed_pclk_per_intf to msm_dsc_get_pclk_per_intf
- Moved pclk_per_intf calculation for dsi_timing_setup to `if
  (msm_host->dsc)` block
- Link to v3: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v3-0-6bec0d277a83@quicinc.com

Changes in v3:
- Dropped src_bpp parameter from all methods -- src_bpp can be
  calculated as dsc->bits_per_component * 3- Cleaned up unused parameters
- Dropped intf_width parameter from get_bytes_per_soft_slice()
- Moved dsc->bits_per_component to numerator calculation in
  get_bytes_per_soft_slice()
- Made get_bytes_per_soft_slice() a public method (this will be called
  later to help calculate DP pclk params)- Added comment documentation to
  MSM DSC helpers
- Renamed msm_dsc_get_uncompressed_pclk_per_line to
  *_get_uncompressed_pclk_per_intf()
- Removed dsc->slice_width check from msm_dsc_get_uncompressed_pclk_per_intf()
- Added documentation in comments
- Moved extra_eol_bytes math out of msm_dsc_get_eol_byte_num()
- Renamed msm_dsc_get_eol_byte_num to *_get_bytes_per_intf.
- Reworded slice_last_group_size calculation to `(dsc->slice_width + 2) % 3`
- Used MSM DSC helper to calculate total_bytes_per_intf
- Initialized hdisplay as uncompressed pclk per line at the beginning of
  dsi_timing_setup as to not break dual DSI calculations
- Added slice_width check to dsi_timing_setup
- Dropped 78c8b81d57d8 ("drm/display/dsc: Add flatness and initial scale
  value calculations") patch as it was absorbed in Dmitry's DSC series [1]
- Split dsi_timing_setup() hdisplay calculation to a separate patch
- Link to v2: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com

Changes in v2:
- Changed det_thresh_flatness to flatness_det_thresh
- Set initial_scale_value directly in helper
- Moved msm_dsc_helper files to msm/ directory
- Dropped get_comp_ratio() helper
- Used drm_int2fixp() to convert to integers to fp
- Fixed type mismatch issues in MSM DSC helpers
- Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
- Style changes to improve readability
- Dropped last division step of msm_dsc_get_pclk_per_line() and changed
  method name accordingly
- Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
- Changed msm_dsc_get_slice_per_intf() to a static inline method
- Split eol_byte_num and pkt_per_line calculation into a separate patch
- Moved pclk_per_line calculation into `if (dsc)` block in
  dsi_timing_setup()
- *_calculate_initial_scale_value --> *_set_initial_scale_value
- Picked up Fixes tags for patches 3/5 and 4/5
- Picked up Reviewed-by for patch 4/5
- Link to v1: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com

---
Dmitry Baryshkov (2):
      drm/display/dsc: add helper to set semi-const parameters
      drm/msm/dsi: use DRM DSC helpers for DSC setup

Jessica Zhang (7):
      drm/display/dsc: Add flatness and initial scale value calculations
      drm/display/dsc: Add drm_dsc_get_bpp_int helper
      drm/msm: Add MSM-specific DSC helper methods
      drm/msm/dpu: Use fixed DRM DSC helper for det_thresh_flatness
      drm/msm/dpu: Fix slice_last_group_size calculation
      drm/msm/dsi: Use MSM and DRM DSC helper methods
      drm/msm/dsi: update hdisplay calculation for dsi_timing_setup

 drivers/gpu/drm/display/drm_dsc_helper.c   | 22 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c |  9 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c         | 68 ++++++------------------------
 drivers/gpu/drm/msm/msm_dsc_helper.h       | 38 +++++++++++++++++
 include/drm/display/drm_dsc_helper.h       | 18 ++++++++
 5 files changed, 96 insertions(+), 59 deletions(-)
---
base-commit: c0c7f04818136b3204589da42b4532b5aa3d4971
change-id: 20230329-rfc-msm-dsc-helper-981a95edfbd0

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

