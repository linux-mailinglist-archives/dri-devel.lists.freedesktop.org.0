Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F83C8B7D1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 19:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C141010E6A1;
	Wed, 26 Nov 2025 18:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="yg+RF1cb";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z38yM0Tx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF0310E6A1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 18:55:13 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id EC493EC01A5;
 Wed, 26 Nov 2025 13:55:12 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Wed, 26 Nov 2025 13:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1764183312;
 x=1764269712; bh=37p6Cw1ME0a5Obcfe11/W4zuJ0UdrkK9wi8CHO9UaCk=; b=
 yg+RF1cb+tDquSnVORpKSHeayI14y8YIFZvCLIBFA2zR13jRjziwlQ7+Ehy8DcX4
 f+5Ugd6JEPl3g1+nPMIwz/ci9HyMTiTh7BclOEO8meyP52q4fxO7llaSscEw3a4V
 lpbdHyVj75xlqdX9NtPYZOEmsovmVyXjFWG26E8TcQFlsvdtgvzJlvJkFFo013+m
 BHqWGZlpJihrh2kObiw+J5JO5TzoYQmDEk9bv/UCOKrMYD6l6S7LPXbAiLafZNTZ
 F/io2eojXUW97Em3mN56HNO/iBjfXHAwRq5qiKhMlLeboTYVms/Urt19qsw8O8He
 R4sgC6VGcJA5AWC55cMdhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1764183312; x=
 1764269712; bh=37p6Cw1ME0a5Obcfe11/W4zuJ0UdrkK9wi8CHO9UaCk=; b=Z
 38yM0Tx7mcpziDex2GDBB9S5N07P4lUXsgG5xBqAvl59RHOpBnc7TnBPbkkIZStB
 9B8C2OZItsvVEadioU5oCe8Tl8AZR9a3HuZCMnK47lomn7ad7f4L2pk1mEGJWfDo
 buyX0S9o7NXecKcTQtemu0PoSNb0c9uExLZzr9fcZRJrjnEceoQV3hqW6VwnKI78
 7pUm3moWxCOxQZycrDd7C80WoUNGdpomT0kfvVMI905GHWvPA9/jg2RKeXpQmUPc
 kxLcMEPX0VnM77/3sRn4beXV93iqveNCzvUsbl/fmku7JFSaAQ0DXn1vgED1Xtmh
 yBJFI9GYAUE3CAOXeDe0w==
X-ME-Sender: <xms:EE0naYrSSLubLhWF4T-5LCE5cKJ_mv2GtTnwXZPw8wMGhIRWIzVeIQ>
 <xme:EE0naT3o4R5vQEtg_LYYTE83c-j1imKsVzW3Ai8Bn5i5a_tZ_OZlYzsIhwo6TC-eN
 hnL9fEDWmxlZRBQ_j-x9FOMNMT_mkZ3kXGbQIsdTHA2UAosO7R3-g>
X-ME-Received: <xmr:EE0naQk4fTqdSi8aTmeir_7YHS1qmin4DVAVDxdlu-SiFp08YiKEiMAb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeehuddvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthejredttddtvdenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhephedvtdeuveejudffjeefudfhueefjedvtefgffdtieeiudfhjeejhffhfeeu
 vedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhgvgiesshhhrgiisghothdrohhrghdp
 nhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjgh
 hgseiiihgvphgvrdgtrgdprhgtphhtthhopegrmhgrshhtrhhosehfsgdrtghomhdprhgt
 phhtthhopehsuhhmihhtrdhsvghmfigrlheslhhinhgrrhhordhorhhgpdhrtghpthhtoh
 eptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhrtghpthhtoheplhgv
 ohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghvihhnrdhtihgrnhesihhnth
 gvlhdrtghomhdprhgtphhtthhopehnihgtohhlihhntgesnhhvihguihgrrdgtohhmpdhr
 tghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
 gtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdho
 rhhg
X-ME-Proxy: <xmx:EE0nafYwE3xFP7tGn73DufAb7RECzQlE9Fx9Qv8CwW9W7qr-WU8IHg>
 <xmx:EE0naS9wbGv9EY6uAHomgcs5XjV3NKSgAkYpJxo3aIk-Amjbs6iEzw>
 <xmx:EE0nafF9KpicE9Ap5Ul5bc9GmxfJH2Omyq6qAJ8ZMgvgqVRGgUxzlQ>
 <xmx:EE0nace2JVKwB_3pWdm7Dg45R1vVpko-oH4NswTUHLzqFZY3f9CjTQ>
 <xmx:EE0naUiqSj_3_m66PN5NLnjYSdBZGJzANiKx6DNIan4S51It8qgW_NvK>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Nov 2025 13:55:11 -0500 (EST)
Date: Wed, 26 Nov 2025 11:55:09 -0700
From: Alex Williamson <alex@shazbot.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Alex Mastro <amastro@fb.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Leon Romanovsky
 <leon@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Nicolin Chen
 <nicolinc@nvidia.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Ankit Agrawal
 <ankita@nvidia.com>
Subject: Re: [PATCH] dma-buf: fix integer overflow in fill_sg_entry() for
 buffers >= 8GiB
Message-ID: <20251126115509.27d420b9.alex@shazbot.org>
In-Reply-To: <20251126180107.GA542915@ziepe.ca>
References: <20251125-dma-buf-overflow-v1-1-b70ea1e6c4ba@fb.com>
 <20251126180107.GA542915@ziepe.ca>
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

On Wed, 26 Nov 2025 14:01:07 -0400
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Tue, Nov 25, 2025 at 05:11:18PM -0800, Alex Mastro wrote:
> > fill_sg_entry() splits large DMA buffers into multiple scatter-gather
> > entries, each holding up to UINT_MAX bytes. When calculating the DMA
> > address for entries beyond the second one, the expression (i * UINT_MAX)
> > causes integer overflow due to 32-bit arithmetic.
> > 
> > This manifests when the input arg length >= 8 GiB results in looping for
> > i >= 2.
> > 
> > Fix by casting i to dma_addr_t before multiplication.
> > 
> > Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
> > Signed-off-by: Alex Mastro <amastro@fb.com>
> > ---
> > More color about how I discovered this in [1] for the commit at [2]:
> > 
> > [1] https://lore.kernel.org/all/aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com
> > [2] https://lore.kernel.org/all/20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com
> > ---
> >  drivers/dma-buf/dma-buf-mapping.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)  
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> AlexW, can you pick this up?

Yes, I'm planning to.  Thanks,

Alex
