Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116D0BA376B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 13:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5846A10EA2D;
	Fri, 26 Sep 2025 11:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VuRMzXKU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE95E10EA39
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 11:19:39 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8viEx030695
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 11:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A5iw9YhdKL6U7cNZ5d6DnDVFCM8BMpzQyf8d10H9FDs=; b=VuRMzXKU+gnS18kS
 t5LtFfQUglj8gilOALItOfxuzM48Em5gZ1ZofU7Vvw0ZbxAqkRCovwih9HX8TQKu
 FaTxdCQ/LW87dRqmFEaweEukAdTFhSLOJ91kdKfNLVpGzcLYJg2NOF7XoeFKdS+O
 LDnPvlanG8tL1uXevx1Kx1uCB2+1adPFhvoxdl6m8PuluPpgKAz8Kh22+AZJcH9L
 1rRELJOCVp+TKbhxL6vVYPfPFORzEDnfOY/iL+2idFT5/+w4t7hn+8vrI/3J2qLo
 MNBycUZe9CkjCPw0pOiEqB610w3plVZ0jcext/idrT25EVFsgg0nYB+WaAPxbCIS
 t7uHYA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u2m5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 11:19:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d8c35f814eso3894801cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 04:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758885578; x=1759490378;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A5iw9YhdKL6U7cNZ5d6DnDVFCM8BMpzQyf8d10H9FDs=;
 b=amE+Ni3JxAmPV1/3YeNufd772Kue/93MbZLjIsEXDx9OfnOhoUTf7tSbOyPVCFhvg7
 TWYn95o+o8tLflyXTuR10K7ljGVPZuNV6dN8ralxQH5vXDjBwj7AOWRenZ3R/CTEjyxs
 zm1WWeIIRzNfzIZ4/OZ8BgqpuX7pwjqCuLMW7KtX1tPaLQtbinATt7DrAcoz1E9RhycN
 nxhb0izK28BjRPrqxZjmnv5BXhMtrfAhke6OwQE/JI1qKgObkk6Y7tCs82PT+6A/LjEi
 a6xorpk3wVwGyyZeilnCUhiQCYDKW4DsUSyO9x5vtCnnKYGbkoKxRtOkkBNxJOA05jao
 KzYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEUobGhUp9vQfVDHej5t/D1HdUlFgIx1sXaBPJenaegL8MEWKcl2PwL9uJQs/jNDd/GSVTbje+tSI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx69l8GBkdH/ZWQ0oXbDzxw0IEwT6OTVL0cVfyw9OlqZtMFwO2c
 xkFglA0ObkvsCWdgc4hEyOTJF5fdeXdX7pvYTtc+wTmmiECL59FnPA/KyoiTvXqUVe2rr7ykVM9
 Hpwx8FSysvvgDDsqFC5VV5L1592DGgWfsFoAiiUslaKSqvODNzOhgZBEODbSRLZKCyAs9CXI=
X-Gm-Gg: ASbGnct48Yz9GFpSr+BUiX6XIOtF59c/H5LyvGYHswbZ/dCWboBhgY8t5XcoLKDtiZr
 FYDafqKLcY83NgiSGM8+ea2oC4B711diGD7794Lug44jeecEYdLrNSRZbrssbXyAZzi5m9+yTYl
 og2CwKvdPIav1GbohFa0qAviG6yhjelbodj9ijXb4Fabd2G1f7kSYqn6ZUHYHFDahd0boVEf91B
 +ppNhTKxHIbfJGZZVQgbeauWzqm0vadqEgg5TKfdVIH3MAL/aLFHGQZ+lRGu7EwMio7of6hunS0
 WwL+V7/q2/nUdRXi9xfu0YjWqZ4akMVnpYlw0ZhoidjvQ0T7tDoIEyMQPOYmOBf/hrUit596pcU
 MUMuFrvcjtQ+rTdkZx88JZw==
X-Received: by 2002:a05:622a:24a:b0:4d8:7b08:64b1 with SMTP id
 d75a77b69052e-4da488a2d68mr64828221cf.5.1758885577783; 
 Fri, 26 Sep 2025 04:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLrcwSjz3KqiYGa3gmDGxvngYxxkxyuMkovjao2QxnzsDzIGy/cWZ23JNdN4fAp9j20t9gbw==
X-Received: by 2002:a05:622a:24a:b0:4d8:7b08:64b1 with SMTP id
 d75a77b69052e-4da488a2d68mr64827771cf.5.1758885577245; 
 Fri, 26 Sep 2025 04:19:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3544fcde34sm352788666b.73.2025.09.26.04.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 04:19:36 -0700 (PDT)
Message-ID: <7f61ee13-c73f-4b5b-918d-288368ac2cdc@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
 <652595ef-ef79-4c36-9979-b536ca65e1de@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <652595ef-ef79-4c36-9979-b536ca65e1de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vEpgIEpywF5zlHBaEZpWs0l0NeDdtDyv
X-Proofpoint-GUID: vEpgIEpywF5zlHBaEZpWs0l0NeDdtDyv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXxVDx0l240P87
 pvoE1FWXL4HMp9fMIFqxLCj1dKJydrPfgQvoq75NHGNsfn5gVnKuelNh7ScoQhXUTPsvIU86Hy7
 15hvBpUDAlyktvmuHp7Yb7V4EmXHJponhlViDUf4Oo4tCXpvNh2GkYaohaLjl9gA75jR0nSZlMa
 CCwSdLtqA7+k8X1M5y7L6mmYFfN5731PIrwR4matv2Sv9waYFNbMwHA/LfteW8pwtGMhbjyVa/y
 TvVpkh+L91GEIQmUwf27IlsDVftDlbWBBYKeMgUSzC6J1XYot+6RQwCzNneIz0ivkTpd0QkzSba
 G25HcEb9kVMQRHNw3ZaUzcisT+ligmgOYWISu2oM3jIoTAGs6p55GkfaAmB3kwLCA69BkkIbtgl
 alvPWZLqhRZEk1J2eOnjaUnmQOzOfA==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d676ca cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=JnFwQ0sXLtjTzmeIXpcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On 9/26/25 1:18 PM, Konrad Dybcio wrote:
> On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
>> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
>> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
>>
>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index d87d47cc7ec3..f247aad55397 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -133,8 +133,8 @@ struct msm_dp_desc {
>>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>>  	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>>  	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>> -	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>> -	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>> +	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>> +	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> 
> Well, did you see what happens when you try to plug in a display
> to a controller on MDSS0 and MDSS1 at once now?
> 
> (memory corruption)

No, my bad. I misread the code

Konrad
