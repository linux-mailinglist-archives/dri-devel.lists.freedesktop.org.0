Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20409A79AE5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 06:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EF110E902;
	Thu,  3 Apr 2025 04:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbkYFrlG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (unknown [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E91110E902
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 04:44:29 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5333mcpS020469
 for <dri-devel@lists.freedesktop.org>; Thu, 3 Apr 2025 04:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pX3TOEkMVOu9UUOiX4XaUtgFr246gpwx4sz1hPNE5/I=; b=XbkYFrlGKTw92IHN
 ZXV0YoBN9LqG+Scptjmk8o26+AVGTJgkwRgolAY8LreC21qiA+rnm62AM22Vwzcm
 XUqAS8lb/h+79odo7K9nCH6VWTeTyViQQ9sJ0q5Hm/lvu8ZH2UNSrIH8y92wDejt
 YJhd1AZKbsrIvO6saX1piAgF6jtsNyTXkU+8+by5SSLql0Ol28tY0cbVZeebmqDS
 MExppfpG+TXz9ZhVnIkpqFPTAeZ1znRe69aNRxD78SeK8md/MpAmEbtbjinCjm0j
 EONPZ/eAI0DGMDP5eD46rBs8vS6DbTZkmhPLPwgOm/PoblxkMqdtylKyyKKMt0x5
 xZcGhg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a2evt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 04:44:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-227a8cdd272so4995835ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 21:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743655457; x=1744260257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pX3TOEkMVOu9UUOiX4XaUtgFr246gpwx4sz1hPNE5/I=;
 b=ex5ji5AOlB56OBnoSFMquBP2jK/jjY9saP4SS3sE0qDO8mwhQ7LyPoh5j7kqJsWMcM
 4SRuaBkGb/vbfimxfcccUHpo6CFl43fgd5TWXQntXfOoSU/nhv1JSG0DjzcJJnRT4vXm
 6NVaRvlR+7lsMDF1cB1tXsejS2uPAUZZyJrbdALj43BEc79nyCNp9xV3ebu3anz4sEAa
 8EPkBOCoT2IGme6SS5hLFfjYhwrGsOVEe8EJTXWze4WZDjU336ZmXnv0NKWRGyIqhGxv
 s8jSbAHuet4VFLp/qqGi7UhZDirpj+OfThhrpun/1SlzoGCG86XyhkI8OaH1u7gzAXNc
 CHVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTM2TAqnY+HJMiufN424G3AlL/5gaLAjB8ARIh3VpeAJdAFktFyPgJDuEClbMbVpi+BoZ2sIv+xAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8EIyTf90kwk0mx3JkE9sjqt84pIM2lBWwCV9rfmA+LSbBjLci
 DXIfYBJXWlzrts9tN+FtOYRk3NdVvE1kaBfnGF+yQbYVhIxbgVJJznff8hNqEpX0uKQlK1mmNUa
 BNTXH/LCBVjJjiu7qCXVR2zfatM4mDETgjLZ485ntKAvlpr8ifBLheQNM7hCWEStj3VE=
X-Gm-Gg: ASbGnctUBnGnwZSfUZBN7jQpCduTHQK+NoRHHS5R1xKerOvACP/kNDyV+JTm06zJ2rH
 f5dirjrq1MWMsWrzFyVFLjDncIZZ/9FSEU3TW+UJnjRF28xZMaYCHfEwVowg5CofO5wpmi0jeoR
 aEP/MlPgWle7895zTv4j6NYUoEJ2CeKma9v7gxfxyT58WW2EwOIAPcHLctaIMet0YOWWrPirryY
 BtDWKtJS1EgeP2+OwtCTFO/dwQpI3OF3V2lfWLHF67ZSTdzx97cDrhTqvkP0R8rw5uKF7wDflx/
 TZF88JMmsXmB8aelJ4sqAdM1/xSrvsJskEP10ya6
X-Received: by 2002:a17:90b:50cf:b0:2fe:ba7f:8032 with SMTP id
 98e67ed59e1d1-3057cbf6453mr2168301a91.9.1743655457086; 
 Wed, 02 Apr 2025 21:44:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFURruLAolWkOQKsQ1bALqNS/8BOoY/s1w8nLZO+Mu5Q1KYq91vpBymSAhfkYOYqUKT2i9PoQ==
X-Received: by 2002:a17:90b:50cf:b0:2fe:ba7f:8032 with SMTP id
 98e67ed59e1d1-3057cbf6453mr2168270a91.9.1743655456662; 
 Wed, 02 Apr 2025 21:44:16 -0700 (PDT)
Received: from [10.204.65.49] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2297866e2b6sm4731025ad.191.2025.04.02.21.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 21:44:16 -0700 (PDT)
Message-ID: <bfa29a76-f89a-4398-b6b3-1be7ae6cf8b3@oss.qualcomm.com>
Date: Thu, 3 Apr 2025 10:14:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
 quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <qhriqbm6fcy5vcclfounaaepxcvnck2lb7k2gcpbtrojqzehua@khv5lwdgbysc>
 <9962c517-5c0e-4d46-ac0c-2a7bab550156@linaro.org>
 <412fe24e-ce70-4733-ace5-d3fbe43476c4@oss.qualcomm.com>
 <c27a97ed-c765-421a-a48c-3abbae3bac93@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <c27a97ed-c765-421a-a48c-3abbae3bac93@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67ee1222 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=LwNrBaKUNq3Cb3izIMUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: B7xUy9qhTN1bDKmanHM5coaf6sMsu-Tn
X-Proofpoint-GUID: B7xUy9qhTN1bDKmanHM5coaf6sMsu-Tn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_01,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030023
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



On 4/2/2025 2:12 PM, Dmitry Baryshkov wrote:
> On 02/04/2025 11:38, Ekansh Gupta wrote:
>>
>>
>> On 3/21/2025 5:53 PM, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 20/03/2025 18:43, Dmitry Baryshkov wrote:
>>>> On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
>>>>>
>>>>>
>>>>> On 20/03/2025 09:14, Ling Xu wrote:
>>>>>> The fastrpc driver has support for 5 types of remoteprocs. There are
>>>>>> some products which support GPDSP remoteprocs. Add changes to support
>>>>>> GPDSP remoteprocs.
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>>>>>> ---
>>>>>>     drivers/misc/fastrpc.c | 10 ++++++++--
>>>>>>     1 file changed, 8 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>>>> index 7b7a22c91fe4..80aa554b3042 100644
>>>>>> --- a/drivers/misc/fastrpc.c
>>>>>> +++ b/drivers/misc/fastrpc.c
>>>>>> @@ -28,7 +28,9 @@
>>>>>>     #define SDSP_DOMAIN_ID (2)
>>>>>>     #define CDSP_DOMAIN_ID (3)
>>>>>>     #define CDSP1_DOMAIN_ID (4)
>>>>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>>>>> +#define GDSP0_DOMAIN_ID (5)
>>>>>> +#define GDSP1_DOMAIN_ID (6)
>>>>>
>>>>> We have already made the driver look silly here, Lets not add domain ids for
>>>>> each instance, which is not a scalable.
>>>>>
>>>>> Domain ids are strictly for a domain not each instance.
>>>>
>>>> Then CDSP1 should also be gone, correct?
>>> Its already gone as part of the patch that I shared in this discussion.
>>>
>>> I will send a proper patch to list once Ling/Ekansh has agree with it.
>>>
>> Thanks, Srini, for sharing this clean-up patch. It looks proper to
>> me, but I was thinking if we could remove the domain_id dependency
>> from the fastrpc driver. The addition of any new DSP will frequently
>> require changes in the driver. Currently, its usage is for creating
>> different types of device nodes and transferring memory ownership to
>> SLPI when a memory region is added.
>>
>> The actual intention behind different types of device nodes can be
>> defined as follows:
>>
>> fastrpc-xdsp-secure: Used for signed (privileged) PD offload and for daemons.
>> fastrpc-xdsp: Should be used only for unsigned (less privileged) PD offload.
>>
>> The reason for this constraint is to prevent any untrusted process
>> from communicating with any privileged PD on DSP, which poses a security risk.
>> The access to different device nodes can be provided/restricted based on UID/GID
>> (still need to check more on this; on Android-like systems, this is controlled by
>> SELinux).
>>
>> There is already a qcom,non-secure-domain device tree property[1] which doesn't
>> have a proper definition as of today. The actual way to differentiate between
>> secure and non-secure DSP should be based on its ability to support unsigned PD.
>>
>> One way to remove the domain_id dependency that I can think of is to use this
>> property to create different types of device nodes. Essentially, if unsigned PD
>> is supported (e.g., CDSP, GPDSP), we add this property to the DT node and create
>> both types of device nodes based on this. Otherwise, only the secure device node
>> is created.
>
> This sounds like breaking backwards compatibility on the userspace side. You can not do that.
Okay, I thought if the property is added for all older platforms, that will ensure backward
compatibility is maintained for old built applications.

From userspace, the expected device open sequence is to try with the secure device node and
fallback to the default/non-secure node if the secure node is not available/accessible.
I understand the ABI cannot be broken, and this expectation should be added for new
applications/platforms.

This is still a security issue that needs to be fixed in some way. I'll try to find out if any other
approach can address this.

That being said, I'm fine with Srini's change for domain name clean-up.

I would request Ling to test the patch.

--Ekansh

>
>>
>> This raises the question of backward compatibility, but I see that on most older
>> platform DTs, this property is already added, so both device nodes will be created
>> there, and applications will work as expected. If any old DT DSP node lacks this
>> property, we can add it there as well.
>>
>> Going forward, the qcom-non-secure-property should be added only if unsigned PD
>> is supported. This way, we can clean up the driver completely to remove the
>> domain_id dependency.
>>
>> If this sounds good, I can work on this design and send out a patch.
>>
>> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml#n44
>>
>> --Ekansh
>>
>>> --srini
>>>>
>>>
>>
>
>

