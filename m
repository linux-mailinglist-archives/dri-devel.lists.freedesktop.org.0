Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78D99D66C0
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 01:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D0A10E44F;
	Sat, 23 Nov 2024 00:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="djwadoRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4526C10E1E3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 00:19:43 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AN0JZ0S023103
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 00:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xrWWeSVsA8o5gUZSnPUFBeaGhEjYRvTTPyQTwcDpYmg=; b=djwadoRiZsTk8XFL
 Zo+wunlm2QPYNJT5HisVogu610qeXDDgmCf4/GGNdwTXoe27lZUy7T80b8zyYDVD
 MBJdtPQNPxI7DlGOPl2VLObezPvBfgaTfx2CliEzZe6osU/fjfpa4/jwmw1BZ+Vz
 HvLep5R1DFGRqs2wbhb/jhK9p8ZD1s+w13x4zNC3WTP0Cykhdt75N6XxQ5wOTwz4
 IRNo7ZJdpNzEGFzIueZbI0okU3dZJUf9ub3Qoc1RVxeV3KdfRN6e6sMOXl61H6zY
 FUm3p5urONnd3l8Hmiqq+GaiT37GZvFk3aARquWCNbVa/aEwqga2IF7Of7pN+INy
 viSBUw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334dmr00f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 00:19:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6d41c6c7bc1so7315506d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732321181; x=1732925981;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xrWWeSVsA8o5gUZSnPUFBeaGhEjYRvTTPyQTwcDpYmg=;
 b=eXe8V55dFU+qrQvzkj6Zb/7kdAeU9rjXIfB/TmNV/XUYl5l2mtvj0UITwk5VTbtiuR
 rvnCExSYVEtRl4SbInlFrFW8z1SrxSu7jJC+GMX6HtwBeo1yDmyWNTb0z56jHi8IbXEX
 1kgIyOa1JhSCH0kkwVZn9idw12BQEz/Jv79fDWt4vZOOp76aNjjT5b5yqwuVZ+qQDcwA
 6zoJZs65Eyua3V+0DTkXm8IVm5XjskGbEWVOA7x9pFhrRXKRMOhLQY/45oSs9Dt5Dvcz
 lO7LoT08DDMYvK1QpTdbeXzyc3Pzwtjf6v2tUMPEiAxxM4j1ALUt6rfKCUxB5K1CSJYL
 nuOw==
X-Gm-Message-State: AOJu0YxqLp2ZHTBuw3Jl0G+RDz5txAuV2g38Tg2PCJpG+3a78+QASTLE
 zYV11rthGx4N6/cUbYt2EGZeiN9QMNCnC/H+Jmli77LZU1Lr7enQ8479N95sg1vSciiMYImMctu
 IpMu1cfyM33ocZsHdwmUexItcx+h4ZJ425XESIJcdtPI3+KGIch/p2Ys/CQeox6kiN84=
X-Gm-Gg: ASbGncvJUKKd5jz6UrgVWfHAoZ75CW0oNuFR2RV7ZYPcHGaq8T648YccWd+9Zgus4sF
 MCdKILUIdZtELXbSbf2AoeIiooi2W00dOLkzyrYEXwlFgE21NOVTE938fFhycHCCFHLSA0e9y78
 z9IEx0rct9DTpcPCR6c2ErguSrnFUi5Qw9YOA6pzlpu2uyEJ+nBLB35s2cvfgG8QqGewPfTT5/H
 s4p01vWZyfQImH2XXw1fZNDtLILm1lUKjmH+V8V7awcFHzAF9+d7+GQTh4LOH6fyd2GEjHWfWdn
 E6VZM0heD/1fE6+c2pdmtWwe5N2QVX4=
X-Received: by 2002:a05:620a:271b:b0:7a9:a632:df3c with SMTP id
 af79cd13be357-7b51457fad7mr307973385a.14.1732321181009; 
 Fri, 22 Nov 2024 16:19:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGqI1WQQpUf2crWgNFFZ+pnTknQHdikQ7GCgw8JwewpNtBbLTat7WrGjpS3Ex4P+Irr7Yh0Q==
X-Received: by 2002:a05:620a:271b:b0:7a9:a632:df3c with SMTP id
 af79cd13be357-7b51457fad7mr307971885a.14.1732321180610; 
 Fri, 22 Nov 2024 16:19:40 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3c0458sm1414240a12.45.2024.11.22.16.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 16:19:40 -0800 (PST)
Message-ID: <5ff5d720-ccf7-42ee-9a4b-90cc168a4b7b@oss.qualcomm.com>
Date: Sat, 23 Nov 2024 01:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20241121164858.457921-1-robdclark@gmail.com>
 <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
 <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RC5kzID0btkxYdvHDL2SSx4OkQMbr8vs
X-Proofpoint-ORIG-GUID: RC5kzID0btkxYdvHDL2SSx4OkQMbr8vs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxlogscore=660 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411230001
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

On 22.11.2024 4:51 PM, Rob Clark wrote:
> On Fri, Nov 22, 2024 at 4:21 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 21.11.2024 5:48 PM, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Debugging incorrect UAPI usage tends to be a bit painful, so add a
>>> helper macro to make it easier to add debug logging which can be enabled
>>> at runtime via drm.debug.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>
>> [...]
>>
>>> +/* Helper for returning a UABI error with optional logging which can make
>>> + * it easier for userspace to understand what it is doing wrong.
>>> + */
>>> +#define UERR(err, drm, fmt, ...) \
>>> +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); })
>>> +
>>>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>
>> I'm generally not a fan of adding driver-specific debug prints..
>>
>> Maybe that's something that could be pushed to the drm-common layer
>> or even deeper down the stack?
> 
> Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
> just #define UERR() to be a wrapper for it, since line length/wrapping
> tends to be a bit of a challenge.  And I have a fairly substantial
> patch stack on top of this adding sparse/vm_bind support.  (Debugging
> that was actually the motivation for this patch.)

Alright, let's not get in the way then

> I noticed that xe has something similar, but slightly different shape,
> in the form of XE_IOCTL_DBG().. but that kinda just moves the line
> length problem into the if() conditional.  (And doesn't provide the
> benefit of being able to display the incorrect param.)

Maybe rust comes one day and the lines will start growing vertically ;)

Konrad
