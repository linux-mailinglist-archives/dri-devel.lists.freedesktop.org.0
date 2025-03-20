Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2312CA6A78A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D113D10E3A5;
	Thu, 20 Mar 2025 13:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhAAxBGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FEB10E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 13:49:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z6oM017516
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 13:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I7U4TbaEHlxMDt++dxxsV6U7qeF8FQoqCkKcr1ziLEQ=; b=UhAAxBGlEKi2/Dkp
 jQjbZcTuIdV5ia/5v2z45Pu9ubStpf0Lm7FPnMCetv0JdHkMki9tMGsh3XC2Dr7K
 ta1QwRHbv8FlyAPnXGektt7TSaRxDtDKVC3uwE68iBkHsV6l+gciOOMll8TsDIUH
 otjPUPh0JzWGox+FZixeGeETucG2ACSdnrycH8PmC4qItPsgvzLSgmBbuOReqJdh
 Sq8LCndsHfBaH0qjd5gxDi5ndb2byPa3KiflvU3n6en90T1aWFqbdyr7ge/wCeCT
 PesFx2FCgbsreHt4ma0gBS1+bvywRjomJ1le0NVnWCvD702i4F3NR6nZ23kv7JV1
 xPweuA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbs4bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 13:49:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2240a7aceeaso10981545ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 06:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742478577; x=1743083377;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I7U4TbaEHlxMDt++dxxsV6U7qeF8FQoqCkKcr1ziLEQ=;
 b=FFgXtgylrFoYCZ03JQSdnux1H0oUie9YDXnWvB0TtLdl/HjTLArqBIbmkR4Y2Kyc41
 jz1xkQvs+zWcCJBN/h7VzeSQFk8F9jPFIlrUC1YXqAiIURSIENgJG5pVQF6vKpLKAnVB
 UhxiPoAAP22uoepriFJo+mh5iHUWopjeVylGOcel6WAt5FfxZ6HJALk7wGjPf9TzK81+
 9nsyfo3F1WmpMXN6o8l28bmN9wJ5t6jMrIGRCz7Z+q9AJS87fOVUxfm7rm7KztnN0cwD
 7QoCgSPLECLw6MBtmAN8oVuKAJI01cHFnM9DpbBPQiUDP0QZ5yPwApG1bB+RAZz2wE9B
 7inQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcqgaDAg8xwK66WkZOVQ0qyb+S/OPG/Mc1hgJICE8bBB3YsHMA4k7T487rK5jhtTWr3tWdsAJJzFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS1mWVqzL7gQkrhNmBx2+UccXe/3hse/WcxR95tB7qw7qoan5B
 ve036g70vZogt8Oo/m+f1s1PoYzY/ZjE+pXUXvpDMkkuP8STG2F2sk5/VrS9RGEbvPR/u1Q6O+L
 pCBC/gSH0Vq5LZ8F0xQMRcFZMtSyIMUEtKvPEcPcyHXXVrIPbl6TbAL4RpB2B0UTcFe0=
X-Gm-Gg: ASbGnctBBBx1BRB39xAVShXkAmZf4uUQfgl1hWBN9WdJle8BtbClvc9HIYugix3Lkyl
 JpLWIqXyD4FDhhcV5yN05FyTHn8c4N4zeAbfPwID2AIsfgGliCiBaYXMEUZZmRo0hRRmho4mJDb
 3pyH7aq87U5QMlWB2mgborIKsKeuXLYTqshJcoVUwvinhr95ab+b8AGIbGbZgyqonOGhUcRQ7us
 v6zMvf97qr6WgTC00eppCzx5WOtnem9VXgM8d8SkNsgfJb3God6ri+k+GcvkGTxrURwVuuHcbxh
 ukWxYzKu5OFs271yTb0bZlKa/uEjDNVz/p33+hyJRA==
X-Received: by 2002:a05:6a00:4b56:b0:736:7a00:e522 with SMTP id
 d2e1a72fcca58-7376d5f182emr9991777b3a.2.1742478577117; 
 Thu, 20 Mar 2025 06:49:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkmX72k8cYdM55w18iIa7Nrgi0OFF5WGnj5G5TqwDvjTDZvJHic3ZcnZMmi1LvQv4sddN4rQ==
X-Received: by 2002:a05:6a00:4b56:b0:736:7a00:e522 with SMTP id
 d2e1a72fcca58-7376d5f182emr9991728b3a.2.1742478576612; 
 Thu, 20 Mar 2025 06:49:36 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.167.76])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73902baedf5sm296202b3a.146.2025.03.20.06.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 06:49:36 -0700 (PDT)
Message-ID: <939fcff6-fb93-487b-995b-88e3ff020784@oss.qualcomm.com>
Date: Thu, 20 Mar 2025 19:19:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 ekansh.gupta@oss.qualcomm.com
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-5-quic_ekangupt@quicinc.com>
 <hgox77a7e6zzriltwhzzciau6u2pmil4y3rl5o2l6zkp4fmlmp@q2dai5fxcvtq>
 <49295da9-82d4-45a0-a2a4-fdaa6600c70d@quicinc.com>
 <an4cvztdkqmrt7w2iaziihlxf4tbox65ze362v2lmycjnqg26y@jizjmh2ki34z>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <an4cvztdkqmrt7w2iaziihlxf4tbox65ze362v2lmycjnqg26y@jizjmh2ki34z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67dc1cf2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=rQ4PyoImJZNyGwpw8nHSHQ==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=aSIFMdu-n8rCKYYgogAA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: oOvYtHXIcMCBRee5G7K5_tp4-sLhzFS-
X-Proofpoint-GUID: oOvYtHXIcMCBRee5G7K5_tp4-sLhzFS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200085
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



On 1/29/2025 4:10 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 29, 2025 at 11:12:16AM +0530, Ekansh Gupta wrote:
>>
>>
>> On 1/29/2025 4:59 AM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 27, 2025 at 10:12:38AM +0530, Ekansh Gupta wrote:
>>>> For any remote call to DSP, after sending an invocation message,
>>>> fastRPC driver waits for glink response and during this time the
>>>> CPU can go into low power modes. Adding a polling mode support
>>>> with which fastRPC driver will poll continuously on a memory
>>>> after sending a message to remote subsystem which will eliminate
>>>> CPU wakeup and scheduling latencies and reduce fastRPC overhead.
>>>> With this change, DSP always sends a glink response which will
>>>> get ignored if polling mode didn't time out.
>>> Is there a chance to implement actual async I/O protocol with the help
>>> of the poll() call instead of hiding the polling / wait inside the
>>> invoke2?
>> This design is based on the implementation on DSP firmware as of today:
>> Call flow: https://github.com/quic-ekangupt/fastrpc/blob/invokev2/Docs/invoke_v2.md#5-polling-mode
>>
>> Can you please give some reference to the async I/O protocol that you've
>> suggested? I can check if it can be implemented here.
> As with the typical poll() call implementation:
> - write some data using ioctl
> - call poll() / select() to wait for the data to be processed
> - read data using another ioctl
>
> Getting back to your patch. from you commit message it is not clear,
> which SoCs support this feature. Reminding you that we are supporting
> all kinds of platforms, including the ones that are EoLed by Qualcomm.
>
> Next, you wrote that in-driver polling eliminates CPU wakeup and
> scheduling. However this should also increase power consumption. Is
> there any measurable difference in the latencies, granted that you
> already use ioctl() syscall, as such there will be two context switches.
> What is the actual impact?

Hi Dmitry,

Thank you for your feedback.

I'm currently reworking this change and adding testing details. Regarding the SoC
support, I'll add all the necessary information. For now, with in-driver
polling, we are seeing significant performance improvements for calls
with different sized buffers. On polling supporting platform, I've observed an
~80us improvement in latency. You can find more details in the test
results here: 
https://github.com/quic/fastrpc/pull/134/files#diff-7dbc6537cd3ade7fea5766229cf585db585704e02730efd72e7afc9b148e28ed

Regarding your concerns about power consumption, while in-driver polling
eliminates CPU wakeup and scheduling, it does increase power consumption.
However, the performance gains seem to outweigh this increase.

Do you think the poll implementation that you suggested above could provide similar
improvements?

Thanks,
Ekansh

>
>

