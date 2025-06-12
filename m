Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C74AD6EBE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 13:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C348810E777;
	Thu, 12 Jun 2025 11:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGRlwwLt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6AD10E777
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 11:16:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C8DjNk013459
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 11:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vpfX2NMeoo7UDS517K3UcKESErQZe/+g/3vF2bOfmOQ=; b=kGRlwwLtyi3yroLp
 vPcTrdIh6peGLvQwI3oLukBUag1AnQQzJTzFv5o+A6t9WdNSRrJjsNI5at3wiOjd
 uLxRB7QPEOVmypLuI0zx3FbFSzHqFtEg8ita12yT3ivdVNiKNPajb1W8LC5YNvdq
 3F1Ts3TxQWS4nIc6u7brkDlyp0Sod5YwZxmv4vUJXOTuveiDeLbd2bngNPQGfORP
 Uey8wAkryAzw5UvIoPaVZPan6wZWAt0W6ut0Rmp/9SWDfFuE114auelY8QVe8uc0
 Q4J/0hz2/12L36B1NXCTfg1K6Of3gkxtlLldIpRQ3j7Jnd9eqROIy6vhhWQu5hGP
 HWu5UA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnfwfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 11:16:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fad5f1e70fso17633616d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 04:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749726990; x=1750331790;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vpfX2NMeoo7UDS517K3UcKESErQZe/+g/3vF2bOfmOQ=;
 b=EEC4J8CiyBiV/10JXRX5n/OR8+g1TMqAmrsxV8XNFLP101UK6Jyzqz70mNin4zXrtq
 8twV8o4/be4XN8RP9umCUnMBB4lNiJ1ULJ/RpYS/LAb/fbEKqfgNJX6IQaiJ5XecduLF
 Jgpo81HV6XWA7mkCcGuwjd0gnVR61QQaXcWqdePJHEln4a+MGfT+gWHjmakXYSDkPBle
 lnNeeiZSXovAJxdLKdYSPc0+miFObZ5AOAMadifdjvomEwkq47XGzbakOqnhVYwWujN5
 sYzVRxZ14i+PKjRI7r7A0pD5NobhOdBNdbdoCDr9VD0SeqWWXRCOkuwZGOPBkUyog1Ci
 jTLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmdEbpQOGBvUZlVpalybkXEunThTqiiUVuOVOHFpHlUFYzjmhNyc5y26bzbJhy/ZrMRiVhTA1v1zA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGn5vC+/t1AzHxLV7lkmGVVf7OjU5v/omlg1Jdd+vHG9xCkjTY
 kGqkqbssI2HRnO88MJtZUD493MUomQcTNgddTs+gWy3G+sKStOKZBOLrLPgiSjCF0LrBaSOVQce
 VJY56pFPkB4VetpMKXNfbNtGaHHz7XN4+nA9WSIdv1lCQxA7PdljJaWW3AUNXkDMF5zyVqyY=
X-Gm-Gg: ASbGncuuN6iFdnizmn4kMal+5w74BhMxFpIrK5h5QtA5/VfRUsAgeA+zQSfi5LJ4ei3
 DuW+64QwsWGebwlFXSDogxp0Re+wFrUJh69p1q1OsYRkwveKJMJzWLxYqLgvPfPTQEMplKEYGI1
 vBpoO4G5wY6qkIlfvXCmYp8z3ohrp6u63l/9XActpDPX4ocpBva2eO8rm8mG3dD/re29B64FajM
 rzJpHWjci/Bb/px7nEPl4LMG50atHM/8E2uYGsLzNjrlV6LQ+r7QzrvSUOPWH9FDB3bbB0iysVP
 mm9RWQawvRr1FS5CUdYVUJN2TDzxKuhdfzMJg+ZiMGt8m4uR4A0a0mOtBFTCTppgAFuUKCm3AY+
 fvU97lVNBZW+aRQljPQUvAgpM
X-Received: by 2002:a05:6214:cc1:b0:6fa:cd9e:7fe1 with SMTP id
 6a1803df08f44-6fb3464a613mr35975636d6.24.1749726989967; 
 Thu, 12 Jun 2025 04:16:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHetYtA3HieDljs7UJWghv1brQVUM/Q0GTlBER+BwKf79FavNV1DFHrP4isixdHDMlhem16WQ==
X-Received: by 2002:a05:6214:cc1:b0:6fa:cd9e:7fe1 with SMTP id
 6a1803df08f44-6fb3464a613mr35975096d6.24.1749726989420; 
 Thu, 12 Jun 2025 04:16:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553ac1aa036sm77231e87.128.2025.06.12.04.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 04:16:27 -0700 (PDT)
Message-ID: <aaae04d2-8f1a-4aa2-8f02-9b46d5a35207@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 14:16:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
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
 <bddf894f-1d79-40b4-9f80-355746c122da@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <bddf894f-1d79-40b4-9f80-355746c122da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r1IcSsCevSejq9VUQROH7GR0g1ek3Wo0
X-Proofpoint-GUID: r1IcSsCevSejq9VUQROH7GR0g1ek3Wo0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA4NiBTYWx0ZWRfX1IuexZQ6eibi
 aJxAABcVxGXMRKr5PjKrdDCqRsz4NNTFrBOF5Z4jvO7+uDm722/EoYlkHX6sExdZLI1SaHs3XN1
 BNDnTPWk0WosK4lERSkbViib4eGaI6mHQ/AyQSttN2eMb6xezHDnYY7SntsVABSgCYUpAfupL7Y
 wo9SIgHsN1/f5JnEr7x+Mhd7JTCcd9gU0mynPMWH+gZ9J50LLg/SZzuFt9NzDWTPDMM3eYa1t98
 MhkaF3mPVyzj++h+eXXaBEaMZJMRi4TiQ2Bo6VkMsOZhMLVxfZBvm4p6d2x5aVwKlmjluaSTcmT
 Z1kzfwqqnuxBCj56ClYVB0ng1FLkIfVAa3Pp7XLJFMaW5Z2no41fjrVAFsv5bEr/n6dy++5tF6k
 94G8S9jp7CE7CZBeqDg6t8r393N74ppH5p3zbSHu6lfMNdAPNKCb05prs3DpLCVv3B480AJ/
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=684ab70f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=D513OUjRMiX1TR4FSfYA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120086
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

On 12/06/2025 08:13, Ekansh Gupta wrote:
> 
> 
> On 5/22/2025 5:39 PM, Dmitry Baryshkov wrote:
>> On Thu, 22 May 2025 at 07:54, Ekansh Gupta
>> <ekansh.gupta@oss.qualcomm.com> wrote:
>>>
>>>
>>> On 5/19/2025 6:59 PM, Dmitry Baryshkov wrote:
>>>> On Mon, May 19, 2025 at 04:36:13PM +0530, Ekansh Gupta wrote:
>>>>> On 5/19/2025 3:46 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
>>>>>>> Remote heap allocations are not organized in a maintainable manner,
>>>>>>> leading to potential issues with memory management. As the remote
>>>>>> Which issues? I think I have been asking this question previously.
>>>>>> Please expand the commit message here.
>>>>> This is mostly related to the memory clean-up and the other patch where
>>>>> unmap request was added, I'll try to pull more details about the issue
>>>>> scenario.
>>>> Thanks.
>>>>
>>>>>>> heap allocations are maintained in fl mmaps list, the allocations
>>>>>>> will go away if the audio daemon process is killed but there are
>>>>>> What is audio daemon process?
>>>>> As audio PD on DSP is static, there is HLOS process(audio daemon) required to
>>>>> attach to audio PD to fulfill it's memory and file operation requirements.
>>>>>
>>>>> This daemon can be thought of to be somewhat similar to rootPD(adsprpcd) or
>>>>> sensorsPD(sscrpcd) daemons. Although, there is a slight difference in case of audio
>>>>> daemon as it is required to take additional information and resources to audio PD
>>>>> while attaching.
>>>> I find it a little bit strange to see 'required' here, while we have
>>>> working audio setup on all up platforms up to and including SM8750
>>>> without any additional daemons. This is the primary reason for my
>>>> question: what is it, why is it necessary, when is it necessary, etc.
>>> This daemon is critical to facilitate dynamic loading and memory
>>> requirement for audio PD(running on DSP for audio processing). Even
>>> for audio testing on SM8750, I believe Alexey was enabling this daemon.
>> Could you please point out the daemon sources?
>>
>> As far as I remember, we didn't need it on any of the platforms up to
>> and including SM8650, that's why I'm asking.
> This source was used for testing audio use case on SM8750:
> https://github.com/quic/fastrpc/blob/development/src/adsprpcd.c
> 
> The use case tried by Alexey as per my knowledge is audio playback where dynamic
> loading was needed but he can give more details on the use case.

Okay.
You need to be more specific in the commit messages.

- It is a normal adsprpcd.
- It is only required for compressed audio playback.

> 
> He was observing failures and panic which got resolved after picking this patch series.

Which failures? Panic in which driver?

>>
>>> What is it?
>>> - HLOS process to attached to audio PD to fulfill the requirements that
>>> cannot be met by DSP alone(like file operations, memory etc.)
>>>
>>> Why is it necessary?
>>> - There are limitation on DSP for which the PD requirements needs to be
>>> taken to HLOS. For example, DSP does not have it's own file system, so
>>> any file operation request it PD(say for dynamic loading) needs to be
>>> taken to HLOS(using listener/reverse calls) and is fulfilled there.
>>> Similarly memory requirement is another example.
>>>
>>> When is it necessary?
>>> - When audio PD needs to perform any task that requires HLOS relying
>>> operations like dynamic loading etc.
>> This doesn't exactly answer the question. I can play and capture audio
>> on most of the platforms that I tested without using extra daemon. So,
>> when is it necessary?
> For use case details, I'll let Alexey comment here.
> 
> The daemons major requirement is to facilitate any dynamic loading or memory
> requirements from DSP audio PD. The daemons are already supported for
> different types of static PDs to facilitate these requirements(fops and memory).

So... compressed audio only or a normal playback / capture too?

> 
>>
> 


-- 
With best wishes
Dmitry
