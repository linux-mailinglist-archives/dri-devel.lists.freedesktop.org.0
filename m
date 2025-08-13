Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E744CB23F37
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 05:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BEE10E69A;
	Wed, 13 Aug 2025 03:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1ZYzsHXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4380E10E1A2;
 Wed, 13 Aug 2025 03:59:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D1500418B1;
 Wed, 13 Aug 2025 03:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C47C4CEEB;
 Wed, 13 Aug 2025 03:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1755057587;
 bh=cKL8BAtdMqV5kt+LIJadzP5n5LeED7bbZLiniWO6akw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=1ZYzsHXeOtmXkgg3TckMkh5Oj7HFP2eA4jUZOmIGKPQjblUcDC+qteMFKIoMrXqA5
 gmN8CMY+nUYbT0P9+vNSRffkY30ftCh+QcjSMttpZCp268b3Dt7PjhpkLkAaMpRUkF
 FQM+bc1aquIJzawJRf3tP9LN9NB3vTzT4cfhQX2Y=
Date: Tue, 12 Aug 2025 20:59:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Vitaly Wool <vitaly.wool@konsulko.se>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mm-unstable tree with the
 drm-misc-fixes tree
Message-Id: <20250812205946.2db0d8645f3c2ed6c8828ae2@linux-foundation.org>
In-Reply-To: <20250813111151.6a261ca1@canb.auug.org.au>
References: <20250813111151.6a261ca1@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Wed, 13 Aug 2025 11:11:51 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the mm-unstable tree got a conflict in:
> 
>   rust/kernel/alloc/allocator.rs
> 
> between commit:
> 
>   fde578c86281 ("rust: alloc: replace aligned_size() with Kmalloc::aligned_layout()")
> 
> from the drm-misc-fixes tree and commit:
> 
>   cda097b07bce ("rust: support large alignments in allocations")
> 
> from the mm-unstable tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks.

Well that's messy.

Is it intended that the containing series ("Alloc and drm::Device
fixes") be merged into 6.17-rcX?


