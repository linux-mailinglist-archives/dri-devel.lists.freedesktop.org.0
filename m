Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA1BB9D55E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 05:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEBA10E117;
	Thu, 25 Sep 2025 03:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="guejtsj6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1FC10E117
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:51:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONbr2X023762
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7ozkG9Dgj29nLARaESWRLWoU
 qOVS3oTUDeo1vaR3PAA=; b=guejtsj6wGnbvnj+Jqxc5Jo69+SwHohBs7LVywMM
 fhKOYgETMJZ3G2VzCAUqdVx5tTrSL8LWSjLPgo2xt/BocgI1aUc7fYx8+OnrYobe
 J51QbCvBg2lRL1cMcFjBefvDpXTaTQiccjK8jA7QenBKQ0hjWBdKQIO9oFxaw/ao
 kBGwRsrSxRLzhi5rlMwHLrVmeZ4dajF5qhIb5MVXE4N/5pqE44Kd5cr5G+43Ic5C
 4izFxR5mTKZR510qpVgptH50YHoJGKwoCZVYZTyp4tAY+/NaRKaTWbv2YLC62ju8
 hXSTe3R55uwOfsMS5B2gBKcPZbySpMtueNxXfgs4zPROHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0dp5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 03:51:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d77ae03937so14754061cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 20:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758772276; x=1759377076;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ozkG9Dgj29nLARaESWRLWoUqOVS3oTUDeo1vaR3PAA=;
 b=Hhok1fmQKUYfbkyO1yJClIfHdiLm5cB5IoMoNIJopcGk21fGzU+3TNQ1jJvsVcxW6X
 7x7dzbyXg8GY41LBOase4BGVqy/f1RriyaV1YIBb8Oc2ledcstRZLRe/vBiM3XWV9j3X
 xHDodlPnuyCWEdV0I83G0VvJsIkQ66tIMmoUrhMSwXqJg1uzWfhlMTeuisHG2KTFyqfO
 CvZKgTq17hWOO9/uVli59ADU6Kori8Vn95DZyETYPt+ctJ/cJ8xY5rTM9zfEq7SGJE9G
 MzPE6B/7uOuQ/plBFKpsArNkeyzWoBJK6hF8OGfZlEO9fH7RZ8i+DryEVrmq8Qr9HHoY
 ZLgQ==
X-Gm-Message-State: AOJu0Yw3+Bp+hFNcfk4Rixp7eVRS8n5dX5sE6TmnErhh6tgJsuQ2mpoF
 VYh+h/C/KpBP52IsYgZvrtoaItB+W3athw4IKMICaDjVU9wPg9eXWpYkx0o4R/oPBacM/HGTDCg
 rNo2qX/GJpqiuNdHI2l2Ejv2Nk6k7hGXOyhFpTAUVQEHNLbvq4ZpzG7h/KP4C7JKb3u775UQ=
X-Gm-Gg: ASbGncuqiDrsy1JhWWd8qzDOJzBeYYlkHkKXsJaGawtsE88tZB1W+sKUGVeinMMjj4R
 SXbSavPWYeMX+DGF52gn7fXN/0x52FCxJuRnzSFLyQMrJDRyXuLsjM4XI/v8N8UEJEez9bcMxej
 cbHA3dbHjIyXZFuh1QZEEstOpW+HeeGX35ovZQsUmo3l5k1nVNpbDc4Wtc3f1p9nPwHRi1m9flj
 8kn6Ob9Cd/UtWlhlTfPUlY/Ytlkaqmn12L81ffzsWNv8nc8foNSJgwQKCFOSb0PF95e439DovP+
 TXNNkjtivGrQbWJctGuaK/sYRbm1rREhHkPKEBVqEAmJGzEGnuQS062FdiAHAGKrrS8Sp9A6Xvq
 ma0OMdSCzUHisJqtRYE9erXKlJKoDX9Vr9ZC3ZcRi/wpPyML/APVp
X-Received: by 2002:a05:622a:5e86:b0:4ab:7f61:4339 with SMTP id
 d75a77b69052e-4da48d793bbmr27150301cf.31.1758772275926; 
 Wed, 24 Sep 2025 20:51:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq+gQ2uTMJaYoRjDF3ljF2rKR46SiHC9kfYf2V0HCxEWnaja8OPm5oiSPEIP93udw+G3Cuig==
X-Received: by 2002:a05:622a:5e86:b0:4ab:7f61:4339 with SMTP id
 d75a77b69052e-4da48d793bbmr27150081cf.31.1758772275403; 
 Wed, 24 Sep 2025 20:51:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583134312ffsm310355e87.13.2025.09.24.20.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 20:51:13 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:51:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Message-ID: <y6idr5f7cqtkls3oqnzaoc5u5zvrqns3xdl2ijyxegxvqgph7r@6hkc5zc6urql>
References: <20250922121902.88664-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3ef2b90a-ff78-413f-b853-99ebea0afc4a@emailsignatures365.codetwo.com>
 <20250922121902.88664-3-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922121902.88664-3-mike.looijmans@topic.nl>
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4bc34 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Z6EfDJrRAAAA:8 a=MSl-rjlidl_CnpGKqg0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=GLvejNd0Yr38jcbvy3o4:22
X-Proofpoint-GUID: -QuD6Z0goGvhKNVlWDXuGdt9NWlacUkT
X-Proofpoint-ORIG-GUID: -QuD6Z0goGvhKNVlWDXuGdt9NWlacUkT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX7tS5y8DFqJoO
 543x3+hsnAbBF87iYq6mNvAJ12yASQlHOBzPB2q046ImKYW2r07QpvV71KRuTJ0cTS+kk9w4ttQ
 jMK0DHB4ECGdENhtruk12djTHNv/muqtogV+lrKq6qcPlOMq8ahR4sRfruzlz9mJbQ4pJbMxGUJ
 8L9J9IFMUwSTxGWsA+igOxD4e7CFvcqAmS+FDei+icORrUSue3ZBmBYj/qJm+ok/doWqQfDia2L
 QmxfJrQDpKic2ZbTDsFkCM6hzTCPyW1I9kO9YDcGmi73UMpDjb4UE8JR1qHN8J5kP1m2sm0Phhx
 uXmtB0HUqB8LN533QbZmzxu6iO8l4Q74x2qlzf3szzi3/ef4jTuK5zQs2iaNgXlCZV2jPsCr5St
 3EKzx+wq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138
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

On Mon, Sep 22, 2025 at 02:18:45PM +0200, Mike Looijmans wrote:
> The tmds181 and sn65dp159 are "retimers" and hence can be considered
> HDMI-to-HDMI bridges. Typical usage is to convert the output of an
> FPGA into a valid HDMI signal, and it will typically be inserted
> between an encoder and hdmi-connector.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> 
> Changes in v6:
> Add DRM_DISPLAY_HDMI_HELPER to Kconfig
> Change "ti,mode" to "ti,retimer-mode"
> 
> Changes in v5:
> Really added vcc/vdd regulator support
> "oe" gpio is now "reset" (reversed logic)
> devicetree enums ti,equalizer and ti,mode
> Always disable HDMI_SEL (formerly "dvi-mode")
> 
> Changes in v4:
> dev_err_probe, this_module, of_match_ptr
> Use fallback compatible
> Add vcc-supply and vdd-supply
> 
> Changes in v3:
> Lower-case hex values and use defines for EYESCAN registers
> Remove equalizer code (unlikely to be used)
> Remove attributes (no longer useful, undocumented)
> Fix build for 6.17 kernel
> Use devm_drm_bridge_alloc
> Sort includes and add linux/bitfield.h
> Check chip type and complain on mismatch
> 
> Changes in v2:
> Use atomic_enable/disable
> Use #defines for bit fields in registers
> Allow HDMI 2 compliance
> Filter modes on clock range
> Use cross-over pixel frequency instead of manual overides
> Devicetree bindings according to standards
> 
>  drivers/gpu/drm/bridge/Kconfig      |  12 +
>  drivers/gpu/drm/bridge/Makefile     |   1 +
>  drivers/gpu/drm/bridge/ti-tmds181.c | 427 ++++++++++++++++++++++++++++
>  3 files changed, 440 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index b9e0ca85226a..d679180b05b1 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -430,6 +430,18 @@ config DRM_TI_SN65DSI86
>  	help
>  	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
>  
> +config DRM_TI_TMDS181
> +        tristate "TI TMDS181 and SN65DP159 HDMI retimer bridge driver"
> +	depends on OF
> +	select DRM_KMS_HELPER

Do you need it here?

> +	select DRM_DISPLAY_HDMI_HELPER

missing select DRM_DISPLAY_HELPER

> +	select REGMAP_I2C
> +	help
> +	  Enable this to support the TI TMDS181 and SN65DP159 HDMI retimers.
> +	  The SN65DP159 provides output into a cable (source) whereas the
> +	  TMDS181 is meant to forward a cable signal into a PCB (sink). Either
> +	  can be set up as source or sink though.
> +
>  config DRM_TI_TPD12S015
>  	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
>  	depends on OF

-- 
With best wishes
Dmitry
