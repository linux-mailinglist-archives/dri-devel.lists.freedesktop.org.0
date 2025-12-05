Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC8CCA7E35
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 15:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A220210EB3E;
	Fri,  5 Dec 2025 14:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnDbn4l6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JMjbBCb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC01E10EB33
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 14:05:57 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5Cpmld231172
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Dec 2025 14:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oiiUujtI15jg4TX5b4dyidcjhl4DklXzl6YsqkAAS+Q=; b=AnDbn4l6vqmAd2Cc
 NW/SXEIFH/WlPU/MIxhF8zAxjgSwn7p1rbhnJxS7nNzY17EnTAtv8/rgxXrNb4Wy
 fNc3LdPzX3zWwSE7uCFhGYGCCglHv2JcxT6f5+7OcA58q+SOgEnRZuV8Fxyn8LhT
 NkLX+QlNnnTQc6vEyfiF4Sw5zohZLESVDxWrZuNRxJUm9EdX4Ws0f4r52A9qrJP/
 VJ2kweuD2aplTWPyc9yECNbSLlImQzYzJf+g4VJ/ZxFN6JkGXhFKSX03zilo6MUf
 7yQA3m8EJzj18sFFri2TRqqnpuVDnezTyYZaELuzmd3aDX+pkM1z3crKyMH5Rny0
 8iXAuQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auys7g5au-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 14:05:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7be94e1a073so4150130b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 06:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764943556; x=1765548356;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oiiUujtI15jg4TX5b4dyidcjhl4DklXzl6YsqkAAS+Q=;
 b=JMjbBCb8jdhZ8bYrL2WUkNmuW8qRQL3FQ636Q9LWGeWllYGeG0nRWWXBY4EQA0537r
 0JesLthlITrRYDDeaRKhmKsRBRIejfYP9scvYfvsaCSsFa0ZsABceWmbGk3/8oDYymhg
 /0jBpVo3RdeAclsMrzn5P2nkwFFSp0EIlBRKlR9SQhNKaco8sUvwAzThqz+kuw62SdEt
 Q6pXTSlaajNz0sK4qhci48+a0AFhmlqV2Gj02KfgM3v484EsFLaTvFTYoRGMCiMVcsK5
 8qsd3T/yIeibUPdpNtL9t/b3vgGeyWP1QEYL4GeATZ7ocNYqTd/BxbUjwHS3rfnk1FDi
 215A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764943556; x=1765548356;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oiiUujtI15jg4TX5b4dyidcjhl4DklXzl6YsqkAAS+Q=;
 b=gVBAl0o3qZNDJQ6qWCrJtLuWxRYWw8LUZRKxh/QGtfoT2MJttFdPcyb90eWHruUYgt
 npI+M0wsGJFvv7+RLoweuJCKrS9dfb0I8TJMZuh+PBHf4uRqq1V9xO8KLgfxXA7+4gzM
 vJ0GVtCXtXZhRLTnaRt1Df5ntuTKgsyq7xWKTKJNYzV/sGmAISISuml9o+lmwrQKBbtL
 u32Su/RB+IVww/oCvPueairDbaXKhbrOhLyenKbLWO+GZ4F9hwMkLYUYDG+UrKC9ecjD
 8SvjmEabuVLHazvky9Wqrnjp+pzubb0oBYU1xJ/fQIoI+1f3ollk5d4MKqBrVDgzTTtq
 K7BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMl5FyoPAP87GZmTopGnqmQcmeICmaoMhEmmUIzFQOg2S1Tua4dFrJTKnWkpgdSx9SR9MoKUJaR1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzYINsWYZ/BqFvNMjLhAB6W0NRoSVzPE1zINaGVVde5Z0b0j+M
 cISaf5kmasMHAF9si9Hgs8CVcHsDDbbJMoGbqSkYYnCYh0hW5JpYI/nEOdpItmrGaF2mAiSX4Su
 5okh6ijKZMnNsrji9qZ3fMMpFPwkl9VIo9IJnVF5Hwgz5jAVyy2pi4Wo0sp8REDscJY5PJR0=
X-Gm-Gg: ASbGncvjyAF/+gdZsv3qexdoyshcWHRIWEbVyCXg0Ul4frGVbkHNa64JzQfvYFa9hdD
 tcbDSNrx61zZbJo0wUq65+GnIxON4A1Y/x/g2HvJ2FAR/h8bQdiqKtpmMOmBuPpNTs9jN1wSCW8
 gSeKQ7fwKWvexYMUkV1r3++a5G2f+rtissHzte6NoQe8ejnKm+v2KTjPJpXd1cHd1XOnGgsslV6
 /nCDd6YOClQYYmY6XlR6Jwt4FZNljU9PO2ujTE5TxsQMw7i/+AfqrBMWGaLf8CByXeNiQGp3FLa
 QXc0EDuneo+o9twf5rzwvCorws+lDAQoGZcruW++MHjjBJhwqf4S3yUE0U3wMOVMqAQyeaVyX7M
 gg66jFGZII42YRYYWMpZt/07Xk7H3MOwBcQ==
X-Received: by 2002:a05:6a20:3d0f:b0:366:14af:9bbe with SMTP id
 adf61e73a8af0-36614af9c79mr270699637.72.1764943556404; 
 Fri, 05 Dec 2025 06:05:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAgA9orODpp4Rjh7ULin/QPXV8ZFFMmR+nawulDJMB+XXWkFsNYSBrBeiA5YYZFPjA+0UAQQ==
X-Received: by 2002:a05:6a20:3d0f:b0:366:14af:9bbe with SMTP id
 adf61e73a8af0-36614af9c79mr270635637.72.1764943555822; 
 Fri, 05 Dec 2025 06:05:55 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bf6a2746f95sm5001184a12.30.2025.12.05.06.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 06:05:55 -0800 (PST)
Message-ID: <ed4b1e3c-bb30-42fd-a171-12121db2dbec@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 19:35:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <9141e67d-2837-4e73-bd3a-9a9c5b8f72f9@oss.qualcomm.com>
 <d087dfbc-fcd9-4f01-8cc4-b206c2e87f28@oss.qualcomm.com>
 <6dc39f3e-0a2f-42ca-a088-4b62a8153001@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <6dc39f3e-0a2f-42ca-a088-4b62a8153001@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEwMSBTYWx0ZWRfX+LYKttgbnklC
 p4q316Q5JMLxzdmdoSI2snftiE45YY8Tylaj8v6qs5lTrsgYU3QtEC9W88ei/6Bbn/OFvu0gaZJ
 iPT0wmjYNwQlseBBIzJgnXcp2rP5GYBfT4/ZEqBIP678Ijl4bD8Imh5FxXE1rGXS9sTWFcW7zES
 41sEqxE1e1HJ0zJmHQh3+DMvn071CIu48r8J8Z0zHwTuswoXEcDkxEGgijXR6vXejyN0MnZXepg
 ozSUx4EV8Khjyi3R0wITodJClo8ckDINiS/9Z75TqZ+rNXBRhwYxrs3CEunaD3RfiEvRmdQW3XI
 lR+SHZWwTOTPPVPLjp70sb2GhLaTyptxvvjv3PVlWEzc3EJuxRSbtVjTpNRy4Q3Y/2bnsYOaNcE
 +y2R7cDqrPiquU7PpWJjJsXPFq0fXg==
X-Proofpoint-ORIG-GUID: qkfCaw3SnVFAZZpIP8lT1MUfRV0LZtZ8
X-Proofpoint-GUID: qkfCaw3SnVFAZZpIP8lT1MUfRV0LZtZ8
X-Authority-Analysis: v=2.4 cv=GtVPO01C c=1 sm=1 tr=0 ts=6932e6c5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=OEjwK6i1zzq-GUtPt80A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_05,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050101
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

On 12/5/2025 7:22 PM, Konrad Dybcio wrote:
> On 12/5/25 2:41 PM, Akhil P Oommen wrote:
>> On 12/4/2025 7:01 PM, Konrad Dybcio wrote:
>>> On 12/4/25 11:13 AM, Akhil P Oommen wrote:
>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>
>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>
>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +			gpu_opp_table: opp-table {
>>>>>>> +				compatible = "operating-points-v2";
>>>>>>> +
>>>>>>> +				opp-845000000 {
>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>>> +				};
>>>>>>
>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>> or mobile parts specifically?
>>>>>
>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>> here.
>>>>
>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>> except the 290Mhz corner. We can remove that one.
>>>>
>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>> speedbins from the mobile variant until that is supported.
>>>
>>> Writing this reply took probably only slightly less time than fixing
>>> the issue.. I really see no point in kicking the can down the road
>>
>> We don't know the speedbin fuse register and the values applicable for
>> this IoT chipset. Currently, there is only a single variant and no SKUs
>> for this chipset. We can add them when those decisions are taken by the
>> relevant folks from Product team.
> 
> If there's only a single variant right now, could you simply read back
> the value and report it where necessary to make sure the internal teams
> are aware?
> 
> There's surely *some* value fused into the cell..

We don't know which register to read at the moment. It could be the hard
fuse register or some soft fuse register at an arbitrary location.

It is better to leave it as it is for now. Who knows, maybe there won't
any SKUs at all.

-Akhil

> 
> Konrad

