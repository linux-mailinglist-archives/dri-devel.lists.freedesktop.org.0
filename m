Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250CCB50B03
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 04:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDE410E2A6;
	Wed, 10 Sep 2025 02:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6H7TMJa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6592710E2A6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 02:28:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HfWug029173
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 02:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BEuNpwDX5WqbqkKQ+ekf9ZvF
 gIZyS75gI3370C7Q5VY=; b=g6H7TMJaF+7LM4zHorGA6+Wz4TLnwS/j5yEgUC2g
 aZY8LtMby3tPFOypF6xizHIEejXZo8bz1X5zjIGCN5G4tUN84BOEssWk8wsK41CJ
 pzi+Lu5Ddzs53PQ26mcGr7ssMp1DjTNWDYZSehKB4OP0kD+2210E0mwiAiYlc8t8
 JXn+OnaL9VlZD/2Ho6cbeXfIUrLPsJlwuwSjBcnLCOzOWIUkzBjdAeMutktzMumS
 yHm1ofORtvgq/AqF1fYdtKh6FRxgLgcs0Hf+cn261orfZ6UqpyG2+Szy0Q2H083Y
 4c9+44mVvtuV+pRoQPuQNrsJvC3pjeMxH4R98yVRpRFfZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8jam1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 02:28:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5ee6cd9a3so121564461cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 19:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757471324; x=1758076124;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BEuNpwDX5WqbqkKQ+ekf9ZvFgIZyS75gI3370C7Q5VY=;
 b=gUD1CPAYMqJAZ4zkgcvSKrJ7ZVOm0eDhPyO6igS1H6F4iyxb6RRWMD5i2CD1XgToo0
 0QsAhpOOXm+UyaLR3GpL3mUqm27fDhv9mMWlYBkJSvumY1NX2Fomop9bTFKvAcLC8WAX
 AR9g9UaIQv7mhxYkJHTSEBUU9Qj50QaHgc0ezKDJ5SrotjharwCT7BSbQ3hf+OH/iNUL
 qVKWGhafsrIsvqj3+Zlpv9jwvkUGYg5TIymssh074NayR6k4GRjAILeQG2u3zpQTbWX4
 75WA6h0cuOLp44RqRFXbMMXWcWFgBnqZ+n5+aoxa5uaExfWveeUhwQrX2yT/bOB/ZCM4
 7c+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2Z7nCCVc7MEeIEcpATMAkkZ5xgq+uA2Rv7uKrNGsnuNCDURvkukamlvp4j4APC6BARM0mHTBKHWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzavEzpRZ71rhtYZoohFZWcP/R89ZkuB4If+sLydrk+xsD11wDg
 NL31Hy+TTyYW7yl9OtLeTJlRLNHsPN2xmU3n7RQxbR6VUqdE+LU/441ys8M1ig51gO4ZQHSUeAT
 kjohj8zewPba85KJ5Ies36PrQ74Kx1v19OKZm05FMZ0VJUu+X9DQK0mxi9c7aB0JZ5Bb9BTg=
X-Gm-Gg: ASbGnctBlX9S16bu1G4z/6Ryr6iSz4o31ewIbjIxND+uHi4GphrSa2WTNIWb/LAOp35
 cQZ/J0ulW5ipVHt1G4pN4PHHOGWvrquOKuoS/LwcyTrMdTgUcYzxkOdxLnzXCkB8vzsPhkYJuMP
 +znB0WHOlgMYk+/g6hHLJfZM6Jlm8snbY8YvMSpn4sv4EEfOX+QbOeIL0rcqthKNazEjA1/R/Vz
 VFS+PM46n6WteqYbvNcj2q+cfqRt9Vpaqom7xjjp9qQyOxHT/cQm4q3KOhMs+eSVXqP/O3iiCh/
 fsjMzxNsL0fHCicrolIGccYWX3URsD1ukjNEqEpNV6Pdm89wjOlK2ZK/qZ7eOEF4OtvWv2fwsuM
 9uxvpWNZSdwUaRF3pDL676mfaNuvJDl+k+0dTIZxTRZ4vH5SwwRXX
X-Received: by 2002:a05:622a:1993:b0:4b5:d72d:b7ae with SMTP id
 d75a77b69052e-4b5f838646fmr134497011cf.12.1757471323562; 
 Tue, 09 Sep 2025 19:28:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9x4MbBvbOKD0aSbVoYVr74gE1dB3oNEVQmR/pRvVCyBH2QQ2/LD6VQ65xHAMLv2cOjrMnKw==
X-Received: by 2002:a05:622a:1993:b0:4b5:d72d:b7ae with SMTP id
 d75a77b69052e-4b5f838646fmr134496841cf.12.1757471323116; 
 Tue, 09 Sep 2025 19:28:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56817959addsm909011e87.81.2025.09.09.19.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 19:28:42 -0700 (PDT)
Date: Wed, 10 Sep 2025 05:28:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Miguel Gazquez <miguel.gazquez@bootlin.com>
Cc: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com,
 kory.maincent@bootlin.com, romain.gantois@bootlin.com, praneeth@ti.com,
 Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH] drm/bridge: ite-it66121: Add drm_connector support
Message-ID: <do5zciwcanpiciy52zj3nn6igmwlgmbcfdwbibv2ijxm2fif5s@ib6jhzi5h2jo>
References: <20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX7K6zVfAc/Vi1
 x6Oa9GwLQg1Klyu4Ftd/r1idVBSDu/JvSee6RHrmKFVsGgvbX4Y5cwTBfTBzrgQsIBgO1W5MUDR
 J1xFXeSAQZv73t6xP2XBkt35w2IdvGFCknjSAnPBRMgvIXAyx3Zk9OElXUarW2yQOZFNjalKnAm
 9EUzhmRZN41lxEfAFWcEfLomy8Wc5iR+OnRUF5Af/ilgCF9AajYtWgCaQ+LNXAXdyx9TCRIDmeo
 AU4ZKWrIc7o50EE5dWC3vzGw8f2BvciEoB+uEICtaaHoM0+ykmt3AwHkDznHHsFez/JHI7lclcB
 xZ9T0+sCtX7BZH8dVqrm50thJpv248ZQxKmaiai4g0uzEzpi12yXzHof8cLWn2OG+u7LnNJm2O8
 7YZwDru8
X-Proofpoint-ORIG-GUID: BNGYcYux4Xs23mVZ6uAru3jFm22vApjM
X-Proofpoint-GUID: BNGYcYux4Xs23mVZ6uAru3jFm22vApjM
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c0e25c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sozttTNsAAAA:8 a=P-IC7800AAAA:8 a=odyaA6YF8D71xn_2CwcA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On Tue, Sep 09, 2025 at 06:16:43PM +0200, Miguel Gazquez wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> Add support for DRM connector and make the driver support the older
> format of attaching connectors onto the encoder->bridge->connector
> chain.
> This makes the driver compatible with display controller that only
> supports the old format.
> 
> [Miguel Gazquez: Rebased + made driver work with or without
> DRM_BRIDGE_ATTACH_NO_CONNECTOR]

What is the use case for not using DRM_BRIDGE_ATTACH_NO_CONNECTOR?

> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Miguel Gazquez <miguel.gazquez@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 121 ++++++++++++++++++++++++++++++++---
>  1 file changed, 112 insertions(+), 9 deletions(-)

-- 
With best wishes
Dmitry
