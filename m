Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2009DEB56
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 17:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FBA10E53D;
	Fri, 29 Nov 2024 16:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRjC66XG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E552B10E546
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 16:56:20 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATCe0Ta032583
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 16:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9N9+0StuwjFo78qzxGpA7gT4M9KWRW0S+SLyWV8Ydm4=; b=SRjC66XG6ukxUnql
 QAhvEXXLmYdoqEywLif+5a3pD/fEzyeJuaE0KBFTyGuG1X+ROPeAHW7006tzhx1l
 f9udFt63+k7gOJuAr+Mc+zVUSZ5f7NBfzvExm443ilGKpTkSSu5TN8LIpnPYZ6O1
 osmCx1REcNLc9/9SBWPmRVHX6kDBmL/zXwY1HMimUH4Qc7vWmGcsA9cYqrMH7dZa
 TbYxQN9uEe479CJDCsHoWQtAU4/t2f8V/LOJ70kMhqyjlKHMzIhAolRiTrXwibC2
 9UKh85kPXc/1SwY7hg49nqJDvgzXwmHTulsifK4301kz1u7eKafttQGiiyPIOk1G
 H0dyRg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43671ee1qu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 16:56:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4667cab5e1bso3164601cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 08:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732899373; x=1733504173;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9N9+0StuwjFo78qzxGpA7gT4M9KWRW0S+SLyWV8Ydm4=;
 b=jkm/lV7LOIGjwA2o0O3MQU9JPjVwdzljCFEa07OwtgnrvZCvRgPHca0SitIMjDHXrs
 ByIEo6QSh+9qmhdfGCoeYPjPi6neailZhO7DdedUZPQkJO6s389gAvEN14+TlqQ18Dps
 Q53AuaWRUcINm+dV8l7oLkBNze+Pn50Ba5XYm/VDt6LisOqNqvYotPD7RpRidLYmHtep
 0aFxoZKz+cudLlwEVntIo2lxkOVSa0ntmu1luJVS6Tnpn5iuvw2g19idB0RwvIHay/XB
 sluMS1rxtdD2BysViKT9eoZeRiRcxFL6feA+tzlkHlC+0SR+myFstPr6Ov4osX591RJy
 b3cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz2tlcb7VmZF8RJxQ46SKxTWfCQaH7RfSgx2CFpO8X1HfK3nQ37pevL34IXuWq31AznF6X988GlhQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyz6tqinb4dAPz2HjovDfneQamTO8kgfH/hgNJ2EwBOblAKs+PN
 dDx3o57uBR78OMR/0olpCfTJSoSqutAUH4o2zV+2uEAz4r0AuDvdKnY9jnPKjdcuM7s+7nF17m6
 SLRe/HVztXsS8KwlrHeUTrFhVwKXSt9hYdgZ7OvfReYyQOnXKFIKQcO4Rc29iaQhEQk4=
X-Gm-Gg: ASbGncu6qYb8t3fdDssUwcfS/c0k/fxtM5OfvSKBDgOwA76zOWjnEZAOsHajyPBpotB
 iRbInK7B0IYXn46cjr+Dv3Xhf0uEipYJfcYaYJI6L1mTGeCHbTKzJLIOc0gV8UeP7tlUTcyLfIf
 LPgjO35AdMXLI228ebQUvgY9kGcJ+qoL/basocU/lybgEywgLQhTHqg3+X5pS/4bwBDWVpzxA4s
 0k/D4p4+m7tApWQjFPVMaFSyKfFtWz97jE+MN5jDw9+W0OXK+MyiO7/H3UTq707IDu2V3RazNFq
 E49wg/LCaxtks8FkbBTh8zbU49Fu15E=
X-Received: by 2002:a05:622a:389:b0:462:fb65:cbb5 with SMTP id
 d75a77b69052e-466b36886b8mr76651391cf.16.1732899372944; 
 Fri, 29 Nov 2024 08:56:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVQSLO78wLDzRLA3VpDJ6fBlRPS9lgHqu+R15VZlArJvaDZj5w/JO/kqnnSs0mQp12UhVnIQ==
X-Received: by 2002:a05:622a:389:b0:462:fb65:cbb5 with SMTP id
 d75a77b69052e-466b36886b8mr76651111cf.16.1732899372416; 
 Fri, 29 Nov 2024 08:56:12 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e64c4sm190708566b.97.2024.11.29.08.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 08:56:11 -0800 (PST)
Message-ID: <00941d91-7366-4836-9d3a-7e505528a4e8@oss.qualcomm.com>
Date: Fri, 29 Nov 2024 17:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/msm: adreno: dynamically generate GMU bw table
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-3-81d60c10fb73@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-3-81d60c10fb73@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: byCq2muMdZ2q6qiBBXPsuiOXAAx43b-c
X-Proofpoint-GUID: byCq2muMdZ2q6qiBBXPsuiOXAAx43b-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290137
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

On 28.11.2024 11:25 AM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale the ddr
> bandwidth along the frequency and power domain level, but for
> now we statically fill the bw_table with values from the
> downstream driver.
> 
> Only the first entry is used, which is a disable vote, so we
> currently rely on scaling via the linux interconnect paths.
> 
> Let's dynamically generate the bw_table with the vote values
> previously calculated from the OPPs.
> 
> Those entried will then be used by the GMU when passing the

entries

> appropriate bandwidth level while voting for a gpu frequency.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 39 ++++++++++++++++++++++++++++++++---
>  1 file changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index cb8844ed46b29c4569d05eb7a24f7b27e173190f..fe1946650425b749bad483dad1e630bc8be83abc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -621,6 +621,35 @@ static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] = 0x60000001;
>  }
>  
> +static void a740_generate_bw_table(const struct a6xx_info *info, struct a6xx_gmu *gmu,
> +				   struct a6xx_hfi_msg_bw_table *msg)

This should work for all targets

> +{
> +	unsigned int i, j;
> +
> +	msg->ddr_wait_bitmask = 0x7;

GENMASK; also should be generated based on BCM data dynamically, there's
logic for it in bcm-voter.c : tcs_list_gen()

> +
> +	for (i = 0; i < GMU_MAX_BCMS; i++) {
> +		if (!info->bcms[i].name)
> +			break;
> +		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcms[i].name);

A7xx share a common list of BCMs, the buswidth may differ per soc and it's
something already stored in ICC drivers

> +	}
> +	msg->ddr_cmds_num = i;
> +
> +	for (i = 0; i < gmu->nr_gpu_bws; ++i)
> +		for (j = 0; j < msg->ddr_cmds_num; j++)
> +			msg->ddr_cmds_data[i][j] = gmu->gpu_ib_votes[i][j];
> +	msg->bw_level_num = gmu->nr_gpu_bws;
> +
> +	/* TODO also generate CNOC commands */

We only do on/off (0/100 units - kbps?), it seems

> +
> +	msg->cnoc_cmds_num = 1;
> +	msg->cnoc_wait_bitmask = 0x1;
> +
> +	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
> +	msg->cnoc_cmds_data[0][0] = 0x40000000;
> +	msg->cnoc_cmds_data[1][0] = 0x60000001;
> +}
> +
>  static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
> @@ -664,6 +693,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  	struct a6xx_hfi_msg_bw_table *msg;
>  	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>  
>  	if (gmu->bw_table)
>  		goto send;
> @@ -690,9 +720,12 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  		a690_build_bw_table(msg);
>  	else if (adreno_is_a730(adreno_gpu))
>  		a730_build_bw_table(msg);
> -	else if (adreno_is_a740_family(adreno_gpu))
> -		a740_build_bw_table(msg);
> -	else
> +	else if (adreno_is_a740_family(adreno_gpu)) {
> +		if (info->bcms && gmu->nr_gpu_bws > 1)
> +			a740_generate_bw_table(info, gmu, msg);

This if should come before the hardcoded if-else chain, as it
applies to all platforms

Konrad
