Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D83EC5CF71
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 12:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF20210E23E;
	Fri, 14 Nov 2025 11:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQ6QKvYN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BgjIOmVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D344910EA4B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 11:58:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8RRTu1424135
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 11:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GRBPuTN4gFHBJkftAyq/mOmIDHNhSyqYwsTcoxYmiII=; b=HQ6QKvYNoWqSK2sP
 /PBXAg78g+s2ZxJ/KSthVlkOY17b2ymCBtgWtOyLzXKET01KsSsOV6/uif8Ck4fk
 ZoXvgzi3pTNy1KuftGT+HpP3g7oCZUVrU/Geti8UI6VtCAMAeApGkUDxFGM3aIjy
 +1YUCWLxzH9DwwJpqmMuVlxgxH09jCWk5W4Eyl5KL+98xn4+jRx3g1bT3uTlaT58
 FXbq8ovnJGl+2e71eiLpLKUkxDXgTdQl+dNvYsitVeYlAHZAykEC3t8o7mFk2NPG
 VEy1uMG3ko5pLdZqryc2rCW0U4viKhfPLv4AMedDZx3WN+VW7hduMwp5jvWNKrRg
 rDxqlA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g21cs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 11:58:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34176460924so1862470a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763121508; x=1763726308;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GRBPuTN4gFHBJkftAyq/mOmIDHNhSyqYwsTcoxYmiII=;
 b=BgjIOmVzYBMo0sPYOU1GsdopxyKH3wG9h4DxLuN5XFZjBXaP/NFOvVvtwVvzK6CE/l
 TElxHBpOwqN3aT9kKCMFenYwD1r6Roqdv8QaG2msKzA1DnTqxJzpFbvOTMqPHeINsqia
 gUQbxsRYO/ziuLBxP8c1a+6PkZo8nk0bsM0EeOitg7Spad84ie6G54/7/WGzieLMq+Ie
 MCDo/npBvPxHAPXMvm7SIM1kN2XtOTM1/lu+//Aql2JtB5+cRV7nxSy+Pzy+1ggZVskH
 IXv9xH7L7y2rzkm98+h/CnNvNDfFgXTzjiaPr1sQGJ0Z+l0MdItZiGRVrls4pQV/Htg0
 wKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763121508; x=1763726308;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GRBPuTN4gFHBJkftAyq/mOmIDHNhSyqYwsTcoxYmiII=;
 b=kjCARLqo3roHm8POyirRQGCiEZ8OgvbbhZo2WdWDkWtW65jdP3z4MdTSbh+33tWXLk
 vGWrMk6a5XVx6nVyuC5akVhTvNKTbGcCdNWpy+oA1slKPHgeD8zg/cqdhAF7Cm4ooe8W
 +E5IEaTRp1ztHnOQaaKTVirqFlJ9mQoRWqAdw/LKve/2AjeSxQzM0F4D2FX+XT7VTRcF
 PRkpnouMdGpo1SxUL5bckKp+x+McwBe2ZgmZSiMXzpqIK7hxK2u/zRITRrZYToKVVzSC
 vxScy5G1GZuO8Kiet1Qv3bffFUI26njbBR5KPZOTyyeQs8GP23E8W8rjZj1bnMCRhUQD
 FGmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1UyBrji9dI7Dx9jYIx9UkRCjQOS1yWTU8IzSOM3jk6n1g2Rn/8W7hrblRn1oOXkMdWZEnFnLCjOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcL45xEI3Sesl0jWvZs5Zp8G6/kh2XWcNXZpCrF02HGv4gMrMi
 0Juv8QsvJp4N2vY8uOoam0eLm4hFKbdbOFgt8N01w+3TvkqsSC/w9v9YW1/TE2N+FRNhjoDOZK1
 Ti1JZB3CbVE3eVPTKhIw7J2NfKr9BDef4lyv2wLV65XZ78USvRXWpOL4ruWEXD1lsrdx4FbD57e
 wrFPY=
X-Gm-Gg: ASbGncuDWj9IKioG5ER59Owzdn57BvqKzE05IbNSGm0aYDWx1HisaSXd4qfKFHGa8wP
 3G2B4HjpVCY8iMBbJUOhLb+W2mbLy9q3/4P6HRK2ZnbFisouyZgQM8z0rZE0Gx7S+MZcK10cpxZ
 YlzUeh7b42bGrKcxZI3tjObn8Y2Ol9rmjdncAZxpnhnmfpmZHIkABH9JHK4qQH84SF2VJaTBXrj
 kTEPY5yPzTzb7oesUtrUF5tkQvgA0g0/inol2KqR2hVcubtsU8C7A9Ov2PMa9SIx+SGJLAWx+QO
 PYBJmK5grtvMBXHgIU02eeOd7fM6JZzFigpLrmfbVHXzvUdHyINHcEWlQm1SAhKVW4ZVPtL5Q5Q
 JoyDAniCnV3txID4R+Y4GI70=
X-Received: by 2002:a17:90b:5803:b0:343:653d:31c with SMTP id
 98e67ed59e1d1-343f9d901bemr2963718a91.5.1763121507767; 
 Fri, 14 Nov 2025 03:58:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFHpQSCtLNHukFVLbxrD8xU34y4COtLfmBvJC0TqavNqnfl88QPHSsjjzeWJeLQ2nAehx0+Q==
X-Received: by 2002:a17:90b:5803:b0:343:653d:31c with SMTP id
 98e67ed59e1d1-343f9d901bemr2963689a91.5.1763121507270; 
 Fri, 14 Nov 2025 03:58:27 -0800 (PST)
Received: from [192.168.1.8] ([106.222.229.203])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343eac93449sm2826717a91.3.2025.11.14.03.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 03:58:26 -0800 (PST)
Message-ID: <6ebe07ad-cbfe-47e2-99ee-06ad7670e699@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 17:28:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
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
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-2-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251110-wise-lurking-roadrunner-f0cec3@kuoka>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251110-wise-lurking-roadrunner-f0cec3@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69171964 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=UUXEStRZTiKyGgBwSCQbmw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PLUc99ambSscJNFV4OcA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5NSBTYWx0ZWRfXySwkH+pVffQX
 53NVMTGEXk2UswsR71V8vPk26/Szo/Y/sn4cpYF8oZ7/MduvNso9WCcohxqqyb6L/ooLimiR1pu
 S1PBtnicHbb41zqaHE67pi+A50AJ1uVbcWmxuwV+CjOPcutkr0hhBTszUd5CQA2PemViW1Ab9qD
 FjbWkuWphRMx0CVHk8BuwQvqsGwwdV9aSWHaL3BET/fzfLNMYAEeKOsNujupjV6miABTvnCK2zm
 QJ3iXwsA7xzj4LBjaLpZ1p1YflqXiJZxQlrNRc4yIikEh4h+C6pV13XaP38UPiJcV2lxzJh22H1
 X8fxDwB5Uek6uuIMoFmU0BlhtuvPxGvyTcUJgF1fzs9weuQTSV4WDyRdH1LKik7phDtbuAhuXPj
 lQ3xKBEbgpewlagpn4T1YqWjTkQZGQ==
X-Proofpoint-ORIG-GUID: -UKxzeWlSdERk1_XUyc1Sl4GnOKDFs7G
X-Proofpoint-GUID: -UKxzeWlSdERk1_XUyc1Sl4GnOKDFs7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140095
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

On 11/10/2025 1:18 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 07, 2025 at 02:20:07AM +0530, Akhil P Oommen wrote:
>> A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
>> which replaces GMU. But it doesn't do clock or voltage scaling. So we
>> need the gpu core clock in the GPU node along with the power domain to
>> do clock and voltage scaling from the kernel. Update the bindings to
>> describe this GPU.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/gpu.yaml       | 32 ++++++++++++++++++++--
>>  1 file changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> index 826aafdcc20b..a6bbc88e6a24 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> @@ -45,11 +45,11 @@ properties:
>>            - const: amd,imageon
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
>> @@ -387,6 +387,34 @@ allOf:
>>        required:
>>          - clocks
>>          - clock-names
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
>> +        reg:
>> +          items:
>> +            - description: GPU Reg memory
>> +
>> +        reg-names:
>> +          items:
>> +            - const: kgsl_3d0_reg_memory
> 
> What happened with the second entry? Please describe the hardware
> COMPLETELY (see writing bindings doc).

We can describe cx_mem and cx_dbgc too here. Then it matches the common
schema described at the top of this file. In that case, do we need to
re-describe it here or we can just remove both reg and reg-names
properties here?

-Akhil.

> 
> Best regards,
> Krzysztof
> 


