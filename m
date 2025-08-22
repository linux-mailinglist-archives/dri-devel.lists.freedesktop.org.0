Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC68B32249
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 20:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934E410EB84;
	Fri, 22 Aug 2025 18:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HKw7bP4S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D74910EB84
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 18:32:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHUgRq030070
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 18:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2kF+UHt3RQZ9sKwYUnht3JJb
 3AN4kfQFQklzuuzACdw=; b=HKw7bP4SgHZje4mEEpfk1z3YhOK/4j7A8Fbaw8Tz
 6kTekaTVK50xtp+mTMkKWGprk7V4i8P0sQf5OjbCSXWdLGDPBye6e4Hh6fBp1dMz
 ewG1ZZXU9izkXM7D9Pp2cI3SzrodO0rSr3TMaXkT/pycqmbaN/9VSohd6q+keLQ/
 9CPEiWVBInMyX6j47qsl/ihYz6zP67lWJS+NqpmawHwpJsoIHlFWRBwroJbZ3COy
 YsuXRwXtV7QhvgROmphYmH1redEOuP4Al6568+u7qq1a4BOCOZZv5L43i+4fPTWG
 i7pzLbLOaeezuvqMUh48mTxmpkRSG7SgJ9WdfwlsdBUVog==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw0yr67w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 18:32:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70d7c7e972eso56248296d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755887534; x=1756492334;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kF+UHt3RQZ9sKwYUnht3JJb3AN4kfQFQklzuuzACdw=;
 b=Yh0EjamVX/hdPvl3qpTdWOfcjNcV+VPFzEvUjyauPWaH+hWcTIYkcjI3ImqhuKdtPC
 XOQuZQyjgeDEdynETI2zLOOMmZAW9Zg7eNjoBegYdKW1suA5Sv8nH6qghRZDAWPvg4/D
 gEhEN1BM+L3jmhI8VQP/0lUwZ7NoB08oPI7gwRt85QcUjqwHaJl6A4XU+9eGra+9gM2L
 ZiUWQm8RLPXm/UoLRO5+f3cNgO9B/03eIv5DwMu6y8E+aJDpOQU6e3VgKHflFM8Yx91w
 YuRo2CMviqb7nb8b5YAKFMrR9Foq+pmcha6lBj4e82fg4X4IW8rGz5OWl7jNMOa8JZ/A
 VbJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOhJKKGbV/RnMd7lrliGkqYGXQ15SU8qMZUMip+uBCJi6mk585O6U5cOhHD41fjQM/YfhANxBIIkY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTPyRIVt0ZE0ujp8aK7UtHh16PtqaYJ3DLlja0qIxJ8FYV2raZ
 F9vCnBboGbSA67bVit8Qh6NkFon6EoQffCfyWNTgLTc3OLC1DkBgqCYAWxbxpp1tV7KM9oDh+QC
 M1J5e7n+v9WhVp8xVmZRLsXfsqiphGChOLPpiUsi9ZPVDrE6g54Zt7N0NNPCxV08pLeakDLg=
X-Gm-Gg: ASbGnctawMOocI4ayK4DrWqxFngRJMT/QF1kPIIUrbPd3wjsX66QdA/J1R+xZDQJR9c
 rvhucJhMwMd/aXX+JwL8tTiRm9VGT4wXR0zlOqm8K+QavByLv5xLqRL2eC74Ao0L/4Qqtwuf7JC
 htCSAfEJgjHrlQso8rwy3egB1yKvHmLgwuTEFC80/2Apenb5NB5re8N17+XzcN59rlNpvu04Ym5
 UxqDrhgKXJ196ZxsHcuOla2GBi5ifoGj/daQv5s7XgcFIvWVo3LLueJ+p2yRNu9WM8WLnUUuESl
 T6E5TUZt/7dVlt0wBf4nm4g8A+GWQdIcn9OT+SmAHpS3J42Dva7OmwsucrSM6odsQSeijeh+bvJ
 VAe3/U8Y0GuaMi7ROJHiASUl8l+qMmxrsu04MW8S+XVah16711EQf
X-Received: by 2002:a05:6214:2463:b0:70d:8549:a9dc with SMTP id
 6a1803df08f44-70d971ecba5mr45207796d6.46.1755887533671; 
 Fri, 22 Aug 2025 11:32:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGUwecfBarwnXQpcnjnUt1xcMPQBcCSeakWpQc5KmvE+AdTu302f3u+QjNzhIWHgctycCfdw==
X-Received: by 2002:a05:6214:2463:b0:70d:8549:a9dc with SMTP id
 6a1803df08f44-70d971ecba5mr45207446d6.46.1755887533192; 
 Fri, 22 Aug 2025 11:32:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35bfcb27sm96296e87.19.2025.08.22.11.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 11:32:12 -0700 (PDT)
Date: Fri, 22 Aug 2025 21:32:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] drm/panel: simple: add JuTouch JT101TM023
Message-ID: <4gyzjoshra7mwkagkhbk2uzxsfeb57ufkr2qilppunka4cem7n@zf7rm75hdd2n>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
 <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-3-b492ef807d12@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-3-b492ef807d12@pengutronix.de>
X-Authority-Analysis: v=2.4 cv=Z6bsHGRA c=1 sm=1 tr=0 ts=68a8b7af cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Acj4BH8ZA6BBt8B7gSkA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: tRWAPCyaj1MH75r3KOajvbcXmzFqFMoS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfXyXm0Qy2nqXBI
 JkyHM9DRoq7ydQbDcfNQSMe2S0WKlSmfvIyijj8xf7Bxl0IHm7udk+p7uDFEhtEvlQuX74kMzZ+
 /rZM37qUVWgT4nM/+L1wNMBqVLQON8jysEIDgyP+n/F35FhuOEz2poc6b0VcFMv0UqSnKvrv2YE
 KLARlAcPv7XB0sijs3P7lZj01N6icXFNEs/YgM8njbmTF5/CjiGC9CZJf8oc1KunpZrK/+a4K3e
 Xsj8Y8j/bs7fCo6K0UyuS8P0NlF2C+94TDbN3lCaKERq2GI9dh2cZkyFRWxuysnbwNbTEggyw0Q
 d77FOevjTnMv+eaAlOOAigxTailS4rle/FJGQRjNZ4H3tr5CejSY0bFy9jNz5af65pr4GXO8xOh
 aobRt8N8
X-Proofpoint-ORIG-GUID: tRWAPCyaj1MH75r3KOajvbcXmzFqFMoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220160
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

On Thu, Aug 21, 2025 at 09:55:30AM +0200, Steffen Trumtrar wrote:
> Add JuTouch Technology JT101TM023 10" 1280x800 LVDS panel support.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
