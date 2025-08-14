Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455F7B25B38
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 07:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DF310E0EE;
	Thu, 14 Aug 2025 05:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvVOo5Xg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C7710E0EE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 05:50:52 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLXJPq031963
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 05:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZOJ5RR3PqgCQNdZV6tHlQpMWfAVJArmZDw7MU6+DL7M=; b=XvVOo5XgoxdS+3Sf
 Bq2yXWJ0hiwSTa0MEuZoW4IjIJC86W8OrGPMHs40+cf+tOMSGGaYuKi7i2oPVGqe
 gSWw1VbakLMUewkEiRv1vIbQjopB4W4bdMf67x+MclV95o1iXuDkfsK1sau/aKQv
 VhIikW19P9Bevhi8z17Bu4IrPqlmDJJp4k9OK73+oqjS7XZt9u5HR6yfL8wFwz77
 0gV49EtbSLRjR1YvMPZeSDnV9uKscVy7QYe2Iot+qf+vee8/8A7pjLGkH4JCW5K/
 HorgUiylHUufqpREbDbZCaH+kbcZdkZg5+arxe1Kgc/kbYdf+Mo/szhMVvUp85zv
 DNaEqg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4jd1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 05:50:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24458194d82so6432595ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 22:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755150651; x=1755755451;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZOJ5RR3PqgCQNdZV6tHlQpMWfAVJArmZDw7MU6+DL7M=;
 b=oHY2G+zYgXq+foQMDh4d3aW6U5R2Ub/9E/AKIn/j2ijqctULuYsvNVYgzFZH7LjNdv
 NSet2u0NM1J1h+xn3+ajZtUoj8IwwUG5WKcq7WBWCsr7Y2E3tJYJ9derF7yirymr7EQK
 8Hl1/j7YTZRxjWYwZndtBIhl6m57te2HiVyvJdqFVV6HSozlx2sCwPq60JqxrACEBCyU
 f1BCK/i8I9mDy9cHhhvXvGBfZv7qhdZVyJJk6SvsjhNg8Vsho+yfRLh55EOs2exmaRQm
 IkKq+S8SWDUo7W5hksJ44uXnOjus6OCi3qCvDd12TJWOJEryslWw7EIs9vH7NYK9EtcT
 cUFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMBawpayaQWECA/O+1TPuG8t+9EUdwYzq2zch9EaqmvsURX0raLWSxTpHBm5qOX69b+c6BkUUj4yY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC0Yw06FoKOsHG2cLnQGa8w8K9puOerp0DdomHOgvlJd6110tn
 /1tPnp8yQPBrNdV/PnrfxiBV819m0TVCijlf8+Pxeb4bTXrc1wTnyLBbviyrdswR+zTfeBzxpzb
 5nZ0+2vR+UjCKff0JO6VEGPIaW+SV7UjJr7n5IfY3X3ya8PqtqMQ+rupySROP1bLaJgAUPw==
X-Gm-Gg: ASbGncuAHSUJC71ZWUf8/Hw/++V5WAqVJyDEoInaXndVZ3SwmLEnehc1E2dICpHcZ8E
 yTa1rpXTUcurJoz+UCCb58SHGK9HfypynqEmBtEhE25hPpQxvPgssJZa5K/IcAudykb0C+5zvYT
 FCt1Cz0Q+uZ/LSgazEoblpry9cvEvtHjBO4HbWLl5Ga5Sgjz6JlUPs8v/6AQVccxkFRb3tThzr5
 2WX0MvbfrNZ7u/nR6W8rJIJz11tncDPhqf/c49YmoLIBYXSTTEp9upc+kaJ95yvG0TiqvPdA2xm
 l8SxqlQOjdkTCRRgH7Vk7IUXwFvRBi19sr6/Xo0+cmId3j9uS16tl1s0FMRd/89iR/GHO2Dx0kh
 vdvlfnKnW5wWTleuqSBmfuyPBnkhjKC7nvixzLw==
X-Received: by 2002:a17:902:e784:b0:242:9bc6:63c3 with SMTP id
 d9443c01a7336-244586efd7amr26911685ad.54.1755150650520; 
 Wed, 13 Aug 2025 22:50:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg+3/0CB4U2pDNP5uuELEloHSNUMx8oZuD+AyTPJ8LiDQNxpnVIDTDJbE8IvvpsAU7Y3B2/w==
X-Received: by 2002:a17:902:e784:b0:242:9bc6:63c3 with SMTP id
 d9443c01a7336-244586efd7amr26911215ad.54.1755150650056; 
 Wed, 13 Aug 2025 22:50:50 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2430558a0b7sm52896745ad.85.2025.08.13.22.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 22:50:49 -0700 (PDT)
Message-ID: <22d6cbc1-90ad-44b0-80fa-c3c67abdae8d@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 15:50:41 +1000
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l_P2_951arloyet32MY3Zvez1j-gGxBw
X-Proofpoint-ORIG-GUID: l_P2_951arloyet32MY3Zvez1j-gGxBw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX0ApTe9Tvmmfy
 iZZCSZBHovuOF9B5UL1GR3bZnrJEbqdSuwokobShzHhIjjZff2OGDgJoxVhBQpUWG6rQBvO8LnN
 SX/ZXRq/drhW30tK5IsFJa83uYCbPdcsHrzA2nCrxMhUBwxiNrMC7QM0WtMw+htTNtu/5MPLw9g
 mm4AWzvQE5/euGo2LAvREKe+iUTJh1gOezK8/8bj+au1mY32HlGQ48hOlxJQkmgpr0LM5a2swou
 jKnr5QupHX9g75B1y62NzrJPQNX9nKbpJHbFKOQE1d7wOqLiYyKf62L0MeXb5zGoSMKaevnRitK
 KdsO5YHz9DQsGDp8DAD2IuUNtqu9LV10dxxCWyZxiNpRz0t52oBjF/o5giJiD0JmwQM0yEK3YpF
 UOIdF9sF
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689d793c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=oZdMm6XVNGq0ThNLGeAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
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
> 

Okay, I’ve thought about this point and also discussed it internally.
I can add an entry to Kconfig to ensure the driver is unavailable when
CONFIG_CPU_BIG_ENDIAN is selected -- for now. However, without a clear
usecase, adding all the le32_to_cpu/cpu_to_le32 conversions just makes
the driver messy.

Regards,
Amir

> Konrad

