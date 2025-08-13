Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCF7B24A77
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 15:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F412410E717;
	Wed, 13 Aug 2025 13:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXVT3Q6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4C110E715
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:21:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLfE4002874
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1Tfp9cm/j0vQaoGGxkHI2V5b
 XcUTdHOp4xCqrHRWtts=; b=NXVT3Q6P87PXgaugn+Ofs4LdmifWzzKNZTlFbITc
 9O8UQXRHKkAHO1hiaMC4NRecGfamyWu82KEOm126G5LLIzkRSCdKrmyTX/0Oa7Jh
 HptNzhrdBtxOovTzrld9wRHROx8vlDtlMW8fhEAy1GNiNZZGCaYs8nOaighi+A/C
 jvRPRb7dHtoZoAlQPtj5lpo4YdSDxmxeuqj9TzLx1dBCJmq8gu3MUAssuGHo0OJX
 EYl9Ur/eHu7ML/Ge8kmoiGz8hKvtlu92UeUfO75xBwTycI7wQoIhmrUIBNLsWsrr
 +4R0s0XfRllnX0ZWNzMH/c32YCfhHGwCKU6m54YpjEJ30A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv3vnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:21:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b085852fb8so264614551cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755091272; x=1755696072;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Tfp9cm/j0vQaoGGxkHI2V5bXcUTdHOp4xCqrHRWtts=;
 b=A0YxOPP1Kfp0fcTM8N0jYc4Qwl9ZFmoYsFgQXIO2IQXzWW41fGgUJ/0QoynjLqbpoR
 7T/pCV3+3tqlY/0X0NJdpgfYe8l3vP8x5kEdvD5b0dLZiVVB5Yy6036TP1HbZPQp1BAN
 dkFJJDV9pMp50mDbY4k62vI5fTEL8ETebTEDKYCcW9qKxcUf1Dnvn0WFbuuOxTo6jqwl
 SXBGHcau2NnUux58VfzuxnkqfBVKpbLIbuONe93HcyEIkqosijXOAVY8LY60bQoF77KA
 l0dfaEQrV0Q68Gw4hYhHK7xvI7hZaO9RLmRgfdBPjmDZXNXlPaFlFWbdVOMSCaIqAw/n
 oHZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJEHIHod+gjYZvJZRM8GdYvi7Z4A3ldqS6nq9sPsWPnLw4X7kO70EvRoTIKvFe6zcovJUhcnLsfPY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylyCNf8k1w61ejyIwflxwfAdTniUDx3fUSqf6Vxl+VKTUhLBm8
 SL/JnjPRUqa+xmDrdDhzla2soBLJKTuG04TkiUglJnQ1xe1V5+DMjR2wlC7EmlMa3kI4RKxXfHv
 YDr7g9U16ga9D/wv6HHRDr0pgrOhcfHO7rV2T3hOgOjG/8/Rhk8yjvhJrUVHNBfPhJd4+K+8=
X-Gm-Gg: ASbGncuvFQqkd+P9PSy52LHa3KQrj4YI85uR6gsCZZ0a6+F89RjTDEw7a2sUNyVR+rp
 ut/ju8IIQalKOEg5DzqAqRyVgOyPZZJ6o1bCVy/u1B64KHiln4WSNw1ccrnP6T9NKRu6JKN9L2p
 GgIb4jEPAyM+gwbJodvSE4wT/2EjNNq1aw+wN676mY8gIF2pjWcoz+6/mnzCwHjzFJaXr/mYATY
 Cru0WwNJ4O9SZocRSsApQAAGewkr1N9PLTFgiDN3u/aO9GavIDwoMuHQe++CLGqW61+r6ll2pxv
 55FV01+eZjNtVYw/7IwZ5kqbrBTUMF2IdWrnoLJ5GgmHIvNK3yvLKCnuUNnU5Jt2unW+iMtXb17
 ZWLlFHPddaRTSiPwek63nMA9OMtZecvMy1GKLaggz4/034NogDLsS
X-Received: by 2002:a05:622a:1e95:b0:4b0:da5c:d1f8 with SMTP id
 d75a77b69052e-4b0fc86deedmr36859341cf.57.1755091272088; 
 Wed, 13 Aug 2025 06:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFatniPO3tMmPsEK4QYjJL8ObC6Yrn45NSDJO2pqanavZEpL4QtsS5JaYMLwWW5MJxZeK8qJw==
X-Received: by 2002:a05:622a:1e95:b0:4b0:da5c:d1f8 with SMTP id
 d75a77b69052e-4b0fc86deedmr36858841cf.57.1755091271531; 
 Wed, 13 Aug 2025 06:21:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55ccb631ccfsm2035826e87.150.2025.08.13.06.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 06:21:10 -0700 (PDT)
Date: Wed, 13 Aug 2025 16:21:08 +0300
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
Subject: Re: [PATCH v2 06/38] drm/msm/dp: move the pixel clock control to its
 own API
Message-ID: <hqz6b3cd72kjeceau2te4rfruwsxqancp7qh4f3fgi4ifyap2b@5kxwsj3mc7ix>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-6-a54d8902a23d@quicinc.com>
 <5b2lpjd2raqmowi466avustasdjsssl2tjwogd3ixjg7gi3dxv@cqtkbtcijnlc>
 <552ce804-1aa2-48ca-a68c-8a98621e7363@quicinc.com>
 <x737uymd55glqazjct3aoskfdc3wszuslobjjoyx6r6zmzju2v@vjj74a2bfrn6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <x737uymd55glqazjct3aoskfdc3wszuslobjjoyx6r6zmzju2v@vjj74a2bfrn6>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689c9149 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=f0938oLFc8w2-2QPmxoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: J89hixkLmbWUG6bvWm03z0vS9dOpAICg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX/8FWvPeTDEJw
 iO/+Rb+q/z0BY/1i54hzglXk2pA7QRzSJI30VA5GO2plJclRyLoO0CaPvGysxlejNP9hVjKSsf5
 6hI8Uflykg0KlYihxPJA3H1ZddRd52MbYy4vRuZ0s4CXdyyjh5zXrE5V+62i47V09wMoNOeg4m0
 GqJXjCMrHNn0AQCr2eSHa+Bx6Ggy1GlRN0/88sMJF1RV+X3tsJQXNUm9NGO6R+sz5UfVBEujgNA
 giayvHjlpHD7Q1S58U8FfKVCsvQP/4A7pycR/SFPrMoWr439kJ5ad8K0Vxxi9t6QwFPE93R7R30
 MiA7jVG1bHBRUPUg3PZJsXjrWrpSJpQFP1wuHEfEugEvbXnxpTiVgXvINbCzBls8qU8IAOX3Wgw
 bLzLy7It
X-Proofpoint-GUID: J89hixkLmbWUG6bvWm03z0vS9dOpAICg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
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

On Wed, Aug 13, 2025 at 04:05:59PM +0300, Dmitry Baryshkov wrote:
> On Wed, Aug 13, 2025 at 07:56:41PM +0800, Yongxing Mou wrote:
> > 
> > 
> > On 2025/6/9 21:16, Dmitry Baryshkov wrote:
> > > On Mon, Jun 09, 2025 at 08:21:25PM +0800, Yongxing Mou wrote:
> > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > 
> > > > Enable/Disable of DP pixel clock happens in multiple code paths
> > > > leading to code duplication. Move it into individual helpers so that
> > > > the helpers can be called wherever necessary.
> > > > 
> > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > > ---
> > > >   drivers/gpu/drm/msm/dp/dp_ctrl.c | 98 +++++++++++++++++++++-------------------
> > > >   1 file changed, 52 insertions(+), 46 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > index aee8e37655812439dfb65ae90ccb61b14e6e261f..ed00dd2538d98ddbc6bdcbd5fa154fd7043c48d6 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > @@ -97,7 +97,7 @@ struct msm_dp_ctrl_private {
> > > >   	bool core_clks_on;
> > > >   	bool link_clks_on;
> > > > -	bool stream_clks_on;
> > > > +	bool pixel_clks_on;
> > > 
> > > As you are touching this part, how many paths lead to pixel clock being
> > > enabled and/or disabled? Can we sort them out and drop this flag, making
> > > sure that the clock can be enabled only in one place and disabled in
> > > another one (hopefully)?
> > > 
> > Here we only have 2 paths to enable/disable pixel,
> > 1.msm_dp_ctrl_process_phy_test_request 2.msm_dp_display_enable/disable.
> > both of them are in pairs. Maybe we can keep this state to make it easier to
> > access the on/off status of each of them in the case of 4 MST streams. when
> > we get the snapshot of the pixel clk, we can visit here.
> 
> I don't think I completely follow the MST part. I last reviewed your
> patches some time ago, so I might have forgotten part of the series.
> 
> We need some refcounting or state processing in order to identify if
> there is at least one active stream. Only if we are transitioning from
> the full-off to the at-least-one-on or from the last-one-on to the
> all-off we need to toggle the pixel clock. This means that we don't need
> the pixel_clks_on flag but some other kind of variable.

Oh, I'm sorry. It was about the pixel clock, not a link clock. But then
I also don't understand the MST case.

> 
> Note, I might be wrong here, please feel free to point me to a patch
> which handles that.
> 
> > > >   };
> > > >   static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
> > > > @@ -1406,8 +1406,8 @@ int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
> > > >   	ctrl->core_clks_on = true;
> > > >   	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
> > > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > > -		   str_on_off(ctrl->stream_clks_on),
> > > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > > +		   str_on_off(ctrl->pixel_clks_on),
> > > >   		   str_on_off(ctrl->link_clks_on),
> > > >   		   str_on_off(ctrl->core_clks_on));
> > > > @@ -1425,8 +1425,8 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
> > > >   	ctrl->core_clks_on = false;
> > > >   	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
> > > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > > -		   str_on_off(ctrl->stream_clks_on),
> > > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > > +		   str_on_off(ctrl->pixel_clks_on),
> > > >   		   str_on_off(ctrl->link_clks_on),
> > > >   		   str_on_off(ctrl->core_clks_on));
> > > >   }
> > > > @@ -1456,8 +1456,8 @@ static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
> > > >   	ctrl->link_clks_on = true;
> > > >   	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
> > > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > > -		   str_on_off(ctrl->stream_clks_on),
> > > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > > +		   str_on_off(ctrl->pixel_clks_on),
> > > >   		   str_on_off(ctrl->link_clks_on),
> > > >   		   str_on_off(ctrl->core_clks_on));
> > > > @@ -1475,8 +1475,8 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
> > > >   	ctrl->link_clks_on = false;
> > > >   	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
> > > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > > -		   str_on_off(ctrl->stream_clks_on),
> > > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > > +		   str_on_off(ctrl->pixel_clks_on),
> > > >   		   str_on_off(ctrl->link_clks_on),
> > > >   		   str_on_off(ctrl->core_clks_on));
> > > >   }
> > > > @@ -1737,6 +1737,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
> > > >   	return success;
> > > >   }
> > > > +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> > > > +	if (ret) {
> > > > +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	if (ctrl->pixel_clks_on) {
> > > > +		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> > > > +	} else {
> > > > +		ret = clk_prepare_enable(ctrl->pixel_clk);
> > > > +		if (ret) {
> > > > +			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> > > > +			return ret;
> > > > +		}
> > > > +		ctrl->pixel_clks_on = true;
> > > > +	}
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
> > > > +{
> > > > +	struct msm_dp_ctrl_private *ctrl;
> > > > +
> > > > +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> > > > +
> > > > +	if (ctrl->pixel_clks_on) {
> > > > +		clk_disable_unprepare(ctrl->pixel_clk);
> > > > +		ctrl->pixel_clks_on = false;
> > > > +	}
> > > > +}
> > > > +
> > > >   static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
> > > >   						struct msm_dp_panel *msm_dp_panel)
> > > >   {
> > > > @@ -1763,22 +1799,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
> > > >   	}
> > > >   	pixel_rate = msm_dp_panel->msm_dp_mode.drm_mode.clock;
> > > > -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> > > > -	if (ret) {
> > > > -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> > > > -		return ret;
> > > > -	}
> > > > -
> > > > -	if (ctrl->stream_clks_on) {
> > > > -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> > > > -	} else {
> > > > -		ret = clk_prepare_enable(ctrl->pixel_clk);
> > > > -		if (ret) {
> > > > -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> > > > -			return ret;
> > > > -		}
> > > > -		ctrl->stream_clks_on = true;
> > > > -	}
> > > > +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
> > > >   	msm_dp_ctrl_send_phy_test_pattern(ctrl);
> > > > @@ -1998,8 +2019,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
> > > >   		   ctrl->link->link_params.num_lanes);
> > > >   	drm_dbg_dp(ctrl->drm_dev,
> > > > -		   "core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> > > > -		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
> > > > +		   "core_clk_on=%d link_clk_on=%d pixel_clks_on=%d\n",
> > > > +		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->pixel_clks_on);
> > > >   	if (!ctrl->link_clks_on) { /* link clk is off */
> > > >   		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
> > > > @@ -2038,21 +2059,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
> > > >   	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
> > > > -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> > > > +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
> > > >   	if (ret) {
> > > > -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> > > > -		goto end;
> > > > -	}
> > > > -
> > > > -	if (ctrl->stream_clks_on) {
> > > > -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> > > > -	} else {
> > > > -		ret = clk_prepare_enable(ctrl->pixel_clk);
> > > > -		if (ret) {
> > > > -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> > > > -			goto end;
> > > > -		}
> > > > -		ctrl->stream_clks_on = true;
> > > > +		DRM_ERROR("failed to enable pixel clk\n");
> > > > +		return ret;
> > > >   	}
> > > >   	/*
> > > > @@ -2080,7 +2090,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
> > > >   	drm_dbg_dp(ctrl->drm_dev,
> > > >   		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
> > > > -end:
> > > >   	return ret;
> > > >   }
> > > > @@ -2154,10 +2163,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
> > > >   	msm_dp_catalog_ctrl_reset(ctrl->catalog);
> > > > -	if (ctrl->stream_clks_on) {
> > > > -		clk_disable_unprepare(ctrl->pixel_clk);
> > > > -		ctrl->stream_clks_on = false;
> > > > -	}
> > > > +	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
> > > >   	dev_pm_opp_set_rate(ctrl->dev, 0);
> > > >   	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
