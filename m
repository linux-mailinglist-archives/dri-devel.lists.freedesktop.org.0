Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C75AFB311
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 14:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F50210E02B;
	Mon,  7 Jul 2025 12:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iABEEMq0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1D410E02B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 12:20:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 14FFD5C48A2;
 Mon,  7 Jul 2025 12:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28380C4CEE3;
 Mon,  7 Jul 2025 12:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751890806;
 bh=i7f9jXQ6vVn/S9Pa4ajyd/jAV+aMvJRzmZ0iGq6/XQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iABEEMq0FT7NEV8qEQxKrr16p0ypX1VdXlEXf35cheTi7S+U3vtHTYirrDABjFr8B
 ix/d9aR2Jk+JUj8+ej4oU5UamKOqAu0x1/afIopZvXX0xtC10Yyncg1c8iNZPMkCeS
 oZz+pR4e/X6n0tB+iefmxXNKqg6gIYAYi7AzszSALuc4WXwSvAiBIsWdAo785uC2cS
 tJg5sZCUZmR130UP3p/Ju/vP94fqLvtzvUHhgvgYvApB08VH3msQe9gdRw8+EakMGl
 Gp99M6XEbGgdVfVKJ4nbcj1t4SxqxLXGxCNxG0S1D3nU9bmZVI5sle997o4BhgRwSV
 VYNNGueoOuGYA==
Date: Mon, 7 Jul 2025 17:49:58 +0530
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
 Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 12/12] Documentation: tee: Add Qualcomm TEE driver
Message-ID: <aGu7boxOTB3TFRNU@sumit-X1>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
 <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-12-024e3221b0b9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-12-024e3221b0b9@oss.qualcomm.com>
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

On Mon, May 26, 2025 at 11:56:57PM -0700, Amirreza Zarrabi wrote:
> Add documentation for the Qualcomm TEE driver.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  Documentation/tee/index.rst |   1 +
>  Documentation/tee/qtee.rst  | 150 ++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                 |   1 +
>  3 files changed, 152 insertions(+)
> 
> diff --git a/Documentation/tee/index.rst b/Documentation/tee/index.rst
> index 4be6e69d7837..62afb7ee9b52 100644
> --- a/Documentation/tee/index.rst
> +++ b/Documentation/tee/index.rst
> @@ -11,6 +11,7 @@ TEE Subsystem
>     op-tee
>     amd-tee
>     ts-tee
> +   qtee
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/tee/qtee.rst b/Documentation/tee/qtee.rst
> new file mode 100644
> index 000000000000..8ae4da17c3a7
> --- /dev/null
> +++ b/Documentation/tee/qtee.rst
> @@ -0,0 +1,150 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=============================================
> +QTEE (Qualcomm Trusted Execution Environment)
> +=============================================
> +
> +The QTEE driver handles communication with Qualcomm TEE [1].
> +
> +The lowest level of communication with QTEE builds on the ARM SMC Calling
> +Convention (SMCCC) [2], which is the foundation for QTEE's Secure Channel
> +Manager (SCM) [3] used internally by the driver [4].
> +
> +In a QTEE-based system, services are represented as objects with a series of
> +operations that can be called to produce results, including other objects.
> +
> +When an object is hosted within QTEE, executing its operations is referred
> +to as direct invocation. QTEE can invoke objects hosted in the kernel or
> +userspace using a method known as callback requests.
> +
> +The SCM provides two functions for direct invocation and callback request:
> +
> +- QCOM_SCM_SMCINVOKE_INVOKE for direct invocation. It can return either
> +  a result or a callback request.
> +- QCOM_SCM_SMCINVOKE_CB_RSP submits a response for a previous callback request.
> +
> +The QTEE Transport Message [5] is stacked on top of the SCM driver functions.
> +
> +A message consists of two buffers shared with QTEE: inbound and outbound
> +buffers. The inbound buffer is used for direct invocation, and the outbound
> +buffer is used to make callback requests. This picture shows the contents of
> +a QTEE transport message::
> +
> +                                      +---------------------+
> +                                      |                     v
> +    +-----------------+-------+-------+------+--------------------------+
> +    | qcomtee_msg_    |object | buffer       |                          |
> +    |  object_invoke  |  id   | offset, size |                          | (inbound buffer)
> +    +-----------------+-------+--------------+--------------------------+
> +    <---- header -----><---- arguments ------><- in/out buffer payload ->
> +
> +                                      +-----------+
> +                                      |           v
> +    +-----------------+-------+-------+------+----------------------+
> +    | qcomtee_msg_    |object | buffer       |                      |
> +    |  callback       |  id   | offset, size |                      | (outbound buffer)
> +    +-----------------+-------+--------------+----------------------+
> +
> +Each buffer is started with a header and array of arguments.
> +
> +QTEE Transport Message supports four types of arguments:
> +
> +- Input Object (IO) is an object parameter to the current invocation
> +  or callback request.
> +- Output Object (OO) is an object parameter from the current invocation
> +  or callback request.
> +- Input Buffer (IB) is (offset, size) pair to the inbound or outbound region
> +  to store parameter to the current invocation or callback request.
> +- Output Buffer (OB) is (offset, size) pair to the inbound or outbound region
> +  to store parameter from the current invocation or callback request.
> +
> +The QTEE driver provides the qcomtee_object, which represents an object within
> +both QTEE and the kernel. To access any service in QTEE, a client needs to
> +invoke an instance of this object. Any structure intended to represent a service
> +for export to QTEE should include an instance of qcomtee_object::
> +
> +	struct driver_service {
> +		struct qcomtee_object object;
> +		...
> +	};
> +
> +	#define to_driver_service_object(o) container_of((o), struct driver_service, object)
> +
> +	static int driver_service_dispatch(struct qcomtee_object *object, u32 op,
> +					   struct qcomtee_arg *args)
> +	{
> +		struct driver_service *so = to_driver_service_object(object);
> +
> +		switch(op) {
> +		case OBJECT_OP1:
> +			...
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	static void driver_service_object_release(struct si_object *object)
> +	{
> +		struct driver_service *so = to_driver_service_object(object);
> +		kfree(so);
> +	}
> +
> +	struct si_object_operations driver_service_ops = {
> +		.release = driver_service_object_release;
> +		.dispatch = driver_service_dispatch;
> +	};
> +
> +	void service_init(void)
> +	{
> +		struct driver_service *so = kzalloc(sizeof(*so), GFP_KERNEL);
> +
> +		/* Initialize so->object as a callback object. */
> +		qcomtee_object_user_init(&so->object, QCOMTEE_OBJECT_TYPE_CB_OBJECT,
> +					 &driver_service_ops, "driver_service_object");
> +
> +		/* Invoke a QTEE object and pass/register 'so->object' with QTEE. */
> +		...
> +	}
> +	module_init(service_init);

Lets drop any reference for kernel client/services since they aren't
supported by this patch-set yet.

-Sumit

> +
> +The QTEE driver utilizes qcomtee_object to encapsulate userspace objects. When
> +a callback request is made, it translates into calling the dispatch operation.
> +For userspace objects, this is converted into requests accessible to callback
> +servers and available through generic TEE API IOCTLs.
> +
> +Picture of the relationship between the different components in the QTEE
> +architecture::
> +
> +         User space               Kernel                     Secure world
> +         ~~~~~~~~~~               ~~~~~~                     ~~~~~~~~~~~~
> +   +--------+   +----------+                                +--------------+
> +   | Client |   |callback  |                                | Trusted      |
> +   +--------+   |server    |                                | Application  |
> +      /\        +----------+                                +--------------+
> +      ||  +----------+ /\                                          /\
> +      ||  |callback  | ||                                          ||
> +      ||  |server    | ||                                          \/
> +      ||  +----------+ ||                                   +--------------+
> +      \/       /\      ||                                   | TEE Internal |
> +   +-------+   ||      ||                                   | API          |
> +   | TEE   |   ||      ||   +--------+--------+             +--------------+
> +   | Client|   ||      ||   | TEE    | QTEE   |             | QTEE         |
> +   | API   |   \/      \/   | subsys | driver |             | Trusted OS   |
> +   +-------+----------------+----+-------+----+-------------+--------------+
> +   |      Generic TEE API        |       |   QTEE MSG                      |
> +   |      IOCTL (TEE_IOC_*)      |       |   SMCCC (QCOM_SCM_SMCINVOKE_*)  |
> +   +-----------------------------+       +---------------------------------+
> +
> +References
> +==========
> +
> +[1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70015-11/qualcomm-trusted-execution-environment.html
> +
> +[2] http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
> +
> +[3] drivers/firmware/qcom/qcom_scm.c
> +
> +[4] drivers/tee/qcomtee/qcom_scm.c
> +
> +[5] drivers/tee/qcomtee/qcomtee_msg.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 99fe1ae22ae0..42823d33cc03 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20515,6 +20515,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
>  M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/tee/qtee.rst
>  F:	drivers/tee/qcomtee/
>  F:	include/linux/firmware/qcom/qcom_tee.h
>  
> 
> -- 
> 2.34.1
> 
