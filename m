Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9159B4FF29
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307A310E76C;
	Tue,  9 Sep 2025 14:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FHfDzJzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD91310E76C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 14:19:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LTiI032460
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 14:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YeTPR1k+vZU309IbiC+EpuyW
 WbQULc9ECz+ibWI8mA0=; b=FHfDzJzFEl8h7G9RZyps3VseA37OKrkpWMIL4s1q
 /WTgfpefcoHBPxIiJSBEYyCl3Qb01pR2D4oeCRHXN4tTqdjJ0TTUQwFI9AJ+H96S
 Lujkogr4D/m3Lrx/C4sohlt6QZKV32dD7uouqLjmFpvx6glOYIyCcX4nM15rzXzR
 bDy2YfJuEjngqe7j0uQXECGxyQDYS5eatpJEVNnsBAnQnS9gJiRg1YYrjp/M40M+
 Qc0vks98ad5HkYGURUCGgMRnZJMVyOxpDADR30qG4xHwiTMIrDhnW/rhDrtPSzAS
 k/YGkJlFKcm601EIN+q+zpisT097dS5bSnQV1/bhPtYBGw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m0cb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 14:19:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-726a649957dso122178306d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 07:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757427560; x=1758032360;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YeTPR1k+vZU309IbiC+EpuyWWbQULc9ECz+ibWI8mA0=;
 b=oNJpJY2j55F1m15hL0K0+wnYfS0YdVIyUHGWatmuPHl4/jssswxtjfZZfq5Dmjp/cg
 nxzEkOeUy6mrgSfXP2DCuu0Xz26fZBsqLB1FpIo8v8194uEnB8pR6ixoDa+c+ZhqFPcD
 39bZ/b7mVOp43CbeN3yKuPKx36mh22fj0nKRS1qKLqHgUnLCw2q9QlcpOCWhVnQnajs0
 9Z4tNLWZy4rSJ39SF9ddEncGLnC5WuSUDWg+22P2yE0p87bYxX8zD6uodbiTyU9Xs6Oc
 ogtrCVdwlE1+2tYVwYn5xjOY0r9SQ6UWK84z/7rxGs6uH+Jt7T3Oh5F1tytiIlt2/DfC
 MPDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcuA17PNduMHvr7kCZdHLQOxS3rzq80udvJISngTVUnVOnA1rrx+0m8nRA0wxg1mvOOoqHonVRbiU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/kwKYJDyesjqZoN68AXDepQ++edq2Fv/wVidgJsY0Y9WK7ttr
 zJt43QO1dXstk2La+g71Xfuc6gh3TuHpMr0D3Pl9vQnFhs7EsSrq5k1AJ63giE6yXolT3/hIjV6
 0b2aGNr0rhrdRdz9dCebMZA9cACl/UNDZHTreEKQkuHxf8geBAvCp5eNWz/crPf+vhisoOjg=
X-Gm-Gg: ASbGncu//WKlWBQpxBkwaES1hBaPDRAbI9sJJf89pgLvqXkdsapvxrAFEQ+K9X/Bflj
 mea4cpEhA7KW23ZCnpQ5dJC7oeQqXGrdX+aMu8LbyGYh+RuOigZ1Vn7iVmUmBx9HUHUA3R3aydv
 Jzv5hHR2aCOFZqV6PHRnHg3rQdE+zFRRQevReewoiDHjqQmwhRiGolCJ6mYoH4DPHW4Hu2L8E9c
 5hozYuchVPd7Zh08+MROinFpy6yU0R12kEyM4tItpXpg8uVyUZ4CueIoS2mnR+vY1pzdLqbgixJ
 vv0hQdVdXDOVULSqUr2g8KV0+W3hqu/eNpNNEinnka/hkqMQ4u5u0iffZmJ7gSNJKFlyGNlj+o4
 mnaOAmIDahK+N+8Z38Bwp1Do9fnlBIgcGTI3wpszCDv+ivSa60MdX
X-Received: by 2002:a05:6214:4c8a:b0:741:52cf:a104 with SMTP id
 6a1803df08f44-74152deead4mr117448686d6.5.1757427559542; 
 Tue, 09 Sep 2025 07:19:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMDQ+c0Z+2OHKURnsCRqbskK4wF5XETdbqofGHwdn68wRh2A/5/TcMfO4/wpV2hv1CVSa5Gg==
X-Received: by 2002:a05:6214:4c8a:b0:741:52cf:a104 with SMTP id
 6a1803df08f44-74152deead4mr117448126d6.5.1757427559011; 
 Tue, 09 Sep 2025 07:19:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680cce88dcsm561199e87.47.2025.09.09.07.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:19:18 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:19:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/panel: Add Sharp LQ079L1SX01 support
Message-ID: <varcinx2i3jtuu4jfsnfpyuh66mdvqe3caolddpsnw23ummpjf@yji57dunb22t>
References: <20250909073831.91881-1-clamor95@gmail.com>
 <20250909073831.91881-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909073831.91881-3-clamor95@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX+VNmQOPD2N/o
 t74YFvvUciBnmenAiuFIPYiOzJwoK0YVhY2gOcidEqUmKJwGfQBECh3cXE99iNYFaS7eDHpys1r
 5q9bIiMsw8EgmLe6ku9Z3ldPSmQEG9b0jXqV/YkLbiJ1qBwuD+q2xpx2zVTUnEPvfzblUqiafKJ
 PDKAo8aPS+b4tMZHAQuJ+UeSI7BDOGwBuFbfa12KANNQ68K5+TXZ2lfdAr+iV7qYQ/ngIlLDpoL
 +ACHd/wc7pBSGDazPsB+8eV+7ZiSnVy6NW0/15PekZ70yhg/0+0+91j/li0QX0fPw4/kQ1Yt3Gx
 VIjd5cVnnudF1xiMiv4LVLYJXfJrCh74lwfqgxtWQJJowjxDZOxGp9bqSq0WvcE41p2LeY4QW12
 62GESUYt
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c03769 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=qYIr1XgVyKI1DLWvbXsA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: GuOa7RFzVZAcSnOD8yQhWVpraTYH2Uni
X-Proofpoint-ORIG-GUID: GuOa7RFzVZAcSnOD8yQhWVpraTYH2Uni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On Tue, Sep 09, 2025 at 10:38:31AM +0300, Svyatoslav Ryhel wrote:
> This panel requires dual-channel mode. The device accepts video-mode data
> on 8 lanes and will therefore need a dual-channel DSI controller. The two
> interfaces that make up this device need to be instantiated in the
> controllers that gang up to provide the dual-channel DSI host.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  15 ++
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-sharp-lq079l1sx01.c   | 232 ++++++++++++++++++
>  3 files changed, 248 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
