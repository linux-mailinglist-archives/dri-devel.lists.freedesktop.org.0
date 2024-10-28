Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E679B2D09
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F4910E467;
	Mon, 28 Oct 2024 10:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUlXvH7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC4110E46C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:39:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SAXMET020701
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IvU7ZlrjHkB3EzPLVjXtJ5AQLhmlFJL/Cm51xZ+jJsU=; b=kUlXvH7ROgF8wWpO
 BLdgBIYYnFUd5HTp+kThsGnuyDXxXxavDPKSyGEh9/btwaKgZEOyw3GTHsGsMIrE
 qzumdr8gDR5BdMZqg39AiF4gaz7mkJmJ7xvck4zxltVHmIaktSSmgvRoQs10YqsR
 ikOt5aOBMYoc+hIqATR9RJZMNcd5IG/5KuNmUqYbw6Mp4jgn/hUlRsz3caQ2WjHT
 D7sRKonzvDJaTCKjRVtoFrCqB6Oh+ixRlZH1oi2nO3v0NmNuPEkAjFEKq5SK7GVa
 vnHGRHvxUqVTEsdJzZ3f2gsBFW4kLnVKjba+/uDzpqd2cMneRkY5Js2wUiA6sQVZ
 EdefOg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gskjvf4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:39:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6cbd0a3f253so10961336d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730111959; x=1730716759;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvU7ZlrjHkB3EzPLVjXtJ5AQLhmlFJL/Cm51xZ+jJsU=;
 b=wzQ5da7HDJif44NHn7JlHSwcvDnCRzWn77SJ458XB/s/AV2e5bp2d8v0KCclwKkFtF
 VmosA/JPenO3pk39eG4IEwJMgwiUtnFX8jCh0/N/K+eSbb/vq+r7kL00tPXNHMFT6t41
 616gCL28S4sA5756wN7eW4kjctQ6u6FIjahnCl9ES2rvWTK41Q29lUM6n69u58jItXCL
 hUsHdbfQHWEHHUSVeywRidxFahyGPsNS+4lnXg7gS0PVOK5pjG87D50fjLiBu9Dg7jbm
 ZMN49YQLjpJpj4vf57sfLqOH3QG45+Fs+LXROdrK2TVPdxnIiLYIp9OQToX+NCV48nNB
 402Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf1pOV2jwM7pIy8oJKJgXKB8qDOt2hBPQWG9hMkxauM9Oggloy/a482bKAzWcN/rLSr6gxGJSut1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUlBEZT2sQtwzSYTlutQ399VPl6wa6dlVqEVmDIBQcxoIjCGJ9
 CWsS0VUeaBWUghbxSK7zaNvyb6Ej3fQxQNjZQK6Sf2dulfUtJOXA1s1ZdjFdl9QJvnXy+idWGOi
 8+7wA3tCqq6mlZ5SLeHdQJr0rj8N/NOOIFGjP9sDPbA7Kr8Fpmf2H7L27sCbHm9SaSuw=
X-Received: by 2002:ad4:5c6f:0:b0:6cb:f0f2:f56c with SMTP id
 6a1803df08f44-6d1856943c8mr65408906d6.6.1730111959501; 
 Mon, 28 Oct 2024 03:39:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuXnJ9QctQQKnrr1B9d6Pnh3CdOC3tp1NlBtHDTDJwYz+DKoHJwok6hm3fQ7kNKdJ+ruWTuQ==
X-Received: by 2002:ad4:5c6f:0:b0:6cb:f0f2:f56c with SMTP id
 6a1803df08f44-6d1856943c8mr65408636d6.6.1730111959225; 
 Mon, 28 Oct 2024 03:39:19 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3099ddb9sm369502766b.173.2024.10.28.03.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 03:39:18 -0700 (PDT)
Message-ID: <55ca17a3-8ea6-450e-8ec6-9bda97808164@oss.qualcomm.com>
Date: Mon, 28 Oct 2024 11:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Arnd Bergmann
 <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <3fb376b3-2db7-4730-a2e1-958f1ddd9f5c@app.fastmail.com>
 <6b7c2ae7-3210-4d57-a7b0-2efea594b2b9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b7c2ae7-3210-4d57-a7b0-2efea594b2b9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Yk6FeZNf8hNVIOkf6rmLsKhUriiyohZt
X-Proofpoint-ORIG-GUID: Yk6FeZNf8hNVIOkf6rmLsKhUriiyohZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280086
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

On 28.10.2024 10:52 AM, Akhil P Oommen wrote:
> On 10/28/2024 12:13 AM, Arnd Bergmann wrote:
>> On Sun, Oct 27, 2024, at 18:05, Akhil P Oommen wrote:
>>> Clang-19 and above sometimes end up with multiple copies of the large
>>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
>>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
>>> fill the structure, but these create another copy of the structure on
>>> the stack which gets copied to the first.
>>>
>>> If the functions get inlined, that busts the warning limit:
>>>
>>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size 
>>> (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' 
>>> [-Werror,-Wframe-larger-than]
>>>
>>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
>>> the stack. Also, use this opportunity to skip re-initializing this table
>>> to optimize gpu wake up latency.
>>>
>>> Cc: Arnd Bergmann <arnd@kernel.org>
>>
>> Please change this to "Reported-by:"
> 
> Sure.
> 
>>
>> The patch looks correct to me, just one idea for improvement.
>>
>>> b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> index 94b6c5cab6f4..b4a79f88ccf4 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
>>>  	struct completion pd_gate;
>>>
>>>  	struct qmp *qmp;
>>> +	struct a6xx_hfi_msg_bw_table *bw_table;
>>>  };
>>
>> I think the bw_table is better just embedded
>> in here rather than referenced as a pointer:
>>
> There are some low tier chipsets with relatively lower RAM size that
> doesn't require this table. So, dynamically allocating this here helps
> to save 640 bytes (minus the overhead of tracking).

I'd second this, said chipsets often ship with 1-2 GiB of RAM (which
is still a lot in comparison, but you know.. every little bit counts)

Konrad
