Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1AF6FD221
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 00:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114AC10E3E5;
	Tue,  9 May 2023 22:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0BE10E3DE;
 Tue,  9 May 2023 22:07:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349Lo23r029095; Tue, 9 May 2023 22:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=NijSfvYw2N1/BtuVMqFD6XMT5gEDoB5zHb1k2J+HnAA=;
 b=EpsIGy3Bg1VfoacrJHp89oE/5nJaLKxAxpt6H3DVIpiz54hVKE+XzGS/pK5Sl7NHqJv5
 hST8N3YVSURiRjQxi0ipWwVf2nLo8k3t9SMaLppOiRc3a00QF8QBeHTyjcCJ7oGrD98B
 Su+Jn4FSfM7W3ZtvdjdJHD4+tA9JN2tQuanEfQvo7hFitlvEObELFmc/v0yUpQ5uMEjE
 4lUdRs59bhxsjm1D1q2Jt6TsE63CTW87eB04umuaR5avNih0MUtCcQnJSjQGxyn7N7Hq
 NFRYl+7M77FTGxT+viipIZpfD+Qb1aSEEjKr3liltFnZOlo1b9LOq7h4/kM//8Kd7HXH Hg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfw3d05e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 22:07:05 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 349M7406027535
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 May 2023 22:07:04 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 9 May 2023 15:07:04 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v7 0/8] Introduce MSM-specific DSC helpers
Date: Tue, 9 May 2023 15:06:46 -0700
Message-ID: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPfDWmQC/4XQTUvEMBAG4L+y5GwkH82XJ0HYg0ePiodkMrEB2
 +4mWpSl/910b1qwxzfM+8yQC6lYMlZyd7iQgnOueRpbMDcHAr0f35Dm2DIRTEgmhaMlAR3qQGM
 F2uP7CQt1lnunMKYQGWnF4CvSUPwI/Vp9fP5beDo+rHOngil/XZe/vLbc5/oxle/rLTNfX/9dO
 3PKaJLYGZeUCzrenz8z5BFuYRrICs5iHxENkcAlYFRSB7FF5D4iG6IDAovCGG/lFun2ka4hPBg
 HxgbJotkiah9RDWGc2Y7xaKzVW0TvI7ohEEz71cSSSeE3sizLDzQ06mI3AgAA
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683670024; l=6239;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=8eXZkiVgxP7phhDHFzSDQNtu2lDhXTL/jAi3Sefg1QM=;
 b=Dy0OXkBQ8hRS1kYj1bcjFjgls8uGpeXQtePhF86xSezT9palXC5y6gcDqtAro8Dtrb+nv5Xx/
 Hw/YsmqCEmkArzClVoOJy/Kp4oVe/5nduthdYgPQFg0WF7/PBTuqU7V
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: CWMiX_G2H0uRNCPLq9bRGXMTacAef3Ob
X-Proofpoint-GUID: CWMiX_G2H0uRNCPLq9bRGXMTacAef3Ob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305090180
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

Jessica Zhang (6):
      drm/display/dsc: Add flatness and initial scale value calculations
      drm/msm: Add MSM-specific DSC helper methods
      drm/msm/dpu: Use DRM DSC helper for det_thresh_flatness
      drm/msm/dpu: Fix slice_last_group_size calculation
      drm/msm/dsi: Use MSM and DRM DSC helper methods
      drm/msm/dsi: update hdisplay calculation for dsi_timing_setup

 drivers/gpu/drm/display/drm_dsc_helper.c   | 22 ++++++++++
 drivers/gpu/drm/msm/Makefile               |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c |  9 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c         | 70 ++++++------------------------
 drivers/gpu/drm/msm/msm_dsc_helper.c       | 26 +++++++++++
 drivers/gpu/drm/msm/msm_dsc_helper.h       | 69 +++++++++++++++++++++++++++++
 include/drm/display/drm_dsc_helper.h       | 12 +++++
 7 files changed, 149 insertions(+), 60 deletions(-)
---
base-commit: 5526fe03b40ca1cc72c7b4e97f28d3bbfaa0ded9
change-id: 20230329-rfc-msm-dsc-helper-981a95edfbd0

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

