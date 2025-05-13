Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C207AB597C
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 18:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D7F10E081;
	Tue, 13 May 2025 16:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHYdWnTf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9C310E081
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 16:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747152807; x=1778688807;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MxD1dfChZd59AS5bpR63vhxBAY0YNIfICb8zYTHa8x8=;
 b=OHYdWnTfvdrguazceojDgMtyvKoGRv1WPH+K8Itu3RPGTGHzmQb4inAr
 gK69KwnvfqvTLtCj/a9WeSq4bcVvsDORWsfD0Ff9y+MHn9a1c3AQmRAq4
 bm3SxsA9mvqnGh8rswCJX6RqgEJOAwOiKi0vofZJGg1F4aYdpvQ1QjCpx
 22jidZ1esdXJsa2oMo/OmeZkBa8WyFx1oL6nHT+8Qsx1fs0fznCruRbbz
 vKXv9/rg9KSymEsIb2A3F17MBZ+sIIwWTAQ5FdHaQeUeIJuXOYV6LkI42
 cSA140KQDMCMvZ5u/m/gYRY7Fd+PhwXZUfqGI82oqh5kGPb/GOR51mAK9 A==;
X-CSE-ConnectionGUID: W1XSxVtARH6Pty8gIej/MQ==
X-CSE-MsgGUID: 6xwQJZ7ZQkuTVv0INwEq/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52815610"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="52815610"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 09:13:26 -0700
X-CSE-ConnectionGUID: 35MzoiR+ThaVvFzj+aq2NA==
X-CSE-MsgGUID: gEZemlyTSwWOLEDW23oelQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="142516237"
Received: from llaguna-mobl1.ger.corp.intel.com (HELO [10.245.116.107])
 ([10.245.116.107])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 09:13:23 -0700
Message-ID: <157c5d01-e75f-4708-a1c2-0cbec292f671@linux.intel.com>
Date: Tue, 13 May 2025 18:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add Reliability, Accessibility,
 Serviceability (RAS)
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, quic_carlv@quicinc.com,
 quic_thanson@quicinc.com, lizhi.hou@amd.com, quic_yabdulra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250512194937.3530774-1-jeff.hugo@oss.qualcomm.com>
 <8f4b977d-7846-416b-bae4-ac52665fe79c@linux.intel.com>
 <712eb205-a35a-49f4-a91f-ceebb3626108@oss.qualcomm.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <712eb205-a35a-49f4-a91f-ceebb3626108@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

On 5/13/2025 5:05 PM, Jeff Hugo wrote:
> On 5/13/2025 3:53 AM, Jacek Lawrynowicz wrote:
>> Hi,
>>
>> On 5/12/2025 9:49 PM, Jeff Hugo wrote:
>>> diff --git a/drivers/accel/qaic/qaic_ras.c b/drivers/accel/qaic/qaic_ras.c
>>> new file mode 100644
>>> index 000000000000..2f8c1f08dbc0
>>> --- /dev/null
>>> +++ b/drivers/accel/qaic/qaic_ras.c
>>> @@ -0,0 +1,629 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +/* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
>>> +/* Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
>>
>> 2025?
> 
> No, we haven't made any changes to this file this year, so our policy would be to omit 2025.  Historically we've experienced that the community wants the file markings like this to track any copyright prior to the inclusion of the code into upstream/mainline, and then to rely on git metadata to track copyright after inclusion. Therefore that is the policy we follow.  However, these markings might be changing based the rest of your feedback.
> 
>>> +struct ras_data {
>>> +    /* header start */
>>> +    /* Magic number to validate the message */
>>> +    u16 magic;
>>> +    /* RAS version number */
>>> +    u16 ver;
>>> +    u32 seq_num;
>>> +    /* RAS message type */
>>> +    u8  type;
>>> +    u8  id;
>>> +    /* Size of RAS message without the header in byte */
>>> +    u16 len;
>>> +    /* header end */
>>> +    s32 result;
>>> +    /*
>>> +     * Error source
>>> +     * 0 : SoC Memory
>>> +     * 1 : PCIE
>>> +     * 2 : DDR
>>> +     * 3 : System Bus source 1
>>> +     * 4 : System Bus source 2
>>> +     * 5 : NSP Memory
>>> +     * 6 : Temperature Sensors
>>> +     */
>>> +    u32 source;
>>> +    /*
>>> +     * Stores the error type, there are three types of error in RAS
>>> +     * 0 : correctable error (CE)
>>> +     * 1 : uncorrectable error (UE)
>>> +     * 2 : uncorrectable error that is non-fatal (UE_NF)
>>> +     */
>>> +    u32 err_type;
>>> +    u32 err_threshold;
>>
>> This is unused. Maybe it could be useful?
> 
> The device can be configured to only make a RAS report to the host after a threshold of events has occured - say every 10 DDR ECC events, report to the host (qaic driver). This field basically restates what that configured limit is. I suppose we can include it in the logged reports to signify that this report really represents N incidents on the device.
> 
>>> +    case PCIE:
>>> +        pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\n",
>>> +               err_class_str[msg->err_type],
>>> +               err_type_str[msg->err_type],
>>> +               "error from",
>>> +               err_src_str[msg->source]);
>>> +
>>> +        switch (msg->err_type) {
>>> +        case CE:
>>> +            printk(KERN_WARNING pr_fmt("Syndrome:\n    Bad TLP count %d\n    Bad DLLP count %d\n    Replay Rollover count %d\n    Replay Timeout count %d\n    Recv Error count %d\n    Internal CE count %d\n"),
>>> +                   pcie_syndrome->bad_tlp,
>>> +                   pcie_syndrome->bad_dllp,
>>> +                   pcie_syndrome->replay_rollover,
>>> +                   pcie_syndrome->replay_timeout,
>>> +                   pcie_syndrome->rx_err,
>>> +                   pcie_syndrome->internal_ce_count);
>>
>> Why not pci_printk() that would be conistent with the rest of logging?
>> It there is a reson I would prefer pr_warn/pr_err style logs.
> 
> This is a special case. This is a continuation of the pci_printk() a few lines up. If we do pci_printk() here, then the entire message gets broken up is a weird way. In the middle of the report, you'll have the "header" that pci_printk() adds (PCI device, driver, etc) repeted.
> 
> The way to avoid that would be to restructure this bit of the code to have all the switches/ifs resolved, and have a single pci_printk() for the entire decoded report.  That means we'll have a lot of duplicated code since the common "report header" for the different PCIe reports would need to be duplicated for each report variant.
> 
> This felt like the cleaner solution, although it does have its quirks.
> 
> Would a comment help?

Sure, comment would make this more readable. I would still consider using a single pci_printk() per event anyway because you could get these messages broken up if there is a lot of dmesg output from other places.
printk() takes a global lock in case there is VGA or serial console connected, so the messages wouldn't be split but it is up to you if you prefer cleaner code or cleaner logs.

>>> +static void qaic_ras_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
>>> +{
>>> +    struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
>>> +    struct ras_data *msg = mhi_result->buf_addr;
>>> +    int ret;
>>> +
>>> +    if (mhi_result->transaction_status) {
>>> +        kfree(msg);
>>> +        return;
>>> +    }
>>> +
>>> +    ras_msg_to_cpu(msg);
>>> +    decode_ras_msg(qdev, msg);
>>> +
>>> +    ret = mhi_queue_buf(qdev->ras_ch, DMA_FROM_DEVICE, msg, sizeof(*msg), MHI_EOT);
>>> +    if (ret) {
>>> +        dev_err(&mhi_dev->dev, "Cannot requeue RAS recv buf %d\n", ret);
>>> +        kfree(msg);
>>
>> Woudn't error here prevent any future messages from being received?
> 
> Sadly, yes. This should only happen if there is some issue with the underlying PCIe link.
> 
>>> diff --git a/drivers/accel/qaic/qaic_ras.h b/drivers/accel/qaic/qaic_ras.h
>>> new file mode 100644
>>> index 000000000000..5df6cb9dae80
>>> --- /dev/null
>>> +++ b/drivers/accel/qaic/qaic_ras.h
>>> @@ -0,0 +1,11 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only
>>
>> Should be:
>> /* SPDX-License-Identifier: GPL-2.0-only */
>> or
>> // SPDX-License-Identifier: GPL-2.0-only
> 
> The "//" syntax is for C source files (foo.c) and this is a header file, so I don't think that suggestion applies.
> 
> https://docs.kernel.org/process/license-rules.html
> 
> C style comment ( /* */ ) is the correct syntax for header files. It is unclear to me that the marking needs to be its own comment, instead of included in the body of another comment. I would say that it is typical to have license markings and copyright markings in the same comment block.
> 
> Do you have a reference you can point me to that would clarify this? Perhaps a different file in Documentation or another email thread?

This is a little bit pedantic but the docs you pointed to and every other .h file in the driver seem to close the comment on the same line.

>>> + *
>>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>>
>> 2025?
> 
> No, per the above reasons.
> 
>>> + */
>>> +
>>> +#ifndef __QAIC_RAS_H__
>>> +#define __QAIC_RAS_H__
>>> +
>>> +int qaic_ras_register(void);
>>> +void qaic_ras_unregister(void);
>>
>> new line?
> 
> Ok.
> 
>>> +#endif /* __QAIC_RAS_H__ */
>>
> 

