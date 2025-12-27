Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5402FCE001B
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 18:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C68510E315;
	Sat, 27 Dec 2025 17:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5XilzY/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvjgY6gP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8729610E315
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 17:15:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BRAhUSS3708423
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 17:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hDrucTMu/d6l0Lwjs5E9wquH
 PdvJCaNtTxxCTiFaX0U=; b=f5XilzY/UKLaixnCNcAADCTE7WCdr5FrS8gJbvgP
 Lmh+R4YCTzdcwt74969KA7zaPL7gab/Tbew7s6S+LpcbnDMsj1Kckqr0T4e8c5lb
 xmtNtcoGI/aFY6QbeVT1dyhffGV+pLSJtBFpBJ+oxoToJQvIIcBoA44I91QjLl3u
 ze0ec7mkudIWks6HRwOAE2keQXxZDAImgYUHd0TuOMmNuc4TeXm/O3DAZAyh9sZl
 OsjNpF7bMUdd3xusAN97whjRJJiKQlWu+AG2S1nrtvWFxESHvqZvu3OvS4yATGiH
 NERtw+anAmPRztJ9W7uDMr0oG3N+L72jDzPShb89vaLvTQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7p1rvjb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 17:15:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a47331c39so212072986d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 09:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766855732; x=1767460532;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hDrucTMu/d6l0Lwjs5E9wquHPdvJCaNtTxxCTiFaX0U=;
 b=gvjgY6gPSeVTCpzikfpi9h77trwBS0+ql1LJwccgFlE7yAf/0tFJP1JXA6D4BbRsY4
 Rx6az5mfI5TqX9WeTfnXr/olnuRFcTL5oQ6BUMTMMA8/EAjvx9Ccexs7SYLx3rdGBBqA
 EvdkpOU65awAuEk4B7SFZHnbSRfUSwbCoy3oQK0vYOeM/d1bh9rSbSOT7gjySV+oUW0Q
 WW47eYylDlrgT+9+Np7erMx4ixYPdmhyGarrOZkjp0KFuX5UON07N3uTUVOCPPw/l8cj
 Ui+xDgT/lSDJWSFUnBtRdsNGem7zqnBFc+mMRgLrt+vjHuw93+MFQdV4XXxTD5E9qXxu
 Nesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766855732; x=1767460532;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hDrucTMu/d6l0Lwjs5E9wquHPdvJCaNtTxxCTiFaX0U=;
 b=mkLaA4MYft/REdBjb/ZByHA04EJaLJceMu3542QdkfEjOAQ6N97wpFX5JERe7I5l5J
 rfOuWPnQ1Xr6lqx8IPQh0YveN9nMLp/kCpJA7do8jgEWClwLMeSk1ul01f3p29lQsa1m
 /k3xPAXUqOWWoV97Ri0lvTuqUpr3bfkQp2jEFLda6eLhh5Mh2M7ntWgoet/tOy4xJ9UZ
 pjVrD4KGVdWviWsA8RSqhM0UCOeo0aai7oGx1wJ0lqLcG5FBTq2wwUXW+8zRTmh7c3cd
 LQSBdUg/wiWj8S9FUI7CTC6cfybMJvofrzGucXmSbxKYqkxzMICtEzaVXvAzZgMYSSTN
 jfCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8RYBZc/T9OnjE7NU24X9rzoqkREyrWNm1GSmO9GKdV3WWbIScFjjPktizEoxygxbSOcAjK6oe6vU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwohauYf7TNEu6S5KSQ0LZL6z9IDdpT9V/WaRNul1jqqkUvSvXO
 mteWnTUdBOFSbsKy0b2vclZYs6vBGC2MKWcNrTIVJuzn+NqN6wkQMWnxfpn0KQ+uJoodHeDLRWb
 6UaCgbNNN/YdtjQxJuDT7h7Z9v87S2vrw8ggNVKMVeAM9mEpLpwm7M2kWN4LE6iU/WnPg5Ws=
X-Gm-Gg: AY/fxX45/3Glly/L5WtYUnit1/kFg9tfH1PGbMArjmvSdVfWrbB3N/65QDKtksIF/u8
 oB/tm64GAKq3JSuNbWi1pRmbkRXACJpTenAOFGe/oq2eTFCZu4WHza1N2WAV/zcISKmaPBCiiew
 /Wuv9woi+cHk4T1W6WW+f8HSzM3qmguIcGnPAKylLOVdGciQJkwHPglg6arFk3KnJRHtmkm4ZwA
 TeGTdbQg7T4zXpfZch+0ii1FRHy4Rdv8GXHBGgr2hoTopMyFIrYl8aU2B2iFNIoLsWzl+sM1qk5
 Q2uyt9lc8PbDfaHGj5xiqUiXfE0UWcqnrNVUDOBztQXO9akyO6ZDdjGlxP5wvxRRIj8xclrEBDU
 358ILACf8IASGzLYcEpvKHpA89uWFo9+PNKSMOzurEralzbwU4nBmSQnA8kpGoBJ0a9v3560OV8
 14An0RFZ6AeTiE53kW8i7Rrag=
X-Received: by 2002:a05:6214:610c:b0:88a:30aa:6c01 with SMTP id
 6a1803df08f44-88d843346a7mr320090746d6.57.1766855731862; 
 Sat, 27 Dec 2025 09:15:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGG8dtmHBCMixEdDr9CNrcosDg1mqfzDAkf1YwW4Tzgo2YwThCJUKKo+QNtZbWzCCm8riUZ6A==
X-Received: by 2002:a05:6214:610c:b0:88a:30aa:6c01 with SMTP id
 6a1803df08f44-88d843346a7mr320090336d6.57.1766855731439; 
 Sat, 27 Dec 2025 09:15:31 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812267b184sm64491571fa.43.2025.12.27.09.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 09:15:29 -0800 (PST)
Date: Sat, 27 Dec 2025 19:15:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v7 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
Message-ID: <hglfo45u7omm2g4e2yn6rl3kxcw7wwfdf3wl2wjibt7jedm2uu@5z4rxbtemgdc>
References: <20251226070534.602021-1-kumari.pallavi@oss.qualcomm.com>
 <20251226070534.602021-3-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226070534.602021-3-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TUvKbAn0Sm2hEWcNO1v58w46hqkVtDsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDE2NCBTYWx0ZWRfX1ecw9HaGaodP
 mLH1RACsW7N+9Di565gI4XDJ57olAMUhRX/zjPDkGZs5rm2FZnGZvAz1UIEorXAXLgncHm3lZ7K
 K5QpU0TImeREfEVQzBSz2/jaBH7X9MsTFHnK57ffvLnnvuAGrQwdX8D5BOs+9J29LmDgycYS6wY
 D2447r6JLL8AodZOEvU2xxL+j5l9vt6/BSLIOPw4L/L8KbyPkmavrS3LmFQJr269kcOEp8QCRRQ
 2W/r9AMrVcLQY3B3LTN0hXhm4Yrx9F6lsm905aMDVEbvyLzDvI21ltoaqncITieVM4eOa6cVg93
 U5Jyd5e72Ij+cSmZk3RijIaO2zPIl8TPszrSLaiSl7jnVpVKqMFa/+N6GlUMFVWFajwYCjv8ZE5
 PAWwhUzKsyW9jg9ae/ygN4X0Kghbdmda5o4WJy0Ruc42tzKrM7tA1FPjaXRZUQ1f20u4CQ1YfIY
 kxqb5/pRUDpei1YJEJg==
X-Proofpoint-GUID: TUvKbAn0Sm2hEWcNO1v58w46hqkVtDsL
X-Authority-Analysis: v=2.4 cv=PKMCOPqC c=1 sm=1 tr=0 ts=69501434 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qdViAtwzWZxfokMtc90A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_04,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270164
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

On Fri, Dec 26, 2025 at 12:35:32PM +0530, Kumari Pallavi wrote:
> The fields buf->phys and map->phys currently store DMA addresses
> returned by dma_map_*() APIs, not physical addresses. This naming
> is misleading and may lead to incorrect assumptions about the
> address type and its translation.
> Rename these fields from phys to dma_addr to improve code clarity
> and align with kernel conventions for dma_addr_t usage.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 77 ++++++++++++++++++++++--------------------

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  1 file changed, 41 insertions(+), 36 deletions(-)
