Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36F4ADA761
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 07:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934D010E284;
	Mon, 16 Jun 2025 05:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NsrY6JIM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E60E10E284;
 Mon, 16 Jun 2025 05:07:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNH7lU003033;
 Mon, 16 Jun 2025 05:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LG1DruV5us004oEXjXeEWd09Q+FV9MdQYIAAnTRm6ao=; b=NsrY6JIMbu523Umh
 ZfT7NUFJ5xZtJRD4p2pw3WYI/YqptavI+g0VEdarYY3Q9Ahiyx6+H4mf3V5R5PFK
 //pVxDbkeuBeAvsTeKWnqotFjDN5K5iogcqHyKHFfDWDIv2TVYy2cU9c0XY2KXYm
 hfQZI5fzHOXzVAZu+1dr4EO8wgaX99H1v6M/bcub24oF/oSndBYuZWMEUpfC/5ra
 TJdZyGQJUZVQgsa6KDMY8+Sakr8fHWNvRHBGzaEoaCYSClWKsvJvq5YGACBQlyth
 Ena5lhgbpDJGtq63YntEoK5JcDCOI7rSQYAY+B2q5SWirARArhNRM9SrnZ77NWWT
 kaZecA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crk2qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 05:07:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55G57KGj003709
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 05:07:20 GMT
Received: from [10.216.9.13] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 15 Jun
 2025 22:07:13 -0700
Message-ID: <4143e209-7701-44d2-b9f0-dbe646542376@quicinc.com>
Date: Mon, 16 Jun 2025 10:37:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Support for Adreno X1-45 GPU
To: <rob.clark@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 "Dmitry Baryshkov" <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <CACSVV01A8aqyoM4KYuUYVXTHnM1egn5-4UxqPrQVVjuvxxbC6g@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <CACSVV01A8aqyoM4KYuUYVXTHnM1egn5-4UxqPrQVVjuvxxbC6g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: p20DTFGx5sjMNBbGJteEwPmMiXWb8CjM
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=684fa689 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aVaGKPbtQoTzMs4lowsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: p20DTFGx5sjMNBbGJteEwPmMiXWb8CjM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMiBTYWx0ZWRfX8Bh76SsUtogs
 mfGW/AwkRHGK+2P8cfAgzoD0TMtKJfz2AlGZO7oeySnyM+ymbhQFWQWpDoMUJG5c0VNBj4dF4FJ
 qYkmh4znPXd/uIuKNYv117/4oLVnmxoemloFlNas/Sbv/B5yT20dD8SMTxmoSw+VW96IVwewU4l
 ofGuWwK2gXGdzwo8rGq80VX8qYMMRlp99R2PW4/o41QYOyTV3Tqxr4hOAypKJjlpId8vrVW71ue
 yJ7wUgX3ThYXMGrxP4Gp7bkmvEtQUI5ITYT0tH9+2ES+WcN0nyuuaDoxtFEVMyYHZGj0QVOT0HT
 GW6Htbhvy/0MwZWaEm3GM1I11DuDHEbCpb1HekTpOCQdTNgUJ8WNMi9IQ+UapzTRX8sJfz2a0Ys
 h5qqfhAk1T9ln0ZTfg4G69JrUTmURnqu4JU0Enw2hO9Snkkgp4ovVyCJmYUsXAqBqxvVEQst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=949 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160032
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

On 6/8/2025 8:51 PM, Rob Clark wrote:
> On Sat, Jun 7, 2025 at 7:15 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
>> version). X1-45 is a smaller version of X1-85 with lower core count and
>> smaller memories. From UMD perspective, this is similar to "FD735"
>> present in Mesa.
>>
>> Tested Glmark & Vkmark on Debian Gnome desktop.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> fyi, mesa part: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35404

fyi, gpu firmwares: https://lore.kernel.org/linux-firmware/e036373e-0356-4fa1-b39b-78eaf02179d6@oss.qualcomm.com/T/#u

-Akhil

> 
> BR,
> -R
> 
>> ---
>> Akhil P Oommen (3):
>>       arm64: defconfig: Enable X1P42100_GPUCC driver
>>       drm/msm/adreno: Add Adreno X1-45 support
>>       arm64: dts: qcom: Add GPU support to X1P42100 SoC
>>
>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>>  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>>  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
>>  arch/arm64/configs/defconfig              |   1 +
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  38 ++++++++++
>>  5 files changed, 170 insertions(+), 1 deletion(-)
>> ---
>> base-commit: b3bded85d838336326ce78e394e7818445e11f20
>> change-id: 20250603-x1p-adreno-219da2fd4ca4
>>
>> Best regards,
>> --
>> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>

