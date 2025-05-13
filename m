Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A77AB5801
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 17:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502B010E1C1;
	Tue, 13 May 2025 15:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwDtinf+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8893410E1C1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 15:05:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DDMCGv012961
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 15:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LE+Hp6Rx7yVP0EaJeO+uS1yNlOWDkQjBWo6PXJzjk5U=; b=IwDtinf++X5Ox5XE
 9SaZu4UTCbhBsLJnn0godFqLTfLUIY+NuJhfEISFH4Qc2hRjeTFEM42Is7JxVOLP
 550XnDlivqIWcOvXwWmhQL7OJE8ZdX2FcbSH+WDYAhZG5ZTXNCLzsHDArEmiEzDf
 /+Kgrhi2qMy75SxPRXmAfCJZpwYqoPr0zCFCzxhV3SCCzwfjUkTCY63kvdPZWYZ4
 mpsB4AHgrkzLL7Zb92ZzN0hmkq7auddlz+2Dw+/IzTcAxKA+VicKpo2kXk/k+4BD
 3v8qzBFusyKAY+K2sbYxScUwS33ims2+MHWDjmQsbJYPevQKXkyxqgdj7PpD1/7O
 OCau9A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyyp034n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 15:05:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-742849f4155so340596b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 08:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747148738; x=1747753538;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LE+Hp6Rx7yVP0EaJeO+uS1yNlOWDkQjBWo6PXJzjk5U=;
 b=GnFG0Rpn3SLbRwntOW4V2+gpmIVb3vi23TMUWum7fI4iy2/6xBimB4Oo+NIKYpMf6E
 gZ79yi3oRZa+khCeNdo8/COt1Cv/dfn8zQVqIBCMsFCraX2Oj9NdSuL0wczniKd97XKw
 wg8LIIEinbRRUc9gooyT6wF5jtc77vkY32Ai8M9KTIRcyRUVzDkUEHer2Cnc0NtDOAQI
 a4sKgkD2uoNBFicBgNXE8LZDRpJFsL1YahKNslwEUYYAE3ZByAMuUmHpg2yKigyvH0BC
 ktpkzh6LRJavFjdEg77KVbw4tnVdA768VtkJFSIei7APREobR5Dr1i6n4fiUDJcYCnM/
 XkJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmgx7S6+3elZyJdYDNb0pYP3LQVbTbfpbCkcsMoHIV631vsaW/TkeTRJ++z8SSXSdNea+zumcVEcs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxll9be1r6WWI2P6/NK9fsHn428kcYfg7BC/sSqR03Fmayqsrd8
 g8pqXlOqEd+4Ar8gmaVZNnTiVEEwy82Svsb0bmfdkbw72xczt/sqtzGoWIFTC6IJtqCxp62m+ci
 ZL3bGhtz4dG4CYFiRDfi74BYYZ7w4xzpIJQgPw+fV4fhm0TLm2eCDsKyAMdcjkOyCbxM=
X-Gm-Gg: ASbGncsGHZQZWyjiC2/NJfDFo3jSfidrdakRwl6AI9F5neJ0wQusYquUxINVpmP8u9X
 G/ID3VvDPaTSW2df830mY/7rK/dfegymCvMYr1eQkCx0w9c8HnfG9ntkocNuFvT03GErg2yV9PQ
 FN09whjNIOkO8S/2SriRMZK8e8maLdd5Nm6365SDk7LQVtwIBECOVtxA9VSea3SDjqZ8hFxRxnp
 LqzcDi+jNJP40aPPeIRlrSDo79h/Y0am4PiiMfcCoVModhuo0Fypdk+cQZkGDvOYIU74VFMxTyw
 dp6VK6SOlWewYCWelmrvDh+7ccku1D/T3tmiDsqqW9E199gDEplaHUKxyntboQ==
X-Received: by 2002:a05:6a00:2e17:b0:736:3ea8:4813 with SMTP id
 d2e1a72fcca58-74278fa9379mr4788806b3a.2.1747148738042; 
 Tue, 13 May 2025 08:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkx6eiBNhvgevyVj32vFRLyZJ7i1DR3ojl0nKuYSbEIhdl2uH3FdokSSose12ZsdC6WhgJrg==
X-Received: by 2002:a05:6a00:2e17:b0:736:3ea8:4813 with SMTP id
 d2e1a72fcca58-74278fa9379mr4788760b3a.2.1747148737509; 
 Tue, 13 May 2025 08:05:37 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237a0ffb6sm7856432b3a.111.2025.05.13.08.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 08:05:37 -0700 (PDT)
Message-ID: <712eb205-a35a-49f4-a91f-ceebb3626108@oss.qualcomm.com>
Date: Tue, 13 May 2025 09:05:35 -0600
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
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <8f4b977d-7846-416b-bae4-ac52665fe79c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE0MyBTYWx0ZWRfX6JVDBwSXRZtn
 7ahkKJHZigdhtO+1gcLLa0omPoKqeePSZ/gaT+c70pyhxZaMf91aPAt3m78Y84sSSAo6fVgTLKi
 YmejRrAKB1xte+DAdiK+u8yG0uBtMUvkOAcUlMHJi1vB8JD6heq2SjKPyjKfGjwdSEyEQGXPgnb
 a5HXU6BLSdTetFeSerSvN1l9vXb0I2AuXPtW8JmrAlzQn3ShFm6PEz+AcQpCW0pq9hK5vxVDvOF
 nCJiHqG0sKrj/oblmtWdcjq2HKMVkeXy7U9AIqa9Cjm6RY/i7BZf35GEdkpLxLl3H91Mk1R+2hn
 2DBHSSgs2DNim5kyr3GPou46ADnIcRUz3jSouMrv2roWzi0qaSMbu3I/YE9VHnsAaqDWueO61eC
 oUrmZkOXSdjo7dSwr3VezbXIPLXAwfKMpB/4WZlhri5UolwMYRfFqPY0+089FEJlMGGUsIxR
X-Proofpoint-ORIG-GUID: AUYfwesHUmm4beKHtD2YSjXOSwF-3FVV
X-Authority-Analysis: v=2.4 cv=Uo9jN/wB c=1 sm=1 tr=0 ts=68235fc3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=MlRnKu6zvT0s8JPrq2cA:9
 a=QEXdDO2ut3YA:10 a=uI6tdtgMuqcA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: AUYfwesHUmm4beKHtD2YSjXOSwF-3FVV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130143
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

On 5/13/2025 3:53 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 5/12/2025 9:49 PM, Jeff Hugo wrote:
>> diff --git a/drivers/accel/qaic/qaic_ras.c b/drivers/accel/qaic/qaic_ras.c
>> new file mode 100644
>> index 000000000000..2f8c1f08dbc0
>> --- /dev/null
>> +++ b/drivers/accel/qaic/qaic_ras.c
>> @@ -0,0 +1,629 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
>> +/* Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
> 
> 2025?

No, we haven't made any changes to this file this year, so our policy 
would be to omit 2025.  Historically we've experienced that the 
community wants the file markings like this to track any copyright prior 
to the inclusion of the code into upstream/mainline, and then to rely on 
git metadata to track copyright after inclusion. Therefore that is the 
policy we follow.  However, these markings might be changing based the 
rest of your feedback.

>> +struct ras_data {
>> +	/* header start */
>> +	/* Magic number to validate the message */
>> +	u16 magic;
>> +	/* RAS version number */
>> +	u16 ver;
>> +	u32 seq_num;
>> +	/* RAS message type */
>> +	u8  type;
>> +	u8  id;
>> +	/* Size of RAS message without the header in byte */
>> +	u16 len;
>> +	/* header end */
>> +	s32 result;
>> +	/*
>> +	 * Error source
>> +	 * 0 : SoC Memory
>> +	 * 1 : PCIE
>> +	 * 2 : DDR
>> +	 * 3 : System Bus source 1
>> +	 * 4 : System Bus source 2
>> +	 * 5 : NSP Memory
>> +	 * 6 : Temperature Sensors
>> +	 */
>> +	u32 source;
>> +	/*
>> +	 * Stores the error type, there are three types of error in RAS
>> +	 * 0 : correctable error (CE)
>> +	 * 1 : uncorrectable error (UE)
>> +	 * 2 : uncorrectable error that is non-fatal (UE_NF)
>> +	 */
>> +	u32 err_type;
>> +	u32 err_threshold;
> 
> This is unused. Maybe it could be useful?

The device can be configured to only make a RAS report to the host after 
a threshold of events has occured - say every 10 DDR ECC events, report 
to the host (qaic driver). This field basically restates what that 
configured limit is. I suppose we can include it in the logged reports 
to signify that this report really represents N incidents on the device.

>> +	case PCIE:
>> +		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\n",
>> +			   err_class_str[msg->err_type],
>> +			   err_type_str[msg->err_type],
>> +			   "error from",
>> +			   err_src_str[msg->source]);
>> +
>> +		switch (msg->err_type) {
>> +		case CE:
>> +			printk(KERN_WARNING pr_fmt("Syndrome:\n    Bad TLP count %d\n    Bad DLLP count %d\n    Replay Rollover count %d\n    Replay Timeout count %d\n    Recv Error count %d\n    Internal CE count %d\n"),
>> +			       pcie_syndrome->bad_tlp,
>> +			       pcie_syndrome->bad_dllp,
>> +			       pcie_syndrome->replay_rollover,
>> +			       pcie_syndrome->replay_timeout,
>> +			       pcie_syndrome->rx_err,
>> +			       pcie_syndrome->internal_ce_count);
> 
> Why not pci_printk() that would be conistent with the rest of logging?
> It there is a reson I would prefer pr_warn/pr_err style logs.

This is a special case. This is a continuation of the pci_printk() a few 
lines up. If we do pci_printk() here, then the entire message gets 
broken up is a weird way. In the middle of the report, you'll have the 
"header" that pci_printk() adds (PCI device, driver, etc) repeted.

The way to avoid that would be to restructure this bit of the code to 
have all the switches/ifs resolved, and have a single pci_printk() for 
the entire decoded report.  That means we'll have a lot of duplicated 
code since the common "report header" for the different PCIe reports 
would need to be duplicated for each report variant.

This felt like the cleaner solution, although it does have its quirks.

Would a comment help?

>> +static void qaic_ras_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
>> +{
>> +	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
>> +	struct ras_data *msg = mhi_result->buf_addr;
>> +	int ret;
>> +
>> +	if (mhi_result->transaction_status) {
>> +		kfree(msg);
>> +		return;
>> +	}
>> +
>> +	ras_msg_to_cpu(msg);
>> +	decode_ras_msg(qdev, msg);
>> +
>> +	ret = mhi_queue_buf(qdev->ras_ch, DMA_FROM_DEVICE, msg, sizeof(*msg), MHI_EOT);
>> +	if (ret) {
>> +		dev_err(&mhi_dev->dev, "Cannot requeue RAS recv buf %d\n", ret);
>> +		kfree(msg);
> 
> Woudn't error here prevent any future messages from being received?

Sadly, yes. This should only happen if there is some issue with the 
underlying PCIe link.

>> diff --git a/drivers/accel/qaic/qaic_ras.h b/drivers/accel/qaic/qaic_ras.h
>> new file mode 100644
>> index 000000000000..5df6cb9dae80
>> --- /dev/null
>> +++ b/drivers/accel/qaic/qaic_ras.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only
> 
> Should be:
> /* SPDX-License-Identifier: GPL-2.0-only */
> or
> // SPDX-License-Identifier: GPL-2.0-only

The "//" syntax is for C source files (foo.c) and this is a header file, 
so I don't think that suggestion applies.

https://docs.kernel.org/process/license-rules.html

C style comment ( /* */ ) is the correct syntax for header files. It is 
unclear to me that the marking needs to be its own comment, instead of 
included in the body of another comment. I would say that it is typical 
to have license markings and copyright markings in the same comment block.

Do you have a reference you can point me to that would clarify this? 
Perhaps a different file in Documentation or another email thread?

>> + *
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> 
> 2025?

No, per the above reasons.

>> + */
>> +
>> +#ifndef __QAIC_RAS_H__
>> +#define __QAIC_RAS_H__
>> +
>> +int qaic_ras_register(void);
>> +void qaic_ras_unregister(void);
> 
> new line?

Ok.

>> +#endif /* __QAIC_RAS_H__ */
> 

