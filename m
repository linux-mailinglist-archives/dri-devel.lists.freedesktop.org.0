Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B255C37CDE
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 21:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E89210E7A9;
	Wed,  5 Nov 2025 20:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="OE/wrqxG";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="zxzrpVEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156C510E7A9;
 Wed,  5 Nov 2025 20:58:09 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 3DB02EC012B;
 Wed,  5 Nov 2025 15:58:08 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Wed, 05 Nov 2025 15:58:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1762376288;
 x=1762462688; bh=bpCzCkKrcUczJBiapWyBhft91LY4ONtBZa3BUBZWi7o=; b=
 OE/wrqxGsiZIWikyNBBjFckOUmtPEs40Alj+a4qmuOo3vw5173Sx2QDctyWe9d24
 HXoVEOyMy57eyGy6gS1VtNHq7zb4XQvD0BNX4pDR0vvCG5uWvBCVvNqHYY3qlEjv
 J1iA1oMYrlI4TCED7nCVec1x6G+I2pgF+PqrsU8px+PY3QmkdwRaUupApUzh9b5s
 qpLH6DLCWnZCE9Xn4iOn0AHa1K8DcA2/CpdhJc/sdYtxGR3nlHVoj62FZI7GXjPl
 nNNPUtRlatgYwGe6BRI1AgWJEWn5ADJEU1uSAlS+RJw1snSvaQ7qrzLdOOt2WqRM
 /tKiqoxv93HTWFEYgVUWUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762376288; x=
 1762462688; bh=bpCzCkKrcUczJBiapWyBhft91LY4ONtBZa3BUBZWi7o=; b=z
 xzrpVEVCflxh+kcu9HbQrmVcwqQ55AVIjZvID/ubhtcbRFJo+ynKUwLLPEYQ9Qa4
 tVMjuhTNOq/c5zmmUb967XCH9HIxuvNSl78HtQy7xF4XbKvOpy6GUL6caBBvljx7
 6GpKUY26TJO2w0rtoRSHusaNDBqp8ZyBWtsdyJwrlMr9ibzKGQATxarnC8zfI8IQ
 J6ANZotCWrpRDci+JS63M3UCOAhfpzGcF5eb9+mhBMm3bUTgxcXoPjScmq2pcC10
 dYSXDk3Q7ZV/hbTtqSU897ZJBdgdU4C7XCJHepM0HheVjS048xDuGeqMV7r8gzm3
 0xB4j+LYwsqqtomKYdoeQ==
X-ME-Sender: <xms:X7oLaboCIWYrewmLsoV4II0VkCTNYhQngGOf71K0pqknQrxE1A6QJA>
 <xme:X7oLae0atiWFsM_Y4WTC0ygHKkYtQo1iVHfafvjHMXBOzujMLGGQ9elBgCwJuXR91
 5VEB0xUDpXAQZlZd09f-ErfPJBMIs0lwJyw6QhsBSNugBEErZHGAQ>
X-ME-Received: <xmr:X7oLaceXI6CoSF6DlBhb8Qhu7LcQyZnnz29Gz4M6b23x7zxJ32lFuXdF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeegledvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthejredttddtvdenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhepteetudelgeekieegudegleeuvdffgeehleeivddtfeektdekkeehffehudet
 hffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hlvgigsehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopeegtddpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtohepshhmohhsthgrfhgrsehgohhoghhlvgdrtghomhdprh
 gtphhtthhopehjghhgsehnvhhiughirgdrtghomhdprhgtphhtthhopegrghhorhguvggv
 vheslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrih
 hlrdgtohhmpdhrtghpthhtoheprghlvgigrdifihhllhhirghmshhonhesrhgvughhrght
 rdgtohhmpdhrtghpthhtoheprghnkhhithgrsehnvhhiughirgdrtghomhdprhgtphhtth
 hopegsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtohep
 sghrvghtthdrtghrvggvlhgvhiesrghmugdrtghomhdprhgtphhtthhopegurhhiqdguvg
 hvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:X7oLaUpsYLbzky4HfYBo4L9AWKo9LiaN-JyDWpw22jO9sgY6A_FHYw>
 <xmx:X7oLaWXOvxYIen10joXg5rvWxjPUTGt5Kk6o0KXmxSbJ3JjlvpOkxw>
 <xmx:X7oLaROT5U5geIv_xpyU6PxpNDjswNgYCGlrh6ZtgQqw3DKC11RHMA>
 <xmx:X7oLaaBAIS7AUXuUXtD-AjFUupFBTZ0GRs4k0JtY6Gpx5M8hwmoqtg>
 <xmx:YLoLaXP9q97srOrCNOYSTjSxeimsXeAsJ-ySUhe4psuHo5t_JOJJOcH0>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 15:58:05 -0500 (EST)
Date: Wed, 5 Nov 2025 13:58:04 -0700
From: Alex Williamson <alex@shazbot.org>
To: Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Pranjal Shrivastava <praan@google.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 00/22] vfio: Give VFIO_DEVICE_GET_REGION_INFO its own op
Message-ID: <20251105135804.0cb3b340.alex@shazbot.org>
In-Reply-To: <aQh7gG3IAEgEaKY_@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <aQh7gG3IAEgEaKY_@google.com>
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

On Mon, 3 Nov 2025 09:53:04 +0000
Mostafa Saleh <smostafa@google.com> wrote:

> On Thu, Oct 23, 2025 at 08:09:14PM -0300, Jason Gunthorpe wrote:
> > There is alot of duplicated code in the drivers for processing
> > VFIO_DEVICE_GET_REGION_INFO. Introduce a new op get_region_info_caps()
> > which provides a struct vfio_info_cap and handles the cap chain logic
> > to write the caps back to userspace and remove all of this duplication
> > from drivers.
> > 
> > This is done in two steps, the first is a largely mechanical introduction
> > of the get_region_info(). These patches are best viewed with the diff
> > option to ignore whitespace (-b) as most of the lines are re-indending
> > things.
> > 
> > Then drivers are updated to remove the duplicate cap related code. Some
> > drivers are converted to use vfio_info_add_capability() instead of open
> > coding a version of it.  
> 
> The series as a whole looks good.
> However, I got confused walking through it as almost all non-PCI drivers
> had to transition to get_region_info then get_region_info_caps then
> removing get_region_info completely from core code after introducing
> it in this series.
> 
> IMO, the series should start with just consolidating PCI based implementation
> and then add get_region_info_caps for all drivers at the end.
> Anyway, no really strong opinion as the final outcome makes sense.

I agree it was a bit indirect to get there, but the result still makes
sense and I don't think it's worth reworking the series.

I think Eric has some outstanding naming concerns and Praan noted that
either a comment or gratuitous kfree(caps.buf) might be worthwhile to
keep call-outs in check regarding cap buffer leaks.  I don't think we
have any such cases, but it can't hurt to note the policy at least.

Otherwise, LGTM.  Should these be addressed as follow-ups rather than a
re-spin?  Thanks,

Alex
