Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61549BA1726
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 23:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C8310E108;
	Thu, 25 Sep 2025 21:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0VOHOhW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7143A10E108
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:00:20 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQQCO026539
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J0Sf/sBWadKXsMJGTZZ12sEI
 LrsGXuVR6yrh2onEh/I=; b=M0VOHOhWE/Cx9fVGigWqZ3bYbPn0y1apqtVbeGMd
 lnrnbt8IQaVzwyMIw+itSBFXgJJ0XYnavQSHF/Vrmd8aqExIL/6rW03dZcfulQAv
 f23oJXiTbEI3W3VbDrBT2G8PPgXwNxKUnHTKLKkRJaFW0qaaGaLy0q07AM/rMH8e
 /eOeSiWuZQzRBwm4cR8yqWqHOaOrVleQ753l8Fe7BYKuA9X73d1EoPp8iIUX64hz
 zQ7M8Wirx4vT94oRenIRmOUOH0Gf0FW92p6lC3XgoUv6f/IENciZXOnJy2rK9cfV
 vD5fNIxK8JDKaxVBuSw0AjB4L9KPJQTmo+N2xxTZAT/pwg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u0d0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:00:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4cce66e91e3so46653231cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758834007; x=1759438807;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0Sf/sBWadKXsMJGTZZ12sEILrsGXuVR6yrh2onEh/I=;
 b=QsJsmtfha+cP+DXhsOFNVjh0q1s/8u4x5OmqIb79lBWSIwg48DzMukpxWz3g3dwvQj
 GtVPNdgx6EogtoF95oQDw6qtdwUjEA/tU92KNamsCsYCD+p3pPh+pTCBcKCe8hEG8oyK
 P6ihfqFyOG66/geghTTQhA/t1pAs6WErk8pe/ikpYmUXZiadY9zniSPDxwdTCHYZVmvz
 6c0fLEe7lfIvRczBY7bFJo0kpXBThhzHntV24F1tWpliSerbirJb5vYPhQWMEGooJwBY
 l+0zAehm+P1Fp64tiJHCDV5LrZhR00UsZ079hthhtj15Yzq53/w3LVbvY5gn3oAKEXbp
 R2VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8F4Cl3Prnd/ZHB1mK8KQWNICk6LmlrPyd4NN+7NXWi5Vs5ENrGxXxifvDc0p92IuDHnd2Mdsz/70=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlCUFlNy0ozgpeAEfoOoyUbsBeln3yUSR0kJhioD5pnci0m3ee
 GmbeD/0C6w/gmyxiYQfWQvWgj6Z8OnRwhoFfPkQ9IE6b9i7IhLODGaIjeRewcsFs2BvhJWTTFmD
 fgRw8XbLTyzZGmWlor5+Iukv0PYal/AQwOKN/TPgIF9Tdis33bM/lHAx6yH8i/dgk0eTGDu8=
X-Gm-Gg: ASbGncsdh5nI8pombi3Pbi9M9S86Xa6ICmx5Fw7lf2ylyuWwcg25P54/gh1IIhI2cng
 kJklfwv6QpNYWFY1NrEE0SVO4QyJjYijyVKitT1JGWjmnkWcSq6SOSPARSuDAUzR9n3RUNWzG5m
 i5gTVfThxhkyGkpzEyOWaIzplZYfIOXaWFGKRdxG9rv1/5CdPaMmEcfPkqz1Z4+0rOc97WcExB9
 8Hqaf52xEwpXB37fQ8TyY6Ps1QLJcoqo11y9WTHSPUzzgHA9m2GLmt3g+094itET5/lFuCxk6La
 ik2VsJzGzlVD5ShRLTTalhhKaR263QsCRV4MD28CdQTp1vWLvomFujq5uuPf+3VDwjMmhCN93k0
 uNtoCsaMLpc4RU1E17Sn4+LswJBRQfMWDwIwcR17GxmN66nCK2MmC
X-Received: by 2002:a05:622a:a94a:20b0:4db:16f6:9049 with SMTP id
 d75a77b69052e-4db16f69d23mr37264841cf.70.1758834006864; 
 Thu, 25 Sep 2025 14:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSqyJMyZZeC0SdYv6VOMpLT31YAW82OV1CV5+LhKhpeDE/XPG6jushTLuxUA1OesOxbqQQ/g==
X-Received: by 2002:a05:622a:a94a:20b0:4db:16f6:9049 with SMTP id
 d75a77b69052e-4db16f69d23mr37264331cf.70.1758834006373; 
 Thu, 25 Sep 2025 14:00:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313dd66fesm1110678e87.54.2025.09.25.14.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 14:00:05 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:00:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/panel: samsung-sofef00: Invert reset gpio polarity
Message-ID: <anrdocs56hbunj7ga573kopcol34pw5cklrwneqevpfhhlm2bc@qvih2y7vm7q7>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-7-9293016768f7@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-s6e3fc2x01-v1-7-9293016768f7@ixit.cz>
X-Proofpoint-ORIG-GUID: RO_fEVmBUMxb10IaqMZhKnbvpAukrhvj
X-Proofpoint-GUID: RO_fEVmBUMxb10IaqMZhKnbvpAukrhvj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX6FL4RbYVxX+b
 XoatMYipSEqE5P/5qiGeiy2X3ibTiDRV8pVb0vYkIwVZt8kmqNrnK5kqqhQQZG5RjAvBud5/ptL
 6+n6s0+74meseb5+K0RPyDccABzCPl/FHaAAOCHxj7mwdI49YPt2wi2UdcL+t+xZFye883wQ6zR
 4PhixGmIMDcRKCU0Utm0hCj1eFOdFjTjJNs630WIYYi7Qtq1mbAuc7/z8+QCt6rf+bUH1eve/wt
 UxHRrhdADRZ7NGNEkih2DbmadVxBZyrpOgAbTM8C//UDcgkVCtwvcTPku/yro9Wbrt39pR/ib27
 YcypE0KGsQyi/mJbz60cOIpXzqmYs3qGl9aKMHrvet7m5zilRwRmAvxz7I7QmMOSXPQFgQKcWj5
 kzFpuJHQrOGcANCSIiNOM/90/nUFSQ==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d5ad63 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=RX7N6JFfHuZ5v-HjQggA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 11:12:53AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Follow the device-tree change for OnePlus 6/6T and invert the reset
> polarity in the driver.

Reset is usually active-low. On most of the boards it is described as
RESET#.

> 
> Fixes: 5933baa36e26 ("drm/panel/samsung-sofef00: Add panel for OnePlus 6/T devices")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry
