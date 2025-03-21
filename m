Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803CEA6B89D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 11:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C837710E76F;
	Fri, 21 Mar 2025 10:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZvoqN4b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FE710E77E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 10:18:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L8jrPU032554
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 10:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5eBg7ja8t6Nygd6OTElfc/5vgmOpe0nAEpW8sRRtOJk=; b=SZvoqN4br13tFkgq
 iL88NHnFatTR5+m6SRszUBX2cA69WhbzS42MMDMXDORyPVni6DBp3efkDIEx0kNn
 crfSa9VQZGFTs2PxydrvLe9B7woNpa3wY21hxdTvWLRUEo9khZMzaHQPFL/2X+IP
 F4dgfRpda4SZIvoGM0hCynNzT+j7ecQ4oeB3M4DST+Ag7zwVy9+jxplAeFVX82eR
 TSi5wKaaVTAUkyCkdZzUkTbmPPq40V6QKvHHh24c9Pp49ekrHhwBzF50yMZswDRH
 0RxV/L1eQzByt9a5LUq7kCEtbLJzqus0rYjIDNJEvDgtO3kP50OKQJvsgK4vThck
 WYGtjQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fd1dscup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 10:18:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2241ae15dcbso33640625ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 03:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742552307; x=1743157107;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5eBg7ja8t6Nygd6OTElfc/5vgmOpe0nAEpW8sRRtOJk=;
 b=NuZOiXcytUjgr9XZJXcM9pfrdP3VSz/HQYvSEvA+/iufgfIv8VeC2u0ffbbIT8P2Ft
 ExjJwbpyS+fcVlT11ZtkYqUnvTYEE1pPEjIhVjtPSfQrYWHniFCajZ0ACkoL0Fizw8sd
 nCZvBCMCK//oBRsUao/ME4E6b5Ut2JDiRTaHpuZedf+hgF19TlMW0ikTlZNZG81L9VeP
 SordMBqsqLUyGttLQfMWIl6be3AuTp4l9VVKWgpwwhNYvfZQvJbxRHaZtoXyDWDuOjDu
 jMt+020QJUj+4m5kkv9PCc3CPXTCCefd1L4LLj9sYpe4g3XnrNBVl5AXruuxlxbywPqQ
 3L8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeamhllHoEDlnLq6ZrzEPlmWNsPy5G/i+Wq9MFMS0Q7R8nuuSEbpBbRINQFtavHv1AUCPmLQD0B3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHFkWhhfM6Swr5zfju0+UpuNgBzipVYqWawwS+lVX561owDyPF
 Pjuqn6f603yIPCQnPsf2fLocGr9nasH/+1eZ6TNGuRw4577QveoKZwtO7FFWanA3vV+AcQuR0Fe
 6d3IncpPd3dgsF+acCCg62mU7nWIbmoyAyvKXwffwd8lM8BdaStPW7OmD/I/dH3B3Cas=
X-Gm-Gg: ASbGncvvKoZ5DHh20MxSWM7rH1WVmSDniudzFIegGmZh2gv2fUZfnpKhv75C3nHoZru
 b+HfZydkfxSJLggTPlrrRfxv8jziuoCO5LrGwy7Egtev/P2yNx0yxNVGnSV2cavBLQ+CA86WCPe
 OZFZ0k32o8EiQ5EkHH/d7tHBbFvgx/lGaK+j8WfRD59vuGyBFQ/wO+QIrBzl7VW0Qd1aeCiH/bw
 588Gk/L9K+d1xKgIyPNQbsetCYyq0l13rPmdjGmjxpCsWgQx0cwKY084wWLib93u06fh2v7FTNd
 FV43vB9k8f+1Un/xdP+Qo0qGJk14g3tGNEvR4GEd
X-Received: by 2002:a05:6a00:1885:b0:736:ab1d:7ed5 with SMTP id
 d2e1a72fcca58-73905623ea3mr4417221b3a.0.1742552306383; 
 Fri, 21 Mar 2025 03:18:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErmX0Cycyi+U1NWkOpEJp0xJt9qFz65i2lHVl9EBv5+u0a3sw/CEkjWmRV1B270fqfN0xDFA==
X-Received: by 2002:a05:6a00:1885:b0:736:ab1d:7ed5 with SMTP id
 d2e1a72fcca58-73905623ea3mr4417149b3a.0.1742552305596; 
 Fri, 21 Mar 2025 03:18:25 -0700 (PDT)
Received: from [10.204.65.49] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73906156e39sm1507114b3a.145.2025.03.21.03.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 03:18:25 -0700 (PDT)
Message-ID: <4ca8776c-3cc7-4266-8248-4a595fa19e7f@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 15:48:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] misc: fastrpc: Add polling mode support for
 fastRPC driver
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
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
Content-Language: en-US
In-Reply-To: <e46be95c-ca8d-48ce-a616-5f068bd28ebc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J5JGB4qE8ChFfpVx3RqCcHqkWl3xoqHz
X-Proofpoint-GUID: J5JGB4qE8ChFfpVx3RqCcHqkWl3xoqHz
X-Authority-Analysis: v=2.4 cv=T52MT+KQ c=1 sm=1 tr=0 ts=67dd3cf4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=3lyftV9mSLQnT4ktp5MA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_04,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210076
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



On 3/20/2025 9:27 PM, Ekansh Gupta wrote:
>
> On 3/20/2025 7:45 PM, Dmitry Baryshkov wrote:
>> On Thu, Mar 20, 2025 at 07:19:31PM +0530, Ekansh Gupta wrote:
>>> On 1/29/2025 4:10 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Jan 29, 2025 at 11:12:16AM +0530, Ekansh Gupta wrote:
>>>>> On 1/29/2025 4:59 AM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Jan 27, 2025 at 10:12:38AM +0530, Ekansh Gupta wrote:
>>>>>>> For any remote call to DSP, after sending an invocation message,
>>>>>>> fastRPC driver waits for glink response and during this time the
>>>>>>> CPU can go into low power modes. Adding a polling mode support
>>>>>>> with which fastRPC driver will poll continuously on a memory
>>>>>>> after sending a message to remote subsystem which will eliminate
>>>>>>> CPU wakeup and scheduling latencies and reduce fastRPC overhead.
>>>>>>> With this change, DSP always sends a glink response which will
>>>>>>> get ignored if polling mode didn't time out.
>>>>>> Is there a chance to implement actual async I/O protocol with the help
>>>>>> of the poll() call instead of hiding the polling / wait inside the
>>>>>> invoke2?
>>>>> This design is based on the implementation on DSP firmware as of today:
>>>>> Call flow: https://github.com/quic-ekangupt/fastrpc/blob/invokev2/Docs/invoke_v2.md#5-polling-mode
>>>>>
>>>>> Can you please give some reference to the async I/O protocol that you've
>>>>> suggested? I can check if it can be implemented here.
>>>> As with the typical poll() call implementation:
>>>> - write some data using ioctl
>>>> - call poll() / select() to wait for the data to be processed
>>>> - read data using another ioctl
>>>>
>>>> Getting back to your patch. from you commit message it is not clear,
>>>> which SoCs support this feature. Reminding you that we are supporting
>>>> all kinds of platforms, including the ones that are EoLed by Qualcomm.
>>>>
>>>> Next, you wrote that in-driver polling eliminates CPU wakeup and
>>>> scheduling. However this should also increase power consumption. Is
>>>> there any measurable difference in the latencies, granted that you
>>>> already use ioctl() syscall, as such there will be two context switches.
>>>> What is the actual impact?
>>> Hi Dmitry,
>>>
>>> Thank you for your feedback.
>>>
>>> I'm currently reworking this change and adding testing details. Regarding the SoC
>>> support, I'll add all the necessary information.
>> Please make sure that both the kernel and the userspace can handle the
>> 'non-supported' case properly.
> Yes, I will include changes to handle in both userspace and kernel.

I am seeking additional suggestions on handling "non-supported" cases before making the
changes.

Userspace: To enable DSP side polling, a remote call is made as defined in the DSP image.
If this call fails, polling mode will not be enabled from userspace.

Kernel: Since this is a DSP-specific feature, I plan to add a devicetree property, such
as "qcom,polling-supported," under the fastrpc node if the DSP supports polling mode.

Does this approach seem appropriate, or is there a better way to handle this?

Thanks,
Ekansh

>
>>> For now, with in-driver
>>> polling, we are seeing significant performance improvements for calls
>>> with different sized buffers. On polling supporting platform, I've observed an
>>> ~80us improvement in latency. You can find more details in the test
>>> results here: 
>>> https://github.com/quic/fastrpc/pull/134/files#diff-7dbc6537cd3ade7fea5766229cf585db585704e02730efd72e7afc9b148e28ed
>> Does the improvement come from the CPU not goint to idle or from the
>> glink response processing?
> Although both are contributing to performance improvement, the major
> improvement is coming from CPU not going to idle state.
>
> Thanks,
> Ekansh
>
>>> Regarding your concerns about power consumption, while in-driver polling
>>> eliminates CPU wakeup and scheduling, it does increase power consumption.
>>> However, the performance gains seem to outweigh this increase.
>>>
>>> Do you think the poll implementation that you suggested above could provide similar
>>> improvements?
>> No, I agree here. I was more concentrated on userspace polling rather
>> than hw polling.
>>

