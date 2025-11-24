Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188B7C7ED3D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 03:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9A610E1BD;
	Mon, 24 Nov 2025 02:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="zmAcXhk3";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ci4vpIsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A884810E013;
 Mon, 24 Nov 2025 02:45:43 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id 61B78EC018A;
 Sun, 23 Nov 2025 21:45:42 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Sun, 23 Nov 2025 21:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1763952342;
 x=1764038742; bh=XyMJ67yTgXSbIAMvfOO91gl34Ad6fl7jZXmv2SkDhDc=; b=
 zmAcXhk3oVHEdPVrfr3CfutuI/9PZOvt8mnPCgPha2JRajMARJjqZ5ebx4m+EaLV
 xt3TKOMMXCJvsMfHKByq+AY40yR+EaAB1xGgrS4Fmw0BRNvChgyNjhXErpB9at+o
 yZx0KxmwS0MnG88klQ5QM0fy4241S3HQK+QDMdnO0kR5x1tPmt5WJi4Ejw2wa9nb
 x1q5JPCzHKWTKFHTNBxksJVhqEg0u96dBHmhYlaO6Ci/tnfRf31PlesqRMY2I+9k
 CVRuhRpn7mdyUPo5fX9EaC27St2zYAMQhajAJrxb4wS3a71v8DnJEaZgxEVpk3aL
 EUmp2HHVKwCzf96WDMhZOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763952342; x=
 1764038742; bh=XyMJ67yTgXSbIAMvfOO91gl34Ad6fl7jZXmv2SkDhDc=; b=c
 i4vpIslcc8CxdLMdqKpwqtCpmqovW0GqgF/lfQ584iu5Ya2gqYNPeFhbXMBcjsQZ
 z7EKedJEwzpGnjTQYg+0fB6AiaZsIyTXHeaoF75G+zTU7MRl+RmTr1aJeihre/GC
 2RML34BuztPozz4Cqt6tpUtHzVy/vMPw3c9kXRVphWCiBhn3LrFg/HSylBK/MjJB
 OyQOh2AfuN9rWyh9MH0QaTMEgF6hMWYbvdkdtwcmFDj658WFBhaei26ujgDRtDJy
 npA791WPk4TWeG9JtPZkUiP6635UYA5VpydABylNpfGpyz8WTLmZKp7oJT9eKofg
 aeIPya7/H1qTyzlWe7Yrg==
X-ME-Sender: <xms:1MYjacmR6fyieSbZW6akzlZIw8JQHaVdepCES4zz2Q5Wq-YyWl_YIQ>
 <xme:1MYjaVB-dm05pVFJoLLeBGro9i68wrfLKds_inSbYxm5z2UpzCiJ_n_vjg84mmWn1
 2xWPUb--F_TeghWrwxIXG3W31B9tUVpCgjzDUGt_Q8h-J2g1tQT>
X-ME-Received: <xmr:1MYjae7anH-9MmJeAxN1D67CT5UWONZXuqAvrECwbjm4HCpd9brz24QI2wA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeejgeegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthejredttddtvdenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhepteetudelgeekieegudegleeuvdffgeehleeivddtfeektdekkeehffehudet
 hffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hlvgigsehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopeegtddpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtoheplhhiuhhlohhnghhfrghngheshhhurgifvghirdgtoh
 hmpdhrtghpthhtohepjhhgghesnhhvihguihgrrdgtohhmpdhrtghpthhtoheprghgohhr
 uggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesgh
 hmrghilhdrtghomhdprhgtphhtthhopegrlhgvgidrfihilhhlihgrmhhsohhnsehrvggu
 hhgrthdrtghomhdprhgtphhtthhopegrnhhkihhtrgesnhhvihguihgrrdgtohhmpdhrtg
 hpthhtohepsghorhhnthhrrggvghgvrheslhhinhhugidrihgsmhdrtghomhdprhgtphht
 thhopegsrhgvthhtrdgtrhgvvghlvgihsegrmhgurdgtohhmpdhrtghpthhtohepughrih
 dquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-ME-Proxy: <xmx:1MYjaeUNS4lrXry9iyO_ryBDOlh81zmjHrsOfAj_w3H3zqFKmYSfHQ>
 <xmx:1MYjaWTfuxYbUJXB0x35K_JoeLfazWZR9EtFpNAYPCbdAKXmltcWhQ>
 <xmx:1MYjaabpkZGFGCVJwi3DkE0cuOC02bsnNH5Kjhq-F2UwWcOtLLj1Hw>
 <xmx:1MYjaTcvzrAdSa3rmZU-YXT07XSWx25MfPSrVPqMkNhAPpe2Bw8Ang>
 <xmx:1sYjacXY17DkNMpk9yHucpdDnlmu50w7-pA9TDOIHv04Er3UrXzkAf36>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Nov 2025 21:45:37 -0500 (EST)
Date: Sun, 23 Nov 2025 19:45:35 -0700
From: Alex Williamson <alex@shazbot.org>
To: liulongfang <liulongfang@huawei.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, <dri-devel@lists.freedesktop.org>,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, <kvm@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, <linux-s390@vger.kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, <qat-linux@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, <virtualization@lists.linux.dev>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, Kevin Tian <kevin.tian@intel.com>,
 <patches@lists.linux.dev>, Pranjal Shrivastava <praan@google.com>,
 Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 02/22] vfio/hisi: Convert to the get_region_info op
Message-ID: <20251123194535.42acb382@shazbot.org>
In-Reply-To: <b5ffda6e-d8e9-5f02-69b3-e9f1a0901f90@huawei.com>
References: <2-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
 <b5ffda6e-d8e9-5f02-69b3-e9f1a0901f90@huawei.com>
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

On Mon, 24 Nov 2025 09:39:58 +0800
liulongfang <liulongfang@huawei.com> wrote:

> On 2025/11/8 1:41, Jason Gunthorpe wrote:
> > Change the function signature of hisi_acc_vfio_pci_ioctl()
> > and re-indent it.
> > 
> > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > Acked-by: Pranjal Shrivastava <praan@google.com>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    | 57 +++++++++----------
> >  1 file changed, 27 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> > index fde33f54e99ec5..899db4d742a010 100644
> > --- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> > +++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> > @@ -1324,43 +1324,39 @@ static ssize_t hisi_acc_vfio_pci_read(struct vfio_device *core_vdev,
> >  	return vfio_pci_core_read(core_vdev, buf, new_count, ppos);
> >  }
> >  
> > -static long hisi_acc_vfio_pci_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
> > -				    unsigned long arg)
> > +static int hisi_acc_vfio_ioctl_get_region(struct vfio_device *core_vdev,
> > +					  struct vfio_region_info __user *arg)
> >  {
> > -	if (cmd == VFIO_DEVICE_GET_REGION_INFO) {
> > -		struct vfio_pci_core_device *vdev =
> > -			container_of(core_vdev, struct vfio_pci_core_device, vdev);
> > -		struct pci_dev *pdev = vdev->pdev;
> > -		struct vfio_region_info info;
> > -		unsigned long minsz;
> > +	struct vfio_pci_core_device *vdev =
> > +		container_of(core_vdev, struct vfio_pci_core_device, vdev);
> > +	struct pci_dev *pdev = vdev->pdev;
> > +	struct vfio_region_info info;
> > +	unsigned long minsz;
> >  
> > -		minsz = offsetofend(struct vfio_region_info, offset);
> > +	minsz = offsetofend(struct vfio_region_info, offset);
> >  
> > -		if (copy_from_user(&info, (void __user *)arg, minsz))
> > -			return -EFAULT;
> > +	if (copy_from_user(&info, arg, minsz))
> > +		return -EFAULT;
> >  
> > -		if (info.argsz < minsz)
> > -			return -EINVAL;
> > +	if (info.argsz < minsz)
> > +		return -EINVAL;
> >  
> > -		if (info.index == VFIO_PCI_BAR2_REGION_INDEX) {
> > -			info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
> > +	if (info.index != VFIO_PCI_BAR2_REGION_INDEX)
> > +		return vfio_pci_ioctl_get_region_info(core_vdev, arg);
> >  
> > -			/*
> > -			 * ACC VF dev BAR2 region consists of both functional
> > -			 * register space and migration control register space.
> > -			 * Report only the functional region to Guest.
> > -			 */
> > -			info.size = pci_resource_len(pdev, info.index) / 2;
> > +	info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
> >  
> 
> Please adapt based on the latest code in the Next branch.
> Code updates have already been made here.

I resolved this on commit, please verify in the vfio next branch.
Thanks,

Alex
