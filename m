Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B4BB12A83
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 14:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0374F10E277;
	Sat, 26 Jul 2025 12:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6oPrW94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB94110E277
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:39:56 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q90Qef008352
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OWv91NLXRDuT4X2MxDjuA0UN
 OQUYmBmQUsyW7/9v0ew=; b=h6oPrW94lXVY5UtPsSY4O9gA7EuzTP8O1Jp8zgLH
 aDMQQVtQkfZUx5saJ1cvjyr+4o+4oeeFtjzqLU25VD9cZHndDKJPq8CTPVsgj5x7
 Vx93hP+4kiH7Zoo2pWZSCSyv0R8TVg0AwAoqdlBxi8Fsv65aUfKZ4BrKHBbDIUrJ
 DESRdCGZ9shRLd6JaErt+q0fOXHTu7ANPhM4mj2JlSqqiKoTH+ef0rHugI7Q3Eis
 EwFS/2ayoHRYFlhTCGhVUH/jQSt9wiXzW4jwNwXv1CK9jHFIeVr2u1k3gev+dxTg
 d7bMl+LRER64VWr2oz5N46L7W4A5VIDs10eSGB20uN0aAw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytrpw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:39:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70707168c59so25395056d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 05:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753533594; x=1754138394;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWv91NLXRDuT4X2MxDjuA0UNOQUYmBmQUsyW7/9v0ew=;
 b=SvGfij1sZ0a0BwirFpzCuFa+oBLEvAwtLiyMJ3d8TqzaFOQvB7y2pB9I4VeiUU+uhk
 jcfAsrdHwKhNV8jWvV76lfh21fvDrymLb2V89RyIzP2mCbhTqqQzboNqFRtqqU1+u4Nr
 3OeuUJ+qZOCnzccLzCoRfGk1jdMAII7r/IeeNjWykF3my9Gp9CqEHQg/bX5KxWslM57R
 5zQnoqKnCObsf/7pNGPG21t3lVT3Wk9uoQpEAf1d0vewquc1idun76yyYkwXfxoSvCXT
 lvxeszXwb5Wwa/75dHdDqFaJqXBqfihGARFfghMlRaFaQDX4PtUZQomwZcfS2g89ArK8
 PeGQ==
X-Gm-Message-State: AOJu0Yx4Xy3HDdACTjDZpEq2LXm9kMR3FC8dY76vm8ZZHUND3Rv0xyl8
 6vKMjm0CWkhu0Da1SSzsDYILfIQbZepupyTHvUJcAhlfDp7tdPCz6dsmEm/UH4PdBZjjQKxdyG4
 pDJYL1V3owQ1TD+ylf8vCEpFVEgYidvPEy9u+7VCaC30WgPMHv5m4IsPTW/gdTsPgkprIPzs=
X-Gm-Gg: ASbGncvlY13GMACuG+3B2yAOUSOfAVsDbVWehqEDx0Rm7j3KQyZliYVwnLOkL3cgEJR
 Haa1kyUeyKR5dqgOINitivcue4uHExttaCELIh+dWppyI1RRKs/J4c6ze1MMIqOO1WOs6LTjcM4
 ITBdu10aIjXqVNocz1x+Alib4Qjdgw72uvmk2zD51JmHTXUrRLMbq6QkndAe+SGTQvcZT9eqhmk
 5nRtg1LXJrl+/LrdBFQXMhv15GsObPFbSDAwY7oJx4+n8xv1lNHv1voeLLRbfsxtNBs6ImXP0w0
 BLpn/Ev4gzYrTCsuOZhFTU47VgkcdgMMfEa+8dRbW9DubKEqGnwdlQxAYSaAm9GYgIHxr1SUH68
 y9i/TG/y47WU/AdAFcaEdX0stflZUFFQZu3HTdMuURR5fLo4ZBttG
X-Received: by 2002:a05:6214:c4f:b0:705:12b4:154 with SMTP id
 6a1803df08f44-707205b2dbamr58956376d6.33.1753533594476; 
 Sat, 26 Jul 2025 05:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQiX8ECR16J6mHdmsGPse8S+RlovYhgXsDP3Lhn1m1Kl+FztM+cvVbVhC24nQNG9WzzdSr2Q==
X-Received: by 2002:a05:6214:c4f:b0:705:12b4:154 with SMTP id
 6a1803df08f44-707205b2dbamr58956126d6.33.1753533593977; 
 Sat, 26 Jul 2025 05:39:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b631a1b0fsm425273e87.73.2025.07.26.05.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 05:39:53 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:39:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com,
 Harry Wetland <harry.wentland@amd.com>
Subject: Re: [PATCH 00/28] Enable Pipe writeback
Message-ID: <moagnjfwotoyisjfymvftkm3ndlifgxgjg2b6e74nm3pbityow@us2zmsccovwh>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
X-Proofpoint-GUID: kDD2fe5kiUrW2KwZ5Kecr4fBQvuz75x4
X-Proofpoint-ORIG-GUID: kDD2fe5kiUrW2KwZ5Kecr4fBQvuz75x4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNyBTYWx0ZWRfX+P41OGJ94Qmx
 pXNiOLJRwOVJ/AT6tDDhTh59ekUX8RpzlM32CXI+/1K+Sv1qCKj3Exmqzw78tte674SscXx8aVz
 pdv3eTEhNJ47peLnMuASkTMTwaVrJXvCE2cGhJoy1I6MAGTzVZ3CDjfk/zN32ooGw/TWNW6opIJ
 4T3tpT+ZgkY+wzaR4070+ZeT/sRtrA06JpA/TY+tkDtwH//pMkSx5mWQF/wAkTghk/sXkdxi/PK
 AFkgDGY0c+bnBD8O/wsON31GHwV5az8vxojB9+mfp4SoUG4GTXy2X6Q5Qb8nJRdX77/wr5H4taM
 RdooBo2paaa4ov56WOn/IL4OXETdGFSUQp7jao2xw6kzI8YUD74yrcY6PlnybJTVcsGvUy72wUS
 7sXxbv6J0GxgK/RGjAzVx2+XC+yF6FWESKooFsIMBigjSnMCxo09wbGGoI9scjdw07Z6Z7AT
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6884cc9c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=zd2uoN0lAAAA:8 a=QyXUC8HyAAAA:8 a=2U7y_S2j5q8vnCcmH9MA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260107
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

On Fri, Jul 25, 2025 at 10:33:41AM +0530, Suraj Kandpal wrote:
> This series aims to enable pipe writeback functionality on
> ADLP where it has been tested. The plan is to slowly accomodate
> all supported hardware after this functionality is tested on them.
> This series also brings change to drm core but not in a drastic way.
> We introduce a helper which lets drivers have their own preallocated
> conenctor keeping the connector in drm_writeback_conenctor blank.
> This lets driver have more control over their connector but still use
> the drm core queues for job creation and signalling. Some new helpers
> have been added to aid drivers so that derivation of drm_connector
> from drm_writeback_connector and vice versa becomes easy for drivers
> that will use this helper since it won't be as straight forward as
> wb_conn->connector anymore. Driver not using these API will not be
> affected in anyways.
> This series enables the triggered captured mode where we need to
> trigger a capture.
> 
> Cc: Harry Wetland <harry.wentland@amd.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> 
> Suraj Kandpal (28):
>   drm/writeback: Add function that takes preallocated connector
>   drm/writeback: Add a helper function to get writeback connector
>   drm/writeback: Define function to get drm_connector from writeback
>   drm/i915/writeback: Add writeback registers
>   drm/i915/writeback: Add some preliminary writeback definitions
>   drm/i915/writeback: Init writeback connector
>   drm/i915/writeback: Add function for get_writeback_connector
>   drm/i915/writeback: Define the get_connector_from_writeback hook
>   drm/i915/writeback: Add function to get modes
>   drm/i915/writeback: Add hook to check modes
>   drm/i915/writeback: Define encoder->get_hw_state
>   drm/i915/writeback: Fill encoder->get_config
>   drm/i915/writeback: Add private structure for writeback job
>   drm/i915/writeback: Define function for prepare and cleanup hooks
>   drm/i915/writeback: Define compute_config for writeback
>   drm/i915/writeback: Define function for connector function detect
>   drm/i915/writeback: Define function to destroy writeback connector
>   drm/i915/writeback: Add connector atomic check

You are adding hooks one by one. Are you sure that the series is
bisectable? In other words, the driver must work (aka must not crash)
after each commit.

>   drm/i915/writeback: Add the enable sequence from writeback
>   drm/i915/writeback: Add writeback to xe Makefile
>   drm/i915/writeback: Define writeback frame capture function
>   drm/i915/writeback: Configure WD_STRIDE reg
>   drm/i915/writeback: Configure WD_SURF register
>   drm/i915/writeback: Enable writeback interrupts
>   drm/i915/writeback: Initialize writeback encoder.
>   drm/i915/writeback: Define the disable sequence for writeback
>   drm/i915/writeback: Make exception for writeback connector
>   drm/i915/writeback: Modify state verify function
> 
>  drivers/gpu/drm/drm_writeback.c               | 123 +++-
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_acpi.c     |   1 +
>  .../drm/i915/display/intel_crtc_state_dump.c  |   2 +-
>  drivers/gpu/drm/i915/display/intel_display.c  | 178 +++--
>  drivers/gpu/drm/i915/display/intel_display.h  |   4 +
>  .../drm/i915/display/intel_display_debugfs.c  |   3 +
>  .../drm/i915/display/intel_display_device.c   |  29 +-
>  .../drm/i915/display/intel_display_device.h   |   2 +-
>  .../gpu/drm/i915/display/intel_display_irq.c  |  10 +
>  .../drm/i915/display/intel_display_limits.h   |   2 +
>  .../drm/i915/display/intel_display_power.c    |   4 +
>  .../drm/i915/display/intel_display_power.h    |   2 +
>  .../gpu/drm/i915/display/intel_display_regs.h |   1 +
>  .../drm/i915/display/intel_display_types.h    |   1 +
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   3 +
>  drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
>  drivers/gpu/drm/i915/display/intel_pmdemand.c |   3 +
>  drivers/gpu/drm/i915/display/intel_vdsc.c     |   4 +
>  .../gpu/drm/i915/display/intel_writeback.c    | 686 ++++++++++++++++++
>  .../gpu/drm/i915/display/intel_writeback.h    |  23 +
>  .../drm/i915/display/intel_writeback_reg.h    | 142 ++++
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  include/drm/drm_modeset_helper_vtables.h      |  59 ++
>  include/drm/drm_writeback.h                   |  21 +-
>  25 files changed, 1238 insertions(+), 69 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_writeback.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_writeback.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_writeback_reg.h
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
