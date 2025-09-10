Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73536B51B8D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C265910E94A;
	Wed, 10 Sep 2025 15:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnBs/seS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A7210E946
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:27:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgSqL021325
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=puSANwQMuC3k5u9lWMb//CpM
 B7GZAwNZLvNRyhx2W3w=; b=jnBs/seSfYzHK1BgVJGtb+niIIAFKhQTmCGWELls
 0vNK/c6eC9FjQD2y/BHG40XZutlLZni1IPrNgq2q++P8+77GYQvZ3ZzU//CRJVbw
 Vbf4JA6udDwpsjsRVWZYPeElIUdwJnJkxOIOBl+dgMEe02YseIY7dgqKYLTF4gvL
 +o9VtQoEDQmaavzLGESvWGoTi+YfG97Zj/qyd6ePc//7IAysNf9AKwgT1N+GllDk
 q87VUrxIEG61wur7PXKm6pnHFHSwFlcZwHpGQvfGDWOz9NLaY9Hk0kGkzw7cugH6
 Mjyb35NfPWbzU1AhBQ7eMG3YA9hRBM7AzZ/vOwVrzMBjYw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by949ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:27:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-724ee8d2a33so145411106d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 08:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757518021; x=1758122821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puSANwQMuC3k5u9lWMb//CpMB7GZAwNZLvNRyhx2W3w=;
 b=sZUyW1sW97UWksHGqbJeK+t5u/dy19jp0lvR3lab6NFHSJlXsOJRFE7TB5lnyq1kbd
 JzWqOannwjh1/oCB56P0jMZEgbkFso8+DMOOS5+KTnPL0+QFLQH6g5P9Dkp+QdKxIc1g
 vkFPhLvEgXPVL8WDyQNDxBBjcL7uRwM5sKpnO6stGPk0E9HWShPjLLT6trlwoQYyB/dN
 0p2GgHfvhNWXkZU4efoMkBi42dL0En1CcN9QlVwc8nDBepFYoGRGbWSto9bGTLvVP0cC
 GQ1zBsMCl+0XEjn2I2KUuhb48YFVwLlTh3ZzM54U4FOhoRNy+1SO4p8f8nRqtx2sqQS6
 gxYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0OAWXnVXZPnpRWw08fUx3lOl1f0/41M2wu5MdvQ+DcpR3x8lsu54KI3Qb+kCw2qzBGLk/lNLztiE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHeHGLTMW0JzW7JJqHiIyl5WLoLA0iJMirWSX+J+n+rX70W7ua
 D5ki/ORJ2A2UVf+lz6UHpyOuufSFlh/KH1z8epnRTT188K1Ayhw0BFJXxdO/1y/8e2YYGJuCRNp
 rTKu6aWEgBPFn0tG6+W55o05RSOI8CRwhwxTG/k7O1qSKHuJtMx3ysk3pMkL5ytAYq9nZ6Tg=
X-Gm-Gg: ASbGncvFuof78epOY1kCnGjS9VKFtkzskTdiO/7QUhdh4AYIikVirjuVJY+RpWiwwwL
 76caTGi3hz5oUm+h7N1VYpLK9n11pw3dbBZsm0+HsvJLTUXs3m0ICtXnLgbMOrN7HeuGJYvUW9e
 w1MrnUL7X3eKvOGB77ZdG8G5S9c6W+2SJC2QJenX9oWEr+N5Z2T7xzi3aIY2ozHwMqjRc0w8xGd
 +eGXdvuPBa24GVdgGWaR2Jsyr2jpkZa9WSY+tlVAoPT1asN20H9z3MIeRQvUCxmmOc/O305b8Dk
 kB9nWjn8h3gg8d4fiNojFqBIDoQaKRH6acIS80fPw+MRZcSoqrJFNGo+cgOkJky3urpXJm2Kz13
 RjtEmPlWqucGjcpBmqhzCHOTauBrKc3wvSXz4p7ydID3PRZ3eaw9L
X-Received: by 2002:a05:6214:4011:b0:71b:9c1f:cf12 with SMTP id
 6a1803df08f44-73945f32dc1mr174306266d6.58.1757518020668; 
 Wed, 10 Sep 2025 08:27:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSqNO186cIoAHAKlnokZkMKBuXP5cQFNS2RrYtd4hs3FssG7kXyhj56TM6QwnKBI2jq/m+4A==
X-Received: by 2002:a05:6214:4011:b0:71b:9c1f:cf12 with SMTP id
 6a1803df08f44-73945f32dc1mr174305236d6.58.1757518019762; 
 Wed, 10 Sep 2025 08:26:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50a263esm43434641fa.55.2025.09.10.08.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 08:26:58 -0700 (PDT)
Date: Wed, 10 Sep 2025 18:26:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
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
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <x562ueky2z5deqqmhl222moyrbylfwi35u4hb34dpl3z52ra4c@dyw4iayrewnz>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
 <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
 <20250901-voracious-classy-hedgehog-ee28ef@houat>
 <voknqdv3zte2jzue5yxmysdiixxkogvpblvrccp5gu55x5ycca@srrcscly4ch4>
 <st6wob5hden6ypxt2emzokfhl3ezpbuypv2kdtf5zdrdhlyjfw@l2neflb4uupo>
 <pe6g2fanw65p67kfy5blbtiytngxmr6nkbazymojs4a66yvpl3@7j4ccnsvc6az>
 <20250910-didactic-honored-chachalaca-f233b2@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-didactic-honored-chachalaca-f233b2@houat>
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c198c5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CmvywbfrPJ7p_AD0WAgA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 03MihHVaoKTzQlLMDO1yhKfYl1Ui0-9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX+3bh/A+pl1vf
 XOAaEEUoyM5NZoVR/yWU/x805Ukrql9qf3LJ380j7tGLQB15eTO8Kzlrr/CWqsYEjfxl5FsWNQ4
 msVSZ7B7mdjwTWc/+LX4zQ9cvj5vB0xXRWAlAkAZ88fC+qfHGCqaDruodNcDYFeUdtTxW+/UZEl
 GWBsa1jWxtw+K1uc+OsVDphXtWhp9v4G/jYFR/taRgNX93Gw8zlm6EsBohVM51Sok2myzCB5j5V
 mU1P1oFqk44AVwz4+9XEA905k/NP/Nppmbjfd8wAUoQ2GaHtCCa8jSMvmgNyxzEXtawPIvBZVQ4
 1MAMJZ39pRx4y2NbTzv8RJxTz/xqkgQ4Hl3sSKf2B/ncBQJZMY9m808TkxPf1Ogpox9SkxpN0lg
 uyvwCXcr
X-Proofpoint-ORIG-GUID: 03MihHVaoKTzQlLMDO1yhKfYl1Ui0-9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Wed, Sep 10, 2025 at 09:30:19AM +0200, Maxime Ripard wrote:
> On Wed, Sep 03, 2025 at 03:03:43AM +0300, Dmitry Baryshkov wrote:
> > On Tue, Sep 02, 2025 at 08:06:54PM +0200, Maxime Ripard wrote:
> > > On Tue, Sep 02, 2025 at 06:45:44AM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, Sep 01, 2025 at 09:07:02AM +0200, Maxime Ripard wrote:
> > > > > On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Baryshkov wrote:
> > > > > > On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > > > > > > Hi Dmitry,
> > > > > > > 
> > > > > > > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > > > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > > It's not uncommon for the particular device to support only a subset of
> > > > > > > > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > > > > > > > a model of ignoring the unsupported Infoframes, but it's a bigger
> > > > > > > > problem for the userspace: we end up having files in debugfs which do
> > > > > > > > mot match what is being sent on the wire.
> > > > > > > >
> > > > > > > > Sort that out, making sure that all interfaces are consistent.
> > > > > > > 
> > > > > > > Thanks for the series, it's a really good cleanup.
> > > > > > > 
> > > > > > > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > > > > > > packing it into the two GHDMI banks. So the supported set there is
> > > > > > > 'all of the currently well-known ones, plus any two others, but only
> > > > > > > two and not more'. I wonder if that has any effect on the interface
> > > > > > > you were thinking about for userspace?
> > > > > > 
> > > > > > I was mostly concerned with the existing debugfs interface (as it is
> > > > > > also used e.g. for edid-decode, etc).
> > > > > > 
> > > > > > It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> > > > > > HDMI also have those. I don't have at hand the proper datasheet for
> > > > > > LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> > > > > > generic).  Maybe we should change debugfs integration to register the
> > > > > > file when the frame is being enabled and removing it when it gets unset.
> > > > > 
> > > > > But, like, for what benefit?
> > > > > 
> > > > > It's a debugfs interface for userspace to consume. The current setup
> > > > > works fine with edid-decode already. Why should we complicate the design
> > > > > that much and create fun races like "I'm running edid-decode in parallel
> > > > > to a modeset that would remove the file I just opened, what is the file
> > > > > now?".
> > > > 
> > > > Aren't we trading that with the 'I'm running edid-decode in paralle with
> > > > to a modeset and the file suddenly becomes empty'?
> > > 
> > > In that case, you know what the file is going to be: empty. And you went
> > > from a racy, straightforward, design to a racy, complicated, design.
> > > 
> > > It was my question before, but I still don't really see what benefits it
> > > would have, and why we need to care about it in the core, when it could
> > > be dealt with in the drivers just fine on a case by case basis.
> > 
> > Actually it can not: debugfs files are registered from the core, not
> > from the drivers. That's why I needed all the supported_infoframes
> > (which later became software_infoframes).
> 
> That's one thing we can change then.
> 
> > Anyway, I'm fine with having empty files there.
> > 
> > > > > > Then in the long run we can add 'slots' and allocate some of the frames
> > > > > > to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> > > > > > 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> > > > > > salvaged as another generic one)). MSM HDMI would get 'software AVI',
> > > > > > 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> > > > > > want to use). Then the framework might be able to prioritize whether to
> > > > > > use generic slots for important data (as DRM HDR, HDMI) or less important
> > > > > > (SPD).
> > > > > 
> > > > > Why is it something for the framework to deal with? If you want to have
> > > > > extra infoframes in there, just go ahead and create additional debugfs
> > > > > files in your driver.
> > > > > 
> > > > > If you want to have the slot mechanism, check in your atomic_check that
> > > > > only $NUM_SLOT at most infoframes are set.
> > > > 
> > > > The driver can only decide that 'we have VSI, SPD and DRM InfoFrames
> > > > which is -ETOOMUCH for 2 generic slots'. The framework should be able to
> > > > decide 'the device has 2 generic slots, we have HDR data, use VSI and
> > > > DRM InfoFrames and disable SPD for now'.
> > > 
> > > I mean... the spec does? The spec says when a particular feature
> > > requires to send a particular infoframe. If your device cannot support
> > > to have more than two "features" enabled at the same time, so be it. It
> > > something that should be checked in that driver atomic_check.
> > 
> > Sounds good to me. Let's have those checks in the drivers until we
> > actually have seveal drivers performing generic frame allocation.
> > 
> > > Or just don't register the SPD debugfs file, ignore it, put a comment
> > > there, and we're done too.
> > 
> > It's generic code.
> > 
> > > > But... We are not there yet and I don't have clear usecase (we support
> > > > HDR neither on ADV7511 nor on MSM HDMI, after carefully reading the
> > > > guide I realised that ADV7511 has normal audio infoframes). Maybe I
> > > > should drop all the 'auto' features, simplifying this series and land
> > > > [1] for LT9611UXC as I wanted origianlly.
> > > > 
> > > > [1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/
> > > 
> > > Looking back at that series, I think it still has value to rely on the
> > > HDMI infrastructure at the very least for the atomic_check sanitization.
> > > 
> > > But since you wouldn't use the generated infoframes, just skip the
> > > debugfs files registration. You're not lying to userspace anymore, and
> > > you get the benefits of the HDMI framework.
> > 
> > We create all infoframe files for all HDMI connectors.
> 
> Then we can provide a debugfs_init helper to register all of them, or
> only some of them, and let the drivers figure it out.
> 
> Worst case scenario, debugfs files will not get created, which is a much
> better outcome than having to put boilerplate in every driver that will
> get inconsistent over time.

debugfs_init() for each infoframe or taking some kind of bitmask?

-- 
With best wishes
Dmitry
