Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D54C7AD18
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 17:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A594789F08;
	Fri, 21 Nov 2025 16:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="iVYxelnp";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="UvzaBNSi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6819110E155
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:24:27 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id A04FF1D00156;
 Fri, 21 Nov 2025 11:24:25 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Fri, 21 Nov 2025 11:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1763742265;
 x=1763828665; bh=y9sPmO9ctPmEofVcJL2ve0sLdAoEmPz/dsTzOswFhgc=; b=
 iVYxelnp6m8nPDJCJD3pghiuY0JnfpXoWiKDtyC1ZfTMF8fUQtXTaMX5yXfbLont
 ST9OiZCOgXI8ULRFc6aFOTV/tf4SKt4W5wcQbP9AJZVnFKNBeKTXaQz1YXBFdesO
 ngWnz2nFnL1qztTi6xyP0b4aSzvPm+uN9ak+bIptT2djVNAQLdqCmwibU9kE5Aby
 VpAiSzJm+BAVU4pwbqnka0BeOqzyT0bMUyCvk7dAaYRepF8yb8plimv6meD7DiWX
 p8wl94vOATtCxVWlASjaMB/2zpgiQXfFwIjaAR+tnZBqkJApVj4qwHk4EVRiCEnp
 1g+zDY1l5gB38/tTHqvG8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763742265; x=
 1763828665; bh=y9sPmO9ctPmEofVcJL2ve0sLdAoEmPz/dsTzOswFhgc=; b=U
 vzaBNSi3AV9eHP0xV5OI+fIMqpbdDdLZSjxGvsQ1T9RKmeLAwjextymi2cVXU8uy
 Be6PO+J6KI0iovHc0UiFA8B7rQiJTAIxOd4DhBWcsamEOEW5kjFnqKsB7FIrhxeQ
 GuiIAMeDF55zh/ogS1yglOFCO/9flUPn1HBDtkEepyUIH7oJ3GvW0fdgq2cG3HNt
 Rreb7R/CH8xTdpLKWo0BA9gScPfpMk/xxjgIGSyYgTlnJbiy/QOWhAmLxQpYZ6V3
 7/Vl+Dl5oQsAGlnSZbuDQqBdTTIF2o/fTw+PlG/91H2n4QIdikT7RS5D+uM/ue4F
 NdHheTOKT/rjN+6DYqXNw==
X-ME-Sender: <xms:N5IgaVaQZaAe5t79XnH1rbSJrYlQplMMYdp0M6-Mr3uWvt823MEJDQ>
 <xme:N5IgaSsBncHkvTAX8k6pT0FvMeuYcjAGM09pjfPKAWMwiWFbRzWYD5L220C8E6Pk7
 g55i_BbOAKRyF9cw6sEpexN2O8LimadQjIefkoeLiQUv98iWdUI>
X-ME-Received: <xmr:N5Igad-WFs5Ve-cFz6F4xXvv1f14eMC6yGbsbN7RyWZyEu__tXqKIFcs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedtgeefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthejredttddtvdenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhepteetudelgeekieegudegleeuvdffgeehleeivddtfeektdekkeehffehudet
 hffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hlvgigsehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopeefhedpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtoheplhgvohhnsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhoghgrnhhg
 seguvghlthgrthgvvgdrtghomhdprhgtphhtthhopegrgigsohgvsehkvghrnhgvlhdrug
 hkpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthht
 ohepjhhorhhoseeksgihthgvshdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvg
 hlrdhorhhgpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgt
 ohhmpdhrtghpthhtohepjhhgghesiihivghpvgdrtggr
X-ME-Proxy: <xmx:N5IgaQ84u-HHIf2TcQNYp-qQlqRMCjkmlLokOX6AO2UGzSJhrElRBA>
 <xmx:OJIgaXPtSD_NpuOHdtKoNjoojGX18VUQEBCkvknI_2nnhJz5NPrx0g>
 <xmx:OJIgacOkV7PC26nL5WPRH0i6onKjj8iCzVuttmRsX2N7uBq0h1DUmQ>
 <xmx:OJIgaVMFYRWTlkUhXAgJS6FxtMLkh8eI-ToaCrmBZCSefA8L7jXnYw>
 <xmx:OZIgaTGK97vls5JNSW_jGH-7CSY683IBHOHRkaC1YrXeI4xtr5m3V3e5>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Nov 2025 11:24:20 -0500 (EST)
Date: Fri, 21 Nov 2025 09:24:17 -0700
From: Alex Williamson <alex@shazbot.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Krishnakant Jaju <kjaju@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 iommu@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v9 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20251121092417.7a6eaa2f.alex@shazbot.org>
In-Reply-To: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
References: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
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

On Thu, 20 Nov 2025 11:28:19 +0200
Leon Romanovsky <leon@kernel.org> wrote:

> Changelog:
> v9:
>  * Added Reviewed-by tags.
>  * Fixes to p2pdma documentation.
>  * Renamed dma_buf_map and unmap.
>  * Moved them to separate file.
>  * Used nvgrace_gpu_memregion() function instead of open-coded variant.
>  * Paired get_file_active() with fput().

Applied to vfio next branch with the fixes discussed for v6.19.  I also
pushed a tag, vfio-v6.19-dma-buf-v9+, for this work.  Thanks,

Alex
