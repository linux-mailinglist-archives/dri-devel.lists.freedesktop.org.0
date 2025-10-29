Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFAAC1CC14
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 19:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D365710E1AE;
	Wed, 29 Oct 2025 18:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gFW23Htf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAD710E827
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 18:21:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E22B7601E5;
 Wed, 29 Oct 2025 18:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6B6C4AF0B;
 Wed, 29 Oct 2025 18:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761762102;
 bh=DPpnCMRM2ONFlhs5+vFfnp4TspRDpdDt+xZVOrOrXxE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=gFW23Htfob9JVF7Tkn4OSf9AnrApu+I6w/WwRAqodqNSJgWV3LvyyA301zt0Uc/34
 x6/VtvfQztzfWNSs4dCB24QCQ92FaoC3Ir0q1XCVKjJFK0mda3xuB3/1XZaRMFNUXz
 eKchmNDyoozyoZ1HDSmEvBNDfCzBEX/JM9hSKH1faPH+eCNjYzQ8eolkTg1SxEnsuN
 OiYGqp9kql+IT4pn3GRuJtUrP7KVnTg8oBjrsKkvR1gl2P1VWZJ1WaGGmovzTOQ08j
 00jFA5M5GT40p+AGKTcPdvEO7j6lNxIAKnKsXGXjkZV2+V5oKvWkiHqhIxIa5TZ/hr
 O23qaAx/QhODA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfauth.phl.internal (Postfix) with ESMTP id EBBEDF40069;
 Wed, 29 Oct 2025 14:21:40 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-04.internal (MEProxy); Wed, 29 Oct 2025 14:21:40 -0400
X-ME-Sender: <xms:NFsCaVDOQpzKD7wTZgNCCgPb13e9mhCbRK36w5KK5UL_6Vz3kfOqqg>
 <xme:NFsCaeWLHPtpKhKZrslQ2gjrJtZvmfWKaeB-BNH71AIRQgkZgmY6dvyy7h1hVLqQY
 7vQeI-WSHuXH29wxJ06dzec-n0tAu4pMEPndl_0A5NlTk476sEDng0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieeggeefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfnfgvohhn
 ucftohhmrghnohhvshhkhidfuceolhgvohhnsehkvghrnhgvlhdrohhrgheqnecuggftrf
 grthhtvghrnhepjeevffelgfelvdfgvedvteelhefhvdffheegffekveelieevfeejteei
 leeuuedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eplhgvohhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdeftdehfeel
 keegqddvjeejleejjedvkedqlhgvohhnpeepkhgvrhhnvghlrdhorhhgsehlvghonhdrnh
 hupdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
 jhhorhhoseeksgihthgvshdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnrdhkoh
 gvnhhighesrghmugdrtghomhdprhgtphhtthhopehrohgsihhnrdhmuhhrphhhhiesrghr
 mhdrtghomhdprhgtphhtthhopehlohhgrghnghesuggvlhhtrghtvggvrdgtohhmpdhrtg
 hpthhtoheprghmrghsthhrohesfhgsrdgtohhmpdhrtghpthhtohepsghhvghlghgrrghs
 sehgohhoghhlvgdrtghomhdprhgtphhtthhopehvihhvvghkrdhkrghsihhrvgguugihse
 hinhhtvghlrdgtohhmpdhrtghpthhtoheprgigsghovgeskhgvrhhnvghlrdgukhdprhgt
 phhtthhopeifihhllheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NFsCaUzjtyzcUVu3XHD3WVhral27CzlLF39AneDrzievZ37OsGY-GA>
 <xmx:NFsCaRUFAQz6l_v7A2JkDReVdjjdcI-Y2IcFNcrwrHcfSX10RiJcNQ>
 <xmx:NFsCafZkyPDABk8DELRQCYDmg48L5nSl4vq1dKK-pP8IizJlTTWYMg>
 <xmx:NFsCaeR_shcDrhZPGvArnf4UbT0ylRaXp3-PRr2Wr-isMOf0OBIlZw>
 <xmx:NFsCafRS72r3S4Uq0J_JrwdIdBgQm6Y4YZw8AGtHru_SaMGZiKXRtxaV>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id B52662CE0071; Wed, 29 Oct 2025 14:21:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AwB0iom3SqON
Date: Wed, 29 Oct 2025 20:21:20 +0200
From: "Leon Romanovsky" <leon@kernel.org>
To: "Alex Mastro" <amastro@fb.com>
Cc: "Alex Williamson" <alex.williamson@redhat.com>,
 "Leon Romanovsky" <leonro@nvidia.com>, "Jason Gunthorpe" <jgg@nvidia.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 "Jens Axboe" <axboe@kernel.dk>, "Joerg Roedel" <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 "Logan Gunthorpe" <logang@deltatee.com>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Robin Murphy" <robin.murphy@arm.com>,
 "Sumit Semwal" <sumit.semwal@linaro.org>,
 "Vivek Kasireddy" <vivek.kasireddy@intel.com>,
 "Will Deacon" <will@kernel.org>
Message-Id: <275a5a94-1c69-4eb0-a9d0-4b397073555f@app.fastmail.com>
In-Reply-To: <aQJF1wiWWWoIgHI0@devgpu015.cco6.facebook.com>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
 <aQJF1wiWWWoIgHI0@devgpu015.cco6.facebook.com>
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO
 regions
Content-Type: text/plain
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



On Wed, Oct 29, 2025, at 18:50, Alex Mastro wrote:
> On Mon, Oct 13, 2025 at 06:26:11PM +0300, Leon Romanovsky wrote:
>> +	/*
>> +	 * dma_buf_fd() consumes the reference, when the file closes the dmabuf
>> +	 * will be released.
>> +	 */
>> +	return dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
>
> I think this still needs to unwind state on fd allocation error. Reference
> ownership is only transferred on success.

Yes, you are correct, i need to call to dma_buf_put() in case of error. I will fix.

Thanks

>
>> +
>> +err_dev_put:
>> +	vfio_device_put_registration(&vdev->vdev);
>> +err_free_phys:
>> +	kfree(priv->phys_vec);
>> +err_free_priv:
>> +	kfree(priv);
>> +err_free_ranges:
>> +	kfree(dma_ranges);
>> +	return ret;
>> +}
