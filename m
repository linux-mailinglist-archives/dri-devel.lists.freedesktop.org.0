Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE419D3B802
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 21:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3740510E504;
	Mon, 19 Jan 2026 20:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HixMDnQM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ONz90qGK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D21F10E504
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 20:09:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JEoTKL2305834
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 20:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8EhI3ALlg7ECBWd34gMawxDK
 MfILVf5/HCKOnC9/hgY=; b=HixMDnQMF+xXzNTOSJNpJXDSLJiYmaS5XEPdXgLO
 dK/AjiEreIPJaL1Ezcuvgsv7hKbCabzhXQlrgWBsEHBjc9Fm21mGAFRC0fmT2JwI
 YAxz7yPmS5RT0f9UyMVeQ5wDP28MR4Qz/HnWw7hPJc8xQPrXAo4OIl6jXNbuiPyD
 Q9hD5k4PezuXChJGxSYd1utiBLTjRFc3DPdmsJXERgF8JkWJcloqRoRR7YwXEBh7
 aaBomgaz3NiUYwXN1ZOdtNX3kfbII79vPd9n7/H3/dYJxP626ITyVpG9u/pK3qLN
 i9rp4oGmKHlwtoEG/qxPJIFV4ujJhG1VW84izBgg/3YpNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bspqv8tvu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 20:09:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6a241b5cdso665783485a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768853364; x=1769458164;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8EhI3ALlg7ECBWd34gMawxDKMfILVf5/HCKOnC9/hgY=;
 b=ONz90qGKcyU3NWUJjllykkaRn8NJFA6ewqx1euir9tv59h12KADqp6oShIPSI00GFd
 f2RMr91gdDw1KlKOwo5eJlcc9t5Ao20YJXeMviSradckNe8v91FWytI1R+qWJsoZEAct
 4SOYbnt/x7QwXAOKZ3AtRcUIn1QSj5m7lsSaup8Xl+OBh/IIlVxfrBfQ3Ogn3Vg88S1J
 CJUT4i6uVtxMDAg13MWnMsUS/7kG0EpbWemhR/GmGZSwQzDaS8x6WgQBy03erORAzFCq
 LBrY6OEtn7Qe2rhHhOGujnqa0EFn/VhvZd+qrCawkMn5jniC+T3yFzzK+hq96kQZEJFb
 wHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768853364; x=1769458164;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8EhI3ALlg7ECBWd34gMawxDKMfILVf5/HCKOnC9/hgY=;
 b=bwfV92hIqB2kOoXTzTF8aKsd/KfiqXGAEJkjTdtEXIrrl8UDtsqr24c4ZHnHVOf4Qu
 2IJkL+IkIBnSxgQ5qHjuBxnfZQXoMEmD67bfXgWttdaaGGAJr7N1Hc4LPDs7+r6kyjuF
 g9oqLzvqYG8Jq4ei/+cTzw20epgF6yAgjSnEa9mxNa9ZhYK32rp0kPMXwN477YoP5wec
 4tpgf0x6xcrGEQL+dKjwqfNQNbAsnofO+ktSd9Ij8GJ5T91R2uuDrYYAchQiP8ouUH6y
 qQiB+QR434Dt+Snm/NKvMLkm+2p79mFCRxg3sBGQ3hTS71EcuAeWXECk3/ZyCxD0Vqfg
 g+yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9DhV2sTg8EohnC2+QTyZA/bb3BMUeQ27wmPc40dBbRorVrHO26/42SrWWdIRsj1xQ9Yb/4rphV2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxihvUZix6LUyWnPoRaPnRZDfhME+34PfSRf9U5WIGdZc9Wevw
 sLA5zUmcjxGmfyOig9RYvJeohZUTzaE0IATqo6qB/eW7sYvrIVR8o8PuvJ74YBIR4D+Kuq5IKeh
 MN+2B0HQFuF9kHMkHwWWSSfXImSPvj9D8EkT+Z1DpuvOFmpHzZgpfxLURYzut/WsXWnnJJZI=
X-Gm-Gg: AY/fxX4RCMQvqPNVjwwYzy60pkOjqbMIubYiNM6Ltn6yBW3XWUDttRQJi6K1XHvLXNV
 zmbzMFSzZk+mAq/ReSc2G4sgekFuOrGHukZBZJAVm0748HXNGksuT2iYxWPp0lsN6ODV9dhmyEM
 IlLtkXrbyIoLR+dyElmHofzoLtFnbiHixkGT3eODsS+26L5whLdz58q24/fqXnayMlcIkpXdrUj
 i/VsCZ1Ca9pNcqnbmkT0cxc1gziW5pqgjeIy4fmEf1+A3mnIbuLBMrrGrNKdV5+qY+x/Kg3eqNu
 4NMxTVQtyDnOHuKcaImr9Yk3raXY4B6GVnN04QlGny5etCElnhIdHZ7nzVyj59D4FoOgapwzpMa
 3K00ZJmjokH09ydvqZJYQaF8NYaNDXvQ+6lOg3+kkUeN479mkYoUto3sNqAa1/bTfj/DiWNjGux
 4yZDB67B839A3414RLF6sdm4Q=
X-Received: by 2002:a05:620a:45ab:b0:8b2:f1f7:b867 with SMTP id
 af79cd13be357-8c6a66c8527mr1666861785a.11.1768853364425; 
 Mon, 19 Jan 2026 12:09:24 -0800 (PST)
X-Received: by 2002:a05:620a:45ab:b0:8b2:f1f7:b867 with SMTP id
 af79cd13be357-8c6a66c8527mr1666855285a.11.1768853363895; 
 Mon, 19 Jan 2026 12:09:23 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e790fdsm36641481fa.23.2026.01.19.12.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 12:09:23 -0800 (PST)
Date: Mon, 19 Jan 2026 22:09:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wens@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes behaviour
Message-ID: <couy5kfkofizy7m7c25otstyitq7ods5tk6kgk6vadqaku5vud@oy6bhofo5arf>
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
 <2fb910198a3be542215592ac3f22d6b2@kernel.org>
 <yj3r6d3azwwfl5g5yo5wj65qy47f5hzrio5tvfmxhgzlc5bezo@ij4dctwhswls>
 <44a39340ccf7690f6458072eb886e6a658b981d7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44a39340ccf7690f6458072eb886e6a658b981d7@intel.com>
X-Authority-Analysis: v=2.4 cv=Js78bc4C c=1 sm=1 tr=0 ts=696e8f75 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zvl3gqy6_dqJr4sjycUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: uWmEJzux1cq_afeuivb1Ptanh9IPb3Mu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE2OCBTYWx0ZWRfX93dsqw++8C+l
 haUGFaB0wipOsGNSxwH94Co0Nw2W2a5E5mAhLaLRRgUu+u8eCdQQRIV1q/j0CGayWDepGX87LRh
 EDCfBdUPYwpHx6uyzNzG01ctthQbk4Q91Q/2OXbUrOeCl5bYCaOiogaeKYD5JulZ3VX8PB1Hf75
 png1OX7PMsbuBjWjEr90Sz6NleEBxg4cP/PpdEl7whViMoQBmG2x4M3HGe6UDq5TC2RwrsPvAac
 1EYJLGAq6Jnu4igRYoHRvjyRcrxEh5DZL1TjTq7TUiJH9yOlhicgCqMaDJ6Nujk9LNaPghwsHhK
 LsLEiHwHPxDjVYByJIuu0p82vRv8iOuy4zoG8LTyQvt/VU4yrDOc0X/S1tl9Pwk71+ebFHmUpuQ
 26qg9RLFdTme1xIMewb2lFFvxQomiYdqlWiz2oITExWV4K/Eeoe4UC0l0tF6/vrlop4duSd4vqT
 IEAeOLOZ8mjzBFGPG3g==
X-Proofpoint-GUID: uWmEJzux1cq_afeuivb1Ptanh9IPb3Mu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_05,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190168
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

On Mon, Jan 19, 2026 at 03:10:21PM +0200, Jani Nikula wrote:
> On Mon, 19 Jan 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > On Mon, Jan 19, 2026 at 10:13:43AM +0000, Maxime Ripard wrote:
> >> On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
> >> > Verify the InfoFrames behaviour. Check that reporting InfoFrame as
> >> > unsupported doesn't result in a commit error. Also check that HDR and
> >> > Audio InfoFrames are not triggered if corresponding features are not
> >> > enabled.
> >> > 
> >> > 
> >> > [ ... ]
> >> 
> >> Acked-by: Maxime Ripard <mripard@kernel.org>
> >
> > Thanks for all the discussions and the reviews!
> 
> Your commit ca59e33f5a1f ("drm/atomic: add max_size check to
> drm_property_replace_blob_from_id()") added a new parameter and this
> commit 7436a87db99d ("drm/tests: hdmi: check the infoframes behaviour")
> still uses the old number of parameters, breaking the build.
> 
> When applying patches, please make sure to build the code before
> pushing.

I build-tested, but I didn't build kunits (which obviously is my fault).
Which brings us back to the question having pre-merge CI for the
branches...

Anyway, the fix is posted at [1]. I'm sorry for the troubles.

[1] https://lore.kernel.org/r/20260119-fix-kunit-infoframe-v1-1-5f2f9b066594@oss.qualcomm.com

> 
> 
> Thanks,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry
