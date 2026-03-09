Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IaL2LgxormmEDwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 07:26:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0741C234260
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 07:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0A710E0ED;
	Mon,  9 Mar 2026 06:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GntI2Lvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3863D10E0ED;
 Mon,  9 Mar 2026 06:26:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DB3BF4060A;
 Mon,  9 Mar 2026 06:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D961FC4CEF7;
 Mon,  9 Mar 2026 06:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773037574;
 bh=GqoFkZnV4IXIHv8+oB3qo1IRkUTX2tpbcYPd6VonSUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GntI2Lvpo2zjzmEna0TworWTFsvKz1Zgob7x2BIN0FrjYhjDgUQpYjgTPkIS0DuWq
 DoIYjAIbF9Auz20oc3jJ96gZPDA5DNnvE8bFs1AfxjVFo3SR2JkBKLfLiflAk5ULdZ
 ScWVelJK+dRlkyKynlmYMfOfXp6QEResRN5KLqMw3ea+Lt1eGpXrsJDU5/lCUWFRAf
 Bnjfl9RWfMbStXmLsKvV5ke0EuVcJViqW/CTS6N8r91Oe3nyxr1cKFwg7HeKlCfq1w
 YGOludjfN883YDlQUXY0oHwtjg6zsN2hR0OI3GRIjMZJxBaRtCkW4VSRGhGnjGHV2q
 H/SM9ygSq32hQ==
Date: Mon, 9 Mar 2026 11:55:55 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
 akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
 dikshita.agarwal@oss.qualcomm.com, bod@kernel.org,
 mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
 mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
 jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
 vignesh.viswanathan@oss.qualcomm.com, srinivas.kandagatla@oss.qualcomm.com,
 amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
 op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
 skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
Message-ID: <aa5n8-6wpHXbXknT@sumit-xelite>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
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
X-Rspamd-Queue-Id: 0741C234260
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,netdev];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 11:47:55AM -0800, Trilok Soni wrote:
> On 3/6/2026 2:50 AM, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Qcom platforms has the legacy of using non-standard SCM calls
> > splintered over the various kernel drivers.
> 
> You are using multiple conflicting terminologies here. In the first statement
> you have used "non-standard" and immediately you have used "aren't complaint".

Here non-standard means the SCM calls aren't compliant with SMCCC
specifications here [1].

> 
> Which ARM document dictates that "standard" and "compliance" here?

It's SMCCC spec here [1].

> Are these
> SCM calls are using the vendor space per the spec, and if yes what does
> non-standard means here. 

See detailed explanation of non-standard SCM calls as part of OP-TEE review
here [2].

[1] https://developer.arm.com/documentation/den0028/latest/
[2] https://github.com/OP-TEE/optee_os/pull/7311#discussion_r2106654868

> 
>  These SCM calls aren't
> > compliant with the standard SMC calling conventions which is a
> > prerequisite to enable migration to the FF-A specifications from
> > Arm.
> > 
> > OP-TEE as an alternative trusted OS to QTEE can't support these non-
> 
> What is QTEE? 

Okay, I can expand that to Qualcomm TEE.

> 
> > standard SCM calls. And even for newer architectures QTEE won't be able
> 
> meaning of architecture please? Are you referring ARMv9.x or SOC architecture
> or software architecture? What does "newer" means? Is there
> any example available in public or are you ready to share? 

Okay, I should have mentioned newer architectures with SEL2 and Hafnium
support where FF-A is only going to be the supported communication
method.

> 
> > to support SCM calls either with FF-A requirements coming in. And with
> > both OP-TEE and QTEE drivers well integrated in the TEE subsystem, it
> > makes further sense to reuse the TEE bus client drivers infrastructure.
> > 
> > The added benefit of TEE bus infrastructure is that there is support
> > for discoverable/enumerable services. With that client drivers don't
> > have to manually invoke a special SCM call to know the service status.
> > 
> > So enable the generic Peripheral Authentication Service (PAS) provided
> > by the firmware. It acts as the common layer with different TZ
> > backends plugged in whether it's an SCM implementation or a proper
> > TEE bus based PAS service implementation.
> 
> I haven't checked cover letter in detail, but did you tested these patches
> w/ the devices which doesn't support these new facilities? 

Yeah, the patch-set has been tested to be backwards compatible with SCM
APIs too.

> 
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/Kconfig          |   8 +
> >  drivers/firmware/qcom/Makefile         |   1 +
> >  drivers/firmware/qcom/qcom_pas.c       | 295 +++++++++++++++++++++++++
> >  drivers/firmware/qcom/qcom_pas.h       |  53 +++++
> >  include/linux/firmware/qcom/qcom_pas.h |  41 ++++
> >  5 files changed, 398 insertions(+)
> >  create mode 100644 drivers/firmware/qcom/qcom_pas.c
> >  create mode 100644 drivers/firmware/qcom/qcom_pas.h
> >  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
> > 
> > diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> > index b477d54b495a..8653639d06db 100644
> > --- a/drivers/firmware/qcom/Kconfig
> > +++ b/drivers/firmware/qcom/Kconfig
> > @@ -6,6 +6,14 @@
> >  
> >  menu "Qualcomm firmware drivers"
> >  
> > +config QCOM_PAS
> > +	tristate
> > +	help
> > +	  Enable the generic Peripheral Authentication Service (PAS) provided
> > +	  by the firmware. It acts as the common layer with different TZ
> > +	  backends plugged in whether it's an SCM implementation or a proper
> > +	  TEE bus based PAS service implementation.
> > +
> >  config QCOM_SCM
> >  	select QCOM_TZMEM
> >  	tristate
> > diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
> > index 0be40a1abc13..dc5ab45f906a 100644
> > --- a/drivers/firmware/qcom/Makefile
> > +++ b/drivers/firmware/qcom/Makefile
> > @@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
> >  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
> >  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
> >  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
> > +obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
> > diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
> > new file mode 100644
> > index 000000000000..dc04ff1b6be0
> > --- /dev/null
> > +++ b/drivers/firmware/qcom/qcom_pas.c
> > @@ -0,0 +1,295 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/device/devres.h>
> > +#include <linux/firmware/qcom/qcom_pas.h>
> > +#include <linux/of.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> 
> are you sure you are using functionalities from these header files?
> 
> I couldn't find slab.h usage quickly and also qcom_scm.h. Can you please confirm?

You are right, I will drop the redundant header includes.

> 
> > +
> > +#include "qcom_pas.h"
> > +#include "qcom_scm.h"
> > +
> > +static struct qcom_pas_ops *ops_ptr;
> > +
> > +/**
> > + * devm_qcom_pas_context_alloc() - Allocate peripheral authentication service
> > + *				   context for a given peripheral
> > + *
> > + * PAS context is device-resource managed, so the caller does not need
> > + * to worry about freeing the context memory.
> > + *
> > + * @dev:	  PAS firmware device
> > + * @pas_id:	  peripheral authentication service id
> > + * @mem_phys:	  Subsystem reserve memory start address
> > + * @mem_size:	  Subsystem reserve memory size
> > + *
> > + * Returns: The new PAS context, or ERR_PTR() on failure.
> > + */
> > +struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
> > +						     u32 pas_id,
> > +						     phys_addr_t mem_phys,
> > +						     size_t mem_size)
> > +{
> > +	struct qcom_pas_context *ctx;
> > +
> > +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	ctx->dev = dev;
> > +	ctx->pas_id = pas_id;
> > +	ctx->mem_phys = mem_phys;
> > +	ctx->mem_size = mem_size;
> > +
> > +	return ctx;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_qcom_pas_context_alloc);
> > +
> > +/**
> > + * qcom_pas_init_image() - Initialize peripheral authentication service state
> > + *			   machine for a given peripheral, using the metadata
> > + * @pas_id:	peripheral authentication service id
> > + * @metadata:	pointer to memory containing ELF header, program header table
> > + *		and optional blob of data used for authenticating the metadata
> > + *		and the rest of the firmware
> > + * @size:	size of the metadata
> > + * @ctx:	optional pas context
> > + *
> > + * Return: 0 on success.
> > + *
> > + * Upon successful return, the PAS metadata context (@ctx) will be used to
> > + * track the metadata allocation, this needs to be released by invoking
> > + * qcom_pas_metadata_release() by the caller.
> > + */
> > +int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> > +			struct qcom_pas_context *ctx)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->init_image(ops_ptr->dev, pas_id,
> > +					   metadata, size, ctx);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_init_image);
> > +
> > +/**
> > + * qcom_pas_metadata_release() - release metadata context
> > + * @ctx:	pas context
> > + */
> > +void qcom_pas_metadata_release(struct qcom_pas_context *ctx)
> > +{
> > +	if (!ctx || !ctx->ptr)
> > +		return;
> > +
> > +	if (ops_ptr)
> > +		ops_ptr->metadata_release(ops_ptr->dev, ctx);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_metadata_release);
> > +
> > +/**
> > + * qcom_pas_mem_setup() - Prepare the memory related to a given peripheral
> > + *			  for firmware loading
> > + * @pas_id:	peripheral authentication service id
> > + * @addr:	start address of memory area to prepare
> > + * @size:	size of the memory area to prepare
> > + *
> > + * Returns 0 on success.
> > + */
> > +int qcom_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->mem_setup(ops_ptr->dev, pas_id, addr, size);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_mem_setup);
> > +
> > +/**
> > + * qcom_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
> > + *			      for a given peripheral.
> > + *
> > + * Qualcomm remote processor may rely on both static and dynamic resources for
> > + * its functionality. Static resources typically refer to memory-mapped
> > + * addresses required by the subsystem and are often embedded within the
> > + * firmware binary and dynamic resources, such as shared memory in DDR etc.,
> > + * are determined at runtime during the boot process.
> > + *
> > + * On Qualcomm Technologies devices, it's possible that static resources are
> > + * not embedded in the firmware binary and instead are provided by TrustZone.
> > + * However, dynamic resources are always expected to come from TrustZone. This
> 
> Is it confirmed that it will always come from Trustzone? Is it not possible
> that it can come from trusted controller - bypassing the trustzone? Assuming that
> such controller is never modified by anyone else including final device makers and
> blessed by the trust boundaries. 
> 
> Is this design going to scale if we put the MCU doing the heavy lifting instead? 

I am not aware of such an MCU implementation already but surely when
such implementation comes to life, we can always revisit the APIs
needed. The comments here reflects the implementations which exists as
of now.

> 
> 
> > + * indicates that for Qualcomm devices, all resources (static and dynamic) will
> > + * be provided by TrustZone PAS service.
> > + *
> > + * If the remote processor firmware binary does contain static resources, they
> > + * should be passed in input_rt. These will be forwarded to TrustZone for
> > + * authentication. TrustZone will then append the dynamic resources and return
> > + * the complete resource table in output_rt_tzm.
> > + *
> > + * If the remote processor firmware binary does not include a resource table,
> > + * the caller of this function should set input_rt as NULL and input_rt_size
> > + * as zero respectively.
> > + *
> > + * More about documentation on resource table data structures can be found in
> > + * include/linux/remoteproc.h
> > + *
> > + * @ctx:	    PAS context
> > + * @pas_id:	    peripheral authentication service id
> > + * @input_rt:       resource table buffer which is present in firmware binary
> > + * @input_rt_size:  size of the resource table present in firmware binary
> > + * @output_rt_size: TrustZone expects caller should pass worst case size for
> > + *		    the output_rt_tzm.
> > + *
> > + * Return:
> > + *  On success, returns a pointer to the allocated buffer containing the final
> > + *  resource table and output_rt_size will have actual resource table size from
> > + *  TrustZone. The caller is responsible for freeing the buffer. On failure,
> > + *  returns ERR_PTR(-errno).
> > + */
> > +struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
> > +					      void *input_rt,
> > +					      size_t input_rt_size,
> > +					      size_t *output_rt_size)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->get_rsc_table(ops_ptr->dev, ctx, input_rt,
> > +					      input_rt_size, output_rt_size);
> > +
> > +	return ERR_PTR(-ENODEV);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_get_rsc_table);
> > +
> > +/**
> > + * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
> > + *				   and reset the remote processor
> > + * @pas_id:	peripheral authentication service id
> > + *
> > + * Return 0 on success.
> > + */
> > +int qcom_pas_auth_and_reset(u32 pas_id)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_auth_and_reset);
> > +
> > +/**
> > + * qcom_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
> > + *				       remote processor
> > + *
> > + * @ctx:	Context saved during call to qcom_scm_pas_context_init()
> > + *
> > + * This function performs the necessary steps to prepare a PAS subsystem,
> > + * authenticate it using the provided metadata, and initiate a reset sequence.
> > + *
> > + * It should be used when Linux is in control setting up the IOMMU hardware
> > + * for remote subsystem during secure firmware loading processes. The
> > + * preparation step sets up a shmbridge over the firmware memory before
> > + * TrustZone accesses the firmware memory region for authentication. The
> > + * authentication step verifies the integrity and authenticity of the firmware
> > + * or configuration using secure metadata. Finally, the reset step ensures the
> > + * subsystem starts in a clean and sane state.
> > + *
> > + * Return: 0 on success, negative errno on failure.
> > + */
> > +int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->prepare_and_auth_reset(ops_ptr->dev, ctx);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_prepare_and_auth_reset);
> > +
> > +/**
> > + * qcom_pas_set_remote_state() - Set the remote processor state
> > + * @state:	peripheral state
> > + * @pas_id:	peripheral authentication service id
> > + *
> > + * Returns 0 on success.
> > + */
> > +int qcom_pas_set_remote_state(u32 state, u32 pas_id)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->set_remote_state(ops_ptr->dev, state, pas_id);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_set_remote_state);
> > +
> > +/**
> > + * qcom_pas_shutdown() - Shut down the remote processor
> > + * @pas_id:	peripheral authentication service id
> > + *
> > + * Returns 0 on success.
> > + */
> > +int qcom_pas_shutdown(u32 pas_id)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->shutdown(ops_ptr->dev, pas_id);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_shutdown);
> > +
> > +/**
> > + * qcom_pas_supported() - Check if the peripheral authentication service is
> > + *			  available for the given peripheral
> > + * @pas_id:	peripheral authentication service id
> > + *
> > + * Returns true if PAS is supported for this peripheral, otherwise false.
> > + */
> > +bool qcom_pas_supported(u32 pas_id)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->supported(ops_ptr->dev, pas_id);
> > +
> > +	return false;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_supported);
> > +
> > +/**
> > + * qcom_pas_is_available() - Check for PAS service
> > + *
> > + * Returns true on success.
> > + */
> > +bool qcom_pas_is_available(void)
> > +{
> > +	/* The barrier is needed to synchronize with client drivers. */
> > +	return !!smp_load_acquire(&ops_ptr);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_is_available);
> > +
> > +/**
> > + * qcom_pas_ops_register() - Register PAS service ops
> > + * @ops:	PAS service ops pointer
> > + */
> > +void qcom_pas_ops_register(struct qcom_pas_ops *ops)
> > +{
> > +	if (!qcom_pas_is_available())
> > +		/* The barrier is needed to synchronize with client drivers. */
> > +		smp_store_release(&ops_ptr, ops);
> > +	else
> > +		pr_err("qcom_pas: ops already registered\n");
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_ops_register);
> > +
> > +/**
> > + * qcom_pas_ops_unregister() - Unregister PAS service ops
> > + */
> > +void qcom_pas_ops_unregister(void)
> > +{
> > +	/* The barrier is needed to synchronize with client drivers. */
> > +	smp_store_release(&ops_ptr, NULL);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_ops_unregister);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Sumit Garg <sumit.garg@oss.qualcomm.com>");
> 
> What is the convention for Qualcomm authored drivers? In some drivers
> I find that Qualcomm doesn't add MODULE_AUTHOR. Can Qualcomm community
> clarify it here. I prefer consistency here for the Qualcomm submissions. 

Not sure if there can be a single Qualcomm policy across the upstream
kernel contributions. Generally I have seen this to vary from one
sub-system to another. In case of drivers/firmware/

$ git grep -nr MODULE_AUTHOR drivers/firmware/ | wc -l
54

whereas other subsystems prefer a maintainer's entry for new driver
code. The general idea is to keep module authors involved as part of
maintenence, reviews and bug reports. So I will leave this dicision to
Bjorn and Konrad being maintainers for drivers/firmware/qcom/.

> 
> > +MODULE_DESCRIPTION("Qualcomm common TZ PAS driver");
> > diff --git a/drivers/firmware/qcom/qcom_pas.h b/drivers/firmware/qcom/qcom_pas.h
> > new file mode 100644
> > index 000000000000..4ebed22178f8
> > --- /dev/null
> > +++ b/drivers/firmware/qcom/qcom_pas.h
> > @@ -0,0 +1,53 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef __QCOM_PAS_INT_H
> > +#define __QCOM_PAS_INT_H
> > +
> > +struct device;
> > +
> > +/**
> > + * struct qcom_pas_ops - Qcom Peripheral Authentication Service (PAS) ops
> > + * @drv_name:			PAS driver name.
> > + * @dev:			PAS device pointer.
> > + * @supported:			Peripheral supported callback.
> > + * @init_image:			Peripheral image initialization callback.
> > + * @mem_setup:			Peripheral memory setup callback.
> > + * @get_rsc_table:		Peripheral get resource table callback.
> > + * @prepare_and_auth_reset:	Peripheral prepare firmware authentication and
> > + *				reset callback.
> > + * @auth_and_reset:		Peripheral firmware authentication and reset
> > + *				callback.
> > + * @set_remote_state:		Peripheral set remote state callback.
> > + * @shutdown:			Peripheral shutdown callback.
> > + * @metadata_release:		Image metadata release callback.
> > + */
> > +struct qcom_pas_ops {
> > +	const char *drv_name;
> > +	struct device *dev;
> > +	bool (*supported)(struct device *dev, u32 pas_id);
> > +	int (*init_image)(struct device *dev, u32 pas_id,
> > +			  const void *metadata, size_t size,
> > +			  struct qcom_pas_context *ctx);
> > +	int (*mem_setup)(struct device *dev, u32 pas_id,
> > +			 phys_addr_t addr, phys_addr_t size);
> > +	void *(*get_rsc_table)(struct device *dev,
> > +			       struct qcom_pas_context *ctx,
> > +			       void *input_rt,
> > +			       size_t input_rt_size,
> > +			       size_t *output_rt_size);
> 
> void * or resource_table * as return? 

The generic wrapper qcom_pas_get_rsc_table() returns that. From TZ
interface perspective it's just a data buffer.

-Sumit
