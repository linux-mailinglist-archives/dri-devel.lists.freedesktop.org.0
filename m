Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA2CB951E8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCB110E3DE;
	Tue, 23 Sep 2025 09:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZeCg0Nd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5711D10E3DE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:04:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8HHjK007736
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fUTOfCDS+FwZcqnC0WEL6rzX
 QpWMHenFORz2Pkc0HRQ=; b=NZeCg0NdaEWIc6aVpKAcSjXkeN4NcZPTFZl0VW8C
 h+KhLltgxz1cdkCJQi3tyP3dtmbPDaYfb003ZwgzT7t8d2MMasry87edP2F+OAB4
 uk4rYCD66H3hqias6TUnOMSOsYdLqgxvDGTNl/3R6qd9/tDKCcrU1Spy+uuFqv1U
 q8NVXB5oEgj4PeruAZ53MEknQ8g2tm3Y7BpofPjztlFKMpPxuy5yDbFbmRiD8XeO
 22MlZ9rRTY2Y1V474X5nnSEEGdQ7LkO7POhPt9ZY3eVIeGMGaqiTs5JumaYwGUpQ
 7MfWyHuwlsnGMn6/l8REYd/aHefv92PewmeFPtXVNrPBJA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98fwjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:04:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4d2a73f02c3so14456841cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758618285; x=1759223085;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUTOfCDS+FwZcqnC0WEL6rzXQpWMHenFORz2Pkc0HRQ=;
 b=fZ16T4pvmZiSPcpsAm4gMluM1Id1K/VMR/fvkle867AD/WOw6Jv6d/sI1yarT4jqtn
 GcJIgQfVhN/3GUS/Sna0LNwIag1BI4mkaZB/X9Fp6zsvV0f+E5STeGbjOEXm2bBddigc
 7ELEAmNQUwOqVW1Q6u5DctuV5cKir7G8f0W6b5zsOgOj8amCzJWx7w3m0BDiPdX7b7fE
 oBGdslmbS4eM2jtKBKRL4JQuTVp8kl+1mRdmLvuSmgev/9swkfjet2ZnKHv5yzCyyhim
 Qz39hBL8swRhhc7nZ3P+hm6oMEQmzIun2NVkmt4+TYlt+kxkFK//9QXj0cZtQkLjEWCJ
 QZsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT0mcsy8R+jU0dHUyRh4JzBQn7LOLHUDgI2YHaj8XPZhRlY+VZSFuAHUFcuEtJ0z0hwzTkSeUBtEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxr5mT8/66x/hri+kWPP84zxd0f14GnRSmhpA6mivPJAoQ8YzXG
 NnDvs2Or85feM7I59va+KG6M9xIsm6kxynPNmY6VQHoYma0scljzyckhC4i8tT9rbSI8HyMvqpV
 hwjveWAhtIXrURWKfc/YbyVz9h2rceAiWkjJJI9oAd2AItXqhReDtgkP3f38u7ZQx0o2iox0=
X-Gm-Gg: ASbGncsrPQsbmE4+BQd7ITPrLDC+L5CIsyU0+jpTjkqX77Fai3tPfeBg0gdtrSn70+5
 boFcjaNb5mh/GHL0jl3ZmZinCxj9GzUZyBSihPRK1rZAudINohQyoCWsRonLScx10imSjQN9zSU
 xPMQ2PIo7jPE1pVAdffKy9ICuWDj8uC6g2wbHaWS0FHjeUDoLQ3XEY56KirC50JciLbqIrRSwCg
 rGRqsXsHngm+dsisfyY2y1lBqKAnyyT8s1wbD/eLOui0V0n7KCUPnWKRY1bJsNtTBW+hPh4HEin
 lVKysidcjEXaLo7Q5Zy1YfRNfH8C8u1EBuzF/ETI5BRcP834sP8lW5k6RVWi2/sTjH/E9eLgAsF
 cirFAWk6b4TArSdfTBI1bWWWnmx4s9LO5SnP872KM/CVlJexlLPxt
X-Received: by 2002:a05:622a:14d:b0:4b5:f432:c2f0 with SMTP id
 d75a77b69052e-4d371eafb07mr17395031cf.69.1758618284535; 
 Tue, 23 Sep 2025 02:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU931Kwgl5hpKElTQeOd6h1dfpDbzGg0HJJhwyeFvQPBMfFUNm8nELbdeyDcMWwCCj+6H4DA==
X-Received: by 2002:a05:622a:14d:b0:4b5:f432:c2f0 with SMTP id
 d75a77b69052e-4d371eafb07mr17394781cf.69.1758618283902; 
 Tue, 23 Sep 2025 02:04:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57a9a81f52asm2892575e87.124.2025.09.23.02.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 02:04:43 -0700 (PDT)
Date: Tue, 23 Sep 2025 12:04:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen Chen <allen.chen@ite.com.tw>, Pet.Weng@ite.com.tw,
 Kenneth.Hung@ite.com.tw, treapking@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] drm/bridge: it6505: skip auto training when
 previous try fail
Message-ID: <w3t4mfsc2mnv2vu2sxnklntpto6bcbqu2spesagpowdwj2ih5o@k4jtdpafqhh6>
References: <20250923-fix-link-training-v4-0-7c18f5d3891e@ite.com.tw>
 <20250923-fix-link-training-v4-4-7c18f5d3891e@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-fix-link-training-v4-4-7c18f5d3891e@ite.com.tw>
X-Proofpoint-GUID: bv6riB-bV10KbBFNWeFyfYKkrNl-vBPd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX5sm246A/Z0q4
 7AO1qhViWNbTyW5Mb9j4CZ+kmdf7N6+lmnpItugj7TPVC51ZaxdFZdmFUjsxmBIaXOCPDyaGkdd
 7HCf+QI212rJqeQ5yRokesnEJxD+2z9gq1oL8ZQuZjjs8x6LaMDsrBTDtc/SYOvtVZvc0oY6MS9
 wiXQgW1Pw6tZiRQOGDaHatbrQwvynwtwAPXXKbJtUFsHMAF87nQQqyADYgSM15y0dw2OK6wNBEA
 6Yt6uMXgk69gjiGXzsoztsvC9TshwlyXPpgnTUzmfA/m5O3u2CvBBkn4nWZaqmb0yYFWFMM6zVU
 If9X5O/ez6BzJ6L6V1OcG+dPT08YkXeZaFLycmqdwqrE8Fr9SklP8DXNoQQ94HN6IOjN3S8uE22
 TxZstbEC
X-Proofpoint-ORIG-GUID: bv6riB-bV10KbBFNWeFyfYKkrNl-vBPd
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d262ad cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Ns9eNvu6AAAA:8 a=EUspDBNiAAAA:8 a=-4OwpskIBBoZ0mjuRtEA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
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

On Tue, Sep 23, 2025 at 02:23:44PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When connect to device that can only training done by step training,
> skip auto training when link training restart before unplug device.
> 
> The driver performs a full cycle of attempting auto link training and
> then manual link training on each modeset. Save time by skipping the
> auto training if it failed previously for this monitor
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
