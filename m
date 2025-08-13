Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DA0B2576D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 01:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4660A88EFF;
	Wed, 13 Aug 2025 23:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOlzgTDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275DE10E7DF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 23:23:57 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLdaM030062
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 23:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iA6096032O8eraf5ErblJhkD3Z0jA/+vFYM4Vm1Ntuw=; b=TOlzgTDKGLoL6c3W
 60rRpgi2e6BWCynvvUsTJimxfrH1Jx8J+fCpYryKmW7KR/hvmWWF2Jfo4T2p6uCN
 noWNhlxOve1trqDf6IhHj/SMuv0NQfd/FHIVd8oi+iG7+QYRck3i+NtVgSXpU977
 MD2t/VBfUroL47SCDqUCaAGSnHVsr4viZcuBVwSig7q1InVKvA/MDVALiwsF0ME4
 JICcAwhzADnlR0Vr0LDHRdy6A9LPxvYsnxI2o9CO4yneATGRz5mwmSljp6/IeV3f
 q8IFZw4KKqV8sRseqjUy2KqIZEHjqEIXbf7mOOIirlaYQ7B6bEVevDhviQwWLwdh
 9inxbw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vrevm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 23:23:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-244581ce388so5584745ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 16:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755127435; x=1755732235;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iA6096032O8eraf5ErblJhkD3Z0jA/+vFYM4Vm1Ntuw=;
 b=XDNt0d9ZHtesppjL76qDWBx36bAG9GuhLlsgxIfVK8w3bK63LrJIpPAkJlHQ7KV5sT
 6G/RWKqQt1uFmcnnJwZOgMe4ySjjGDTjDnqGhV1uysM/ktLfUXK8ULc1yKPTvcLnUFUJ
 biLypCfVI1TPvUluAIQGgDAQWst3Vte27BnhAGYtEB5LmjNBOSt9FXyQJWZqZ083c1X3
 iyBNiDBEpRtN5HV1IxFFioL0FNCL50e/87y7yfS2JaDHa2tLLzReEhwLIGIe0VfUhkSL
 f755U99wJfawNuJKg0NxBHgWBAcNl7GqpRrFEeIzpwSMR3uu3OOhdMsiZGkmOsw4pja+
 LCig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsNuQ8A+5uZXpDMoRYcbpf/3Qy4yqCj/XUYlHP2emp0qd7og+JvEXK73/gbFl2UgMhSIkMtvuz8EE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBTdHTG+qahhd+eXSAxkDcx4VLw91frWJxu2s8efXFKk6O9S2D
 E0BLYFI2sO76g5N6JKiz5UEp5rn/QzBVtPCmO/NJa2bii3GUSMNJkgDt7vlZC7eo+XpeLN+IlSx
 JwYY8b2DHEWiY2D/8TLcxXoG93FC8Sv0Gv/hMcY7RAOHmWR3+rijWNrWz6Ydg4ohQTISPBQ==
X-Gm-Gg: ASbGncvnLWafNEXAV23TrsrTaXwvPngBD7A4GVCQvxEDylvk6dQKgMl4jJM/CFxYAp+
 6/bE5BEVRV10iQjRfFTsmief9FIlHSxAC0n8xL+hH2pYVNPwGUNuHzywzwXumN0psuDIyD75OdF
 rsa3IH7NrigvPI+YvQLMXsHtV1otgaDO493un4YVIoQFjjlSC1hfqxGdz8h/aHAciCtco6HwB3W
 c42h8eQN2A+TfjiUJ9PHagQJn81CZiGYRUbB9i4GPmJq4uqaNjAVoQjQiBVlDGo0JFznnNIoTPT
 2Bm/VFBk9+qNbHPc9bZ3in0rxg/ryfrJ3yhv++SALrGNb9/9zEy67OvQBog9PEpp7sjWPM4p1r2
 9VrO8bF10ItsNMH+OApqn5JOVKVNwp6VzBkEPvg==
X-Received: by 2002:a17:903:1c8:b0:23e:22dc:665c with SMTP id
 d9443c01a7336-244586c46fbmr13119905ad.33.1755127434799; 
 Wed, 13 Aug 2025 16:23:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHDCnRh0Js6W0SOu+on6VKjPDQGJcgj0Cg2MJ13k4MfvzHuV5x1VI5U3usKguIYljIv3YAFA==
X-Received: by 2002:a17:903:1c8:b0:23e:22dc:665c with SMTP id
 d9443c01a7336-244586c46fbmr13119515ad.33.1755127434369; 
 Wed, 13 Aug 2025 16:23:54 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422b77f33asm28118326a12.5.2025.08.13.16.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 16:23:53 -0700 (PDT)
Message-ID: <0cc814ae-ea8a-44cd-b502-1f89876e61b9@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 09:23:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
 <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
 <d81abdef-18fa-496d-8493-e8f336c43800@oss.qualcomm.com>
 <d74404ec-44ad-412f-98ef-eed288ecf1bf@oss.qualcomm.com>
 <87c884ed-0975-4ac2-a0fa-16e830a57c72@oss.qualcomm.com>
 <8bcb37ed-2885-4f4d-abed-5dd5ec6a254c@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <8bcb37ed-2885-4f4d-abed-5dd5ec6a254c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX6cqGO4jlgJI8
 KPzYWVa/Np6lBzFU1RlOUbRxwNTba+cj9/bYbqhdR8m6NqsqYq7o0yaih7lj8/k0/MBqGGd6bYt
 cYfoCTvnzBgE0tJFQuGdXTUPxDkuloy6XrA35oRztOKvZTBLrEJ+MrUKzGAFHARht36CGlcfi7h
 BIl4ON/yQES15JMIGP/mx4u+Byw+UGOvK8xPWusOYpiI4NZf7hMywQi3EJGTBSxGY4fh9ZokpcV
 I3L2rUwMESUL64c6/ThQQ31piw6aDW37SHOJ3dSmfI/FiCGKC8ToSUPfFaWRHXlYPwf69fBDHbW
 vRCglUX9Gd5tMsPsnUADR1imP4wC8BqSAlZnUaybGghJa1T1hb6iM4LG5JN5uo6VpdhyDZp8nwB
 GEo1zOi3
X-Proofpoint-GUID: QBXW44ej4CMhSslrRcWkFLvmJH2OKaQp
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689d1e8c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=pGb8jkpG1LKJgODn460A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QBXW44ej4CMhSslrRcWkFLvmJH2OKaQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
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



On 8/14/2025 9:20 AM, Konrad Dybcio wrote:
> On 8/14/25 1:19 AM, Amirreza Zarrabi wrote:
>>
>>
>> On 8/14/2025 8:49 AM, Konrad Dybcio wrote:
>>> On 8/14/25 12:24 AM, Amirreza Zarrabi wrote:
>>>>
>>>>
>>>> On 8/13/2025 8:00 PM, Konrad Dybcio wrote:
>>>>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>>>>> Enable userspace to allocate shared memory with QTEE. Since
>>>>>> QTEE handles shared memory as object, a wrapper is implemented
>>>>>> to represent tee_shm as an object. The shared memory identifier,
>>>>>> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
>>>>>> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
>>>>>>
>>>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +/* Mapping information format as expected by QTEE. */
>>>>>> +struct qcomtee_mapping_info {
>>>>>> +	u64 paddr;
>>>>>> +	u64 len;
>>>>>> +	u32 perms;
>>>>>> +} __packed;
>>>>>
>>>>> Please use types with explicit endianness, e.g. __le32. I'm assuming
>>>>> TZ will always be little-endian, regardless of the host OS
>>>>>
>>>>
>>>> I'm not entirely sure how this point is relevant. As I understand it,
>>>> the core that populates this struct is the same one that accesses it in TZ.
>>>> Your argument would absolutely make sense if the host and TZ were operating
>>>> on different cores with distinct architectures -- such as one being
>>>> little-endian and the other big-endian, which is not the case.
>>>
>>> CONFIG_CPU_BIG_ENDIAN=y exists on arm64
>>>
>>
>> Or, you are saying we may have a configuration where host is big-endian
>> but TZ is little-endian?
> 
> I was indeed about to say that.. I believe our tz is always little-endian
> but you can run the HLOS of either endianness

Ok, I'll update them.

> 
> Konrad

