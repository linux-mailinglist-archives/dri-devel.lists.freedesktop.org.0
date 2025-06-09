Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A33AD2622
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 20:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D774B10E0D7;
	Mon,  9 Jun 2025 18:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGnIg31z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1AA10E0D7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 18:53:53 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559A3CN1004538
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 18:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NHliooAu2D4LpcWXHN+HBfm7
 iZs/qYaISZWRr/k1xUk=; b=JGnIg31zNhAteI1EkOQzp4XCkWV7assJM6tswIEN
 G54rLlP8u9WCaBoujComgmt4fcI5a/uzYVuvN16Gr4ftEv0dMnz7wxunpY4u2d/U
 EBkklWw0dQAV38jZDDGUYDG/+gtlLAV9h68AogPWpdVtQfcfsnqblyjQr6w34ms2
 RPy/n4+DJixtuJYeal0wCR2JEHim+V2UXSKHMhilf5xwl4CvLuhcIcQ3IVqduToI
 xNVRjY24K3OrDBx045f/MSttMpJI9EWpWXKhiwAwa3oMyKPaLFhZIToHzW2Rug1T
 6tQdlyvHHQz336fETTHuH814x+bD7vizNoOIhS5cbYsrSg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jes8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 18:53:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c790dc38b4so792754885a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 11:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749495231; x=1750100031;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHliooAu2D4LpcWXHN+HBfm7iZs/qYaISZWRr/k1xUk=;
 b=hqEOrWpBkiHrBhpwOGbG9dQT3702kJ3ppAZoIrAQdeNBQa+dQoxTH3LfTzzOVaHFEx
 ykrOAezouLgBGOLWtM3U9Qt5V9AGHqhMEKfDO6f8eUxeOl6WT7aRNn1Xx7rfkBG7z9CS
 TV1wCerORhx/ySBtmkNAs/iKclVEacqvec7jZaOCEkSEb376uOQ2Vb+CCH6qaS0PJZRL
 tDbLXuJNLtk8u/rztYfrNV3g2lYn1p57CtrSMDnJHVK0OBexcW4PAaSJkspCzhSVJFPs
 37WqMxbprJvHFqCSKZ5WtDUOk5vrlC5b+I1BmS7xwh2VXYadaGdGyS/PHY/hlBPrx9v7
 v7Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRmXFURvcImC1WnsA7Tz1i91kRB9YUg3Y0SgkxQs6gPQCs4+z9PowTLoECnKXIs70baJvCUFrYMFs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMxV6HNjUu7uYsw22R7Eowj1W7OuAbrUzlpcZxbAFIeLr5AII8
 HUjQc1B/HAdUYZNlXsJSCYnkmHaRTdvLRxdg0t4mA0L/ouY5rMQBxFkf6YZs6rjLYPG0mWiY/22
 umZrbCz7kOoMJQ5z+pFihAFHvFFF9lIpziDVrZ55tbAlLQVSAJoWiVRlI0OzsEyhWU28sTv0=
X-Gm-Gg: ASbGnctTlKdmUZ5mLkk5G2TdkGiPNcJ4bSRg1eqSW73q3smTBezoMyHgOPW9wL4dUxV
 XpM9y23GLFYoBrcER2aDW5B9DAhGimdjTi9flvrPm8TwrucRC0nkazt8AYzfdrw6Um3kbgVT34+
 HdP3kwtR0L0iBQLv+AOvxecD4EWE8nvQ6EB6eV549Ccs47rZ+b7h7eqFzEyocakK1Ngol5vEkPR
 Cgqhfw1XiXbOiGg1WXuri6OwDzvb8W6ioq+E2TJ+A0QozdNcm9DBd/hE4uaVfgzPXHI5Kd5U7TK
 UfORn4zeAX2zvunLZI3afe5yfRIoSITVerlIrLGH0xdoHx2y62Y/6Fevod7uPESf+ETQdFhxac0
 =
X-Received: by 2002:a05:620a:25d3:b0:7ce:eacf:2de2 with SMTP id
 af79cd13be357-7d39d916949mr99772585a.18.1749495230967; 
 Mon, 09 Jun 2025 11:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtIIkeE+jUOKg5twgQNoVG4HlZHhIGny3CGSf0sfM60CLgazcDQ7e4YRQfO6mYFdWtw6DFeA==
X-Received: by 2002:a05:620a:25d3:b0:7ce:eacf:2de2 with SMTP id
 af79cd13be357-7d39d916949mr99768285a.18.1749495230583; 
 Mon, 09 Jun 2025 11:53:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55367733280sm1276221e87.240.2025.06.09.11.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:53:48 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:53:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 05/10] drm/hisilicon/hibmc: fix rare monitors
 cannot display problem
Message-ID: <s3vgjus34zsksqptaeuwgvjfxnnqp4ccdmhhhjpo22vzprqdly@kkohmzkriula>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-6-shiyongbang@huawei.com>
 <j23q7vjp2s2gfautba7hcbvd5vrrycr5akl3m24eu4nlvy65s7@5uytzwucogxw>
 <28d7d9c2-8498-41a7-ab37-821d574fbb2a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28d7d9c2-8498-41a7-ab37-821d574fbb2a@huawei.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=68472dc1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=JItdSXAVqBTXEc6tNJ8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6pOwa-dBKHLT7-hzOqBWJ6xV33ITBZVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfX6/vb+fOcUF2+
 oQM85B1NbWsgudxG+AGgCnEbbzFj2g/kkB/ulwEshnrCqCtfO5lYtxDRHClIZQekOkoWomeUNrX
 SM0Qn0UhWlRu0WxmKGO8vKNBRvP9TmGUy8FffTE0TltK3Y0r90TCO0OpflbJBVnvjfiCO3Iw1Xt
 0KU+MVhJ9+ML0Ew42K5DnxmBct0iUdNtwK0OI6s5/LJ8G2ngAlfgfP5eNfZ/w08pOjcajPtXqhP
 J8cIqJx7fONBLPxWV+yCsLZEVNwitPbqCalh+uWA6znfSvjmEJq/Gi4w3OV6MLybOwChUrluf7T
 R3l9nn+4mQ/6R0ArAZU/VLym0mJDPkt87JFsY6oPeU0yR1jhCgD7dyDumlaQPTHD0BuW0/mOuBT
 uGh2yLPMcutYJLZZOWSMf3xavw5Pr5JvpTcvI75UlIstl87q5ixPhiFGVKDzmHa/FHcfIcAY
X-Proofpoint-GUID: 6pOwa-dBKHLT7-hzOqBWJ6xV33ITBZVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090144
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

On Mon, Jun 09, 2025 at 10:56:09PM +0800, Yongbang Shi wrote:
> 
> > On Fri, May 30, 2025 at 05:54:27PM +0800, Yongbang Shi wrote:
> > > From: Baihan Li <libaihan@huawei.com>
> > > 
> > > DP Link training successful at 8.1Gbps with some monitors' max link rate
> > > are 2.7Gbps. So change the default 8.1Gbps link rate to the rate that reads
> > > from devices' capabilities.
> > I've hard time understanding this message.
> 
> Sorry for misunderstanding. The problem is that dp link training success at 8.1Gbps, however,
> 
> the sink 's maximum supported rate is less than 8.1G.

okay, this is better. Please update the commit message.

> 
> 
> > > Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
> > No, the tag is incorrect. Mentioned commit is not related.
> 
> Ok.
> 
> 
> > > Signed-off-by: Baihan Li <libaihan@huawei.com>
> > > ---
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 ++-
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  6 +---
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 +++++++++++++------
> > >   .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 12 -------
> > >   4 files changed, 27 insertions(+), 28 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> > > index 676059d4c1e6..8191233aa965 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> > > @@ -57,15 +57,3 @@ int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp)
> > >   	return 0;
> > >   }
> > > -
> > > -int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp)
> > > -{
> > > -	dp->serdes_base = dp->base + HIBMC_DP_HOST_OFFSET;
> > > -
> > > -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> > > -	       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET);
> > > -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> > > -	       dp->serdes_base + HIBMC_DP_PMA_LANE1_OFFSET);
> > Where did these two writes go?
> 
> It's the same as the cfg in hibmc_dp_serdes_set_tx_cfg(), and this function will be called certainly.

ack.

> 
> 
> > > -
> > > -	return hibmc_dp_serdes_rate_switch(DP_SERDES_BW_8_1, dp);
> > > -}
> > > -- 
> > > 2.33.0
> > > 

-- 
With best wishes
Dmitry
