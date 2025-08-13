Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652BAB24A1E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 15:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8D410E70C;
	Wed, 13 Aug 2025 13:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrttD8hB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2C610E70C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:06:05 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBM1ci013413
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CtsyGNtxwW43FmYplJvg8OI/
 hjnzMs36m1UNeiX8+ls=; b=KrttD8hBw+KKDrQbWYvvVofnlr/5K9SwkYdP4f9Z
 Ck56kjYz4lwKP6UWjnQst9JKQ9qqg6u7mC9u6dnO2R9EhrW8QeJfgL63uISLTJIY
 yIFHNp3F9Z8Tns8oA6KKoIqTRRatK43gJSZcajEFtKb8noN5G5cjjPNZLzpCOoDT
 4D/Fwc74QpeJcj8NJLB0iXCy656y/aZLnZIdTuUkeVtHouQnCYxc15UF2dHfHY5K
 a3/4P0tNa95tubWISBK+M4o8vOK4iqa/UW2SlMqEIx4FHemDMZxQc0pPrNELG2G7
 V+tpIpD3uAI1dBUTLc1S1qYso/hn71Efyk7FOSUxb4zf+w==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxa039-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:06:04 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-741b9fec1dcso8833702a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755090364; x=1755695164;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CtsyGNtxwW43FmYplJvg8OI/hjnzMs36m1UNeiX8+ls=;
 b=U81vYd7mBwmsXLDnKWffGMVb+qEcCEnPCyJzhgmPfHfA5SaJtCfNRVGYIEQMvapz2Z
 O2I+HxEMQt8QG9I3SrK386XsolrgMWhpIS1xtcxFUGQNNOGFl843EKi/2j+UrXV7a1/u
 BJCkxAKXXZOofXISIonXl/wBnzdRUc0rbgLqA7w7wFYEdPpzSfTB8pQHXhV3w6jBaEVz
 MuwFfSpbbHQIot5D19c8LX5GZbXzdNGMArTEy8Y0V5a2KLiIIpDvBvg/Wxo/SekdVZJ8
 z1/rFB6y3POCwgb9b9y7/hIdaTsc7WMVZ74oKG7y8ilVuLmC0eossxlGjVuJ6yuQcp04
 MTpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7cQlX4nm1L4gSkZaBg2EMn7D2FVmgJfK6FrdwR59mCVcbI1YjYcBWxTki4728eH/YM70Th/T7WEE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyniTNOrSXMjOF8qlRmO1DSI8ASgCKrC79efOv3KVR2neh254v9
 B6D8S1QDzv6FF+K/fdk944ziH8vmfC4uuwf1+baCA7Elyp5nC4rdO+5m5GpcuBKUfWv42kPZSn6
 P9tN5LiIif8sDVft2X8F3zweYQN6rm2sNtL9OImenxB4DGKxLZ+593m8O/wvjhXG86OxeQtA=
X-Gm-Gg: ASbGncukeZgKra3RWn9QYai+7qyMb47aFvSgv+kipVIdJHQo2fGIIz8OQI/v0sUSMBp
 XJEQRh29Qf/Bq43nm9C4QlD05BW27m7dBUr2S7hDMMx2ULXvMGY0KKqUUnvypFj9L5E46+SoiPP
 bJ5gWEuLkdm/8vrl0RqXnhQOEdESPsxQkz6bB8Dgt55/CrZ/sxCpffXS8+dQD+tGYfco3tD6c2B
 RaDAkgpFu2XN3JLeoaoAeLN/74XZkpOxFH8Z6iSXoCdgfHDTNIvMUz/3f9zex9+DWQwvOTTfasO
 mYEejLwxzQ2c7csZT+dItSiMU+AlsbbGygZUhb3QHa5R9wwOkqnLGITUrjgG2xuFDTOA9Ey93QB
 6KJYmBKfzlSqm4aAJsIC4x7mGxNXVALWmf/dIMetzAO8CJHKG2oDK
X-Received: by 2002:a05:6830:3692:b0:73e:6bd0:ff93 with SMTP id
 46e09a7af769-743753f6e87mr2331329a34.12.1755090363436; 
 Wed, 13 Aug 2025 06:06:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5ogUaSFs5OWUWvVMI5qkYyf64qK16spVbpftIzt8rDMvSQPCS8EvSHndBFluBHhWuI5wHtQ==
X-Received: by 2002:a05:6830:3692:b0:73e:6bd0:ff93 with SMTP id
 46e09a7af769-743753f6e87mr2331236a34.12.1755090362521; 
 Wed, 13 Aug 2025 06:06:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cc6c14843sm2192955e87.124.2025.08.13.06.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 06:06:01 -0700 (PDT)
Date: Wed, 13 Aug 2025 16:05:59 +0300
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
Message-ID: <x737uymd55glqazjct3aoskfdc3wszuslobjjoyx6r6zmzju2v@vjj74a2bfrn6>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-6-a54d8902a23d@quicinc.com>
 <5b2lpjd2raqmowi466avustasdjsssl2tjwogd3ixjg7gi3dxv@cqtkbtcijnlc>
 <552ce804-1aa2-48ca-a68c-8a98621e7363@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <552ce804-1aa2-48ca-a68c-8a98621e7363@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXxhhCZYHqtdLR
 KA1C2vWAQ+xOdBDd/Xd0qxHEgh5YEti9wO8TVaVv/asOTyd6LuWq0el4NUW/HecAK8n2WvGtyBx
 Qq9JC6DqCRvWLhC3F432BMz1ACyQEKlnMEN0W5qhnITwSQtZPXnu6czuLJiIFXDy0CKKCXl4R7M
 lkNzS4lBWlA9OE89LPaceSrPUgxTpCsbrSrs0ydMRDGdgqlhO4oN1/jvv/J4QZA5CsAiNIWMoXT
 2wFhHzqODnpnKKrlRCOFQ3YsLwvYc0irHQNDFNBsZ4FcFAPRjVTjAOwP8tfsLesptKoHRB4H0js
 PCgPSqnFT4RdbN1SdE68luv3xU7VEeoL/I8jye/d8eNW12dj6r2TAaAG105YwkZfzUp+wCn1Qhn
 KCEdd/LB
X-Proofpoint-GUID: _MOLbJFphvbwCaXkUyNOYg-fhchu8Pqk
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689c8dbc cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=QnCa7YtPqE7sD9tSJnwA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _MOLbJFphvbwCaXkUyNOYg-fhchu8Pqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
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

On Wed, Aug 13, 2025 at 07:56:41PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 21:16, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:25PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Enable/Disable of DP pixel clock happens in multiple code paths
> > > leading to code duplication. Move it into individual helpers so that
> > > the helpers can be called wherever necessary.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c | 98 +++++++++++++++++++++-------------------
> > >   1 file changed, 52 insertions(+), 46 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > index aee8e37655812439dfb65ae90ccb61b14e6e261f..ed00dd2538d98ddbc6bdcbd5fa154fd7043c48d6 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > @@ -97,7 +97,7 @@ struct msm_dp_ctrl_private {
> > >   	bool core_clks_on;
> > >   	bool link_clks_on;
> > > -	bool stream_clks_on;
> > > +	bool pixel_clks_on;
> > 
> > As you are touching this part, how many paths lead to pixel clock being
> > enabled and/or disabled? Can we sort them out and drop this flag, making
> > sure that the clock can be enabled only in one place and disabled in
> > another one (hopefully)?
> > 
> Here we only have 2 paths to enable/disable pixel,
> 1.msm_dp_ctrl_process_phy_test_request 2.msm_dp_display_enable/disable.
> both of them are in pairs. Maybe we can keep this state to make it easier to
> access the on/off status of each of them in the case of 4 MST streams. when
> we get the snapshot of the pixel clk, we can visit here.

I don't think I completely follow the MST part. I last reviewed your
patches some time ago, so I might have forgotten part of the series.

We need some refcounting or state processing in order to identify if
there is at least one active stream. Only if we are transitioning from
the full-off to the at-least-one-on or from the last-one-on to the
all-off we need to toggle the pixel clock. This means that we don't need
the pixel_clks_on flag but some other kind of variable.

Note, I might be wrong here, please feel free to point me to a patch
which handles that.

> > >   };
> > >   static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
> > > @@ -1406,8 +1406,8 @@ int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   	ctrl->core_clks_on = true;
> > >   	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
> > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > -		   str_on_off(ctrl->stream_clks_on),
> > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > +		   str_on_off(ctrl->pixel_clks_on),
> > >   		   str_on_off(ctrl->link_clks_on),
> > >   		   str_on_off(ctrl->core_clks_on));
> > > @@ -1425,8 +1425,8 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   	ctrl->core_clks_on = false;
> > >   	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
> > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > -		   str_on_off(ctrl->stream_clks_on),
> > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > +		   str_on_off(ctrl->pixel_clks_on),
> > >   		   str_on_off(ctrl->link_clks_on),
> > >   		   str_on_off(ctrl->core_clks_on));
> > >   }
> > > @@ -1456,8 +1456,8 @@ static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   	ctrl->link_clks_on = true;
> > >   	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
> > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > -		   str_on_off(ctrl->stream_clks_on),
> > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > +		   str_on_off(ctrl->pixel_clks_on),
> > >   		   str_on_off(ctrl->link_clks_on),
> > >   		   str_on_off(ctrl->core_clks_on));
> > > @@ -1475,8 +1475,8 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   	ctrl->link_clks_on = false;
> > >   	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
> > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > -		   str_on_off(ctrl->stream_clks_on),
> > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > +		   str_on_off(ctrl->pixel_clks_on),
> > >   		   str_on_off(ctrl->link_clks_on),
> > >   		   str_on_off(ctrl->core_clks_on));
> > >   }
> > > @@ -1737,6 +1737,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
> > >   	return success;
> > >   }
> > > +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> > > +	if (ret) {
> > > +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	if (ctrl->pixel_clks_on) {
> > > +		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> > > +	} else {
> > > +		ret = clk_prepare_enable(ctrl->pixel_clk);
> > > +		if (ret) {
> > > +			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> > > +			return ret;
> > > +		}
> > > +		ctrl->pixel_clks_on = true;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
> > > +{
> > > +	struct msm_dp_ctrl_private *ctrl;
> > > +
> > > +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> > > +
> > > +	if (ctrl->pixel_clks_on) {
> > > +		clk_disable_unprepare(ctrl->pixel_clk);
> > > +		ctrl->pixel_clks_on = false;
> > > +	}
> > > +}
> > > +
> > >   static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
> > >   						struct msm_dp_panel *msm_dp_panel)
> > >   {
> > > @@ -1763,22 +1799,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
> > >   	}
> > >   	pixel_rate = msm_dp_panel->msm_dp_mode.drm_mode.clock;
> > > -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> > > -	if (ret) {
> > > -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> > > -		return ret;
> > > -	}
> > > -
> > > -	if (ctrl->stream_clks_on) {
> > > -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> > > -	} else {
> > > -		ret = clk_prepare_enable(ctrl->pixel_clk);
> > > -		if (ret) {
> > > -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> > > -			return ret;
> > > -		}
> > > -		ctrl->stream_clks_on = true;
> > > -	}
> > > +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
> > >   	msm_dp_ctrl_send_phy_test_pattern(ctrl);
> > > @@ -1998,8 +2019,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
> > >   		   ctrl->link->link_params.num_lanes);
> > >   	drm_dbg_dp(ctrl->drm_dev,
> > > -		   "core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> > > -		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
> > > +		   "core_clk_on=%d link_clk_on=%d pixel_clks_on=%d\n",
> > > +		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->pixel_clks_on);
> > >   	if (!ctrl->link_clks_on) { /* link clk is off */
> > >   		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
> > > @@ -2038,21 +2059,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
> > >   	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
> > > -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> > > +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
> > >   	if (ret) {
> > > -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> > > -		goto end;
> > > -	}
> > > -
> > > -	if (ctrl->stream_clks_on) {
> > > -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> > > -	} else {
> > > -		ret = clk_prepare_enable(ctrl->pixel_clk);
> > > -		if (ret) {
> > > -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> > > -			goto end;
> > > -		}
> > > -		ctrl->stream_clks_on = true;
> > > +		DRM_ERROR("failed to enable pixel clk\n");
> > > +		return ret;
> > >   	}
> > >   	/*
> > > @@ -2080,7 +2090,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
> > >   	drm_dbg_dp(ctrl->drm_dev,
> > >   		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
> > > -end:
> > >   	return ret;
> > >   }
> > > @@ -2154,10 +2163,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   	msm_dp_catalog_ctrl_reset(ctrl->catalog);
> > > -	if (ctrl->stream_clks_on) {
> > > -		clk_disable_unprepare(ctrl->pixel_clk);
> > > -		ctrl->stream_clks_on = false;
> > > -	}
> > > +	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
> > >   	dev_pm_opp_set_rate(ctrl->dev, 0);
> > >   	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
