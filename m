Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416A4C828D6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 22:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EC910E262;
	Mon, 24 Nov 2025 21:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BufXf5vF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQb/tLSn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70CD10E268
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 21:39:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AOJsCeh392546
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 21:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WgXfIJo8v5pPFf/7d5jTW7/3WqOQ17Vj27klEuOBSnM=; b=BufXf5vFYj2Hddb5
 pO4tArFN79drh7+qn9UIBs+E/HUCIhb37y1QUpb2j3YWhnhbULTj6+9MDIKnzADW
 yQ+1Y1bil1oSXQuABpGSxNbT6SJzi7zdUFXMar8B1N7y1BBhNr3/FlpxGFymwepU
 WzliofabAOe3OYFpi4U5kby3Pc/CabGUBnu7GBUfmwLUKmYEDGaUHP9yT0th1yAA
 YLAFvBTxY3PWzrN1VUt/KsJ5slW7UqHHM0BGJHCtiiF62FVXmi8PoH3rPSUjhQvN
 WNgD9+5nzF8hsgQ9SchyUsNuu5gpi4y92XlgzhQ8Yqmu6iEz0tDTfq0OsD5tz4/j
 97RXiw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ama09bhhc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 21:39:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3436e9e3569so10039573a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 13:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764020352; x=1764625152;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WgXfIJo8v5pPFf/7d5jTW7/3WqOQ17Vj27klEuOBSnM=;
 b=JQb/tLSnYdab/Kf17lNxZlNgDIarOF/5UP7j0J0cu/m6x3mRh+4aA6oXF1YY0FPnKF
 2Zq/OkFZB7JrNPC09dc8ald9SEeqt/516pJiQ8BHExFkJ26SdJwYsEY+lhnBtoEUzm3m
 pp5Gk8rv3M6uhmhOGMOSXqWfx9tWOgwG/LUMIotKjSv8ESgeWeq5lBTtaXY+L2hedK2B
 F4PxUaiGqtidxgEjCzyxU5lbu334LGTjU996y+zzonS8C6n161F6eHVjp3pT3He6GYPe
 2B1RIUzkjEglFZ+ThKyHdjvTdZ3YyJo4UK7QAtj/fbBI3DudMq7cvwtjczfKKjOKUA/G
 tXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764020352; x=1764625152;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WgXfIJo8v5pPFf/7d5jTW7/3WqOQ17Vj27klEuOBSnM=;
 b=idYEZoqc0AVXuOnjWdX9s62Fw+/eXIoHTes9QRyS9rcbMXLa9a0LPBRoUVhXtPSpU5
 p32BtV88+2T0H4vcENoMZllre5jyi+SFPXLMlyJsegh4Xqcv/UsaP/00zZxiT4mG1r9G
 TnbW8OhfP7jpf2tRvn1C2jtryJr4JLPj+KMCjYpPQKlpeHQ/WPO6c4wNEetvlZwz6+5n
 +12WRyr1qBEm16lljk02+sSzNH+3nj9MWlnLxwSpovp9Ad4PbA7qiRSbCENFYEKLw/NS
 QRh3hY0pgMnZ/9FDiuWgWBmXHp7DuLz2AaeodH2ldGsXX4I4xoy7SskRF5K+5kYQodl+
 +heg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/30lKMlI1BeIHlrXBO9fmSj0j8EGpyIqjbULEVFwT+4FhsFUlSmjZTGlrFN8KQzgFj1gZNTB4Hus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjMwif3k8Jw2/Wmo7DpClaielInDPmMGjV4z0whMhUbJ3rLqkS
 QOIEnAMxIqa76yEz5f5V2ZA3W6OALP909JilMgTsDbOaDTpaIxHGhet2ZQLjP/JGSt8V7TR0IfO
 mh2ObOg8Zg4F+AZZQn7SBYiooKdBymlq2xYGklY2ieL1CnDiX+401wcv8pnNa2YOYBJZxVOA=
X-Gm-Gg: ASbGnctVOdsFd5c81xNIBjZdK337IllMMhWYUXxiCx60Lc/SvLn6nTFAkdn47xoHGd5
 FwIapurJTjCARgQWFh8LVeaQsVVUkLNL/eIoN6vyQQUzbgr9/L6UPI0ARqP0ZwuPV6SKOkDn5dZ
 Z+JIQA3HP0W00ShxeoiZhYNIMG6KvXWpzT1pee4QMQsC2+dqZyZbMO8v7H73sFMAOM0ptuAt5Aq
 X0/tKFBmmADrnRDfBWpi92Y0schWHnUXjiIBjx1Ulw8LE4soszfKX4OEB5W8+yZ6TidgWRkK048
 9S3BrC9U5bjVGSuoZM2QHztAxQfNVrB2cxdRyPOSD4JVsIPDMflOQIVRJ2PyWC6Q8VowInuzBLJ
 VgCSYFxog80h+LT1pqwZfDOvzIPqOfD6O0pE=
X-Received: by 2002:a17:90b:3e87:b0:340:a1a8:eb87 with SMTP id
 98e67ed59e1d1-34733f4f4bamr15101973a91.35.1764020352528; 
 Mon, 24 Nov 2025 13:39:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBTx5teH4HQxlx3zmAf8DbE5rLFzZMVPvASueFdbjQ/qQPaDPGzHLFZ88hLWWlnqEQSKoDAw==
X-Received: by 2002:a17:90b:3e87:b0:340:a1a8:eb87 with SMTP id
 98e67ed59e1d1-34733f4f4bamr15101934a91.35.1764020352034; 
 Mon, 24 Nov 2025 13:39:12 -0800 (PST)
Received: from [192.168.1.14] ([106.222.231.199])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3475ff9fed2sm2224a91.6.2025.11.24.13.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 13:39:11 -0800 (PST)
Message-ID: <1207b70e-dcf1-47cf-be26-ff2928932e3e@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 03:09:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-2-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-savvy-camouflaged-chinchilla-f600ce@kuoka>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251122-savvy-camouflaged-chinchilla-f600ce@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HTiezikSW20A2K2WnGO22IiCR47t-DIM
X-Authority-Analysis: v=2.4 cv=PdHyRyhd c=1 sm=1 tr=0 ts=6924d081 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=QME20dCx57Gc1q/4dZKLgg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=X55b8mUuofX-4EZtosYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE4OSBTYWx0ZWRfX6M2J2LgCsblR
 meJGv16Ftv5UTeS0RKpfv3fYKnAAwEXRd40qNAUMdyqVqWYh9ZdZY+K8LTsRIq0GGmyXDcogN4S
 NNUMcFhnxXq8wyarmlM69qKBn02BrBHFBHIHmSnZBWs8Xy/uMIIUtQWziN6XgODPtFRqpOkP7qJ
 7/LuGP1Kv6zoUk1AgXNWvBg0+vNZiNgx87B8uPzAWIcZBkA0bsvXb/iAU45kl7l4Eyg8on3kAv/
 Yv6XcXAabS4wb/fsZEmCCOwr5w2dcp6S3mD/MB3F8B8mpH671h8CsMvixl3CfbPZFRz/L1amnAh
 ksNTqP2Zj+ejFXuqWaUdMbEcaWUUIpemIzHeXlChbESPr1n1TVIUrHTzL6g5Jy37/Bz71Xw6sPD
 Qbh6DVUqR/gWqDyDmszmnUpVSNBzQg==
X-Proofpoint-GUID: HTiezikSW20A2K2WnGO22IiCR47t-DIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_08,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240189
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

On 11/22/2025 4:32 PM, Krzysztof Kozlowski wrote:
> On Sat, Nov 22, 2025 at 03:22:16AM +0530, Akhil P Oommen wrote:
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-612.0
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: GPU Core clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +
>>      else:
> 
> I am pretty sure you break not only intention/logic behindi this else,
> but actually cause real warnings to appear.
> 
> The else was intentional, right? So the pattern further will not match
> some of devices defined in if:. Now else is for different part, so only
> 612 out of these devices is excluded.
> 
> There is a reason we do not want ever else:if: in bindings. If it
> appeared, sure, maybe there is some benefit of it, but it means you need
> to be more careful now.

Aah! I missed that this comes under an 'allOf'. Not an expert in this
syntax, does moving this entire block under an 'else' make sense? Or is
there a saner alternative?

Regrettably, I tested dtbs-check only for the talos-ride dtb.

-Akhil.

> 
>>        if:
>>          properties:
>>
>> -- 
>> 2.51.0
>>

