Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8E8B54BA3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFB910EC2D;
	Fri, 12 Sep 2025 11:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F094I8Ky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4A410EC2A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:53:59 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fT4A011011
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4BAbR0VkBTtMW5jEdUFfz9c4NlZZZn1XOV6N98HhO2c=; b=F094I8KyfbQuDqu/
 nok0Obhg9UzGh32wFsjO7nnXlM6e85X6uOGWukNleegPBr+QBvYzbR3ovtvzbs3y
 vDOGr8GFsDBhAEYZJBeNAgNr3xLizxvFdYPFeCGM2QKnsdNSHofJnECvzxum7lfT
 XOHVN6qh+sxB0TLFc3O28lHnWRNddr3Yigi0b9A5eY7/WKP1gkcdEHuiaCTsGFkw
 IXwqhGn1s6FOXlJmXdxk0pakwqS5TeUPqv+VUVO8waTeGpXtD9diy2gt/1ooi3JW
 CbgGhI0VkMoxluSvdQJLAlVcCH8sbOX0bvp7AB1EGg7fF8HMCGQ09fqPjJxA+pdF
 jtIZlg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4mbb7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:53:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b4e516e0e2cso340024a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678038; x=1758282838;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4BAbR0VkBTtMW5jEdUFfz9c4NlZZZn1XOV6N98HhO2c=;
 b=AAD+MrSlD80KuYUPv/Cmrb9nu3X/fONjqV9bd7BlN+GYhwaXCC1E/cEvOISzS58Ahs
 LKWIzqWRfwRxnqbZi1+pSLG030yC254eDuKKeeE9FAtiruCpJohVDrzQBF7uZAuizxui
 H5Yp+9qKgguvgEjRtu57ybRmSehKyiu4LkQ7L8kVdaEr7EEcOquJUFI4lPjglXjmBLRa
 +Tz7l/klot1RU2n5kroqQtnHPVx4Z/Psoh2dWLuTYvaWYaB0xoqhzbHcl0iTpsf5YCGi
 hFOWOxOmw1Vd4r4b/Y2ryGMSpSKxxepNKqw/E962k4ozDIE3N4mBtLqZdJ1UnB9mPmOZ
 OYbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1jzg9xnhKTe7B9S9gAZnCTshN9FzP8K7KptUBpQOxfuXH5c+n1j12KhX0/igs0jt6syEvQZLT32o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz64xKHKZJnimrtYGsw4IxIxIEMpNCPzGzrF9sahdpR0ElywOyM
 H8HigjJjx3wthvvgdzGIN6PK+uXm4nzecf/x50RxE/Td0isAgKusj+YZLAKRhekI82KXzVw+Raw
 p5CUXbooxKpZoh1ugzowYBBD0emLy4EIgWSsUlbxo1HZvlM1MFjjQidf6QcQZtQ/8gedMq3M=
X-Gm-Gg: ASbGncsGI8KKV7UFbZqdZCNPWNbfCeLkdT04iHLgIR9S9Oz0V94Xw614evrLnF+y2dn
 V+qu7/km8mYmvFm9WYXCSLMEN3T6zmIsKA+GGFLHrKJmsxc2sZDOWfXLxnEFtE3fDEXFyFsFjR7
 DRpnikJkA+REzQviSXC1EwUcfkOtfzcYu6Y+tPvJGUV8O52irHTRlbqdk8laHqXpe9qkNwnRfbH
 HxEMVwH2ZvONvJqYjEmUI4yIvg9gtcYvf9AhPX1ly3VzjMP3/1IJAHJqR1GJUAUiQZAXW/PSzdM
 oWG8zbfrba/XE2F90J8dsKOgpBKenOZPI+F6RwizcjYJOuMaMIjlQ8L8mDP7MnDh6i7RBTMlyod
 ShIPIa2LzJxCmSArEmFnX6bDX2694OA==
X-Received: by 2002:a05:6a00:181e:b0:755:2c5d:482c with SMTP id
 d2e1a72fcca58-776121ec346mr1686411b3a.4.1757678038022; 
 Fri, 12 Sep 2025 04:53:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt3mxQMkv5DuTk0o7+8kWj/nU80uRbbQWBwndCE/G8QbqHBZ/ES9haTMqTr8/TVjovNYCW4w==
X-Received: by 2002:a05:6a00:181e:b0:755:2c5d:482c with SMTP id
 d2e1a72fcca58-776121ec346mr1686395b3a.4.1757678037556; 
 Fri, 12 Sep 2025 04:53:57 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607c473b9sm5342655b3a.93.2025.09.12.04.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 04:53:57 -0700 (PDT)
Message-ID: <d9c55e72-0683-4eb3-a22f-015a799e2c79@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:53:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/dp: Add DisplayPort support for SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-2-02b34b7b719d@oss.qualcomm.com>
 <budeqnh65mcmtc5rscbgvy2nz3woptxnht6sddzg7jhttsnx5f@bwf3kyvbrfaj>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <budeqnh65mcmtc5rscbgvy2nz3woptxnht6sddzg7jhttsnx5f@bwf3kyvbrfaj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX50iwcX6VqhYc
 QYoF2ZSpk4UdPBPC3ogF65GZ4Yq1yztPsu5SxmKiUjBxf4mYVWnc/W+l6rMsc9pHoKgwmxJJkjD
 8TRP6hcSFmm2OtLyf2e3sVf/BoMfaaVObDFHkkso56lO2H5EHJJo0TY+z39aWuJuDyWgDSJqUOJ
 KgXsFeZObxGTEcA5RTSdUcLoKGTauckySkOo2NYqQ31PbD+582PMo5A4Y22ctxU2LdSt5ZzaiCU
 4vQ1n3+I02Pm3+jusDFQtrqFn/UU0dfkDq9bXxADnYqJ8TzF/GZBFRIy5ZaFVH4fv2xyM8J8qQn
 shDm1y9TdOORG72gCLmlPvAVDimfXyPIOvRK3CKu8Hyd3Hs9gl4h8rEh8p0f0HduvKxCTJmKwpw
 SdLjns5o
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c409d6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NvjRSh8cQ8dmTSQMK6gA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: hDdPVYbSpPr6MUrJotgJsbVgonwZv_2Q
X-Proofpoint-ORIG-GUID: hDdPVYbSpPr6MUrJotgJsbVgonwZv_2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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


On 9/12/2025 7:47 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 07:39:17PM +0800, Xiangxu Yin wrote:
>> Add support for SM6150 DisplayPort controller, which shares base offset
>> and configuration with SC7180. While SM6150 lacks some SC7180 features
>> (e.g. HBR3, MST), current msm_dp_desc_sc7180 data is sufficient. Listing it
> SM6150 supports MST as far as I can see.


Yes, but since msm_dp_desc hasn't been mainlined with MST enabled yet,
I went ahead and submitted it with this commit message.


>> explicitly ensures future compatibility.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
>>  	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
>>  	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
>>  	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
>> +	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
>>  	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
>>  	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
>>  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
>>
>> -- 
>> 2.34.1
>>
