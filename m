Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38835A615DA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 17:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A19910E0B9;
	Fri, 14 Mar 2025 16:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCULBLvv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CA210E0B9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:09:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EBZvFj031553
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4bfnZNLncJjN6sD4k19N7fqv
 87YFw/Wyvudwmu2GWLw=; b=pCULBLvvEJ5zlulgOx5Keu1ILqe5T/PE0nPgv8wz
 fgd5lJf0gE69EWhdteWIjjhh4xBK3+BNnON8biUvqP0enCRIt4BqNirWryS/hTeX
 zsJ2SHoOLxxp2Ifx3Y0nRG3f6BEs6hmVBtf4qUFal0jDfltfzrfIaO5oz6i+M+7z
 CTIO6+guaadWjLOLT/2xGge9xKLGwZXvFn3stK+WVm7rbmU3fRQ3JlbapvhL9vwi
 sPtuJzbmlahLsX8DQnrqgSuScrx1saoE9Y0bq1m1vpgliA+AOru9iHrIMk2bDWPa
 FoebxzTzNmZk2XqefExvyGTHGvePt7P9xbRkIiHkZu1Eiw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bx1jm73h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:09:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e8ffb630ffso38168276d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 09:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741968570; x=1742573370;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4bfnZNLncJjN6sD4k19N7fqv87YFw/Wyvudwmu2GWLw=;
 b=e12u4Vz6e0MMJVTyQNSDHXiFBdZgQCpA80yrPqly3bu4a9Qcfn5WYFnw6wk+xllp/k
 RQ+6IuHsVP+eO2JjCU+Q+/vWPaJ/kmFi4gksMpQv584ljrpZ2iezOf0/V2932TWApbnI
 ueKzyEYD7d7xDYg6YnbxmQKvyY3Xx5W+M+EDpIRLtK0rCgnwK2A/L/qnN0x/kzhtU4o3
 62ZRXtP3XC3AJ4jAxfOtJeFtnlShh3H20OW327A2QWzX89aHP0RHpPVS90RQycFdLrsd
 3cWC0g+4q5hIzncPSKFh5osMZcuwoLwG+92/IG98oN3CagiU5JX9wKhNkgUxPv/zUlvi
 nzwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7s7d0Cid1DWflE8HUDmfbIes1hQls9DY72Guv6+L5HaRWWgLRJ8ZwFc7JsuwVyypWCXbro/8CRrQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy58BlDZCxJU+6bJ8zhJZTWtg1eM8ZDPKcjAu4y93syZeMg0WIW
 FSjrOzvkS9XJFfo4A7c9VJXcCS8Y/qbgJBaH6ZQy5H0IzAGkzLgMOPM8l/6P/duwPhwOtntkAMo
 4vTTqqopy/S6o6OBe9bfJ8FbX3q9PloxA54PinLubxubD/ddx0R2kKMzf2uWDBfXbI1I=
X-Gm-Gg: ASbGnctaCN6Wzskr0qe6NPS6ofDpE/zwEKumWVZaJSnw8iXCYsh8GCownZPLRRCa5mC
 LXSuvs/C3wpa4I615x1bVLsQYukMxcxJ8uEBIpVW8TMKMk/J00bc7ITbEgT4VZGWKErzPz+aQ/b
 VWkopOpk9zjWl8VmuuPuhOOoCz86DFmRBRKgJNGFeOV9LCf5gzQn2ehsg0+oZzV4eb2SD6f1/B1
 466OKYMUCvArbW5LELDiLtSpi54ZRXHVXxVyxn6P6iY2e9WX4obzyfL9H1N6ECsIHBfyj092L6v
 w3SHaVLpdIbPBAIicxXhMhmnYPTuYc8yvx4p4wuJXrp1wy9lJNMAeYJrar9Lm7sme0Y2AU+5ssY
 XtAo=
X-Received: by 2002:a05:6214:226c:b0:6e8:97d2:99a2 with SMTP id
 6a1803df08f44-6eaeab371camr48807046d6.39.1741968569778; 
 Fri, 14 Mar 2025 09:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2EjdDnqtRenbzdvH5JrG4m54Jxc0lHOH/tkPmuYrU9Psmdz0yG5KOTxSFr5UTWXvBDmjLAw==
X-Received: by 2002:a05:6214:226c:b0:6e8:97d2:99a2 with SMTP id
 6a1803df08f44-6eaeab371camr48806386d6.39.1741968569358; 
 Fri, 14 Mar 2025 09:09:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0d3003sm6297611fa.10.2025.03.14.09.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 09:09:27 -0700 (PDT)
Date: Fri, 14 Mar 2025 18:09:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/vc4: use new helper to get ACR values
Message-ID: <5fjxnvt3e7t3qgvyprpsiun3d2xqqoz5ovwcbabdqpptg5zj27@k4jjjshf2ps7>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
 <20250309-drm-hdmi-acr-v1-3-bb9c242f4d4b@linaro.org>
 <20250310-invisible-married-firefly-945c84@houat>
 <esgb42dyhpjixm62tfk2nfzdiygnfn4bcwq4zn7rhydmt4np2q@7v77p7kveb4e>
 <20250311-intrepid-obedient-lizard-64ad2c@houat>
 <wass63nz24l4h3umszsyptb5bnkny4h2wmnbeunjrdfhyacl4l@w6emq2ipt552>
 <20250314-sassy-illustrious-koala-3ad3dd@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-sassy-illustrious-koala-3ad3dd@houat>
X-Authority-Analysis: v=2.4 cv=CNQqXQrD c=1 sm=1 tr=0 ts=67d454bb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=JEape1zOPL1jDBVHQqIA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: eOXQIjWFkNcear2Y2W9NdI24RHhV8qND
X-Proofpoint-GUID: eOXQIjWFkNcear2Y2W9NdI24RHhV8qND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=781 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140127
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

On Fri, Mar 14, 2025 at 02:46:09PM +0100, Maxime Ripard wrote:
> On Tue, Mar 11, 2025 at 06:28:50PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Mar 11, 2025 at 09:07:10AM +0100, Maxime Ripard wrote:
> > > On Mon, Mar 10, 2025 at 10:18:04PM +0200, Dmitry Baryshkov wrote:
> > > > On Mon, Mar 10, 2025 at 03:51:53PM +0100, Maxime Ripard wrote:
> > > > > On Sun, Mar 09, 2025 at 10:13:58AM +0200, Dmitry Baryshkov wrote:
> > > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > 
> > > > > > Use drm_hdmi_acr_get_n_cts() helper instead of calculating N and CTS
> > > > > > values in the VC4 driver.
> > > > > > 
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++-------
> > > > > >  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
> > > > > >  2 files changed, 10 insertions(+), 7 deletions(-)
> > > > > > 
> > > > 
> > > > > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > > > > index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..0a775dbfe99d45521f3d0a2016555aefa81d7934 100644
> > > > > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > > > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > > > > @@ -211,6 +211,13 @@ struct vc4_hdmi {
> > > > > >  	 * KMS hooks. Protected by @mutex.
> > > > > >  	 */
> > > > > >  	enum hdmi_colorspace output_format;
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @tmds_char_rate: Copy of
> > > > > > +	 * @drm_connector_state.hdmi.tmds_char_rate for use outside of
> > > > > > +	 * KMS hooks. Protected by @mutex.
> > > > > > +	 */
> > > > > > +	unsigned long long tmds_char_rate;
> > > > > >  };
> > > > > 
> > > > > This should be in drm_connector_hdmi if it's useful
> > > > 
> > > > That would mean bringing the state to a non-state structure on the
> > > > framework level. Is it fine from your POV?
> > > 
> > > Sorry, I'm changing my mind a little bit, but it's pretty much the same
> > > case than for accessing the infoframes from debugfs: we want to get some
> > > information stored in the state from outside of KMS.
> > > 
> > > What we did for the infoframes is that we're actually just taking the
> > > connection_mutex from the DRM device and access the drm_connector->state
> > > pointer.
> > > 
> > > I guess it would also work for ALSA?
> > 
> > I'd really prefer to follow the drm_connector.infoframes.audio. It makes
> > sense to group all ALSA-related functionality together. Maybe I should
> > refactor it to:
> 
> That's the thing though: the tmds_char_rate has nothing to do with ALSA.
> It's useful to derive the parameters, but KMS controls it, it's part of
> its state, and that's where it belongs.
> 
> Just like any infoframe but the audio one.

Ack, I'll take a look.


-- 
With best wishes
Dmitry
