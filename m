Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F6B12A57
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 14:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849B110E13D;
	Sat, 26 Jul 2025 12:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6+UkxTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709E110E13D
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:03:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QBREI2021685
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1D6BmR83TK96SbIkz00tF236
 OzVTpRaO1A1uvpbe2kU=; b=o6+UkxTW9yXrNwNRUGXnacOqvHp4+4zOl/lOH+rD
 eIiLIB3ZeSD0ltmuqE029Glavkd3ATJLxAJxi/1fEBNsUvQl2H206QImn/vkyEUG
 CZ7wDU/bRB0ERd2Ko+g21RL7Nb/SODcCrErqZUl3/0ulLg4dZQyvn0zagOhI3Ccy
 Bgq/FImLNqQm3rEbe/9Xq5GSrDwK0biq5ZpImS92MFZPyc1fWAs8jF/vmb/Z7qd8
 37Ah6SKo8QYGFlQ0YMn2sdVW9EIvHl2BhmWnN6iseHjFwE5bZaqeo7K4suU9+F1Y
 E1iEb5F5idMvFr6HIybVTcBWUV+hYJFc6I4iffu+GU39Ug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkrm7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:03:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7073834cd71so2605896d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 05:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753531424; x=1754136224;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1D6BmR83TK96SbIkz00tF236OzVTpRaO1A1uvpbe2kU=;
 b=XXUOcqT8SFkqDpZX9c/hOMRU1HsxmBNORHWkTtLGUOsCjjpGUtDlfugg50R5vyUn6+
 iLv43gtECHcUUQPagijvsc7wqUBuVK5vxJ+9drVkIaQwP6sVVANJjtNIoJqxgMxIeNoX
 dMfemu/WcAYmbRLTVaf37w0o/wDnOzCvmOCbdsGzQEhclK2zA3XYLt60rDZ+CdoSMiDa
 fyy3JSHepWwGaD2Fj/B7a/BjhchP+Y4TIdU5it/xDsdpgKcO1sMm4TDJfwznHNFki9Uc
 493OspPUvSNU2SCwaDUJmwMnkc2XohGUue+u8z4XiEY+uJ98VQXh7upYcHA66ubYS85w
 AyFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP9mzXo4Q5YrqPiwrIFmTUVeDhy09BpJAkBBOMDnjAWmH758lq6jAzr2QWIi423MqNHfDxEpiTOcA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd3yV2EDoclrpVAWCxx7c9pfBL8JLdxE9l+iLxFHEDLzpRxaKJ
 mrQ292r2A3wZlyH3UAnAtEDQ+QwRCIxDYYgKHGEsqsCYCxxOzO68crTwFT4DT3nm0dWZXn/QFog
 1k14m/YDvCEyVmeYxefeN8LfjoWV8GCmvPJ0TmKoI4p1QWMWLo4yXjAEWo+g6++XpN/hFPeg=
X-Gm-Gg: ASbGncu2SL0Ge1uFD5lraL8LPfJp4mmmV/s6rG5yx89PWKhRIQ9PksJH3XRdfMorHKy
 RO80pqL1ejjxfQNWGjb6h6SELu7xl2IIKM9xWZErGQyqy6x5vYA21nz20R1sqCYEvA3Cq+RsbLx
 Q/JvpPHkEG9VC5BC7X88yZWWGmlip6Bw8vhh0dSvUM933qEG2Ya990nC9QUCOQFk2SDa4tiziSB
 opZ2Ez3JOaULTQtIwWkirRViATvAiZXSLmpQdaq/xGyHOmL79S8kQY3+62MuqKt39qvycyX+d/l
 trV/yY4HUho2HtrqbTue9VuQffoL4kM0jzxai0PUmhlQF/OOkMGFh6mPTPuNwM0NaqM5QpikzVn
 ijarzvJEuxm3Nlf3EKMZz5jqlK4niGaJLZWIIL+p2c8+gbhMstUoT
X-Received: by 2002:a05:6214:4e06:b0:707:2230:b6af with SMTP id
 6a1803df08f44-7072230be23mr48058396d6.44.1753531423107; 
 Sat, 26 Jul 2025 05:03:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXvFtpJkzYIeiG9nyGHhRK7mR3gLP3VEEBXF+lBE97EG8zozjWb6VOoTWSf2I5TC70nhrV3g==
X-Received: by 2002:a05:6214:4e06:b0:707:2230:b6af with SMTP id
 6a1803df08f44-7072230be23mr48057536d6.44.1753531422345; 
 Sat, 26 Jul 2025 05:03:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f40b339bsm4061511fa.23.2025.07.26.05.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 05:03:41 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:03:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 09/14] drm/bridge: analogix_dp: Add support to find
 panel or bridge
Message-ID: <kulhumudepz3lqm6c36wbqtc4gv35pyqki7el63bovnvxcsjkk@nbxijrujm2vz>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-10-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-10-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6884c420 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=cGmNtDV8R6BPqPJYracA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNCBTYWx0ZWRfXznK5Fe8LT2HC
 UODoriG+EPd3cfeTacHIEq8r2hCefTU44AoNVLJQR+l5atDPVDCD+AnlvEbpb2s5KlRK9SE9P5S
 KPlpvSE1OdrQSRO9TGC7psOfGTQwMSc4m/m+C7+/zL/GKkUgGwSebFkzpmOIqsDY3mWjQvOi4Xa
 44ZrGASWJH703fMxzeZiZGp1Pw0FALDPoAnq8fLYGpuZS8XdeBipjQb7tzHGWBdG/7OM/CQzGlX
 eGVhhsAmcBqHNSD3+NiDxxafcEZnj9MBkNY2ZX09M+J7bAK7lcqxsDTR99R0Cw3bG3pD9X9dSGB
 drgJfeNFWrPFpxpOsta0j82AlweFeKgqmNAj0+T8kVyWu5c8nUNCxcBE3UMQdLMNEDS/jxIRfB0
 08qN40Rr7x/laGtu99dSyvRuC+CpfenFPkB8gBlfOcYrAcn1q9lNpWUT+Wwbj9aZ8sK2m1JX
X-Proofpoint-ORIG-GUID: Xmcvx-1hLikRU2zAe3lBgTnJFd1xjw1b
X-Proofpoint-GUID: Xmcvx-1hLikRU2zAe3lBgTnJFd1xjw1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260104
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

On Thu, Jul 24, 2025 at 04:02:59PM +0800, Damon Ding wrote:
> Since the panel/bridge should logically be positioned behind the
> Analogix bridge in the display pipeline, it makes sense to handle
> the panel/bridge parsing on the Analogix side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 48 +++++++++++++++++++
>  include/drm/bridge/analogix_dp.h              |  2 +
>  2 files changed, 50 insertions(+)
> 
> +int analogix_dp_find_panel_or_bridge(struct analogix_dp_device *dp)

Nit: the API does more than just finding the panel or bridge. Also the
drivers use it in a more of 'analogix_dp_finish_probe()' manner.

> 

-- 
With best wishes
Dmitry
