Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 160C7C930A6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 20:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E862F10E75E;
	Fri, 28 Nov 2025 19:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="V81EV6Ig";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="odbFk64x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BCD10E75E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 19:45:03 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 3ED8A7A07D6;
 Fri, 28 Nov 2025 14:45:02 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Fri, 28 Nov 2025 14:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1764359102;
 x=1764445502; bh=mFJPp3he5bKOdHbL7iltjchRS9EPwpMYVau74+gkFUE=; b=
 V81EV6IgzoPoo41bQFggdHF53ocwk+Gs+sBunW3xqvk13yNtrufRrcAjtjNGg4Th
 nIlAwBVl+KTgj3OHB9nI3FDRWS7theJ9K4GwtmUJ35Hc/BcfHVjI1ozgd8fuKzIu
 R3IYVUrB08Paa4kEef5+1ZTrLRdsSvzG3OSlR5GQFwYorsYcVjZxgomLLC+WDTlr
 jTNImTxchKwBD8UzSJ1wTIaYoCrt32JJOBDGp9oFKmmDki6YXBTMz75hGTLJLBEK
 7OtSkR+EfxWtAD5pQuCNlc1kWae4QlDwH27uqfw6sFIQhmr4u3N94DbTAUdFk3Eb
 t0HuHGdRwozuseQ3zzxyiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764359102; x=
 1764445502; bh=mFJPp3he5bKOdHbL7iltjchRS9EPwpMYVau74+gkFUE=; b=o
 dbFk64xFUz7Sg0hyv+fVOI8E3K+sj63ZpinESSKvMSNtJnhtoci3PqdvY7k/5rjW
 HIf4VR1UddBZgALVP/vBO1PRg0BY1ReYtGK09h8GsBlkFimMhI+vyV3PdGlhEOIt
 qOnW3KR5oFr1+YHriPWixw9Vi6+uyKmJvILoKRMGs23XItQIEnKPlwDsgzYst/am
 pBiKOAIRgsqaDflZPDpnyCVFX6PBgDFyMKTrLYtrImaDk2+jlsAufjk1vvvrS5Zg
 tVgE3jLRtm7xpF+ufB3nQXBTxjAzP1qK4VjLkzWSSzhxzx3ngRLhsn9WKs9cD0w1
 96Z2tkdj6Ldj1dHg8OAvQ==
X-ME-Sender: <xms:vfspad6yIjiSKyCW1m-K0jx3sYoDuYBHVKwt6TnVsWvQqNkeEx5sbg>
 <xme:vfspaQHkoaxYH70JoEQOJEN2v9G1odlG9pi5p8M3bwNAxfyabGGVM7OO6qfSptoE2
 F6mbMT5j9SbY-JuFv1OpXTm9vNKNhbClkAcZ4MrLby5xCKnGYv7>
X-ME-Received: <xmr:vfspaX2CHSKhHzAgTj5gKxMKooWNdBzdtS2N0421HAAcYU7ZTETxEIbV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvhedtjeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthejredttddtvdenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhephedvtdeuveejudffjeefudfhueefjedvtefgffdtieeiudfhjeejhffhfeeu
 vedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhgvgiesshhhrgiisghothdrohhrghdp
 nhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrmh
 grshhtrhhosehfsgdrtghomhdprhgtphhtthhopehsuhhmihhtrdhsvghmfigrlheslhhi
 nhgrrhhordhorhhgpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmh
 gurdgtohhmpdhrtghpthhtoheplhgvohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthho
 pehjghhgseiiihgvphgvrdgtrgdprhgtphhtthhopehkvghvihhnrdhtihgrnhesihhnth
 gvlhdrtghomhdprhgtphhtthhopehnihgtohhlihhntgesnhhvihguihgrrdgtohhmpdhr
 tghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
 gtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdho
 rhhg
X-ME-Proxy: <xmx:vfspaVocJ1krkbmCjKBD2AguK5QMNwj-_uyC7ipyhDbUjsaCynq2qg>
 <xmx:vfspacOBkyqnB4CgxMFP3k4sNAedI2KxMg5607ChGXV59CpXSJQT8Q>
 <xmx:vfspafXxB6J2xO-zngFiAZBKxpbEvKGXSB8jyjhowr7CDYtFWSg34w>
 <xmx:vfspaXu0W-dhKMQg21_V272bqiBa8kMgmXDfzdXL3bmKEOGqOnJJAQ>
 <xmx:vvspaQyZX1cqH3oyFc0moWoh315DbLZutHd_U5PthUpqWI3zFdrKPEii>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Nov 2025 14:45:00 -0500 (EST)
Date: Fri, 28 Nov 2025 12:44:47 -0700
From: Alex Williamson <alex@shazbot.org>
To: Alex Mastro <amastro@fb.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Leon Romanovsky <leon@kernel.org>, Jason
 Gunthorpe <jgg@ziepe.ca>, "Kevin Tian" <kevin.tian@intel.com>, Nicolin Chen
 <nicolinc@nvidia.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Ankit Agrawal
 <ankita@nvidia.com>
Subject: Re: [PATCH] dma-buf: fix integer overflow in fill_sg_entry() for
 buffers >= 8GiB
Message-ID: <20251128124447.0c5156b5.alex@shazbot.org>
In-Reply-To: <20251125-dma-buf-overflow-v1-1-b70ea1e6c4ba@fb.com>
References: <20251125-dma-buf-overflow-v1-1-b70ea1e6c4ba@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 25 Nov 2025 17:11:18 -0800
Alex Mastro <amastro@fb.com> wrote:

> fill_sg_entry() splits large DMA buffers into multiple scatter-gather
> entries, each holding up to UINT_MAX bytes. When calculating the DMA
> address for entries beyond the second one, the expression (i * UINT_MAX)
> causes integer overflow due to 32-bit arithmetic.
> 
> This manifests when the input arg length >= 8 GiB results in looping for
> i >= 2.
> 
> Fix by casting i to dma_addr_t before multiplication.
> 
> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
> Signed-off-by: Alex Mastro <amastro@fb.com>
> ---
> More color about how I discovered this in [1] for the commit at [2]:
> 
> [1] https://lore.kernel.org/all/aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com
> [2] https://lore.kernel.org/all/20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com
> ---
>  drivers/dma-buf/dma-buf-mapping.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
> index b4819811a64a..b7352e609fbd 100644
> --- a/drivers/dma-buf/dma-buf-mapping.c
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -24,7 +24,7 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
>  		 * does not require the CPU list for mapping or unmapping.
>  		 */
>  		sg_set_page(sgl, NULL, 0, 0);
> -		sg_dma_address(sgl) = addr + i * UINT_MAX;
> +		sg_dma_address(sgl) = addr + (dma_addr_t)i * UINT_MAX;
>  		sg_dma_len(sgl) = len;
>  		sgl = sg_next(sgl);
>  	}
> 

Applied to vfio next branch for v6.19.  Thanks,

Alex
