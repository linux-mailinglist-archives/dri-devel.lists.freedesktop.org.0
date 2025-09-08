Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AA5B49317
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 17:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA89510E554;
	Mon,  8 Sep 2025 15:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPbNWXMh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856BC10E53E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 15:24:42 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888e1r7023525
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 15:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s9XBnFXGBmeYr88ojm2wcO7hWjCnRSWfP1E0HSc5a+g=; b=mPbNWXMhJIB1bhi+
 SKij4Hcmz4JORbUy7bwGxi3KJY/+t4JGgD6HzXlAAEHPTTssApfucuAqDPJwi2II
 N1rDHu8CzFGOQqHKI6eF4dbDNiQT25jWJEIEwKqWU0TirDKbYSWANZs/2T2BCvI0
 Kg9uRJgYeyk7i13NetjTPIAatSDzc22wyNHmZImgB7Df/YvYbohcidA44G5As0KV
 m91nklRxVxSdeWzUPK0cZYAa+kOMqufPNUqhctvDtrhYnLYc4ZHCro/s7IiSFZ5y
 Vs500sioapGS9OTfo5KdQbqtaa5tBH3KZRx8mnqmKHuipfw9ZdpkZ4Pv8UrerKC8
 IHPvFg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8d1df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 15:24:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-720802c209dso6077536d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757345081; x=1757949881;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9XBnFXGBmeYr88ojm2wcO7hWjCnRSWfP1E0HSc5a+g=;
 b=qlpVzZsQNogT4jT0GKws2EUXwMU9hvw9ztBrtwibQAy7Y/hHRYAhPbTLciEr0FKUJT
 jBMZwv2HQRxUxA4i4Lgq/NZjq0t8QRQvBbdp9ssp4EeI7YLapmbKAwNFviDhE4GZeYOe
 4sNIAKSX7VZXupsqhGiVp4kdtpzmBUhqZcsuX4G8CMIdthtOz4Q7flhaWqdwoAIvqpH5
 4PIWSD1VitSkif61q2m+HaeMdGD33yWplt7UV1VvzLH34viaFkBhIU7uCtnkcbgF7Mn5
 Oybx0lwS01ZmF8odb4MnmotdL22f45xCXzbs0zUy13kWmcTrlZVnLA2Abx8EMaAteOov
 eQhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT7AJUxqUHjt4qlSMRR9GcowAg5/NVq0DomR5Lt4/KwVzlBL/ZFQDrsd2Jg6Z1dOU9uSIDKf8SWCI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4P1qcLMYDM6qNb02vgQdm5vduA3fMrDoL8SWj9mbs6OiYEBIw
 ow5QRFup0wIXu8J7yFaTKmB6Ri1wAd3fIQt9P3vvuIlgGiGEHuwZDFajI605Zz4+iEgQP8Rdv/x
 Wc/EiZioiRm+Pk7AMthGUxzFAHMutG76Yeb286O1Q8uZGR7L9IgfpbBXCrKyWX3URMqYC/Ho=
X-Gm-Gg: ASbGncsid0BnGdKsEKi+CWGw6ZwyeVA7GxOeykJN4nrmg9ALN+mS55aC9erChLaDQja
 bwfkMduz8ycKwOZ0+t8B18WCQfHF7YtNm1luFiX61Vaw36JVG0GJcVQgBkXBhrk6m2V/0+s6hUT
 mckYoGXJP8KBlQx8DSQkPtqvzZQsGEPka2UkszgvZ0s2GspZyPMlHmcagXcYo2HsSUtU6IkrbA/
 lCgoT6hCLdByhF6nr5oa79h2PBg79YlVGTMe8fA6/XpTt3OBy7KbG8yAAm7gV0DDDcDA0kChQV+
 r9cxqmkOEL7nUPnrxrlSfsc5X7yaMfH6fuXBEXxEO1vFNHE5hM47wzLbhG0P6bouCyREuC4x9nD
 sRyrvxMfHeyWqUHKUdri7uA==
X-Received: by 2002:ad4:5c62:0:b0:72a:df4a:e3 with SMTP id
 6a1803df08f44-73946f70409mr55645196d6.8.1757345080639; 
 Mon, 08 Sep 2025 08:24:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/dM+YUVzCoKCgc+8cdXvnS5qCmMcy7DhBINwLAE11WFETAeMMaRl0ZDxjjD0D4fmvZpBH8A==
X-Received: by 2002:ad4:5c62:0:b0:72a:df4a:e3 with SMTP id
 6a1803df08f44-73946f70409mr55644876d6.8.1757345080079; 
 Mon, 08 Sep 2025 08:24:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62778a094a0sm3537550a12.31.2025.09.08.08.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 08:24:39 -0700 (PDT)
Message-ID: <8cf65d78-2790-4467-a9b3-372af53c1374@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:24:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX3hq3hN51XYsv
 P+eVe/Dx1S+AlGuu+4j5I7KgK2C2WAS1TCajBLl7adU9N2KfkwRdhzDXlm1iocyolCSj0FpRKpD
 Ubcq0/f408970yBN+jvVPo0XtjJKeCNpeoPkcMjDzPyNDYDF5AWIPrZTvJTbjXsj2FDkPqHjCCN
 MX6byzV9aeLy+2ZTLAKwgB6Wn/FBLmTU+f8DM3/uWSuLyaHdbaKgSer9GnB955R3/UwggvZtuH6
 exy0giMHyzotSurn1Rt8trS7fY8Y4zqc89+UOtBuHdm8KYIPbdFnfosYlXRaxaIqGgBt72RqyFU
 /QCoUCayb2SLpMZTgnq6t7qEA8TYZ+R4PH6j5gbvey/G02NJAHM1+679teeDqFtTCbUBC9H9DUs
 OhafaTeH
X-Proofpoint-ORIG-GUID: Zg-4T3niCvXdK-Ss8P6jL6HXALoKHaEB
X-Proofpoint-GUID: Zg-4T3niCvXdK-Ss8P6jL6HXALoKHaEB
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bef539 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=l1a4ANfPRBzC3aqxuR8A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On 9/8/25 10:27 AM, Akhil P Oommen wrote:
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> @@ -1432,12 +1495,14 @@ static const struct adreno_info a7xx_gpus[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>  			  ADRENO_QUIRK_HAS_HW_APRIV |
> -			  ADRENO_QUIRK_PREEMPTION,
> +			  ADRENO_QUIRK_PREEMPTION |
> +			  ADRENO_QUIRK_IFPC,
>  		.init = a6xx_gpu_init,
>  		.a6xx = &(const struct a6xx_info) {
>  			.hwcg = a740_hwcg,
>  			.protect = &a730_protect,
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.ifpc_reglist = &a750_ifpc_reglist,
>  			.gmu_chipid = 0x7050001,
>  			.gmu_cgc_mode = 0x00020202,
>  		},
> @@ -1466,6 +1531,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		.a6xx = &(const struct a6xx_info) {
>  			.protect = &a730_protect,
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.ifpc_reglist = &a750_ifpc_reglist,

The latter one should be part of the last patch

Konrad
