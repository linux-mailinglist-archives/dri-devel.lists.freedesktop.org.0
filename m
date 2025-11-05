Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DB8C3706C
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 18:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA98610E789;
	Wed,  5 Nov 2025 17:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5e2Bclc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eanlEWJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2E210E1ED
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 17:19:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5GokI8159501
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 17:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d2jzqV8oJZ4plosAL5G1y0RTbjdNLT/7KsDqWwEv4zM=; b=R5e2BclcGpupn+E6
 eJr6HC4KPCNehHfO+/Xi04jG6UhWi77hYWRyBXtfApIR5iGblyE+8gQ+nt/jEvbL
 mhsU7wOdW/vXfopUc1TbT3Iqsqdv8LGkR4d/ECyg6lhi6hoqRDx0jJrymhRCgUbN
 eE5sI2hl1QWubnFQt6y5c6BnyfchNIb04uHICuEbLWMtW3oqI/C5EIu+K5QVgqXk
 qME0RkgcJjwQpByK8H5cS28W/DgJdXlQa5CEL0iLKK5AV8PLMwK9MS544hZG/7Pp
 YzG1GUl9O7tczvX5rvXW3fIGfLcVfCkTmYUfDDyUDO07Ki5UfcQLpYANF7iMzKHO
 DLl+AQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a82mt1mu8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 17:19:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-340c07119bfso559859a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 09:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762363157; x=1762967957;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d2jzqV8oJZ4plosAL5G1y0RTbjdNLT/7KsDqWwEv4zM=;
 b=eanlEWJ5B8Ic0eL+ME+5EfxRoyZ6RUabmLvd0LHd5GXycMaxVpTIqn+h90e3dFdavO
 q2MSLBoifVSUinIp6YpFotTJBpNtIjqNejrMvP46g/jpsaz0T2qMvsAu+ZRY4cvye+7z
 NiqSiCoZzHPD412i3mEpMufkAST3TveIjQDoBf/U8dTUkh/ATSneSxVzm3IllAYmeNd1
 MuvO9KDyk74mLjRSvpcc/hNTQg2z4htZs8CogZLVjGTsG1WWBGjXY1KyLQFWrFym48+y
 bpuR4Jpv11kxUZs4fvMYHWzsjTj4wE0a8xe26d3mS/2n6QpgXPMta5R2nBR/NtMmDdzr
 o9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762363157; x=1762967957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d2jzqV8oJZ4plosAL5G1y0RTbjdNLT/7KsDqWwEv4zM=;
 b=MKN8WNFb1qlrHC61PNL+WmcpUAw+ouG7pMJSXTYpPk73xzb8DBs9dKRYg6sjaeygvH
 WCQgTExeJHOGCxvP0C43UGmo9+cr/gJbe/75aNhkPgXqhX7xKCD4umAYLtrlLmglFbCq
 k7r/OvQybV2uR+f/3zJPBBVWrr4p4LMU2XOi/OXiBPUNChRBLy1F4RJtbtKh+81w2ZB6
 SK1U9UWmvxWCh66UesFKUTM+uaeabr4aYDbDJkJLUkepBbVc4KW2ryDwovt5YO7+zq68
 HCoh6jjDeNS9gfZ09loVYWosYJBHxoBg8T71gUtQ+YPUPLWQVW1Yog2C+aa0TAGh+a2D
 36bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMBAvxSIBHUOxEl5KklpL8MmBSSzMHd5UHoCDoN2Lg7gvJHH+mkcNRqqEosTWjfcC7jIIelg3M1xY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxextNZND4d+JqSRlnc48sRslVpGWd6nNRVcReDJ72OaSuhG5Oy
 F//s6ziBsFW7M7gpchz5HsjCrNxIkJtnuZhyP6+XrLRITfj9qjunL7N07qV0av44SA17YDTLwgn
 ulitOw1ABhKzwgsuHdAi3NZ9VNoQeT/zqHucCtBiS+eFaNq5tMaTe5I6Rl+PsuuPpmcnPBoE=
X-Gm-Gg: ASbGncveXFahgF2/gX35CHWRfk0CTbl1SGJ+8JYgMzQUFU/ox/HdEybYvynD+nx4xKr
 fbpSmp4bo2YhAkj4QLcQoBT2I77t5gBj9YCKPWc8jlDmyDr3iG5MWrmOaSGB0ikJ/dKnTUujasL
 MXsN6795g22kYZLdol8OhIqsb6nhVpcDtWZ5nImAYggewIobdlKAxE63FtCBwLxS+j07wCpyXRV
 GZw3V2q+wv4Hm4R8qgZCBprzwx/3KjDlSPGtIRKrEGyKS6GzolYjs/iUorHLKh+QMJMeo+FAo+0
 51L6wrnEy2ePn6POfyi7EB9FtflGMoSDHUcBXqptlcm7xSlVSefQpYKJXPBgoA5u29W0D7yCBg0
 8yFfMas8aUVR3F/97+2XXGQ==
X-Received: by 2002:a17:90b:3c09:b0:335:2eef:4ca8 with SMTP id
 98e67ed59e1d1-341a7012182mr5029881a91.33.1762363156975; 
 Wed, 05 Nov 2025 09:19:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvzSRF+BBkWYVbOkPymWtRFgJ+GZ8PkUlrRHN+0DizYbOyTJnzSCGFEoQNIQNhQoPoiHhIfg==
X-Received: by 2002:a17:90b:3c09:b0:335:2eef:4ca8 with SMTP id
 98e67ed59e1d1-341a7012182mr5029841a91.33.1762363156531; 
 Wed, 05 Nov 2025 09:19:16 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba1e7983986sm6231090a12.0.2025.11.05.09.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 09:19:16 -0800 (PST)
Message-ID: <e67bc77e-77f0-4744-a86e-73fc23dfa705@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 22:49:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] dt-bindings: nvmem: qfprom: Add sa8775p compatible
To: Bjorn Andersson <andersson@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
 <20250910-a663-gpu-support-v6-2-5da15827b249@oss.qualcomm.com>
 <8ff537c9-efa0-4aeb-987d-150bef8b7c00@oss.qualcomm.com>
 <bkhjgw4mtfmkatxjl7enn4fqqjbutealhaqgxihdmcvhekyyd4@lsosso5ta74z>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <bkhjgw4mtfmkatxjl7enn4fqqjbutealhaqgxihdmcvhekyyd4@lsosso5ta74z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzNCBTYWx0ZWRfX2SVD4bXljNpt
 pOl4N2nTiZIlWdtg56UuLZ27gxJ18PGIUPJRZU+O1+sWH2TFHwxANYpOx2nKYmzrKX6wNU96xCA
 P5gEd4EiTeCjVwapRCXbe776OCLNtCQWC/r5WYSpq6gVOuX4Sx/fK4qVFQQSN5C9jFLIIx7cB5R
 mI1/9OKwBZzd8k+s/qTu8mXJuVPQhdnp9nRSCMa9J0INa5y7Vv+GSz/YaN4hkHv4lN0TzMiolYc
 Dva+bwCxKBWoSKrkhhI2Olojb2PVwhrwqUy2E07eIKsH0dYSY+GiHFYTDGL6ioVRsj8/RpKI95x
 iFf9e8h1lam8nAwVaat9VWOTgL+S599f3O+2tuTaRSG+9pCPxJWZSuguqIs3xHuKRXblhsMRgcy
 Dp+rmBjcr0Cs94G8S/3Zp/Papy5bKg==
X-Proofpoint-GUID: 9-8abACBBLIL67SpaCXGBYUUt4dEBpY4
X-Authority-Analysis: v=2.4 cv=LLtrgZW9 c=1 sm=1 tr=0 ts=690b8715 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=kynJYrAj6unHVJukPU4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9-8abACBBLIL67SpaCXGBYUUt4dEBpY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050134
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

On 11/4/2025 8:32 AM, Bjorn Andersson wrote:
> On Mon, Sep 22, 2025 at 12:55:36PM +0100, Srinivas Kandagatla wrote:
>> Hi Bjorn,
>>
>> On 9/10/25 12:25 PM, Akhil P Oommen wrote:
>>> Document compatible string for the QFPROM on Lemans platform.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> In case you plan to pick this up.
>>
>>
>> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
> 
> Thanks, it seems though that I missed your reply earlier.
> 
> Please pick the binding through the driver branch if you can, then I'll
> pick the dts changes.

Bjorn, Srini has picked up this patch today. So it should show up in
linux-next tomorrow. And I have posted a rebased version of this series
for you here:

https://lore.kernel.org/lkml/20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com/

-Akhil

> 
> Regards,
> Bjorn
> 
>> --srini
>>
>>>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> index 3f6dc6a3a9f1adc582a28cf71414b0e9d08629ed..7d1612acca48d24c3b54c4d25fa8a210176d3bb5 100644
>>> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> @@ -39,6 +39,7 @@ properties:
>>>            - qcom,qcs404-qfprom
>>>            - qcom,qcs615-qfprom
>>>            - qcom,qcs8300-qfprom
>>> +          - qcom,sa8775p-qfprom 
>>>            - qcom,sar2130p-qfprom
>>>            - qcom,sc7180-qfprom
>>>            - qcom,sc7280-qfprom
>>>
>>
