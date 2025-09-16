Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF5AB593F1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3E210E700;
	Tue, 16 Sep 2025 10:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXYVQ8sC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7733210E6EB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:41:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GADCwO005711
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tPxYdKKHOLmFp24yF9npg0nR
 5nLkrWcT5aWJm8/6HtU=; b=oXYVQ8sCjBK4eyhH4RHkWvbYitkru8CU5/kAhBr2
 PntKd7q330v4n+f7gG3VFoBUVuOBzO9pN/JtemQJ0UULunk60PV2KBmhtZdIdQiR
 UK0GSNA7HzbK4C0JUzuOcSUTxpqDaiE3SxbGJxrOW424xQf3O+cKDevLFirYg2Rt
 /+bpR0fxVzNFthRQDGqu5SKdzhbT7YIRypFoDB5of1JqnrJTQ6n63w6ERqEk4Ikc
 yIVOLTsDcxySJZx9OJUCWn89uAi/APxCRklYJQO/+u/YDDTuB/1Qf7LNHfVu3WK1
 zi7gJXQ5ddy270ZhVsu65KQlHz3ZgDiauXumqvwSnwwFGQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u58fxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:41:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b78fb75a97so33251661cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758019282; x=1758624082;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tPxYdKKHOLmFp24yF9npg0nR5nLkrWcT5aWJm8/6HtU=;
 b=Z6s8lgqP7lZWdH0fEJq7iui0VrRsfAMOeptaZtHDZ9VLPXBOK9FKf8IUZ33l19TU78
 LnV2As9q09PT8qwgOiIsuo690fpjyPS8jjrD3F6WFi48VpE3kzpiiWuXjA3/EtxDux9V
 1UjxUHg+YSci1TRGE/w1KfL6mQMuCv6QS0jlxeKu7tiE/nmaSZEWspODY6ID/AIvR8Mu
 EC8AvaCYxL7go3Sb/Ev/BOSiX/Cp06PUVB8nq+usm2iJ2GiREDvgGfMf798SgRImAhpP
 ZOww24YUhUnJsuVU1YMf8PZnxMJJpiG+3qAqr/LhQJQZGZVvfQw81qJNnGSpihZ3QsgV
 PDzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrROSEZ6CAMTWqL7vRLWFAncLGihPkBWkabLIrANnhuhP16GQh/abDxArztGM/v4iY81Un+iTI4oo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXQu5mOdgWbgYINGESqxvRPrp0o5CyYg8jFxlag49CDlzA5UVv
 LpvQ7uZwDsLAu2hpBJtfsIpaU4WszJgN0wcGSVaGqnfu1z0exNX2ay4HoXdfYucokU3C4olz92X
 gsmb7uRRqGQrL9FcuV6uSIgpFACi7ZWnafHdDs462ybuYfMsP9eGVQ2quXWe1Vv2QDUkIWvw=
X-Gm-Gg: ASbGncv4cg17CQnCyxd+Wg5aRxrXviLmDVan1xiWDmsdKrKZTDNjcU9GJOi24GZkZWG
 xTSWriTaBjweniaKUFT09sOwqftpp44T2tjDxRCDL2diAOKUZPth5taVNaW8OHBEsr4TvvveMdp
 YrOem7otXkOaCLeSNnFHhdPEflK7/omTYPcRnKYs2xl5BQ4Jq0EFOmk8/OEmA/7bgC3wBsDKUkZ
 /dK//1FlR3ZZcvYqRxzh5Jf0SabyIOrd6XxRsn50RY6taXPw5oLmIznOjXuzWKV1UdO6uUydU/Q
 SO+MBxAgp+umJ/j5YIK0DPs7aEWXbZ470oE44lGa8PoStRjv7wQ1rmz2b+8XiNKDjrKB4M5Qlk+
 fDUQLYpI1vDezU26e1iDxymbXpgauDmWN4zZlGh6ZSgUXiDOy/sLb
X-Received: by 2002:a05:622a:578c:b0:4b7:b192:1443 with SMTP id
 d75a77b69052e-4b7b192147bmr19834221cf.59.1758019281905; 
 Tue, 16 Sep 2025 03:41:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErjF4yYxIondd0648SYuAvsJGr3H923yp/I22pyUDjDIWthCt3BxpeK46u/6PDovn3Xr2cDw==
X-Received: by 2002:a05:622a:578c:b0:4b7:b192:1443 with SMTP id
 d75a77b69052e-4b7b192147bmr19834101cf.59.1758019281418; 
 Tue, 16 Sep 2025 03:41:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b6167sm4417508e87.25.2025.09.16.03.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 03:41:20 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:41:18 +0300
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
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 2/5] drm/bridge: it6505: check
 INT_LINK_TRAIN_FAIL while link auto training
Message-ID: <r6gmk2xlzczyzrpsrnlo32r3p7cd46qc3clnvbb7vwqbghhegj@s4hezvst2ro7>
References: <20250916-fix-link-training-v3-0-0f55bfdb272a@ite.com.tw>
 <20250916-fix-link-training-v3-2-0f55bfdb272a@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-fix-link-training-v3-2-0f55bfdb272a@ite.com.tw>
X-Proofpoint-GUID: Z4_827OeM8Vt2pTyTtyPvwp3iPzm3cwi
X-Proofpoint-ORIG-GUID: Z4_827OeM8Vt2pTyTtyPvwp3iPzm3cwi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX8bEh8xsfNN2I
 H2zesbSzjYofFTUPgty4b0wM+NOGyd3foQ6TldSB9f3AWMFT5/aujd23O09uR64nzdwUPoEgOl6
 ipO0SkBltlP3+4rjcoR/dYZgu4su14y78A7JIZFNT6+MYF4ww3Dt/2Y1DeW76LtULetFQM4a3LR
 M4c7WuUh+BMDQS92/warF1BZjqGV/wEhOaQqqZi+q8pZ0bZ9rEySDyTxNyCVxefpUKd3ut22wQK
 2zq6otDxnsH19zTiRAojVE/z8uGaIcmsEJ2r2P3UMKgnjz7oWylVOWlwnlG66Llse08V1oSX8Kt
 SS1qokaTDqLa88UYbsIVfOqQajS/1RkledfR6Tqx+xt6SwfKhIq98Dz9UJ3Rb7fss6RkFwU4EHz
 eeXJZdcM
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c93ed3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Ns9eNvu6AAAA:8 a=EUspDBNiAAAA:8 a=_LDb0pKpX-kM06tvKcsA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031
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

On Tue, Sep 16, 2025 at 12:47:42PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When start link training, interrupt status INT_LINK_TRAIN_FAIL can
> use to check link training fail and no need to wait until timeout.
> 
> it6505_irq_link_train_fail() remove from interrupt and no longer used.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
