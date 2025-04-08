Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD755A80459
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B7A10E232;
	Tue,  8 Apr 2025 12:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCnJ3igm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBCB10E232
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 12:07:52 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AUiFX027738
 for <dri-devel@lists.freedesktop.org>; Tue, 8 Apr 2025 12:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vFThqq7ILooH+RLGqVKM/XdZ
 cU6OAYhPWLK/0HqsQ6M=; b=XCnJ3igmR+clyI6eG7KCsy4++SCt3rnvgEcoddjz
 hb7g1vwListu13hpLmJk5ufeGmsBt0Qdu0SnQ/QRAtTZfdE5QShMPt8TbeY7A41l
 VFsCbPyorFtJTrjqkySeyNxr8C8CHT5PZGvanfmxNv66Cvbl1PDci8yRDawVnuAd
 Zc+YHj3bC/Vgx9sgZzbgdUB9JZPfXjP9ra1wzTgm9rPrPVNGFkET1SosGzdGwTbV
 67RFqwbcoSc3ZUYaJ5uURcPI7zK7KMC/shGPG8BM8iXpre0Ofe5yGNZJ8QhOtwDN
 ZO3Q//fI/7LjIqCriXeZ+MbfbK+sqhgGbmnKIv263WLRtQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyypsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 12:07:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c3c8f8ab79so864726385a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 05:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744114071; x=1744718871;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vFThqq7ILooH+RLGqVKM/XdZcU6OAYhPWLK/0HqsQ6M=;
 b=cHytqazjOLdHwA35WPZHbsMdlNcna8W5kw9boJirCxCwIqySd80oCSdPAD8MIPaiLx
 RsZRpw7EkEZMqfWs3TCJtfmj+gphf7qgrWguGlk0Tx/w9/eiL0IyMdOIiBzZGa5Z1xuu
 yKN8oSsCD2bo3ZylA/5aPFC1TTTztxB1oXhuxpRcVcUM2vHjqJAJq2HYblNN/F+EebOy
 xyeH6xVIHkK32n++VDMc6xqbZOQ2fTJqd09RVlApFwYAiBh2AqvNuNx1CxCV3cvs1aLN
 aoSoEvJPpF+e4ktCkyM+a33yZ/NKiSob1p0zFPnX9yGZCFxTTDBt596gsiq8IS0FXqcf
 JNMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrv65Mi8dMlTgbpDrMEJW6oY/4o9THFVhCsbFxFRGye+F4jXenyL1P/XwBEcqgXJn93jKpUcNCGWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkIZorCO9N9uydh2863yoEhH6yEK0dVY/iJ8DaBR4OTtGZAqxf
 jWltDSufYe+LA3SsHnh3NSqD/xXBObZ4Quzmyf/2uyGgeyDgbKYR+YQcOjj+2ViQ7RFCNzgKhsR
 VusGsP5k6HcTc3SRnrrHm9aYkdXiNFnWzo14lkEGus4HpzQ2aGKrdUeTirRtw+7LD9U0=
X-Gm-Gg: ASbGncsebQfQ510ZXZ//5Bk2fUV2d5g5O/ZDuqQavHvy0ZYk9T1s6EH+RAYIRBvU5QS
 fuu1y04Z09eEx2kCqxHejGxhMLPvBcX8UHD06V4cVSj7unjkRQRO7txKcM8KgUN5t02mOBNg8l2
 gLKtbbmPIsqEAhnHJdmLZPQjtCTSNgalxAMYPcXB9zjaV3b68z2J+BUxAkXtaPliA63drr/OxL3
 1r6EKGRElFCEp1gfdqvr2y/D5/zACzjgjL+LCMHfqYsf3lC6AE/QWq1PWsEVahDP5XAj+L/lcg2
 wJnQ9Nc4FU9ETccminUp4gUpsFm+mpKsK3SMyZ8Xc7jrHjRjhS6qTyivGRobkd5L+8moGCe1ykf
 ZGWA=
X-Received: by 2002:a05:620a:17a7:b0:7c0:bb3f:e285 with SMTP id
 af79cd13be357-7c77dd62725mr1589590085a.24.1744114071317; 
 Tue, 08 Apr 2025 05:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi/xFz1Y/FUnJgwy2p/a82dsZcDfNqrlyFtWekzBv5M8uIRg3fMoN8KW/g0lGhJUXSQz8Eyg==
X-Received: by 2002:a05:620a:17a7:b0:7c0:bb3f:e285 with SMTP id
 af79cd13be357-7c77dd62725mr1589584485a.24.1744114070904; 
 Tue, 08 Apr 2025 05:07:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e66377esm1493668e87.209.2025.04.08.05.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 05:07:50 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:07:48 +0300
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 12/34] drm/bridge: tda998x: convert to
 devm_drm_bridge_alloc() API
Message-ID: <kgobwv6zldlyb7vxyy4fyhe73krnsjr6aczpwl6agompne3tiw@vyk4m65vaqul>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-12-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-12-42113ff8d9c0@bootlin.com>
X-Proofpoint-ORIG-GUID: QKgAu8hyvp8vxyYtsWNddqHpy-GRt--p
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f51198 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=hcs5bi09U0a-O7-gtRoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: QKgAu8hyvp8vxyYtsWNddqHpy-GRt--p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=963 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085
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

On Mon, Apr 07, 2025 at 04:23:27PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Russell King <linux@armlinux.org.uk>
> ---
>  drivers/gpu/drm/bridge/tda998x_drv.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
