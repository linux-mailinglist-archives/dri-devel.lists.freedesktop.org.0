Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FFBA6BB82
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 14:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DB410E12B;
	Fri, 21 Mar 2025 13:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFRo22zD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E7810E12B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 13:13:34 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCSqKg010784
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 13:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5FNgG9pUF2rJQNgqGFpV33u2ZlZozrMUqHxMPhufv/c=; b=CFRo22zDxJPNuFsE
 AmLTIno0sld9+P6caj4dpyJxJjQoB9JP1YDj/fKGkmG4UcipQLEXlJpeMI9aRirJ
 Ic7COt118HNKBRoM23FjZp4IqABVQe85c26hBm/MejQ7SJFJ/JnXis7J9jfB0Gs6
 sdhw6Cy61xBhfQAnX+9ASSPmcXSdUiJtg+JRcoYePSGq9uZjpZPs+bPfN14Ze9Tn
 0pnWShHYYELBRnPXhEJIwr6ds0BXpS1yFDGNwm5f88yaiEAWaW5UQcreTlkVQLJp
 rAIsUlyeqsKtZ8ILVoW6fU1WCwK3W4t7s3RbdXtrA1PQYGTespq/V9j4mrj1Pbnj
 wYrfIA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h85e03vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 13:13:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2240a7aceeaso31101345ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 06:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742562812; x=1743167612;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5FNgG9pUF2rJQNgqGFpV33u2ZlZozrMUqHxMPhufv/c=;
 b=ZklawQHO6giKmkIco7lDmFN9LMTmZfjeaMSlKI8rceA7JcTFsiP0sZ92AwozADIi6a
 9KJkqLvR9k/HTwlBocAszgCCawcg902+Ls9XekaUu7cFE4dNWhEcH6sSktxCU8dX8D9k
 a6Tk3f4CLfkRyVIH2Kc1uEcGLAz+GIUxRF4RCa5ltO6V0mRRFRKtRB1qfeY7byqtjTZP
 N0hMpuaR4pGyJR9l2kuboDkelZg+KM4HXJMJBfUe3JX/MLCWlftcGGHcsscffHQUNMVr
 qTjXfAzTxK/iZSt4GnSSrcWHmDpTWc3a4Z8LkRo2XXTff5fETGZrLbn5+ybNsk7NnGvE
 kS1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEpDe0J76hU8Awb/idww9Hq56KiSiB9W66eItx7W9nIC5h1E3W6FXAhTJgtuU2rUjuN3KtPeA1RLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRWA7YjoUvFxp0nye227dNyVqNkqm5t445EFGSiRcrCJz1kBih
 WeGn85rx4mBQv8fAtGKm89oOjTUqsbB6CXVq4SnL7GkVd90c02zDC/gQHMnbq+thxKk2bFtDQ3f
 uJZznn+7RLfsVuQXWRRjREpNFpKrh216y7T0ANeKMHM1bq89W8E0KRyG13IzXordxJnI=
X-Gm-Gg: ASbGncvgND1ZFk4KnTECCODV5Cyg3I54b4XyC/veAI/2iPg7+ipB9L7hU/APIV1b6nf
 cal7q/Twkvb4JIGcvF6TRDIFSGlFoRAA3YUmR7vU6n5KOvAvD3QgAHwOU0srEqXDFmvAmONyG18
 XAtPD8yWZ5O54T7Du2/UmgllWTFBoAAEez2MiKKfHyO8pcxLD6LnwsRuXRui9omNmmxKJ51ki6c
 cwcRmpb1VRmcRYsKrFoEFvjWCPJQ6xf+1MhqUr26xlinwhlQAiuqLeGtKo6jebNN4BMLc5BaOf8
 z28UcG+BHovPVI+6UlDtcpKf7KwebiEF/neipb8+7w==
X-Received: by 2002:a17:903:8cc:b0:224:2384:5b40 with SMTP id
 d9443c01a7336-22780db251amr63016065ad.24.1742562812357; 
 Fri, 21 Mar 2025 06:13:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHoY9UCBt3xwqWxZ22HCF7nakuoPvQXo25F3KT5VaQ4ldYgmaRIf/nOVCn8I6txfPvw5K4/Q==
X-Received: by 2002:a17:903:8cc:b0:224:2384:5b40 with SMTP id
 d9443c01a7336-22780db251amr63015405ad.24.1742562811803; 
 Fri, 21 Mar 2025 06:13:31 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.167.76])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-227811da3f2sm15736625ad.187.2025.03.21.06.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 06:13:31 -0700 (PDT)
Message-ID: <cdafb2b7-8492-44e6-b934-d211cb1139ec@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 18:43:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-5-quic_ekangupt@quicinc.com>
 <hgox77a7e6zzriltwhzzciau6u2pmil4y3rl5o2l6zkp4fmlmp@q2dai5fxcvtq>
 <49295da9-82d4-45a0-a2a4-fdaa6600c70d@quicinc.com>
 <an4cvztdkqmrt7w2iaziihlxf4tbox65ze362v2lmycjnqg26y@jizjmh2ki34z>
 <939fcff6-fb93-487b-995b-88e3ff020784@oss.qualcomm.com>
 <2k6573yrw3dyn3rpwqz4asdpx3nlmj4ornm7kmxv3f4jlc6hzg@qkwn7gqduwri>
 <e46be95c-ca8d-48ce-a616-5f068bd28ebc@oss.qualcomm.com>
 <4ca8776c-3cc7-4266-8248-4a595fa19e7f@oss.qualcomm.com>
 <CAO9ioeXVyN+gn=tHP4HsRTs=4AFrrqiyRJw3byxhrcgu4+Quqw@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CAO9ioeXVyN+gn=tHP4HsRTs=4AFrrqiyRJw3byxhrcgu4+Quqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cwM9cS7li30ESMn2XvHI9AZG2kPvip3I
X-Proofpoint-ORIG-GUID: cwM9cS7li30ESMn2XvHI9AZG2kPvip3I
X-Authority-Analysis: v=2.4 cv=LKpmQIW9 c=1 sm=1 tr=0 ts=67dd65fd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=rQ4PyoImJZNyGwpw8nHSHQ==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=LhSCYqp89ykGWDZeNPQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210098
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



On 3/21/2025 4:47 PM, Dmitry Baryshkov wrote:
> On Fri, 21 Mar 2025 at 12:18, Ekansh Gupta
> <ekansh.gupta@oss.qualcomm.com> wrote:
>>
>>
>> On 3/20/2025 9:27 PM, Ekansh Gupta wrote:
>>> On 3/20/2025 7:45 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Mar 20, 2025 at 07:19:31PM +0530, Ekansh Gupta wrote:
>>>>> On 1/29/2025 4:10 PM, Dmitry Baryshkov wrote:
>>>>>> On Wed, Jan 29, 2025 at 11:12:16AM +0530, Ekansh Gupta wrote:
>>>>>>> On 1/29/2025 4:59 AM, Dmitry Baryshkov wrote:
>>>>>>>> On Mon, Jan 27, 2025 at 10:12:38AM +0530, Ekansh Gupta wrote:
>>>>>>>>> For any remote call to DSP, after sending an invocation message,
>>>>>>>>> fastRPC driver waits for glink response and during this time the
>>>>>>>>> CPU can go into low power modes. Adding a polling mode support
>>>>>>>>> with which fastRPC driver will poll continuously on a memory
>>>>>>>>> after sending a message to remote subsystem which will eliminate
>>>>>>>>> CPU wakeup and scheduling latencies and reduce fastRPC overhead.
>>>>>>>>> With this change, DSP always sends a glink response which will
>>>>>>>>> get ignored if polling mode didn't time out.
>>>>>>>> Is there a chance to implement actual async I/O protocol with the help
>>>>>>>> of the poll() call instead of hiding the polling / wait inside the
>>>>>>>> invoke2?
>>>>>>> This design is based on the implementation on DSP firmware as of today:
>>>>>>> Call flow: https://github.com/quic-ekangupt/fastrpc/blob/invokev2/Docs/invoke_v2.md#5-polling-mode
>>>>>>>
>>>>>>> Can you please give some reference to the async I/O protocol that you've
>>>>>>> suggested? I can check if it can be implemented here.
>>>>>> As with the typical poll() call implementation:
>>>>>> - write some data using ioctl
>>>>>> - call poll() / select() to wait for the data to be processed
>>>>>> - read data using another ioctl
>>>>>>
>>>>>> Getting back to your patch. from you commit message it is not clear,
>>>>>> which SoCs support this feature. Reminding you that we are supporting
>>>>>> all kinds of platforms, including the ones that are EoLed by Qualcomm.
>>>>>>
>>>>>> Next, you wrote that in-driver polling eliminates CPU wakeup and
>>>>>> scheduling. However this should also increase power consumption. Is
>>>>>> there any measurable difference in the latencies, granted that you
>>>>>> already use ioctl() syscall, as such there will be two context switches.
>>>>>> What is the actual impact?
>>>>> Hi Dmitry,
>>>>>
>>>>> Thank you for your feedback.
>>>>>
>>>>> I'm currently reworking this change and adding testing details. Regarding the SoC
>>>>> support, I'll add all the necessary information.
>>>> Please make sure that both the kernel and the userspace can handle the
>>>> 'non-supported' case properly.
>>> Yes, I will include changes to handle in both userspace and kernel.
>> I am seeking additional suggestions on handling "non-supported" cases before making the
>> changes.
>>
>> Userspace: To enable DSP side polling, a remote call is made as defined in the DSP image.
>> If this call fails, polling mode will not be enabled from userspace.
> No. Instead userspace should check with the kernel, which capabilities
> are supported. Don't perform API calls which knowingly can fail.
>
>> Kernel: Since this is a DSP-specific feature, I plan to add a devicetree property, such
>> as "qcom,polling-supported," under the fastrpc node if the DSP supports polling mode.
> This doesn't sound like a logical solution. The kernel already knows
> the hardware that it is running on. As such, there should be no need
> to further describe the hardware in DT. If the DSP firmware can report
> its capabilities, use that. If not, extend the schema to add an
> SoC-specific compatibility string. As a last resort we can use
> of_machine_is_compatible().

Thanks for your suggestions. I'll try these out.

--Ekansh

>
>> Does this approach seem appropriate, or is there a better way to handle this?
>>
>> Thanks,
>> Ekansh
>>
>>>>> For now, with in-driver
>>>>> polling, we are seeing significant performance improvements for calls
>>>>> with different sized buffers. On polling supporting platform, I've observed an
>>>>> ~80us improvement in latency. You can find more details in the test
>>>>> results here:
>>>>> https://github.com/quic/fastrpc/pull/134/files#diff-7dbc6537cd3ade7fea5766229cf585db585704e02730efd72e7afc9b148e28ed
>>>> Does the improvement come from the CPU not goint to idle or from the
>>>> glink response processing?
>>> Although both are contributing to performance improvement, the major
>>> improvement is coming from CPU not going to idle state.
>>>
>>> Thanks,
>>> Ekansh
>>>
>>>>> Regarding your concerns about power consumption, while in-driver polling
>>>>> eliminates CPU wakeup and scheduling, it does increase power consumption.
>>>>> However, the performance gains seem to outweigh this increase.
>>>>>
>>>>> Do you think the poll implementation that you suggested above could provide similar
>>>>> improvements?
>>>> No, I agree here. I was more concentrated on userspace polling rather
>>>> than hw polling.
>>>>
>

