Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHzPD1pyrmkCEgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:10:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AAC234A80
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2ACF10E491;
	Mon,  9 Mar 2026 07:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r76hKJ2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFC710E491;
 Mon,  9 Mar 2026 07:10:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A6BCD444A5;
 Mon,  9 Mar 2026 07:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385D9C4CEF7;
 Mon,  9 Mar 2026 07:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773040213;
 bh=anlN1bEDwp6gLpu0DonpgNFMrOv9gQCkQqPDDRuD4yI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=r76hKJ2I8YnvEycbUdZhv3g4ZucMWG3DrU/7k2lN54BJlvJ1k+RWM2uZ3aJSJ9Bvs
 xT1zlcdhrrmQV7f4CLWxjW03zc4ThseHDIAIiVkonas0A+h/Lyy7mMZ648MJQ+ys5X
 Ja+NdpjGJULQu2/t0UPF3ktQR7UfWEO73PisRIs11xG8jnLqb536sgyaa1ZIkoehhl
 KVeE4Efci2tVhO1rugF34+VUY8HL56nyceKWM2XFL9OSHxMfNKuChpv4OEbTA9WVXP
 7B/3EnhTlmPySluWf2X7hhhMMH7cy00+R1sZ0omJQDo/qmsY9KBTKlk/XnExxVhniT
 vRKhDcgeTwEDQ==
Message-ID: <52cd78c2-95e2-4f56-9adc-242b6cf3baab@kernel.org>
Date: Mon, 9 Mar 2026 08:10:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
 akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
 dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
 elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 jjohnson@kernel.org, mathieu.poirier@linaro.org,
 trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
 pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
 tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
 srinivas.kandagatla@oss.qualcomm.com, amirreza.zarrabi@oss.qualcomm.com,
 jens.wiklander@linaro.org, op-tee@lists.trustedfirmware.org,
 apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <5dab61a6-d8cc-431d-b59e-744d98195d90@kernel.org>
 <aa5Sw1qcCnD5clth@sumit-xelite>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aa5Sw1qcCnD5clth@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: E1AAC234A80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,netdev];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 09/03/2026 05:55, Sumit Garg wrote:
> On Fri, Mar 06, 2026 at 12:15:01PM +0100, Krzysztof Kozlowski wrote:
>> On 06/03/2026 11:50, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> Qcom platforms has the legacy of using non-standard SCM calls
>>> splintered over the various kernel drivers. These SCM calls aren't
>>> compliant with the standard SMC calling conventions which is a
>>> prerequisite to enable migration to the FF-A specifications from
>>> Arm.
>>>
>>> OP-TEE as an alternative trusted OS to QTEE can't support these non-
>>> standard SCM calls. And even for newer architectures QTEE won't be able
>>> to support SCM calls either with FF-A requirements coming in. And with
>>> both OP-TEE and QTEE drivers well integrated in the TEE subsystem, it
>>> makes further sense to reuse the TEE bus client drivers infrastructure.
>>>
>>> The added benefit of TEE bus infrastructure is that there is support
>>> for discoverable/enumerable services. With that client drivers don't
>>> have to manually invoke a special SCM call to know the service status.
>>>
>>> So enable the generic Peripheral Authentication Service (PAS) provided
>>> by the firmware. It acts as the common layer with different TZ
>>> backends plugged in whether it's an SCM implementation or a proper
>>> TEE bus based PAS service implementation.
>>>
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>>  drivers/firmware/qcom/Kconfig          |   8 +
>>>  drivers/firmware/qcom/Makefile         |   1 +
>>>  drivers/firmware/qcom/qcom_pas.c       | 295 +++++++++++++++++++++++++
>>>  drivers/firmware/qcom/qcom_pas.h       |  53 +++++
>>>  include/linux/firmware/qcom/qcom_pas.h |  41 ++++
>>>  5 files changed, 398 insertions(+)
>>>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>>>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>>>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
>>>
>>> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
>>> index b477d54b495a..8653639d06db 100644
>>> --- a/drivers/firmware/qcom/Kconfig
>>> +++ b/drivers/firmware/qcom/Kconfig
>>> @@ -6,6 +6,14 @@
>>>  
>>>  menu "Qualcomm firmware drivers"
>>>  
>>> +config QCOM_PAS
>>> +	tristate
>>> +	help
>>> +	  Enable the generic Peripheral Authentication Service (PAS) provided
>>> +	  by the firmware. It acts as the common layer with different TZ
>>> +	  backends plugged in whether it's an SCM implementation or a proper
>>> +	  TEE bus based PAS service implementation.
>>> +
>>>  config QCOM_SCM
>>>  	select QCOM_TZMEM
>>>  	tristate
>>> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
>>> index 0be40a1abc13..dc5ab45f906a 100644
>>> --- a/drivers/firmware/qcom/Makefile
>>> +++ b/drivers/firmware/qcom/Makefile
>>> @@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>>>  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
>>>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
>>>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
>>> +obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
>>> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
>>> new file mode 100644
>>> index 000000000000..dc04ff1b6be0
>>> --- /dev/null
>>> +++ b/drivers/firmware/qcom/qcom_pas.c
>>> @@ -0,0 +1,295 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#include <linux/delay.h>
>>> +#include <linux/device/devres.h>
>>> +#include <linux/firmware/qcom/qcom_pas.h>
>>> +#include <linux/of.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/slab.h>
>>> +
>>> +#include "qcom_pas.h"
>>> +#include "qcom_scm.h"
>>> +
>>> +static struct qcom_pas_ops *ops_ptr;
>>
>> I really dislike this singleton design. And it is not even needed! If
>> you were storing here some allocated instance of SCM/PAS I could
>> understand, but singleton for only ops? Just implement one driver (so
>> SCM + whatever you have here) which will decide which ops to use,
>> through the probe. Really, this is neither needed nor beneficial.
> 
> The motivation here is rather quite opposite to the single monolithic
> SCM driver design. The TZ services like PAS, ICE and so on are going to
> be implemented as independent discoverable devices on TEE bus which
> rather needs independent kernel client drivers.

You still have singleton here. So if you think you do opposite to
singleton, then drop this static.

> 
> Also, the single driver probe can't work here since the SCM driver is
> bound to the platform bus whereas the TEE PAS driver is bound to the TEE
> bus. So there is a reason for the current design.
> 
>>
>> It actually leads to more problems with this barrier handling, see
>> further comments.
> 
> The barrier handling is something that I carried over from existing
> implmentation but I can't see a reason why it can't be replaced with a
> simple mutex. See diff below for mutex.
> 
>> ...
>>
>>> +
>>> +/**
>>> + * qcom_pas_shutdown() - Shut down the remote processor
>>> + * @pas_id:	peripheral authentication service id
>>> + *
>>> + * Returns 0 on success.
>>> + */
>>> +int qcom_pas_shutdown(u32 pas_id)
>>> +{
>>> +	if (ops_ptr)
>>> +		return ops_ptr->shutdown(ops_ptr->dev, pas_id);
>>> +
>>> +	return -ENODEV;
>>> +}
>>> +EXPORT_SYMBOL_GPL(qcom_pas_shutdown);
>>> +
>>> +/**
>>> + * qcom_pas_supported() - Check if the peripheral authentication service is
>>> + *			  available for the given peripheral
>>> + * @pas_id:	peripheral authentication service id
>>> + *
>>> + * Returns true if PAS is supported for this peripheral, otherwise false.
>>> + */
>>> +bool qcom_pas_supported(u32 pas_id)
>>> +{
>>> +	if (ops_ptr)
>>
>> Lack of barriers here is not looking right. Existing/old code is not a
>> good example, I fixed only the obvious issue, but new code should be
>> correct from the beginning.
>>
>> Barriers should normally be always paired, unless you have some clear
>> path no concurrent execution can happen here, but such explanation is
>> missing, look:
> 
> Actually concurrent execution is rather required here since TZ can
> support parallel bring-up of co-processors. The synchonization is only
> needed when PAS client drivers are performing a deferred probe waiting
> for the service to be available. However, you are right explanation is
> missing here which I will add in the next version.

Hm? Existing comments are completely useless. Your comment said just
"barrier" basically... That's nothing useful.

Best regards,
Krzysztof
