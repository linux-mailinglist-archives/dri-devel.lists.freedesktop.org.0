Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81AC64899
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 15:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAAC10E14D;
	Mon, 17 Nov 2025 14:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDTM5GSl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KH0r7GUC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D003B10E14D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:03:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHAC2T53571472
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A4gh/KiDMiXP6GtsBD0jV44i4prQwi2UZjkTQnAGpfo=; b=fDTM5GSlpZlpE+F/
 Yll2WAWkbz5B8FIvh+LLqnK1wha3+V5evOq5StyQ7/yXVwQT99HwrK/QQ4DYrHib
 YtYZPmUrhDwQm775l1eMYeL7T7GtlcSFk7oBYn7+4zKsHI6uYcAVX9OQxSwoefKf
 GjtudtcbJIo83ojArDZNAUoHitTo40vVyCMMoa7qn+VvQ+tsj/XAetXK1E39DJGe
 347eDqJ2DEZjLYzsHIsLIm15nbZSeUeOoQMsLTF8ZU1pYIgtJZXDewAui6xuE33p
 LG63nW6tGf1brkpBHO8HJtDS6ySSN5V9rFmrd2bcDUCkKiSzLN/dM+qUNgsYgVAp
 t+ki2Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbrm3x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:03:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-559a4539437so290565e0c.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 06:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763388188; x=1763992988;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A4gh/KiDMiXP6GtsBD0jV44i4prQwi2UZjkTQnAGpfo=;
 b=KH0r7GUCo0PRl1dqWuPvUy3iPCD9U7XBnmTW7ZwYkeTxeL2/QUlBf7FutpUduLDiT1
 lJ7eRJnzr7/eYjA+ss1kpbLmM2qo+BGnq520oJDOYYsUEb0nFXQ2Xe/psVv+Q92l8q4L
 ROH8T3GwGjYOvBhn2r/uXdz3fk78bStCJArFbP4FoM8eOXebdy5KMWFfDGUisismZIZE
 sQ4TWfGzyeYnZ5LyH9vNoWy98pdWBzdGpqf9xBEvOkfM0h82wT2SssrsuCqigXrJbS1j
 /A/SRo6Zp0pQwMtAj0rpqQQIrdYbZq/7mpdR1/EPRSQaGw9SO7E1MOjYY6HVpMbWB1pk
 PIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763388188; x=1763992988;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A4gh/KiDMiXP6GtsBD0jV44i4prQwi2UZjkTQnAGpfo=;
 b=F6CYZaJf1X4oQRr8u7MFhHqS2ed8qz5hg7LvI0NIf3fnn/6ROtcHREQvlqUqtNum0i
 45YBXCHRrUAhdQIlHU8qKPKnSD+IDDNpENKvzpF5V9GYUHMhDbBfYeEOPhl8MNY+lzPZ
 t+CU1CDu7Trc0uASRnmC2s317W933YQxs3MzvO3HrQ/BkXEXtvyb83SzBPJrVObGbRvV
 OByRwyc2xmaHvxQdnbcaH9qlzhXaLO2NCH2Oma5HKMngQ634q4CmtCejjclpgye4eSg8
 iaDDKwRC77+BpQ5Qx0RZCmCA9WY+Uth89UAQ5WhZCijcc1DMHaKxx56FD6MMHGaXmrM/
 Pu6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzHk62qeMsEIVMZ01ESUwjIcUgVp7JwlLB3Idbm/moOXrJEqX9BoKc8KxNW7R+2pDHbzGeBnztv8w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyilX7I4z+cDHx5fboARiD3Kd7ib/b+KhrZYQFuzZ0Tbdox8fXN
 o3Yxql9o+YYTb4Vr+5FM/R9zM6D7IT+8lzcznxGkn0AWMK+9Yy8Q1Br0L+HMMC3aG2svSYvJBvF
 k/obnX1mrRn3DO0ETthjE1ECQVaKf39qjMGU2peysKx7AedjBLLA3QNQm1Y8hauyi64OEwxc=
X-Gm-Gg: ASbGncsL+6LF61ZK8ITpTGzuL9x3cY/dVfeV3FRmFGjdlTWN429+d34fhyzMZXlSgrd
 +EJRSIzPBo2s2GSDcBgwwZLL1C0rq0A3fhIZEY3TcYcsPLZC5fGzdD1KD0GtHENCtcEUk2lg1gS
 rxFrbHiQmviM9D0uNdipKe2oB6XMvUpiqD5YoKUIBRobP0Mgnd6MoZAwDPf7l5jDIuTk79Pg6pZ
 SKuaQ4pYnigeZD4518wqH/P40Vf4yMls2m1qH4aZZTsrzo20UP23WucksdBg9SPEUKk9J2te8Zg
 QWp304IxtvDizAKUE2OxjmqqBUpklrrunXsZxDsYTa7iIR1k2c2HkOCshsg8tUH6MwPG6ARAc0F
 IVg4Ika61y+QATcCrYdKwkGeejw0msdB+8AtyQTp6cBHveXLeDHj5InbF
X-Received: by 2002:ac5:c5ad:0:b0:55b:1668:8a76 with SMTP id
 71dfb90a1353d-55b1ebefba4mr1296458e0c.2.1763388188124; 
 Mon, 17 Nov 2025 06:03:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZZTHOOdfEqa9ER8hemxiu6HJtbROxsxg4EQg/rySnc9YSfY+WhVEbc35EghFcBXcleB9lbg==
X-Received: by 2002:ac5:c5ad:0:b0:55b:1668:8a76 with SMTP id
 71dfb90a1353d-55b1ebefba4mr1296341e0c.2.1763388186109; 
 Mon, 17 Nov 2025 06:03:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f961bsm10428680a12.14.2025.11.17.06.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:03:04 -0800 (PST)
Message-ID: <922abf06-c75f-45b6-9653-492a00d414bd@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/20] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-14-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-14-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qSOogUtG3VfYWv3zDBwJiWIzXa5OC1jS
X-Proofpoint-ORIG-GUID: qSOogUtG3VfYWv3zDBwJiWIzXa5OC1jS
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691b2b1d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Vi7wF31NLlcTFLqBoF4A:9
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExOSBTYWx0ZWRfX7kA+X7JFzfJd
 ZBsTi93jrStDE4Y9HPPjVeV6rcdulYon1lYf9YN6nerHq/7JCMmD7ht+N7qZ/Mpu0tYl40knsxK
 9D6TY4MMTbdKN3sAG+Lv+jfFnjxix//R0a2yQ1rxkg4MRHhMY152tsFvCqVQKwG9Mvc41GhJZRL
 oQBOqQFDP2cmN/N9EO8CWQYCx9E/dbnelkgd5dh6/K/SsRUE6q2sUFIR89bxSSXhr/YWgGm7h9h
 O7hg8wPtV89islV6tHAEoUcCcvp1A12JdAcBTArLBNh3eBanfT2ESJ+7a+YNlWorZlTGOZH37pL
 Iz40X7FgUsQ9BS9h8NOBBSC8WPv3Y0sSJFdQGKRJxZWhHHK7cypyXNJ8fXGQKOpNGQcIPjJOe0U
 j29wU2RTP7EOuftVBJ2GxoAH+IAbmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170119
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

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  4 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 20dbdad6e2e8..ef79f4cfb80b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1104,6 +1104,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>  		}
>  	}
>  
> +	if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
> +		a6xx_gpu->aqe_bo = adreno_fw_create_bo(gpu,
> +			adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iova);
> +
> +		if (IS_ERR(a6xx_gpu->aqe_bo)) {
> +			int ret = PTR_ERR(a6xx_gpu->aqe_bo);
> +
> +			a6xx_gpu->aqe_bo = NULL;
> +			DRM_DEV_ERROR(&gpu->pdev->dev,
> +				"Could not allocate AQE ucode: %d\n", ret);
> +
> +			return ret;
> +		}
> +
> +		msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");

You need to unpin and _put this in a6xx_destroy()

Konrad
