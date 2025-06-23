Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC45FAE5592
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 00:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE3110E46E;
	Mon, 23 Jun 2025 22:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mj9cOBzy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2690810E46E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 22:12:34 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NK5tOm027443
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 22:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lg9kP05buSmu9VAI3g+rOYfzC3a3xuABElAlMyKM+8Q=; b=Mj9cOBzyXlMx7w8I
 ndTERVXglPq09GszZZa54iNttLwY2cFab5mLBJAzDkOmNLrGUN8Knz0U7Pa9RKV3
 2GNJgFpeVJjXTqzclyYHH7Kus4Wh830nKVPglYDCA7SkHPO3SI9+uxKL7lv+AO54
 GEJEDAxWx8pkErm8QCnZ/sKtKxj9bPHKz7mj1MBtK5+J1InR1JY4vRcqFOveotuv
 tRyaKszm8mUOqHVAKXrcyQZkOJEB9XiSpJU7qiTRQCfAbsFALg7Mzp4xc+rx6gUW
 fDAWzvXf2uImKflF+6tqu6OrCsQvmhMNxah2fUfKXSWh4XIEpEZKfBhED7t4++Hk
 YG9ZyA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4kcjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 22:12:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d38fe2eff2so791851585a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 15:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750716749; x=1751321549;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lg9kP05buSmu9VAI3g+rOYfzC3a3xuABElAlMyKM+8Q=;
 b=Uvb0ZlUutmDEHdgmV1kdjLBLPPsLm2jeBJGY7i9GY8giTqLut5HzgNpO3MKMFq/jKe
 ExS1jE2jzSyuJdcdCN2mPEl6WAgemnmW8hDL5QF1Mvs327w+CnxtHre/zi3/20QZyiLq
 bitlHowTQfppx5D9s6FmxfvotGIxh86WiAby/HI4LiaqQL+uqlX3J9TP4jlnrZAJk7hx
 /JWmRJslzBFrwdWEsvW6A6gRlKeAcSVIHuAczAhvXahA/i57LklXiVQdr+3eCZ4yw0hk
 JZn8zkNgzipk2MtNZmapk+DnzshqfqJ8Xf4YaTnxmm1zMjGla30maRLFHkpoIcnl7sxW
 ymTQ==
X-Gm-Message-State: AOJu0Yx0YpwUshnIZqPEiuEN57StvMEK5+VxrQ+pfLFmSelsX/u9RRug
 uDwDqL5oAmRabG5OAa2aBviZPua55wRu3gqcr9wYjlTrCxTSiTrR8J4UelACEnPO52D+Q1p31T9
 9UE5LBObMiApqrisfBxMRC/BQypLWEndwv6AdJkJOpYH0lNz9PcgYAPFoWAE4NOWk/ptFr3Y=
X-Gm-Gg: ASbGnctN/LgrlWlmFy3TDy57qQM2HIqwopJ44iN3vwI2o26zx/gOnCO8X2ZgWRIpMoO
 rRWF/Mnho2PrVZ2Fy+2asjmJdOtc7i5CX6XxJsD/jYp8HetBdAlGr+fFe/T7kB8jD+3fAf+ZPxG
 gf68WpS8fWUIQNaA+EKPR03YOPDe5A2siK7Bcv7a6biroRW/3N3ZxCdxVlZTrJrlcAgRh7MgHwG
 W8zTZMZLWt79COtaAsZ79Fgueisz+d2zNmyVGn/XFOGkSRaNGJ1rblKrumgWzk5ajMBZjDg+OS4
 4LBiA+skR23KMUftKdTo8W26x4kDemCdiiZpl//r3aQ9MMCTgD16WPSQ9EJq9/LD4pdeuDSC3DY
 =
X-Received: by 2002:a05:620a:4720:b0:7c5:9788:1762 with SMTP id
 af79cd13be357-7d3f9938cfbmr2031239385a.45.1750716748693; 
 Mon, 23 Jun 2025 15:12:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3fWlse6jUFEkXEfv8g/TYyqD1B6IL/3srb6MgVSJ90D+r/uAFrwOBMHUObcgRjBtB9QiUcA==
X-Received: by 2002:a05:620a:4720:b0:7c5:9788:1762 with SMTP id
 af79cd13be357-7d3f9938cfbmr2031235585a.45.1750716748280; 
 Mon, 23 Jun 2025 15:12:28 -0700 (PDT)
Received: from [10.132.167.252] (37-33-208-94.bb.dnainternet.fi.
 [37.33.208.94]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e41d806dsm1579546e87.241.2025.06.23.15.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 15:12:27 -0700 (PDT)
Message-ID: <d48a235d-aad8-4978-b4c4-ed0b3fce14b1@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 01:12:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/bridge-connector: Fix bridge in
 drm_connector_hdmi_audio_init()
To: Chaoyi Chen <kernel@airkyi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
References: <20250620011616.118-1-kernel@airkyi.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250620011616.118-1-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=6859d14e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=D+sM+DASzikqaCSeXxPSkA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8
 a=sDl0zNJMTKjEBXQ_4tMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: cFl49rUAZjsszXdTgmAinch5yp-W8pA5
X-Proofpoint-ORIG-GUID: cFl49rUAZjsszXdTgmAinch5yp-W8pA5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE1MSBTYWx0ZWRfX+YrqLa4PlKUJ
 E8/SSaJNPnRhhcEoeWIzo0/2unSRSCWh3pFtmyvkxQXcDOmPW0FT4fVHy8j0ZkFpE/7n65wyoud
 dRS7bGhYtuYa6NxPdBDnn4KwsLbtf30w+/4CBUEgluku7zLWYbPRWUgnoenrZI9InzTUEERDQzB
 73tCQSoOd+GqiJXsCfumXrwznMId8a+IorGFhpxnVKHOwLUPtsjhwuz9hD0pC5UNWM0bhiN0HP8
 04yvUlQM9FmVUWLt4RZU6NvAAnNdaxl8ii+CURhLjY9ti/3tMT7B+Ou7U5QnGc4XbIMvefAlVaY
 fdNaxOyTQl2TmadNcjq+P/KAC/5x2qMMPvqw8TNZ8npRAYFGGFb195+2A4GpW/FJvYtd7D7+kne
 Efs+YX3Rm+z9VYo7sR/fmzkT1hgWpRB4VZRUSutvbE3Lqzcju+1YM3y0iWx4D1P1l4JGDar4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_07,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230151
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

On 20/06/2025 04:16, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The bridge used in drm_connector_hdmi_audio_init() does not correctly
> point to the required audio bridge, which lead to incorrect audio
> configuration input.
> 
> Fixes: 231adeda9f67 ("drm/bridge-connector: hook DisplayPort audio support")
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>   drivers/gpu/drm/display/drm_bridge_connector.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
