Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784E7CA32B9
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 11:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC4210E909;
	Thu,  4 Dec 2025 10:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQdRIHla";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOVR8gNu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2688310E909
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 10:13:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4A0OCB1054372
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 10:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gFmCNQvfDV8zMZ4aEakyNLHUB0LSRMaEnMZW4uuVM5M=; b=gQdRIHla6fzrdg7o
 wSkQSYiYEHhxHlwoskxpUVNiXokd5YhFxP6L/oFYRcBRHliyJ8ZWdH+lBPLVrRbG
 L8cyZUfbHJJvTcqRoooQrOyVuD1YP5OgPGqrBH8Ua1UcWarobiY5IoVxzmJ80Luv
 PDXI631FHtfiTr+/Sd5RUWzsu7P59immZ4F62EnaWJv9Aj9IaZuTuaZTKmOwA6PS
 sU64lFkQOkfV81Dx+QSkIPXL769hkxL0Jomr7PbfnDiRO+QkgoBoM7rjlv6jj+k0
 Lq2fYhJRNgQR2SMEbtqBMBdOMlMQBMYxYR1boDwkJCwDTUjFn15EIZSuIGvGH3OB
 4BvhiQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmdbpmn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 10:13:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-34188ba5990so1753121a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 02:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764843223; x=1765448023;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gFmCNQvfDV8zMZ4aEakyNLHUB0LSRMaEnMZW4uuVM5M=;
 b=SOVR8gNustDug75OYjkY7o3v9AHY2Cm/KRz06bEIYT+nW/2VcsDLIdYt7YxE+Zdq0p
 LxYg2Tc7X4AO+ASj9DVNmpi9JEEmGy6vV1fB7bxcbyT1bZEhOEG7DZK3fWOqXVzETAIf
 LWVNVKfVISSXiQKM3P5ZR0sWtGwxZ11/0d/cT6LDoDLhzQrneSPj+K3nLr1h4UioS5BL
 QrPI3nGGGKYOinxtTIMl9O424H4KgqtRxkB7H5hbMlnlHmNhozFJQyt6mztTncghpWNM
 mzV5+lzhRtli1QcucxisumVoHK5ik1XeTaNGDdRzDzEp3BXGXS53cMmGUCw0GsDbTtSL
 KokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764843223; x=1765448023;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gFmCNQvfDV8zMZ4aEakyNLHUB0LSRMaEnMZW4uuVM5M=;
 b=s4HTg/pP4mzPSXLKoBIx2uJKpK5CZNbgb3tp1Rx+3ItfmlmDvxIRy+Fm4JnYbI2WEl
 OCCpOyvrd3V2TP1MKDusbtDdwFFBzFKcPEVgEFoIY0IQy3GqOSZ6vbcxD96GSIpbGCBh
 ArmViXls0KYJT2ZqvIZD0LR0l++BsNi098NI7ie/IgOWqfMu2coUTzVxWW94vy9vo1d/
 kU0RkeMtMVlG3HCtvOuss5+ssDTSPqcAo/RBcgHW5euXVh2jNMyU2IvVdI53pnLEPLqI
 e6hV+OQoXrY3vPmzry+ufzqphfXnk+xTBTnJQwDsyuuOK2RB7XLbfBQxFHX/F34yjBEd
 2TDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4XknrEUcwG+IaDRZ7wZ3BO0AveTQEGU6pzj2MOyv7FSdskue7RswctnriX9LRO1ReEhPh/B62aVg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz71kLffnQqryltRKnw+8hQJOnTLYV5sb51W2L+Mc46d23/5vVX
 yc4KrOem93k0H5j8pj0MJcbBrmKviyVZ4MrLZG+BEw43c6N7D3WduvGdXRfQsNOu/db3RhTkq6U
 ROYtgD0EgggwcpIi4Bv1gC3Dz0Qfp4WdCBysKICcNzd0LF+cYW4nvfugvgDKIxhlEzMQOehJEuG
 Pe7Vw=
X-Gm-Gg: ASbGncu1cAAkJk6matjkqKaTmRNH4/FCbSYkI8lykasgb5d9DuaMinCGWHxWspyOBsb
 IJZJYJp02kpuDz+pbyUAYhsHQgKSG+aFIGxN/BoWYXwzibDeHZnL39Lo43hnsoV/EC2sbGkCa7p
 UtWclz2I/boV2/aQvWUCUUr3oQiuOVK5iZxqSsAZRMqLOqI2JHBH3DDJf485pCh7aIqf1XPdUuh
 ha6iV2FjM9JhdqWLiRzbG76ZTcfxBFL1CuRDXt07YjM6dUDBqIoXfrRFCgEwruRW/t5LqGoFN/s
 cmM4BgHXx+qhyU/mwdeciMHINdBHzfqsaU3Kloq+PCgTHcgpkptOBIvaLfQ/Bjmc/eHYVXLZd/m
 4IXI5Nt7JO+i5K9yuSiLHKRact6gmj1d70Q==
X-Received: by 2002:a17:90a:d44b:b0:341:8c8b:b8e6 with SMTP id
 98e67ed59e1d1-34947da3374mr2797359a91.16.1764843222960; 
 Thu, 04 Dec 2025 02:13:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTI+FXsDrWaan75rn1W1zOHKGsnyM2nQAIHGhx3Y/oa38TATUtOTFlY4ZsHtBd5TpA4INomw==
X-Received: by 2002:a17:90a:d44b:b0:341:8c8b:b8e6 with SMTP id
 98e67ed59e1d1-34947da3374mr2797316a91.16.1764843222506; 
 Thu, 04 Dec 2025 02:13:42 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34912a1cb94sm2500275a91.2.2025.12.04.02.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 02:13:42 -0800 (PST)
Message-ID: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 15:43:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YE_cVFX_W5BJMQBPcGXXuxzqheD-wcmI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA4MyBTYWx0ZWRfX65Ck9nkgen5d
 4KtOIxQd/AXdLO+yk3wacak0NduJsuLcpTmbunNQmytqrZJKJjo3tjZ5b9VDK/TXp+Mzk17XxyR
 tTgR6gs8WWGkbPNDa4+kKLiCCV89tb+Uy3m+21YhPE8+vgmTMYEMbJ+HNXkk3dhJVGKyFjIbwx9
 fwdc73ZwOYAN0pO5czV5mC00oKWVDL5v2knmqaaNB2xU3BfuzlGCceVyPkbMTha+bp4dlSm3HH0
 /qAzhkOBU6E9Xi1wFxpVJHCNO6E/2d5tmmWBNnqhQygvE8TH+MkmxFvQlVhG9ye95P12OtGcEXI
 /UCUehdzu+eA44TqqZFRotl0CU9OCoU2SH7x5KaQWk1y5oWEVuP9f9EGB79h++TbAF2Od8zvCcf
 TGMKDkiBTZbHJqdeXEXd4qgpFrz58g==
X-Proofpoint-ORIG-GUID: YE_cVFX_W5BJMQBPcGXXuxzqheD-wcmI
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=69315ed8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PRsBwnEcORHDhoN9PnoA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040083
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

On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +			gpu_opp_table: opp-table {
>>> +				compatible = "operating-points-v2";
>>> +
>>> +				opp-845000000 {
>>> +					opp-hz = /bits/ 64 <845000000>;
>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>> +					opp-peak-kBps = <7050000>;
>>> +				};
>>
>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>> or mobile parts specifically?
> 
> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> here.

The IoT/Auto variants have a different frequency plan compared to the
mobile variant. I reviewed the downstream code and this aligns with that
except the 290Mhz corner. We can remove that one.

Here we are describing the IoT variant of Talos. So we can ignore the
speedbins from the mobile variant until that is supported.

-Akhil.


> 
>>
>> [...]
>>
>>> +
>>> +				opp-745000000 {
>>> +					opp-hz = /bits/ 64 <745000000>;
>>> +					required-opps = <&rpmhpd_opp_nom_l1>;
>>> +					opp-peak-kBps = <6075000>;
>>> +				};
>>> +
>>> +				opp-650000000 {
>>> +					opp-hz = /bits/ 64 <650000000>;
>>> +					required-opps = <&rpmhpd_opp_nom>;
>>> +					opp-peak-kBps = <5287500>;
>>> +				};
>>
>> Here the freq map says 700 MHz
>>
>>> +				opp-500000000 {
>>> +					opp-hz = /bits/ 64 <500000000>;
>>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>>> +					opp-peak-kBps = <3975000>;
>>> +				};
>>
>> 550
>>
>> Konrad
> 

