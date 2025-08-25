Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BABB347C2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 18:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB6A10E506;
	Mon, 25 Aug 2025 16:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="akle5lkg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DC210E503
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 16:41:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8VgU3031144
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 16:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SUGCf9gEHaW+/RTV5UaZ+1IU
 xig0tsOVObr1R4RU2Ng=; b=akle5lkgTZUlRBiVnK9XxhwYCRubrlWxOlrEJ/mX
 OQ7/6CcPvMNaMI8YTkJ1CqXLfPgt3IPndshefkiw9uwn0ziYaYT+SldvtDd1cOUA
 9pacxNvbwstkKzSOynEBlLVXVCUH3U+XPhWYY3IKpWd7Isib7f/ns20AXDMlGjt4
 hyS2+6Eb5Xjm+9NwLXWTPxEObQO6nmyoyRiCQKjJhFhiNvkpwLAlYlCe/vDDi8Wx
 xzB3EJuUMRo1TvUah+6iIetAHIn5CqcwTlli/mdFlJaRrOG5hFhc+ddZZ4jxdfcA
 srQsgiZ35HgnYat8bQL6GUuR+yR2QOS4JNdbgbLRKnDY7A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfdt7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 16:41:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b2955f64b1so128169151cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 09:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756140072; x=1756744872;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUGCf9gEHaW+/RTV5UaZ+1IUxig0tsOVObr1R4RU2Ng=;
 b=CE2iEnZOCcG1i6YJgbWFNAELrYERQublQHYGN5rrb1mqA4VNswTn8G2ncgC/OFJz9H
 +JDOnuIajOoYRChRPipetyoHUX4lv7j3Yyzr874DujInvaTqUUqO7N8HRlWwPhTUAg6V
 XL7jNmHUe9eVT9dmi8RP6ZUiB9BRf5KGrXCZf1SUppjFpYm/7fNwsZNSl6L2erRfCsjM
 H5KOwrvPq0A4YN0ZfB3Yb43+RCtz2GF9OxCdo9R85mGTip4vA2pqAlyaigGWf9+RXkz+
 tO3zyC2rwNl6xjmmrdDXzx0AbD1g2eCpLm6/TXaxfBy3yQTS19hgoOolbCjElg1mxHDF
 pD0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmGAX+YDH6BKT5nJC177ZYOLfdbaO6x6YgSTiH5J0usoARW5wTt5lB8lc7fQF0k+UBYH1EYJD3uGs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd7XemUXXerrlOQZSdetXV/4heZLHKwXN9anadts+8Q9BMt7uw
 TVupLwIYcn9I0Fxu/6EpDwXdvmChFCOSrQW+IyZvlRNS/Qf0nTKdADoFS2RcY8tUNiMGsErKokm
 BXQkqxE9+N/Zl+HkKY4NwFL4ocZrxttZT05erxk0Eu7O5ZaKBWiHFEJUMuqv+Gv4jWh6LFh0=
X-Gm-Gg: ASbGncthym60FX8+OIX6Ht/QEVzLqirrLnsyfD6FAI/hXbgO/PZHYU/xmxrkDlYoktv
 H0zHp4FIjD6qP0x9v45uFImIag8idmVd8oxEko/rP6ds1sTDXVXrW08qziQgdnt7ExrVE0TvScU
 AWEVnBf0Ew4TPhC6xUQoRixhPbZyZC+n6Le7HoUGBZEgayfFoECHPPiAsR2tEB3qMepLgPwI/tG
 ZOlb99yDRQB3PBL/YvNZ2Dj4ZzjcZ7TZTTKNuREQv7Uf1lTPeYvg+r6QVOqobFDJsKFpsq2sbTq
 G/L+A72ZC9A/QesGCdDgvWFHH62zil2+nxip+8mbP6CiAGm8gTvKAKG3KjF/Opdx1nDHp4kFmwZ
 HGytfDR4V3iQGtWTehStQihCO+o02UkpdJUygNavmC96k8eoZSoEV
X-Received: by 2002:ac8:5905:0:b0:4b2:8ac4:ef56 with SMTP id
 d75a77b69052e-4b2aab43ab8mr130527801cf.77.1756140071849; 
 Mon, 25 Aug 2025 09:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoqs6K3ZpqTkzcj7pYumPFvNMUPXYlClvXN3ij8BDNr9VUaeeMGuXTmsI96ga3TCHPX3H3WA==
X-Received: by 2002:ac8:5905:0:b0:4b2:8ac4:ef56 with SMTP id
 d75a77b69052e-4b2aab43ab8mr130527481cf.77.1756140071290; 
 Mon, 25 Aug 2025 09:41:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c0221dsm1672404e87.7.2025.08.25.09.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 09:41:10 -0700 (PDT)
Date: Mon, 25 Aug 2025 19:41:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
Message-ID: <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX3c0D4s8cQHHh
 BIdIhujQjuyZic1j8FGO2IRv2bO9NfHm8iK+/AoWX1TroeksreKhU1vAAuzit1wSGsJwiNkGI4O
 Cw0HUsbX++9X7jzumqAdKKkWZuRHZplt1XHVaC3egEgAbM9vw8C+Su7mBacJJ9JZbB4NawyJQNf
 slLpF4L97NY38zct6vJL68bCFn1Ir55b72i4xDl6AabkOTY8/6iFsfNe9Gkw6fxMvA5N8D5jrGy
 Vej9XooVOZcgd4Y3L9puT3ntinM+ePoN8u0ozL9PZaFVqxsmTuVl9mJubsoGdzQfljUDdjBt9e3
 35Am1cEWKnpEV8K1cRmJlTCErwNeFDV183pRBezktLOaEGpbuNmAyCk676KCPPe+2R1h3nYZvWM
 vE5xNspG
X-Proofpoint-GUID: m1omQ3VlN7RmqD6CE31GuzxQ8re1CxvB
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac9228 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Xi5Nwd9LVAJm5hmD8FAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: m1omQ3VlN7RmqD6CE31GuzxQ8re1CxvB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
> The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
> state management complexity. This change removes the drm_edid member from

Please see Documentation/process/submitting-patches.rst on how to write
commit messages. Please use imperative language instead of describing
the changes.

THe patch LGTM.

> the panel structure and refactors related functions to use locally read
> EDID data instead.
> 
> - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
> - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
> - Removes msm_dp_panel_get_modes() and drm_edid caching logic
> - Cleans up unused drm_edid_free() calls
> 
> This simplifies EDID handling and avoids stale data issues.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
>  3 files changed, 26 insertions(+), 58 deletions(-)
> 

-- 
With best wishes
Dmitry
