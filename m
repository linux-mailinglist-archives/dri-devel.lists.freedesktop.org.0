Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD819CFDE61
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 14:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45D910E5C5;
	Wed,  7 Jan 2026 13:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kG3/1cJ1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0CbnjBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA0710E0FC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 13:21:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079UiTM4137698
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 13:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=js9vOdGwDOtrz/HNGFuhKMtQ
 9O5QjU14j2FRmChcdtk=; b=kG3/1cJ1P7ELpcYi4U9ELqLxZVjt72LrO+o8b368
 fi93VpPDiEfi+45Q2CtKwzWuPFKqWY+Mh2EiPw5vd8Vpm2XRAuWkxK31fv+YNbrk
 OSJ4rpTVpu9hHJ7SkXwiYFRpfkTeY9luQTuQ2KYP2RGa+UHizmcikgcC/Zs/WuwF
 kfShAdfmGYD4ImRzKeBScibWpKKQLsGDz07GG52n2IAAbm5UrKb3Ois9v/A5PYBF
 mcHPsICzCwQTnNNr+3AxzepT3h5cb29NlRt3Z5jjNDBDNULEmobYyiKrsOtWKWt+
 IOpcqT84fcn771H2LtNgspTmUV0Pw4g90RXS66kMNU24Dg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e3d6g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 13:21:46 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-93f5a368daeso2331248241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 05:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767792105; x=1768396905;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=;
 b=Y0CbnjBPxuP0vMoXC9BD3GqOxQj5mQJzLMLUnVt7ZICQYjv6HEtmlW4uLaJSYJlUMu
 tk4uZS/4reU8YgOYRu+fwro0onFxeHTDXs0GAXKbyaRoGgoA1y79dOOk7Rz6KtGJdPoV
 q0F4Zn5uQaZcw75kNUbBz+PPetULPenQeGm4n29ydijI8Q7HUZwUWx2BKhAaYnHGKdMs
 uSw5O3BECfrRiz9YScpAAyUjL7ikASFWf3WrrOttV/ZosH5rdcOKnoUB9lGnbLq8GmES
 dIQR3VlNsbacih9CXFXFT7dy3tBIMXI4nxsovrvfuGgtQlx7UwS62ORmOQVn30Z8sMr+
 DuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767792105; x=1768396905;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=;
 b=FenNMQK7LWTXU/J4CvzUiDWmn1ycdxJYqcrffup25sQWqmeuUc42I1E2UcYw2wxNI4
 0euOQ71mFkKxovQvbzMZhIx9IeZE2dO9U44c+1hOi5reGpfKAiXipjhyU2LC0OrZJR+l
 Qwn4MQUG/MY0GE/Fv/FVBhSPKO/7bzgrbvoy35ghzyWZsJIKOc8oi6wOx9vqpOgS+2CD
 ok5Zhy72pf7ZKRjQbyFaEgaLJvp2jpNHbCebqjnIkhMKnwb+ZazH3VvQaUiZj9gy2raK
 9lm7S1HPM/JyQMI2cdw0cifWqV5njlWmffSrSPQUf+rmqhG2UwgZUsHcJAU7zQpf8eZI
 lTyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu6+U/4O/raO4Otv+r2occPWgtUXSFm0t+fpot4A/IkqXNJhdrO5zM/u3eFyKiRQeYd0LlbyxFuRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2hP2Fk5muc7oxbzu7zExxVHoFXMTMNpMAZ/BIbN2vtGSa0jnc
 +b5Yyk3FAlMURA/OVlO1ii56le/95VU4ME899EcSXGnbOBonDc8+FMXKrKJ+eZxkKuI3zk+QSAD
 ROSG3/FDqwono3cQOAULyPptEPqljk7FAeW3F5ej2wVi/zzsyvn56HsPlgOgsTyXQgCULVyU=
X-Gm-Gg: AY/fxX77bJWE6vSK/Kl7eGGhcGIWnQxCyJwd6JYdVdMAVr9s39VuvuG0Fdkpkq9FUtD
 7k/t70XRYKRtRslXU8JsUEktFD/f9g0wVU3eOTNRmGXlGIhMxju19hQvh970GsOztz+WH4knyac
 50tlHChWQzISpc7iYYhkYam1JiMqr3kovCVdlN8QK9D9O7gSvC2mCZ3/c9pxA92LDDVT75LIBmT
 +w/j9QNZbKzQQOi1+8Us9gTYQxG4CwvYBGpbw63ZB0E5i6XtXOyvFEsXkrOLdtUOgDh17DUGd4H
 aWI65dBljB82I4SESzBQCzRIC9CN88YcTq3nSMwRhnzrUx48z+vt2Xu+Zqz0UzJvw3JoXX0RCDi
 9sFo8XXO9QLE9pI/jXOMTyoJF4npljY7SzXQ7AnXANsvz9od9utmYD266JOZa6YOCAMrt9kWlHN
 YLlDYhjrCGinNmO17VLRcfkB4=
X-Received: by 2002:a05:6102:32d3:b0:5de:a2d2:8076 with SMTP id
 ada2fe7eead31-5ec752dbfd5mr2097427137.0.1767792104890; 
 Wed, 07 Jan 2026 05:21:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2NXBDg7wVXP/zTsrowEn5NsyiVqeMK7cDHudpgAqGMWRN5e4UR1GPSBvYkE7wBgLCTq0Y4g==
X-Received: by 2002:a05:6102:32d3:b0:5de:a2d2:8076 with SMTP id
 ada2fe7eead31-5ec752dbfd5mr2097376137.0.1767792102812; 
 Wed, 07 Jan 2026 05:21:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb8dadd1sm10295211fa.34.2026.01.07.05.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 05:21:40 -0800 (PST)
Date: Wed, 7 Jan 2026 15:21:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
Message-ID: <mccxwmemwxp4fcyjiu3zofuydk5ahmhnluqucwau5a6aiw67xr@52gynmrblml3>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
 <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
 <20260107-fascinating-boa-of-fertility-1886a0@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-fascinating-boa-of-fertility-1886a0@houat>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwMiBTYWx0ZWRfXyF9oGyE2lcpj
 u9Z2R2cN8UFAskciOwu6ndo483PcJZ5SSQECeEV+xskbszr0KYn6D5cZBe1h1pp7ePpbX4WvvHp
 huidFvMYc02GLVKcmYPBEUUgBW/uFZmyxcRNci/ak2jLI7IVRhfDABK8X8wdx0mXevJyz6CYZ2B
 yWPNdSsctnd43t2qpzvJG1uMw/QHHjgeGC4/XZEIoKNTZ2l+9Ujitt1yboqIAQDqwbPAI81bt9U
 KMgL1WBeVDPwTQyudVLT/kQMuNZ7ZjvGpiaYlqMbnjZrnMboI5J78r8xg9XCqskBzLwToKzwo0X
 X/sZw3u96RBHcya9iivooawprC8qWG/n1+UQdIk1ittL0AA3ldL/Q4pj13ic3ldhuITStyCT6/V
 vz3eDoS7ZoDGHGyIW3oGoP47wVacsJANQK0/HcJgiV4smYF3C67izaWOx83iWYp6LWYYf7BCwho
 fOnSSy9naIIf6KtNKDA==
X-Proofpoint-GUID: YFE_cQ4UQWRSYnzFmLWtxw7R3Jpa79Tn
X-Proofpoint-ORIG-GUID: YFE_cQ4UQWRSYnzFmLWtxw7R3Jpa79Tn
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e5dea cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3wq6KaL0rsEoTcXXugkA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070102
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

On Wed, Jan 07, 2026 at 01:50:51PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Dec 24, 2025 at 03:02:56AM +0200, Dmitry Baryshkov wrote:
> > Updating the InfoFrame if it can not be sent over the wire makes no
> > sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
> > and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
> > an error if Audio InfoFrame callbacks are not implemented.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> IIRC, audio infoframes are mandatory if you send audio over the cable,
> so maybe we should do like you did for drmm_connector_hdmi_init and
> error in drm_connector_hdmi_audio_init if we don't have the proper
> write_infoframe hook set?

HDMI hosts can be sending Audio InfoFrames in some other way (think
about LT9611UXC, which manages infoframes on its own).

-- 
With best wishes
Dmitry
