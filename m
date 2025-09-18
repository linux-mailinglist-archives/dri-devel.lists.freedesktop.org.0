Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3864AB84A2F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 14:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CC410E89C;
	Thu, 18 Sep 2025 12:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8FRs7Hd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4814710E89C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 12:44:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBUV6i021466
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 12:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gTvAFZglIDLXccaiTU38RHxk
 +SuGPsy7AO+qEcLGz6Y=; b=d8FRs7Hd+QPWtZ250pPxbPEAX+3kOxb8tkFu2csh
 KNNbfH6unOrwii4HppsaC8oo1KsZkY183GO6+Cx+Aqtfcv50rPYSuuywC/slNdVe
 J3bB24nWBlVzyWRss9XMIusP2UN7hEmJmS1xtFYzJnI3rervKFl1+VbX+Jkbmq7Z
 FS9kSU+BCHGEWRdIvXRxloxokAP/i2E+iECFzLlPNiC+dFLLLylix0uJPKfMXz+q
 5rXB1wfrM+YNMOFEjTiBqBDQe75eZYXMll/KoNZMoHbnCtTVlS4NdOQpQIM9DyQZ
 wTDES8GFRwI2hmTtMDSajDr99rZ4Tw4TaR6sA/R53ZInWw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5ec6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 12:44:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b548745115so19765871cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 05:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758199482; x=1758804282;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gTvAFZglIDLXccaiTU38RHxk+SuGPsy7AO+qEcLGz6Y=;
 b=mcxBHq02CjUAktN2EnxSD+iJ1OGT0YKO5i49yBTHLZRRsRGigCIw02R8vBTN9Tz/kq
 2a0Qsdc2ig7BAvpE/ZNOrGsNrM8MqBmpJnjx2QDDvSCtR2NgUIgnLsMQeTBwDW6AsLkM
 SCSSKi8N+Je7PYwlRh/813mCeyx2UHwS+4EzmculA0JTvMM5Ub9uPVD24dij0f6TOtj7
 og/8BEz2Tu/kErqn9l95WIphgpwqtQsUaH8EIpsm/Wyu6lt1HxIzNxGexVMahWh9No58
 /jkq6RfbSR/0hW7T7cOKYT2SmMsjopsE9R3FXbTa6287YTLOEV7Q1GrFEMSN+lL70Uif
 jREA==
X-Gm-Message-State: AOJu0YwoVj4nBCv9I7JQSaIESJQ/3c7EP7w3XqN4W7QxYgsCAJgihqbt
 PjFlqjNtKBfpxqiDxrxuJga7QIMvFtMtLKSx+eChSUt8JECdMV0Ic2rMpwzRTVv5rYgJPXUTy8K
 +KdiH5pO/huY86T4xVQYpZQjOVCvgKYWr0lzVrscMIXBM/Hq6IDykqJK7czkRiMNmNKESMpE=
X-Gm-Gg: ASbGnct3z4d3proIfaS11bjMV+ipDEOOtbCivAE0+SufbH9oktC/5pmcouocdZMPaGM
 HY0kZDdc8tt2L3C720LZnncwjkJjzwcqj61mhEOBAQOV9hmBIbJ3YbDXAFtNIb1qiZnTrCB+KRT
 q9OoLimo/dNep/eflpgKQVoyCFRnmH0ImSVNOBOi+FmmToLP1VVKai+5+w6TCQLRdYYGyiww31T
 M6qN+1XHwLUye9ZttTgHL1YinFq5FQeEFAPrYMTnwDnOdbjRZ+v8W9xdXmK8ye6pAjXJlLqUeBb
 RZFP4KLLSwAJHKajjycylAYTFjIe7YSqT+JsrbRpv6Gow2iJP3eW21jxf5iyHA/uQtqEqrPxV7m
 hRWStHsTqs3usKFmROQvcG9jiBZImHfqlwb/vkTCWxJPvP1Y8ZpdM
X-Received: by 2002:ac8:5dd1:0:b0:4b4:9531:8a8a with SMTP id
 d75a77b69052e-4bdaf240cd1mr33763411cf.38.1758199482413; 
 Thu, 18 Sep 2025 05:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIuCnR0wlykqroSVkf4rW0lxyHm2OgbEsL7t1lJhmH/oI+45dByOMaQEegu8/0HBWxjOJL5g==
X-Received: by 2002:ac8:5dd1:0:b0:4b4:9531:8a8a with SMTP id
 d75a77b69052e-4bdaf240cd1mr33763051cf.38.1758199481860; 
 Thu, 18 Sep 2025 05:44:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361a28b56cdsm5723341fa.25.2025.09.18.05.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 05:44:41 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:44:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, qijian.guo@nxp.com
Subject: Re: [PATCH] drm/bridge: waveshare-dsi: Fix bailout for
 devm_drm_bridge_alloc()
Message-ID: <n43pa62bneykoeo3c2ne53ksrozftohmo4dnq5ifnchgrvwcdn@qqbbur6uiuxl>
References: <20250806084121.510207-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806084121.510207-1-victor.liu@nxp.com>
X-Proofpoint-GUID: SAxR-4gwwsGanGy2RcxhMCQOpOLcgTrQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7uB6i9si2+WC
 dpfhUzLD3crRUarFxAt/XytjAGLJfrfW/6Cj9GGD8z8t3TINWtpIPgoZOlgrSlCjZPlFUX8uCaP
 ZqJw8VC/4+AFgwYCaBulWfnwpqOtdFMBBwQHW3QyPKpd1OM0pHJ69asOI4C6NSgns6iBYfoQIKv
 XCfrjTfqLz/uONONSajuC+zO5PTtqDRfDw69qDgrkUsme//rueC+svyiNMYzbF8ZPtLfAHv58GI
 8zzMlkOujloRL7YJEuRSjEqsuRjYCW9xK34hLiZSmzr+5D+/KbPBZ2ZvkoGhYVJ9RV+o/QRieZ4
 gGfhdYzV4nHY70lLzcJMdYbDaLXPvfZwJ5z7OlRHZTXsriem3OaBpHAEAa8+pzO4+izNLgQ5VCG
 RdyqJeIH
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cbfebb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=3EkQX2vGk4wexuzDa8QA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: SAxR-4gwwsGanGy2RcxhMCQOpOLcgTrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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

On Wed, Aug 06, 2025 at 04:41:21PM +0800, Liu Ying wrote:
> devm_drm_bridge_alloc() returns ERR_PTR on failure instead of a
> NULL pointer, so use IS_ERR() to check the returned pointer and
> turn proper error code on failure by using PTR_ERR().
> 
> Fixes: dbdea37add13 ("drm: bridge: Add waveshare DSI2DPI unit driver")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/waveshare-dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
