Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B017EA574EB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 23:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEBF10E0C8;
	Fri,  7 Mar 2025 22:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lGGTuGf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398DB10E0C8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 22:30:54 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527BNGL5013753
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Mar 2025 22:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ak5fxQibEzWrpDH5Ilc3caDZL5F6Fyf98J8EyekNGds=; b=lGGTuGf1QBsFhqug
 y+AEq/fVLBCpxKJm3ESO4Rvq2CZtwXrkJuhtDQdP0pG5sS8ajLzMcRwILll9t9yg
 YoSWcjftY1G5rPqvIyCFWFVmHWwAq2GQXewt+gwjSrtKe03ehTw7LGxnw+YOzhV5
 DpDYXs4DaTqJH8EJPqbzUvsTWsNVxgt2uy+L2REzy9LZhdYN5W+o/42CcKxuRBX/
 1CIMD98qNhDLmvwELoICplAHgIIc8XEGTrUkBPPD/yyrynfAw2jIKwoaUd0b9AP7
 ZaelTsOEIe8u8wG9VI60tKaeb+cqTJktAZDh5E7GbF1CegKbFe7cbhvr5iLmovMO
 KsRB6g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 457jvduab9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 22:30:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8ff8c9dcfso4122346d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 14:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741386647; x=1741991447;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ak5fxQibEzWrpDH5Ilc3caDZL5F6Fyf98J8EyekNGds=;
 b=gagMh7vPKKibNKXJP4egRxfjS/nsQXp22jm4VgHcdZhRPiAFgK2swRvffGM7DQb5Pk
 dOUyFDxOLheJKcZeZOtiW114aOqeIlF1fL/c6drmSPJMkaF9eCmpurUW+Du6asEs0c8F
 lzM0MvIjZZT+dwS14tiTDAObJ9LZI/E2zGbmn6xn/uN5QI039NhUdOV04jl1pq7vFt54
 j4ojlohCWtE3/O4o3EcqYfeY0oGJ//baqs28ilFEkkB6J7/y85Vt7ztac3vpgVxbYcbG
 CJhPWNpmg+xe9IceQaYAaQ/apV6lRoybWKIcAgiWP1EW4998ITV+po9OWim2YVzito7j
 gNpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFVeNRyRKMSajnEJTetZ2ghm+AWSyh0X8P23zrp9J7OWj5vJb0JPsAB8LgpHvpYKh75XOUGVErJdY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs8+F69IwZbruTqrrqy5ddHv3ZVOvTmKH/vq4kt3TxeX80uJyO
 F7g8sz9V2sYj7yukz36k7af007wr25xC2huZEy9xmxbB1l8QDMn7CzcvIJ35t6bPO8WQwk9jaeB
 f6ob8hwVYaTXQBH95ONNGkIjY38u2Az3QOCaXFhHsQM7M1V/t0+qEIxf+lTItzhyR8gU=
X-Gm-Gg: ASbGnctgWTAAWIboDK8wqMq1pLAQgwzJwXXm+qhcDVdnYgd5I20A4de6/7x8/p7TQYB
 XTVtSMZmtwOTmwZXlauES5vaqGG/EfCDHASbqkdzeO/4StN3dliL+6LfOcRYTt1QrOs/Qw4PmQo
 /7c/8t2+J+38fW+u7ewTK9bfaFcEx4WtsZ7gUjit7T4XOmpqTD9rG1yRm+Ci9IiMIM/EuQ8IBQr
 lRInxSp5hD55PfNffLyGE+yuHdIKoYn9XOmh8CfoBEmCvcANHHN3RJLgAfEUez2Gx6FU2NreUqk
 6jG8UY8mQuU9zRENdG6YDja6MLkoO/VcxmPXJkG+h/Q3exaxA+eLiV/5IOQl9gVEdXsGQg==
X-Received: by 2002:a05:6214:ac1:b0:6e8:f645:2639 with SMTP id
 6a1803df08f44-6e908cd150fmr4825076d6.5.1741386647143; 
 Fri, 07 Mar 2025 14:30:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiC4koxcJVdaUrklQtVOopVLiy0hknFp7oOAgVhzdT3gbIZwIK648n2T72jt6jEmVlQvFqKQ==
X-Received: by 2002:a05:6214:ac1:b0:6e8:f645:2639 with SMTP id
 6a1803df08f44-6e908cd150fmr4824846d6.5.1741386646742; 
 Fri, 07 Mar 2025 14:30:46 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c74a6af7sm3083132a12.33.2025.03.07.14.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 14:30:46 -0800 (PST)
Message-ID: <d0d6feb9-e89d-49c3-8569-91591eae6161@oss.qualcomm.com>
Date: Fri, 7 Mar 2025 23:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] dt-bindings: power: qcom,kpss-acc-v2: Add MSM8916
 compatible
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <rfoss@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>
 <Z8rTW3fQObiZ7del@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z8rTW3fQObiZ7del@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W8XCVQWk c=1 sm=1 tr=0 ts=67cb7398 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=2aLQLXHzPMxx44zPxJMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KYK36B0kfvthJZTcde3dC2C6s4v3Q1Xn
X-Proofpoint-ORIG-GUID: KYK36B0kfvthJZTcde3dC2C6s4v3Q1Xn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503070170
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

On 7.03.2025 12:07 PM, Stephan Gerhold wrote:
> On Thu, Mar 06, 2025 at 07:11:15PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> MSM8916 seems to reuse the same hardware as MSM8974 and friends (for
>> whom this binding document was created). Add a new compatible for it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
>> index 202a5d51ee88c7190805efe8f1bf493bdb69ec45..27dae49163fa0790ceb6fda8a5c674f739d4a41a 100644
>> --- a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
>> +++ b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
>> @@ -18,7 +18,9 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    const: qcom,kpss-acc-v2
>> +    enum:
>> +      - qcom,msm8916-kpss-acc
> 
> Hm, MSM8916 doesn't have a *K*PSS (Krait Processor SubSystem), it has an
> *A*PSS (ARM Cortex – A53 SubSystem, or Application Processor SubSystem).

You would think that, but actually it's still called KPSS internally..

> 
> I think this should be either qcom,msm8916-apss-acc, or you just keep
> the qcom,msm8916-acc we already use. I'm guessing ACC stands for
> "Application Clock Controller", so it would be unique enough already.
> 
> There is actually a patch from Rayyan already with a R-b from Krzysztof.
> Maybe you, or whoever is responsible, can pick it up?
> 
> https://lore.kernel.org/linux-arm-msm/20240710155226.130086-1-rayyan.ansari@linaro.org/

I'm not opposed to this either

Looks like Sebastian Reichel and/or Ulf pick up power dt-bindings patches

Konrad
