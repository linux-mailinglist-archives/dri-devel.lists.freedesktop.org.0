Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F269EB0C16D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 12:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FC810E0B8;
	Mon, 21 Jul 2025 10:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LlmGrbRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6984710E0B8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 10:41:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 298FF5C44A1;
 Mon, 21 Jul 2025 10:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8605C4CEED;
 Mon, 21 Jul 2025 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753094508;
 bh=32Ezd9NHPvzGB4MDFi30pMB3r9Wjp+fpFw2xP3JHvY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LlmGrbRwMWzgGwcOoMjFfintV8khXNcvjHKwl4d5ba703ep1CUXoCSElSrZg41zJL
 NiwpSBE1SpIFC8eashXR3B3/MbumZoqlqQpc1W6Panr7a+ba4Yuez589tTwZQGHs4G
 WvaU5rDfW9uBKwQhe1dVtobUkiOnUzZ91ufbNvvUt5NPeM7Ebca4kMejSnmJNMpfgC
 43/WqkAfQCU9EgY+NdsZ2u6gUszl+BLcTSY6Xu2E5sLMggIWdEYoJkTcLLEBy2uMsg
 i7ICE/bBMUfhF4rUoaI+KQHN40j8JJvBRlNNpDm9mPb/rXSpf8v6wyeBZZwGDNMcad
 n2ieNHuK0n9sQ==
Date: Mon, 21 Jul 2025 16:11:34 +0530
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
Subject: Re: [PATCH v6 12/12] Documentation: tee: Add Qualcomm TEE driver
Message-ID: <aH4ZXmsKu08F5uPL@sumit-X1>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
 <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-12-697fb7d41c36@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-12-697fb7d41c36@oss.qualcomm.com>
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

On Sun, Jul 13, 2025 at 05:49:24PM -0700, Amirreza Zarrabi wrote:
> Add documentation for the Qualcomm TEE driver.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  Documentation/tee/index.rst |  1 +
>  Documentation/tee/qtee.rst  | 96 +++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                 |  1 +
>  3 files changed, 98 insertions(+)

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

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
> index 000000000000..2fa2c1bf6384
> --- /dev/null
> +++ b/Documentation/tee/qtee.rst
> @@ -0,0 +1,96 @@
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
> +Manager (SCM) [3] used internally by the driver.
> +
> +In a QTEE-based system, services are represented as objects with a series of
> +operations that can be called to produce results, including other objects.
> +
> +When an object is hosted within QTEE, executing its operations is referred
> +to as "direct invocation". QTEE can also invoke objects hosted in the non-secure
> +world using a method known as "callback request".
> +
> +The SCM provides two functions to support direct invocation and callback requests:
> +
> +- QCOM_SCM_SMCINVOKE_INVOKE: Used for direct invocation. It can return either
> +  a result or initiate a callback request.
> +- QCOM_SCM_SMCINVOKE_CB_RSP: Used to submit a response to a callback request
> +  triggered by a previous direct invocation.
> +
> +The QTEE Transport Message [4] is stacked on top of the SCM driver functions.
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
> +      ||       /\      ||                                   | TEE Internal |
> +      ||       ||      ||                                   | API          |
> +      \/       \/      \/   +--------+--------+             +--------------+
> +   +---------------------+  | TEE    | QTEE   |             | QTEE         |
> +   |   libqcomtee [5]    |  | subsys | driver |             | Trusted OS   |
> +   +-------+-------------+--+----+-------+----+-------------+--------------+
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
> +[4] drivers/tee/qcomtee/qcomtee_msg.h
> +
> +[5] https://github.com/quic/quic-teec
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9fc58f48fa14..391fc6e6defc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20706,6 +20706,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
>  M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/tee/qtee.rst
>  F:	drivers/tee/qcomtee/
>  
>  QUALCOMM TRUST ZONE MEMORY ALLOCATOR
> 
> -- 
> 2.34.1
> 
