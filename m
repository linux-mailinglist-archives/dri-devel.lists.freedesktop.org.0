Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD4AA816D1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9F110E74F;
	Tue,  8 Apr 2025 20:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGQZHq6/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7807210E74E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 20:27:06 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZ0hh023074
 for <dri-devel@lists.freedesktop.org>; Tue, 8 Apr 2025 20:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cqXN69eJjj53VercbPPDUqUwXi+7djq/bqmM04r34T4=; b=aGQZHq6/nEayjBSQ
 x17b6vBaVffK69+9jySaswTU4QZWqd8ZQrUvDNbMHcTmNAJYKuR8aoXnVCMHLbAr
 A7SvqTj6dV9eitGJBU3zY1VVO6N9P460NjnTifSBAc57hM/OABHO94pWKvmcIklB
 SKer5dCA3KW6/KpcbVwrZ+UJh9hfhWr578Bn1W9PmhP7Ag0GdSyv7RhJgIsHJ7j8
 60dKkVgPxeyDoBLzdWO3L4RDYAKxJBJxsJILtCbzdBuHLpGfuOKsrRINjzwk2W4x
 xzYNsl6rKwWh8qLSks3ZUmVsAQXlTehBEw+NwKwzC2HiXRBSUKRTC1oMgZFxleGK
 TeuFjw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkgytk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 20:27:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5c77aff78so1744465385a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744144023; x=1744748823;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cqXN69eJjj53VercbPPDUqUwXi+7djq/bqmM04r34T4=;
 b=RxS8Iw+0U60Xpfcxp4nIOh/2wuxs6SD84AgIynfejashskCg8mT3xbCn/bOYCNccnU
 bN1X4qcxRnRqgFaXV/rJ8bZ4s8rs01/ISHKFM9nvkrPg63zovwDcLl/lgigaGUko9d5l
 P5K+3NHZA98LZZ0/ZKPYwbcTyjeiqK0+ALqNRjOwWfAelit31LThEA8LI/rlXgejOzHx
 OoZkkUby02wvanNhh+3Ii3ovt7tVposI+vfd/lHm5L8DM2jfeJnInAMnySN0JqZHaA/z
 Es2+6DUNdhx6EHrq1HZQMxrVFroE0Fgg9hdkPB0xRpnVDYKY0DfCZ+7Q64Z0VgCcOet3
 PevQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYC/kg9qC94pSSMC+2oJQWZ154MV1FVxlOigKlvX+sQI8N8jGTTyeapFBrXOhjRA2Kghx4sJynrHE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNCNGnVvZaPMVQD9iGNibqVzNyIb/NsP2GM+2oO0YE7WDvcEYg
 p8qA2WlNnlxmoFkzm6KzmMUC7vcWETb5tvKeSUb1xZqq/GZJNxIuY8uBiOFEHS2ZQ7S/sszYrMn
 /EQpzosr4IdgwK9ebN3f1q2p3AvigC8Fe0hVx9D26+vJpd+Ats+OLa9jpoZixgWuh+tU=
X-Gm-Gg: ASbGncvvJWYhPNGUtUGHLcnUwsPvdR4YiwQCNTEDmDwOYYeIRkMa+1ifxELsADoWEw7
 BwWwnMiM9iiR1g+S0cJ3edW8IjgoXUwKncfnBiJS/GuVGKcJ95SzgZ4/cFl51Q2OMDupy65TXXi
 HUzv3bU/cwPmO+5sGRMu6RwjJ09SdwUoGWzACw8TiTqINJWXT49PcfL7UA8h4L6nwgjmJRXuIMo
 DJrLw11wAb8xt3yFtn1zIYq3RhqiUKn4EVjRD+qUPdWtuxFg6sZMf1fSljIqWw+dE/MXhgZAl5R
 ymdj/FG3f5xU8lCtjMn1phjWYY1a4y2pSz2WKlkcnI/2V0J2XDngx83zwia2eiqEalgB9Bk=
X-Received: by 2002:a05:620a:408c:b0:7c5:6c02:4c25 with SMTP id
 af79cd13be357-7c79cbeb80emr99553485a.25.1744144023075; 
 Tue, 08 Apr 2025 13:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa91aTShNdMl7VmKxRQdJAndH07tT2U427MXJh74EQlfRPx/O/pMOjC+hvL+QXxIcw4lHwVA==
X-Received: by 2002:a05:620a:408c:b0:7c5:6c02:4c25 with SMTP id
 af79cd13be357-7c79cbeb80emr99549385a.25.1744144022716; 
 Tue, 08 Apr 2025 13:27:02 -0700 (PDT)
Received: from [10.187.209.180] (37-33-188-210.bb.dnainternet.fi.
 [37.33.188.210]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f0314b908sm20034721fa.55.2025.04.08.13.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 13:27:01 -0700 (PDT)
Message-ID: <767e11cd-e338-4e00-a8e7-2e15f3da84b4@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 23:26:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-4-quic_amakhija@quicinc.com>
 <20250312-calm-steadfast-cricket-fe9dd8@krzk-bin>
 <654d409e-2325-46e7-a064-ed9e64277e69@quicinc.com>
 <a168a473-c363-4041-8e3e-84fa44e92b10@kernel.org>
 <zpmr6cpiixyu2sj7r7oqpqsge6dcqw6xszldf7ugznmcrxqsme@efiwnggcn5qx>
 <a654d62e-502a-4a47-96c4-a44c14860e54@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <a654d62e-502a-4a47-96c4-a44c14860e54@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 72VIWlquxdjZhbjDrz0pF4wN6tDreRd9
X-Proofpoint-ORIG-GUID: 72VIWlquxdjZhbjDrz0pF4wN6tDreRd9
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f58697 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gh1egkeLKbPt9jDVRuYeUQ==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=0U3iGMtbaPiC_UXuCSIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_08,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=884 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080142
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

On 08/04/2025 21:42, Krzysztof Kozlowski wrote:
> On 08/04/2025 13:44, Dmitry Baryshkov wrote:
>> On Tue, Apr 08, 2025 at 01:03:53PM +0200, Krzysztof Kozlowski wrote:
>>> On 08/04/2025 12:38, Ayushi Makhija wrote:
>>>>>> +    properties:
>>>>>> +      compatible:
>>>>>> +        items:
>>>>>
>>>>> contains
>>>>>
>>>>>> +          - const: qcom,sa8775p-dsi-ctrl
>>>>>> +          - const: qcom,mdss-dsi-ctrl
>>>>>
>>>>> Drop fallback
>>>>>
>>>>   
>>>> Hi Krzysztof,
>>>>
>>>> I couldn't understand the meaning of "Drop fallback", could please elaborate it ?
>>> Look at SM8750 example on the lists. Keep only front compatible.
>>
>> Why?
> 
> To make things simpler and shorter.

I'd prefer consistency. Previous platforms use qcom,mdss-dsi-ctrl.


-- 
With best wishes
Dmitry
