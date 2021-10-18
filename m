Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869DC43186D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 14:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E4A6E9F1;
	Mon, 18 Oct 2021 12:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892F16E9F1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 12:04:01 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9B0251F42D1C;
 Mon, 18 Oct 2021 13:03:59 +0100 (BST)
Date: Mon, 18 Oct 2021 14:03:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alyssa Rosenzweig
 <alyssa.rosenzweig@collabora.com>, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/5] [RFC]iommu: Add a IOMMU_DEVONLY protection flag
Message-ID: <20211018140356.67a78d1a@collabora.com>
In-Reply-To: <YW1LollkmP9HvxjT@8bytes.org>
References: <20211001143427.1564786-1-boris.brezillon@collabora.com>
 <20211001143427.1564786-2-boris.brezillon@collabora.com>
 <YW1LollkmP9HvxjT@8bytes.org>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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

Hello Joerg,

On Mon, 18 Oct 2021 12:25:38 +0200
Joerg Roedel <joro@8bytes.org> wrote:

> On Fri, Oct 01, 2021 at 04:34:23PM +0200, Boris Brezillon wrote:
> > +/*
> > + * Mapping is only accessed by the device behind the iommu. That means other
> > + * devices or CPUs are not expected to access this physical memory region,
> > + * and the MMU driver can safely restrict the shareability domain to the
> > + * device itself.
> > + */
> > +#define IOMMU_DEVONLY	(1 << 6)  
> 
> I am not entirely happy with the name, how about
> 
> 	IOMMU_DEV_PRIVATE?

Works for me.

> 
> PRIV would conflict with IOMMU_PRIV (which should probably also be
> IOMMU_PRIVILEGED, but thats another problem).

Yeah, IOMMU_PRIV is confusing. I thought I could use that flag before
realizing PRIV was for privileged not private, but I'll leave that to
someone else :-).

Regards,

Boris
