Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86048CA7CE3
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 14:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BB210EB42;
	Fri,  5 Dec 2025 13:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNO5wwU9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAtxUrIP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CB010EB42
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 13:41:54 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5AWpUd3135822
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Dec 2025 13:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 n7/xg9hqfz7IojW9i45R+MaisCn64mYGvJ5VCnPDFQ8=; b=CNO5wwU9h2eskiEr
 vYWmoIAldICyZRL4DG/u3MZE5BGRA4jICxrdFat9ph96ZwMgxbM12v4gp/eELArN
 6v+XfzOkq3UnalVvZ8IcQqYWYeqreAYLhosJd3X75+nivy4KM3rsG5f4okUu0WBj
 HCrwrNdLol2bdS/ujyjdeNA2xgD1qJE0ed1F45mav+VJgoFan7MXz5SD1XVVAVOB
 H4/8/2xvJPzoYarf7Qh+5ImPxzHhp/3MvaLilU6yx3urj3CUHbt/z0PBaZVyZepW
 0AifDaNFRu4jP8bBA+I/KWPVeT2C2IlTUVRzfH6EMizfIF87FlzTh7WdirPl9zew
 PeG/Qg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aupa8ss0d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 13:41:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-29809acd049so49332815ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 05:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764942112; x=1765546912;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n7/xg9hqfz7IojW9i45R+MaisCn64mYGvJ5VCnPDFQ8=;
 b=QAtxUrIPt754GKaccpnYzTBvf+zjc3j4oGCOd8vRG8U+lZ6c/aVRA1XX2TKz7W13gw
 jam6J9bmQZkKTWIgilLymCwLDuC8naP3ZJ3lBUApvW+e3kLmykQ+RJWPflVczCEisHNj
 le+6k7sAstoEwjYSF01eB+Fsf7KeuF//JV2qRCyKbs3qL8xI+a5lbuNFsSEOIzWMNTXs
 ooPdkyMaoubr3WCRZNu6teMhFkifVjH026xfykeXlDgd869EYvAt2sX0JtV/4xm0xnVK
 PqFJRROBGf1WxQ3Cr07G/BrnFqWqRc+IQAQ55wtwujPqC+Uigh/vibHgHeYYHT7R9cW8
 EO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764942112; x=1765546912;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n7/xg9hqfz7IojW9i45R+MaisCn64mYGvJ5VCnPDFQ8=;
 b=QjSRxqIn/eDovQUBxAfBaKCCe5pFHMJEZldveD8a7bvE2ttfM3rGLZl9IMQHxfRDDa
 rBF+MyPKzS94Jsos+Z9nrv947XeviI3WGxuv9RYvILcwAlqNyMy8vL9yZOeMTW7CxyzV
 JnNiJrdnEhiDQqTKpbZS0RasYEC53bINeqykSAovzsPJR3FQ6X1M+KmwqzTzFLGc4M79
 h6e9ZQzxAd5gPvIizW5idttk6JBiNadypj/QP2bAAUqEDxXSPMctyzmIYamE21/enc5a
 j107uy4vQQr+ynKPG4kPOSCVIJPQ7jVxzQ4EV+TOpoIz8As0ue+FVIOdlc9coc+5PDAC
 dcSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFIx/tTkBuRQv5Ty0hKW+vMTAw9xa345vJ3FaRWNtcm2IZC7S9RNudGd8ap6p4YHAQXBDEEEVnenw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ1ICsZPZlkf6SlrWCL+uUjq67vimKNjFrFHhVZiheh7PuGaor
 AT5x0Yitw6LEipMjxKrbaSPKEGCrXD2YHLSQGbZ0Ogu9axAQdHoKi5XNFihZgTOw6YVpjxhB0nL
 KiOTJnUdj+kh+ZaaF2H2cMn67O3Flz+g/x5axRxfK90YQd0M6RNOMJPW66pgHujGsqGRblzc=
X-Gm-Gg: ASbGncvE4QS9Qztjg0ErOMKHFci/o4uD0X1xU6BWvh5z3ED1xa8I+3RszaZlLszCNGs
 ex4yxMZOmLOGtnqv9kar/j6M5wxbmRTHhO4S/FabxN8QDnYVZ8KJ5Y2VfSYf84hW8Oc1lgX+CLL
 CaF8w4WPSCBzdEM/6VbvY6mhtE3zA/PVWjzpGbf1bD9Qw4cTYvYev0ereIW089e8tRmupa95YZZ
 LHGYXoj/sAI/5xnUBFudREtELzZ9/d6hNUpjqn/KtWLQzSbVmt9gAuqbFRsFycENK/fZJqhc6LL
 tc6MRifh37dvLA/Uyf0LXED8sjNlv+HKNGaDnR7imYDgFKfoaWzM4sS+z39S4db6E0B1GyVd/fx
 larR1GeSC7hWETjxjo27ABMwtR8jdxFQp7g==
X-Received: by 2002:a17:903:3d0d:b0:29d:9755:9bd8 with SMTP id
 d9443c01a7336-29d9755a07bmr74505335ad.22.1764942112425; 
 Fri, 05 Dec 2025 05:41:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHshUqyeSZa92V5Aaq1utR9alONTZF9h0tJSM8m55U93erdoJiSrDaKE4FgBRRU6fmmE70fbg==
X-Received: by 2002:a17:903:3d0d:b0:29d:9755:9bd8 with SMTP id
 d9443c01a7336-29d9755a07bmr74504875ad.22.1764942111841; 
 Fri, 05 Dec 2025 05:41:51 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae49cbdfsm49762375ad.1.2025.12.05.05.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 05:41:51 -0800 (PST)
Message-ID: <d087dfbc-fcd9-4f01-8cc4-b206c2e87f28@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 19:11:43 +0530
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
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <9141e67d-2837-4e73-bd3a-9a9c5b8f72f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=6932e121 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PFMJV2I6qJKDnvYOCoAA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5OCBTYWx0ZWRfXwMgF5hRMOSBK
 /xVf+G+Py8lsybozYZ4rts56kEyXxDm4y5za3iR+x0lZHzJCJCPdr+Jz2qIKWvhvneKfCCcUVp7
 5WwwwzEFT1e74EC9A7qhFryF4cE0KI5I11zgKNESKdfZFQvdCVnAAB2lzrHgN26aAaJoHRZQwJ0
 lbIoZAW9oGdu3Q8+aNWYnqEo3VhIL/Nb7PBI7SBxDKw1kwPhlItO0c+s0I+6SaeLes+0u+F888b
 ACs9Dwsemrmp7HHT5rufP2+ki7LEy+f5E83rhnONDBK9YQuhZEzdeLDELtjk/Lvc7SbS4Cm6TQb
 UaYTFxhaWo8hYFUHwr4dZJ+uJ3S6YkbwZ1VDeEjyl+XF8q0qM5+WWvN53FDFINwHOmwX+rGfLCf
 Hz2QWz/GajGYtyqfhbNpOGSb/nKjgA==
X-Proofpoint-ORIG-GUID: bZ2cUhPSpWQYcVvXImAztqAJIer_Jwxy
X-Proofpoint-GUID: bZ2cUhPSpWQYcVvXImAztqAJIer_Jwxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050098
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

On 12/4/2025 7:01 PM, Konrad Dybcio wrote:
> On 12/4/25 11:13 AM, Akhil P Oommen wrote:
>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>
>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>
>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +			gpu_opp_table: opp-table {
>>>>> +				compatible = "operating-points-v2";
>>>>> +
>>>>> +				opp-845000000 {
>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>> +					opp-peak-kBps = <7050000>;
>>>>> +				};
>>>>
>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>> or mobile parts specifically?
>>>
>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>> here.
>>
>> The IoT/Auto variants have a different frequency plan compared to the
>> mobile variant. I reviewed the downstream code and this aligns with that
>> except the 290Mhz corner. We can remove that one.
>>
>> Here we are describing the IoT variant of Talos. So we can ignore the
>> speedbins from the mobile variant until that is supported.
> 
> Writing this reply took probably only slightly less time than fixing
> the issue.. I really see no point in kicking the can down the road

We don't know the speedbin fuse register and the values applicable for
this IoT chipset. Currently, there is only a single variant and no SKUs
for this chipset. We can add them when those decisions are taken by the
relevant folks from Product team.

-Akhil.

> 
> Konrad

