Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A52CAB1560
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 15:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614AD10EA45;
	Fri,  9 May 2025 13:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXmS5b2n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB0A10EA43
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 13:37:22 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BpL0q010664
 for <dri-devel@lists.freedesktop.org>; Fri, 9 May 2025 13:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iOOyMJiEKwo0E2wR4rThFjXKnQmgdnx4JZVsMPqv+MI=; b=EXmS5b2n/lmS2bQ4
 CW2Vr9rM/WGS5/AkIlhPpJWUy0r1vsBGPIco4kOoiAKRUcJt3Xuuogh9cSa03eBk
 jkoSun1dkKF94Y893RF9AX/sDMbhjToeY1r1EgLQU93dMeCYihv0wk+8dD06HooW
 BEkL4P4spVMQtYwGdVETFGPNtMMTmkl8hXaI5uZruaH9rhmoT6dgsjvCh1MxCWmJ
 13I+duS7m5+nslS5MJAvGx1volYuoG3PW6TUrecMMYqAXIPHcPOF/fc9DmDRBfX+
 tyPiUl/68csQvb2Z6kFb1lZBbVdF5s31Sl0Z4TKP1a97Ewys3tFgxgsWaXBCRZNu
 2w3BlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmmtfs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 13:37:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c547ab8273so32285385a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 06:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746797840; x=1747402640;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iOOyMJiEKwo0E2wR4rThFjXKnQmgdnx4JZVsMPqv+MI=;
 b=FRZV1zCX1DqDPL5BUie6uNRU2N+9xwNjY/Dv2zrqZtrz46BshiwNZtEh3APt4l9aaE
 IuQQbz/eLgMJIu96gYcMH9fHN8l6oVuGPKAu9/9QWO1LrBnxGLwIDgGw07T/Lwyq7igY
 mrJb8u+4D+5t5xgdX2iK3W54NrVgkIVM8KNz7d8Vz2UG5GPuz2DfoEfF4Y9t9Ohx30di
 0274RPcQjy1qAB55FBel7E8/SM0cumKJ7SvIT31NyWHAGN2vjllmRDN4lv8BdlFpGdot
 ztqyMh4aFTJPSgXgaYp3ouz//qVKK3K4OKZSxBxH31om/s7/XvhBPSRqNfNVIZ6pO6gt
 WPgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZeKFhUFFUm1Erhz6UsgO6Sb3FZRaxIk0wyXkR3vFCuACeSPoDHaxJWF2NKtTgTtu96US7GetRQ9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/qpuUqgXp9+MKz+2S1b/mR8qLT/bP+QmCxwrTLweCyIY+xMCA
 2fNzPOcPPpghz3AEM4fR/89Efy9TjtaXoZfZRZTXsW4TvrjnF64LVDVZm5N3tACR9ZobC9765M0
 xzzn28hAX40u9aCt5VO6Jyn+ldJkTi91tmqS86Rf3/1cgBDpHTxDT56TNkMzqcDgkaKE=
X-Gm-Gg: ASbGncvHroEc7YSvjtYmp/NZqUI41NrxS/M+Huo5Ldv7NftNbypKXQ0tCdEMpJQdCy9
 VMEPbcw+bBGdpp1IzuVlpEb5lJKmK8hzjaVqwatHNbJpiDUmjdYwifsSGXk/VKHQuvQb9FSp8aN
 mzMP9gDvcI0d8+7UNH0M+IoaO5AxX5LUYEY+dcgCKnc01hX1aeUTEJCKl/sZIzMnzcuAWHyX9N5
 ccxmDTkalwKGbjz083n2L5dy3kaxRO1Qbd2MKcpf1HrIjIL2NZaKl+IKoNi0aui/Xjyw8KP5r/7
 dStgC4fHuxcoL/AHFV/Bz4oR3ZkMcaRU5czI0LObHkvRmPx+e87l8aAwyXm1Aldr95k=
X-Received: by 2002:a05:620a:bcc:b0:7ca:d396:11af with SMTP id
 af79cd13be357-7cd011520edmr199008485a.15.1746797840081; 
 Fri, 09 May 2025 06:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuHC/kx6/TH6m3sFD70X3TGhAwdHUaPhxaRjn4iosPvYhb5stgDjoSjqTnyk/F9Gh1p1qG5g==
X-Received: by 2002:a05:620a:bcc:b0:7ca:d396:11af with SMTP id
 af79cd13be357-7cd011520edmr199005285a.15.1746797839676; 
 Fri, 09 May 2025 06:37:19 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197c5b9csm150979366b.159.2025.05.09.06.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 06:37:19 -0700 (PDT)
Message-ID: <dedbfb2f-012a-404f-87d1-2f3cd04b0e74@oss.qualcomm.com>
Date: Fri, 9 May 2025 15:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
 <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681e0511 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sEJkFV_Ntms1zBwlKkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: OZN2rdxlWyg36UG4Ny72jre6hJZtEr9F
X-Proofpoint-GUID: OZN2rdxlWyg36UG4Ny72jre6hJZtEr9F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEzMyBTYWx0ZWRfX4ufLBQFWkbYK
 /4ViAT31dvLIux+Dy7As3wSDrMnJpld8MYHzYGT+VOTFgahlT4pI+9vCUIdJyo3FcaQ+9CuuPvZ
 ZybhvJmhEcpbZAw3Y1FZYkKuI9/PXtN7bZM6hyhJbNH2myNJ3AjzA0r26b2vYeUbgNcBRP4uMBL
 HqFpge9/ZZFqF/P+7wgFGY501htRaA2fTlAHwtcb/YcFnuWTcJ+GOIP+6847CBb9y7YZzOabVrJ
 oXqT8r6AmlIqLPzCygl7nFkYqXe/82sgU708cW9W2Aao6c9YK+NzEEsBsnUB8pGucYlbq2Nu8jq
 xZF55t3uiA68zNUN79uz0v4iH+AxvtXlZiJzXY3isum0cjfv66pOvR68M3sujEfmTrrBgS37B+L
 tRk5cxbiF6twS9vK83IzywZEaOZ3GZlEALnbSlFhCMFq7CiMv3RyQMxjk3u2vTXhehfTTx/W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=970 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090133
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

On 5/9/25 3:17 PM, Konrad Dybcio wrote:
> On 5/8/25 9:26 PM, Connor Abbott wrote:
>> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> On A663 (SA8775P) the value matches exactly.
>>>
>>> On A610, the value matches on SM6115, but is different on SM6125. That
>>> turns out not to be a problem, as the bits that differ aren't even
>>> interpreted.
>>
>> This is definitely going to break userspace, because the kernel
>> doesn't expose the UBWC version, instead exposing just the swizzle and
>> userspace expects that it sets the right value for older UBWC versions
>> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
>> It looks like the data for SM6125 is just wrong.
> 
> Oh that's sad.. I'll drop this commit

Wait uh, we have this data in the common config.. why would it break
userspace?

Konrad
