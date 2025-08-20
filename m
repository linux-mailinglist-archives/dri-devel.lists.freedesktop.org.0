Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C973B2D938
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 11:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EA610E253;
	Wed, 20 Aug 2025 09:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzYC6Chp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F29C10E253
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:52:50 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1org9031108
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vS/mAyLr2b7OYnR7JU7D3yhv
 4WGKliyobGTdxLp6JGk=; b=kzYC6ChphM9DjkW+m3Y2ie9m0ho+HuIohiI6AXbn
 TevF+7Exk39Pz0riittMo0GLI+th9Te8QDV00MGqOyvKojU9uBUfe3/2I0Pvumb2
 VHbU4TvkmmWpIXSinhNVwY2JTGbRI45gddHGk6QI+/kVPeg9+PJm2c9JGgUtSenj
 RWvXOL6YBwLCbXPucUBE3uzsAYrJ0Db1Yb2s32sYJ5Q2ot0HE2TO3/joGXt251fg
 +itwixEEZvS1drv/pkVVivZEwULllBWP2yUyXrBQxXCnkyS569qOvlgbvPVaRbU4
 0q9Ln385/pTvBYksAd1HlNCUR7eaIC5gGG22ZdlZy4Mw7g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dh87a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:52:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70baffc03dbso11354066d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 02:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755683568; x=1756288368;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vS/mAyLr2b7OYnR7JU7D3yhv4WGKliyobGTdxLp6JGk=;
 b=Hukg/xiuFf5SAYZsCP+/GWeu1sQNykJPkahAOWThYzQn9HwMNAHEDzG5iV1BdJZJC/
 YDeCsWdtU99YwM0lDNQ9QZrdsXwbbOTFltWEvJ128sMS1tLL4Kxn1RU6Rj/ykDyJGAWr
 rrmgkXKVAThvus/TUcmjRr3fEt5/flDR/OoUbMJLQP2JwnnfmdfUh+7GeoR+Ek5YWIRa
 QKf5gwnX5hB7Hqm5Y4iNpg3cEYJNRr0/7gB/HIs26CZuEbOENV0zCcEn3ysvs1zyiET0
 p+yzUqckbM+xgFbbGlp3msGxxYT2hzxZkLaVXTt7KaXZ+CmrZZIx4Mx0sPfsuHYYDSuJ
 Uj6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/uuRe8tlqRCklRQO1+TRXslNJ6T6LC8kfV2QhGRMVeX0aeflfpvElZv1VF/0d+1FhvAmy/dtiIyY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQVpDDHj5hFlbR0xQYPUA7F0EYz3Tg540hH0/uVf4DiMXc7Xg5
 09/qL+uuleJI6kd+ZlrL2xjJLSCTCFTzqv/wUxExCQQpnVSv80d9TAC03jUUFKlzeB4zrenMk/M
 JbEj6xftqy1nyBOhZKnKKJ8R1jF8OGJ/SWeNVEIX9BF/QDbxMviQ08pp1Cb7e/ATUL4cLT38=
X-Gm-Gg: ASbGnctfVQ9Wp7LiJJmPN/m+wyCvFkKO7pWueGb9uJ2VB44A6XuxybqQld2BRPO9oi1
 6PhYA23zY/KOED23f1sr5KyLXA8MMM4pI1nCDaJPXj+xK64UWS+FP7ubM75ZivyFT1+n4fBHX+H
 0y0Rb2AGewmJVXcs9RmeIZGVxqSqnmJBg+hJ1QmhM8FWdvnYdzkz2B74i4AtBAW8H0yOkC5jI5M
 0yvExM1Qs7RoEKqsBdFRdqI/XRA60dNUwW4HQwqTdK5e3IElVjxF9AkhpzHJCFW7R67OuTRtERa
 W4TrTJsrD7T62TljgJRSp8sYksWE6lBtlv+Qm+3+XBo0LIYC8Tq8cXhGTZWXCK06cvgrO2d5e47
 ng1xas/ddWSsLBP3TSvdAOFVS6BnxavyihMONnTF0SD2SL2jeOqkO
X-Received: by 2002:ad4:4ea1:0:b0:70b:ca78:4f52 with SMTP id
 6a1803df08f44-70c67846f04mr66771696d6.14.1755683568410; 
 Wed, 20 Aug 2025 02:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNbZVfxSxGCwPd3oehLj8RTp0Pg/kMsu5jl3xY9Xrr59eonPeKRysDyx2GcL/dNxiu6DA0/Q==
X-Received: by 2002:ad4:4ea1:0:b0:70b:ca78:4f52 with SMTP id
 6a1803df08f44-70c67846f04mr66771546d6.14.1755683567880; 
 Wed, 20 Aug 2025 02:52:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a48b46bsm24544711fa.36.2025.08.20.02.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:52:46 -0700 (PDT)
Date: Wed, 20 Aug 2025 12:52:44 +0300
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
Message-ID: <v7w7xkefm6ap7delx7wsvxmc76fwptqhe4ehokzfh4baueb7hr@acrx36exv42v>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
 <20250820-artichoke-silkworm-of-election-521b5e@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-artichoke-silkworm-of-election-521b5e@houat>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+91a0TCPLXWC
 IyGUgmbPG+TqiCcMuVClc8MOYzIuFgUa1euKNNBzbfamvw0ABiZZfHrzsXbHrxBnmqdKetpBAvH
 aI+sZQsMh7AhgEGi/4u67VZoovJSt4TTbP1R5gPidYU2orcABCfTs1Pt4ubFiLGrUPbkJfBXw3k
 kvoSIE+HFsVoK3XkSjC0NI60dQl30ztH0g+bidtuTDBq8Rlx4An6ZPUVJ4saAHQ9rHzGcrV+Rgk
 76fDDXBGvnDAMUhFnoLaW18SzOlNrBQ+B7J5yxADjnxadTb72kHRF/aStHyRKv5OiETyX/ZQEMt
 2/caCLo8Z/XOaEzPSq6tLLFAssBr9SUyMwAsqtHA4Oc9bZ3LuoCSB+X19kc70XYR3kGOmrMivZL
 T4Cr/YELsC3bmym9c1N1iZys8fQxfA==
X-Proofpoint-ORIG-GUID: y2ajbMakh0Siztvhrp5r_ndy8aKLG_6B
X-Proofpoint-GUID: y2ajbMakh0Siztvhrp5r_ndy8aKLG_6B
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a59af1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lQ937gVn5cPVmAjJ5oIA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 09:15:36AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Aug 19, 2025 at 09:57:30PM +0300, Dmitry Baryshkov wrote:
> > Currently DRM framework expects that the HDMI connector driver supports
> > all infoframe types: it generates the data as required and calls into
> > the driver to program all of them, letting the driver to soft-fail if
> > the infoframe is unsupported. This has a major drawback on userspace
> > API: the framework also registers debugfs files for all Infoframe types,
> > possibly surprising the users when infoframe is visible in the debugfs
> > file, but it is not visible on the wire.
> > 
> > Let drivers declare that they support only a subset of infoframes,
> > creating a more consistent interface.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I'm not really convinced. Infoframes aren't really something you should
> ignore, AVI is effectively mandatory, HDMI kind of is too, AUDIO is if
> audio support is enabled, DRM is mandatory if HDR is used.

Nevertheless, sun4i, innohdmi, adv7511, it6263 and rk3066 drivers
provide support only for the AVI infoframe.

Some of them can be extended to support other infoframe kinds (e.g.
ADV7511 has two spare infoframes which can be used for HDMI and SPD).

> SPD is indeed optional though.
> 
> So, it's really dynamic in essence, and not really something we should
> expect drivers to ignore.
> 
> I do acknowledge that a lot of drivers just silently ignore the
> infoframes they don't support at the moment, which isn't great either.
> 
> Maybe we should standardize and document what drivers should do when
> they don't support a given infoframe type?

The chips might be generating infoframes internally. This series was
triggered by LT9611UXC, which does all HDMI work under the hood in the
firmware. See [1]. The series I posted hooks HDMI audio directly into
the bridge driver, but I'd really prefer to be able to use
drm_atomic_helper_connector_hdmi_hotplug(), especially if I ever get to
implementing CEC support for it.

ADV7511 likewise generates audio infoframe without Linux
help (audio-related fields are programmed, but it's not the
infoframe itself).

Maybe I should change documentation for this field as 'support sending
infoframes generated by the Linux kernel'.

> Something like return EOPNOTSUPP if you don't support it, and we warn in
> the core if we get one for a mandatory infoframe?

[1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/

-- 
With best wishes
Dmitry
