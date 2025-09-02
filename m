Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE3B3F2D8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 05:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D449D10E187;
	Tue,  2 Sep 2025 03:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ev9pT7Vo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A056210E187
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 03:45:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SutR011396
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 03:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=u6pXxYvTpFhxbjh80IOUWJOQ
 14f2Hl+NCOsXpDoJFW0=; b=Ev9pT7Vohd0UOB4LnTx/IZrhMtHulcxpfjHQMKUB
 5u/wMkziB4dzmBnAFLVx58QV1K8TDsrSiJfyBGOBWYiQCEKZkU6OUm0KbPHN4zlW
 ejptTarpiOyuDXmL03ukZbF4K1AfSDOP9b5cojzU7kGGn+BClV04TEWmHQeKybXe
 ds5k7eFix+bNnbuRSHptuH4a12WISUyNCf1IzRCib77WLOF7AjnR/HFg1ZO2y8zh
 HTnj8P/tr1VD6TDZIdCwA7tXAbgNG6NGr+0S9cAzaFa8+4JNa6K3med4PBeaeBLO
 aX+/UhkaHqV3kpC4Zc8Fud+ioRUwYoPqZlpIaooTP8WLUQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjed29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 03:45:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70de52d2904so122197896d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 20:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756784748; x=1757389548;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6pXxYvTpFhxbjh80IOUWJOQ14f2Hl+NCOsXpDoJFW0=;
 b=teAmamaUeEEuJW4lbAisLJmM92DwfehByrbAkCxET+aQJtHFxC+dH2BuoddoguZtUx
 A/MNeE/41TefCDfMOzRcONtYnAsaqz70Y9NuajaxpnG4SvL0WgZdwYA9FWOrBeIC9x3J
 LHsakH7+WLWpTWdZx1pUu+aOj4htMoGgfQQJOjKOCwr9+Ue1SkkHTv18VyOuBEa2sXXc
 MJm4QRk5VrS1TTvMWf7Ifl7lDGCH1ymEtqYeJRZ+8L02yIBu843ieD+iB6cgXLtkFg7E
 IdnYejJz7Q8xg3wLoi2OqXtxrPNV2z/t29cEdoaakI5hRYQixuTAlckqAwClQZK/ZXVH
 3Gfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsytYNDKPr3PNBTRT2iVd48OEq4vkT4uUo/KPdUPMAy0YwD9FM8WLfF5hFHKJjl2y71/3UAe3ECxQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlQm6NP399p2+jcOLBmQ+C3yNG4rCL0FY1CGCXFsHzuPBDogre
 bGGNksPb4bLRhZTAX4akCzdIhgP0j5Q2YYGYQnbSzI2MWtBq1+O7VVBGAya2oPqPLj772XeVuFh
 2VVT7NhjjxpKUWJbhWBDhWf4y2WxbnqJRCyVI5RDXEGB5XJjS8wUaOZd8iAkJuCWm1i0u38Q=
X-Gm-Gg: ASbGncvGwI2OlkihQPLpSPy4SoC3gGJJoAMaNoH3Q2qMdPL0sCwrtwtwR6lX5LUR7sS
 M0aCyIviAtFQS3PCko24zYOK3/obiIyEhD9CEYuhI7xVnj8EMOMnIsWuRf/JkomVeTrBj2sutx5
 2mNwbhl3iGzeBlXhTpFDDZI7zTNUtT0exhO2T5yw/tvFpB6gV+wb+V66ZerAzcOQN6B1KeVTIB5
 DboQKROb0uS+mwCRsS+rBqnEB8N8KyNM2/m5TxrGP0Y0D6Ceaz39gu6bvPCO1e3DOzqZoZzz+PB
 PTJn2vWfCraGnNrU571INNdnFiL7FcnseYyyCof98M9PSHWWuH3EgUxbvFmym9ohMCYu2IDrtgR
 tTtATOZ/F7AGzKRbDoZO718W3PJ2SOT9atiowDSDyzXJwL7ohyarb
X-Received: by 2002:a05:6214:414:b0:70d:eb6d:b7f0 with SMTP id
 6a1803df08f44-70fac700c86mr114372096d6.10.1756784748516; 
 Mon, 01 Sep 2025 20:45:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW9DgkBw+MvElYTBWkwujyNrejM+p6uDFpj7XgGpJNMn2Ua2wxQ/b8FTcUSXpCO+uXL3IIqQ==
X-Received: by 2002:a05:6214:414:b0:70d:eb6d:b7f0 with SMTP id
 6a1803df08f44-70fac700c86mr114371806d6.10.1756784747861; 
 Mon, 01 Sep 2025 20:45:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827900absm337975e87.66.2025.09.01.20.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 20:45:46 -0700 (PDT)
Date: Tue, 2 Sep 2025 06:45:44 +0300
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
Message-ID: <voknqdv3zte2jzue5yxmysdiixxkogvpblvrccp5gu55x5ycca@srrcscly4ch4>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
 <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
 <20250901-voracious-classy-hedgehog-ee28ef@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-voracious-classy-hedgehog-ee28ef@houat>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6686d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pHNJB9hyKJ2XXRMnjhQA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: zPVm4McyME_1os713g2r8Ol1jqUtfwUC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXxEJmruU6mk0d
 RxEuPbn7MD8CfSZ7peRm4shlx+LyWzj2FiPpoa1ZSSSRUYUBhRdsFecgugdEL0ZJScOMy5z8DdO
 bVRbR5nZ0WZrkk7+zy31hl0UhEpkLYoFY8CPadxT+n2IXe2Q+z8bgkpNSs5NZAVroot9Mh0esNY
 9satUE78auN7BAh9DGasrlJnUSdeT+DKRUYLJQfnobfAzrXHGV9cuXwDGYmIa7DlB2c2o7n4U5Y
 zlIKJTxTftKXD0hlSNgntONDh6D+3TuaZRScKjsJMtw1JowiU52AiJ997lS7zkSnE0fkZsmAhsr
 HFkS99IgjLO/yzSHiTirqM2A92XvhfPKOx3naodDqe5t42h8eBw/gI13FcMpVD26hHjUMLCLFEq
 6l/hCc6f
X-Proofpoint-ORIG-GUID: zPVm4McyME_1os713g2r8Ol1jqUtfwUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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

On Mon, Sep 01, 2025 at 09:07:02AM +0200, Maxime Ripard wrote:
> On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Baryshkov wrote:
> > On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > > Hi Dmitry,
> > > 
> > > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > It's not uncommon for the particular device to support only a subset of
> > > > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > > > a model of ignoring the unsupported Infoframes, but it's a bigger
> > > > problem for the userspace: we end up having files in debugfs which do
> > > > mot match what is being sent on the wire.
> > > >
> > > > Sort that out, making sure that all interfaces are consistent.
> > > 
> > > Thanks for the series, it's a really good cleanup.
> > > 
> > > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > > packing it into the two GHDMI banks. So the supported set there is
> > > 'all of the currently well-known ones, plus any two others, but only
> > > two and not more'. I wonder if that has any effect on the interface
> > > you were thinking about for userspace?
> > 
> > I was mostly concerned with the existing debugfs interface (as it is
> > also used e.g. for edid-decode, etc).
> > 
> > It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> > HDMI also have those. I don't have at hand the proper datasheet for
> > LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> > generic).  Maybe we should change debugfs integration to register the
> > file when the frame is being enabled and removing it when it gets unset.
> 
> But, like, for what benefit?
> 
> It's a debugfs interface for userspace to consume. The current setup
> works fine with edid-decode already. Why should we complicate the design
> that much and create fun races like "I'm running edid-decode in parallel
> to a modeset that would remove the file I just opened, what is the file
> now?".

Aren't we trading that with the 'I'm running edid-decode in paralle with
to a modeset and the file suddenly becomes empty'?

> > Then in the long run we can add 'slots' and allocate some of the frames
> > to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> > 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> > salvaged as another generic one)). MSM HDMI would get 'software AVI',
> > 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> > want to use). Then the framework might be able to prioritize whether to
> > use generic slots for important data (as DRM HDR, HDMI) or less important
> > (SPD).
> 
> Why is it something for the framework to deal with? If you want to have
> extra infoframes in there, just go ahead and create additional debugfs
> files in your driver.
> 
> If you want to have the slot mechanism, check in your atomic_check that
> only $NUM_SLOT at most infoframes are set.

The driver can only decide that 'we have VSI, SPD and DRM InfoFrames
which is -ETOOMUCH for 2 generic slots'. The framework should be able to
decide 'the device has 2 generic slots, we have HDR data, use VSI and
DRM InfoFrames and disable SPD for now'.

But... We are not there yet and I don't have clear usecase (we support
HDR neither on ADV7511 nor on MSM HDMI, after carefully reading the
guide I realised that ADV7511 has normal audio infoframes). Maybe I
should drop all the 'auto' features, simplifying this series and land
[1] for LT9611UXC as I wanted origianlly.

[1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/

-- 
With best wishes
Dmitry
