Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FB4B41119
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 02:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E68310E847;
	Wed,  3 Sep 2025 00:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/8geawS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA1A10E846
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 00:03:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqBAK032203
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 00:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ELwTy4rK8lnamkj6o0BDI8Zg
 I9xpMe8TBXkmXU6Ff4Y=; b=L/8geawSjS+VL1ZqTEgE8/z4TydMsfUSymwbusYa
 x5yqL9GceOJwG0ZxmmdLBQzB1mvsQ1HfQlUPkbvRxtEXxTmpt6RWQx/ce9nwXC1R
 eZ8dJFL5So11f0KIlnvTxYQBM01hgSFNUYwDT8rJbk+Z5ey21Zpph7dh7tB7RcX7
 KRaJSiHcstOdbbK1nJf1nFONIF4vwWckmJZ3STK2IYc+fJdXBeBq6L+oyZmfu6Xj
 jEa6R4LtlgHaEJcSDDMkTtB62xEwGgPLZqFCu7+OwMR/G4ZYHoy/YAKVIdznpTMW
 btHrcrdtCaIvwsv3H8DEeqta8NH51Q9gKWb/2qkUNHii5Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8sjc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 00:03:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-724ee8d2a33so974886d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 17:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756857827; x=1757462627;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ELwTy4rK8lnamkj6o0BDI8ZgI9xpMe8TBXkmXU6Ff4Y=;
 b=e/ohBczKBIZdC4bn3fUh+UFFeaLg7iXrh9sBHstkKTL1eeSti0VjacgyP8SGv8hyOk
 k0a4+FdHT+0uj/TI30LB7zsJ4u3fbEoWbrluN8SQFJwFo3oQyDXPUbkQeGHGWjBtAOEr
 jyICWP6wbakCopk+pXPRL1TvXjxVgeV+z0yIbnnm4I84OSU3EOHTKZs2Z4Gr7p+Xo0g+
 XDZlSwCbeQyYGjyllAEeGrD9MqFDtq1EyWwacdMexKzXehLj8zEzKyJnkA9kdrvWT/7g
 w/zTH5MqSVBNk1ieGf2MeoCMVvwaDDBz8JuJ9lv6tOw4hAA7i627yXA/Y6EAkBmc+4S1
 QJKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzEHmqhoc/EhdZ2eSemSd6/XlzmKvtBr2tdkqNPgRpZmDYiwkZTcE3+UjNCxKFSKYha76fMjBJkQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbx5I1yAFwsFvsDhyWwvIkFjkH9iw6APU7R9l2a0MQsx89psIU
 xAur1LYB4LOCvpPwNhilYmpDs9+T7G8tsrNWZq+w71OSVEYIfjrG6RIEfMJ+iO8nnn9m9Q6Z8/K
 67KDATFrGLd2WGVMYmQYhACg3kLAybIkjhUcpHr56CNrqFdaPjlidakmhqzU/cQ4k7v1IFf4=
X-Gm-Gg: ASbGncsiPi+iSxUphZKZ6p1rAiSS9HJDd/CzOP3AaUCCiTAjk0cEli6b4u2a28Qj4/q
 SHivc+7BsfIIU98xRg5Fo/cJFOOSps4wxVNFdfgcPOO5irCBtwGQdrrtf0khNjvCVvVdFlaaiEY
 R/1xcap31GmVrE9D3LMxKCcGGdoBudIfiOeyqkqPQ1SmyTxfb7PrGlMkBRu2VqoZFE/dgMvJBdJ
 X+irFeHdeJWtnpRKs5CroXV2FNs/GAUPJyDZBnqf9TozuTt7geuCk9GXY3eVu0EAKii0cAN59qz
 IFwR64hcjNOwZeq2VPtGFK/wkyCnldwt00vc39+00hvDtWGQvS8oBsedfJnGjaHu6LBMCRSlz24
 Ix+VV7viUakSjXpZRUnb5L34sOEdHjEZQZjYLkHWdFH7zA+op3Ev+
X-Received: by 2002:ad4:5f87:0:b0:707:5b4e:587e with SMTP id
 6a1803df08f44-70fac7806ccmr199294596d6.25.1756857827306; 
 Tue, 02 Sep 2025 17:03:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMuG9yw8tt7JLfmbhrVrt89A0reycbHukEsCqIK+5fK6gS8LGclRbsEL6lCQ/NbdLcAxNQCQ==
X-Received: by 2002:ad4:5f87:0:b0:707:5b4e:587e with SMTP id
 6a1803df08f44-70fac7806ccmr199293896d6.25.1756857826617; 
 Tue, 02 Sep 2025 17:03:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfc24fsm117321e87.104.2025.09.02.17.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 17:03:45 -0700 (PDT)
Date: Wed, 3 Sep 2025 03:03:43 +0300
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
Message-ID: <pe6g2fanw65p67kfy5blbtiytngxmr6nkbazymojs4a66yvpl3@7j4ccnsvc6az>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
 <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
 <20250901-voracious-classy-hedgehog-ee28ef@houat>
 <voknqdv3zte2jzue5yxmysdiixxkogvpblvrccp5gu55x5ycca@srrcscly4ch4>
 <st6wob5hden6ypxt2emzokfhl3ezpbuypv2kdtf5zdrdhlyjfw@l2neflb4uupo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <st6wob5hden6ypxt2emzokfhl3ezpbuypv2kdtf5zdrdhlyjfw@l2neflb4uupo>
X-Proofpoint-ORIG-GUID: rQ5KeBWGfQhhaSyadoCLSKQ_FD8U4hZ5
X-Proofpoint-GUID: rQ5KeBWGfQhhaSyadoCLSKQ_FD8U4hZ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX2N7NpzmaAizN
 IF5SxVFqfQh4gvo05PiL/fLPOCy/j5VHHY97ISYEaUV4tALmOZLPLK4+fu3J7h6AD+3eoD6WBF9
 AA9t6VuZ/3ZY0Vx+Io9vzC/diGFTonPlmaume2OqKyeK1ZzcO1S5wbA4aOCndVRbpZFuMRdEhwU
 /FwJg5QU7pLre5JL20zLQMvlu0ig94t7G9XKwD8PPIPE2wzvnyrRsA1M3uDq0RcdEPqMsW6mu+Z
 VycS4dd9hLK9WKpZHXAHvH9IdhMkd+9EaOdN7Aao+cHxjG/ESDpfHJH0x6srYxUoyFoCjaS7h7F
 ecv2r4VDW+qXJ4OcIW4MK+uDr366Zun83kcFR14c0n1jpYwr7XmPt6H0pybVJXtxDmC1+/C3oU3
 3gnxC8Go
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b785e4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Tw3xx-O0H7r42Rls10A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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

On Tue, Sep 02, 2025 at 08:06:54PM +0200, Maxime Ripard wrote:
> On Tue, Sep 02, 2025 at 06:45:44AM +0300, Dmitry Baryshkov wrote:
> > On Mon, Sep 01, 2025 at 09:07:02AM +0200, Maxime Ripard wrote:
> > > On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Baryshkov wrote:
> > > > On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > > > > Hi Dmitry,
> > > > > 
> > > > > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > It's not uncommon for the particular device to support only a subset of
> > > > > > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > > > > > a model of ignoring the unsupported Infoframes, but it's a bigger
> > > > > > problem for the userspace: we end up having files in debugfs which do
> > > > > > mot match what is being sent on the wire.
> > > > > >
> > > > > > Sort that out, making sure that all interfaces are consistent.
> > > > > 
> > > > > Thanks for the series, it's a really good cleanup.
> > > > > 
> > > > > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > > > > packing it into the two GHDMI banks. So the supported set there is
> > > > > 'all of the currently well-known ones, plus any two others, but only
> > > > > two and not more'. I wonder if that has any effect on the interface
> > > > > you were thinking about for userspace?
> > > > 
> > > > I was mostly concerned with the existing debugfs interface (as it is
> > > > also used e.g. for edid-decode, etc).
> > > > 
> > > > It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> > > > HDMI also have those. I don't have at hand the proper datasheet for
> > > > LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> > > > generic).  Maybe we should change debugfs integration to register the
> > > > file when the frame is being enabled and removing it when it gets unset.
> > > 
> > > But, like, for what benefit?
> > > 
> > > It's a debugfs interface for userspace to consume. The current setup
> > > works fine with edid-decode already. Why should we complicate the design
> > > that much and create fun races like "I'm running edid-decode in parallel
> > > to a modeset that would remove the file I just opened, what is the file
> > > now?".
> > 
> > Aren't we trading that with the 'I'm running edid-decode in paralle with
> > to a modeset and the file suddenly becomes empty'?
> 
> In that case, you know what the file is going to be: empty. And you went
> from a racy, straightforward, design to a racy, complicated, design.
> 
> It was my question before, but I still don't really see what benefits it
> would have, and why we need to care about it in the core, when it could
> be dealt with in the drivers just fine on a case by case basis.

Actually it can not: debugfs files are registered from the core, not
from the drivers. That's why I needed all the supported_infoframes
(which later became software_infoframes).

Anyway, I'm fine with having empty files there.

> > > > Then in the long run we can add 'slots' and allocate some of the frames
> > > > to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> > > > 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> > > > salvaged as another generic one)). MSM HDMI would get 'software AVI',
> > > > 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> > > > want to use). Then the framework might be able to prioritize whether to
> > > > use generic slots for important data (as DRM HDR, HDMI) or less important
> > > > (SPD).
> > > 
> > > Why is it something for the framework to deal with? If you want to have
> > > extra infoframes in there, just go ahead and create additional debugfs
> > > files in your driver.
> > > 
> > > If you want to have the slot mechanism, check in your atomic_check that
> > > only $NUM_SLOT at most infoframes are set.
> > 
> > The driver can only decide that 'we have VSI, SPD and DRM InfoFrames
> > which is -ETOOMUCH for 2 generic slots'. The framework should be able to
> > decide 'the device has 2 generic slots, we have HDR data, use VSI and
> > DRM InfoFrames and disable SPD for now'.
> 
> I mean... the spec does? The spec says when a particular feature
> requires to send a particular infoframe. If your device cannot support
> to have more than two "features" enabled at the same time, so be it. It
> something that should be checked in that driver atomic_check.

Sounds good to me. Let's have those checks in the drivers until we
actually have seveal drivers performing generic frame allocation.

> Or just don't register the SPD debugfs file, ignore it, put a comment
> there, and we're done too.

It's generic code.

> > But... We are not there yet and I don't have clear usecase (we support
> > HDR neither on ADV7511 nor on MSM HDMI, after carefully reading the
> > guide I realised that ADV7511 has normal audio infoframes). Maybe I
> > should drop all the 'auto' features, simplifying this series and land
> > [1] for LT9611UXC as I wanted origianlly.
> > 
> > [1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/
> 
> Looking back at that series, I think it still has value to rely on the
> HDMI infrastructure at the very least for the atomic_check sanitization.
> 
> But since you wouldn't use the generated infoframes, just skip the
> debugfs files registration. You're not lying to userspace anymore, and
> you get the benefits of the HDMI framework.

We create all infoframe files for all HDMI connectors.

-- 
With best wishes
Dmitry
