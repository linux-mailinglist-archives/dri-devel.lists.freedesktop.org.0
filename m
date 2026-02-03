Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK7sBDNagmlhSwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 21:27:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F59DE7BC
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 21:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3F810E03D;
	Tue,  3 Feb 2026 20:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KYIAuvLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D128D10E03D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 20:27:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F3CD960134;
 Tue,  3 Feb 2026 20:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4CD4C116D0;
 Tue,  3 Feb 2026 20:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770150444;
 bh=1YWKjiDV3leaA2vWYlORbPLbYrJSUp5s40jMMZAn2KU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KYIAuvLX+3WuJa1XqFLRkvS2RM3ZH1MRrNy13KmXuXpqi0fM5794fasWrBY94kqFD
 w0AvCHXxIiM3KqHcvhuT/wZnyc1r+oqy+M9boAlJj1zAqIul6m6xOo5DwpC2bhgJny
 6+V9wrzdseTmC6Mucz4VzpqyNGJHIy8/GaiAEZdOoK0wbVnhJA2lyRYdedfBHQ9vaG
 mIN/1yNfravxFWJe0YXSc7QpnPET/yyfMveFFaki9TKahA1RVuRk2aRkqKVbuQQGQA
 a+jHXHf1YX7Eufrm3UNKGWHo3KELLy4jVLNHh2p1JBbMhfyIBE3ZzEvJ4nIcUnT3Kv
 8MQedNspv4+vQ==
Date: Tue, 3 Feb 2026 14:27:21 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Michal Wilczynski <m.wilczynski@samsung.com>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Trilok Soni <tsoni@quicinc.com>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 6/6] soc: qcom: socinfo: Convert to Rust
Message-ID: <366n5psgnyptd2unf4mb2lniqfkc7n4oqbeg7oopktudwepatb@aj5bqkvt375i>
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-6-d6719db85637@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-qcom-socinfo-v2-6-d6719db85637@google.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,quicinc.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,linuxfoundation.org,ffwll.ch,samsung.com,intel.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mmaurer@google.com,m:konradybcio@kernel.org,m:satyap@quicinc.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:m.wilczynski@samsung.com,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:tsoni@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-pwm@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 62F59DE7BC
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 03:46:35PM +0000, Matthew Maurer wrote:
> Convert the socinfo driver to Rust for a number of improvements:
> * Accessing IO mapped regions through the IO subsystem, rather than
>   through regular memory accesses.
> * Binds the device as an auxiliary device rather than a platform device,
>   ensuring the mapped IO regions cannot be accessed after the smem
>   device is removed.
> * Adds bounds-checking to all accesses, hardening against a repeat of
>   CVE-2024-58007
> 

These three bullet represents things that would be good to fix (in the
C-implementation), but the commit message does not describe the problem
that a complete Rust-rewrite solves.


I expressed my scepticism in v1 about changing this driver, for the sake
of supporting this experiment in your downstream kernel(s). The people
who suggested this driver to be a good candidate choose not to engage in
either that discussion nor in the review of the solution itself.

[..]
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index fef840b5457407a85051ded0e835430dbebfe8bb..dcea2d7f37067b0b6f801b3d2b457422ad9f342c 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/auxiliary_bus.h>
>  #include <linux/hwspinlock.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -279,7 +280,6 @@ struct qcom_smem {
>  	struct hwspinlock *hwlock;
>  
>  	u32 item_count;
> -	struct platform_device *socinfo;
>  	struct smem_ptable *ptable;
>  	struct smem_partition global_partition;
>  	struct smem_partition partitions[SMEM_HOST_COUNT];
> @@ -675,6 +675,32 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>  	return ERR_PTR(-EINVAL);
>  }
>  
> +/**
> + * qcom_smem_get_aux() - resolve ptr of size of a smem item
> + * @aux:        an aux device that should be our child
> + * @host:	the remote processor, or -1
> + * @item:	smem item handle
> + * @size:	pointer to be filled out with size of the item
> + *
> + * Looks up smem item and returns pointer to it. Size of smem
> + * item is returned in @size.
> + *
> + * The caller may take the loaded state of the provided aux device as
> + * an acceptable proxy for this memory being valid.

Is this sentence trying to say "The purpose of this function is to
implicitly bind the life cycle of the returned pointer to the life of
the child auxiliary_device, which has due to devres will not outlive the
mapping of this pointer"?

IMHO this represents a very specific corner case and any other - real -
use-case of accessing SMEM would have to solve this problem properly.

> + *
> + * Return: a pointer to an SMEM item on success, ERR_PTR() on failure.
> + */
> +void *qcom_smem_get_aux(struct auxiliary_device *aux, unsigned int host,
> +		unsigned int item, size_t *size)
> +{
> +	if (IS_ERR(__smem))
> +		return __smem;
> +	if (aux->dev.parent != __smem->dev)
> +		return ERR_PTR(-EINVAL);
> +	return qcom_smem_get(host, item, size);
> +}
> +EXPORT_SYMBOL_GPL(qcom_smem_get_aux);
> +
>  /**
>   * qcom_smem_get() - resolve ptr of size of a smem item
>   * @host:	the remote processor, or -1
> @@ -684,6 +710,9 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>   * Looks up smem item and returns pointer to it. Size of smem
>   * item is returned in @size.
>   *
> + * It is up to the caller to ensure that the qcom_smem device remains
> + * loaded by some mechanism when accessing returned memory.
> + *
>   * Return: a pointer to an SMEM item on success, ERR_PTR() on failure.
>   */
>  void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
> @@ -1127,6 +1156,7 @@ static int qcom_smem_probe(struct platform_device *pdev)
>  	struct smem_header *header;
>  	struct reserved_mem *rmem;
>  	struct qcom_smem *smem;
> +	struct auxiliary_device *socinfo;
>  	unsigned long flags;
>  	int num_regions;
>  	int hwlock_id;
> @@ -1234,19 +1264,15 @@ static int qcom_smem_probe(struct platform_device *pdev)
>  
>  	__smem = smem;
>  
> -	smem->socinfo = platform_device_register_data(&pdev->dev, "qcom-socinfo",
> -						      PLATFORM_DEVID_NONE, NULL,
> -						      0);
> -	if (IS_ERR(smem->socinfo))
> -		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
> +	socinfo = devm_auxiliary_device_create(&pdev->dev, "qcom-socinfo", NULL);
> +	if (IS_ERR(socinfo))
> +		dev_dbg(&pdev->dev, "failed to create socinfo device\n");

I wouldn't mind transitioning this to auxiliary_device independent of
this effort.

Regards,
Bjorn

>  
>  	return 0;
>  }
>  
>  static void qcom_smem_remove(struct platform_device *pdev)
>  {
> -	platform_device_unregister(__smem->socinfo);
> -
>  	__smem = NULL;
>  }
>  
