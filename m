Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC6DAB5D90
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 22:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4607D10E21C;
	Tue, 13 May 2025 20:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcwF8CSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B4E10E21C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 20:12:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIRouD008524
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 20:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6YBJCD9+B6LIXJcqML7tKi4Ri1Pgc2hPfbnQ4bC5It0=; b=DcwF8CSh/yvlKrnG
 36bvZLsDpSMWnbX+MV+5ykXfr7QWoFFS+p4lXMRPwX/e2DMaPJ/g71QmbSD8y2cN
 E6kHo/BP5XZOVNah9HfDW627oVJdZ5OIsvhkUciTyHsZXWCkqvO0JJyoeuj+Q7GC
 RY8c+sb7W878Qw49GA599YPuXeFNnBhfPe//AFTnCBlx0n32AKJ0nYenpF4OsIoV
 zZZq9nNZ6RPXSbT7UUuW76s06sKp0k2KIHHOxbWPin2ydnQrqEns4u9ap3H1jegq
 Mc931020xb0mSxKT5ekGzsR7HrizVkkpwVNMWY9eIlisTlw4E4g6NmWdYcTGWtcm
 tFu5Rg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr09mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 20:12:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7395d07a3dcso4046853b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 13:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747167129; x=1747771929;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6YBJCD9+B6LIXJcqML7tKi4Ri1Pgc2hPfbnQ4bC5It0=;
 b=Vs7vL9G/k80rTS0eJ7uV9JPivZrsEtqj/OIxJ17gAZs0tosrmZh+7F+mZ8+Ut8cLe3
 3HXpeifMfhIMEjuYCH72sJsEyR0qqPnzl6YMjeGrZbnkdBgXIjYDbYO+GYkyatUwtwg7
 IhVB+O3AY7gdZsNl5ktaG71FXP2PRzWcAe1d48gK0ZZHFi5UeIrlEsi8C5LWMb2Kf0+y
 EFcVd2IfiNGNVlwQA6O9jUwm5w52rWNza1eWe4Byxk12U/FgLPyXPCvFDbgwVIReNXXA
 4MWfm/cRpejsxFxISiilohlhQBKzLdtVPdPkukiqFZUlm+/4eoTpDZbg6nfuh6MJRhBH
 RisQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1h3rqnBHm+yJYLVjPb7qbkJokFoByhUwqDVYuRrmL003DvIhsVlShTu04izgU8cghjNKykFJz2zs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIsEPAuIfKmC9l+WWwZerFOOQkSgX8TcLmHRfxmzhayudjTgJo
 o+Fmm7FxsMBmZTQkU6DVJMZAmkQ1R7ZP7g2rCvzKLfZaQgsdy42Qa8QFGxcdUOZhR5pM/Ddry8r
 CFtkGxRuyoCbLx/XjcCMOeTYr2O3o1cc9vll0Ta+B9QEY/JqGDpQ1W6ro04f7vdIXTB8=
X-Gm-Gg: ASbGncvyb0+az+MHK1o6uiYXcv19Kg29SVmT6i8VBqXgRazz0jR5URwuQBMDQkBrSF1
 hWOysCa7J9FAy+pGHmQuCS7j+Vym3q1G5/dT/MjGVSkaipUuxuBSqf8ielSxkddMMAfBVWrpZXk
 o3+T+Xz+ehAUw1z0zucLwuwfNDgkKQan6DDaBijhS3kxTFc87FdRFAuPohCGsfWhG6r7jsj8aG2
 duZp9i+Le+8KFPbz88HhQjlo3cP9zQr6oL8qIeroUu07T+w5Vq4/0yndZYGvzIgk0CNyMWwxtTs
 TsNU7bpKaYV7QNm9dHY67qiVmr9A1Gsu1JufOIhxwPVIEzeuVRyY+pmsAzfVNg==
X-Received: by 2002:a05:6a20:b40b:b0:215:d4be:b0b2 with SMTP id
 adf61e73a8af0-215ff194438mr1020786637.34.1747167129378; 
 Tue, 13 May 2025 13:12:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2l7/XM3uuOT0jAka0OlH0GEvd8R+fhnrWvHSfV23dTxhF+Jpc2ojMeLtPKNDqRaYlORHQjQ==
X-Received: by 2002:a05:6a20:b40b:b0:215:d4be:b0b2 with SMTP id
 adf61e73a8af0-215ff194438mr1020728637.34.1747167128803; 
 Tue, 13 May 2025 13:12:08 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2350ddb6e8sm7696744a12.57.2025.05.13.13.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 13:12:08 -0700 (PDT)
Message-ID: <02feecf5-100b-46b5-8935-f75ffd77b493@oss.qualcomm.com>
Date: Tue, 13 May 2025 14:12:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add Reliability, Accessibility,
 Serviceability (RAS)
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 quic_carlv@quicinc.com, quic_thanson@quicinc.com, lizhi.hou@amd.com,
 quic_yabdulra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250512194937.3530774-1-jeff.hugo@oss.qualcomm.com>
 <8f4b977d-7846-416b-bae4-ac52665fe79c@linux.intel.com>
 <712eb205-a35a-49f4-a91f-ceebb3626108@oss.qualcomm.com>
 <157c5d01-e75f-4708-a1c2-0cbec292f671@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <157c5d01-e75f-4708-a1c2-0cbec292f671@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Y_BaXkEA4rahBhwPPjEPvaTFdpT4xR9x
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6823a79a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=vltyD8lluLRAM6EOmQMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uI6tdtgMuqcA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Y_BaXkEA4rahBhwPPjEPvaTFdpT4xR9x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE5MyBTYWx0ZWRfX1Zv/KsE7iQxV
 FCZqUmONZuhUbqhLPMTjtPgsMnSQ9RO1/abmoatqMC32qmIG/RMKFMLZGnVaOg/XOf3DWvKPRbD
 e+FHGxev8nVIZoNJYfrrIj+keXHS/8i7/t7iiinlx0hWYGdxXxsHk98Mtgkunwwe3l5GE1DPlCX
 5CNSzAUEIYXWcmwovIhQU3eJex6AczCbhWKUmZPxHaijanT0BSNwcJc5q6ugVqcib4fUE156YmQ
 AnQMNcd70sAZApjRNDuVV5MdhQp8SHnbGwPtZ5c/f8QndpVzhLMOTIMKS3ikV1kfcOz4qfRAqQN
 A/gLc/k8gVwH1V4aFkrGjVsODUAgBwScIsLu0zUSmYF//2rboC8MheHsPkhUHRgav1VKnLmDWxT
 7jOHMAD2VCKrqgGAdiv3eDds3pzFEQsJ3dlw0BqXK6tdl8/J1TxLlz8ekejurYy+6vj83H4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505130193
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

On 5/13/2025 10:13 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 5/13/2025 5:05 PM, Jeff Hugo wrote:
>> On 5/13/2025 3:53 AM, Jacek Lawrynowicz wrote:
>>> Hi,
>>>
>>> On 5/12/2025 9:49 PM, Jeff Hugo wrote:
>>>> diff --git a/drivers/accel/qaic/qaic_ras.c b/drivers/accel/qaic/qaic_ras.c
>>>> new file mode 100644
>>>> index 000000000000..2f8c1f08dbc0
>>>> --- /dev/null
>>>> +++ b/drivers/accel/qaic/qaic_ras.c
>>>> @@ -0,0 +1,629 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +/* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
>>>> +/* Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
>>>
>>> 2025?
>>
>> No, we haven't made any changes to this file this year, so our policy would be to omit 2025.  Historically we've experienced that the community wants the file markings like this to track any copyright prior to the inclusion of the code into upstream/mainline, and then to rely on git metadata to track copyright after inclusion. Therefore that is the policy we follow.  However, these markings might be changing based the rest of your feedback.
>>
>>>> +struct ras_data {
>>>> +    /* header start */
>>>> +    /* Magic number to validate the message */
>>>> +    u16 magic;
>>>> +    /* RAS version number */
>>>> +    u16 ver;
>>>> +    u32 seq_num;
>>>> +    /* RAS message type */
>>>> +    u8  type;
>>>> +    u8  id;
>>>> +    /* Size of RAS message without the header in byte */
>>>> +    u16 len;
>>>> +    /* header end */
>>>> +    s32 result;
>>>> +    /*
>>>> +     * Error source
>>>> +     * 0 : SoC Memory
>>>> +     * 1 : PCIE
>>>> +     * 2 : DDR
>>>> +     * 3 : System Bus source 1
>>>> +     * 4 : System Bus source 2
>>>> +     * 5 : NSP Memory
>>>> +     * 6 : Temperature Sensors
>>>> +     */
>>>> +    u32 source;
>>>> +    /*
>>>> +     * Stores the error type, there are three types of error in RAS
>>>> +     * 0 : correctable error (CE)
>>>> +     * 1 : uncorrectable error (UE)
>>>> +     * 2 : uncorrectable error that is non-fatal (UE_NF)
>>>> +     */
>>>> +    u32 err_type;
>>>> +    u32 err_threshold;
>>>
>>> This is unused. Maybe it could be useful?
>>
>> The device can be configured to only make a RAS report to the host after a threshold of events has occured - say every 10 DDR ECC events, report to the host (qaic driver). This field basically restates what that configured limit is. I suppose we can include it in the logged reports to signify that this report really represents N incidents on the device.
>>
>>>> +    case PCIE:
>>>> +        pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\n",
>>>> +               err_class_str[msg->err_type],
>>>> +               err_type_str[msg->err_type],
>>>> +               "error from",
>>>> +               err_src_str[msg->source]);
>>>> +
>>>> +        switch (msg->err_type) {
>>>> +        case CE:
>>>> +            printk(KERN_WARNING pr_fmt("Syndrome:\n    Bad TLP count %d\n    Bad DLLP count %d\n    Replay Rollover count %d\n    Replay Timeout count %d\n    Recv Error count %d\n    Internal CE count %d\n"),
>>>> +                   pcie_syndrome->bad_tlp,
>>>> +                   pcie_syndrome->bad_dllp,
>>>> +                   pcie_syndrome->replay_rollover,
>>>> +                   pcie_syndrome->replay_timeout,
>>>> +                   pcie_syndrome->rx_err,
>>>> +                   pcie_syndrome->internal_ce_count);
>>>
>>> Why not pci_printk() that would be conistent with the rest of logging?
>>> It there is a reson I would prefer pr_warn/pr_err style logs.
>>
>> This is a special case. This is a continuation of the pci_printk() a few lines up. If we do pci_printk() here, then the entire message gets broken up is a weird way. In the middle of the report, you'll have the "header" that pci_printk() adds (PCI device, driver, etc) repeted.
>>
>> The way to avoid that would be to restructure this bit of the code to have all the switches/ifs resolved, and have a single pci_printk() for the entire decoded report.  That means we'll have a lot of duplicated code since the common "report header" for the different PCIe reports would need to be duplicated for each report variant.
>>
>> This felt like the cleaner solution, although it does have its quirks.
>>
>> Would a comment help?
> 
> Sure, comment would make this more readable. I would still consider using a single pci_printk() per event anyway because you could get these messages broken up if there is a lot of dmesg output from other places.
> printk() takes a global lock in case there is VGA or serial console connected, so the messages wouldn't be split but it is up to you if you prefer cleaner code or cleaner logs.

Just for reference, these reports are similar to AER, and I recall 
seeing AER messages split in some instances. I don't recall difficulty 
in correlating such logs. I think I will go the cleaner code route. 
Luckily this rather internal to the driver so if we end up hating the 
logs, we can make adjustments later.

Will add a comment.

> 
>>>> +static void qaic_ras_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
>>>> +{
>>>> +    struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
>>>> +    struct ras_data *msg = mhi_result->buf_addr;
>>>> +    int ret;
>>>> +
>>>> +    if (mhi_result->transaction_status) {
>>>> +        kfree(msg);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    ras_msg_to_cpu(msg);
>>>> +    decode_ras_msg(qdev, msg);
>>>> +
>>>> +    ret = mhi_queue_buf(qdev->ras_ch, DMA_FROM_DEVICE, msg, sizeof(*msg), MHI_EOT);
>>>> +    if (ret) {
>>>> +        dev_err(&mhi_dev->dev, "Cannot requeue RAS recv buf %d\n", ret);
>>>> +        kfree(msg);
>>>
>>> Woudn't error here prevent any future messages from being received?
>>
>> Sadly, yes. This should only happen if there is some issue with the underlying PCIe link.
>>
>>>> diff --git a/drivers/accel/qaic/qaic_ras.h b/drivers/accel/qaic/qaic_ras.h
>>>> new file mode 100644
>>>> index 000000000000..5df6cb9dae80
>>>> --- /dev/null
>>>> +++ b/drivers/accel/qaic/qaic_ras.h
>>>> @@ -0,0 +1,11 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only
>>>
>>> Should be:
>>> /* SPDX-License-Identifier: GPL-2.0-only */
>>> or
>>> // SPDX-License-Identifier: GPL-2.0-only
>>
>> The "//" syntax is for C source files (foo.c) and this is a header file, so I don't think that suggestion applies.
>>
>> https://docs.kernel.org/process/license-rules.html
>>
>> C style comment ( /* */ ) is the correct syntax for header files. It is unclear to me that the marking needs to be its own comment, instead of included in the body of another comment. I would say that it is typical to have license markings and copyright markings in the same comment block.
>>
>> Do you have a reference you can point me to that would clarify this? Perhaps a different file in Documentation or another email thread?
> 
> This is a little bit pedantic but the docs you pointed to and every other .h file in the driver seem to close the comment on the same line.

I guess I interpret the doc is being specific to SPDX, therefore its 
outside of scope to bring copyright into the documentation.

Looking at the qaic driver, it appears we've made a bit of a mess.  This 
patch would align with-
mhi_controller.h
qaic.h
qaic_timesync.h

However, sahara.h and qaic_debugfs.h appear to follow what you are 
recommending here.

I think we'll update this patch per your suggestion, and do a cleanup to 
the driver to pick a style.

>>>> + *
>>>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>>>
>>> 2025?
>>
>> No, per the above reasons.
>>
>>>> + */
>>>> +
>>>> +#ifndef __QAIC_RAS_H__
>>>> +#define __QAIC_RAS_H__
>>>> +
>>>> +int qaic_ras_register(void);
>>>> +void qaic_ras_unregister(void);
>>>
>>> new line?
>>
>> Ok.
>>
>>>> +#endif /* __QAIC_RAS_H__ */
>>>
>>
> 

