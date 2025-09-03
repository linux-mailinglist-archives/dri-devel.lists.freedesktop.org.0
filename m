Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CDAB421E1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 15:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BD910E0C9;
	Wed,  3 Sep 2025 13:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7fAWz/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF9A10E88E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 13:36:45 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BFK2I021624
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 13:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lN8gdknZMrOiQok/7MvQU3sHMt/V6D5KvcciwLonHIE=; b=C7fAWz/rbvK32/ph
 nAkHjns/kz0KodePUhe9V5KmdHJ5AEnJnJyqRlkMQpyXEMZ6OS1uP0tb9jcmByBh
 iv4TAlYU1/i3LW8nUal8SkvnEvJK7aqhA4umZZ4DYWdO5/3Kc+fEC0E+sx1pzLwR
 sIGqboGIVun+G4ER13ZhrKdVqZlcuiBEAmbcRPzm1LW8bJ2pOAxmTq910/s1TnOx
 Rqmdv3ezfaWdGo2bHT1yPXUm62Qfbo3KbJ1AUFA/enB/5xmPOJje+njoYDPF3W+D
 D6dCkoOwRbBB2GWqs/KbMQFGvodjMJnFxcAjycmVk72zQB0N4JXjyJb0TXI1yAKa
 bz6OMw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk93n3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 13:36:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b2967fd196so19706911cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 06:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756906603; x=1757511403;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lN8gdknZMrOiQok/7MvQU3sHMt/V6D5KvcciwLonHIE=;
 b=AYtyJre+ZlbpLS7SBI3TFviqFMXaxx8ZXyL3Rzna5CXrYG/pnm74c+6Sw38GIm+Mdy
 +9tBxaO90JF4/L8O08DoMLgIf1R/k3Laeisvv2XXH53ZBtigEeiEE+Yun7VoY09Coa/G
 9/tJ6W1ALK+8A57g/jzubZ70oEgAVfkmmsSAXVFWp/uu/iLBtXW5oKpwr2jm22CoZ6Mn
 IJ+B/Ppwg2vaQkxnJp8N3fvRk66Kqax0kXHn0MXvIZqWuYTN9mxtg4VoUesdbwPh35CR
 bLGswt7zdLuwAtgNKoJcJFjkU3Y67KEpdlCQXRNtAKR0h9o5Wt6jCvxOIvschx7ZtUST
 xneg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo+x8nMEjDU+Xbtjc+SD9TQGUByQsULEaOTswzeGnY4euddikS3rJ4oW5MuB13UyqHEvD4MYPBfPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6c8Dc1coBW6coAKTuSOmhKP+6wFvnbs8olvVL0ZEw/75xr1ne
 ShdRug4sdUEj6idK2GYPysh8drCsQcdep4hhPYPypYrKosBZeCJrqnSvkv6xjPaZlyICCewP4MM
 lu5KtjqTyCUtJ16xjJa/7RYambBCe241uCcIyS5rQcrzqHAYtUf2A0RIGVx0VcgQ46YUmA2w=
X-Gm-Gg: ASbGncvXPPO9D8eQa4kXQ6Zkp7ejJywo5hdg+XHl6hfT3GCYLXSSS1w1e0CpnXgcLpu
 /yfX9MUItGI6oNrYs9BRwImXMsQjMt75rjM5pCAkDBJRoHcmlLqG7HynFMxbBv4F4D3DXQpwkCy
 LYFfqeV2aUX3W3rPs0J68Tq83PvQKVCysjYvn46PYpkZL0daOfZeLGjC14b+vlwu7XPLybH89OX
 IRPhP+Bo33LmxSW6WRw3ML3i/zWIibkwYaWNKI2jKpoYPwtHH/OMlzPPjFoFokfdinbZ2qoFUGj
 e7dYBhnfETunBhx00IPnvqZ28kQKn1weyFi5+2hMdMISYYyLBxZzo5j0Ulm4zRLTQ8XiBLa+/HY
 7jl4GBK6Z4hHUUje60A8i7Q==
X-Received: by 2002:a05:622a:4506:b0:4b3:4590:ab74 with SMTP id
 d75a77b69052e-4b34590ba5bmr55006941cf.13.1756906603108; 
 Wed, 03 Sep 2025 06:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErXOAvUamYTNZwdXsoIgSgCVJyJNUAEhsmG6GIw8r9rMGaKeXaF6CVWYD77CBPNPOt2y9/Dg==
X-Received: by 2002:a05:622a:4506:b0:4b3:4590:ab74 with SMTP id
 d75a77b69052e-4b34590ba5bmr55006561cf.13.1756906602636; 
 Wed, 03 Sep 2025 06:36:42 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0423ed35e4sm805734266b.25.2025.09.03.06.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 06:36:42 -0700 (PDT)
Message-ID: <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 15:36:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
 <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: j35WiAP6vn0fyhtitTdJ85iihUYyRwuM
X-Proofpoint-ORIG-GUID: j35WiAP6vn0fyhtitTdJ85iihUYyRwuM
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b8446c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=azIdKaGB62pXRnNptYYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX6BWd2W37lvHU
 1pNrL+x7QqNRcZV0fysEBr+sYyI/qKs1YDRFd70UmLPlV4iHbY8rKfTBCwKMK6yfj4nzHmM0xJ8
 vzm38RvZd3ykKjj1LY4qaZUucr2mGGvj0tMHxJAQ+ZCO4Q1wH4lmDy68bQpgfL/K5FvHo+ORclI
 RurmsGtHO3HxTtTE3n4zbWJgyzE6R/KwKxaRPEoBU3HfoV286FPwG8b+hvNEdDogLjLiZDXbrQF
 zT4A31Hx3b0V39V3tKIV7In0C2nSO5vtHjllvSRNWwyTurjDqj48B57VEZfoy5DfplalMZZ99oo
 8MKnXymVvInlb7gZNP5RiPHhGJwh6uZBSVAYgQvW6aQ0KdLy0zNOrIgeloRxqIn9vXQHLvwU/4i
 R3HsEKUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042
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

On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
>> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>
>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>>> SKUs have the same GPU fmax, so there is no requirement of
>>> speed bin support.
>>>
>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>>  1 file changed, 116 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>>>  			#mbox-cells = <2>;
>>>  		};
>>>  
>>> +		qfprom: efuse@784000 {
>>> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
>>> +			reg = <0x0 0x00784000 0x0 0x2410>;
>>
>> len = 0x3000
>>
>> [...]
>>
>>> +		gmu: gmu@3d6a000 {
>>> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>
>> This bleeds into GPU_CC, len should be 0x26000
> 
> gpucc is in the middle of GMU, see other platforms.

This is not the case here

Konrad
