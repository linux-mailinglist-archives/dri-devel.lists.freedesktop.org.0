Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA402AFA03E
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 15:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2893F10E225;
	Sat,  5 Jul 2025 13:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGwZBNsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C23710E225
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 13:23:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565BQIMh023428
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 13:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6gQMTAhe570YE3iP8EB5vKYr
 zv7CsKlrKa8/6xKU6bc=; b=jGwZBNsY7lfBhGGTTJVDaY9eFTydbEkTCwD1Hlhm
 Ix1Gky9BvXFb5OosVwbFQ4uv3nGR9tGfs00cxghq+hDrGLmjMwLuMedkqKKfOdB9
 KYXD6UHMkfHeooPO8AhFsMp4r7VmU/A4UoVYVwy74oJrhv7l0EN57Ky34lftYnnH
 7Xcgqk7KYNSKEpab6ZdZoOJhHHHGnATSoXUOlq4Ut1P+62k8xOfNVuhI96rmSE6W
 qynR5cXcs/jHqRQd4yWqoXy36nyn5f/k6uF58LGvaG4rRT7AdEUUBgqi+jI825QI
 5cki/napIsViskMvYegppWip/CsErU45B8CUvxVFOKuZUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun214ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 13:23:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d40f335529so430886185a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 06:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751721826; x=1752326626;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6gQMTAhe570YE3iP8EB5vKYrzv7CsKlrKa8/6xKU6bc=;
 b=ZLZo7gflAjsUmYvZpixQH3pZIX8ItDpZ9mWuueF7P3/pERm0Tqk1/AR+XPobNe6IyW
 QrZ2sBpJjgORKfsb/Bs924x1S68mQCDmJmPsM1aulpl+QVIrmoe7/tCDWXPqxUR6qZ0U
 4ZFhCi3RxcDNMebXk6mft974grT9CBxfQ3874tC/03e75cA/U3oEy7uZsp1tSS9WuDZn
 Ouz1YgabSK0zcuVZ/8aBusFz0+GCkB5llkA6m0M6ImEh84kiGt5cnIJwzlronw0tQvwh
 TmJxWIXIxg7fVH8xo/r7UcGoEpWVtQV0gjjTI+I5ojyppOyEW/4k3u/Pt2i+oSSbAKlR
 2S6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhFOgEEtZeePKoEynPtLiW6wrSC3MkXCNVsyc2DTGye0vh9xV5sGilSPxoQGO4a67XDd6z8LtXkgk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw16DhEKNMTv1beBsjNMQLQwu2FVc/a835fYOYFjE3aHLVRhRjh
 FrWWklHtMdl8fpYUAChgVvOGItDcpHZwhmYJflZ/4/1ZCWybMxOxcSfpZIj8tHvIesop0McUfxA
 utH0Lsa5zG5OrdrsCCe7fLYDGZ59coJMVqOwkkqzaz7yIO8PlrMbLCk4/FJgchfe1p8Hzmpo=
X-Gm-Gg: ASbGncvDb8tvFf3qsLMRt65xIG7jnbpPxC92XXwRorDM/jgKxWJperxG3Q38xDQDtTs
 DNJFEUuPsGw1Dh3z3NOVgAEOBnaEzg3qyi6elwEJeztZfTJWiIUrwHmuxOsub5MxkyzTE2/5mwP
 OSunEIl9rCbGLNH6bblqAlj8nuCykTEoehI0Z2z+QplOmcmwYDW6V8QA4DRUy9uJe7oJxOSK1Er
 7ZdQ/AC65yA2hl709NqPNINYer4lQAq8W9ZiAoParRPIQj/RVPxcy1jUqlX5IsYz6tS5zVcSAlk
 DMpqQu3w5+it9uKmbPCPNFZbxrx1MyD6TvbeUiuNRat8wFv7+moOIluqJR9ldkJjFZsmRK6DCr8
 29fHhDP4r+wNGVWOmfbwxtFRTxuI0gG2D18A=
X-Received: by 2002:a05:620a:1727:b0:7c7:c1f8:34eb with SMTP id
 af79cd13be357-7d5dc6d1daamr909523185a.23.1751721826516; 
 Sat, 05 Jul 2025 06:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHanLfpu80wvQenehta9woxKfrNX6xaaUmW++9VxpAOncuk4XTvJSIeGS9ggcbqk0Z1zosQRw==
X-Received: by 2002:a05:620a:1727:b0:7c7:c1f8:34eb with SMTP id
 af79cd13be357-7d5dc6d1daamr909517685a.23.1751721826031; 
 Sat, 05 Jul 2025 06:23:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384ce344sm585559e87.244.2025.07.05.06.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 06:23:45 -0700 (PDT)
Date: Sat, 5 Jul 2025 16:23:43 +0300
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
 Derek Foreman <derek.foreman@collabora.com>
Subject: Re: [PATCH 2/5] drm/bridge: dw-hdmi-qp: Add CEC support
Message-ID: <ahnm4oor4qiac55zyggwe3ndxn346cx2bpzghb5j5wwmfjmdyx@gt6e5fjyq3rs>
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
 <20250704-rk3588-hdmi-cec-v1-2-2bd8de8700cd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-rk3588-hdmi-cec-v1-2-2bd8de8700cd@collabora.com>
X-Proofpoint-GUID: ioj7ircApEEu1k_rl-U80fTmWnax-Bc7
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=68692763 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=V37JziMzuUeit7xzw6UA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=jGH_LyMDp9YhSvY-UuyI:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: ioj7ircApEEu1k_rl-U80fTmWnax-Bc7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA4NyBTYWx0ZWRfXyIxatXedVzOZ
 0JtcWlk09E11KkClesdwi5EdyoncsAhLhN9IrG40vzgbLK9v7Wu+brbymWdO0sd4Zb/pu8Nk66q
 TAxhddoXboZ+XxYaQpsRhWi2+ihWErh2rKJAfoi34RnpC5hrF141toHkwY88nTQQUilp++Mc6S2
 ogI8gb0AAsGGwkhxuOsWjaJA9Au7wiVoZpIYVJ40JI5H3cW3Eo1qUewtR/ArH83Bzt6fHEeQFTN
 LZmm2ZJTH3JNFsXV5mnlvhkpIZJE8zyYKuGla17A5eEQY8yFTq13vXu61IUnZ1eYSChQT3pCEVO
 qacL21MEeZKDq1eoHhvnvWbAgxO3fGv+aBK6UsLaxMJ3xCUW3wpp5C19HtxEv7o9IgFmRBnP3JH
 UyMiZgiotqtDvrHxusPNNomWtKu5vjFD082jGlLw32emk9ffz+z4nm7HsfOk5LEyHacRrV7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050087
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

On Fri, Jul 04, 2025 at 05:23:23PM +0300, Cristian Ciocaltea wrote:
> Add support for the CEC interface of the Synopsys DesignWare HDMI QP TX
> controller.
> 
> This is based on the downstream implementation, but rewritten on top of
> the CEC helpers added recently to the DRM HDMI connector framework.
> 
> Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> Co-developed-by: Derek Foreman <derek.foreman@collabora.com>
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/Kconfig      |   8 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 220 +++++++++++++++++++++++++++
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h |  14 ++
>  3 files changed, 242 insertions(+)

For the DRM CEC parts only:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
