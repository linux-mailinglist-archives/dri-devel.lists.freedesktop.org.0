Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E559B342F7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39D510E499;
	Mon, 25 Aug 2025 14:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBqQFEmE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE1010E499
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8fBXJ030513
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Wu59sfweUtQOepucpDZNuv
 NpI5esikaRW2HFZthjgiI=; b=EBqQFEmEb4LFZci+yyCapE1F+ikAQ0g8qStJJM
 +2Ee3zZqTkoit9ztuq36OpNHUoQxVwWxlUFMLYlW6N+oCijlS6c3B2aVMvtMBE9E
 2tLvLHYoyJG5wg+H5UyUOvokjr6tNT6v3VMxmiwn5osb3fFzaLDlfjldr/8NM7eg
 wScnU+XlKYcn4ZyavHWCixWPaL1ENSSr+BLfe1hIRP+zFd9Kod29stCbl47RYcm2
 9wZKH3QAdHgmMc/8J02f2FSKDMhI5JQs5DqtO8yucFrKYPCmG+BWKx86n7yAiRzv
 EUwRE+iQEZFIpKCs3YN70ObiecGlnaEUI3cCrdXItHYx5aEA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615d901-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b474b68cff7so3649804a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131430; x=1756736230;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wu59sfweUtQOepucpDZNuvNpI5esikaRW2HFZthjgiI=;
 b=bzLjkWa/nn75dx5gLrmcg3BZb90Jn8DNAc1iASfDFQmaXopqKybD1DOy8MwgLjmDj8
 jeE/5OaTbQj5xbu15SYdJgSNBQFcdF/6FBtJq/lsrWTvhCSjU0XoYrxe8o4tQj6dQ89o
 9S9nMuqo6Wlor1gjjYSESJ9zOZixErKC5LJ9lQEQ0ZgFN5QRV6Ruk9MaM0FjqmQxM2GH
 hxrQOm+JflPdKX3StoXGDoQ4Gnqwr9WYG7Ng+1SvbNqh+Odi57/N0nsHNlyVaFlop3Ik
 5JFCQGQQD/mexz5shPX1fVGK0aTL1ol/jkaBqap0BtVqzFnbMNfNl0LVTtwjy/F6+7oN
 M8Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRjKOqK6ff6EICvQgq2w3ojUjuDiBePDodaBXwejdRMe8oO4GocjbOapc7tBQyfXxfCZc3k0R1+lo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM6gM/ti9eh/pCsLdqXRirzDnmI1t51N1cr0nMwjQUWox0TshP
 wSwXVPkNp3X7lMoi6fgtUXikXJ86mc/mSiCbqS2izo/rfmYpaFbCwFZTEWx0F8wnzeQchQYHq6f
 HVKCSMpFz9vJEPYkyX2KJnAsJBeNv4fbGBHff9EI3FAhl0QlOX/ucvCyw4Q1La3HBSiHHPBN3jz
 p5sH0=
X-Gm-Gg: ASbGncsR8jP3Mdj2duSfD2w3Oaz1ImP9wFJVuqEDb5TWhplSfmkwG2ewxNT9gdbJj+D
 7Ljpq0PB2M5Tctq47T6GKv6ATVLyj1rim31Ep5O7isicbs2GGFrYuSl8rm8Ouql2rzeXsjyfYov
 jKOXfrBnHex/YOALHuwxs8B/3lEkvI8bj51QSAEX6YWm8AugQZAJ7FfCnNEQzm2d9JPzkh/fqaN
 Q0Y2zxFs4WZLyg+xoiWdWgrAncAH3G8bVGA5jg+5GOTS5JUMNlmVGkT8KJUZJ5UtPyP931rINn3
 R79i2r1AUxvIpyqg/aHO+xXufNcW4Fez2DNjHkbOxGhfuus6aWjwoqFjzvTOpw7WAcLfncw=
X-Received: by 2002:a05:6a21:99aa:b0:21a:ecf5:ea71 with SMTP id
 adf61e73a8af0-24340b5b4cemr18097560637.15.1756131429860; 
 Mon, 25 Aug 2025 07:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOPO2PNUo52ZuG+6CW22LxjvJm4xtZ8v2rB+Z73p7mL0+2JIJAvhHlUHydOCE2L8s62+uKGg==
X-Received: by 2002:a05:6a21:99aa:b0:21a:ecf5:ea71 with SMTP id
 adf61e73a8af0-24340b5b4cemr18097509637.15.1756131429212; 
 Mon, 25 Aug 2025 07:17:09 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:08 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v3 00/38] drm/msm/dp: Add MST support for MSM chipsets
Date: Mon, 25 Aug 2025 22:15:46 +0800
Message-Id: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABtwrGgC/22Q22rDMBBEf8XouQq6WLZsSsl/lBCk1ToR1JdYj
 mkJ/veulVfrQWIW9mhmXizhHDGxtnixGdeY4jiQ0B8Fg7sbbshjIM2UUEZUouF96nmY6Fk4hAC
 qq2RwiIwWphm7+Jth35e3nvHxJObyHrIeU3KZ2RafGWmF5fcpcFp1sIwzXxUXvO5KlFiX0jl9H
 lM6PZ7uB8a+P9H1tf91QJKGjF3J2NXHIcThlvhaEQxraTwdo211DPMuId8ncWkLL03ZGCGltQA
 NeldrBcp4oXXoamc0AOhSdmyPeI+JTP/l+laVMx41lUM5UwbbCOWUDmeqBeIAuwV22bbtH3EiI
 vOJAQAA
X-Change-ID: 20250609-msm-dp-mst-cddc2f61daee
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131418; l=8527;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=kfjbd1frALmT1ax3tPvnTDTCNGsQG/utV3Zk0tWS9yk=;
 b=pq/EJ6TWfDHS3WCZCgRE8W3NSKY5/yb6xpdK0+tGEID8XzYMbOkrrSgiL1+314NLYFEBYDbna
 kkd04rYvOpoA99SBZ8b/dnTqXd9AmunH74k3s8/oK2attZF3ijBf/M6
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX6o2/C7QnP7UZ
 /XLSr+8Su0+zt7HnGHvLg3MFQl94i6BQ+hTrqk8DTzm9/BEDXStArpspuVYrOG76p75HrpbbB1H
 1m9DXqOpmHMJcdF6szvbGJheDW7oZ6olqRyuMdEGz4us6145nKgzzcIFr2UJuW+aJ46ilJljGKQ
 8aOX7jRxk6+LnRSXHEtP3M9V9gOeIGGcmbG2oTVqnFraJ3+GazKyA8htbAukqhDVSbrL4h2O8HF
 ErFe/3B1utTY6LLlV3CCIE/J9woDujM/Kj2Vo3lKXDbbJIFV3rWJ+lVPuJVtaQWygAqVLZgoeU4
 /dVohDqwm1cABdi/ZTUERE/T5ZiZpr43f3DNUgacxQ/CXmlMaDJO40xVJln+h6v78a8sZEWIIT1
 8L8tMdNg
X-Proofpoint-GUID: nR0yXq0IaiwrfQRVAVf3nLTCfcn7Wlmb
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ac7068 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8
 a=l6kI6A2B7Aiyxt7-y2QA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-ORIG-GUID: nR0yXq0IaiwrfQRVAVf3nLTCfcn7Wlmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
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

Add support for Multi-stream transport for MSM chipsets that allow
a single instance of DP controller to send multiple streams.

This series has been validated on sa8775p ride platform using multiple
MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.

With 4x4K monitors, due to lack of layer mixers that combination will not
work but this can be supported as well after some rework on the DPU side.

In addition, SST was re-validated with all these changes to ensure there
were no regressions.

This patch series was made on top of:

[1] : https://patchwork.freedesktop.org/series/151522/ (v2 to fix up HPD)

Bindings for the pixel clock for additional stream is available at :

[2] : https://patchwork.freedesktop.org/series/152718/

Overall, the patch series has been organized in the following way:

1) First set are a couple of fixes made while debugging MST but applicable
to SST as well so go ahead of everything else
2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
of the work as current DP driver design had to be adjusted to make this happen.
3) Finally, new files to handle MST related operations

Validation was done on the latest linux-next on top of above changes and
both FB console and weston compositors were validated with these changes.

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v3: Fixed review comments from Dmitry
- Fixed lots of comments from series V1/V2.
- Rebased onto next-20250808.
- Rebased onto Jessica's HPD-refactor branch.
- Fixed formatting issues in commit messages under changes.
- Removed unnecessary one-line wrappers.
- Relocated MST-related .atomic_check() calls to their appropriate positions.
- Removed the logic related to slot checking in .mode_valid().
- Link to v2: https://lore.kernel.org/r/20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com

Changes in v2: Fixed review comments from Dmitry
- Rebase on top of next-20250606
- Add all 4 streams pixel clks support and MST2/MST3 Link clk support
- Address the formatting issues mentioned in the review comments
- Drop the cache of msm_dp_panel->drm_edid cached
- Remove the one-line wrapper funtion and redundant conditional check
- Fixed the commit messgae descriptions of some patches
- Reordered the patches and renamed some functions and variables
- Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-0-f
8618d42a99a@quicinc.com/

---
Abhinav Kumar (30):
      drm/msm/dp: remove dp_display's dp_mode and use dp_panel's instead
      drm/msm/dp: break up dp_display_enable into two parts
      drm/msm/dp: re-arrange dp_display_disable() into functional parts
      drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
      drm/msm/dp: split dp_ctrl_off() into stream and link parts
      drm/msm/dp: make bridge helpers use dp_display to allow re-use
      drm/msm/dp: separate dp_display_prepare() into its own API
      drm/msm/dp: introduce max_streams for DP controller MST support
      drm/msm/dp: introduce stream_id for each DP panel
      drm/msm/dp: Add support for programming p1/p2/p3 register blocks
      drm/msm/dp: use stream_id to change offsets in dp_catalog
      drm/msm/dp: add support to send ACT packets for MST
      drm/msm/dp: Add support to enable MST in mainlink control
      drm/msm/dp: no need to update tu calculation for mst
      drm/msm/dp: Add support for MST channel slot allocation
      drm/msm/dp: Add support for sending VCPF packets in DP controller
      drm/msm/dp: Always program MST_FIFO_CONSTANT_FILL for MST use cases
      drm/msm/dp: abstract out the dp_display stream helpers to accept a panel
      drm/msm/dp: replace power_on with active_stream_cnt for dp_display
      drm/msm/dp: Mark the SST bridge disconnected when mst is active
      drm/msm/dp: add an API to initialize MST on sink side
      drm/msm/dp: add dp_display_get_panel() to initialize DP panel
      drm/msm/dp: add dp_mst_drm to manage DP MST bridge operations
      drm/msm/dp: add connector abstraction for DP MST
      drm/msm/dp: add HPD callback for dp MST
      drm/msm: add support for MST non-blocking commits
      drm/msm: initialize DRM MST encoders for DP controllers
      drm/msm/dp: initialize dp_mst module for each DP MST controller
      drm/msm/dpu: use msm_dp_get_mst_intf_id() to get the intf id
      drm/msm/dp: fix the intf_type of MST interfaces

Yongxing Mou (8):
      drm/msm/dp: remove cached drm_edid from panel
      drm/msm/dp: splite msm_dp_ctrl_config_ctrl() into link parts and stream parts
      drm/msm/dp: extract MISC1_MISC0 configuration into a separate function
      drm/msm/dp: move the pixel clock control to its own API
      drm/msm/dp: Add catalog support for 3rd/4th stream MST
      drm/msm/dp: add MST atomic check to msm_atomic_check()
      drm/msm/dp: propagate MST state changes to dp mst module
      drm/msm/dp: Add MST stream support for SA8775P DP controller 0 and 1

 drivers/gpu/drm/msm/Makefile                       |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |   6 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  12 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  51 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  29 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |   2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 664 +++++++++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |  23 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 569 ++++++++----
 drivers/gpu/drm/msm/dp/dp_display.h                |  36 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  51 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |  12 -
 drivers/gpu/drm/msm/dp/dp_mst_drm.c                | 994 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h                |  90 ++
 drivers/gpu/drm/msm/dp/dp_panel.c                  | 295 +++---
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  27 +-
 drivers/gpu/drm/msm/dp/dp_reg.h                    |  46 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |  10 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  19 +
 drivers/gpu/drm/msm/msm_kms.c                      |   2 +
 22 files changed, 2529 insertions(+), 420 deletions(-)
---
base-commit: b1549501188cc9eba732c25b033df7a53ccc341f
change-id: 20250609-msm-dp-mst-cddc2f61daee
prerequisite-message-id: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
prerequisite-patch-id: 0fc90e557ae4bb852757444b92af71ebb3c0698f
prerequisite-patch-id: a58ebaf429385c622869c83e83ce7ffdfe9ea27e
prerequisite-patch-id: 9840ae12755ebc1528d6719b058b86ce8ba3e5e8
prerequisite-patch-id: 8d5d7ac0302a333ecaf01d420f067d2db7195783
prerequisite-patch-id: 49532adadff58e9069a96b37f26017847fb29a3d
prerequisite-patch-id: 3d58007342ba985e1c7f0f85ebc5da29c8b67b5c
prerequisite-patch-id: 46274f99ffb986e53a48d6802e2fc05beb7b7b01
prerequisite-patch-id: 67536f5bceaf6e9aae18cb8e95874b71ef22dee4
prerequisite-patch-id: f5fb952fb63bce96161cb56db065927fa0a91e87
prerequisite-patch-id: 981c763c51c815adda57909ffe567cfa1069d5f5
prerequisite-patch-id: 3f738fbbf3634482eaf46e5bd5b83c0cf2ce0fe1
prerequisite-patch-id: 1e250d144e7bad58e2f1ea33f74ceea8e26335e0
prerequisite-message-id: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
prerequisite-patch-id: ffeeb0739a4b3d310912f4bb6c0bd17802818879
prerequisite-patch-id: f0f92109d1bfffa6a1142f2aaecbd72a29b858c0
prerequisite-patch-id: 9cabb6be69b17e8580a2cffc7aa2709106cc1adf
prerequisite-patch-id: a389a2e4eca44bf62bb2c861c96596368be7a021
prerequisite-patch-id: 4f02ab9314f95984ab7dc9b852ba4d6c676746a7
prerequisite-patch-id: 62d643df7c88d8db2279def1e4b63a605e9145c0

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

