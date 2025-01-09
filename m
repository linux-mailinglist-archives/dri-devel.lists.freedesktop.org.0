Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A070A0784C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1830910EDEF;
	Thu,  9 Jan 2025 13:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+Jrucou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9931110EDE9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:57:42 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509D8cHJ011816
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Jan 2025 13:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JF0AHoOXM/Omt1W9DsxEmuSnjvh5YmVttxjnDNqIHSw=; b=O+Jrucou7GQu6Gk8
 mvpM9O/P0I3Sbm5plAmC7W03BZ1Gauf7CMtg0qxbezqhR5tcGQCkpc+fMCcX3fVW
 4i8m+zkaJML/2nY4S6q0DS+QVzeEJowQ4gpWETycY3wpKmD6rYekopUif8T/cQY3
 Er6F9Tck6BoHpM8BCQ3EpJ6RgSGuOqmin3KezBzJ7T0dRwb3313khvtHcGBJd/Bn
 fofgLlZs86NQb3hjMr9rMHt4nY2BUycz5Df/KCfJdHCrFVVUIezdcGIYix3XZ2Je
 MFUxVyTBaQCPAZI+4420D3gDLh70kI41KJL6vU0Jc1ZZuiUSKMgTQeeoX+JUw0af
 mt+pvA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442f2kr3m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 13:57:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b6ee03d7d9so17809185a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736431060; x=1737035860;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JF0AHoOXM/Omt1W9DsxEmuSnjvh5YmVttxjnDNqIHSw=;
 b=DoECFWQqXUhoKC5eDhDeWpQyqkmELA8ctgu4YdfccIoVZcQj38F5Eia6m0g6J7gdyn
 BxIWs3XmZLnyK6JwLwEoui3ElMRt+8gwxD3kPJyMRzLWENTH2HUHBR7Q9o4+0lRt2iDA
 fYn1g+D8IRHTUu/1I7zTiPiUjpUKt+AcookF2dZptBt2r6wUdHRR30mWatCsixuuBqHu
 JjynUv5dZ318kkRRQAvdfU1HAfkjcOiNKkildKlxvFqgnsGUkg1fli5wb6NEQjN9c0SS
 wPSCts+fv9ECLr10W/q1JHJ0AMewN5iDmSvvOgMWU3OPhnYf2Zo2/2dV0+go7TiwpczL
 qjdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHaydtnBQD+obgMnfORJcE1Ja6UYhkXpUQ8YMkpNrgqZWLY/XhiSyj7oo69qQFolRWmeVNDxrMnkY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7pYQXktsqMVpRMufc/vp7qUOg34ClK9kGdqNMHNnqM7JUD1zv
 OrYnxOb2E5ZIr5s/Mr33bvpPYm2R3VNp6yEFxF/XbXnlsz12cHM4AoJJf4iyFfiStrBqPaaRmLA
 rG+Rwp9RSnKNw2Cx0UVUw9kYjUTEWKpJe6IEUShPaYRHUCIaafSSi/ZyEC/LpyBqpEEw=
X-Gm-Gg: ASbGncv3rkEXxSJq3t3D8IqTfXwyMHY3F8G7ZPgPM4i87BbgkF9+m3OmOJfFRH+O62z
 eBMbVJfY/1IzRcokkl+UminIzrSsHUXzL0a+uXmwco18yzWoADuLfnqkz6/TQ7E9lMWBAWc+kg2
 EtS0mSTnMAFT3hEb8NcWUq7oYx9SI6i+lkAcXJZyymcqL99JZZNSty2jFxGTySAI7THvLfHbYA3
 qkVAT+A1b60EzbysV/LmCoZ8sXJ8FK9+/3JdVnbjNRs1ws1vQReFkQSrdpsXKbXCmRYKUI6D/bB
 FCYkk11m/brks6zJ0R8xBh5HsFE49pr0v+g=
X-Received: by 2002:a05:620a:40c1:b0:7b6:dc4e:44a5 with SMTP id
 af79cd13be357-7bcd973a062mr387280885a.5.1736431060067; 
 Thu, 09 Jan 2025 05:57:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvEFQOSMjPEdcmaa6JUHa/5+PkuCwquAgHnceMKaOpZSDG8+5Zh8OYxiwJczUZrYpLlO5jQA==
X-Received: by 2002:a05:620a:40c1:b0:7b6:dc4e:44a5 with SMTP id
 af79cd13be357-7bcd973a062mr387278285a.5.1736431059674; 
 Thu, 09 Jan 2025 05:57:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99008c3b5sm641951a12.12.2025.01.09.05.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 05:57:39 -0800 (PST)
Message-ID: <356986fa-e66c-4e78-ab92-2593b037ab9a@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 14:57:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] drm/msm/adreno: Add speedbin support for X1-85
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
 <20250109-x1e-speedbin-b4-v1-1-009e812b7f2a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250109-x1e-speedbin-b4-v1-1-009e812b7f2a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tJURmTaHUHoq0IKjh2Ya6-1Rb_O7CKli
X-Proofpoint-ORIG-GUID: tJURmTaHUHoq0IKjh2Ya6-1Rb_O7CKli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090111
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

On 8.01.2025 11:42 PM, Akhil P Oommen wrote:
> Adreno X1-85 has an additional bit which is at a non-contiguous
> location in qfprom. Add support for this new "hi" bit along with
> the speedbin mappings.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  5 +++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 15 ++++++++++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..e2261f50aabc6a2f931d810f3637dfdba5695f43 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1412,6 +1412,11 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.gmu_cgc_mode = 0x00020202,
>  		},
>  		.address_space_size = SZ_256G,
> +		.speedbins = ADRENO_SPEEDBINS(
> +			{ 0,   0 },
> +			{ 263, 1 },
> +			{ 315, 0 },
> +		),
>  		.preempt_record_size = 4192 * SZ_1K,
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 75f5367e73caace4648491b041f80b7c4d26bf89..7b31379eff444cf3f8ed0dcfd23c14920c13ee9d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1078,7 +1078,20 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
>  
>  int adreno_read_speedbin(struct device *dev, u32 *speedbin)
>  {
> -	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
> +	u32 hi_bits = 0;
> +	int ret;
> +
> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
> +	if (ret)
> +		return ret;
> +
> +	/* Some chipsets have MSB bits (BIT(8) and above) at a non-contiguous location */
> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin_hi", &hi_bits);
> +	if (ret != -ENOENT)
> +		return ret;
> +
> +	*speedbin |= (hi_bits << 8);

Now that we're overwriting speedbin, we should probably have some checks in
order to make sure somebody passing a too-wide cell to one of these won't
result in cripplingly-untraceable value corruption

I guess we could just introduce nvmem_cell_read_variable_le_u8() and call it
a day?

Konrad
