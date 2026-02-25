Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFyFE4hTn2nXaAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:54:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBF619CF5B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F1B10E822;
	Wed, 25 Feb 2026 19:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ovSrb8kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C5D10E375
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:54:45 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48371d2f661so12575e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:54:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772049284; cv=none;
 d=google.com; s=arc-20240605;
 b=EEpRg8T/uzULxNdThQuhwHWcgWs4giDCBM6XZRyD3jDt0w/XfP1iHiQLW/brxXBr3Y
 zIp8qrQBfY+joyHRgVGZoBueqihhXdtqySjB8BSX7TWQVrS0jnTKznB7ijOh3BdRX+4M
 ur/Hu1NlFVp+QpZsPfANYOsJDmTLZ8OlLgNnmisK5jPTeQTtRHAwgjgcR/S3C4spFnIW
 j5e27h4zMQQFBv4Fv/E1yUZh3yyOIL6FgDmgXHZ+p2GG2ChUT6J2th9afDAWwjg8mKE/
 Kp2JTe9C8uSk4mU5ZCACp9tZD5ALuTGAn5VcNkyqf95uLgye2Fszt8FWSmv0Kzf4w1An
 M9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5kHOrLDbHDmcLU0mU/NKuQBxgp05tP5/RxjExBXg+n4=;
 fh=czgF/T6W4Moc+MSgzD5mbnffO8sV8OM+7BTVK8L2o5s=;
 b=YFCIPlBNyzrUpg/PEyhFwEegCiptpZyIK2huXo68008fo8+0iHwxof3AyVdLV9gFCV
 PFhHmqLZpdS+E6Q8FRGt72W9cugIoDjNpR7rIZeabfMeJ85P8tt04Tn8y0J2ihjyBz4f
 EqpqpfD7FLp+xnVHA64mnGakgvGRxtUCnO7yQ6AGIcE9XEAcn9GIty+GF2RQQijE7VNc
 rm6O6o0ovf50r0eQroiEblB+f4R0pNCXeltLNp93QP7d0+wuKGWSkhGp2K26YIrbF2jF
 pl+hpWiGoEFGMWtufsDRqVI70vif+O7KMLuX5Rsa74vzX+3oUh2DMZO6vpi684zjgdYA
 UI/g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772049284; x=1772654084;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5kHOrLDbHDmcLU0mU/NKuQBxgp05tP5/RxjExBXg+n4=;
 b=ovSrb8knHejSvRoTrg87FFuCyDplNsxr2ZqJNRn/pKn7qLlgCakUWeNPEnKuwp2e8J
 v3uHIKx03VaWNCLkAYl/ZduxYTQxBIssZk8SMZvHgnyjXQF1cYsFW8NcYgvN72wVEzq3
 PsPNiKLlJw6F8Tyle6+7uRJU2JNm58ea1VUqaS2MarxHWn539h8jVksiYzcKmHvjOC/Z
 NDHH4cz4kixYVxIhF/+OFnyh6pHQtlp+GqeVWC3YXGmiac7sC1hI1vBESCB3iyFEC4qe
 XsYsveSzDaeSB5W2vYOXEKGnHvRY0knttAcSBVPX8ndKS4Ica4IW0bum7ziT7KuraHRR
 SYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772049284; x=1772654084;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5kHOrLDbHDmcLU0mU/NKuQBxgp05tP5/RxjExBXg+n4=;
 b=a806ndVdmHomLeHn87BgxFk+yqa3U9/DcyAntSpQ/x7t7Vj31WsLdKq7SaTEy3ysLD
 WWDe96L8Bbxc6TN1Tv3/DIHYIXRKagHOkXdBQgz9f+LECpLCQiZ3hppfeuGq/qNCGwpC
 Cwb9j1+e4MVcSmf5GOX0yacK5Qn35duNfXxJEu8OsXDHgWY1nh+h8vHIcUrteUj8uNaO
 FLqwzKciOv/fQOXTEAnZPqAq6+qdBUElXZNWf1CJZ9C6ho+JJyXhlA23JTithaeIMAuz
 TwnAUNzwt4wLfwlk8CRMeHjMukXKvRxnMrAtDqq0+hPQy5Pl3oCcLcwb0ibkhvZcmPSX
 NEEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYnvTsvvWdSKunJ3uM/UdK8H8orEJwYHuDz/gepnkI3HKk1KpNsPu7fPUdkdrB3rb2mxnH8dMfy6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmiCfWMKeHWYeTiezLFmm17PaIot5Xjmv2ROKT9X0rmgv+10A0
 hHCSeOf8YyicSnDtIOt3szoUg/826Qy+hrAgKMklU5Rxw2nObnBlBh31zsw7QrA29FGwZai2UMj
 IOM7Qwx8ngYXO4CTxPkHFy9woAYvTEp35K9WefIzJ
X-Gm-Gg: ATEYQzzBdG11YK5twn24GLeyEE6vszFbIDEIM86T/4Ri0EkkumoUwWqwlsrFngGLhA2
 HiTGerLkdW4If63e16DChlWkQPNy5PHTpGx5Va17i1CRA+15CQc/NcbL1OxnFPYyeyYlBo38ytC
 j3LLVZYtNRks8QfPpAylu4/K5iAKhl8by6+1TjntG+vODrWs5y1QKKmfgLsV+3Y31sH1rIasJIj
 XfjtbIGoOPVRCrQ+C0mNTc6WqllbneKwVDOfDyefA5lFg65ASL3EOJOyd2jvkqvVCwz5UEasLeN
 0V+AXWRytaKJjrDArSKePcfMVMoP4jLjgQTYSIqK7RIdiOBynSTuL8UBLNl15ySQFRuShQ==
X-Received: by 2002:a05:600c:a011:b0:47d:7304:d759 with SMTP id
 5b1f17b1804b1-483c31a1fbfmr90505e9.15.1772049283315; Wed, 25 Feb 2026
 11:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <20260225-dma-buf-heaps-as-modules-v1-6-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-6-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:54:31 -0800
X-Gm-Features: AaiRm51QwXByHIj_4EAMjL0iJavUr_3DqvTRveBK0_qkEAD8H59M0Ces2LdyWWw
Message-ID: <CABdmKX26Q-DXsLEMbvsYbw_JotHpGk3zFDccAJaqir4aSBdt0w@mail.gmail.com>
Subject: Re: [PATCH 6/7] dma-buf: heaps: cma: Turn the heap into a module
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9EBF619CF5B
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Now that all the symbols used by the CMA heap are exported, turning the
> CMA heap into a module becomes pretty easy: we just need to add the
> usual MODULE_* macros, import the proper namespaces and change the
> Kconfig symbol to a tristate.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

It'd be good to add a note that heap modules can't be unloaded (unless
we add more code to verify there are no live heap allocations). With
that:

Reviewed-by: T.J. Mercier <tjmercier@google.com>
