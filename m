Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE10B376BB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 03:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D4510E6E5;
	Wed, 27 Aug 2025 01:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZG3w+l+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0338610E6E5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 01:19:15 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QJRQMT005250
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 01:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1k3UuYecDWpdFzGbi52x4OUD
 ff4svvNikwZBas3LMPs=; b=oZG3w+l+NSu0/SaU2ni/9nsV+u58jUsW8nkB0jDu
 yySDRywRUtipSQksmnb5izUBijIlCvi3MSEpUFksXTBqF363nt8qw1XQmhgZEgzZ
 qGa+iNyLhDIJiG/PWqdd8C1RMAoRjS3Pqc0cK4wan3fK39AKH4DiklnDLwkf3UiH
 4ZgEvHZQqq20+G7Jtmft1MzQP+SHaOCE2qnEF7uNaMLuzAhfmHJ51KzVA51DT9Ou
 ueQCOfI7ho08Bpvdin0f8cC1hplrWmPGciKhehsYFZooy+B3DAOIYXyXxo26GRqz
 KqqhPtMpck+OJ9vmAWwL+VfpAiwGfGyXCT1CuJpsjyvdvw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpew802-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 01:19:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b2d2cbbf9cso62616951cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257554; x=1756862354;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1k3UuYecDWpdFzGbi52x4OUDff4svvNikwZBas3LMPs=;
 b=JiXfuuzyy36g4PFKro2iidw0zNUuQ3bJzNwHxfNbF0jagw2U+aceWUH48ZR2d0l6Zu
 pcVlAPNqcVx/OfJ6rwiXTM308KLZAaC38rc1AOUs7li+QwBc7Aoj6lcmRCfFbgPZyxyd
 gfm/uIIol3amX/l5xuVkX1dzTsGfFXn4OFkvF1i+FM0I2Nbn/cqoRDzuOKk9iY9Wda+h
 ouiquMIChQ6g9d6MesntjKjtttFHklx4pQWXjEWkH2okYYZIs7gAv0fg+fS4hoRGBtm1
 3C/Q3kNZszQKK7vPQS8Wa4uUFyUX7zmOGYOUXIieG9eXTBxB/v5h1AivZ3+YzZLo4nEt
 /WGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpPTWYN1yaQz37uODo9GWZTfpF9BU2P49c5MG41Y1Nxj9hkzCiA+ijmrGSUYfGrUmT1XQCVL70fnA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWrY74vr91QCsUUV8IvwZWA/r3CJ+LoMGcmpUTU3U0fbwhWDjU
 0AZ6uoabPF71z8QWq8QkTWuXkRFs17EM4kdZO8QOkGGUon9nylGZkxKPp1cUFHDkaTjzuJgDMIi
 Yh2Znu/ZY86GZrU/+iviqEmkBzn025thh6/q+9nMRL7ojH1A+UDkmIj3BN9wLAB54QZzmL4A=
X-Gm-Gg: ASbGncsnjrx1Efpuyx+TPN1bPhIPoCpQBmxWxzstekpzQ/+rPMIs+xZe6AwYABL1zt8
 AvpeXEuMmtgUHRIav0elJDONmvMrzbehlYqCO+XIwJdMDDN5pCCWKQakO3jZ3P1SdJWPx31j10A
 qGXXhYIFcjs+VnYp17jWkfPsyBTT+XyMnwxyXluV615OK6yKqTeRMXiDD+PIkGnrrQIzKjl0z4f
 1r+G/bibKnD0QJFpnmtkCNyNIf0jpUXReT4O2bEXfpn9rFsTUvdYIuR+1CV/+3CxfmOEnU/B+dw
 W5VfdM7LD/Zb6qHLEgM89WjSD2YZ7cpqEwX7My6dbOOdwFLo3M/pwH0wXGsKwC9koXO9850f6nr
 e4kSEItuwG/K9BZ+YTrCEMOWEs/8Jca4Nb7J6DoixqEdFW2fV7l5M
X-Received: by 2002:ac8:584c:0:b0:4b0:7409:5f4b with SMTP id
 d75a77b69052e-4b2aab4b91bmr216337161cf.48.1756257554014; 
 Tue, 26 Aug 2025 18:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHN0lyqNEEWQOXtYVEHBNIyQHn6KCAdgvleKmnUOgyQL8f1kTRBsPaqfqbxGos+0dC9z5t2g==
X-Received: by 2002:ac8:584c:0:b0:4b0:7409:5f4b with SMTP id
 d75a77b69052e-4b2aab4b91bmr216336931cf.48.1756257553317; 
 Tue, 26 Aug 2025 18:19:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8bc94sm2596556e87.84.2025.08.26.18.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:19:12 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:19:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 38/38] drm/msm/dp: Add MST stream support for SA8775P
 DP controller 0 and 1
Message-ID: <fdwrpaa6cp47i2hvlccjwbzzr4vnhfispuyodollr4fn5oncwl@urt5vaowuz6x>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-38-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-38-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: nr_zKEB_q3pH7_1uvakduTSyygtXium2
X-Proofpoint-ORIG-GUID: nr_zKEB_q3pH7_1uvakduTSyygtXium2
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68ae5d12 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=y2Z3QI12yUTW78QezZYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX4NWfkCr3KxwG
 FFuYuE3+0ZakC9v7yY5JOKseed0wDrMTmw03fHbZzIJ0Qs/0rZ5eBWpvEGenFl8m00qzebTNwpr
 fTBtrWf+mQflzTUpsm4Vh0bGkax0lpkM/3/ssjXyunMLyWF59mw79xqu1tZgRDeLzUA5Mi0dDR/
 oLUI3ojfU6Ga3GDW+MNltoLp9FnUqe/bMSMYHmgdEpdsoHzIT/8ZdWrKsqh3ik5wj2Pr1/s0zei
 dA69u6hI5VGqyfAYwA1gOVh1wM7lJygG9wPzJua3ZQq2EpGoIg6Y/7bBqKtKfhhKFmpSUBmLYED
 276vYEnPZO/Oq8Cr8iYwQ9pFoXlNuly0rAzHlrmJwiJQu+aeo5Gwl0lCA5yoaMTdX4uVGeq3c+J
 cGJIMLa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142
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

On Mon, Aug 25, 2025 at 10:16:24PM +0800, Yongxing Mou wrote:
> This change enables SA8775P support for Multi-Stream Transport (MST),
> allowing each controller to handle up to two or four DisplayPort streams.
> As all necessary code for MST support was already implemented in the
> previous series of patches.

Why do you update only SA8775P? Please update all the platforms at once.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 897ef653b3cea08904bb3595e8ac10fd7fcf811f..4a94f37513c21f9a273080b572a1e50a186a45ce 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -108,8 +108,10 @@ struct msm_dp_desc {
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 4},
> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2},
>  	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>  	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
