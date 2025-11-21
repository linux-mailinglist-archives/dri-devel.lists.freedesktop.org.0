Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39526C76C9B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 01:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9324B10E7DE;
	Fri, 21 Nov 2025 00:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="bQ/usSFT";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="W6/D/Imp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F92810E7DE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 00:40:39 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 4F1D37A014B;
 Thu, 20 Nov 2025 19:40:38 -0500 (EST)
Received: from phl-imap-18 ([10.202.2.89])
 by phl-compute-02.internal (MEProxy); Thu, 20 Nov 2025 19:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1763685638;
 x=1763772038; bh=BWrF0R3qQL8kwm9npP1EvAhcAZRE+BA2fEO0OQij6hY=; b=
 bQ/usSFT6o+GWegKvvd8h3PcSB2A1hCVejwJtF7wsEdC7CwzuBGsDiHZbmkxFhTZ
 d3UIol3MggwYKtr3/7m8xHyYxFZEfi8xy9RcSPvxuCsyc0MdounLwdBO/jy+bF8Q
 QMRupKehNfw8HmjuvCCa78xT+NL7tm00BrGzRYcDVClQyvRaUh5RVCfj/DJfA9BN
 x5s86jNR+3qTFD9TYEPKOzH5TaocL4t+30TypdxjRYVGuCBSF89ZL3JYk8ybXWdP
 2HBXxNDUNKIY52H6XFTtq5eDJxYKvYA3BepZULCxBk8xlDM0LYJhphJ4jbnaB2do
 BBa9XXH1Lha6uliQ1SziTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763685638; x=
 1763772038; bh=BWrF0R3qQL8kwm9npP1EvAhcAZRE+BA2fEO0OQij6hY=; b=W
 6/D/ImpsP6E8UHOnHw0GHkvwQhWlYdOrwXFehCZFo9BlwYpK5+GOeFWB33eaI72c
 o2iReqsiKaZ6t9qjAjpN0Xy115KlGnR65KX+g5UzbVBd/rcQlaiz8hiLAqer98qQ
 XFoirt/2+8WdsP7ETLVokZeBr04/nTxLN1HgtZrk2DDl7wrTRs8onknGjWKUWLnj
 5TIODtgQLz3kfaCb4wP0kgI7O8Hg2ukyYnBZhW4Sf5Xwx3Si8Z8pE8LMGUWysWV9
 EbfxOHrI0s9K+yzOiA+ZKd4nSgH24XQr7oMuDcKfWL0sRgLVy6W4btuveDFkKOyb
 MNY477StKsGD7B911h8LA==
X-ME-Sender: <xms:BLUfaTcu-W1ZbFNKOZl9hEoK5kM2iKVgFY7hi_qwxdijBO8eYSBaQA>
 <xme:BLUfaUDr4NrEmO5B9_8l2v3n4jQbNvi6XEqlmD-9LLSydDnUnrnRawFKgPpvTMRYP
 Y7434dwhOkYoKdQMRD7qq4WJ2pf5tck8RcL6wMx-_En2tJAQ-vQQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdekheehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehlvgig
 ucghihhllhhirghmshhonhdfuceorghlvgigsehshhgriigsohhtrdhorhhgqeenucggtf
 frrghtthgvrhhnpefgfeeflefggfffveffteetiedvtedtgfdvieevfeejfeefffevteej
 tedufffgveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrlhgvgiesshhhrgiisghothdrohhrghdpnhgspghrtghpthhtohepfeefpdhmohgu
 vgepshhmthhpohhuthdprhgtphhtthhopehjohhroheskegshihtvghsrdhorhhgpdhrtg
 hpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhrtghpthht
 oheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtoheplhhoghgrnh
 hgseguvghlthgrthgvvgdrtghomhdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhg
 lhgvrdgtohhmpdhrtghpthhtohepkhgvvhhinhdrthhirghnsehinhhtvghlrdgtohhmpd
 hrtghpthhtohepvhhivhgvkhdrkhgrshhirhgvugguhiesihhnthgvlhdrtghomhdprhgt
 phhtthhopegrgigsohgvsehkvghrnhgvlhdrughkpdhrtghpthhtohepghhushhtrghvoh
 grrhhssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:BLUfaf3IMN_DjSt37FnR5cC7cKZKzm-Evis2a5redpwD9gpwNa4Mgw>
 <xmx:BLUfabfYFOLIxRZxj2GcfZQhMAJrV3AvzpNs5lf-FrATezIBt46vVw>
 <xmx:BLUfab6kKk0AxJC9j7DElLBpacsb7lCfW4srcPj5EWec1IZ1DQymrg>
 <xmx:BLUfaYhbHXAT2tIz3nE8TBsZFON8yBhxofv_cAOU6AX3rp4HzrS3QQ>
 <xmx:BrUfaRbHrZD02fwIphP49SQDR9cZINb17knsJOrpHoo-8nVEkFZAnwDT>
Feedback-ID: i03f14258:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id BD7C115C0053; Thu, 20 Nov 2025 19:40:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AE6BP-1UiBv7
Date: Thu, 20 Nov 2025 17:40:15 -0700
From: "Alex Williamson" <alex@shazbot.org>
To: "Jason Gunthorpe" <jgg@ziepe.ca>
Cc: "Leon Romanovsky" <leon@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Logan Gunthorpe" <logang@deltatee.com>, "Jens Axboe" <axboe@kernel.dk>,
 "Robin Murphy" <robin.murphy@arm.com>, "Joerg Roedel" <joro@8bytes.org>,
 "Will Deacon" <will@kernel.org>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Kees Cook" <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Ankit Agrawal" <ankita@nvidia.com>, "Yishai Hadas" <yishaih@nvidia.com>,
 "Shameer Kolothum" <skolothumtho@nvidia.com>,
 "Kevin Tian" <kevin.tian@intel.com>,
 "Krishnakant Jaju" <kjaju@nvidia.com>, "Matt Ochs" <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org,
 "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Message-Id: <cd6f8c6b-6950-4b06-8f2d-bb4ead660ead@app.fastmail.com>
In-Reply-To: <20251121002344.GC233636@ziepe.ca>
References: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
 <20251120-dmabuf-vfio-v9-10-d7f71607f371@nvidia.com>
 <20251120170413.050ccbb5.alex@shazbot.org> <20251121002344.GC233636@ziepe.ca>
Subject: Re: [PATCH v9 10/11] vfio/pci: Add dma-buf export support for MMIO
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

On Thu, Nov 20, 2025, at 5:23 PM, Jason Gunthorpe wrote:
> On Thu, Nov 20, 2025 at 05:04:13PM -0700, Alex Williamson wrote:
>
>> @@ -2501,7 +2501,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>>  err_undo:
>>         list_for_each_entry_from_reverse(vdev, &dev_set->device_list,
>>                                          vdev.dev_set_list) {
>> -               if (__vfio_pci_memory_enabled(vdev))
>> +               if (vdev->vdev.open_count && __vfio_pci_memory_enabled(vdev))
>>                         vfio_pci_dma_buf_move(vdev, false);
>>                 up_write(&vdev->memory_lock);
>>         }
>> 
>> Any other suggestions?  This should be the only reset path with this
>> nuance of affecting non-opened devices.  Thanks,
>
> Seems reasonable, but should it be in __vfio_pci_memory_enabled() just
> to be robust?

__vfio_pci_memory_enabled() currently only requires holding memory_lock, I don't think we want to create a dependency on dev_set->lock for this unique call path.  Thanks,

Alex
