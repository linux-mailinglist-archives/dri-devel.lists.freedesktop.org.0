Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459FEC64E50
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 16:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A944010E3DD;
	Mon, 17 Nov 2025 15:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="bTgByaG4";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="a3V3ZZ/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A3710E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:36:27 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id AEDCD14001CD;
 Mon, 17 Nov 2025 10:36:26 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 17 Nov 2025 10:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1763393786;
 x=1763480186; bh=dumULOFDFktDrAv/FEHp3FtDy5iDmeMi8WaBMWjFFc0=; b=
 bTgByaG40HRwAAQHrZmUb1QxjoIKG692YfpeDBRFe9Iu6ybe//AfCHpW3mIPsM1M
 WYnkzK8lh2vXojzl2+qseUFiMvxqQKr0IYjFET9zskLG20I8YPQxfkYQYgftEyWx
 jeD3gXXQIl0ubwQsOnRCneY9Ee+d3+FyAnOe8/ZEXTNbJBdR9zsD/Uqm6CFnrieJ
 60m+mV6mdpdJNLWAtv0sUtz2nkHnAVCeUhvAsXprKWeJ9SeFuthsuY3OGDw1Tpsw
 ZMjmSiwEFqUDMvWqfBkZB2f2ikmXmb74OaRGArj1p0panyj3vvVWtNAew6f7EjEB
 kku47rytqu0faY0bmEgdRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763393786; x=
 1763480186; bh=dumULOFDFktDrAv/FEHp3FtDy5iDmeMi8WaBMWjFFc0=; b=a
 3V3ZZ/HrTsgG7BZQp9uEsbe6TdQbscGPUzzV1ucmE75P+RX148fjF6z3+eDtfxE/
 +LIsnQGcry5t2eP9DsugDIxSRuHjQL4Pa48vQlCFL4Aj9/mvHNagLk5oliXqjZiN
 P7d9HhnMs2X2J530B8bl9/HIJt7CTkAoGK83TiPn4Am8w3vpm2woXXyidHxnjDmy
 AoDIYJqVBQO7kNTSKqZlkxYHdKM38pK6DV5BLhEpHopJc14gJ9bdwbzb1CECdFQ4
 29UG0a8x0Qak4XNvR1lJ563e3TxaNlVHCoAPZmYQcpWw6cJWVjhYMw/XcXCtUO7+
 0XyIT5kl1gHE9x0NMHR1g==
X-ME-Sender: <xms:-EAbaWyQ-WAwnluLWHzIZSr0mg8fK4EjRWclwqn4UadFrYR9CFAq3A>
 <xme:-EAbaYnO_OBUD04HGAVXLl5Y0sdGgCgZ0LkU9JWquhPnnfcmXV8ZdkOcf5KlVUEak
 U9OYBBXPjLciDkkfhjTYgSLsu-_gFaVGAR6arDrg1_4BpjJyD5n4g>
X-ME-Received: <xmr:-EAbaeV7CxOi5NsfI_0iHooQtOGJov1ufXfnaa1D97FrNVc9zEAX-2Uc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudekkeegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthhqredttddtjeenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhepgffggfegffffhffhhefftdeikedtueefkefghfehledtkedvvddtieehveej
 fffgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhgvgiesshhhrgiisghothdrohhrghdp
 nhgspghrtghpthhtohepfeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegthh
 hrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehlvghonhes
 khgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtg
 homhdprhgtphhtthhopehlohhgrghnghesuggvlhhtrghtvggvrdgtohhmpdhrtghpthht
 oheprgigsghovgeskhgvrhhnvghlrdgukhdprhgtphhtthhopehrohgsihhnrdhmuhhrph
 hhhiesrghrmhdrtghomhdprhgtphhtthhopehjohhroheskegshihtvghsrdhorhhgpdhr
 tghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrdhsiiihph
 hrohifshhkihesshgrmhhsuhhnghdrtghomh
X-ME-Proxy: <xmx:-EAbaZ0fTJm_ATpV97jWOpcVupVrX5qYHi8qRNGt3G3rqeBOTipOKQ>
 <xmx:-EAbaekY7TK2z-tERLv9vPNj8oV4GTGLaugTF_hEpglIkqI0gqjajw>
 <xmx:-EAbaQEqElQCUqBqS26kmOTvil5W3KYOkdSQUnH2TTqyeLc7k0jBCw>
 <xmx:-EAbabl0qbHJHfqmS6yt46qZ4Q6MuXUoWNyxiao6TOaw-x3l0mdFoA>
 <xmx:-kAbaVsEtsMVur8JcMzBXoqZTmuBVUtCij-s3rV4asHdXPXnRrkBls7n>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Nov 2025 10:36:22 -0500 (EST)
Date: Mon, 17 Nov 2025 08:36:20 -0700
From: Alex Williamson <alex@shazbot.org>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
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
Subject: Re: [PATCH v7 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20251117083620.4660081a.alex@shazbot.org>
In-Reply-To: <da399efa-ad5b-4bdc-964d-b6cc4a4fc55d@amd.com>
References: <20251106-dmabuf-vfio-v7-0-2503bf390699@nvidia.com>
 <20251110134218.5e399b0f.alex@shazbot.org>
 <da399efa-ad5b-4bdc-964d-b6cc4a4fc55d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Tue, 11 Nov 2025 09:54:22 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 11/10/25 21:42, Alex Williamson wrote:
> > On Thu,  6 Nov 2025 16:16:45 +0200
> > Leon Romanovsky <leon@kernel.org> wrote:
> >  =20
> >> Changelog:
> >> v7:
> >>  * Dropped restore_revoke flag and added vfio_pci_dma_buf_move
> >>    to reverse loop.
> >>  * Fixed spelling errors in documentation patch.
> >>  * Rebased on top of v6.18-rc3.
> >>  * Added include to stddef.h to vfio.h, to keep uapi header file indep=
endent. =20
> >=20
> > I think we're winding down on review comments.  It'd be great to get
> > p2pdma and dma-buf acks on this series.  Otherwise it's been posted
> > enough that we'll assume no objections.  Thanks, =20
>=20
> Already have it on my TODO list to take a closer look, but no idea when t=
hat will be.
>=20
> This patch set is on place 4 or 5 on a rather long list of stuff to revie=
w/finish.

Hi Christian,

Gentle nudge.  Leon posted v8[1] last week, which is not drawing any
new comments.  Do you foresee having time for review that I should
still hold off merging for v6.19 a bit longer?  Thanks,

Alex


[1]https://lore.kernel.org/all/20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidi=
a.com/
