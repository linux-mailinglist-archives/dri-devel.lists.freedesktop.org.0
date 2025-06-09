Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A37EAD1DEB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E7B10E0B6;
	Mon,  9 Jun 2025 12:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIE3dUgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C19210E0A9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 12:36:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599LiI1019082
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 12:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5bgSmE1gETbODHnJ5BZMPbqS
 KODgTBn121BVFTvpvjg=; b=EIE3dUgMppVZFJosxdWu0iIvkxuixn7d0u/fBubD
 UQI956cU6Djsf+j6BxpQrotuHkThQrAOFNL7KQeHPmnWqQR8qwaCB/Z4NkwalWnn
 ufApoBNpShFWu5ukAZ9HTbLjEPa7upEMRBqjbBcqW55OXdRy1nGGUcPiZu9yuSYv
 KNC9osAuT06K6iQ9dma2AIorgWMuZBWggTuM/QaE7ukAAmBy/SYI+R+/kEN3lZUx
 XGPnv/MepuZJHq8Kcwnjs9nRajmBhKWfxbt5femxPS7DrT0tXYfrKMAYZd99hze8
 eek9uL/+51xrRUDyIJWgvvhmg3rdSDty7UxUwLtE12dVHA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpnr0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 12:36:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4a43f155708so78894611cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 05:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749472606; x=1750077406;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5bgSmE1gETbODHnJ5BZMPbqSKODgTBn121BVFTvpvjg=;
 b=F2unkHlmn+sxo/bvNIVQFHlGDbXlKWGsNcW2QSJYtzRTUAKJM1Fo1eAXoT+GNFkhZV
 GAoUr/+S38D3+EX/ti8iLo6chg00Zj/aawFAXU56K8XfqZaytvMzny9swTY/xNJbDhgy
 9VY0pgACLJdseOeEIUoBnWOW961fGeIIq+pDHwde6RqWV8Jm0zjjyDuTMSQRBPpEmI0G
 GKPprtaRvQE8A58MWK8YYZXyz7M2H3Y4TnSOrpTl4MdaTK/XSrK2KxNoFkqdGBLuFQOs
 BTsACS54z+g6ehCoH3T+/AJepKCKsXYeT67UOspTQsoYnZBSJ75HKwy/YG1FCtUF4Y5Q
 TgVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzSbdrwI9Pr3Ihc/2vtyCbUzRI/nB+fi3R4Z0SMmVyEtRs/yYDchFyASRtLXXJZBynmzREHF/BMSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRaR4jUs8shHUZbz6QYhXxEhnrZjlzNFsFUYILzaUJs2UaJSy1
 d+iui99EdN4tbtKoQZf8GK57GoDezPX/+93bQnFd84xsCPy/KSr4R2t2FlEnL7q9WywbILJNYoq
 YqP/bCYxp4odna1EX6yrF4ZZlEp6WmI+RHFdSAEuHJBly4+YYGCYXFBrGdbmZLttGoevWGHM=
X-Gm-Gg: ASbGncvLtR7mLmqktNUEGBfULRV8ezSMD8r1TPhOpFISWjHe6DvR2smFU5XSCAeJm4r
 CVxBWEr/WkRyjD9E8OQwSQAPf8NRjkCzftlY03feMicg3yBPCUoiU5Z+VnQa9mJ4Yz8jDV+JfaS
 1r1nNrbicDkSGcOwXUuQZygu5Gm+OCWwFrSVTHe199hl5y5We8G3S7VAnDUbvuqsv5MUoBSw43r
 I1IOzeXocpIJ3XxqdowPSSmyCaWu11mS/Bp7VbR7vQdOOj/nls/gvT/3Zta3M9OyAaMhJCC02qX
 qyF7b2ciM9AzxgB7RGXY8FJ9OODwvntS43+NSTr9m0ktVOemyYMLEpnURLpa0OlB1KXYPWREbtM
 =
X-Received: by 2002:a05:622a:1c0b:b0:4a4:419f:41c9 with SMTP id
 d75a77b69052e-4a5b9a04ec5mr202151031cf.6.1749472606232; 
 Mon, 09 Jun 2025 05:36:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa0EFlbX+swt3Whvvh9SQRpJeiWLNgC8eXzt9kFgch/alpSb6W0nfeVusMYnFuNc73rkUjKQ==
X-Received: by 2002:a05:622a:1c0b:b0:4a4:419f:41c9 with SMTP id
 d75a77b69052e-4a5b9a04ec5mr202150491cf.6.1749472605759; 
 Mon, 09 Jun 2025 05:36:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d7651sm1126332e87.72.2025.06.09.05.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 05:36:44 -0700 (PDT)
Date: Mon, 9 Jun 2025 15:36:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 00/38] drm/msm/dp: Add MST support for MSM chipsets
Message-ID: <chbsxsy3vltr4752uutnu77a6mt5jbsjixfsgb7dqqdcgypkhq@vuldhcnkksy6>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6846d560 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=krH1jXqBnkHquvztPCAA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NCBTYWx0ZWRfX6ny4iE1Tb5be
 BmDZNUCHvWb+ubuRjtHLcVwiYc0QZJS70zNnEs+J/+fREBqzzBY2ha5vUECTuqBnYyTlTw8ytQQ
 aUU8cdAaOc4m1P6buhLBZzSxe9nr1VE+JF7V0rpUqdZCS/xhJz3sPE0J/EILVGgEUGoztgLajj+
 7ETIp1zGNcyKnxYZGQp2lR2OHyPm6qPR9YZiJXxH+ta/gy8n/K4l1sHxzK4orh881ZTPh3h/3U7
 LqBStSUqeO9K4hBXvKbi9jbKJ5il6gmTxi1I7Dd0WR/BU0bvdRhisvg6ulaZVklyWU1KZ/7QBF/
 Nr2GfRbqGQUyuiItQrwxXfWKYL4xG+XIbUZ5NI0Mx5sSAu2JOEI0B7JAsDzFS2FaLP/7qX1u/B9
 SvfNmOu+n1AjhRB96ST5DVsXZV/RxNqH15G++rq903y3/Ra2/M9vg/HKMpjtarLFivxnF3pw
X-Proofpoint-GUID: RF_B2xXTEIHXm_VHH0JXF0-g92nWzhHM
X-Proofpoint-ORIG-GUID: RF_B2xXTEIHXm_VHH0JXF0-g92nWzhHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090094
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

On Mon, Jun 09, 2025 at 08:21:19PM +0800, Yongxing Mou wrote:
> Add support for Multi-stream transport for MSM chipsets that allow
> a single instance of DP controller to send multiple streams. 
> 
> This series has been validated on sa8775p ride platform using multiple
> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.

Which means that you didn't validate the MST interaction with the USB-C
stack (there is a significant difference in the way HPD event is handled
in the Linux kernel).

> With 4x4K monitors, due to lack of layer mixers that combination will not
> work but this can be supported as well after some rework on the DPU side.
> 
> In addition, SST was re-validated with all these changes to ensure there
> were no regressions.
> 
> This patch series was made on top of:
> 
> [1] : https://patchwork.freedesktop.org/seriedds/142010/ (v2 to fix up HPD)

This series has serious concerns and most likely will not be merged. Not
to mention that the URL is invalid.

> 
> Bindings for the pixel clock for additional stream is available at :
> 
> [2] : https://patchwork.freedesktop.org/series/142016/

This series needs another revision.

Not to mention that I plan to land [3] this cycle

[3] http://lore.kernel.org/dri-devel/20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com


> Overall, the patch series has been organized in the following way:
> 
> 1) First set are a couple of fixes made while debugging MST but applicable
> to SST as well so go ahead of everything else
> 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> of the work as current DP driver design had to be adjusted to make this happen.
> 3) Finally, new files to handle MST related operations
> 
> Validation was done on the latest linux-next on top of above changes and
> both FB console and weston compositors were validated with these changes.

Validation should be using IGT for testing. Please ensure that there are
no regressions.

> 
> To: Rob Clark <robin.clark@oss.qualcomm.com>
> To: Dmitry Baryshkov <lumag@kernel.org>
> To: Abhinav Kumar <abhinav.kumar@linux.dev>
> To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> Changes in v2: Fixed review comments from Dmitry
> - Rebase on top of next-20250606
> - Add all 4 streams pixel clks support and MST2/MST3 Link clk support
> - Address the formatting issues mentioned in the review comments
> - Drop the cache of msm_dp_panel->drm_edid cached
> - Remove the one-line wrapper funtion and redundant conditional check
> - Fixed the commit messgae descriptions of some patches
> - Reordered the patches and renamed some functions and variables
> - Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-0-f
> 8618d42a99a@quicinc.com/
> 
> ---
> Abhinav Kumar (35):
>       drm/msm/dp: split msm_dp_panel_read_sink_caps() into two parts and drop panel drm_edid
>       drm/msm/dp: remove dp_display's dp_mode and use dp_panel's instead
>       drm/msm/dp: break up dp_display_enable into two parts
>       drm/msm/dp: re-arrange dp_display_disable() into functional parts
>       drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
>       drm/msm/dp: move the pixel clock control to its own API
>       drm/msm/dp: split dp_ctrl_off() into stream and link parts
>       drm/msm/dp: make bridge helpers use dp_display to allow re-use
>       drm/msm/dp: separate dp_display_prepare() into its own API
>       drm/msm/dp: introduce the max_streams for dp controller
>       drm/msm/dp: introduce stream_id for each DP panel
>       drm/msm/dp: add support for programming p1/p2/p3 register block
>       drm/msm/dp: use stream_id to change offsets in dp_catalog
>       drm/msm/dp: add support to send ACT packets for MST
>       drm/msm/dp: add support to program mst support in mainlink
>       drm/msm/dp: no need to update tu calculation for mst
>       drm/msm/dp: add support for mst channel slot allocation
>       drm/msm/dp: add support to send vcpf packets in dp controller
>       drm/msm/dp: always program MST_FIFO_CONSTANT_FILL for MST
>       drm/msm/dp: abstract out the dp_display stream helpers to accept a panel
>       drm/msm/dp: move link related operations to dp_display_unprepare()
>       drm/msm/dp: replace power_on with active_stream_cnt for dp_display
>       drm/msm/dp: make the SST bridge disconnected when mst is active
>       drm/msm/dp: add an API to initialize MST on sink side
>       drm/msm/dp: skip reading the EDID for MST cases
>       drm/msm/dp: add dp_display_get_panel() to initialize DP panel
>       drm/msm/dp: add dp_mst_drm to manage DP MST bridge operations
>       drm/msm/dp: add connector abstraction for DP MST
>       drm/msm/dp: add HPD callback for dp MST
>       drm/msm: add support for non-blocking commits
>       drm/msm: initialize DRM MST encoders for DP controllers
>       drm/msm/dp: initialize dp_mst module for each DP MST controller
>       drm/msm/dpu: use msm_dp_get_mst_intf_id() to get the intf id
>       drm/msm/dp: mark ST_DISCONNECTED only if all streams are disabled
>       drm/msm/dp: fix the intf_type of MST interfaces
> 
> Yongxing Mou (3):
>       drm/msm/dp: Add catalog support for 3rd/4th stream MST
>       drm/msm/dp: propagate MST state changes to dp mst module
>       drm/msm/dp: Add MST stream support for SA8775P DP controller 0 and 1
> 
>  drivers/gpu/drm/msm/Makefile                       |    3 +-
>  .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |    8 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   21 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |    2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   72 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    2 +-
>  drivers/gpu/drm/msm/dp/dp_audio.c                  |    2 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.c                |  558 ++++++++--
>  drivers/gpu/drm/msm/dp/dp_catalog.h                |   64 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  474 ++++++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   22 +-
>  drivers/gpu/drm/msm/dp/dp_display.c                |  510 +++++++---
>  drivers/gpu/drm/msm/dp/dp_display.h                |   33 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |   53 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |   12 -
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c                | 1065 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h                |  106 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |   66 +-
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |   10 +-
>  drivers/gpu/drm/msm/dp/dp_reg.h                    |   46 +-
>  drivers/gpu/drm/msm/msm_atomic.c                   |    3 +
>  drivers/gpu/drm/msm/msm_drv.h                      |   19 +
>  drivers/gpu/drm/msm/msm_kms.c                      |    2 +
>  23 files changed, 2725 insertions(+), 428 deletions(-)
> ---
> base-commit: 475c850a7fdd0915b856173186d5922899d65686
> change-id: 20250609-msm-dp-mst-cddc2f61daee
> prerequisite-message-id: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
> prerequisite-patch-id: a1f426b99b4a99d63daa9902cde9ee38ae1128d1
> prerequisite-patch-id: ae9e0a0db8edd05da06f9673e9de56761654ed3c
> prerequisite-patch-id: 7cb84491c6c3cf73480343218c543d090f8cb5e2
> prerequisite-patch-id: f32638e79dd498db2075735392e85729b1b691fc
> prerequisite-message-id: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
> prerequisite-patch-id: e505c21f653c8e18ce83cad1fc787c13a6c8ed12
> prerequisite-patch-id: cfdd5c37d38b2a4f1386af4021ba3920c6d8dcf8
> prerequisite-patch-id: f4abdddcb90c8203044395f4768d794214fe3225
> prerequisite-patch-id: 45013dfaf34856422b7b6b3d2ee42d81a917177b
> prerequisite-patch-id: 2f35bedb0410bead1b66cbfaf51984fc7016828f
> 
> Best regards,
> -- 
> Yongxing Mou <quic_yongmou@quicinc.com>
> 

-- 
With best wishes
Dmitry
