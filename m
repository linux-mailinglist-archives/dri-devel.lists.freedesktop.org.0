Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1691B3F29A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 05:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3E510E113;
	Tue,  2 Sep 2025 03:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWMSW4mD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2789410E113
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 03:13:29 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822T6VW032344
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 03:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mFT7TaYN9yFmUBnkUS/DV54B
 AuRMajtXQdEYrtXcv6Q=; b=JWMSW4mD3PTluOAloZo2v2G5SpKLxOuXPtreb91I
 HO2B7mjqxjJB6HZTSE/JG8bM86XKEfm1+HRcRAGizJR1zv+x7kKsmGSkJCgDWBQQ
 hZuZfoYQgstxYme1EFXQuvAlb6T5459ib/NfGUUB/xYAxoO2tNqCndbAgmPKxE3d
 1oTL95XM0ElVnBpABJAOBFwYgig4M1fYxaSZKiEpR+lBWRrl8wbh9obSoNA22z1x
 XMM61AB5Lb+y2lYPLcYLOmBHqTufDM659xl+4Le2NcwcroQNpuDsU1XN0SCBNq6n
 l6IauTpkF2si4mrFHIiiGj1Vyh2HUa5m8BQ41a4jq74tZw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8p9k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 03:13:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70dd6d255c4so124366866d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 20:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756782807; x=1757387607;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFT7TaYN9yFmUBnkUS/DV54BAuRMajtXQdEYrtXcv6Q=;
 b=MBsUs5IHkFz7c3evl5DVE1NOHYyGk72kKdj/+Qha0T1yQCgiR/nF3jUEgVjc/eAKqo
 0MkxS8pwiqnsoCT/SYHd/LINY5Wtm4b1V9gPHSwT/LF+/6rs3OwLTqTZk0YxvGzQr3rn
 7vpeFjGEA0zGHV+ZM4upIs7reTrw5E/kkAfXxqe7+/Ql5hx93wC97vRsG5ZQdm5YEYN3
 z7bmPF0yQBPTvfZz92NS5s1lcog9wPdT2uAsaTiMViIktE+cuNmFm1LDPRfjzb0XMeDe
 c38zjqGVBeeoKb9pAhZy4Fc5BWqlIRJ1mHL02adQl3ByX8RumNJWI/DMMixAZTPDm6LP
 5aNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJThcofiYufocZsoPs8B6oFoeEZ0UPeYH46T8XFKx0RiNN2molVeCBpnW8CFmsOlD8tB6W0tkQf70=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9Lv50rH9o2zrJDmx9IBz22Q/0tioGWBw/fBseelIN+whEHS2Z
 LEQKssDqJNd1wtU+PzJvIrmJ8gmu8AevoErBhGVRtak2thj8dsLUIaEvhM/Z3K93+wP++tJ9dEL
 ZrVIfqwjLDgJ6gZ3jALb9cDtuPQzaIND52S1jaWTA22y6xYtqhbeI0RWU9eWNaclf38ZHGYY=
X-Gm-Gg: ASbGnctOmBXdP7fx7CsdBIQL3pNGfNmRqra4RFJWac75N+/ze7CmZqqbVQ3PxVwt+cI
 l/po6rvbcWDqzStCl9tIrz4GUoapQv34fRGqwEZSgPkjuByMo2kcDpNWd57nzaEnaNdJCufdipZ
 wRDVv3Zn0Bpt5C4jD+Vh31nLWJ28bt3f2W8e9mjXKwZTKiXuJ+zk81eqDkOmXOIfI4ceVnuxrXN
 dPDmW3DSKOzQKN/Pv/G1K8a5BjsTisYQqHZjkV24/KRNoNhFmf25lxlz9Y/qmokpgMiOfJblBxD
 N2JtKXvikiJnBsluHR8ltoYHaxGd4RuFr1KzTV7cfj8xLD0uzMw9gRVjJ7zaubsadt6NQBm5ymx
 ppW1pdJ1mEsB12043U6VhP7QyxQ07j8F9UvG9dz5vvm5d1Ujv7hJV
X-Received: by 2002:a05:6214:2425:b0:70d:bee7:22a6 with SMTP id
 6a1803df08f44-70fac90b081mr99124126d6.57.1756782807483; 
 Mon, 01 Sep 2025 20:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx3s/TeSWd/gD8+0Pzv1Eys9blTUBbEzGio/Yd+gCc0H1VU32BQyJUk3uEjCaZ6DP8MJyUzQ==
X-Received: by 2002:a05:6214:2425:b0:70d:bee7:22a6 with SMTP id
 6a1803df08f44-70fac90b081mr99123866d6.57.1756782807080; 
 Mon, 01 Sep 2025 20:13:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827a53bbsm309669e87.124.2025.09.01.20.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 20:13:26 -0700 (PDT)
Date: Tue, 2 Sep 2025 06:13:24 +0300
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
Subject: Re: [PATCH v3 02/11] drm/bridge: adv7511: declare supported infoframes
Message-ID: <4rzkxynpbe7j5uyfiqscjt6l2yr4teothqcga3js7fn6e4tap2@s6npztjtbjbq>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <20250830-drm-limit-infoframes-v3-2-32fcbec4634e@oss.qualcomm.com>
 <20250901-tidy-auburn-tarsier-e7b1e7@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-tidy-auburn-tarsier-e7b1e7@houat>
X-Proofpoint-ORIG-GUID: TtFySCIit4TmU4baXl2A8rzmeiVy12mu
X-Proofpoint-GUID: TtFySCIit4TmU4baXl2A8rzmeiVy12mu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXzVNhRj+9CC5f
 iAeqflmQcWZl4ILfCSeQL5Ry7qxYNsY8Ybo9qB4CMcgNaxttwZleU+TCqy1p4ad9Gzyt2YsF+p7
 akZd9NqfezY7WnH4s6o2j51PjelirA+kyeV6AY5FoRddDRgYnvV8d54yH9SYAX/osrGse9mfn0P
 EbHayV8WhfjhU6O0//uqnKA8XnghGr77mEkMdudhfwBOA4mykReD/IdrM85TAGSPQvPrBoU84t+
 d+NttRr05qGvERMm5+663JdM1ieibbCKbk6QUbWDk72iAvRGIBBUjOVD7DHbgHgnO0SToZPUvf8
 4fm3xWsGrhiZz9Kp9eQliEqhAWJw0NCqmMqO/ovbnN+5PwhykgDcWDyT33bDmdc6AQUroGsjaJb
 r9m7mm5O
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b660d8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=u7Ex-Lb6nDjXBYZR8i8A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
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

On Mon, Sep 01, 2025 at 09:12:45AM +0200, Maxime Ripard wrote:
> On Sat, Aug 30, 2025 at 03:22:58AM +0300, Dmitry Baryshkov wrote:
> > Declare which infoframes are supported via the .hdmi_write_infoframe()
> > interface. Audio infoframe is handled separately.
> > 
> > Reviewed-by: Liu Ying <victor.liu@nxp.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > index 26f8ef4824235a9a85b57a9a3a816fe26a59e45c..fe30567b56b4f600683f0545ed270665e692b12c 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -904,7 +904,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
> >  		break;
> >  	default:
> >  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
> > -		break;
> > +		return -EOPNOTSUPP;
> >  	}
> >  
> >  	return 0;
> > @@ -938,7 +938,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
> >  		break;
> >  	default:
> >  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
> > -		break;
> > +		return -EOPNOTSUPP;
> 
> We do need to document that it's what drivers must return though.

Ack


-- 
With best wishes
Dmitry
