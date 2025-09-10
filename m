Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E68B51B32
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC96D10E279;
	Wed, 10 Sep 2025 15:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5Fq26fY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FA910E279
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:16:31 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgPGx003828
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kKm0FaL1IsnsJ1lRYNU+N3Fz
 JdUYvVMh5dXRjU0QCk8=; b=p5Fq26fYWFQBv4jsqwoICAN3BPzWKiJ1nDETM99M
 qYaJAlGyDaaHmKO1z93fcVW5AWkmOt1ObtdBYRcfscs2Dt3fBbzvs/SnkRo7Ifc7
 7qQs49X1iUmV7tciI/bLswt8v/1P0apmUMCxq2pWlPemmfz0K+EN1BqxZmDlcNZl
 bLdSmNTQrd3J1EQJDwspX2Q9ESFL4yeilX8M+0j6cs5FnriK3LpIIxOF/IS2qvFW
 h2XMguo7EqCiriV+JKtDR6nQZ029MA6bgpufcFu2wyf6OrdEfBOOq63E4qNt7jkc
 OXyLqkyUxTB3D9koO2CbE2l2L4cEK+a9ar/TSU1vg9bq9Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg42st-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:16:30 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-892460241e3so10043591241.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 08:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757517389; x=1758122189;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKm0FaL1IsnsJ1lRYNU+N3FzJdUYvVMh5dXRjU0QCk8=;
 b=kpbHC9AxwRXdKXvX33twV9VUnVM03c5GMn0f9Z0mj5Hyapq7P0U7vw7cGGZdO3Vkqq
 OD2zduIQZK0VPrs9E9aP1tFIbgDYYWwRE/hRsueSnZ+G/b4yTW9DKDfW9dXtTqZeKT82
 Mdq1NkgspC0tpZ9jH/BgKaPrNeXicc/ddAMF8IuFbM25iIwmhOvKHWXvLiFgvz2hL31g
 5WLzlf51bSrKXfl+xxL3VSC0QIMnVc7v3c06AVCoGACvErEFlRzsk/jjbB+fUmfCWzur
 gXkttQ1hilzumvvVBb3tQSP3SLeMo/3CwxrRbwjoazsXwW8r2z7oy/1VQoGZ5mdaM0MM
 dtug==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5FLZTPHly+m7M2IJfsTezu4DqncXq49fpHIdnzep4TVUam390p9uw3lnhOtLqm3jr2uXuVrA6/to=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMStbXDl37emXoK55tTZ3HTxIa3q2C47uEmxgz/jd2MU7SNkUc
 yRzSS7TlbLiWJonRdD6zPhfQwNfK3/Z3LdniZcnVLx0CTRTwOfUllg+QMesbiEVnkc7RXhnb0eY
 YLxqmsbpdJE3yH7PVv1prSFvcpa6Qsek6is7DhD2a3sXe9dIACh8usvITRZ1ZtN7lPFbNgv4=
X-Gm-Gg: ASbGncvG1xYbz6hGlV/6oVlWJBSbk8+anEd6lR/qEZ5SDaAXRtBFth26A1HH67mgirp
 BM3vDO7YQVFg/JSwX5yy9k0JykitrGRf90s53zAm68pGWnqPAGEmfoywyp4hEasabjquGy+HBG8
 DNn1o4FuUuMqaOPh3rLqaGk5omtW4BqVXRrYIS7fPVelq7K3WgVByJS9wFEGSjjLqkVEl/r2vTG
 OW6ycMFivvBLJ0WmB4XW259/76lt34mczjJRZ1w7E+sMbPu/jkhvElkcWSXoBHwaJ6pqQiQ0lMg
 eff0rmk7u7lZj0VJXJx7+I7ajxQLMcRDhnsLm1KkjiP79sCwAedQGSRuRN5MSuU66JPuZVc5uGL
 wgWPBt3OVqTfUGFiorlqzIMJUjr5SC4Xday03sDgkFrZXl7yLvaha
X-Received: by 2002:a05:6122:2a42:b0:543:6ff8:d6d7 with SMTP id
 71dfb90a1353d-5472a0088bfmr5155455e0c.1.1757517388995; 
 Wed, 10 Sep 2025 08:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV+Ok0B9ImEfUJn+5MDsBCd0a1EnbrepGzoV/kCIfMR/JnpVKik3JbAUvvY8M2wWHlz+5tjQ==
X-Received: by 2002:a05:6122:2a42:b0:543:6ff8:d6d7 with SMTP id
 71dfb90a1353d-5472a0088bfmr5155361e0c.1.1757517388194; 
 Wed, 10 Sep 2025 08:16:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680c4246c2sm1301330e87.17.2025.09.10.08.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 08:16:27 -0700 (PDT)
Date: Wed, 10 Sep 2025 18:16:25 +0300
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
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-furry-singing-axolotl-9aceac@houat>
X-Proofpoint-ORIG-GUID: W5vcHBM2xJsLrsUEOfhKaQ8leSy49VD_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX01bQrONjxHZd
 hzYKbfz19gEQdBBpGVsOwiEY66Wc94Dbm7Sc4LFlyQn5+Ic0V6lz5eHqlcq2FFMsTrls2nL3Av+
 cmMDejmUJoTV/jQp6zfbxbQFLZiURs4ggzaTOZMd6vVgp2kRHs6aOI8tTeYpTTSR6ucqDgutnzE
 0Wh+d0ni0AN0GP7/O+NphIsqzegp/oEv2aozEXO/ZQLt+EX0bsCF/QatEjERTy2LZkLwPHWujJc
 NNlFfS0OERP7ksXfLXqyJyu2wff9azc0/NU+Zes6+OQLNskG5P9LJD6hJWtZsoOWQi3woO8pHjh
 6T1LqXe3VZuRCg5pJsDciXQyLI4Lh5Ami1cq3DQm220Z7K0NjzWKoAhunMD0CgrBbcOvT/YFJsA
 FHV3jOvn
X-Proofpoint-GUID: W5vcHBM2xJsLrsUEOfhKaQ8leSy49VD_
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c1964e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=Hspkq7dj2dKET-HI0ioA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

On Wed, Sep 10, 2025 at 01:03:47PM +0200, Maxime Ripard wrote:
> On Tue, Sep 09, 2025 at 05:51:59PM +0300, Dmitry Baryshkov wrote:
> > Currently DRM framework expects that the HDMI connector driver supports
> > all infoframe types: it generates the data as required and calls into
> > the driver to program all of them, letting the driver to soft-fail if
> > the infoframe is unsupported. This has a major drawback on userspace
> > API: the framework also registers debugfs files for all Infoframe types,
> > possibly surprising the users when infoframe is visible in the debugfs
> > file, but it is not visible on the wire. Drivers are also expected to
> > return success even for unsuppoted InfoFrame types.
> > 
> > Let drivers declare that they support only a subset of infoframes,
> > creating a more consistent interface. Make the affected drivers return
> > -EOPNOTSUPP if they are asked to program (or clear) InfoFrames which are
> > not supported.
> > 
> > Acked-by: Liu Ying <victor.liu@nxp.com>
> > Acked-by: Daniel Stone <daniels@collabora.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Again, I still believe that it's a bad idea, goes against what the spec
> states, and the framework was meant to be.

Please correct me if I'm wrong. The specs (HDMI & CEA) define several
infoframes and whether we should be sending them. If I'm reading it
correctrly, CEA spec explicitly says 'If the Source supports the
transmission of [foo] InfoFrame..." (6.4 - AVI, 6.6 - Audio, 6.7 MPEG,
6.9 - DRM). For other InfoFrames (6.5 SPD, 6.8 NTSC VBI) it just defines
that sending those frames is optional.

We can't even infer support for InfoFrames from the Source features.
E.g. CEA 6.6.1 defines a case when digital audio is allowed to be sent,
without sending Audio InfoFrame.

As we will be getting more and more features, some of the InfoFrames
or data packets will be 'good to have, but not required'.

> 
> So, no, sorry. That's still a no for me. Please stop sending that patch

Oops :-)

> unless we have a discussion about it and you convince me that it's
> actually something that we'd need.

My main concern is that the drivers should not opt-out of the features.
E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFrames
(yes, stupid examples), it should not be required to go through all the
drivers, making sure that they disable those. Instead the DRM framework
should be able to make decisions like:

- The driver supports SPD and the VSDB defines SPD, enable this
  InfoFrame (BTW, this needs to be done anyway, we should not be sending
  SPD if it's not defined in VSDB, if I read it correctly).

- The driver hints that the pixel data has only 10 meaninful bits of
  data per component (e.g. out of 12 for DeepColor 36), the Sink has
  HF-VSDB, send HF-VSIF.

- The driver has enabled 3D stereo mode, but it doesn't declare support
  for HF-VSIF. Send only H14b-VSIF.

Similarly (no, I don't have these on my TODO list, these are just
examples):
- The driver defines support for NTSC VBI, register a VBI device.

- The driver defines support for ISRC packets, register ISRC-related
  properties.

- The driver defines support for MPEG Source InfoFrame, provide a way
  for media players to report frame type and bit rate.

- The driver provides limited support for Extended HDR DM InfoFrames,
  select the correct frame type according to driver capabilities.

Without the 'supported' information we should change atomic_check()
functions to set infoframe->set to false for all unsupported InfoFrames
_and_ go through all the drivers again each time we add support for a
feature (e.g. after adding HF-VSIF support).

-- 
With best wishes
Dmitry
