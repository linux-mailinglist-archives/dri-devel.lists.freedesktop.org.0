Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C905ADAE8B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 13:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038D510E328;
	Mon, 16 Jun 2025 11:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltHrVmla";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9955710E328
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 11:32:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8uLpc028921
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 11:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VhReFJIFGzRzknyzHaRK8EX3c4dPqPcybLOZHXiPHaI=; b=ltHrVmlaevrDM6Yw
 vDwkUIrqFh5TtWieEbQC1jISg4cA4vqe9qAL8rEjWPgMd+7nKkvyTI2vGQZPHX3J
 Ebht9/fAeja80kT38fIzNMbgJDtuIX1bZlc5fS8bpFIVrj7yjLFc7H9Dz1ONNZyo
 IJVa8Z2UnsW88IoOwiLZzC75BZvj73zwO7CEDs3Hzvb4V5L8EYBJkAC9G4H5REE6
 Ml3yJrduYbLAoLtHQad1xeiwOXzgDbkwTH6trNnrOgeNwdZB3dmMhXClZ4BK6Kem
 CPxBhCKqp9xTdPOFo9LV5GEg6u5nCHYBIp8x9V0Vk/i2TfVoEBQBApoNjyEsDUHA
 a2BqtQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mc8s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 11:32:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d399070cecso938231285a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 04:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750073541; x=1750678341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VhReFJIFGzRzknyzHaRK8EX3c4dPqPcybLOZHXiPHaI=;
 b=E7+hrsR9UrVReEChuwpwynCq4+PPztlFTxtRy6+Cc75vC4TzGHJPPgfUddcVCnJCdv
 Mc9AjqMAW4ssNOPpUwe60FXz8PsWwUg/UwcequMikXqqmnUYUlUua8kJHWcwuURGs/WM
 NmVRvXYasIYuM4JaAGa7eW/CDw/j5spcuwt8DOcuCa1VD4yiyOIR5X62IJuA4fARmlBq
 YxBSP/vL/ODbbsg/UiXMeNY/J5DaeN1f4SKXRcVmrj2FDrSRkrlCDqQXGD499xaDTJGO
 AJAvt53U1rILU++U2BkonDTHotLVDL4yxfzOPXX2BxHWqEqlV9XRLjLSot2AcA/Lhy3d
 M4Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7aZVHjUVM8bwHT7hqXAKupqn8HH5UgMnXxsbEZrXjtnl9eflGBm+Zx798EBLqewF6vLvfWSZNq7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlnKuTzpLg6yU+kPuuZVf4dQL8nxbPQwVTNyHidFq4b3fcCoH4
 qJ59RaGVULncUff9jlwf1bwi3LSCEINXvpTEyNQyUYUsIf9yx2eauDPMfUNG6fXFQ0UrPREavjT
 ZB33gddZKBemTmhz3o2l5FTfQsgdKOh5JQOfxazycaOgkOWCcfCkbj92Fg333VZNzyEJvQPs=
X-Gm-Gg: ASbGncvA47p2Y7OHtJtKOevfz04CqmhmyVt1geocyxqw64uCls9Dn7OXGE5ofKGKMU9
 g9orr2xSu0klF7TbVxwMTx7T2Z3ETTF8SxqchB571zD58m7k21P8uUL+2nvLgSJyyyuw5vzSCUX
 L6Hkj3sKTagB6JpLrW1FgiY4qF+k5zrpUvINKvpK43KMszU1ArOzl2wOzAb+PMD/v43BEdqF2Sl
 1CLVBpHiQqwCYUdUIk44xvt0ZVodovi3H+BtJtyxNvFfDGAV61LcQ/KsEOYDsk5IhVH4T3SrUhk
 VPF2Tw9xTJKtkAT1MGdL19a7k1qpVV6v0RprW+6AFOLj4SvucB1IQ0TFtVudpjIU2Ia/mIUdv3Y
 hze27rPliixNfg6h1TWsaywXzOQBu4Xu6FVS5cDyjWe+L6LtfZOpKCAEShMaxxt0Xr0rZ2ipvMY
 g=
X-Received: by 2002:a05:6214:3d9c:b0:6fb:3e3e:89da with SMTP id
 6a1803df08f44-6fb4776e0e4mr143194836d6.25.1750073540801; 
 Mon, 16 Jun 2025 04:32:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwjE7NgqGQJ5dlBHGyGS3GLtFKWMEQiXrYgTad8WhvvEtddvjIxuizLej1JtENs1oh6vFd5Q==
X-Received: by 2002:a05:6214:3d9c:b0:6fb:3e3e:89da with SMTP id
 6a1803df08f44-6fb4776e0e4mr143194396d6.25.1750073540332; 
 Mon, 16 Jun 2025 04:32:20 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a4:c3fb:c59f:e024:c669:a69b?
 (2001-14bb-a4-c3fb-c59f-e024-c669-a69b.rev.dnainternet.fi.
 [2001:14bb:a4:c3fb:c59f:e024:c669:a69b])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553ac1c1195sm1509064e87.141.2025.06.16.04.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 04:32:19 -0700 (PDT)
Message-ID: <cdf0accd-82dd-49e5-a8e5-1b4865e97356@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 14:32:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, quic_ekangupt@quicinc.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <e2a8528b-fa18-471f-9cb8-da64bb488f2a@quicinc.com>
 <07bfc5f3-1bcb-4018-bd63-8317ec6dac48@linaro.org>
 <5f70a482-6e61-4817-afdb-d5db4747897a@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <5f70a482-6e61-4817-afdb-d5db4747897a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MSBTYWx0ZWRfX3G6AEXbaCYtM
 2qgl4lImn3UjNdNpIqz0IxobFLDWo+bq2YVgE4UKd7yElsbaafRrnEz/Eo3wLUql9dgYjg9BEub
 hC19AITvQrOjMB+C8X+GfhBRq69fuAZOFOIuP+DThlFQpl0s2OWH4DLXUVQrwEEwZO17O+eoPyS
 79arliOC9fBdA7WTlLec2zfdZI1MCq81jvGHhwguzQEXE7QhB8h/vCFo0cvpuGdLXca6KYxf+n4
 krdskJaqIKdnxNsjnWZlY/5teI4EFR1qfX9y9DI3JDjW4zeJv0rTDIPSjO9a0kvDGAZzWhA54r9
 4/yHEcLPCEezC+nwLrJ0qlHzKV+BCJUiOOwePCSb8AO/++YANmG+QFlQwitSpYdL9k0fSi2zZdS
 fGPTYRRKXSbMl1w7SaH7Gq79tg/Bz3PS5OR3SgyrbxlYrAEvAzfWsQM7JPJfX15f6T/lmmf1
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=685000c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=iV2O8m49h_L4xXlhIwoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HnAQsJaYJxsBpWOKNIPOZCncj2ShSvVQ
X-Proofpoint-ORIG-GUID: HnAQsJaYJxsBpWOKNIPOZCncj2ShSvVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160071
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

On 16/06/2025 14:28, Ling Xu wrote:
> 在 4/8/2025 4:14 PM, Srinivas Kandagatla 写道:
>>
>>
>> On 07/04/2025 10:13, Ling Xu wrote:
>>> 在 3/21/2025 1:11 AM, Srinivas Kandagatla 写道:
>>>>
>>>>
>>>> On 20/03/2025 09:14, Ling Xu wrote:
>>>>> The fastrpc driver has support for 5 types of remoteprocs. There are
>>>>> some products which support GPDSP remoteprocs. Add changes to support
>>>>> GPDSP remoteprocs.
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>>>>> ---
>>>>>     drivers/misc/fastrpc.c | 10 ++++++++--
>>>>>     1 file changed, 8 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>>> index 7b7a22c91fe4..80aa554b3042 100644
>>>>> --- a/drivers/misc/fastrpc.c
>>>>> +++ b/drivers/misc/fastrpc.c
>>>>> @@ -28,7 +28,9 @@
>>>>>     #define SDSP_DOMAIN_ID (2)
>>>>>     #define CDSP_DOMAIN_ID (3)
>>>>>     #define CDSP1_DOMAIN_ID (4)
>>>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>>>> +#define GDSP0_DOMAIN_ID (5)
>>>>> +#define GDSP1_DOMAIN_ID (6)
>>>>
>>>> We have already made the driver look silly here, Lets not add domain ids for each instance, which is not a scalable.
>>>>
>>>> Domain ids are strictly for a domain not each instance.
>>>>
>>>>
>>>>> +#define FASTRPC_DEV_MAX        7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */
>>>>>     #define FASTRPC_MAX_SESSIONS    14
>>>>>     #define FASTRPC_MAX_VMIDS    16
>>>>>     #define FASTRPC_ALIGN        128
>>>>> @@ -107,7 +109,9 @@
>>>>>     #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>>>>       static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>>>>> -                        "sdsp", "cdsp", "cdsp1" };
>>>>> +                        "sdsp", "cdsp",
>>>>> +                        "cdsp1", "gdsp0",
>>>>> +                        "gdsp1" };
>>>>>     struct fastrpc_phy_page {
>>>>>         u64 addr;        /* physical address */
>>>>>         u64 size;        /* size of contiguous region */
>>>>> @@ -2338,6 +2342,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>>>             break;
>>>>>         case CDSP_DOMAIN_ID:
>>>>>         case CDSP1_DOMAIN_ID:
>>>>> +    case GDSP0_DOMAIN_ID:
>>>>> +    case GDSP1_DOMAIN_ID:
>>>>>             data->unsigned_support = true;
>>>>>             /* Create both device nodes so that we can allow both Signed and Unsigned PD */
>>>>>             err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
>>>>
>>>>
>>>> Can you try this patch: only compile tested.
>>>>
>>>> ---------------------------------->cut<---------------------------------------
>>>>   From 3f8607557162e16673b26fa253d11cafdc4444cf Mon Sep 17 00:00:00 2001
>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> Date: Thu, 20 Mar 2025 17:07:05 +0000
>>>> Subject: [PATCH] misc: fastrpc: cleanup the domain names
>>>>
>>>> Currently the domain ids are added for each instance of domain, this is
>>>> totally not scalable approch.
>>>>
>>>> Clean this mess and create domain ids for only domains not its
>>>> instances.
>>>> This patch also moves the domain ids to uapi header as this is required
>>>> for FASTRPC_IOCTL_GET_DSP_INFO ioctl.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> ---
>>>>    drivers/misc/fastrpc.c      | 45 ++++++++++++++++++++-----------------
>>>>    include/uapi/misc/fastrpc.h |  7 ++++++
>>>>    2 files changed, 32 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 7b7a22c91fe4..b3932897a437 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -23,12 +23,6 @@
>>>>    #include <uapi/misc/fastrpc.h>
>>>>    #include <linux/of_reserved_mem.h>
>>>>
>>>> -#define ADSP_DOMAIN_ID (0)
>>>> -#define MDSP_DOMAIN_ID (1)
>>>> -#define SDSP_DOMAIN_ID (2)
>>>> -#define CDSP_DOMAIN_ID (3)
>>>> -#define CDSP1_DOMAIN_ID (4)
>>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>>>    #define FASTRPC_MAX_SESSIONS    14
>>>>    #define FASTRPC_MAX_VMIDS    16
>>>>    #define FASTRPC_ALIGN        128
>>>> @@ -106,8 +100,6 @@
>>>>
>>>>    #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>>>
>>>> -static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>>>> -                        "sdsp", "cdsp", "cdsp1" };
>>>>    struct fastrpc_phy_page {
>>>>        u64 addr;        /* physical address */
>>>>        u64 size;        /* size of contiguous region */
>>>> @@ -1769,7 +1761,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>>>>            return  -EFAULT;
>>>>
>>>>        cap.capability = 0;
>>>> -    if (cap.domain >= FASTRPC_DEV_MAX) {
>>>> +    if (cap.domain >= FASTRPC_DOMAIN_MAX) {
>>>>            dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
>>>>                cap.domain, err);
>>>>            return -ECHRNG;
>>>
>>> I tested this patch and saw one issue.
>>> Here FASTRPC_DOMAIN_MAX is set to 4, but in userspace, cdsp1 is 4, gdsp0 is 5 and gdsp1 is 6.
>>
>>
>> Why is the userspace using something that is not uAPI?
>>
>> Why does it matter if its gdsp0 or gdsp1 for the userspace?
>> It should only matter if its gdsp domain or not.
>>
> 
> Give an example here:
> In test example, user can use below API to query the notification capability of the specific domain_id,
> (actually this will not have any functional issue, but just return an error and lead wrong message):
> request_status_notifications_enable(domain_id, (void*)STATUS_CONTEXT, pd_status_notifier_callback)
> 
> this will call ioctl_getdspinfo in fastrpc_ioctl.c:
> https://github.com/quic-lxu5/fastrpc/blob/8feccfd2eb46272ad1fabed195bfddb7fd680cbd/src/fastrpc_ioctl.c#L201
> 
> code snip:
> 	FARF(ALWAYS, "ioctl_getdspinfo in ioctl.c domain:%d", domain);
> 	ioErr = ioctl(dev, FASTRPC_IOCTL_GET_DSP_INFO, &cap);
> 	FARF(ALWAYS, "done ioctl_getdspinfo in ioctl.c ioErr:%x", ioErr);
> 
> and finally call fastrpc_get_dsp_info in fastrpc.c.
> 
> if I use the patch you shared, it will report below error:
> 
> UMD log:
> 2025-01-08T18:45:03.168718+00:00 qcs9100-ride-sx calculator: fastrpc_ioctl.c:201: ioctl_getdspinfo in ioctl.c domain:5
> 2025-01-08T18:45:03.169307+00:00 qcs9100-ride-sx calculator: log_config.c:396: file_watcher_thread starting for domain 5
> 2025-01-08T18:45:03.180355+00:00 qcs9100-ride-sx calculator: fastrpc_ioctl.c:203: done ioctl_getdspinfo in ioctl.c ioErr:ffffffff
> 
> putty log:
> [ 1332.308444] qcom,fastrpc 20c00000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: Error: Invalid domain id:5, err:0
> 
> Because on the user side, gdsp0 and gdsp1 will be distinguished to 5 and 6.
> so do you mean you want me to modify UMD code to transfer both gdsp0 and gdsp1 to gdsp just in ioctl_getdspinfo?

No, we need to modify the kernel code to ignore cap.domain here. The 
user has already open the particular FastRPC device. All queries should 
be target that device and that domain. As such, cap.domain doesn't make 
sense and should be ignored by the kernel.

>>
>> --srini
>>
>>
>>> For example, if we run a demo on gdsp0, cap.domain copied from userspace will be 5 which could lead to wrong message.
>>>
>>> --Ling Xu
>>>
>>>> @@ -2255,6 +2247,24 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
>>>>        return err;
>>>>    }
>>>>
>>>> +static int fastrpc_get_domain_id(const char *domain)
>>>> +{
>>>> +    if (strncmp(domain, "adsp", 4) == 0) {
>>>> +        return ADSP_DOMAIN_ID;
>>>> +    } else    if (strncmp(domain, "cdsp", 4) == 0) {
>>>> +        return CDSP_DOMAIN_ID;
>>>> +    } else if (strncmp(domain, "mdsp", 4) ==0) {
>>>> +        return MDSP_DOMAIN_ID;
>>>> +    } else if (strncmp(domain, "sdsp", 4) ==0) {
>>>> +        return SDSP_DOMAIN_ID;
>>>> +    } else if (strncmp(domain, "gdsp", 4) ==0) {
>>>> +        return GDSP_DOMAIN_ID;
>>>> +    }
>>>> +
>>>> +    return -EINVAL;
>>>> +
>>>> +}
>>>> +
>>>>    static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>>    {
>>>>        struct device *rdev = &rpdev->dev;
>>>> @@ -2272,15 +2282,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>>            return err;
>>>>        }
>>>>
>>>> -    for (i = 0; i < FASTRPC_DEV_MAX; i++) {
>>>> -        if (!strcmp(domains[i], domain)) {
>>>> -            domain_id = i;
>>>> -            break;
>>>> -        }
>>>> -    }
>>>> +    domain_id = fastrpc_get_domain_id(domain);
>>>>
>>>>        if (domain_id < 0) {
>>>> -        dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
>>>> +        dev_info(rdev, "FastRPC Domain %s not supported\n", domain);
>>>>            return -EINVAL;
>>>>        }
>>>>
>>>> @@ -2332,19 +2337,19 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>>        case SDSP_DOMAIN_ID:
>>>>            /* Unsigned PD offloading is only supported on CDSP and CDSP1 */
>>>>            data->unsigned_support = false;
>>>> -        err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
>>>> +        err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>>>>            if (err)
>>>>                goto fdev_error;
>>>>            break;
>>>>        case CDSP_DOMAIN_ID:
>>>> -    case CDSP1_DOMAIN_ID:
>>>> +    case GDSP_DOMAIN_ID:
>>>>            data->unsigned_support = true;
>>>>            /* Create both device nodes so that we can allow both Signed and Unsigned PD */
>>>> -        err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
>>>> +        err = fastrpc_device_register(rdev, data, true, domain);
>>>>            if (err)
>>>>                goto fdev_error;
>>>>
>>>> -        err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
>>>> +        err = fastrpc_device_register(rdev, data, false, domain);
>>>>            if (err)
>>>>                goto populate_error;
>>>>            break;
>>>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>>>> index f33d914d8f46..89516abd258f 100644
>>>> --- a/include/uapi/misc/fastrpc.h
>>>> +++ b/include/uapi/misc/fastrpc.h
>>>> @@ -133,6 +133,13 @@ struct fastrpc_mem_unmap {
>>>>        __s32 reserved[5];
>>>>    };
>>>>
>>>> +#define ADSP_DOMAIN_ID (0)
>>>> +#define MDSP_DOMAIN_ID (1)
>>>> +#define SDSP_DOMAIN_ID (2)
>>>> +#define CDSP_DOMAIN_ID (3)
>>>> +#define GDSP_DOMAIN_ID (4)
>>>> +
>>>> +#define FASTRPC_DOMAIN_MAX    4
>>>>    struct fastrpc_ioctl_capability {
>>>>        __u32 domain;
>>>>        __u32 attribute_id;
>>>
> 


-- 
With best wishes
Dmitry
