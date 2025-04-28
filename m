Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21515A9FC15
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 23:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13ED10EA6B;
	Mon, 28 Apr 2025 21:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNTaQp8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1802C10EA6B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 21:19:39 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAA2CR019294
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 21:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1p0DQQl3Uv/CeewEIX8WmFJDpqWu+zknhFq+jDxcqzs=; b=eNTaQp8OWPZ8bjaJ
 siO4gZnXx47CjAcBmt71c18UjDCk4ZVh/jMyqSEZUJzIvyn/7fefYAXn/pYrF1bl
 p2KMxaJaRMThp2AKhC59qPuHUKcQGa4trnmhLTtIiY/T6e3EOD5T/a1bIHPuplle
 XPySL3CsCCVI21Q0dsmwg8TjaTRk3d2xk+CDoE2Wmci0cdhAR0yNWZtf8sYTQ4CV
 0RiX4tWV2+LjX2zdXzHlspi9TvxrvSPJkeaddZ5dALUxBNAif1H2ySlaJ0MlfiKW
 LSV5Ro3kfMHAOT55MgOnsnVtbBSI234SnKXf1Ns8JdkigwMqJCWzaxtOFUfhwIHS
 h6fGvQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmjdrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 21:19:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-478f933cb4bso5393161cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 14:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745875177; x=1746479977;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1p0DQQl3Uv/CeewEIX8WmFJDpqWu+zknhFq+jDxcqzs=;
 b=UuRW3RU3U4gsO9NiKPqjK30OChVUBYZ+TUYGcrOhj6edy8Z5IXQFlq1gJ7VAlPotiZ
 WxcrCjXz6DBiKJI7G6NAAllZQ1M6DYaqfxX8PjhQMiGSd0e7vPplSJqKaaXkiqde4tqe
 2+cBgEUEcdkg7voYF+pgNP6Au31j/BlcgH6t/Go1Cszn0zmODvFyvLkUCP+4SlYESV8R
 RnwpBovqnlvaxs47uNOB2VaoyE3pGDgi7Dwfrxi1muK9wlR0xsNYtgvoty5/e7sZcMWX
 XggivGUZEzf3ow3PVmVGv8pM0q5/KtzrAALap0b0yJEl2/JR/uq6/9l6kY8cDCEJlWiw
 S4iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFaFVa1dvffGyIv1ZgMAO3thUjUySivl1Tnr8p/zvbyn4XA8GGk4gigan9XKaOUysrlMJi5VOW/wQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy2f/TTG5qyiLUO3dKDrcJEyvjTOGhqdVxbTwTI8ZsPAYNdp/C
 r5fr04n50KmTRs6pVr8m8dyBpapEas6wtqgo3jxr9SauKXOseYJ3tweImIF/4Fv9+xIT00L+um4
 DPTU+i6LOeSiAaUH7wbMjaPr+fGJ1geptbI6o+LxNCyzLn48HnhlQHfw/eJNgiFSv6U4=
X-Gm-Gg: ASbGncsNXFHwJMg5Tgk8lTKKg2pqBcp3xJ3u9WOOUIocAlO8XQKmWQtU7TD+QjYsZxU
 exfk053SkujymYhwRWDtHTlj13qyYp3Au6myu5uqHnIGfZb7n8USvgqEqbajF28H+Y9tBgrxv9I
 3HrUfmkYG8JwzdSA2EW6Qsdi00HYgy+kRZ0EOQrS3caDJLc83O9DNugFdHQ7okcDYLY8cFzn4do
 RFfnUSeAzQ538dtrSYd9DGgNIPMMBtLm95lK/q1fQXAOSyS2zB2bMPm5zUngX5MaXrXNPfTFhot
 kRTJHwQsC7FcHjLPJ/fmUBLlq6Non36k9tT2DCZUY8henPU7hla/h2EP/Rr5aFu6Zg==
X-Received: by 2002:ac8:5d43:0:b0:47a:e81b:cca6 with SMTP id
 d75a77b69052e-4801e5ef61bmr86239841cf.10.1745875177206; 
 Mon, 28 Apr 2025 14:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHGM4Gsyyf3DoqVCxTr5c/Fx29SX0hifWAwRSJIcxlPqb02dtB8cwcCNR+5BkrZ9k/UWtLcg==
X-Received: by 2002:ac8:5d43:0:b0:47a:e81b:cca6 with SMTP id
 d75a77b69052e-4801e5ef61bmr86239641cf.10.1745875176771; 
 Mon, 28 Apr 2025 14:19:36 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e41c431sm693197766b.18.2025.04.28.14.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 14:19:36 -0700 (PDT)
Message-ID: <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
 <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
 <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bnN0pjPSx6955WX2rYR1xvxIjRTT4k5s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3MSBTYWx0ZWRfX4RV4qLLT6Zrr
 yroVvpi7eyKLPKFtnETmXzq+aBjaALKqynfVqCpDrCgeapftIxx6e+am+2AQo183NMyJ4U172dA
 P6eOrhlg/mEukNcWWcmcLDSIFOlpDvBxIqJohcnS1NKCbIl142/JRNYmXcXr4Idg+TlPrztIxvK
 yRMCBGp+iqI6rPYwI4ZFyHgmuMm/fzHmjmws6PnW/PhT6HSI0QGhDyISKIASCJUFdKNn/ljcg4q
 P8XXwalNqgE9PfhYalBUSG8PiApxVhZS463HT+ZmMdHK2ELQiWSOHAmqshXQ17G9sprz+VnJoqF
 /i1orGAj4zYW17ZJKsUEBpEqKYbWpvnl3hJQOqhEunN1OHgMDu5cgjKG4Ek/if36CRkyFMh40GT
 QxA4jHNRBLCd4fZyWOyaZx6iGC7oz+xIONiXHKDWKnyfFGjmyNfB2AFAzaKVq8cX7BGylBYH
X-Proofpoint-GUID: bnN0pjPSx6955WX2rYR1xvxIjRTT4k5s
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=680ff0e9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=dalwKpVopYczjXflRRgA:9
 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=738 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280171
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

On 4/28/25 12:44 PM, Akhil P Oommen wrote:
> On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
>> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add gpu and gmu nodes for qcs8300 chipset.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +		gmu: gmu@3d6a000 {
>>> +			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>
>> size = 0x26000 so that it doesn't leak into GPU_CC
> 
> We dump GPUCC regs into snapshot!

Right, that's bad.. the dt heuristics are such that each region
is mapped by a single device that it belongs to, with some rare
exceptions..

Instead, the moderately dirty way would be to expose gpucc as
syscon & pass it to the GPU device, or the clean way would be
to implement an API within the clock framework that would dump
the relevant registers

Konrad
