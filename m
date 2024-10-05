Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37DE991D8E
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 11:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5D810E140;
	Sun,  6 Oct 2024 09:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VPXOk3ZP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA4810E100
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2024 16:31:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 495BqllL023338
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Oct 2024 16:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g1DrUfZua4F6fDsbCUaZ1sAuO6WCHxhZhRBSszMS84c=; b=VPXOk3ZPzZzKL5Xu
 x2ArITegt7t/KEzJ7o53fqvESvVYd8hD6WfPZCknFiwD3Uj9hcOKn6Qxmffj2CxG
 Rsax4DHC0DkXUlamSz20UXv1tr/nOoZ6PchIw1WU9uHlXl/4427UHagxFvsnh6yt
 9m38xrE73TW7PmAY12roZ20kM93bZdTIN1HCAZmd6tTWTJtjv/c09R9w/4VLwZNh
 Oc8n1mHE4S28hs1JvoxPh3IzxQBeli0x8yXfng3eg00sHcnjKduZrvAKQHR7KO5Q
 a9i5Bwzl4laVZt+Tvfy9N2QkY8TLuORF8azL3RDpXEllNZ+qfeen80IdEIKpsURX
 ILm7eg==
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xu68t2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Oct 2024 16:31:15 +0000 (GMT)
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5c8828b03a3so373630a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Oct 2024 09:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728145874; x=1728750674;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g1DrUfZua4F6fDsbCUaZ1sAuO6WCHxhZhRBSszMS84c=;
 b=GFLoqS+gmcJEIqpjUnAPzAJBUeSGw6OFkYkzCCxBdXLM/LrLbr9MzvUbWaA1SBNbLa
 avTHlxI4olmmcz2El8Z+qhwcZTvCBz/K1XCWA4KeMifVewUEfIrsF0Qd2ZyzlqhAN6GP
 Jk7v9e6wd2wjAgSsg5ta3X0yKLG2ulMDItiA/WzQ6v5qdzMt0G6vWVTfO4eeUZtIvYbt
 fuQD/F6hXb5XRtSP5co60J/aLmwJey0SJKl6puJuk/T2Y4rjSnPZrOQmxxUiSCZDVK2t
 kQ+mTKpNBgfX57SnyitCPIXtx61CD+byWtp/YyL6OrZ4f/XejlF/gKTeuzb94tVN2k/B
 s4mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4BqJPzpHE+1cRryBkwI1CQUm101zlVjOvb3YKHN51KdBS3YYk0hwHWMPNYOtk30VHoei8IX/myzQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFftUkESfhdTl0KftrZqkp5zbl/mtPVRdp+Lx6tHjMpkLOBEmP
 TkLc1WrFw5L0qVV1anOJBSE7z5hNm3L3sfOc3kWexkd/gQvbU6URzoWoAG3EI/1Q9AopuU6kTvn
 ZcAMRMS+djoJF21crK8BmC09wSZcB7vY15RS3p8jJkvaRpSbRPxcSB90F8yQ0WpTN/44=
X-Received: by 2002:a05:6402:34d0:b0:5c8:8381:c17b with SMTP id
 4fb4d7f45d1cf-5c8d2d02685mr2360050a12.2.1728145874128; 
 Sat, 05 Oct 2024 09:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDDW6XxiZgpQtH+HswqMKcQG1qf3+CFB/WbtT35s7v9ACQdUKD14uAlsycQAjBffPIhQy/3g==
X-Received: by 2002:a05:6402:34d0:b0:5c8:8381:c17b with SMTP id
 4fb4d7f45d1cf-5c8d2d02685mr2360018a12.2.1728145873125; 
 Sat, 05 Oct 2024 09:31:13 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05eb4b9sm1157579a12.75.2024.10.05.09.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Oct 2024 09:31:11 -0700 (PDT)
Message-ID: <ba56c822-cf3d-4d62-86d4-e04551e443c6@oss.qualcomm.com>
Date: Sat, 5 Oct 2024 18:31:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
References: <20241005143818.2036-1-jonathan@marek.ca>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241005143818.2036-1-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ece8dWHQa34omekKPcAr8Eh1iOPGciHa
X-Proofpoint-ORIG-GUID: ece8dWHQa34omekKPcAr8Eh1iOPGciHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410050122
X-Mailman-Approved-At: Sun, 06 Oct 2024 09:55:26 +0000
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

On 5.10.2024 4:38 PM, Jonathan Marek wrote:
> drm_mode_vrefresh() can introduce a large rounding error, avoid it.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 185d7de0bf376..1205aa398e445 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -542,7 +542,7 @@ static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mo
>  
>  	int new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
>  
> -	return new_htotal * mode->vtotal * drm_mode_vrefresh(mode);
> +	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);

This seems to ignore mult/div by two on certain mode flags.. is that
intended?

Konrad
