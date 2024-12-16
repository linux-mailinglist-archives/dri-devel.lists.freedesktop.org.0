Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280149F36A7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 17:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1576910E70B;
	Mon, 16 Dec 2024 16:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="udS4EU0e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD8310E70B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 16:54:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C525B5C636B;
 Mon, 16 Dec 2024 16:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8293C4CED0;
 Mon, 16 Dec 2024 16:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734368063;
 bh=fGSmira3qY0qu6Pm6drcj0Bgb5kegO5+9l28c2GA9N8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=udS4EU0eMphp2mwSceRBJPdkzI/VrMjsXMZp5BmFC6BJIef/c+Wcn/96KxFZSFhLf
 zCdiTCat+WhHh33aYZkXmyx516q+wuMyPUcLHUJBgJysU04T1nvGhORixryddbu7Ed
 b59uYs2I8PloVltK5pPPXEq1WLTYZ1yfYwcw5a+LwthvfygLaPUcUtwi9oRGpmwze7
 Q+277JErXes6oeSNNAXda7wLXaCRYGWQGhOsalIoUDudcrkXWTPPXYENUlazJeApFR
 rSBGjokABEG3AhTpTDmLLgffEMycIVFjgu3a/NYPIj3jmBcDXxtoNo4YHAnFXyyqG+
 WxobQh8faXkdg==
Date: Mon, 16 Dec 2024 09:54:20 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Wei Lin Guay <wguay@fb.com>, alex.williamson@redhat.com,
 dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, jgg@nvidia.com,
 vivek.kasireddy@intel.com, dagmoxnes@meta.com, nviljoen@meta.com,
 Wei Lin Guay <wguay@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Message-ID: <Z2BbPKvbxm7jvJL9@kbusch-mbp.dhcp.thefacebook.com>
References: <20241216095429.210792-1-wguay@fb.com>
 <89d9071b-0d3e-4fcd-963b-7aa234031a38@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89d9071b-0d3e-4fcd-963b-7aa234031a38@amd.com>
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

On Mon, Dec 16, 2024 at 11:21:39AM +0100, Christian König wrote:
> Am 16.12.24 um 10:54 schrieb Wei Lin Guay:
> > From: Wei Lin Guay <wguay@meta.com>
> > However, as a general mechanism, it can support many other scenarios with
> > VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
> > generic and safe P2P mappings.
> > 
> > This series goes after the "Break up ioctl dispatch functions to one
> > function per ioctl" series.
> 
> Yeah that sounds like it should work.
> 
> But where is the rest of the series, I only see the cover letter?

Should be here:

  https://lore.kernel.org/linux-rdma/20241216095429.210792-2-wguay@fb.com/T/#u
