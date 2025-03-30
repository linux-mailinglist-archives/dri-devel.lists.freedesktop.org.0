Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3CAA75B8F
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 19:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6629410E335;
	Sun, 30 Mar 2025 17:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFUec8+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3805410E335
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:52:33 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U6dkNL018886
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yfNrr9IWXB5j/RFLxcg5ak0n
 +LLaTpY+LShrMT5MZf0=; b=aFUec8+YWE1jnyv0nk/UwcyIDxhVVm/YbGUA+jt1
 kB1+g/9hulsP7Th5jWEjH4OsgzywWxhXU2h9XSZCxl0pdUCwiey4JcpYzLXajBlf
 JqcWj9i+knFv6i+zvuoUJApQ8X04Gd5XxAYMlyESWeLU1v1lH0xYDOHneldKer7h
 lCjIm5oza06P6dRV1pUFXEWCtzhnBaZhyyS/azLyZahyIBZULLBcju3jKyJTxOSz
 Mrm5om78MEYR5cIp+DBoZKMuwp8EIZQE+o4RGVjzXoM56bFC9/PuQGSJIUiL6NjA
 C++vGODQhgxbE0WaScqwObvkDfm39Uo2V4r6HjYc64HDuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qauh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 17:52:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so617508485a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743357151; x=1743961951;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yfNrr9IWXB5j/RFLxcg5ak0n+LLaTpY+LShrMT5MZf0=;
 b=EvLws9VUdNZ1qN9EFmAJgiypgFo/yljLHgz4s8WpRbXs98FYb8XiIKDiNKg4xX4QkM
 yvxuDBbrBl6jo7sJo2eySE8lslOX/Fpo+Rtggce8OmhxYNIdZJslRepgCee87vXtABaJ
 JXg2dX+hfyvpApA05cjD9l3NgIjltOBwV1BI7QeDNI11LpgTAqP/8VJdvFmnwHB+NXrZ
 qmzH0ZdGhrrMGUirEzDjskrvCI1jS1ojnqH4wHWp1U+dVv78vlWQ0UFOJu+wXvhOggee
 I1oLwo5uKA3KuLppfWpc4gB6XuawsIxTlxuRF6Wyvql2WTjQhnxXO1aly1ZYJ7hq/e8c
 egkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8N8zMN5co0Qoz4UzJOhqlhGOthkFheDZyV4uW/r/KQsUzvyM2It4jQyORghrhyGNqcGmgaEj6xrQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz86u0/j6wCYnWb6a9J/uyaxJyB2h0sJbLEyt7Xmqab7mJmw38U
 rLi96In/iMovYqEPkyBUFTbU4ksMn2c9BsviumsrjGh6jTZGNNN4cNJ8qiMD1YrIA0GymSosP1n
 1OmGAbk4KhWb9ppKIyhe2sAqFwbFN6eLTWEE6JRmq3SdSKOXw3T/PMiA+nowlD7Gflko=
X-Gm-Gg: ASbGncuNtkSjSppRTu1oP6Su8B8cpXRjhtRM0ITQhjYxr92PGFVfjv33XvvIc1qoY2i
 LQI0xAQbv+IGOK8wjksMlNw513wWkHUsUon4bO9WvRnbm2OADSQNfDJs9kmeNkZEh5GjxLeTdvq
 6jel63FUmrHfpKmKHbuXK6ra13nf0qor+0XgEP96QfsAxmBAuhi/cGKqVKm09PYJhWYf3ggeWCD
 GQKK/dPkLyVPIiMWTRZAXrtEeTBtkhS6tnrgaT+bvEHKiDeryWRweSQHXdlW2yS4jqjMEqQI0nn
 IYDnV466NjQXrmEpxA4zniwzWbZ2kI+CzLYNoBD6wLi0a/V4IiCVj7dQneRWGErVkLl90UWB8ky
 X6EA=
X-Received: by 2002:a05:620a:462b:b0:7c5:e370:5c3 with SMTP id
 af79cd13be357-7c6862ebacamr786301685a.7.1743357151451; 
 Sun, 30 Mar 2025 10:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy5zLBvgqZ9PHFag3iQjcsiuGTjpjVXIsJR4FiwTqbGCjzxceuXoViknNhd3e/sRnunh8apA==
X-Received: by 2002:a05:620a:462b:b0:7c5:e370:5c3 with SMTP id
 af79cd13be357-7c6862ebacamr786299585a.7.1743357151150; 
 Sun, 30 Mar 2025 10:52:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2b4cd28sm11640941fa.70.2025.03.30.10.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 10:52:29 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:52:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Charles Han <hanchunchao@inspur.com>
Cc: victor.liu@nxp.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/imx: legacy-bridge: fix inconsistent indenting warning
Message-ID: <444lkvxa7iuymc6wx2gmcsjm5zv5wa4nq7dyhf4nkxmtfaxrhv@tm4hpcsoxo73>
References: <20250325075503.3852-1-hanchunchao@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325075503.3852-1-hanchunchao@inspur.com>
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67e984e0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=F_93P0QhAAAA:8 a=EUspDBNiAAAA:8 a=hZwuMZaz95D9sbrnA4gA:9
 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=v2fne3mUlQEKA94IZ0Od:22
X-Proofpoint-ORIG-GUID: A9ncceMN0Fg5T4Y50rCHWiiagedvI9I3
X-Proofpoint-GUID: A9ncceMN0Fg5T4Y50rCHWiiagedvI9I3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=751 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300125
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

On Tue, Mar 25, 2025 at 03:55:03PM +0800, Charles Han wrote:
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c:79 devm_imx_drm_legacy_bridge() warn: inconsistent indenting
> 
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
