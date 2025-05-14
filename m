Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4105CAB7588
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 21:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FCC10E6E8;
	Wed, 14 May 2025 19:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmK1PI8Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D37810E6E8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:15:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuelq004705
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vh7H0yLxNzQIQl3kX5HeQXht
 XXVVGd4YVC324hHcq88=; b=BmK1PI8YpbDEFywyps9bUzBkXATRBOuoq1qk0J1k
 8HDMFeHYixJV+zUoheAkidxTdW0/TLoprYNSVsRGQJEmYwU4d1vXhwCu+jdaixZI
 dVxajHBskTn4upXzTrA+83Spo8PMXNqtD6qHolFpKpxBOy0NZgvww0Sn7Rm8OLYK
 BpHt9A/2Hq9236dbMEJgGIpKjDIRETNPf01wt7MYN14GwzxjrM7FIce2JgKf9lHB
 /+WJmtdtlKHPxUj72Au/adN37tYcYIlaMomwVITGXokwF3THnN+VLoWScIcaWxVs
 B9nNh+S+BPhhfbrDNVa6J1tZ84TaQUaPMt15S4ZODgi7aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnutme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:15:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7caee990721so20540685a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250099; x=1747854899;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vh7H0yLxNzQIQl3kX5HeQXhtXXVVGd4YVC324hHcq88=;
 b=avF/NJKwfaFmVnx+CIQoj3IHoX9WipNB5OFqA/bGNLo94bkKGKoSF52DOXDX7y7cjk
 XrXkU9Ae1CBQOfBZ7ke55yhEs98puBcIVNrzUHevyl2Rm2y030uYaPw8qxPgIpAshIX4
 VXWVGfemVHFp26i1ZTAs3hAZjzL3VEzDn8h3hfLdix1xXr5zF6BNqOEHHoNYXT1AG4BW
 EcJYbFAXLI1YwCY3qpNwWVVBmbl3l5nGIispnrSdxyaH8e+yA5Jpf96PIljewZEaui1Z
 50+Q55JiNSRcbQMcBHBqPGePgGF48sdXtl+w75LvO6nAMY3wlGd+vWR6IYPVpGBRnVDy
 o17g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvF9mt1qLoNYsAxdQj6sddE5ph584McRUK5Fkk4q0ACjdKG1Jtow0RDzCxvR1o8d7UhlYodBPCUHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxMFP2PUTyguvtVeIEl20uQoyRkC9ZlhTU/vbhFRXKrD8lXqlN
 FEFn0x9lVzxWrtprm5hcL39KLIMOb/TCL1vBjVeO6vzO1c6iI5kZR+6TITE0e5jGdA4x7gV6CRy
 MoTb/omdYvPj/VvDq+iXCDrw70LSRbj48VO1E5YCfCTrSfJmhrkF3LM5St2+G24GYG2U=
X-Gm-Gg: ASbGncuW5ccLHvloQM9wzMikWmGgn2RHf/s1q2/HDb+LMCHpCwnC53E8wd8LzT5WVUx
 n2O1K+1hyOboqkSsyZi8CQsyyDhO+WmpfqXNo1QYgfzHiJfuQ5jcjjc1sn238+iGgSYrmeZpxmE
 rOSNnr4Ka5U5XyNxfbupXiJ9GNL3/e8ZDbiZ49pdJnviCHv5Euss2lc3uNWmvwsvcsYBkmSETjd
 /m2oXOIrlMSKEv1/OKFUdg9csKhVJvKwc1oqih1+SzSxKAgL4dBSBxEKb+KfYRB7T+WefFth8Ag
 MMcSW6VWpinR6Qc3hNvyaTLlyG7KQj1JvUC1rfsUbDF6aei+JTA5qoyWZMCKgFxt36ZCbwFXKPg
 =
X-Received: by 2002:a05:620a:3954:b0:7ca:f039:7365 with SMTP id
 af79cd13be357-7cd287f8e29mr760419185a.8.1747250099350; 
 Wed, 14 May 2025 12:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW1uLW0kicqfgbHoNdFUn95rpD1RDFnA/XLJvVUD+FX4xES0n5KnnFI6QYVl2bk5Get+Fxgw==
X-Received: by 2002:a05:620a:3954:b0:7ca:f039:7365 with SMTP id
 af79cd13be357-7cd287f8e29mr760414185a.8.1747250098844; 
 Wed, 14 May 2025 12:14:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64bee73sm2349244e87.162.2025.05.14.12.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:14:58 -0700 (PDT)
Date: Wed, 14 May 2025 22:14:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 07/15] drm/msm/a6xx: Resolve the meaning of
 UBWC_MODE
Message-ID: <xzmvy6ulog67b5ibzg5gm37rvxerbwszoq3qr47kapj2rbjeuf@wr25nsuasa4d>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-7-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-7-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: RpbkREObS2InH4csubc2dmykPAwcVbO0
X-Proofpoint-ORIG-GUID: RpbkREObS2InH4csubc2dmykPAwcVbO0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfXy0CPYySurJWn
 2y9kp6Mxsn5NbXNIygPsGjLKDtkdHZzXi+ODaUCZ4ifuNeEy1JKFFA52q4nDF1tLyOMlAV8JuTZ
 369I5d+4gf4vtWP5HtnN76t4rk9Z7r24BbUeJJZTrdSL4qEgZnf67H/UnXs6sTAyX9VVfzt+v5k
 2Ps3H5XIHcp0zyk//K1jiD7yCVqu+C+Al6IwhdbrfZWyhym0dL3KHDtIWmV4FFDU5AsH3TsVoRT
 +aU5gAP+z1DsReVu/6gjSkqgzWrPncwbouliytCLSqlN67AFZ4vLe9hlDwySbuFtu3BcPpKDLhr
 vYLASMgMGELya7n/sYqawOi2hQEAi3CC4TIq5iggOBxHBvbYxwen88j547MjKZ4PtfaW94xeQSu
 ofz48cjD1h31ZoBdDFquQE7E+UczVkbrWm1p1M8cE8DDsCqvJVGkrvfTvo+b7QH7IXryH/yo
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6824ebb4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=yx7l2LZIIY2QNE-vfc0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140175
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

On Wed, May 14, 2025 at 05:10:27PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This bit is set iff the UBWC version is 1.0. That notably does not
> include QCM2290's "no UBWC".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index e7c89f9c7d89798699848743843eed6a58b94bd3..6af4e70c1b936a30c1934dd49f2889be13c9780d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -669,10 +669,10 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  	 */
>  	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>  	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);

I'd really prefer if the function came in this patch rather than being
added at some earlier point. I understand that you want to simplify
cross-tree merging, but I think we should also simplify reviewing.

>  	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
>  	u32 hbb_hi = hbb >> 2;
>  	u32 hbb_lo = hbb & 3;
> -	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>  	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>  
>  	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
