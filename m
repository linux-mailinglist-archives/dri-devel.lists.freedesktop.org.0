Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A25934C7A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 13:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062D810E7A2;
	Thu, 18 Jul 2024 11:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PSLBthdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2FB10E7A2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 11:27:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F8DB61B46;
 Thu, 18 Jul 2024 11:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BF0C4AF09;
 Thu, 18 Jul 2024 11:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721302078;
 bh=HoxUNH3rJHWxZTGHOWJYLSl2Dr3ygT83Mu7tovtsC+4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PSLBthdIJCYs6KFMs38FEeFgbBqeMQ7IARAiILyMrFfV+fJ1moSd5DyXfeMTswlxm
 2/6ArORaDNQWturwlBAftcgLaUt2sYzNv3vb2mUjuVxirJ+ngHwzn5bYFsDtvSNPsG
 1vYXrwDnyXktMzc94+/PII2bplXVQdBiBUndKykgu/qT1AsIxlxudVL5Ij2YY81WeJ
 otcfOpXcl8vx8TqLIPYNnEfAsTVqQFevovyrZiK+/MEBccvI6/DBtrl1JWB4uHI0zU
 xEBF/j4N5jbj0wvHBrM7GHxbRQYM/jA1e1KaFzRQaKSZSCWux7+lccO8fOVV3odCy0
 qKdx4WpaY8HeA==
Message-ID: <09605d65-8a0e-4d28-be8e-a07bbdf376d6@kernel.org>
Date: Thu, 18 Jul 2024 13:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] firmware: qcom: implement object invoke support
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <20240702-qcom-tee-object-and-ioctls-v1-1-633c3ddf57ee@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240702-qcom-tee-object-and-ioctls-v1-1-633c3ddf57ee@quicinc.com>
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

On 03/07/2024 07:57, Amirreza Zarrabi wrote:
> Qualcomm TEE hosts Trusted Applications and Services that run in the
> secure world. Access to these resources is provided using object
> capabilities. A TEE client with access to the capability can invoke
> the object and request a service. Similarly, TEE can request a service
> from nonsecure world with object capabilities that are exported to secure
> world.
> 
> We provide qcom_tee_object which represents an object in both secure
> and nonsecure world. TEE clients can invoke an instance of qcom_tee_object
> to access TEE. TEE can issue a callback request to nonsecure world
> by invoking an instance of qcom_tee_object in nonsecure world.
> 
> Any driver in nonsecure world that is interested to export a struct (or a
> service object) to TEE, requires to embed an instance of qcom_tee_object in
> the relevant struct and implements the dispatcher function which is called
> when TEE invoked the service object.
> 
> We also provids simplified API which implements the Qualcomm TEE transport
> protocol. The implementation is independent from any services that may
> reside in nonsecure world.
> 
> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> ---
>  drivers/firmware/qcom/Kconfig                      |   14 +
>  drivers/firmware/qcom/Makefile                     |    2 +
>  drivers/firmware/qcom/qcom_object_invoke/Makefile  |    4 +
>  drivers/firmware/qcom/qcom_object_invoke/async.c   |  142 +++
>  drivers/firmware/qcom/qcom_object_invoke/core.c    | 1139 ++++++++++++++++++++
>  drivers/firmware/qcom/qcom_object_invoke/core.h    |  186 ++++
>  .../qcom/qcom_object_invoke/qcom_scm_invoke.c      |   22 +
>  .../firmware/qcom/qcom_object_invoke/release_wq.c  |   90 ++
>  include/linux/firmware/qcom/qcom_object_invoke.h   |  233 ++++
>  9 files changed, 1832 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> index 7f6eb4174734..103ab82bae9f 100644
> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -84,4 +84,18 @@ config QCOM_QSEECOM_UEFISECAPP
>  	  Select Y here to provide access to EFI variables on the aforementioned
>  	  platforms.
>  
> +config QCOM_OBJECT_INVOKE_CORE

Let's avoid another rant from Linus and add here either proper defaults
or dependencies.

> +	bool "Secure TEE Communication Support"
> +	help
> +	  Various Qualcomm SoCs have a Trusted Execution Environment (TEE) running
> +	  in the Trust Zone. This module provides an interface to that via the
> +	  capability based object invocation, using SMC calls.
> +
> +	  OBJECT_INVOKE_CORE allows capability based secure communication between
> +	  TEE and VMs. Using OBJECT_INVOKE_CORE, kernel can issue calls to TEE or
> +	  TAs to request a service or exposes services to TEE and TAs. It implements
> +	  the necessary marshaling of messages with TEE.
> +
> +	  Select Y here to provide access to TEE.
> +
>  endmenu
> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qc


...

> +		} else {
> +			/* TEE obtained the ownership of QCOM_TEE_OBJECT_TYPE_CB_OBJECT
> +			 * input objects in 'u'. On further failure, TEE is responsible
> +			 * to release them.
> +			 */
> +
> +			oic->flags |= OIC_FLAG_QCOM_TEE;
> +		}
> +
> +		/* Is it a callback request?! */
> +		if (response_type != QCOM_TEE_RESULT_INBOUND_REQ_NEEDED) {
> +			if (!*result) {
> +				ret = update_args(u, oic);
> +				if (ret) {
> +					arg_for_each_output_object(i, u)
> +						put_qcom_tee_object(u[i].o);
> +				}
> +			}
> +
> +			break;
> +
> +		} else {
> +			oic->flags |= OIC_FLAG_BUSY;
> +
> +			/* Before dispatching the request, handle any pending async requests. */
> +			__fetch__async_reqs(oic);
> +
> +			qcom_tee_object_invoke(oic, cb_msg);
> +		}
> +	}
> +
> +	__fetch__async_reqs(oic);
> +
> +out:
> +	qcom_tee_object_invoke_ctx_uninit(oic);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_tee_object_do_invoke);
> +
> +/* Primordial Object. */
> +/* It is invoked by TEE for kernel services. */
> +
> +static struct qcom_tee_object *primordial_object = NULL_QCOM_TEE_OBJECT;
> +static DEFINE_MUTEX(primordial_object_lock);

Oh my... except that it looks like undocumented ABI, please avoid
file-scope variables.

Best regards,
Krzysztof

