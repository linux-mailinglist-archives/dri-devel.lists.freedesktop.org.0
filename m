Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B431B45A63
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 16:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FB510EBB3;
	Fri,  5 Sep 2025 14:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5vPBUQT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF85610EBB3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 14:27:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585CxaBP018594
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 14:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eF61zkZp9mMYxVggMMzwArKN
 A1z21l0hZQVBszHsT2g=; b=F5vPBUQTBlKC7wn+jmgeXSyLos6dsnyMQncm+JVu
 4r31K2SfNeSKL8AE4GDWK6KuuJQ3CohKTgWA08ieqRKK/KfeX6oXYPsz6GKr1PS8
 xsylaqqlAAJ4PSyCGaPiJfVTAuz8DbfHuarGUxwMB67AfFDLKB7JUyQy9ZrG8CvO
 h2DoL4KmgSPDdrW2XnGUv1iDhE/wpi9B5aW8UdSEs2tvgr8wW6FjZI8C4Ak0SlYz
 H/iPBgeUqLrZJSUgvEimmNiN5sRt3FnCO0/40J6GlibJLiVRSt+uycsoGKwE1Ggc
 Xgvb8mLoVntLOI1qGVkZ/rg7Gxr29RFk/WPNQlITj9eq8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yebuu97y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 14:27:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b31ba1392fso61312341cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 07:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757082426; x=1757687226;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eF61zkZp9mMYxVggMMzwArKNA1z21l0hZQVBszHsT2g=;
 b=jlPtUGIoWqhY3JPrtApqrfJc2SuYfxb4r1wdGFU1x6fHs8vPTnKj6PANBbzt16FliO
 EGcZGHIRFwA25F2x3GAreMDxdIhRLmOgImMKZ3IjEH+iVextitf0DjLRJmohhJ/Ez5B7
 Mw/YiWQobn+Ydk+uRpW1Td/nKD6MmvJ8IxfWMocJpwOicoAdzHT6ep+NhRqkTEsBcwJH
 MwpWOqbEeqbdjIfC6n1GShGA4gh3Jv20+Wz6pABtNt8K/ZVPFNHzFwY5P3IDaLHKjbEp
 Q1gpzqCXsxmepddYf8ifTsC2+kBgs92dE3rND7Xbcg2iygtoflHGL1KDuZBVT+5wd3OB
 UMyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT1Yl02nX47HmfrmCNgBgQ2H5nGBzuu97HfZeXUdgDoxqkeT7evPfVIe4yGu90g9huYoG2OY4abYc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBPq36uHJBDyc1i1iFDePPsA2MHJFLa1XOIAfdKQGCGmQeDB7C
 smXcufusHs7JKcEgovd9Dhwp2SmzM+I3P305sTDDmz/dqWKMJ2YmkM8LdjXvwzfR1XkRnHYPHO9
 Mm45FJpQeMUFjR75E+Fm6gVHj8O0ywXJBGGJpEjDoBC1aOaKQ5ffnA3+tglBQUYcauwPlkVo=
X-Gm-Gg: ASbGncsqjjI5UBlADogPgOwytE4eoSdUr153dWz4x2gMS0AD7Ujt/c/L31eyXdyfgHo
 3q2MHFHM72Dl/60RK2RsUyOc1j3aQ3YAgV4W2FFc/ByRbIk5uOIzY4P6/94q6k2gCbDizN2Z3iZ
 NBwOMutdbUfygTkiyHe7yqOKLe4ErPYTI9gc/9V8wuYe7c05BRHPvGQOd/naeQRVsFPdDANACwv
 b/2J84Gq/A8i4wY1sA9M/9K1igP28geDi2/McBk1NmwX5ldaeRoDpU3WDPZo2FNCglSvHY3H71s
 o9oisqMVcdv8gxWNg0l4VTsvvF9ZfvBGe4HDr4kgStRHEZur6lpw9tz1io3U52sJ72Ph08CMrqK
 F7/5cAz5Smw5Kg9pnu0Yf8e4oimsqgKBKa4Csxn1xhNTAlyTg2cPj
X-Received: by 2002:a05:622a:1a89:b0:4b5:d739:627b with SMTP id
 d75a77b69052e-4b5d7396898mr89983111cf.76.1757082425998; 
 Fri, 05 Sep 2025 07:27:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECmkBwlmY6UiEs6hcJX3488laXoD4oV0+tFPvFeEwoB/BLO8UPs9WqixuE8OIxKWAk1kYaYA==
X-Received: by 2002:a05:622a:1a89:b0:4b5:d739:627b with SMTP id
 d75a77b69052e-4b5d7396898mr89982311cf.76.1757082425175; 
 Fri, 05 Sep 2025 07:27:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfc24fsm1802596e87.104.2025.09.05.07.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 07:27:04 -0700 (PDT)
Date: Fri, 5 Sep 2025 17:27:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Algea Cao <algea.cao@rock-chips.com>,
 Derek Foreman <derek.foreman@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
Message-ID: <zni6d5udvawma6kcjp54d24kihlue543dfqc2ti3k43jntaphj@xtuusmebp6qj>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <ncmsmxdcvhj4jec6wmqf5abrb7nijx7ac2i33tvvcc2prljez3@uks2cb6aunnx>
 <b8d068ef-d083-4bb1-b34e-b8ddaa62b436@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8d068ef-d083-4bb1-b34e-b8ddaa62b436@collabora.com>
X-Proofpoint-GUID: CFnkxVbnR3hWq7bU-TQSM_Qy6Z1L7xXw
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68baf33b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=gdAa2DyRb25O423_gIoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfX9vXHGUI7tHUJ
 vsZKmiJ8rSYBr4H5KAZGfn9N2LdvZlpvXGzT7ZKC5j6ITiLsujbO+AMdUXW7w57Io/ijCzJ5KGQ
 9bdrQ7pNwE/lDW0/CSJSM/Ww18wxIfYwZBGXBODy/6VQJsOBEI+JYFkSXeRqrXFCAyNS47I+/Xy
 6fzB+dc5fAzK3zh/UAtTcREVrnitjTP0J9abFCUMAdti1/DPYXR2KdyRzdvwdOPeRMKJLZjwJA9
 wVs48KBeNr62cclLR9lujWW0epx8GzntfZVAZ8YMBV7DzmKXit4VL1Z9imvLQlzbokr3houqZK1
 FrEM4wS0zVZjuiCloNyFH9HYGejA+OSCXBjmGddOoi+KLMJcYmcCSXGZYGzlMhiaAGLzQdrkK/x
 o2UJT6Dr
X-Proofpoint-ORIG-GUID: CFnkxVbnR3hWq7bU-TQSM_Qy6Z1L7xXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163
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

On Fri, Sep 05, 2025 at 09:32:36AM +0300, Cristian Ciocaltea wrote:
> Hi Dmitry,
> 
> On 9/5/25 2:48 AM, Dmitry Baryshkov wrote:
> > On Wed, Sep 03, 2025 at 09:50:58PM +0300, Cristian Ciocaltea wrote:
> >> The first patch in the series implements the CEC capability of the
> >> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
> >> This is based on the downstream code, but rewritten on top of the CEC
> >> helpers added recently to the DRM HDMI connector framework.
> >>
> >> The second patch is needed for RK3576 in order to fixup the timer base
> >> setup according to the actual reference clock rate, which differs
> >> slightly from RK3588.
> >>
> >> The following three patches setup platform data with the new information
> >> expected by the HDMI QP transmitter library, while improving the error
> >> handling in the probe path.
> >>
> >> Please note the CEC helpers were affected by a resource deallocation
> >> issue which could crash the kernel and freeze the system under certain
> >> test conditions.  This has been already fixed in v6.17-rc1 via commit
> >> 19920ab98e17 ("drm/display: hdmi-cec-helper: Fix adapter
> >> unregistration").
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > 
> > Cristian, I'm sorry for almost off-topic, but as you are working on this
> > driver: would it be possible to support HDMI (vendor-specific) and SPD
> > InfoFrames in the dw-hdmi-qp driver?
> 
> Sure, no worries.  I'll be on leave for the next two weeks, but I can handle
> it on my return.

Nice, thanks!

-- 
With best wishes
Dmitry
