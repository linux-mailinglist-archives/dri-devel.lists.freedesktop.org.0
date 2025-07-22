Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCD8B0DB67
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4438710E684;
	Tue, 22 Jul 2025 13:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a9Xcietf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4579510E684
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:49:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MAfLqZ005535
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/ahKHSJjWMR0JbnnzzPNZ/NL
 nOfa1sJ/Sol3h9sN5wM=; b=a9Xcietf16qBoxAuyJPAfrjcHNDQDra2LGSMqgef
 bGQqhe9k+vrs9KdM6Yz9Rlx5LRe62h9iR+WTXcEyGlwQE3L19/FF8v3Zd28/oKFX
 X20sDuBg34LYSnTmcE3qrZeHOcqZzgnU7LAtM03g4+FAT6214FIleIlSBjg5/t81
 vpPpE++N8NPg3opoxyxqoHvYlxejg0osrFFze3b81XSFqomtO+Ab9mkpfYpmoAmF
 nFiNd9EBZwnh3adnWTN8QuaHxbuXYXbOOEMaTHMVzb5rE5o64TWaa9I1XpvdWYui
 PjQ5neNSOD8rVAdvHjTnfCz67jkT5E/yWuaMhpw5iRri+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q9n5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:49:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e32df3ace0so448843685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 06:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753192143; x=1753796943;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ahKHSJjWMR0JbnnzzPNZ/NLnOfa1sJ/Sol3h9sN5wM=;
 b=N8vFg2Mms17ImWfTessHjZ9LlcSqODitElKQgNIkx81NOFSOxOnAvm3CnfPdlDFElT
 CfdQW96HA66/cV/Qp6pCYsmaPgeqNI0dOy36wDh+jGphNkSYRCv4QmwBd4aFZv7yZzhi
 98Rj84jNQcTLAM8MqXIoQzxvj03d/oy4J54/nHrZGHnJSMDNQD/8W+GISrC0fgVVhNFh
 Y0AJcmeNTIMXoCpDHTH3YTSrRkVGIwXMBNAY6HKv2KydUqqlY+Ggyq3ukQ4gP2rQG9X3
 /ZUJl/bBcxhr3XLPcv24KeVhZ1r3JpHoPCwGZdhOKc8QbhMt+Gadk0eEZUvWxJAOm2fI
 4h6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWol1ZOv6X7DZSy/PAHBlrSlSKrN8ZuMHBucI4HG67VD7FXDCBP7oC8C7oTvuufVP/JffWRQanu7rU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0UY9+pl+rPc198u9DAc7xdDWwwogp5b1GLvcYw+kCMernBFU3
 zet7EPa8mejauf/6hQ5WDaCeCp87OwN2DPJOXuCbzQ6iH1DQGeoKAgVv4fXpKAroCU2KTq1cMMy
 WZQ9CbyHUSExmJ0ZVXJoVR9ypUeg0M+cjQa/50vI6lVw9avFroCSb8iILOQOsgI1JGvoo9Qw=
X-Gm-Gg: ASbGncurnpZikmiRU5XDZPRr2ucDuqYUvKFwDu520uiLfM56762ppQG1IUxWtILAjxT
 /Jjqk+WdZQ3yzC207ePHsjULxMlyhBAzrMGXPeIxoBVOndHKfX/6xMWYy45khrGWXKdjZ5CQ2gi
 MWWTORaM0y+OvsBSlHRo1eYmUkb7wSeeI4mxg+2npOWfR0ohz8WXW8il3I8Mr6mWHtp25h+fiQP
 0rMHGc5Njgeyq4rvYKAid+UWTe7USi0gBSVbYFhTnfddw15CNY1wBdI1xQA9JjV4SWDg0p3/TfC
 zvTF6rc1ATKBeWMCMMHrnDw23ppoBnse17GlnUykWi8EL8AJrN9bIbQf3JYkI1u7LqlH9WUy7j+
 eSoepGnJlfgbNk8T9654tFjFslCJP1fG/i5AA5owQjUhbvV4UCvgb
X-Received: by 2002:a05:620a:178d:b0:7d3:8f51:e80c with SMTP id
 af79cd13be357-7e343571240mr3158197785a.22.1753192143453; 
 Tue, 22 Jul 2025 06:49:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmmaQ1krTHbmcZorYzIOGhW5X5c+FKz8RqQxyMYTrcBqK8TnKqrJzlUyB3wkUh2DI0SekV8Q==
X-Received: by 2002:a05:620a:178d:b0:7d3:8f51:e80c with SMTP id
 af79cd13be357-7e343571240mr3158192785a.22.1753192142813; 
 Tue, 22 Jul 2025 06:49:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d91134sm1959164e87.145.2025.07.22.06.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:49:02 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:49:00 +0300
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
Subject: Re: [PATCH 11/17] drm/msm: Add support for IFPC
Message-ID: <k653qq6a4xkvwadeum5kbr7cheje773vobehpzq33ec44vyxjj@vi3ekv4jwext>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMyBTYWx0ZWRfX+hBq34Xhf+Ol
 jLGb1mlj6CyQ0Li7wBP+DezvLgdwQbmtP812L9UYzzpKhls5wnCilPZ0ySbtEsTqE62al91h5m0
 La+kBF7aZZRsfd2H0dumDXlHpVBIsVLG5nSp2axYgZP6T/I9WNQoq1KOov3BUzTOvgNfV+8E25/
 FbHwwhrXY3YF4wLSXwYlQflKWohrD5mhKC5/GAhRoVwx9qkNUGBkW1WlzC96LWuDkK8ZucjPbBf
 t2C3bKkBsfJMy9/Ae7onmrCwAW1jdT6fzSWo0+eqS/OgBRUBieaismJ5bwztlWaHWm7HV8dax21
 c4djF7KEahJ/0c+rThkIads6UoHuonHIL1grNOry5U/4orhOEVS8XuBmNGTdDiYSUyxWLueB9Yg
 Hr+PM8ITRl4RzDony9aWCqUu5/hH+P3gqwTAf+ErZa/3fUsTmRvIrWcTxp9F/bS8ozLhZYmf
X-Proofpoint-ORIG-GUID: fFtwoB0cZ15DJ7axDSMCzPg-1zC3wE4T
X-Proofpoint-GUID: fFtwoB0cZ15DJ7axDSMCzPg-1zC3wE4T
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687f96d0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=i_i2Vd3NPHTucyE0f70A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220113
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

On Sun, Jul 20, 2025 at 05:46:12PM +0530, Akhil P Oommen wrote:
> Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
> for a gpu. Based on this flag send the feature ctrl hfi message to
> GMU to enable IFPC support.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  5 +++--
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 33 +++++++++++++++++++++++++++------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  3 files changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 4d6c70735e0892ed87d6a68d64f24bda844e5e16..3bbcc78179c1cf1bfa21ff097e9350eb2f554011 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1961,8 +1961,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	if (ret)
>  		return ret;
>  
> -	/* Fow now, don't do anything fancy until we get our feet under us */
> -	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
> +	/* Set GMU idle level */
> +	gmu->idle_level = (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC) ?
> +		GMU_IDLE_STATE_IFPC : GMU_IDLE_STATE_ACTIVE;
>  
>  	pm_runtime_enable(gmu->dev);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 8e69b1e8465711837151725c8f70e7b4b16a368e..20ade6b0558b016b581078f5cf7377e7e7c57f8e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -21,6 +21,7 @@ static const char * const a6xx_hfi_msg_id[] = {
>  	HFI_MSG_ID(HFI_H2F_MSG_PERF_TABLE),
>  	HFI_MSG_ID(HFI_H2F_MSG_TEST),
>  	HFI_MSG_ID(HFI_H2F_MSG_START),
> +	HFI_MSG_ID(HFI_H2F_FEATURE_CTRL),
>  	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
>  	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
>  	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
> @@ -765,23 +766,39 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  		NULL, 0);
>  }
>  
> +static int a6xx_hfi_feature_ctrl_msg(struct a6xx_gmu *gmu, u32 feature, u32 enable, u32 data)
> +{
> +	struct a6xx_hfi_msg_feature_ctrl msg = {
> +		.feature = feature,
> +		.enable = enable,
> +		.data = data,
> +	};
> +
> +	return a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
> +}
> +
> +#define HFI_FEATURE_IFPC 9

Can we please have an enum or at least a set of defines rather than
havign them scattered through the code?

> +
> +static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
> +{
> +	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
> +		return 0;
> +
> +	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);

magic number?

> +}
> +
>  #define HFI_FEATURE_ACD 12
>  
>  static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
>  {
>  	struct a6xx_hfi_acd_table *acd_table = &gmu->acd_table;
> -	struct a6xx_hfi_msg_feature_ctrl msg = {
> -		.feature = HFI_FEATURE_ACD,
> -		.enable = 1,
> -		.data = 0,
> -	};
>  	int ret;
>  
>  	if (!acd_table->enable_by_level)
>  		return 0;
>  
>  	/* Enable ACD feature at GMU */
> -	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
> +	ret = a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_ACD, 1, 0);
>  	if (ret) {
>  		DRM_DEV_ERROR(gmu->dev, "Unable to enable ACD (%d)\n", ret);
>  		return ret;
> @@ -898,6 +915,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
>  	if (ret)
>  		return ret;
>  
> +	ret = a6xx_hfi_enable_ifpc(gmu);
> +	if (ret)
> +		return ret;
> +
>  	ret = a6xx_hfi_send_core_fw_start(gmu);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index bc063594a359ee6b796381c5fd2c30e2aa12a26d..1135beafac464f3162a3a61938a7de0c7920455a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -58,6 +58,7 @@ enum adreno_family {
>  #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
>  #define ADRENO_QUIRK_PREEMPTION			BIT(5)
>  #define ADRENO_QUIRK_4GB_VA			BIT(6)
> +#define ADRENO_QUIRK_IFPC			BIT(7)
>  
>  /* Helper for formating the chip_id in the way that userspace tools like
>   * crashdec expect.
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
