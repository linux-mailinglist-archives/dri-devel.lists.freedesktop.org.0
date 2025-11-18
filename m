Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12293C6B881
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7013810E50F;
	Tue, 18 Nov 2025 20:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="dKsiVfIf";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="b4BcgUdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b5-smtp.messagingengine.com
 (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0F110E513
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:10:52 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 7E23D1D00011;
 Tue, 18 Nov 2025 15:10:50 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Tue, 18 Nov 2025 15:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1763496650;
 x=1763583050; bh=JKFcF4a+cNbrtlp+FIdvl2Y5hDbZC7BuoipJJsoD+Xg=; b=
 dKsiVfIfgRz3kNZHBVLW4w4a09M1An1YvYNcijPZ2AbBFboB1FxX0SwNlWv2rI3m
 jLV/veDDgOhw9IS/7J8t81UctKoauLfjaXOyWqAp44a4MChEre02HVqGpMlsgIQ5
 OVDMVHJablLjrzU+B8hL8QqRQ1+FyFvGpkw3BwGVonzwVgBd7NvVAsA+IlLoTNVT
 kot+Gxju1ZTzga7Bee121GDDqWNUI+lqCGgG89zYk6ckhz8rEtrBbj0mNQhPhOcc
 4uOd0pLPLZNlB7v3J3DPPBINt8sCnltepxWxkehpeYBA1Harjd8rccj6w8gmbij3
 nDgGERM8bBQyy2uD5HkTCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763496650; x=
 1763583050; bh=JKFcF4a+cNbrtlp+FIdvl2Y5hDbZC7BuoipJJsoD+Xg=; b=b
 4BcgUdYcPIovWahMuxFSya7KoSim52uHsgehgqj/ncnPhxE3qTN1l9XUmfH5dLA0
 nA9E0d7Le0Mc4/Xf7R7J2lQ/+CU38ymtFa6iaGShFA8iMhhJds2uyGYsUrmk0AGZ
 wwHqhNPuDyy3T1wmEKwJ83vo1u1sv9Rg4GlJkbcIEp90cjcQFPESsb71YSlLcyQd
 UEAV/QlH64EIJ1lqCiYY4cKUDhQBuK7Z/C878cS9zvqM5xyFNzLBS1ECI4FZmTN2
 zM7jJStJjqi5FJm842MkyHtQUwl7n/Nil39X0PVzn77HpNlgls3inc0qko2NNjgy
 yxSKoNtyts9q6kzxUKgCg==
X-ME-Sender: <xms:yNIcaVSvmDTF8VooyebZ_3iAuWJLF1nEpDYA2SFkLVpCRLI7ry-_yQ>
 <xme:yNIcaVmEGLCY5Y5fPmoEJKQOT9y5RfkjFiDcjDM82fNtYUukk3d8ZO-gnIlZyOOPP
 GAmhpj4l6gxq2LE9j06pWjqNlxkgm2Z3bZOzOLp7Twv9NJiGOok>
X-ME-Received: <xmr:yNIcaTzm8Q6mhtNsmKzPVt9MMUAmwOqIQ5a4gIx8lLQ0mWSG2DA3IJH6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvddvvdegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthejredttddtvdenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhepteetudelgeekieegudegleeuvdffgeehleeivddtfeektdekkeehffehudet
 hffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hlvgigsehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopeefgedpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtohepkhgvvhhinhdrthhirghnsehinhhtvghlrdgtohhmpd
 hrtghpthhtoheplhgvohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegshhgvlhhg
 rggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhoghgrnhhgseguvghlthgrth
 gvvgdrtghomhdprhgtphhtthhopegrgigsohgvsehkvghrnhgvlhdrughkpdhrtghpthht
 oheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtohepjhhorhhose
 eksgihthgvshdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhr
 tghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhm
X-ME-Proxy: <xmx:yNIcaf26KhFFpsUivmrVFhTObM-rKgDaEfC2zz-v9EkVExJppHMvwg>
 <xmx:yNIcaSxvHZrLpODSMU140Px8A7i2ec7wW6bLtqhUmriZmnVfLlueSA>
 <xmx:yNIcaQJG6BeoorANBFQ22bf_jmYfsKJ4ShsrttygfX-HrSPLvyCzdg>
 <xmx:yNIcaY_XYy0V85f_vM-5tra11pYCLKaPoalvR53bkh_Q_lBlGmVbiA>
 <xmx:ytIcabAqBX1IJkm5xY2Na7fzL8IPkzZ-PxplGx_6mGsuM1UBrv418EQg>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Nov 2025 15:10:45 -0500 (EST)
Date: Tue, 18 Nov 2025 13:10:38 -0700
From: Alex Williamson <alex@shazbot.org>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 "Robin Murphy" <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 "Jason Gunthorpe" <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Ankit Agrawal" <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 "Shameer Kolothum" <skolothumtho@nvidia.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Alex Mastro <amastro@fb.com>, Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v8 09/11] vfio/pci: Enable peer-to-peer DMA transactions
 by default
Message-ID: <20251118131038.32b7804d.alex@shazbot.org>
In-Reply-To: <BN9PR11MB52767F78317AF3AB94A5B7D38CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-9-fd9aa5df478f@nvidia.com>
 <BN9PR11MB52767F78317AF3AB94A5B7D38CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
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

On Tue, 18 Nov 2025 07:18:36 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Leon Romanovsky <leon@kernel.org>
> > Sent: Tuesday, November 11, 2025 5:58 PM
> > 
> > From: Leon Romanovsky <leonro@nvidia.com>  
> 
> not required with only your own s-o-b
> 
> > @@ -2090,6 +2092,9 @@ int vfio_pci_core_init_dev(struct vfio_device
> > *core_vdev)
> >  	INIT_LIST_HEAD(&vdev->dummy_resources_list);
> >  	INIT_LIST_HEAD(&vdev->ioeventfds_list);
> >  	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
> > +	ret = pcim_p2pdma_init(vdev->pdev);
> > +	if (ret && ret != -EOPNOTSUPP)
> > +		return ret;  
> 
> Reading the commit msg seems -EOPNOTSUPP is only returned for fake
> PCI devices, otherwise it implies regression. better add a comment for it?

I think the commit log is saying that if a device comes along that
can't support this, we'd quirk the init path to return -EOPNOTSUPP for
that particular device here.  This path is currently used when
!CONFIG_PCI_P2PDMA to make this error non-fatal to the device init.

I don't see a regression if such a device comes along and while we
could survive other types of failures by disabling p2pdma here, I think
all such cases are sufficient rare out of memory cases to consider them
catastrophic.  Thanks,

Alex
