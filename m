Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BF6C646B4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 14:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4839F10E3C1;
	Mon, 17 Nov 2025 13:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkHdYpKy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ppvt3Aic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA1E10E3BE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 13:41:46 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHBYC672790704
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 13:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 klK61PXSjd0hNV0oaWV/P29BTB/za3rlPJ5baCM50Ys=; b=NkHdYpKySJIqD62B
 iLM+aTqSWr/EqWltK4xwbCyZRhPw79ywpwhzIYfQUQOVrggF6baAGuIz2nuKN4Al
 ElZ5P9UDAuMxgiLjfCZN1Bha9R7xshmZvHhdG6jRngHrtmjnarTjgAn5BGJPHurq
 uXGRvhAw/ceWxizANbFEQ/SZxs629YCGC2lPy3KUxEGQa02XFtEsyxn8PdQBc6cz
 4Be6WFPzuAeDt7BeEGsYkiibpbAZ/no1LZUlTZsqq4EdPNQnvoGpv8EDdYNE9nRt
 xi3YNM1zxuxUsL7eU6tsw+EcCc/447db+NioZVYy1rs/EzX7NA5qW1XQMvvxvfhk
 749AIg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bhrx0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 13:41:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee05927208so6651361cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 05:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763386905; x=1763991705;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=klK61PXSjd0hNV0oaWV/P29BTB/za3rlPJ5baCM50Ys=;
 b=Ppvt3AicG5BZZdd2w5bin9Mw/O10B+aA35JQLXfyrcbQl3m8HQaSyq7zvss1c5d9e7
 q1vK7iwimQTdK1cTBzd0bBMIkdNCI/kNhOY1tShPkXOIL/p5NVcilSlQRE+pVRTYnuYU
 +wIInIOTXSYUO6PeJLv0wAkM4bt1cbILRIYY1Qw957dUPJ5ev6EaQPIlLBEhX3TaeMR0
 o1I1dtXaecLnK7KT8Z88S7vK9juEwAThko92NlI0NYAEFcZj3KUMPI3GRn39Atkw8ykV
 E/g8IOKK63Rz8LrsFXQRX80cZybVbTFX68dLLdZOzNOEuP0Lm8MhcPeNGnlpbZt8Da67
 xbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763386905; x=1763991705;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=klK61PXSjd0hNV0oaWV/P29BTB/za3rlPJ5baCM50Ys=;
 b=NLvEmp6dqzxfZs+Ie+2yuACqtZuMmyoQ/lSG1hCj3rbUboEo/FSQ4BvvoPQigrriNa
 pE0ITJ6k0drtCxD7oPtCPpcYddIIQGiDvWEuVS0Rz0CIO2COKKzPaknKDrBDsTz9peOX
 tBWgeXvGmEE8TQCZFJ+7d61J8bX9pN11Rdb3wqrC0A3pvjDdltKaSNeZ61Ig9ucBUn7X
 ohyp3UcH7RAB1xgbQvnhCzfgGtZSh3UlDn2avHfQbfYIlYfgKvUlJlYQHBRWcnmdklth
 Y8y3QbNwzchkGYsWa4UqyN5f7V3Uzwsy20KEI1DGgKUjkUzxZxZD310GPv1waBwWgXgQ
 39TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDgzpGKh8NE7Vd02OXB7iNlstd0Up51YozZ1JSwcO2o4a8A7LIdwD8qf96AM2qIkmXlRJp5VNNLIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK4Ug84hTCZ/8WpGskb1tsv2xF8gbl5+/8PxKQPkN5YAAAOeF/
 wJw5y8oTQ8r+SfCSS3+7HY2MXrhoOv66PmOZPpqpAMmN4eN8lNwBhBxWxdJmgiWYjAt97EJ+5/F
 /fsYF/OvXDPWRL5KTNuBxB5ssFgbv/dIHJme1EvNP20YhErR9o6VZnTElW2q5EkivAZCZWM0=
X-Gm-Gg: ASbGncsUrcOuj9E0B3Gv+Af73tPRA5CC2JOanabWZvDt3LNd1KejubNjLEwgMgbRkrF
 9PEgnVdNpIpKPt57KRCXsOgHBdianrutT7fvA/27akKiKmgr8nkXyCet5nWqv7igLwxd1BxmqJp
 NLM+artGNRORmc8BeQ3CMhAaUDtmO1Mld3voaaBIwKluv7ma8UPMbMLW1bBnR+Rh/iovMAuRwji
 FAFHyvIj7e+JZoAlIVK9XIc9qNgihJU6wl463ALQnkR/JmE0ZUl5cI/CCIxXJT7VYbUj1V8l6oA
 O1OjFaXdpSmwtwGrVF0LCzCemXKeAVhpIl+Yf2QoPo1C4LDzWHOhQ+yqCD8QNe42YoigiI3XaC1
 uzjDJcJ2uu1Keaj29S4S0DwpRtVl4PrK2mjOmMswtjs3M/CDoIgl+NgOg
X-Received: by 2002:a05:622a:8e01:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4ee1588686emr42334541cf.11.1763386904656; 
 Mon, 17 Nov 2025 05:41:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXjeOnWOqKRzGv7+Ux5gt6tTZvyWI1wBlvFc4rLJ5C0QkL7YdbAjBn/AYTf8fPgd9jvCo6gw==
X-Received: by 2002:a05:622a:8e01:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4ee1588686emr42334251cf.11.1763386904241; 
 Mon, 17 Nov 2025 05:41:44 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81296sm1103136466b.6.2025.11.17.05.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 05:41:41 -0800 (PST)
Message-ID: <d7bcc255-b922-4ae9-af70-5757f17100c2@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: check state before dereferencing in
 a6xx_show
To: Alok Tiwari <alok.a.tiwari@oracle.com>, jordan@cosmicpenguin.net,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, simona@ffwll.ch, airlied@gmail.com,
 marijn.suijten@somainline.org, robin.clark@oss.qualcomm.com,
 sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com
Cc: alok.a.tiwarilinux@gmail.com
References: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O2QzgsJsIkauz6iYU1g0q3X2V9DWOd8-
X-Proofpoint-ORIG-GUID: O2QzgsJsIkauz6iYU1g0q3X2V9DWOd8-
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691b2619 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8 a=73rUxmhrSfcUVL-5kvkA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExNiBTYWx0ZWRfXzLHAwFMmiDPq
 G2dbZ+I0cG03jsSqOUVeOxGPG/9DS2pcsTFq6/rkl96dOzlRi92MdUec2XZY+aLdZIQXKIB0JQG
 f8vxWHmyM0J4JAMDdVGd+AcD/kSebOePnONx6jls7yAZ7zxkSR4rPsdgCm/170mYO8GJjqVFBTn
 tS1Q7f3QuY9HQ0diwih8KD0Q+H1qPuf5TSXSnG+RjwqHbTj89vUNBJqNf+Ev3e+ma+Aswx23Zla
 /+MbFbmenM+19cQK3G/zHOlvWLvwvvFRLIlB5IyfLsTl/VUqOGPH6hw+PWnLY0cpS8VzLjL/zrR
 ECtHHsEksDJeAyROSsgCDb5gt5I1P5TU/FSpsqAK+shgJyYOt+XX8dmQ/gYIZiSES3yrK71UecF
 0FXo8ArJD0D0xwbs2ERedOGaHBr/SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170116
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

On 11/17/25 2:25 PM, Alok Tiwari wrote:
> Currently, a6xx_show() dereferences state before checking whether it is
> NULL or an error pointer.This can lead to invalid memory access if state
> is invalid.
> 
> Move the IS_ERR_OR_NULL(state) check to the top of the function before
> any use of state.
> 
> Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

container_of doesn't do any dereferencing of the pointer, it only does
ptr arithmetic which is ""fine"" with a random/null value

Konrad

>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 4c7f3c642f6a..e408e1d84ade 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1976,14 +1976,14 @@ static void a6xx_show_debugbus(struct a6xx_gpu_state *a6xx_state,
>  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  		struct drm_printer *p)
>  {
> +	if (IS_ERR_OR_NULL(state))
> +		return;
> +
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu_state *a6xx_state = container_of(state,
>  			struct a6xx_gpu_state, base);
>  	int i;
>  
> -	if (IS_ERR_OR_NULL(state))
> -		return;
> -
>  	drm_printf(p, "gpu-initialized: %d\n", a6xx_state->gpu_initialized);
>  
>  	adreno_show(gpu, state, p);
