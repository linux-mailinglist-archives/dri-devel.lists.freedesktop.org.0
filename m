Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63232ADB755
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 18:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB0E10E3DC;
	Mon, 16 Jun 2025 16:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5Xd7REY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA1B10E3B7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 16:48:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G97v2W022182
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 16:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lxyeOcoLjC3T2xwCWZvRjoeExdTH0SjUCC/Y0ERYeNQ=; b=d5Xd7REYM3S9gnS5
 n7bYGFpFbiw+1+kJ2EqZbnWEMgfB2xuele5T5Pwm9aKsDRA78/EKtOy0F2QNTYzT
 KJvLT7ey6fAz3mjnpAWR432o8QADvN+IEnRwpM9Yj6bc0Ge8sjvzz0ZWiAwbFZTq
 nSepVk6eUNbh2ajDno4AWOc80XhTQlCWJcNa+Xm0CfPGPAoe58ojfQ9t2H2KbETZ
 z7mYYqFgR+aN0ahVuhbD8tNmbaw4ythr6pL1F0kGDSq4MFutDxLYRwjZC/QWS+ot
 Q/wBmVMGl0R5Qzntex2p8lKoFoNZds64/OuZsZjde6FVoaFAvIo75Ja0bP5wgTr2
 Mlo+Yg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcw9hx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 16:48:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b26e73d375aso5060798a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750092512; x=1750697312;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lxyeOcoLjC3T2xwCWZvRjoeExdTH0SjUCC/Y0ERYeNQ=;
 b=VoFzvISLQETIodnWAsuzRWhlO0xpZl7a4fLyhpCQQ7a+jfyhVBd+WZrcRRbt7HslRe
 qe/ZfwRByJzOYDNBRGgk3AVmPGd/qw1vqbutwN/2pqF06RO7l+B8OEHvpuWXfg8oQx5o
 lh2KS2X84KQYFBs4864MUHpm685Vdld4zFtpgfGpKqlsRH7wRmTAaqP7CYqTahPg1R3p
 TN7N00zw4IAYsDB52ph5ByIPydRADfdbtiuHto4OCEXOVjxr0sC3oZK3tCEfYdySKFVq
 awtRvOeubXNyNbZxrAx2jFCK5IjvzZ/EoR1S7iK3EZPfHHWf0uFjqhN7r3vAac6k9uZ6
 tAPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7mNJg+jxyF7UiuzptsM8vkXJnmng7n/4StSu0CCNlASBlhc6cjGnjj6hVoGT8y/aFKrbFykBTc5U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNdTi4OSvnlWFOWDjAd0NEDd+f8ws79yXHHXiZLHrUPBn3FQ3n
 bxT76eOM6BRnRho7s4LopVX1ZaruDYp18NXDELj6JwX3nA5K0nNSxCKvGokHZoQuNt9P9mcas0y
 R/IxRf0WyoOsvCvw4An0FToJdeNsrj4w9wSB9/C5J/KVNUI7RO8m3LCmbNAxSXe0iR2nMj+c=
X-Gm-Gg: ASbGncuNtehWB8EU69hjlqEXsr9bQzApFy5yLBnC7GDakhnu/GfDID1jRRhqm+9PgzD
 oDtUodzHXpXR26H0pjVR4o/ysXLIO4kxt9UFWo/VKNcfOjhffYAkRsWVnFkekJH7ZqS1UlgFr2i
 cKxAXVtzdtcLoviEA+Y8J2sOBQwciozip+gTCtfxvHYDU9vDEo1Jdy1kBqf60sg2J2F5dLTtTYR
 zOIsi5/Jp5l1HMcksXUHPNdWMDlN7VA4sr+h+yrXnbLkrUmfaGqELMhW9M+01o51pjTQ36jXq9M
 Qz9VYD8suruqradndgWEJXc1qxVjuux4F8opG9f5Zw==
X-Received: by 2002:a05:6a21:318c:b0:215:d611:5d9b with SMTP id
 adf61e73a8af0-21fbd4bbd5fmr14908407637.12.1750092512617; 
 Mon, 16 Jun 2025 09:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiRsfJISsTnkxLW8qZGNZNt7p0Rfn9bVYWR0l8aBesdxG90+o4bb4c6x4zbi0HdUx7zVZcJw==
X-Received: by 2002:a05:6a21:318c:b0:215:d611:5d9b with SMTP id
 adf61e73a8af0-21fbd4bbd5fmr14908365637.12.1750092512245; 
 Mon, 16 Jun 2025 09:48:32 -0700 (PDT)
Received: from [10.206.104.82] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1680454sm6019135a12.37.2025.06.16.09.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 09:48:31 -0700 (PDT)
Message-ID: <31c50188-986a-44e8-8765-c1fce6ad3c2c@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 22:18:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <20250611-x1p-adreno-v2-1-5074907bebbd@oss.qualcomm.com>
 <492417fe-c086-4980-b108-0487bad08155@kernel.org>
 <d482653e-5c0e-4b03-98d6-2c898b445917@quicinc.com>
 <750da319-d25f-454d-b376-ebbc194e0e41@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <750da319-d25f-454d-b376-ebbc194e0e41@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDExMSBTYWx0ZWRfXzhbWf8oOlO9Q
 dK2+7UWFtHQHhW/pVSfOREH8n+D+b+NPsFjKgQib2MPBSmS8CSK65CZ9K4EzDqjO06v9FK6VnrV
 p2zucXum2wnzpqtOhA6CCPt/WZ5NdbkRQHpsZi9iiFFsFZ7PFsl7vvcADIQ8AeXYpOTYB35sKHg
 4w1oF+LnPNoygMym4INEeUYwnsUWgiPxxZjt3ynSrwQXXn/A8IRtWwll3Zx/YCJJkhFyu/HbVwn
 6809bnY9++wWxYkPXs02HddNubW/ha6fM0WynPZ/M2tLJd5VNu7o/zPTa4aHV61JaHEl4EXNIcn
 LSmUwh4JMoE5gdeLx7B7OmIjml0PQeSv+4iDXiHQQlmbii+Ewh8L24A4PvJiEnwIS8THBcK+NGZ
 mR9TJcbzWUjOU+t2SygIsZOVMzmLo3buwPmNq/auv4ktF2sdmx6YGKdz2TeLQPXF5Y60tL+u
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=68504ae1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=DDAlTcr3_WI9VELS8V8A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 5wKUBO9N1JG7koWeHD-xvfb-anntoxPW
X-Proofpoint-GUID: 5wKUBO9N1JG7koWeHD-xvfb-anntoxPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160111
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

On 6/12/2025 4:59 PM, Krzysztof Kozlowski wrote:
> On 11/06/2025 14:24, Akhil P Oommen wrote:
>>>>  
>>>>  patternProperties:
>>>> -  '^opp-[0-9]+$':
>>>> +  '^opp(-?[0-9]+)*$':
>>>
>>> Not correct regex. You allow "opp", "opp1" and all other unusual
>>> variants. Commit does not explain what problem you are solving, so I
>>> have no clue what you want here, but for sure opp1 is wrong.
>>
>> Just to confirm, would this be fine for the requirement I mentioned above?
>>
>> "'^opp(-[0-9]+)*$'"
> 
> No, You did not solve half of the problems - still allows "opp" and
> commit msg does not explain why "opp" is now correct. Describe the
> actual problem and then write the regex solving it in specific way, not
> causing other effects.

Gotcha. If we want to be super strict, the regex should be:
^opp(-[0-9]+){1,2}$

I will send out a new patch.

-Akhil

> 
> Best regards,
> Krzysztof

