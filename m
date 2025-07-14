Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8666B03DA5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 13:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B6F10E470;
	Mon, 14 Jul 2025 11:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkMWYXjO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0367B10E470
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:47:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA2KLu007513
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=t+wfd3CUH3K69uiY1tGZEAhA
 GJt8soTvX1/+0I7VnVs=; b=JkMWYXjOlBvqiFf+03FX+jypWYbZIIeNHqWAREUZ
 7GAQg95OBCdRh5NWLVMkxvpCVEhfu7uZHV/4+uvvWAYdmgrsXqxzWHEjTcsvUQ61
 XCqBr+Xcl+VK6yTRuCRzNqV7xvMPvpHtEMQKgWEWWyN1Stvr3KdN4vF+joaX6rq2
 3Wy5IKP1ICRfzUb2vOklys9VKGQ8x7rBnmFP7vq24yPK8sfhuyXvW70VdExF2Vih
 RFNv5d4h4u9dUAz16Sk2tMf1LkMiQydm5Tte4ILjWXO0vaEHDWElM8oxvau5Wc/p
 5twbQuk00Y3/UVYUmUp6oms66f3Lpk4xYxDGoR8ypLdTGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbcgsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:47:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e207330a45so188225885a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 04:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752493666; x=1753098466;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+wfd3CUH3K69uiY1tGZEAhAGJt8soTvX1/+0I7VnVs=;
 b=QkDEpLUF9VAC/xicnFiwZIj7yiv6pgR8G/STJDqrvypaMQki5WrICC5pV1btdr8wF6
 i2ZTLvYs5yBSESP+TH3DUrMLUDvYPiUfDOE6X62ZdrJ/c4HtgSE5jm2xC4ScZ+pmCTbz
 dFie7wZUu6+rhfPe6LCZ3Gj5z/MOijehcLDvuB659JR9y65XaBC31BpI7eWEiAHMSqV3
 KQnPb99HF1mi87e3Udbe7hgKYrsaVF/Q1QiwOgBk33SAP5s/erOe/t/m4f5ITGJn+iF1
 skeFl+6ea14fUDxvGrjvuHYd7KcSfhaUF031X+umZMu+JgYC/OCYEFP91ABzkkdfP7mL
 MWnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4xpvJomce39b8Ky5XfLvOdny7cfGfw0YfPc8oLD1j9OiiaeIERoegFkv63wYSZnkx3XDc5CGsKa8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtGgjwrp1gmSnrhJQg1AEgdq0aCM8If5biOKdh0txS31sIs2w2
 ov4T0qO5NFGKn9Qe9870kGPkVIgE2l47qMmgAFkgjnv8xvFaZ9sj6Kx0efEkfEEnf4Ym6WBYzN0
 uF5US6m9hEi71o7E8qaCNlQk370tuvKhtgmMPs/XLpRFxMGllQ9gIxE++eLS2udW6NO2+KbU=
X-Gm-Gg: ASbGncuh3mWhFuhXtk6cb7rETDHQb3VQC9mpHMd6B3ikoggLnNVd6TFNCgdo4hSGiOO
 ZByxoE7EJyBO7346joSaMOyF+CYFppDeGaKaSiWQj2BsNovH9HAxP2aCfshECpQQf6lvnW6V9IH
 +kgrFllz0PLTF+nKehzXFKtZkkU/HR9vgy7jl3P8sf4jKNaMtACMPkHAej1DNlTwJxUYqJvYIzy
 F/AJCv1TnKs4nnZD2LqZU9yS9qVTNlSG95DK37Hj5Pg8+QtHtKKV37U7IpJFvMYYCkSkURnB5U5
 ADdCh76Ob/MlV/Otu3ka7Ycj0XzIpKlbCBpQdfow+3VFTKsffL1H55bh5lYFOBKtq4YXYWuhYZE
 pf9iAbzWgHtMe85zM4zRduYIFqyilTG/OMdoIXySthUVIsJ+Cv0vB
X-Received: by 2002:a05:620a:29c3:b0:7d4:492a:31fe with SMTP id
 af79cd13be357-7ddecd1299dmr1929538085a.52.1752493666371; 
 Mon, 14 Jul 2025 04:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFfkjooggnntqRT1oZT9zE2pntAHLG38aK4mLosHKhsfcoHd1ko+GskvVDqiEDmcSqtpj19g==
X-Received: by 2002:a05:620a:29c3:b0:7d4:492a:31fe with SMTP id
 af79cd13be357-7ddecd1299dmr1929533985a.52.1752493665811; 
 Mon, 14 Jul 2025 04:47:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c9d2f89sm1916017e87.115.2025.07.14.04.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 04:47:44 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:47:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH 03/19] drm/msm/dp: Return early from atomic_enable() if
 cable is not connected
Message-ID: <mw6wrx3nsiantc2sweio2xbgrranoglzugaykjo3robkknrlzj@5dma4fm57xut>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-3-33cbac823f34@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-hpd-refactor-v1-3-33cbac823f34@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2OSBTYWx0ZWRfX41cubouYykgF
 7u70bsN23gYLDmsnHlZM7QdD16X/trAwlPJLFsOemCdPuT0e8fLEaxZe2LGyBOlBdVxFEsD2OHz
 arPbbnfXPyLMywOJakdzsAFkqEB6nqLF37vjljTXV26LUNiLe8+B2DLhK40m/i6Rwd/E1tp9qaQ
 cZOeFHxNnOhXEQ5OqRx+OIgrGAztrFY3HH2hKlu+n/7b8AdHR0zkPo1zZ43Om9ly+SUSJOgIpG8
 X1ndUvp0yuzUKEdXzneCdZDHHakjGoqL2LeZBpC99wK1iGiEXGI8ApVZ+sSbQXbHud2GlkcTSHt
 q1pT9qFBXHFcKCZ5msPfAplcZPOUStYQ9DmnwEL7wKude7zXTqfqYQksoYXLcVnIO9lyjnAf2hi
 LWt3orwkIiyhdSbeRxSQAB9pduvwFXseDPdfHcJeXI9aJdBtLSCrd/0qEEpS6U+ZX+3maiOC
X-Proofpoint-GUID: P9RaMf7b-jiVR-HggOOMZzCvKxm87THo
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6874ee63 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=bA0M61isIPtxKdXERIwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: P9RaMf7b-jiVR-HggOOMZzCvKxm87THo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140069
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

On Fri, Jul 11, 2025 at 05:58:08PM -0700, Jessica Zhang wrote:
> Replace the ST_MAINLINK_READY check here with a check for if the cable
> is not connected.
> 
> Since atomic_check() fails if the link isn't ready, we technically don't
> need a check against ST_MAINLINK_READY. The hpd_state should also never
> really hit ST_DISPLAY_OFF since atomic_enable() shouldn't be called
> twice in a row without an atomic_enable() in between.

There is something wrong in the last sentence.

> 
> That being said, it is possible for the cable to be disconnected after
> atomic_check() but before atomic_enable(). So let's change this check to
> guard against msm_dp::connected instead.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1072b5fc00ae..fe38ea868eda 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1606,7 +1606,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  	}
>  
>  	hpd_state = msm_dp_display->hpd_state;
> -	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
> +	if (!dp->connected) {
>  		mutex_unlock(&msm_dp_display->event_mutex);
>  		return;
>  	}
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
