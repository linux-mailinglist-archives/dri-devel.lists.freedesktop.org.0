Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D7AA0B2B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 14:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C923D10E306;
	Tue, 29 Apr 2025 12:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkGLmgB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81DE10E306
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 12:09:38 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9rP43015584
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 12:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yAp0LdgXVQkJihbVytViUFNy
 VYiIbcoCGNDRQ8jMoF4=; b=KkGLmgB1DUQVYWqXwzauECf/oT8pq4VmjVHlEunk
 60PS2gs7/H0DESvhb9ZkWdajJVWYBc8XZJ6+r3VBlX/PrWCpiVFsMOKOjWwsLZ4t
 sXQTvabHEZhXvFjTVeV6ojv0tXyQyMf+4VwIdfW/+cvhKbD2+Cptb0qLFNbYBKOV
 kCgjxc0jZnxjzNKDyp8jynZy9R89u8Wrt01rbIVpNTIlJHDyWm9hQWyDs49ffJbI
 SEEtVDUFdikzuWOxvPwun+mTwUweeuxz304qGFE9FgTXReqbnwaHZSozHf/PX2XC
 DS17DjEVCDPYU9BhBSG7uHOMyzzuv/3KfNKxuKl89G/dGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwve9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 12:09:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5f3b8b1a1so980819085a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 05:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745928577; x=1746533377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=;
 b=rvxGtU5LHGGcuge2YqE4IP95PDO1IjUVdBzFs7jJ07TIZYsxw8ZbIACG4qUpISYpgJ
 mC94YyMSQzd4JouAEa+O2N4Qgb4l9s+ZBJIg6kb7I6xE5bQHUaAIMTjf4aL1740f8Vsv
 xPGo2XoeDNv0serM3cPV7FJZcFAG/Lxzbo65k7fKzd4B47AymNXZlOZWcFki3zQBKj/e
 JHEpntax6sa8Rv6faMRy8htM71r0QVRaZ0hWTWm9PkELyfZYa7mFBaoR40BMSakYHJcc
 M3Qe7gVJD8x9S5jDwkTWBqJxR7U5HugzeHGDh9ut1KkHxL79DIob98P57suoLqxJ1Bfg
 M4eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVof2rNKW2fPJ6t8I7RTah1j6PO5IknEfoEJbAL641/1hjWWyLG49wKTm6U/8GiR7vXmjWCcx64QUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2UoaqAzeXy/kE/koJKR4H6N51sHjJ3VzKF1mnrDzDnA5OgDtW
 6QadTUqKAa1jkhtbm4juJBd7gmq9w4kwvMb4ufAbCv7ZtOzTRFLi5yr23w3nQNQh4mQxJj9LF57
 gIKn9jxS7lNyP29/wwooxV5O0ktApqJsCAGXcBl/4rftLIzrj2aEWPLnKExZNe1i3Jsk=
X-Gm-Gg: ASbGnctDuknWn8HATukKBPQL2x/LHxBiLcYgqSvQOsq/rQZioixGPoF/O8bKr8RTV2y
 MEu/xN4IdWOKBYSSwlnHvfDtUy1uxXPZnbpSXd3aDkEu8H+FiM5katSgXedUYDwuWceRVw6cZci
 nZT+VIV5DzLkDnSVSAZ9UNj0IgBM6NROjVzu2l/9TO1Ix5RdJeHIxEUwiJqC/zPJqvM2DYpqvLx
 3/1gJ2mEVDXMM6GnC/v6wBxZdxp66JYKADx5z59kf6mcbPxXBG8YUgA1Jjvap5Uih+96yg8crHw
 MXgsaxpI1/K/DzNFUMiNSNH01pwVn6m3FNXGlL6hSYlNkeDSa/SAs/wt0H1k6+hcoVqBKK1Ib1M
 =
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id
 af79cd13be357-7cabdd8fac8mr556719385a.31.1745928576958; 
 Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+WiBW2dMdMKjL5rCtckyag5tI3q0y87zTTMxYAoMUgZTNEX197tRyQ4loVEQ9A423pNGqNQ==
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id
 af79cd13be357-7cabdd8fac8mr556713685a.31.1745928576612; 
 Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d16a85ecsm24278761fa.72.2025.04.29.05.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 05:09:35 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:09:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <lg5hhtncppqy2vreut2z7h36mmnuzn2xhw7asrjmftqg7koaqh@as6jetr3pw3b>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
X-Proofpoint-ORIG-GUID: AM_mT4vhHbJC8BQuSiq2_gWYmbiBd58O
X-Proofpoint-GUID: AM_mT4vhHbJC8BQuSiq2_gWYmbiBd58O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MCBTYWx0ZWRfX5B3NEtNuzyz+
 jyMoVb687RnE+9pxS6WiIHA6DjbKee+D4mkeM+Ity/tmbnIfemxn3DvwwXPWXuGvdR2odXESDy2
 Az93em28+SchVNALwGCF3I3pmxmBnNvvOl6tulK79uCIIort2VrqIORdk6ImiAaGxLsDPGEsydG
 A0o5Cm8fMB+TTv6cnC5KNTQAEvKisHm/S92Zzkd54a+saIyM+5oQtUG+S/HLCBK+2kfbn0yeTDn
 ZD076GTiYAq/6qKwOERaR5Ceiun8t7exDfnJOpDZXYL5eE3L3NXks7Q1v8ozqxXsWlyyyGkCv52
 WAfORDdNHLH771Qt7ivvun0McdC49DT4cLwpE/6yHviVUMiMXXHSYu++Qk3LmLmDxu+a/kLWM9Y
 KquboxSHd1CYQ/q6qMXDhdgXn3tcGaxLAcY1F9qwSUTztR5dZfYZuuG2fj7xVCY3HSbry4/I
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=6810c181 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=iF-wyJFYdUVxq7VKmwgA:9
 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=897
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290090
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

On Thu, Apr 24, 2025 at 08:59:14PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
