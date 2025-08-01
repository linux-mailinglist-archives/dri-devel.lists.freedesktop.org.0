Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DED2B186D8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 19:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26CD10E16A;
	Fri,  1 Aug 2025 17:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nh+ZeRmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B262010E16A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 17:42:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfDhF001043
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 17:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mQpZu297GrOahwaw/VEhcnsV
 4khl4o9Em5OSPsyffWU=; b=nh+ZeRmTP3xeUxvNw3fR80rBxHT0jaMSDNXtJ8OJ
 HO5DU/1U6/zqBABcmXqKVDWDK0rGZMnH3SnBafQ/QthML2hLKOBc8j9Y5sS4Hhn7
 xR4d/Y7D9BeV4wIYGDdkWmxPlJfAqul0SbrDGBtARwPnHwO3SE81f/Ie+dVQCe5q
 tSmzpTGE8DhKLi9WyYmhgCy84+793Tj3JauQr/w52lPf9Y52b2e70l8V3jgebK/N
 7KD9y9cjWeWxiWJ3OTz2IkrC/TIeH5yAcOekvhfCdkNigwhPmRKJVInfdHpV7ycd
 QqDiNHo+wW+s9IF4j+lJIicQgU/9AJAr9XgmQCmFkyHeNg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488wgrs0x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 17:42:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4af0100c03fso22452531cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 10:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754070119; x=1754674919;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQpZu297GrOahwaw/VEhcnsV4khl4o9Em5OSPsyffWU=;
 b=tH64KA7Yz1kULOqg2KfJ/Kh101yhf6sUTu3uaoDvKc6JO+ZkTX+SRcyIkuFuZY5gKw
 Z9aL/2sHUSuBzx0eLz3/6Yk9f/2kr8g7f1GzZd32AAtEMYy+5YODhaUer494pwKWxD+v
 c6jS00SHhQRdbi3Lv1cpS+tbN2w0Xp8gul6coxb07vKHQU7cATUUeLUla0xejNfcZEwZ
 CUdFaoUhi8Xx8pLl7ifapwh5zvPSWsoRm/v63DjO23tEMTGr/1q7oHTVVOxJ7yhSluka
 6cRWGA4ANl0F+F4brDfpPRR+h1BcExbmoohahcfPOGTDHtkit8AMnEM9PK8Vcjuw6B2b
 0/SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGxcs5yKe5al2vC+CmltndhN/I3uS1SqTfBTy7mUD8Ucfoa9Th3WAgYrM9k145PelSYWE8BakpMdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi2UWra+GriEbDxYgN0ez/DQs4+DIInDchaAre+K1yJ8L8/ez3
 6epspOMYw7iCavPBVNl11hs3iBl/jThKpI+ez6X9Tw4b4bkjO4BHy4JAOO+wksPlW3W4QBjHwgN
 lL+cOWwArtRWGvLzwPAHZj88YvBFIlhrZ5o0E5ksjyfjYGUHDNrx5R59+bTJ+nCT3uBUrCF4=
X-Gm-Gg: ASbGnctYq1mgR7xSDEWTIyXkU1JD0aS+e4TNtbSqJqFhxTouyv0ZCwUPgMSMuLIBa92
 V0JKEfGIcaSvJkG7x7Z5MsN0Hlb1NZveX8h9WN/eLpUDsUK86yKdRogi3v1/7ZxaL248hBglqkn
 SQFI/Ha7N27kSl0lDG6bfJ03AlEF2w54f8jEvv8loPKBZNbn5LIT1qIw4+1nhX9+XSsSq36zwFy
 PakKdW2FboKUAe93pzVWDJc9UA8s0cP8l+VZURSMaw5ipR1yP+ZmrEAerVri7o0j3JPbrK7rp1W
 81rT3Pi69CpiaA5XJrDvPRVtRHGYxYvtkFFDZmR7CF4PCMPFiIwd7CfUg0wd+3Gylg9u4kL1JUE
 jWZCQ5q5iWvG1CeYHLYUBOUQvAKflsA2pfBW0uj+IcxUatn2+hs0x
X-Received: by 2002:a05:622a:110a:b0:4ab:66c5:b265 with SMTP id
 d75a77b69052e-4af1076bf9fmr11281971cf.0.1754070118711; 
 Fri, 01 Aug 2025 10:41:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv9K/9Mrcl2aEP8DkEGqC5ecwKIA835bE0VNaNM98VN6YobWwCpiPGo6+PwfkoAmPywEoKnw==
X-Received: by 2002:a05:622a:110a:b0:4ab:66c5:b265 with SMTP id
 d75a77b69052e-4af1076bf9fmr11281531cf.0.1754070118210; 
 Fri, 01 Aug 2025 10:41:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c98a7dsm676692e87.85.2025.08.01.10.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 10:41:57 -0700 (PDT)
Date: Fri, 1 Aug 2025 20:41:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com
Subject: Re: [PATCH] drm/bridge: lt9611uxc: add support for 4K@30 resolution
Message-ID: <yhj6q4y62yzvhnxjm4g6sx3552g6mwz2uk3kvwfewi5hcknebp@euy5iosfilux>
References: <20250729-lt9611uxc-4k30-v1-1-cacab6843f9d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-lt9611uxc-4k30-v1-1-cacab6843f9d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fs7cZE4f c=1 sm=1 tr=0 ts=688cfc68 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QkhM9EBQO5yHTPfk-M4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: CPIOtFyoPhrsO2ui4SSWHgTSfXpP8gds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfX2UO0DopbhW1n
 JzsINX/eczWq5lzvyaRQsdTnMbg/YqdiMN/R2EFka96RU+Bcb6bWRl5G8nH+dXmu1H6U2UmJzMF
 CcFtO1bd7kLTBhZ9oLcJzGQ/r4w0M8opFaM2mh1RYSRHNoIscD5gIx4A5xMLu+GVcdPf93fhy0S
 sBpLjTMeoikTZoISUVv3pjt0PUPSdY8w7SlzBEy8KqdmpnKqmyiCuHFt4os5MlOlvgdqhI7O/i4
 OxbUZLRvfL/Ll33oYR4p9iC9wZw/k89VYl/uyHxWpL1JxYZ/KnYhrEIwVLVycG8+sEyEVckzqUC
 3lx5YWVTFhk4qqdIJqmoh+yVMJPtZk/MCj7xmu7BHKFnzjjkgrJ6OyMpJC3aHODM50u2g15vJg6
 jIyu9fOZagaP5v9QLnOyRtDyCbIt8688fu3bZ37kRXyqmFRG+Sy2J8TNZQ4dQbDuzE4uyGvM
X-Proofpoint-ORIG-GUID: CPIOtFyoPhrsO2ui4SSWHgTSfXpP8gds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 mlxlogscore=969 impostorscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010138
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

On Tue, Jul 29, 2025 at 07:00:30PM +0530, Nilesh Laad wrote:
> Add 3840x2160@30 mode in lt9611uxc modes to add support for
> 4K@30 resolution.
> 
> Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index cfe389b4c25c..ac53da6c9711 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -100,6 +100,7 @@ struct lt9611uxc_mode {
>   * Enumerate them here to check whether the mode is supported.
>   */
>  static struct lt9611uxc_mode lt9611uxc_modes[] = {
> +	{ 3840, 4400, 2160, 2250, 30 },

This should only be applicable if both DSI links are used.

>  	{ 1920, 2200, 1080, 1125, 60 },
>  	{ 1920, 2200, 1080, 1125, 30 },
>  	{ 1920, 2640, 1080, 1125, 25 },
> 
> ---
> base-commit: 9744cbe3603db5dbd6e63da9c3bed8df68a6d3ba
> change-id: 20250729-lt9611uxc-4k30-6175bb8a0570
> prerequisite-message-id: 20250725-lt9611uxc-modes-v1-1-6a13b181927d@oss.qualcomm.com
> prerequisite-patch-id: 6c7107d0c8810b85d722fd32e45f736fff81860b
> 
> Best regards,
> --  
> Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
