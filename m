Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B217B244AE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 10:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9BE10E69D;
	Wed, 13 Aug 2025 08:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sUtci6My";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5F710E4EA;
 Wed, 13 Aug 2025 08:50:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 405A240BD5;
 Wed, 13 Aug 2025 08:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FB9C4CEEB;
 Wed, 13 Aug 2025 08:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755075015;
 bh=HpSkLFEcgW7BuZHgarJdSFQxecSBz2gnVw9LpRrpxms=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=sUtci6My47KSeL+0WBRNsXEy/dU9q4UPzoGOvQexfRZxsBOArTdeR6P4DWlRS9h0i
 0uT5e/gSk86y/Yj7yyiy/jpAN3vNKkWWNEh1E/wMx+m2EwL9PUkINEyuR/7j0VYbYD
 aMrRnk04aXPt+W/bEJvv/mo6dqauVlY4hEPfxH5HpxW1ar7QNszFo8nWfQ86sxSjTs
 GTJ2Yfv9dy4OVZxMCX/o8zwGUdeYvw4pna0/hc/I2CTAYQSeYx/DnmpK6zkPoBXC/H
 eZAMOUvop2N+QczJpF9z+wfQioOwdrDpsQFhYT7dbwdRsI7J5P78A0KoANXT1AUph/
 sLAIxmztCY4pQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 10:50:11 +0200
Message-Id: <DC1661RBEB1Q.1Y748EK7YML1Y@kernel.org>
Subject: Re: linux-next: manual merge of the mm-unstable tree with the
 drm-misc-fixes tree
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Vitaly Wool" <vitaly.wool@konsulko.se>, "Intel
 Graphics" <intel-gfx@lists.freedesktop.org>, "DRI"
 <dri-devel@lists.freedesktop.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250813111151.6a261ca1@canb.auug.org.au>
In-Reply-To: <20250813111151.6a261ca1@canb.auug.org.au>
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

On Wed Aug 13, 2025 at 3:11 AM CEST, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the mm-unstable tree got a conflict in:
>
>   rust/kernel/alloc/allocator.rs
>
> between commit:
>
>   fde578c86281 ("rust: alloc: replace aligned_size() with Kmalloc::aligne=
d_layout()")
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

Thanks, the resolution looks good!
