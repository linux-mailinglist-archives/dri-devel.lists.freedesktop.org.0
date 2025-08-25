Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8FCB34725
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 18:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A90D10E4FF;
	Mon, 25 Aug 2025 16:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0IsHYm8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2342610E4F7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 16:23:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFB2ba018258
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 16:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xT06D3RMtfKindU2hH6cWWUxy48f/VTeJ7LJts2PzLo=; b=l0IsHYm8ZLqNxwWE
 19BVYhwsOB2Nedq144wm1aq6qmdQ+p0aqo6p4khH405fJo81CQndAxNXAcAJLT8d
 J1CYwL8IjpN/SmwBjMpBQDD07bYCMeSG/28co0kPOm1Ks+4KyzutoKkBywZfkUsd
 /F30GNa8dbSYsJV5qmGlanc0UyTVMDqaSpJKtBjqMHI2/XFG1gohnlw3+MR6xkFe
 cqVGOc9Vk92JSW7ZTq9GYbV2k9ZVAK0PBMy0xncsqCo7JYFt/yH3DSQdbCXozRxr
 aM1LQw1gpcpAymzttOtRneJdP98+HikrKzte3OcHntAuCG8oGixOaR6olDyIOW59
 GGYEdg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x85rne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 16:23:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2461907278dso42356925ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 09:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756138994; x=1756743794;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xT06D3RMtfKindU2hH6cWWUxy48f/VTeJ7LJts2PzLo=;
 b=bxsDnmX8T9UPwg56d/zqmCGLmr147FCjHspkaBYxAhfDhD2WmoMc2hewZ/TZjJ8sRU
 TCTOzrp+Nu9/9uWbitgZMWjZb/Y+3bQVzTdQiRa+wIGhsRkVp0hmlGI+iPmW62SpWdTB
 zdssUUhba8oOxIGaISrWK/wTDqDa6mtF0j+X6W0S06tT08Fy5XNcrD2dYVFVrHJVm4+J
 MLAg4doUTXY6t4gtAMY5Y4ugTb3OWvQDXBNPPo1z30bbr96h/+KcAfQ1TQ0WTWLPUsS4
 bnthbj7xYUpDYQvc3l3u0NjYggOpoYh9Z2T2OI098tDQN4Q9/OPMj3MhrOzH6khVmhWz
 yqqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz/c7Dojd/Yz5i8txdC2yL5Axi92XU36+22lWJ2wyIrqt8b7+6qc625ckm5Hul+DvCiNgpagegyME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUT+7wDjlDy4qtsm/XdMK4t7m+winhhH/14oO7K6CEkcTq3m8S
 pz2tvgFlQdUPODowTmreLMbe8m6M+3SNbjACQSfqyonqBDDjFPFUMMPKliSiD8EtZI1R2cCvnAp
 qDkZhXziNiJuj/GhX+sjEV8uAshfsS9eR1cx+7Vof6fOJiA+Kfh4SWWQWckTvENvrMbGtCmk=
X-Gm-Gg: ASbGnctkcbMKxBiPo6gZPpPCbG78jVtZCqey0ByxprrqFkj6+EOzd8mF14A6TEqQyKe
 Lj9dmRudDqYcWIuAHxksy2IVXW6ezoJDi5CxqZxaqmtlPc5M4aH6Z5gSTCW1HZzfia85zRt37wk
 KFqpFXEAPJ/NJA0/cErIDvstm1MxWzjnv6dVV0aHkH9i1yhqthDrYBEvDtOxaGn21oOa3efjReb
 xerKvieC2QLY32Dx4RZhze3jYPE5cySy/bEYrLLcPFWbJ7cwpP6f5fdeHYMJYB0WYr59eteXUcU
 HdEropRoonEBK528OKNQEXc5ftx2WEZ9h0vTzKdsqC2w1MhxjqRh3cAII7imlg==
X-Received: by 2002:a17:903:2281:b0:23d:dd04:28e2 with SMTP id
 d9443c01a7336-2462ef4444fmr164017225ad.35.1756138993792; 
 Mon, 25 Aug 2025 09:23:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3DDyXq0HbIVkH89aU17F4O+BE4oPf252DFOqa7KvXWd8OP2tBXEimcEdWPIlxPlDOWeBx5A==
X-Received: by 2002:a17:903:2281:b0:23d:dd04:28e2 with SMTP id
 d9443c01a7336-2462ef4444fmr164016785ad.35.1756138993054; 
 Mon, 25 Aug 2025 09:23:13 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466885efc8sm72180705ad.90.2025.08.25.09.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 09:23:12 -0700 (PDT)
Message-ID: <5a405510-3eec-4262-9855-483dd589d8dc@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 21:53:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: fix race in Adreno header generation
To: rob.clark@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alex Robinson <alex@ironrobin.net>, lumag@kernel.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250823020919.9947-1-alex@ironrobin.net>
 <6sdzghcc4uynvmk6r4axpwgqlmgxqzi457ttedqlrql7f7lt47@glsrzu46a63x>
 <CACSVV01R=FPAErpfJJvESKig+Z8=amEkpf6QFnkXHhTjFsPf5g@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV01R=FPAErpfJJvESKig+Z8=amEkpf6QFnkXHhTjFsPf5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rjNt5DNdqugoXjkAWUB1Knd3A9BuFyVe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX6lcY64LIPNrB
 kDXNhl03a2qXLcB5OvnS6tggNF7ke9oVmKLK/NrDkTc2B67RnJq7o26n5Puz3orYNI1xApp6VNB
 vWXSThBftpGnjY3r50fn1nhk4RS/Gme8iH4LNXXuIZPqza3EkUioyw63kTpXJVJ9Kk38oeUX7+N
 RqHf6vGcMCCJhV3XW/lDeyi7KA8vXQU0l61bKtPYFb4kntO4lO386Q4IyGju8kksJhMYtHw+IZU
 b/vLy55k71kzJXdRgCytxGiDw9jaTW7NkcQ8b7yZyhzmTHAnGA4Y+Uzy46J7wJq4ebNqZlP1Yca
 9xhx1X1v+0BImXHuZMtLYYcUc955PriDn4fyGlAZzxkkmdMGq2lMHptPZyUYgdJvFNY26yrRVcR
 yGNIJXbA
X-Proofpoint-GUID: rjNt5DNdqugoXjkAWUB1Knd3A9BuFyVe
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac8df2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=foaXouvCAAAA:8
 a=qt1P906IrRIBMUR0lrMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=lBkOZJTZZNyIbKe29SIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

On 8/23/2025 7:46 PM, Rob Clark wrote:
> On Sat, Aug 23, 2025 at 6:49 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sat, Aug 23, 2025 at 02:09:39AM +0000, Alex Robinson wrote:
>>> Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
>>> before adreno_common.xml.h is generated in trees that generate Adreno
>>> headers at build time. Make msm-y depend on the generated headers,
>>> removing the race.
>>>
>>> Signed-off-by: Alex Robinson <alex@ironrobin.net>
>>> ---
>>>  drivers/gpu/drm/msm/Makefile | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>> index 0c0dfb25f01b..1a918d44ac48 100644
>>> --- a/drivers/gpu/drm/msm/Makefile
>>> +++ b/drivers/gpu/drm/msm/Makefile
>>> @@ -221,6 +221,7 @@ DISPLAY_HEADERS = \
>>>       generated/sfpb.xml.h
>>>
>>>  $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
>>> +$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
>>
>> I'd say, no. The idea was that msm-y should not depend on
>> ADRENO_HEADERS. If there is any dependency, please move it to adreno-y.
> 
> probably we should s/adreno/gpu/ and move all the msm_gpu*.* there..
> 
> In the mean time, I think we were going to drop this patch from the IFPC series

Yeah. I will drop that patch.

Btw, was my usage of adreno_gpu symbol in msm_gpu* files incorrect?

-Akhil

> 
> BR,
> -R
> 
>>>  $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
>>>
>>>  targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
>>> --
>>> 2.50.1
>>>
>>>
>>
>> --
>> With best wishes
>> Dmitry

