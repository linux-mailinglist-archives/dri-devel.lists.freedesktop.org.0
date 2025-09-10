Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03F6B51827
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 15:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD78810E91F;
	Wed, 10 Sep 2025 13:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMj36H+T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6478810E91F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:43:18 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgWC0012107
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5nQ4xWao/W1S9JuuivQg6TVz
 V1TXFvvS01+Hu/ewF2o=; b=CMj36H+TbjJBbjGtUj0Ww+XkCiSfcr453ccD4RI3
 hTtPq14K7WLeczHyI3OgAOvTURohBosbgyEm6KyyTR1RRzEjx7OtROVcxmf8UQLP
 0VKsVvp8OptJoxAa45jIjayw4Rwpnz5wXobNCFeoYDLZb3nZdYV95mTZUZwToUDO
 qW/9hCsr/xLIau/U8M2P76aKr/mPj0RtK5OTWevRpYpqqqYNkJCG3pQOJxM0n6oG
 UrIwfu6uMWp5ZqJjKH3ssj53PvqM6DXgXBWp2n3qp1ab9yS+3PK3cuzipo0xtLJR
 kdomeuFiz78IGAYiv5uzR7f4OsOvt7AbGymNwg/318RmmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0uy3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:43:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8078f1bc588so1808038985a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 06:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757511796; x=1758116596;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5nQ4xWao/W1S9JuuivQg6TVzV1TXFvvS01+Hu/ewF2o=;
 b=tcxwKMIGD2x8IE49FNJqpUnOuLSJKiIVfxPUtEG0DS2xvgyyR1ykaQReDoSVQhsAb2
 PK9AdKBD5OmXa+ZEwenNaChrKZsJKC1JKO52r/GO9ZAgCl56aPdQe4+Df+QGF0NKA+rI
 1dTF3rDN/jX6Bb2hFT17Yq2M2DI3TPvR/hUkovABBln3WOn94IWGwYtJ4T3+E0lQBgiT
 GpujwNg+fxz/MfFWvyH0f8p0FZPcxJwmxxDgpaCEQvTRwE3TfBBmKVT9DtoD1kswXNSC
 n8Bnf0Rg/VoN+mkwMxh//h4EhupbZ1k6BFNZGTay+4B/8xrAxeVIakJK3bSEu5KJrJnN
 DXNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQg03hVh5qaTOVgnGLh1gHL42XvdG3qbw0YZ0oJnIyd2wNJ7mN+enjdD3OyKHJRi/lL1iX/Befu94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQVJoKf7E1v/gyrHI3rjiWq5mbmDZiqPIY2JXXfowupetnDt6Z
 f2yJVMr2x6TUXKRiLeUVDndaGlEvwUnWZS7nGB56nwd2oMKGLW38z7Dw9/SuPGvlcanoWkuv2Eg
 FGfNaUbyfwcjW/fzOcd+J9yCVsYbN47WBKBu8DVuIXP1wlr6NEfxPl0h+wx/c/yCkQRCO1uI=
X-Gm-Gg: ASbGncuWDwCFPvzb69PTwaMptSKEI/S4h9QGCJp77yc4AYNncaQD2i3Q9OgKoRrqgqC
 TqAUm65dgcJsVHnuN9s8W3H7kLSiD7M0TRqAxrZ4xi5YIjRSLv7zBfeFEgOVxk7JNJPNCMuNxXl
 nUuYo1rddPRM6glogvQqKNH++xmUKJ12jXScrGBdPHl1ikcRR5ocxcOW3HDSo3Gkw2dHllYc09c
 4PNYbW5HgwwS8fe51e5N6GWNMo+rP5k70UFx97efY8qprKvP6ZUOfIJHgDVMAcYOnTBfqyZ2ys1
 3rwXrH7itDtZ14R9bTbKwxThh3xOrmvogAoVRe6er+Glh98fa+QzDsLSVSpq5IShbezVkpNNf1O
 EDKzOCNiLdx656N0v9Wp5rqrAn14KKYz/Sks2h1nZF4/33c9s6Z/h
X-Received: by 2002:ad4:5945:0:b0:70d:cc1b:68d8 with SMTP id
 6a1803df08f44-73946e7c091mr163021906d6.60.1757511796377; 
 Wed, 10 Sep 2025 06:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6PHZIhUDI560woSHXbXEfXTfCiGlJ/BbPfkyDjwFSiQx7owU5WH313TRjCymTd7ql0gFT6Q==
X-Received: by 2002:ad4:5945:0:b0:70d:cc1b:68d8 with SMTP id
 6a1803df08f44-73946e7c091mr163021196d6.60.1757511795562; 
 Wed, 10 Sep 2025 06:43:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c4ed3csm43091651fa.4.2025.09.10.06.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 06:43:14 -0700 (PDT)
Date: Wed, 10 Sep 2025 16:43:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 10/10] drm/display: hdmi-audio: warn if HDMI connector
 doesn't support Audio IF
Message-ID: <zjfnbabmnpopxy3r2dbpiiuhspoapc4mvpkha6bfses2mf6gpi@tmp4konlmimh>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-10-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-magic-natural-saluki-4aca9d@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-magic-natural-saluki-4aca9d@houat>
X-Proofpoint-ORIG-GUID: p2vMplOJy7Yi5qnBx3BpXncZzW61CXqs
X-Proofpoint-GUID: p2vMplOJy7Yi5qnBx3BpXncZzW61CXqs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX62EsLAicET2x
 Zz5QwSTrEtPWD/tgSliQKfQuUZNFKczhOF4IDuxRydKXIg1JVqUcoe5YyQQ9hcwFhF4CO0jN4ae
 U/0rWFtTXnGq/bxmKjhBRjPAHs4irhUBrCeGfFrP+/bNBdttZJDCfU5n++hKRgxeNsIjdJaiLwg
 gl5eyVhblnpmP2N7abAbEIzmBlDTco3nLfxai+agFarLMTXOWpGziAgmlVaQsSREwbg04dIZYod
 DsCFzChLTOk0OAqOrCd73EmrBYDUiMEAyosKshaXguHPti1KGWGbz7N7DrEe7LTbLZjrOCjxW5A
 ONlBJM33MYAtxPwd9UTFCYFi3IVJxocb14TEsfCAH0aaJyzg2EYys8CgxOjK2EAcOFMvidokBxB
 /oE/rliD
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c18075 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=41mUuBG4nv7vr-MJPacA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On Wed, Sep 10, 2025 at 01:05:47PM +0200, Maxime Ripard wrote:
> On Tue, Sep 09, 2025 at 05:52:08PM +0300, Dmitry Baryshkov wrote:
> > Sending Audio InfoFrames is mandatory for getting audio to work over the
> > HDMI link. Warn if the driver requests HDMI audio support for the HDMI
> > connector, but there is no support for Audio InfoFrames.
> > 
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Acked-by: Daniel Stone <daniels@collabora.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> > index 7d78b02c144621de528b40b1425f25e465edd1ae..35e0e79cb683a68af813344aa86c154c3a5531fe 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> > @@ -10,6 +10,7 @@
> >  
> >  #include <drm/drm_connector.h>
> >  #include <drm/drm_device.h>
> > +#include <drm/drm_print.h>
> >  #include <drm/display/drm_hdmi_audio_helper.h>
> >  
> >  #include <sound/hdmi-codec.h>
> > @@ -178,6 +179,17 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
> >  	    !funcs->shutdown)
> >  		return -EINVAL;
> >  
> > +	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> > +	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
> > +		unsigned long supported_infoframes =
> > +			connector->hdmi.supported_infoframes;
> > +
> > +		if (supported_infoframes &&
> > +		    !(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AUDIO))
> > +			drm_warn(connector->dev, "HDMI Audio with no support for Audio InfoFrames\n");
> > +	}
> > +
> > +
> 
> That's not what I suggested. What I suggested was that we tould check
> the return code of write_infoframe, and warn if it is set by the
> framework, but returns EOPNOTSUPP.

I see, I misunderstood you then. I will respond to the comment at patch
1.


-- 
With best wishes
Dmitry
