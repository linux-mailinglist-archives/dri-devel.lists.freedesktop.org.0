Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA2CB41EAF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772B810E202;
	Wed,  3 Sep 2025 12:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeKZUD+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BC710E078
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 12:18:15 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BFIXH023837
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 12:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AutDsvD16EOr0OTgbsZtdjV+hXDkbazkLSfLhhee5as=; b=WeKZUD+tSWL6z40p
 46t9ccDzdqNz9IhWmGqyqH5aDLYGYQJK+DPJ48xUKg32UdsD2jGpejoet7Uk2+gO
 ETQXNDwF2wohwDfUVpr8bqrlIga0Mzi9jSsdrVd5+w0jELoajzvf+WBwH5ryFxVT
 ZAulzIWcPAtqxA04EEEEavRIfla0Dc6VWQRH/iS3lLKm0McyXimvMwNvxH5YcSiW
 4kfq0vPZA3oT2AQA5BoqPbznZm0EC+QHym7j9Z6BxPlh6fJ02Jv3OdedoZPdp9es
 PKpP30WUABusKrKe9ilMVbWz9sixNw9MGVLNkikYqE6ZAPsvd7tPdoVQzp2NcGs5
 PSA+6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fkfvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 12:18:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b32dfb5c6fso15574181cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 05:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756901894; x=1757506694;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AutDsvD16EOr0OTgbsZtdjV+hXDkbazkLSfLhhee5as=;
 b=Q2Zp8gxP96dZYZBymvJ7XmZScd+u5BwZDqJMAxzA6s65+Dt0sVJnaoJl0F2XGfSucq
 Z+JQwmRRsNHRAI5S7ckfW/uY97+IsUT6VpTQLPQGwIvpgOa4kX7Y1KnzZlhrpWU+SgA2
 TB5CVU4NnNYeKH1kpgdOW3KzRKyH5XsrZJ2IGRUbz7tsTucDfFQKx4Jxt7QK0YXprjlf
 XslvpMSVvSf9ToKrBVfvRwo4y92bS5trglwwMAjHfVudpR47BYAqxQvJqxj2lWc7ZfSd
 rDJC/gJPKEw8vAemJly6zpfaeJnenuY6nIdtLdnivwBJv7z6u9FMKEQ9rkHPpBkR0jxT
 QDMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEHP24elJV0hweFMz2X2lYBR5ve6Y9Y8/HzEbrg2XWzujqOPdeFvy0B9Rdtbb7c8DxnfF7DVjUjZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmgN1lBtJ9Di5ogsMo4FivU9KQabnE9fz3N0uCMjDefvB5XtNU
 mHCITeUcdt62yatEyyg5BXsVH/MCsdRCX+oIp948rDzYM7P4bjk8ECCbvr5SUw1mOywDsZ/CwkJ
 UC5BLS6CtgPAnLRPtRAszQmQOQ2+3oJ1+wH//BVeZisIvixELM8cQCceeDT5aLv7J7NM6taE=
X-Gm-Gg: ASbGnctvI6A8gckz/GEDeqLzmNsnFMjJ+53v2MeCTCZJuL2ETW9QhDZABlPvjqGVa3j
 CQ+FT7qkqrn49KPece77KQ2B4GRwfA8jtc7e38rlPZW1ejsKQynCtbcKgd5igNv/tLc0LrAQ6T/
 OOmRUJwpZGmZk77bq2xK/5a7i6CRSLN6dAj0e3QpsbVElQTH3cUElp3H033p96MbvkEY+0esBhp
 /1Vv5RaE4vlSEue/GfDpZfxpVTDE59+t06HRspa5Zx5yyFeTeJqxYmRytHB5fgxkpDPsg9Pnjkg
 w0NacfMLQEgKxP0T1NsLAuCdsQcRXeVBaPcfNZuGrjHVneOltcl1MZrzUVPURO2edMbUGAN2Wba
 xOvsUoX8pgLLOMVePFECfiQ==
X-Received: by 2002:a05:622a:1789:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b313e65205mr133752581cf.6.1756901893587; 
 Wed, 03 Sep 2025 05:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRf8S2c7HLcbCmImimNW5RYrayUocv/8HOkBFVTA7YGJOz+PpskH2Zk0DqGoAc387ucyJKuA==
X-Received: by 2002:a05:622a:1789:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b313e65205mr133752031cf.6.1756901892843; 
 Wed, 03 Sep 2025 05:18:12 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b041f6fb232sm882398566b.87.2025.09.03.05.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:18:12 -0700 (PDT)
Message-ID: <4ac0ff3d-38db-44cc-9e36-44f9e819e96d@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 14:18:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: lemans: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-4-97d26bb2144e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-4-97d26bb2144e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX8XsXJ1EEfvqS
 nwnqtdSBeAu5o/D68fUNq+EoVPS6pI+XUiqF0nJ/CxPjYBWGu+t0JcSo4rE0V5WXG/xb8pqH4Jp
 TA/rRo34rcXJbB9HBuIradwKUxlW5nXrx1PhG2/fJ6/Afws3kZ2A2i3bCpcPuhMBf618IRhmyBS
 k5xh4Ogd+k2Y7RhazrcJ+ZIA1jWIjlzTmsFZbDvrkU2hIyxpVRWCF+1kIFuFZJ7kZIrxWm4/TVR
 o0D7JSA9KQpAKjdQ0qlDzs1GNOvDYNHO96xPt1vhH9UFdSaS8o/X/ezNfU21Nw5N2OkMCkzDWMF
 MvE5YtBzXbh0NrqKi7INAduNoVhu3itQjujox+XQ3SBSBv+xMaPZ1VY5BQjxTdsrwgkQIvrRkTN
 4bC1OiC7
X-Proofpoint-ORIG-GUID: 4N_V3jr0nN5kp34lj1oThnH9D8s3MO21
X-Proofpoint-GUID: 4N_V3jr0nN5kp34lj1oThnH9D8s3MO21
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b83207 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=R3Qjy7WId1ItUu-RO-4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

On 8/21/25 8:55 PM, Akhil P Oommen wrote:
> From: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 105°C.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 67 +++++++++++++++++++++++++++++-------
>  1 file changed, 55 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 8eac8d4719db9230105ad93ac22287850b6b007c..b5d4d07b2fd9c14a6f1cc462c695e864394cade2 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -20,6 +20,7 @@
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -6816,13 +6817,20 @@ trip-point1 {
>  			};
>  		};
>  
> -		gpuss-0-thermal {
> +		gpuss0_thermal: gpuss-0-thermal {

You don't need labels for the thermal zones, just the trip points below

Konrad

