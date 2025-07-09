Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1816AAFDF5E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 07:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E970810E296;
	Wed,  9 Jul 2025 05:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwNSRG6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AEB10E296
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 05:43:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568JcOwf031869
 for <dri-devel@lists.freedesktop.org>; Wed, 9 Jul 2025 05:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PgSVKhhZOx9fn9xuG9eyWNT5OlxugNfXlcfTAtWc4Dg=; b=VwNSRG6fmyap3vxP
 f5gG+s3GjY2MQbK1O1h7KcdQHh1BvLYnr/d41O78J/EFeneycqz+dSN6IRe7z8is
 Oojhgp4pvxlaTFePZP3RSERhSln5Zy9eT6yz2yZM53I+xz12/xnGl6tbZN06+4G/
 VtOfZez4yJxNGcEf2pXjsiHRgQQkM5aEagSV/GnMJpjKeEmrjW14lkrDHE+47v1G
 6Qa2uz32n7ssusnh1p6NKP2uiVu/KlgSPO0L58F9HylRlz0FwtozUskXoHPPcSBm
 4LWyMKckZkvVUKvL1xQjaoyO81XBRlZB7gXX11aqEoo3k47FBxzoXkh6VMVxSWrV
 taJG3Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qtcd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 05:43:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-74b4d2f67d5so4056999b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 22:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752039835; x=1752644635;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PgSVKhhZOx9fn9xuG9eyWNT5OlxugNfXlcfTAtWc4Dg=;
 b=t1oqmLnMjb7B+xfVxnvC21szifv6DjVaa3mZyV54Ch6LdWR9KCc84yEi5Uq7rc4q3d
 1rVnOm2WAYEVMdPciofQEvU9mOaqbBdBD5gfIPO9p2wXk9APcz2H7SDv+ZaDL2I4eoWn
 9IKTkIL54y3bM+k+KS/dW1iPtRLmt656hDqlEkush/rFoTAB49P/HBEEVidOfNsQbrL+
 C3RMy8m1DEUJZMozAKB/uGpAEv7SAHNCZM7iK5OEcbOY5A183/SE1jM/R5Ua+LXJr5nt
 2SBz+HLQB4iMt2csG5hdp0pVyNOjLx86c1sfsjx7BigcHvlgB7g2zE7ZNaCKnIx3F+EO
 wefw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqj64X6qYf4urzQp8mhTq2JU/fg3RLyajXvTRgf7B/oeQUu5FS6Wm5dC8kc4J+ki3irhGVrKy4Jzc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB/IZ1VilvbwuhxNWI/r0vrV/qW026ateRLS9dcp+bTH4gwiOG
 4evU3uUWcD+qO6MmIbmNHSeF1MjEWyvD1gAJkJfZpmuxw5EwQ8Mnty/mPo+hl+FgZ4DALnfkIGg
 WxEjyNGJY089OuN47s0bjiVoc5tMBgHeTxkQfSkYnynPy2zFj5hVmc/rimWKpL0cOk6LN4wA=
X-Gm-Gg: ASbGncuRH7J6laNOVgK5F6VzQcYRa+12dTC+iy7l0RlVMfnrBfht9mN0VaD602sWUJW
 0oEnvxV2hceiOKFeZer11ZfgzIx/KFJlg+1BhiO72xfSlBhIExsqi9c+qelvAcrkCFkyzc/XoCD
 g+LmnEWBBZ49EV2oG8jzfWy8wTjZdM1BlgOUDgx+VOoWKB8Ce911ud+rvCjZIR1A1OOkfhTm/p3
 VbA6RRe2N5YYpqIkUNuFI9g4U7zXwebXBtjTr4pDQoumzf1BvuARUlxsgqtk+WkQTt+pldFEkJj
 /1F8Xyj1iklrL9QKJNvE5cPv6D9l1io0mP2RlbydcnJHsmhx
X-Received: by 2002:a05:6a21:1fc8:b0:21a:df04:3285 with SMTP id
 adf61e73a8af0-22cd7487eabmr1845826637.22.1752039834896; 
 Tue, 08 Jul 2025 22:43:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYl76ZnEWcsba95ueqkMuH7zTvwhyN2CeXbn/Yj4+3XI4AUN1nTonvDbA0E2YPPM2a34+eFw==
X-Received: by 2002:a05:6a21:1fc8:b0:21a:df04:3285 with SMTP id
 adf61e73a8af0-22cd7487eabmr1845798637.22.1752039834447; 
 Tue, 08 Jul 2025 22:43:54 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee62dd5fsm13371115a12.55.2025.07.08.22.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 22:43:54 -0700 (PDT)
Message-ID: <8b877eeb-941a-47c5-a67d-450dfb772d6e@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 11:13:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
 <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
 <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
 <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
 <7505f0e8-222d-4052-8614-c12109d14bce@oss.qualcomm.com>
 <cq3qfx32dallivdcwjwqgq7kggiwucpcyhwqqlbrf6n4efkmuc@htjwnigojag2>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cq3qfx32dallivdcwjwqgq7kggiwucpcyhwqqlbrf6n4efkmuc@htjwnigojag2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA0OSBTYWx0ZWRfXxRXiTmjaJ4aw
 6NuxvtGNJNisNq2WnbiH4UWpT3Pyz1WiQ8TqDiUAjBAcUiaad2tYYnIDxw/DM0wB/WegKyP+r0K
 5sjcfMjHuWdX9TW30JF8yGTNisQvZI/gbTGvr7GjoLj/wrS41S3tKdCWwE8k/E0tNbcafqQkVSA
 eVry1+i2YsjjdCl/l9786UkLqgSwiB4H7XundSL1mQATI9bzZvOtonVW0L67/+m4X5jPmZ0Vrzo
 JXsIDmrUs+YlxOIn+MkwqKEEQgCcKE0VflOkuxgFQJos6tq3vkE6VXqRG54MFF4oT421Mc+npfn
 6zKxD9ncN2xeMIZ6FI3VMSBJael6VOzNmLvSGR24KC4p72+WfDt5XQSulKNoueyD1rPvNU8q75T
 YYZqMYpYyHLr0xDD7zXAupreGxnxbzSHySZkkWjzFKJ2NVRKbF/KrOYwf/3GccOdcMWnq9RA
X-Proofpoint-GUID: HPFWmnwPw9HexabQGd0BT98DnvF67cUH
X-Proofpoint-ORIG-GUID: HPFWmnwPw9HexabQGd0BT98DnvF67cUH
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686e019b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=8S-o2TYjEKDqIBSC5TwA:9 a=pl74wFF6UHmSd9ON:21 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_01,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090049
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



On 6/12/2025 3:54 PM, Dmitry Baryshkov wrote:
> On Thu, Jun 12, 2025 at 03:02:52PM +0530, Ekansh Gupta wrote:
>>
>> On 6/12/2025 1:35 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jun 12, 2025 at 10:50:10AM +0530, Ekansh Gupta wrote:
>>>> On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, 22 May 2025 at 08:01, Ekansh Gupta
>>>>> <ekansh.gupta@oss.qualcomm.com> wrote:
>>>>>> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
>>>>>>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
>>>>>>>>>> User request for remote heap allocation is supported using ioctl
>>>>>>>>>> interface but support for unmap is missing. This could result in
>>>>>>>>>> memory leak issues. Add unmap user request support for remote heap.
>>>>>>>>> Can this memory be in use by the remote proc?
>>>>>>>> Remote heap allocation request is only intended for audioPD. Other PDs
>>>>>>>> running on DSP are not intended to use this request.
>>>>>>> 'Intended'. That's fine. I asked a different question: _can_ it be in
>>>>>>> use? What happens if userspace by mistake tries to unmap memory too
>>>>>>> early? Or if it happens intentionally, at some specific time during
>>>>>>> work.
>>>>>> If the unmap is restricted to audio daemon, then the unmap will only
>>>>>> happen if the remoteproc is no longer using this memory.
>>>>>>
>>>>>> But without this restriction, yes it possible that some userspace process
>>>>>> calls unmap which tries to move the ownership back to HLOS which the
>>>>>> remoteproc is still using the memory. This might lead to memory access
>>>>>> problems.
>>>>> This needs to be fixed in the driver. We need to track which memory is
>>>>> being used by the remoteproc and unmap it once remoteproc stops using
>>>>> it, without additional userspace intervention.
>>>> If it's the audio daemon which is requesting for unmap then it basically means that
>>>> the remoteproc is no longer using the memory. Audio PD can request for both grow
>>>> and shrink operations for it's dedicated heap. The case of grow is already supported
>>>> from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
>>>> memory) is not yet available. This memory is more specific to audio PD rather than
>>>> complete remoteproc.
>>>>
>>>> If we have to control this completely from driver then I see a problem in freeing/unmapping
>>>> the memory when the PD is no longer using the memory.
>>> What happens if userspace requests to free the memory that is still in
>>> use by the PD
>> I understand your point, for this I was thinking to limit the unmap functionality to the process
>> that is already attached to audio PD on DSP, no other process will be able to map/unmap this
>> memory from userspace.
> Ugh... and what if the adsprpcd misbehaves?
>
>>> How does PD signal the memory is no longer in use?
>> PD makes a reverse fastrpc request[1] to unmap the memory when it is no longer used.
> I don't see how this can be made robust. I fear that the only way would
> be to unmap the memory only on audio PD restart / shutdown. Such
> requests should never leave the kernel.
>
> Moreover, the payload should not be trusted, however you don't validate
> the length that you've got from the remote side.
I was thinking of giving the entire reserved memory to audio PD when
init_create_static_process is called. This way, we can avoid any need to
support grow/free request from user process and the audio PD pool on
DSP will have sufficient memory support the use cases.

This way the free can be moved to fastrpc_rpmsg_remove(When DSP
is shutting down) or during Audio PD restart(Static PD restart is not
yet supported, but clean-up can be done when PDR framework is
implemented in the future).

Do you see any drawbacks with this design?

>
>> [1] https://github.com/quic/fastrpc/blob/development/src/apps_mem_imp.c#L231

