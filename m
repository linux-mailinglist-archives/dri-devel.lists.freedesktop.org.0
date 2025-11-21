Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBF4C7AD2D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 17:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A763710E155;
	Fri, 21 Nov 2025 16:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="QfORGo7L";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="T4odQl0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-b5-smtp.messagingengine.com
 (flow-b5-smtp.messagingengine.com [202.12.124.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA44E10E155
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:25:00 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.stl.internal (Postfix) with ESMTP id 44EFF13001EC;
 Fri, 21 Nov 2025 11:24:59 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Fri, 21 Nov 2025 11:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1763742299;
 x=1763749499; bh=R8sbORNrVfeWd8nr6oD3a9uPzFLZbbObLNNt4scEFDk=; b=
 QfORGo7LJM8uEqBQDQc0oWVqW7+t5I6EY95ZPkE+x9Jo975GuvpOefibl+kBo25c
 qaUuG8Vut1p0uEtUZkr7lA5AOCAp3PNgjRyUaZHGyhch2l4SDz8WKGkMb/61ZJpu
 F73XHBoycxqWtaJ6AHkuSAq1jEuS7FoKxW7n+Kf4I+ngjAyqmEYu+OlaE5HWp/c/
 A+xv6hZj8UFBNBEYChe7piYXdVwgUs2FVc11qOV3830fr0MaXRqQnEaMi/PRHs27
 tTHzucon304+ApCu5nPwX5mOF3oPWd/6qkU770403D7KaHRZ+QKeLRX2AUVtqDRO
 xJ3glbfdgIfKkYsFTPjpsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763742299; x=
 1763749499; bh=R8sbORNrVfeWd8nr6oD3a9uPzFLZbbObLNNt4scEFDk=; b=T
 4odQl0bbYP0fapPyPtcd1y0iotE3USAh1c+743hsO8cgd1nVNiI9hOwuiL2YWO8s
 dt4WV1/vhace+UXSKbFCojCHTduC6rxMN6r8q9/9MGA4w1fcujSVXxVLSf6iopRq
 qPZtSHDX8MCUdbh1D26v3tzWcQ59GFK6vysvWURvM7di5s+yAwaBpRmyx1WvQxrO
 q2Sh5r9qVcvKCYZmzMgBFZ+s52IMtxjsypSXG4zccV8xW+hnyiM8Z2fF5HHrQ4yL
 cPIJLyVWH78JBDAcAHMuFZRdVBOmmeLp2jKCjOGu/VLdgX7/ndkrnxB8vrz6fSI3
 ZN4sb60lU2sHD/yRZQvCA==
X-ME-Sender: <xms:WpIgadyHQYiFK5J1UwmSjK0GJR7opTygUEzQ0jyFX4RcWI_9JhFmNA>
 <xme:WpIgaWdWgxw7eAZ1AKDk_gmYq6UdqGQY5BUwUJOcNd9vWj5_ir-rnYvgbwncxVTu9
 E5PHF1lql_eZM7CCyhmXS62aU9yZKXHvuzDIjjQ86utWWhE9xu2>
X-ME-Received: <xmr:WpIgabmGbbk-eU8MWhQtBvGU_k0QEl4vXMnpFd_XMBnJlpL8jIHdpwOn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedtgeefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucfrhhhishhhihhnghdqkffkrfgprhhtucdliedtjedmne
 cujfgurhepfffhvfevuffkjghfgggtgfesthejredttddtvdenucfhrhhomheptehlvgig
 ucghihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrf
 grthhtvghrnhepgeevkeeiveeuheegkeetveefgfeggeejjeelvdffueelhffgleevteeg
 fffgvefgnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpmhhsghhiugdrlhhinhhkne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlvgig
 sehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopeegtddpmhhouggvpehsmhhtph
 houhhtpdhrtghpthhtohepjhhgghesnhhvihguihgrrdgtohhmpdhrtghpthhtoheprghg
 ohhruggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheprghirhhlihgvug
 esghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgidrfihilhhlihgrmhhsohhnsehr
 vgguhhgrthdrtghomhdprhgtphhtthhopegrnhhkihhtrgesnhhvihguihgrrdgtohhmpd
 hrtghpthhtohepsghorhhnthhrrggvghgvrheslhhinhhugidrihgsmhdrtghomhdprhgt
 phhtthhopegsrhgvthhtrdgtrhgvvghlvgihsegrmhgurdgtohhmpdhrtghpthhtohepug
 hrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphht
 thhopegvrhhitgdrrghughgvrhesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:WpIgaVSVoAoaVhiB9T_6MLhuMBKqbn0hkCI-zBmTpLtMUOP5VxfGGg>
 <xmx:WpIgaadDKBxoz-K4UcMaIitoiVRYj3Kmw1p7S2niF93gJ_B26Jlbdg>
 <xmx:WpIgaS3MkMqS7XZkgy6uqV0n9XlkDWGdRVO8bqJ9f5UZzVmE8x3PDw>
 <xmx:WpIgabLsTdugGzrlPzP9TH7xEs2DCneALzQq3Px0YtbKmdkBLHZeMA>
 <xmx:W5IgaWKNIJO5tlrjxf8bMjbc8KZW3xpbSFxkSWwtvqPDaZRY8aJbGsLb>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Nov 2025 11:24:54 -0500 (EST)
Date: Fri, 21 Nov 2025 09:24:53 -0700
From: Alex Williamson <alex@shazbot.org>
To: Jason Gunthorpe <jgg@nvidia.com>
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, Kevin Tian <kevin.tian@intel.com>,
 patches@lists.linux.dev, Pranjal Shrivastava <praan@google.com>,
 Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 00/22] vfio: Give VFIO_DEVICE_GET_REGION_INFO its own op
Message-ID: <20251121092453.6f151e0b.alex@shazbot.org>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
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

On Fri,  7 Nov 2025 13:41:16 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> There is alot of duplicated code in the drivers for processing
> VFIO_DEVICE_GET_REGION_INFO. Introduce a new op get_region_info_caps()
> which provides a struct vfio_info_cap and handles the cap chain logic
> to write the caps back to userspace and remove all of this duplication
> from drivers.
> 
> This is done in two steps, the first is a largely mechanical introduction
> of the get_region_info(). These patches are best viewed with the diff
> option to ignore whitespace (-b) as most of the lines are re-indending
> things.
> 
> Then drivers are updated to remove the duplicate cap related code. Some
> drivers are converted to use vfio_info_add_capability() instead of open
> coding a version of it.
> 
> This is on github: https://github.com/jgunthorpe/linux/commits/vfio_get_region_info_op
> 
> v2:
>  - Rename
>     hisi_acc_vfio_get_region -> hisi_acc_vfio_ioctl_get_region
>     vfio_fsl_mc_get_region_info -> vfio_fsl_mc_ioctl_get_region_info
>     intel_vgpu_get_region_info -> intel_vgpu_ioctl_get_region_info
>     mbochs_get_region_info -> mbochs_ioctl_get_region_info
>     intel_vgpu_get_region_info -> intel_vgpu_ioctl_get_region_info
>     vfio_ccw_mdev_get_region_info -> vfio_ccw_mdev_ioctl_get_region_info
>     hisi_acc_vfio_get_region -> hisi_acc_vfio_ioctl_get_region
>     vfio_fsl_mc_get_region_info -> vfio_fsl_mc_ioctl_get_region_info
>  - Consistently free caps.buf in vfio_get_region_info()
> v1: https://patch.msgid.link/r/0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com

Applied to vfio next branch for v6.19.  Thanks,

Alex
