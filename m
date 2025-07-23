Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F50B0EE53
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 11:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C9710E119;
	Wed, 23 Jul 2025 09:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCY8O4jQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BA510E119
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 09:24:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N8nuGE030488
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 09:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4+wq30tYrS+hasxmkNFAkgFt+v2Bn03QvpeOwwRgrrc=; b=GCY8O4jQ5lKWecVN
 j7nkCPQ6+HK9KWWJ7KVC4kGOZcCj44hO+hKh5nTLB/RUtqqlxH8QIbS9+Rpj44v2
 NLdBg/zr4jHrbihqcreqR2Vqwk3zxnIfswDUS+pQcNeK4pKerSXKGjtRhFZ32zCq
 5jUlj26OAIQYCrYv+qs1afF9jKJH3X1JJyH9KLk0xjyX5kqbCJ4zF6kB/KFUU8kt
 ni/zRJNaAGHOOtL6u/T/7bqDynoFu6Y5Cfo00Ewp87l4Eygory76eMwHudp1TVdy
 WmnZA/OqDqgEdqOh7D0BhuvDN7KT4YzQaPZOOPoF7Nimma5nfGcuYR1+QQi1o1J4
 yVIB3w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w2y1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 09:24:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-75e28bcec3bso3756471b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 02:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753262653; x=1753867453;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4+wq30tYrS+hasxmkNFAkgFt+v2Bn03QvpeOwwRgrrc=;
 b=hgDddW7M/ffTRRdwNTDnDGw2vaWKhnXq15Wyg3an7Y8fDFYqYVaLyy5Nr0rV+5I5Il
 29qzxykr2+iueyQDRLONH8SsAAuq1K397cd0r2E7qJ3rTEfNPYFmMMUFPG3pxaMzATPp
 FQpxM+G7bJPFj0yjO+/SVO8Hdv5BXM/nZYvI8H7AW49mxlfErFyHzzptLw+SMoMle+R2
 lOavvt1brQ4fJoRUv+lB5Ju/Stzv3Zlm3tQmv7bHdP6TZOus4rilot/HC14ojSiY9ikd
 h/HuUU+5+oRB1JfDDo0Xyz0Rl05eofTLKzcqu4nf9oJ9mC5C8GMiDKXN+r0AUQ5Rh3yQ
 kyvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc5zCaccO/PvJV7gkjyeggMnbGuvQxchATq3fydqizcfLKj+Io2pWxfFT9ORUcE4EQr8Tc2jYdd1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw12IaaN2EEXWE/f3cICISJHqfEgWc4E925PZl/Bx3TT29xMzjT
 7FlCvl9arEh/VZWKR/fRGs+Tug3kALunYFUoIgso2/sAfVwlShIv7CtV0o1aiHKrMBGH48/5axa
 fNrA2enLYR7IkQF6VfIT3zfeDDUaSxQzV5JlYrumuNp3CUljF6QbRY9UwDOJyDobDR1wrsBc=
X-Gm-Gg: ASbGncsfz/0sOkBsxpuJsThttowJ7aYWS83vcLJ0CVSK1zFvPfA0jfrD6Pp1qYZ/XYC
 JYQYyi1pCPOa4exECc53zaFrT4ORUqOkLGKyWRGy7aGSuDy/CoeaNACgLzZ+jZ9nSOzFa8DmrUw
 2owUiozZL+2weFsm0nYVtTXC42VxwJQn0W7YQiiIWVlR7+TEnowD3QUGSlT4UiVnoGHtoLPuikr
 5EHMs6feEvZozht+yCd2a8Cekf5+KrDh1/08JFkLhbmHcun2hePKvHZ8EqD9/+QFMu297dBeWqc
 TmltW4rSQai0oT0d6s5GrOU0VnAWDmyoidKNyGwy1Ib9KC8YVuRIenwWsXgJUCgpvLWjBkA=
X-Received: by 2002:a05:6a20:9147:b0:220:1af3:d98f with SMTP id
 adf61e73a8af0-23d491221d4mr3493431637.26.1753262653282; 
 Wed, 23 Jul 2025 02:24:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLdbjhjnYdkfyrjU5ffjGqKzviUX7fhzbfayZMX0Fs1jRE595puZVjT4iJO4hden7j7BS+zw==
X-Received: by 2002:a05:6a20:9147:b0:220:1af3:d98f with SMTP id
 adf61e73a8af0-23d491221d4mr3493411637.26.1753262652840; 
 Wed, 23 Jul 2025 02:24:12 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2feabe7bsm8441323a12.32.2025.07.23.02.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 02:24:12 -0700 (PDT)
Message-ID: <5af0c2ad-de58-4858-b94d-f7dfc6359e22@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 14:54:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
 <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
 <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
 <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
 <7505f0e8-222d-4052-8614-c12109d14bce@oss.qualcomm.com>
 <cq3qfx32dallivdcwjwqgq7kggiwucpcyhwqqlbrf6n4efkmuc@htjwnigojag2>
 <8b877eeb-941a-47c5-a67d-450dfb772d6e@oss.qualcomm.com>
 <lmytte3p2eq7fsjsbogzrqjyimlw42v2x2zystx32nuvnm62yb@wzqrmhqcrzl3>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <lmytte3p2eq7fsjsbogzrqjyimlw42v2x2zystx32nuvnm62yb@wzqrmhqcrzl3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=6880aa3e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=kN03k85zHqnGvZpLErYA:9 a=Zd2r3LNXiuh2AZG0:21 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 9jkK_gJRlHxcacnXN0Q7eB9JZokLUp1w
X-Proofpoint-ORIG-GUID: 9jkK_gJRlHxcacnXN0Q7eB9JZokLUp1w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA3OSBTYWx0ZWRfX17vylh51uuTv
 9DguWcmC2DE7GR/WIb9eZREOO9QjuFmzq3p1qow7Vf0Jb9eJsvV3l2sWcSa0JENkq+DpCyg8jpY
 m66EmaxY7BvdYeMzrtXg3rdHYvANtyovtjldlUN5vVOqJSmZ+ox6Ut10vqX9culrw+WwfDHPJ/6
 51LxS2X2XDHbeqSoiDo+m08rZLlXHqsaEf24xD4HgxgAuEnkfAJYOv3pqZ61V+qplHHr9jYwx5M
 Kn0vuwixUItsDFvikFSyBw6YmZelOJbV9H8IhAx9JTaMll6icjE9UKIzbUHyNf/X+TnX0/9uCA3
 G2hHTNM7WJSFDEVs2ogtYKHTOj85bgtyvDzprYiX9VNEB6er06QakZXIImqqzvlHK0rqR2UA4FV
 E1lTG9zepGWn2jhlU38+Nw/6ljYyKJvwXY62rTRBiBj+1oZjexqVuynW9qCqypb5mvXH10bP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1011 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230079
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



On 7/19/2025 3:14 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 09, 2025 at 11:13:49AM +0530, Ekansh Gupta wrote:
>>
>> On 6/12/2025 3:54 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jun 12, 2025 at 03:02:52PM +0530, Ekansh Gupta wrote:
>>>> On 6/12/2025 1:35 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Jun 12, 2025 at 10:50:10AM +0530, Ekansh Gupta wrote:
>>>>>> On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, 22 May 2025 at 08:01, Ekansh Gupta
>>>>>>> <ekansh.gupta@oss.qualcomm.com> wrote:
>>>>>>>> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
>>>>>>>>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
>>>>>>>>>>>> User request for remote heap allocation is supported using ioctl
>>>>>>>>>>>> interface but support for unmap is missing. This could result in
>>>>>>>>>>>> memory leak issues. Add unmap user request support for remote heap.
>>>>>>>>>>> Can this memory be in use by the remote proc?
>>>>>>>>>> Remote heap allocation request is only intended for audioPD. Other PDs
>>>>>>>>>> running on DSP are not intended to use this request.
>>>>>>>>> 'Intended'. That's fine. I asked a different question: _can_ it be in
>>>>>>>>> use? What happens if userspace by mistake tries to unmap memory too
>>>>>>>>> early? Or if it happens intentionally, at some specific time during
>>>>>>>>> work.
>>>>>>>> If the unmap is restricted to audio daemon, then the unmap will only
>>>>>>>> happen if the remoteproc is no longer using this memory.
>>>>>>>>
>>>>>>>> But without this restriction, yes it possible that some userspace process
>>>>>>>> calls unmap which tries to move the ownership back to HLOS which the
>>>>>>>> remoteproc is still using the memory. This might lead to memory access
>>>>>>>> problems.
>>>>>>> This needs to be fixed in the driver. We need to track which memory is
>>>>>>> being used by the remoteproc and unmap it once remoteproc stops using
>>>>>>> it, without additional userspace intervention.
>>>>>> If it's the audio daemon which is requesting for unmap then it basically means that
>>>>>> the remoteproc is no longer using the memory. Audio PD can request for both grow
>>>>>> and shrink operations for it's dedicated heap. The case of grow is already supported
>>>>>> from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
>>>>>> memory) is not yet available. This memory is more specific to audio PD rather than
>>>>>> complete remoteproc.
>>>>>>
>>>>>> If we have to control this completely from driver then I see a problem in freeing/unmapping
>>>>>> the memory when the PD is no longer using the memory.
>>>>> What happens if userspace requests to free the memory that is still in
>>>>> use by the PD
>>>> I understand your point, for this I was thinking to limit the unmap functionality to the process
>>>> that is already attached to audio PD on DSP, no other process will be able to map/unmap this
>>>> memory from userspace.
>>> Ugh... and what if the adsprpcd misbehaves?
>>>
>>>>> How does PD signal the memory is no longer in use?
>>>> PD makes a reverse fastrpc request[1] to unmap the memory when it is no longer used.
>>> I don't see how this can be made robust. I fear that the only way would
>>> be to unmap the memory only on audio PD restart / shutdown. Such
>>> requests should never leave the kernel.
>>>
>>> Moreover, the payload should not be trusted, however you don't validate
>>> the length that you've got from the remote side.
>> I was thinking of giving the entire reserved memory to audio PD when
>> init_create_static_process is called. This way, we can avoid any need to
>> support grow/free request from user process and the audio PD pool on
>> DSP will have sufficient memory support the use cases.
>>
>> This way the free can be moved to fastrpc_rpmsg_remove(When DSP
>> is shutting down) or during Audio PD restart(Static PD restart is not
>> yet supported, but clean-up can be done when PDR framework is
>> implemented in the future).
>>
>> Do you see any drawbacks with this design?
> I'm sorry for the delay in responding to your email.
>
> I think this is a perfect idea. Can we be sure that there will be no
> extra requests from the DSP?
Thanks for the review!

With the existing design, maximum available memory from reserved_memory section
can be allocated and after that it the requests are expected to fail.

With the proposed design, as the entire memory is sent to audio PD, usually grow
request is not expected, but even if there is any grow request, it is expected to fail.

I'll send out a patch with this new design for more clear understanding.

//Ekansh
>
>>>> [1] https://github.com/quic/fastrpc/blob/development/src/apps_mem_imp.c#L231

