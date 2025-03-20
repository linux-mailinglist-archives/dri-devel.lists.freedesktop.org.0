Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED385A6AA6F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 16:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FD310E0BB;
	Thu, 20 Mar 2025 15:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NthndX+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017AA10E0BB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 15:57:57 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KDvi1Q025564
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 15:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7EAFxyWTIXD2IGnfq82GcLshDDFop+FScfu6PliKyoE=; b=NthndX+41AkrKXLN
 gpUbr94ve4On6PUCVFGcAM3MJROe6ttkTe/PXJ8HkV0A02OLjHwqfCXx1mbUPM1F
 RQ1XMQGAi/fdziCTqePEOP5AyIZXlXeAue1a41M9hB7iF3pc72Ceh3pS1Au0ON1B
 g7g/LTKZneQ//e+yvUdNbI6Mqe+986IJ32+085KLp4yuTT69TyqBOZyYmzbx4euK
 S4+HS5I4pnGkEH7Mgd7jg5P6BBfI9VSXqJG5FKfkqDzyq+uE+CVMiYxl+VKHG4TV
 xQjM8bJ4f2Vave56zP4SSwKR3ceB/ni+Bx4Tk0ml3HZw2tmQPnDwbTa6UwHva9AW
 08h+lA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gbngj35s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 15:57:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2264e5b2b7cso12005005ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 08:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742486276; x=1743091076;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7EAFxyWTIXD2IGnfq82GcLshDDFop+FScfu6PliKyoE=;
 b=iZBmN1e5tYk8hL880vjlgrCoI8hGACCpLF5QOcJMgBCXD1xce1YajSeWNr7w0nE8/a
 FrStUF4KcPTJ/XhrnYFEhN9S+nv3zO8dVgRZXRZNLMbvkgf0RSO22lJATwuhB17LujBz
 q/7NNngTmOZOT+KZBIZF1CuFd82b0fiiQTxh/E3iEBAouN6h55vrX5V4oCboenYbd3MQ
 WUypPDsKq/SuOjWFqVRJdnGSabNYCjx3yEv5qbeCb39SEzQOjuomRMrgEiA+c97ZAQPg
 jKZ46nZn5+a5Tb5peeCymrFyBN7hK9+iFUsV096YjKpCdsah+H4h8l8dz5DX0ZeV+gE0
 Z33A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMpd2wv8SnhJ4jCt8lwuoLOqYnMEbd6TzrSEhs844v1T2YRzC5a8GDXQ1HExBCluOiekcHM/7LU/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoPn2/ek0+uPxhf8bJbeQ+zGGRYQEJ3qSOySIKnO8yM9W/YvJb
 JWP3tXnaa3zkHq5G30Sytt4PF9hHFLB8A2UwaXMO3dadpjn8AOn+gYgdpFCpRObEdylEvWDeY+P
 gXM6l9red8vsw/kN4cMzCJsJiJbK9QAF/DWTCAm9wXKXY1XRZGkTWP4BrtQWXla5o8/k=
X-Gm-Gg: ASbGncvzq8aYV7TbuZbh59YCzYwODLzhstOzBiUXH7TYBCuY6Xc59Fk6nbrrxWgv6Zd
 JTKM8CfscZX2BZ8keIT8/6VXFnbOdH53mSyVUPC+dXqpZUuu8c4lj3YtUpVc71VCs4Afjo9+grS
 mhRCP2rSNWILJ9SZb3EUcOD3WP79zppcBf9utrKc6Rvx7JFTCYFcWpPSpVEv7yiJt+YRMBOWE75
 AR7pTIIGTa0DXP9y2mrVU29LzLSCj5b2ABHf2HGkBoG4GE0DjfUOy32I+khCqzMFWKgU/dh2iGQ
 PPrr+moaOdV3pnfJUBjj9lnEnz9M9c0u37Hm6741qA==
X-Received: by 2002:a17:903:2ac6:b0:220:e362:9b1a with SMTP id
 d9443c01a7336-2265edee4b7mr69582605ad.25.1742486275692; 
 Thu, 20 Mar 2025 08:57:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi8XbhLs92+ZkMltC891+1rpGELh9oFO3sgLfdR5Hc5Ego4ssiojy48Xlws9pVR6ouyP0mhg==
X-Received: by 2002:a17:903:2ac6:b0:220:e362:9b1a with SMTP id
 d9443c01a7336-2265edee4b7mr69582035ad.25.1742486275268; 
 Thu, 20 Mar 2025 08:57:55 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.167.76])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c68884ecsm137243495ad.5.2025.03.20.08.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 08:57:54 -0700 (PDT)
Message-ID: <e46be95c-ca8d-48ce-a616-5f068bd28ebc@oss.qualcomm.com>
Date: Thu, 20 Mar 2025 21:27:42 +0530
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
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <2k6573yrw3dyn3rpwqz4asdpx3nlmj4ornm7kmxv3f4jlc6hzg@qkwn7gqduwri>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PXP1KubFx0jIVFZXm7KGYPOudX1hDGzA
X-Authority-Analysis: v=2.4 cv=MJ5gmNZl c=1 sm=1 tr=0 ts=67dc3b04 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=rQ4PyoImJZNyGwpw8nHSHQ==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=iVoIhCtSH5cMpfonS4MA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: PXP1KubFx0jIVFZXm7KGYPOudX1hDGzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_04,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200101
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



On 3/20/2025 7:45 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 20, 2025 at 07:19:31PM +0530, Ekansh Gupta wrote:
>>
>> On 1/29/2025 4:10 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jan 29, 2025 at 11:12:16AM +0530, Ekansh Gupta wrote:
>>>>
>>>> On 1/29/2025 4:59 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jan 27, 2025 at 10:12:38AM +0530, Ekansh Gupta wrote:
>>>>>> For any remote call to DSP, after sending an invocation message,
>>>>>> fastRPC driver waits for glink response and during this time the
>>>>>> CPU can go into low power modes. Adding a polling mode support
>>>>>> with which fastRPC driver will poll continuously on a memory
>>>>>> after sending a message to remote subsystem which will eliminate
>>>>>> CPU wakeup and scheduling latencies and reduce fastRPC overhead.
>>>>>> With this change, DSP always sends a glink response which will
>>>>>> get ignored if polling mode didn't time out.
>>>>> Is there a chance to implement actual async I/O protocol with the help
>>>>> of the poll() call instead of hiding the polling / wait inside the
>>>>> invoke2?
>>>> This design is based on the implementation on DSP firmware as of today:
>>>> Call flow: https://github.com/quic-ekangupt/fastrpc/blob/invokev2/Docs/invoke_v2.md#5-polling-mode
>>>>
>>>> Can you please give some reference to the async I/O protocol that you've
>>>> suggested? I can check if it can be implemented here.
>>> As with the typical poll() call implementation:
>>> - write some data using ioctl
>>> - call poll() / select() to wait for the data to be processed
>>> - read data using another ioctl
>>>
>>> Getting back to your patch. from you commit message it is not clear,
>>> which SoCs support this feature. Reminding you that we are supporting
>>> all kinds of platforms, including the ones that are EoLed by Qualcomm.
>>>
>>> Next, you wrote that in-driver polling eliminates CPU wakeup and
>>> scheduling. However this should also increase power consumption. Is
>>> there any measurable difference in the latencies, granted that you
>>> already use ioctl() syscall, as such there will be two context switches.
>>> What is the actual impact?
>> Hi Dmitry,
>>
>> Thank you for your feedback.
>>
>> I'm currently reworking this change and adding testing details. Regarding the SoC
>> support, I'll add all the necessary information.
> Please make sure that both the kernel and the userspace can handle the
> 'non-supported' case properly.

Yes, I will include changes to handle in both userspace and kernel.

>
>> For now, with in-driver
>> polling, we are seeing significant performance improvements for calls
>> with different sized buffers. On polling supporting platform, I've observed an
>> ~80us improvement in latency. You can find more details in the test
>> results here: 
>> https://github.com/quic/fastrpc/pull/134/files#diff-7dbc6537cd3ade7fea5766229cf585db585704e02730efd72e7afc9b148e28ed
> Does the improvement come from the CPU not goint to idle or from the
> glink response processing?

Although both are contributing to performance improvement, the major
improvement is coming from CPU not going to idle state.

Thanks,
Ekansh

>
>> Regarding your concerns about power consumption, while in-driver polling
>> eliminates CPU wakeup and scheduling, it does increase power consumption.
>> However, the performance gains seem to outweigh this increase.
>>
>> Do you think the poll implementation that you suggested above could provide similar
>> improvements?
> No, I agree here. I was more concentrated on userspace polling rather
> than hw polling.
>

