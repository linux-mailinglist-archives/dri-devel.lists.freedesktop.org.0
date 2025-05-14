Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D832EAB6D10
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 15:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359B310E64C;
	Wed, 14 May 2025 13:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="poaFxfsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE04510E64C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 13:45:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D362A5C5D3C;
 Wed, 14 May 2025 13:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EFCC4CEE9;
 Wed, 14 May 2025 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747230315;
 bh=tY9VSV3EYK6S15qOsqtZyfX3P45eQ9SCKeZAOKjnJZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=poaFxfsG3CXVf7CPsoaC7uKLVBomAiUmow3+AqCC1SSxUugf1t1Mu9mbKennO1UZe
 e90OWXbI1hhiVNxl6vKdjPtv5G4TckIAFUf96SIlpqaFmsAOMWSP2fyudlvY7COdiZ
 5bV/sTy+G0uGTEOCTq3KEVArFYpaxu7UBCUQ+IuWVCOrlylV1RwUrY5Fwfk+jdAC1J
 PnkYoFFLQAmjjTWNc8h/lo8DN60Sh+lrFtck4xu0u6b11FTeKNdaZLTaBPt5fa3N9b
 FP+h3RXvu1wWCsz2rdAIMMo3fTBtrOixNFJZSQbEVKZae9dTo4kHSADlt1dF1bH1zG
 J1/mTCh0OYIkw==
Date: Wed, 14 May 2025 19:14:57 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 09/11] qcomtee: add primordial object
Message-ID: <aCSeWWCYNyGJakRp@sumit-X1>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-9-6a143640a6cb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-9-6a143640a6cb@oss.qualcomm.com>
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

On Mon, Apr 28, 2025 at 11:06:30PM -0700, Amirreza Zarrabi wrote:
> After booting, the kernel provides a static object known as the
> primordial object. This object is utilized by QTEE for native
> kernel services such as yield or privileged operations.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/qcomtee/Makefile          |  1 +
>  drivers/tee/qcomtee/core.c            | 19 +++++++---
>  drivers/tee/qcomtee/primordial_obj.c  | 65 +++++++++++++++++++++++++++++++++++
>  drivers/tee/qcomtee/qcomtee_private.h |  3 ++
>  4 files changed, 83 insertions(+), 5 deletions(-)

Looks reasonable to me, feel free to add:

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
> index 1b14b943e5f5..a3a2d00e83f0 100644
> --- a/drivers/tee/qcomtee/Makefile
> +++ b/drivers/tee/qcomtee/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_QCOMTEE) += qcomtee.o
>  qcomtee-objs += async.o
>  qcomtee-objs += call.o
>  qcomtee-objs += core.o
> +qcomtee-objs += primordial_obj.o
>  qcomtee-objs += qcom_scm.o
>  qcomtee-objs += release.o
>  qcomtee-objs += shm.o
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> index ad3b28f32529..a1ac492fd21a 100644
> --- a/drivers/tee/qcomtee/core.c
> +++ b/drivers/tee/qcomtee/core.c
> @@ -39,10 +39,12 @@ int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
>  }
>  
>  /*
> - * QTEE expects IDs with the QCOMTEE_MSG_OBJECT_NS_BIT set for objects
> - * of the QCOMTEE_OBJECT_TYPE_CB type.
> + * QTEE expects IDs with QCOMTEE_MSG_OBJECT_NS_BIT set for objects of
> + * QCOMTEE_OBJECT_TYPE_CB type. The first ID with QCOMTEE_MSG_OBJECT_NS_BIT
> + * set is reserved for the primordial object.
>   */
> -#define QCOMTEE_OBJECT_ID_START (QCOMTEE_MSG_OBJECT_NS_BIT + 1)
> +#define QCOMTEE_OBJECT_PRIMORDIAL (QCOMTEE_MSG_OBJECT_NS_BIT)
> +#define QCOMTEE_OBJECT_ID_START (QCOMTEE_OBJECT_PRIMORDIAL + 1)
>  #define QCOMTEE_OBJECT_ID_END (U32_MAX)
>  
>  #define QCOMTEE_OBJECT_SET(p, type, ...) \
> @@ -127,7 +129,9 @@ static void qcomtee_object_release(struct kref *refcount)
>   */
>  int qcomtee_object_get(struct qcomtee_object *object)
>  {
> -	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
> +	if (object != &qcomtee_primordial_object &&
> +	    object != NULL_QCOMTEE_OBJECT &&
> +	    object != ROOT_QCOMTEE_OBJECT)
>  		return kref_get_unless_zero(&object->refcount);
>  
>  	return 0;
> @@ -140,7 +144,9 @@ EXPORT_SYMBOL_GPL(qcomtee_object_get);
>   */
>  void qcomtee_object_put(struct qcomtee_object *object)
>  {
> -	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
> +	if (object != &qcomtee_primordial_object &&
> +	    object != NULL_QCOMTEE_OBJECT &&
> +	    object != ROOT_QCOMTEE_OBJECT)
>  		kref_put(&object->refcount, qcomtee_object_release);
>  }
>  EXPORT_SYMBOL_GPL(qcomtee_object_put);
> @@ -222,6 +228,9 @@ static struct qcomtee_object *qcomtee_local_object_get(unsigned int object_id)
>  {
>  	struct qcomtee_object *object;
>  
> +	if (object_id == QCOMTEE_OBJECT_PRIMORDIAL)
> +		return &qcomtee_primordial_object;
> +
>  	guard(rcu)();
>  	object = xa_load(&xa_qcom_local_objects, object_id);
>  	/* It already checks for %NULL_QCOMTEE_OBJECT. */
> diff --git a/drivers/tee/qcomtee/primordial_obj.c b/drivers/tee/qcomtee/primordial_obj.c
> new file mode 100644
> index 000000000000..a30967d89c91
> --- /dev/null
> +++ b/drivers/tee/qcomtee/primordial_obj.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/delay.h>
> +#include "qcomtee_private.h"
> +
> +/**
> + * DOC: Primordial Object
> + *
> + * After boot, the kernel provides a static object of type
> + * %QCOMTEE_OBJECT_TYPE_CB called the primordial object. This object is used
> + * for native kernel services or privileged operations.
> + *
> + * We support:
> + *  - %QCOMTEE_OBJECT_OP_YIELD to yield by the thread running in QTEE.
> + *  - %QCOMTEE_OBJECT_OP_SLEEP to wait for a period of time.
> + */
> +
> +#define QCOMTEE_OBJECT_OP_YIELD 1
> +#define QCOMTEE_OBJECT_OP_SLEEP 2
> +
> +static int
> +qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
> +				struct qcomtee_object *primordial_object_unused,
> +				u32 op, struct qcomtee_arg *args)
> +{
> +	int err = 0;
> +
> +	switch (op) {
> +	case QCOMTEE_OBJECT_OP_YIELD:
> +		cond_resched();
> +		/* No output object. */
> +		oic->data = NULL;
> +		break;
> +	case QCOMTEE_OBJECT_OP_SLEEP:
> +		/* Check message format matched QCOMTEE_OBJECT_OP_SLEEP op. */
> +		if (qcomtee_args_len(args) != 1 ||
> +		    args[0].type != QCOMTEE_ARG_TYPE_IB ||
> +		    args[0].b.size < sizeof(u32))
> +			return -EINVAL;
> +
> +		msleep(*(u32 *)(args[0].b.addr));
> +		/* No output object. */
> +		oic->data = NULL;
> +		break;
> +	default:
> +		err = -EINVAL;
> +	}
> +
> +	return err;
> +}
> +
> +static struct qcomtee_object_operations qcomtee_primordial_obj_ops = {
> +	.dispatch = qcomtee_primordial_obj_dispatch,
> +};
> +
> +struct qcomtee_object qcomtee_primordial_object = {
> +	.name = "primordial",
> +	.object_type = QCOMTEE_OBJECT_TYPE_CB,
> +	.ops = &qcomtee_primordial_obj_ops
> +};
> diff --git a/drivers/tee/qcomtee/qcomtee_private.h b/drivers/tee/qcomtee/qcomtee_private.h
> index a6f2c0591580..e59cfb3b79dd 100644
> --- a/drivers/tee/qcomtee/qcomtee_private.h
> +++ b/drivers/tee/qcomtee/qcomtee_private.h
> @@ -219,4 +219,7 @@ int qcomtee_user_object_submit(struct tee_context *ctx,
>  			       struct tee_param *params, int num_params,
>  			       int req_id, int errno);
>  
> +/* (2) Primordial Object. */
> +extern struct qcomtee_object qcomtee_primordial_object;
> +
>  #endif /* QCOMTEE_PRIVATE_H */
> 
> -- 
> 2.34.1
> 
