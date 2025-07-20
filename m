Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF2BB0B7C7
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 20:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1951B10E11D;
	Sun, 20 Jul 2025 18:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDJ2UluZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9252A10E0B5
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 18:46:42 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KIY32h024544
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 18:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XqD9lpozTVEoNik4tz86rDe0
 5zofNC5gW8zKCBwUz6I=; b=eDJ2UluZYmn48okM5vCKIkoHwvuc49tTs43Pfp1w
 hUul0WGhBHMWlK+XbjBiLBiN2SMUMZMocmM6AiRYLK6MUNUlA0dTgbozL2mJs7Vi
 EoIoi1qDTBrv7Cq1xMXMk5e0IDWFtAdsOcfMzKeaHYSGsaD8tep7XnBcrnq+rI1v
 RTYgl2fcbuxzT6DCW31A9KHSqEheETzjbUqBEfTXbnu3XLGMu0c3+XtA1SDWK7Za
 dH6ktLvfQZFXYvCQHhLFFKZMHOsaycEDqA4wwg9n4aSKzuZESuZ1ORpVtscHfRPi
 cI5LYryNh4xfmINPfTdQAqt8UZmjTZE+QFXKRkCxn/CJmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dak7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 18:46:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e269587d8eso662477985a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 11:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753037201; x=1753642001;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqD9lpozTVEoNik4tz86rDe05zofNC5gW8zKCBwUz6I=;
 b=tysKca51lx9pptTF73KkhD3WMAM3zfPjtezgHTDkrFsf8/HoWo2xUXlgqPqdjKTHM8
 0ZUhNw84ZClPNYVjeLiwSo235p/EsspcrXVage8VfnZCv1wTHeRIxytqDgDgukGv2N3E
 /H9IfpK/2St4rEvhDFNIWC8A0X2TLxM2/5G34Z9szNGSmWcz4dLZ8NGVL7+DdwbDYxwm
 ewcW6k5RwetSOptoxbpgrmgS+vBo5Mu4zDfO8DS6nxgvRHhQVzSX0Ascu+rtW8atvfNW
 6f1k2NblOxWHl9y6S4IKkC2ta06mG7IsYkJJH0Wtw9Zgb95FjY4hGNmStbpcbv0DGpMJ
 BhTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsxuB2Zp3IdiGwtm4RmGs7v2NccrzjnYMT3S0bw8JsIGsR9VGlVeWUxldiKqDaoIma5VxKLhovwik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrmIh1Y47e5CpLQy2VtZQoq0L5o2zKFbGT5hGoEUNbAJ9uL09z
 vFXni9X8PAx304jf/ubC2YmedpDLZRgB4YfEeW82/fjBXT4VtiCJbXuZF44h0l2VFXnvp3YEOaX
 Lr+ojgYxPaKGLIQlpQ4ZODlqq0+uc2e73Boa89ucAHV3SFMBAREQwPdnDM4flYMVIbvpkkaQ=
X-Gm-Gg: ASbGnctpWrF82ZkyCMW8K99ATIEtMFFGPNbk/r9qQnqbmCPFFyehGtBdvnA0bQIcLgZ
 AU70IMf/2HFmme29wZeOpO3Z3AnUqsia3ZUvA7nLxokF5xUkRvASwYzoM3wOVFL8WAr5xDJUFb0
 aqxqZ2bv5byDVIprOAhYzgso2niVPAwg2mcgihpcvJOHa9RJmRvrGmF/EDQIzFNQR+oGzMalmRu
 RwEs83RrVivLu2hkPDquvFRRGjDjG3rFiifk/gJL19NQnjiqAlD4zgj4WH9/I6yLhLlf6n/IiqJ
 bHFGt7A/TJfayHcL7Co8KxVlrmZ1sFzkvL0Zm+FZ+w4w04BgunHGmkGgblob2XS268JBKAUGUoM
 jeN1mJIi2SE5DC2UOc/TPczyhJoJxGUBn/4cUMBZBWO48Ft+cDrRe
X-Received: by 2002:a05:620a:55ba:b0:7d5:f350:e533 with SMTP id
 af79cd13be357-7e34d9ac1a4mr1437152685a.29.1753037200595; 
 Sun, 20 Jul 2025 11:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7R3w+LrCtL6Ou3WXRvuqFrSDZrluf4DC7QzbddwvwqrYR7HJsloDPSpllSxyamfEHt540MA==
X-Received: by 2002:a05:620a:55ba:b0:7d5:f350:e533 with SMTP id
 af79cd13be357-7e34d9ac1a4mr1437150185a.29.1753037200070; 
 Sun, 20 Jul 2025 11:46:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31a9b87asm1229044e87.11.2025.07.20.11.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 11:46:39 -0700 (PDT)
Date: Sun, 20 Jul 2025 21:46:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
Message-ID: <z3ob2cbxuerf2djwm7xzmujr2xwmwq3agpxrhnyds2ciztl52h@nqqljjocqmis>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687d3991 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=OsTS_Kn-1Yu-Ke3AYpAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Gq3046tN9ARXq93l0CVDGYKPgtYyPICb
X-Proofpoint-ORIG-GUID: Gq3046tN9ARXq93l0CVDGYKPgtYyPICb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDE4MCBTYWx0ZWRfX4c08+WKROJUo
 7ZMo1BVUjp/4d7MvBsyDK6zJH5GkxYVE0A3pmJpbUKNQDMGhgi9+1bZ+Z9d5zUoqBcTM5BRi42g
 g0hTe+RKW8rd7aCFhPhd4J+xvedlPwFoC2LZ4bavjP6HkR7+CMfhwIyk2WEnuAkEDEQuVWzYwlW
 ReAetGwvzOAq+cVDBz0O+C6rHUpAt7CANJ6jloXq4vJfZAuxqIGunUw8SsZNQsbEGv5A1/hbljz
 lQsXq+fFVolBiecjnSjteSH1V8T9JWZ23BoyejciB0fi3ngcmENXiwpex7nYIytjuIPdAZtNpkY
 0gcZsdq0cFvdiy4QILVLNuwZl/tP+7tlyH0u6K3YS4cjM2sImlYOtyCRZqS3dxvJLqKc0XwTMDh
 pEpqDPfWHVWTAP+XiyPhHy3d2jNzQTCgh5yodced06D/XLYZHOJZtrCO34NjwqnYb9l2Ir0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=766 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200180
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

On Sun, Jul 20, 2025 at 05:46:04PM +0530, Akhil P Oommen wrote:
> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
> different in A7XX family. Check the correct bits to see if GX is
> collapsed on A7XX series.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Missing Fixes tag

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

-- 
With best wishes
Dmitry
