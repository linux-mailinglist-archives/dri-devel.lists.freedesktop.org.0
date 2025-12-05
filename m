Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5326CA7DCF
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 14:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073B410EB45;
	Fri,  5 Dec 2025 13:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYrBWUow";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcwBD6m1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A955A10EB26
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 13:59:03 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5BYZII3643644
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Dec 2025 13:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AwOFGn23N+84vw0QT3trM5DNBw8Zal6xqShrR3uLN78=; b=mYrBWUowCghcJ3GL
 Ky79nPpkT+wzspmjazyv9ts0CwRO5STry8At4o1B1R3qq3OnqaRlMsZMOKrmPxAO
 2YLSRonQlMnr4Lf4g8DkzZdbEe+uVrmxI+1nDj0jmIHeHPO9qNLd1IcEyOF6o8f/
 yJmFv4H39uHe5kqMOWq0ycFruwrtoOWtcul1Ia/E/vEAYwtbKBvzT6xY9SDY+f1t
 roRJvlSqgDQlfJiKUUtZC8UvXJYal1MV16G5ThBN+g9VK/88cSJKMnXoZwJovvph
 Ih3SXjHoX9TNzAvso/Q9YdFoZF8Ila9lH/IrFIRXOvlFxpYfpqkygXyQ82MrDPlJ
 rYs1XQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aur9asgfw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 13:59:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7b89ee2c1a4so3696530b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 05:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764943142; x=1765547942;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AwOFGn23N+84vw0QT3trM5DNBw8Zal6xqShrR3uLN78=;
 b=CcwBD6m1ZFMkaDTaK5lj75THkR8l0LspUj7jTBt7IgYukwOyovZjHOu+iynj5HsoF1
 1dQk1YDMMtLAcxe1+DzDIuToabHPAwAga1X47WIgMPmWUDlOjROODTK80ZG3/ty2nA6a
 M904YJKPT61IVJG/7EJyvGDnhSoVisO6NJmujtxX2XmDtEx1DgMt4rMGudbvSDCg/NZU
 jIRzejNQmTC2ZelH1nHNZ3IukQImc1ixzCVjiq/KURpHdUQv5z2+ViaFGoCR/euHqd4E
 5E+kqnnzxkk3le8i1jybbt+nuw/EVHX6wxFwPUTgJ5Xw7jVDQMOfaIUa4GKzNle+pvcz
 Sapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764943142; x=1765547942;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AwOFGn23N+84vw0QT3trM5DNBw8Zal6xqShrR3uLN78=;
 b=LE5LFPsejmpoOi3Qlpt4ejd+TIai+7IJoGUfiCjK+VcqH+AFDyhRLuIEGKgAQBHHz7
 F7/Zqxj0iLfoeUAAesP+Fgsbh/0F2V/S4qkfvm+fk+C7+bN1Q7VMwO9qmAkKpUnAC26E
 kouD7uzjEuxQwed0dNd17v99C7oF5BOptYX//q5/9TRIhnTG6Aw34g3o2QWAJzEYHKD1
 JZ1bmCIaVCWEmg2IxHdk02PHeN1PuZr7dqApuLdy0yRW874CJLhmXTQC5h6Ji2pOKeWY
 CizIWWbgNgnbgbFqljHyQtFToQ6U1kMu9dMjXlMipLPc71QXOPRrt7u2RiPQp3WlTApe
 o1Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY4gKpdNSM3MQmbisHHYkCPSOBNL3P8moU0XOnE9vjsJokXe0rJQ82keGMsPTZM24l+AoLyqei6SU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeDenpcD43DRzOuFCj1SlEb64fSdF+G5Qt5fkZqNk/OLxtCJVH
 3jFt3RUptyyt2JX1CYu+oy39j3suE7kRFHzasPwWghlpsB7LKVebKoEEQ0/+Udez/RHZ1YA0JAj
 Ox6MOi8fOoVg52OT5bgezatv9YulR2LDoZKe/USJ1uRwtMqGDSRz/sQz6bPeSVsleS/2t6x4=
X-Gm-Gg: ASbGncsNlbA24FQMfW520F+ru8UcNFi21m3+Zu1mItF/fk0EsxiLULzPQRWMTsWcUHL
 FiJl3yS9k3gUYjzLW4w5D92hgzSwF2aOaBrI3wtzvi2WyYsZ0W8Ug5rSjPEzzEroNUFzaOsN//u
 ujQ5K25ot99hHKtXeuTN3ruOyqt2nzNhnTyb6krxHK/OiR3COQSj9Dc6ty0iCGyMUT3lELArkX6
 J3ggCB5XRc0xyxiJJaJ1LREdBfzwqQ+k7MsQqpeQUc2e0pEQfkTqTVtT6VS7RltsftYwYyjUGwC
 qLvNXXTzWb/NRRN/jRQTm1ruxxg4o8QivLU0FEq4ZMqYkqgyal7yD4zVzVp60lycWigXfTtyeB1
 NTqsGBO6NX89tQjWcyvlrVS8m6n11hoavBg==
X-Received: by 2002:a05:6a21:6d9b:b0:366:14ac:8c6a with SMTP id
 adf61e73a8af0-36614ac8db5mr264913637.64.1764943141624; 
 Fri, 05 Dec 2025 05:59:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIN17bdoUP6uMMUJ7SDlvyxo7Bng7d1r0V3Z/Gg3ZRXNxJiMHZaodSHJ8uBr3BUf6qxSgK7g==
X-Received: by 2002:a05:6a21:6d9b:b0:366:14ac:8c6a with SMTP id
 adf61e73a8af0-36614ac8db5mr264873637.64.1764943141147; 
 Fri, 05 Dec 2025 05:59:01 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bf6a2745c43sm4855199a12.29.2025.12.05.05.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 05:59:00 -0800 (PST)
Message-ID: <aaae2ab1-04ec-4d42-afe4-7a2ed00ce903@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 19:28:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
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
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
 <20251204-qcs615-spin-2-v4-3-f5a00c5b663f@oss.qualcomm.com>
 <e8243a84-a7bd-4087-87d7-2795d6bc7595@kernel.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <e8243a84-a7bd-4087-87d7-2795d6bc7595@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=6932e526 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fzXiC-7nnnm7XjcqKBIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: AtIWbh6et5rco-j1Ce0RJXdlkwmcP0sw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5OSBTYWx0ZWRfX9IO/XTZfCMyF
 0ttQzgNRw8XNFtw42jM7WsXc8I9LSIvdA47GzMR8AtQDdUHFoIEhz/49QC/+z885NI3iyE5dI3V
 SbSX2FIbVNd08/qxcIi3TOvGjGiEXht7XHlg0yhwG7/YRv0hYg1Vb3OtDPsVrTgbxt5qGWm9Pxl
 dBuZU2iBOuyWDg/VA93WohN/7z+ZzYPzQ4wYVPnTdP2xCNwB2Di7/YUOz8f/KIKUKaKygGgTpWB
 2nfXKAgezxKrMn728BRdIirWpbIM4lmF2/znXTkwTgN9T5cF6TqgHU7LmziroVPRIvZUytEao7v
 jl/VyYvzt467/9G2bOn32KiXoTqdnEBvz+C+XWbFOgV+GR3X4mbcHHrhiaBGjx7ztUu6qaIlNzx
 EEn+yld4BdMU2lEymovzbHNSUvWn/g==
X-Proofpoint-ORIG-GUID: AtIWbh6et5rco-j1Ce0RJXdlkwmcP0sw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_05,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050099
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

On 12/4/2025 9:04 PM, Krzysztof Kozlowski wrote:
> On 04/12/2025 14:21, Akhil P Oommen wrote:
>>  
>>    clocks:
>> -    minItems: 2
>> +    minItems: 1
>>      maxItems: 7
>>  
>>    clock-names:
>> -    minItems: 2
>> +    minItems: 1
>>      maxItems: 7
>>  
>>    reg:
>> @@ -388,6 +388,32 @@ allOf:
>>          - clocks
>>          - clock-names
>>  
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
>> +        reg-names:
>> +          minItems: 1
>> +          items:
>> +            - const: kgsl_3d0_reg_memory
>> +            - const: cx_mem
>> +            - const: cx_dbgc
> 
> The patch overall gets better, thanks, but I think I asked about this
> already - why you don't have the list strict? I don't see reason for
> making list flexible and I don't see the explanation in the commit msg.
> Either this should be fixed-size (so minItems: 3 and same for reg:) or
> you should document reasons WHY in the commit msg. Otherwise next time I
> will ask the same. :(

TBH, I was just following the convention I saw for the other entries
here. We can make it more strict. But I am curious, in which case are
num reg ranges flexible usually?

Just to confirm, we should add this here for adreno-612.0:

reg:
  minItems: 3
  maxItems: 3

reg-names:
  minItems: 3
  items:
    - const: kgsl_3d0_reg_memory
    - const: cx_mem
    - const: cx_dbgc

-Akhil>
> 
> Best regards,
> Krzysztof

