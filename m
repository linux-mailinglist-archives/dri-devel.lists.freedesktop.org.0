Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6282CB56DD9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 03:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03CC10E283;
	Mon, 15 Sep 2025 01:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSebP3PF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E9210E283
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:29:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMq1pJ011468
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=081Ts4c6Sl0OMTdPbJAM4b0g
 9D+s7Gk4DCZHTNQm25I=; b=jSebP3PF2GJc0EO0CyCoQ4wOUz8FaULrliEErGkQ
 53bCR+QfGjIC52oSR29edinDzljYwO5dgc5IQlOfmjr51eUFBUEpmFO5r2H9/6T7
 M1HnakzrPNf92HLBHgxkDNjpo78pTh4qGDppZ3Y7O7JTlQheWKMdhFW9aPQLO4qF
 tHhiBGCrqaWQkYU4bv0yKec+AmE+M1d5ZMissAW6L4Jgjr5HYU+AdHOJK4ADybIG
 il6/oJH4gu2h4+0YpSMv97Ud28bYsF2zMv5W7x7IjCCFwx3VIhqtu7YnBt0w5W6r
 Zs3GEd3Rok+Y60JR0Z+SDKhiPV/W7bIjQYYTGc3TjtLltw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yjv35dd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:29:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5f290579aso80867941cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 18:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757899779; x=1758504579;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=081Ts4c6Sl0OMTdPbJAM4b0g9D+s7Gk4DCZHTNQm25I=;
 b=Zdov6BEE/tzFXmabk7RPpelNA8SvCxD8k80tKQPVw3ZjxHl7G5ibV+hECgdpfG4pY/
 q2FiU3kqwkDo+BdpBdbRU/6NoZOVd8N793k7BpuXjLDqLqk6sw5W3r5ia2Cm96Tl9gFq
 +ko38+iRi1OMSlef/pJI213Cfjd9Q1ERAC7LPcijY2yf3X3/OnwwCHrABW+VM/bokF47
 E9GyrEwNgHEmWdk6sVRmmpPy/L6XD2Tqbnet6RSqzaMtPJEWdKA2fxr0PZfAQXnNo+lQ
 Paanczn7nhRbUSS6q31ulNz3z8UyH2dqpawfQjZHOoHAdyXeZ8TR24l6mHu+eGn6kced
 b4Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL526XE0axqta5kI/WvlQVZNW4ZTZOzSlfYTDpt4dZnizLJlNxSw45YeqdlFPbfnoh120LJ2xRoLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCdlJ6nY4696A1riaXpCRms4S2dLUUtMljFO8gqJNpGRDbqWXk
 ftmU9exndOfeXE4ufOOUPiMAxigBtubd3EJRhcXXWCAuznsGY1qyuTAp0DVRDRK9oZlaEYxILIE
 /9ELik+C5G4ReJV5qsljXec8Ad2Lg14mqs0Ss+SQ/l5zPkwhyd+e6TGxsicpX9A/dn6SfOOg=
X-Gm-Gg: ASbGncvaYVp2RgNN1/I4/M0CKiWCJcIIbw1RPCCysKHpmnjYF4+KCnCjUHzuuR8IUX6
 s5b5Kwh9HkQkXFHeuLp2FdxgHi1YVEgHBIcyDBPfQtGwfilDOrxccbzAKrL3rb68UO/CvWyXgHr
 xjjr7xJb/SzmZo0pA6O+UqrGQKpZFVvD/laMg50bgQlGtvfdYLub+VcHLiV8GzX3aTJYMzMkcub
 6giEfqLgCN28X5W6ebSjAOj0NJ4SYXSx9LJOd8ltC9DZATfV/2ZMw/d3H4FR1BtARrPqNpZ2U4U
 0nG0kSElai4CpTKLAvNlSnWsGjSvXrUdsgsE8O+hhdOJuNwVRK4+E/XyGsODjTFltfXQo6BWwPA
 LFE8lmM0SbQbFfFkGoeaUwNmzCWFJa1W0hZ26yWsLrLoQQV8M4+hw
X-Received: by 2002:a05:622a:4a0e:b0:4b5:fc2a:f37e with SMTP id
 d75a77b69052e-4b77d032443mr172471481cf.42.1757899778699; 
 Sun, 14 Sep 2025 18:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfUFHnOueB5jfdanjNOkV7FBhYmPgfOM+8RbjwGzLjcGFLk0hmRdyW5v0/zJDOdx5fQLi0Kg==
X-Received: by 2002:a05:622a:4a0e:b0:4b5:fc2a:f37e with SMTP id
 d75a77b69052e-4b77d032443mr172471171cf.42.1757899778272; 
 Sun, 14 Sep 2025 18:29:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65d119eesm3302734e87.141.2025.09.14.18.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 18:29:37 -0700 (PDT)
Date: Mon, 15 Sep 2025 04:29:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Molly Sophia <mollysophia379@gmail.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH v6 2/3] drm: panel: nt36672a: Add support for novatek
 nt35596s panel
Message-ID: <xi65tabv4sgblzmw52wxci5wsrdahshvos5we5wko4kfcfyozp@y3vw5gt3elwv>
References: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
 <20250913-nt35596s-v6-2-b5deb05e04af@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913-nt35596s-v6-2-b5deb05e04af@ixit.cz>
X-Authority-Analysis: v=2.4 cv=HcoUTjE8 c=1 sm=1 tr=0 ts=68c76c04 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=KKAkSRfTAAAA:8
 a=UwVoJdtYwaWtV1L1Eu4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ydP4e7Tl63UZKCrkaUyoNVCfc6Tv4vfM
X-Proofpoint-GUID: ydP4e7Tl63UZKCrkaUyoNVCfc6Tv4vfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNyBTYWx0ZWRfX8gd6i8Zr1EHA
 QRgQPtSyzc9Ix3TTYr3UZr44A87RACZ9oBMzf8zBJsVIfMQgZB/B/Bn67jsdMlArpbpwUElWwZj
 8QqFlnS9S7XeRFFRi+duhCy06UAmFv+QOWdTqzjdzENmEuq8xDgSbD6bMkjRtcpTx+BcWv4fLEm
 /daJtDdpfaeVlEEdCpqHjo+qeyVe0SZcSkkZL39nF8VhToVdkqsO5TsgQ69kn+PhUPjPGdJq/sW
 un0kTgjcX2tY/ibX7Hs4KAVxihirxqkEW2RzGRj87QFbTyLXwE+aeNEJjtrCBOTWUbX8tZ8hRf8
 kipGhDlrcRyqXOpb3wbkD4GZjlQ2RnbW73uSjYoIJxUjhXdQcoRfz6gyIjtF34C3poK7FyPashG
 7stV6idH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130017
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

On Sat, Sep 13, 2025 at 09:19:48PM +0200, David Heidelberg via B4 Relay wrote:
> From: Molly Sophia <mollysophia379@gmail.com>
> 
> Novatek NT35596s is a generic DSI IC that drives command and video mode
> panels.
> Currently add support for the LCD panel from JDI connected with this IC,
> as found on Xiaomi Mi Mix 2S phones.

Why are you adding it to the existing driver rather than adding a new
one?

> 
> Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
> Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/Kconfig                  |   7 +-
>  drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 225 ++++++++++++++++++++++++-
>  2 files changed, 222 insertions(+), 10 deletions(-)
> 
>  
>  MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
> -MODULE_DESCRIPTION("NOVATEK NT36672A based MIPI-DSI LCD panel driver");
> +MODULE_AUTHOR("Molly Sophia <mollysophia379@gmail.com>");

??

> +MODULE_DESCRIPTION("NOVATEK NT36672A/NT35596S based MIPI-DSI LCD panel driver");
>  MODULE_LICENSE("GPL");
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
