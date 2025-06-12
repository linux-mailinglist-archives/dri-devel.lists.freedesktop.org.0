Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DCBAD6722
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 07:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAB210E426;
	Thu, 12 Jun 2025 05:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVCFa8JV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E25510E188
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 05:13:17 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BJS4dn013459
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 05:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1lC3cVEoQcxNvatUTeyjfk2aP6374UG+DUEkG65Q0kk=; b=aVCFa8JVo4vpIqjI
 +ptHGYONiPd8QWh/nrWC7WNEx7oWP86767iR0i5usJEb5FCgR77tpokOcjO5EZwc
 S528npqsHFrG9JyI+Gudgv8IaNwbyCGHlaWGU9yCVorfbCweWFJHJXcp9N/bAvLN
 AyiDaNi6fJNT3nESoed/5fic+oTaEpJfeYkt1gH/J1O/DL5uQbfTldgH7MiKqZvp
 go7GkPlBKwPfihZ98zcou0+xJnPqiif1HuEkkoPH/+raAl71mrIPRYF0Q2EklsNt
 pli0icYgvngoTnOiwIyQyRUP29YM/NCYo4h/aa0QtvM9aonyc4j4Useo1SCBLAmh
 91xEgA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnewqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 05:13:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-313c3915345so321030a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 22:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749705196; x=1750309996;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1lC3cVEoQcxNvatUTeyjfk2aP6374UG+DUEkG65Q0kk=;
 b=hM/f7CLpuMGYPpwLcA8MzxfqfIC44IYQLWgp269rdwsiMuXW4yS2LCoS6imXBwQCrr
 Fj2zCCImasQHcoJo9IM6/VISFy2/XY5J1JfvClUMR8hUzMGPihTRPjznKgCeqc2ifO3D
 LMwslNJcbVYeOtV6qW6KYZM14NUoOJopQD+AeiTvrxT3VsjKUvtAxcvP706z2BRZv96l
 5+BnkwYXI5icS6hUanrb2iiAsEBztDneZFn+PzA64ZL9EmnLcLKGZXWrxhHDCjm3fyy5
 ZPUCj5KvdT4yXNCxlrwcLsSYG0myZV8CpwmcAXFvqce5tsGu80Vwk7+NZIueDBefWV75
 ga8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3phK9pdGLvUaL1dt9Ax21M6HH7+kU1tldNmcM2Dd4RfLo0CuJY/i/TeSGDs61ssYpars663Q+MdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYE+AYDPOrbVOnP5lt8PMij9R1EmZRZIwPj3rgI/13QsusCXKt
 UEx9Inv1W+nPxMWwaO8TklMcINkjJmLvThofABQPs8qXcYgjT7Tsmv5WDuMcKrd1WzuIHj0xPzu
 5br7/m+uHjgaZ/4zIWghDJ5g/zhBSty+C8NBnaRrMTuTBlRc3/UyjbvDnECJp6DMnDqIlqyQ=
X-Gm-Gg: ASbGnctgTz5wJBZ4CPiPNy3NHpNsfiOpId4RXO+/VtAvZWw73q1u/vZhHX6ilmUbeWN
 o2Jhf2Ljn9pHuR5Ea7YEqS7PfvgOBb45Oq3UGBjHp92CJyW6p8C+UtFirR9b/lkps/XMZ6LtIHp
 cgs2QtcBl5Lf0kpHc9osSnCpsqCr+AGJEfNAO4qtGO3d/IWur7nPIq84IwCqW1/5xJqCI6ypjC1
 as1ltGVWkp/82Yc0gdQlAKdT6+7xNHU9PUe1KqSEFavqnKazb5D8FHNN+uo2rx2xMnmplTvYEC/
 piTz7UJBUbx7tqxoxzIfBKPoiQJd64kRxtUJD4/uTrzB/xbfHg==
X-Received: by 2002:a17:90b:2809:b0:311:fde5:e224 with SMTP id
 98e67ed59e1d1-313af0fd089mr8091541a91.6.1749705195650; 
 Wed, 11 Jun 2025 22:13:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1bK56y6k1szVtCGd+SXYPm0N0jNBv5QJB06pbBZ5EvZgyb11nn1NshdVMobYFtpZz060AhQ==
X-Received: by 2002:a17:90b:2809:b0:311:fde5:e224 with SMTP id
 98e67ed59e1d1-313af0fd089mr8091513a91.6.1749705195117; 
 Wed, 11 Jun 2025 22:13:15 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1c5fd94sm595529a91.36.2025.06.11.22.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 22:13:14 -0700 (PDT)
Message-ID: <bddf894f-1d79-40b4-9f80-355746c122da@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 10:43:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org,
 Alexey Klimov <alexey.klimov@linaro.org>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
 <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
 <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com>
 <tdae3jb7zbkbzvk546j5jnxnfkeux2bwrbz3i5gsehecj65n7v@2hseuptlk2a2>
 <999d2ca0-b3d3-4fa2-b131-092bef4951c8@oss.qualcomm.com>
 <CAO9ioeUW=v_CBUchJEt3PArbzBbUgznFO8TK-j=2yUkv8S1Baw@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUW=v_CBUchJEt3PArbzBbUgznFO8TK-j=2yUkv8S1Baw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yHvJ6Ru1LWfchK8PT23GZ5FQUhIr8SUF
X-Proofpoint-GUID: yHvJ6Ru1LWfchK8PT23GZ5FQUhIr8SUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAzNyBTYWx0ZWRfX3evl+4tjeM7S
 qfpccvMUI7N+lnC9wUvOfU0B2SkrQn+CdJj8ozmCDpsMQQqHpQp03YS1B1JCcEe9JjGumkwHPQi
 nk6g6w2iE0EgD4wPreoqrlSOze6OSRxT9Qc/i71RksKVx1oOm4Ognb61yKU7SePSbAEMvzK/8C/
 o0Fy2TYUC8XRIWtZ/H80Hph2e6Ay0ggi4LiopDosACNo5usVMj6FydwPT8IGQoakTTIIXU45yYG
 +iY0QrorxW8mu2diU9/6MzxnGszOg4wD1zm52QfBlbh3gnz24igfuLSdPOBe+X1kPW8W8swZAPt
 laIy0WYhB+s8tPtd7CpFKcWN1FPcuZZ4KP7wKarBGJHrz84/kCxufDaDD/jRmPZHX39huUA6WR+
 kQEOGwFs9kC3yrLNfEyKzVPpC8Hut8XXLTiRN8pNpuEmOhUsyhIiAlD8oo+EP8dqQaZIVUln
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=684a61ec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=K0J_JDHuODgj2xVFbuMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120037
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



On 5/22/2025 5:39 PM, Dmitry Baryshkov wrote:
> On Thu, 22 May 2025 at 07:54, Ekansh Gupta
> <ekansh.gupta@oss.qualcomm.com> wrote:
>>
>>
>> On 5/19/2025 6:59 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 19, 2025 at 04:36:13PM +0530, Ekansh Gupta wrote:
>>>> On 5/19/2025 3:46 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
>>>>>> Remote heap allocations are not organized in a maintainable manner,
>>>>>> leading to potential issues with memory management. As the remote
>>>>> Which issues? I think I have been asking this question previously.
>>>>> Please expand the commit message here.
>>>> This is mostly related to the memory clean-up and the other patch where
>>>> unmap request was added, I'll try to pull more details about the issue
>>>> scenario.
>>> Thanks.
>>>
>>>>>> heap allocations are maintained in fl mmaps list, the allocations
>>>>>> will go away if the audio daemon process is killed but there are
>>>>> What is audio daemon process?
>>>> As audio PD on DSP is static, there is HLOS process(audio daemon) required to
>>>> attach to audio PD to fulfill it's memory and file operation requirements.
>>>>
>>>> This daemon can be thought of to be somewhat similar to rootPD(adsprpcd) or
>>>> sensorsPD(sscrpcd) daemons. Although, there is a slight difference in case of audio
>>>> daemon as it is required to take additional information and resources to audio PD
>>>> while attaching.
>>> I find it a little bit strange to see 'required' here, while we have
>>> working audio setup on all up platforms up to and including SM8750
>>> without any additional daemons. This is the primary reason for my
>>> question: what is it, why is it necessary, when is it necessary, etc.
>> This daemon is critical to facilitate dynamic loading and memory
>> requirement for audio PD(running on DSP for audio processing). Even
>> for audio testing on SM8750, I believe Alexey was enabling this daemon.
> Could you please point out the daemon sources?
>
> As far as I remember, we didn't need it on any of the platforms up to
> and including SM8650, that's why I'm asking.
This source was used for testing audio use case on SM8750:
https://github.com/quic/fastrpc/blob/development/src/adsprpcd.c

The use case tried by Alexey as per my knowledge is audio playback where dynamic
loading was needed but he can give more details on the use case.

He was observing failures and panic which got resolved after picking this patch series.
>
>> What is it?
>> - HLOS process to attached to audio PD to fulfill the requirements that
>> cannot be met by DSP alone(like file operations, memory etc.)
>>
>> Why is it necessary?
>> - There are limitation on DSP for which the PD requirements needs to be
>> taken to HLOS. For example, DSP does not have it's own file system, so
>> any file operation request it PD(say for dynamic loading) needs to be
>> taken to HLOS(using listener/reverse calls) and is fulfilled there.
>> Similarly memory requirement is another example.
>>
>> When is it necessary?
>> - When audio PD needs to perform any task that requires HLOS relying
>> operations like dynamic loading etc.
> This doesn't exactly answer the question. I can play and capture audio
> on most of the platforms that I tested without using extra daemon. So,
> when is it necessary?
For use case details, I'll let Alexey comment here.

The daemons major requirement is to facilitate any dynamic loading or memory
requirements from DSP audio PD. The daemons are already supported for
different types of static PDs to facilitate these requirements(fops and memory).

>

