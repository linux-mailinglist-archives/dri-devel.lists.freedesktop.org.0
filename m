Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93614A14275
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 20:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A450010E22C;
	Thu, 16 Jan 2025 19:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UVdbgkkP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8984A10E22C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 19:42:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 69E71A4273D;
 Thu, 16 Jan 2025 19:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D5EC4CED6;
 Thu, 16 Jan 2025 19:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737056525;
 bh=oKoppv2OOBLirvwLeV0l9yiRg1FVzD1o0o8labWBews=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UVdbgkkPVNQvaJkuUwF7vyExPXtjHtAzrXscBU7D4GEHkKLbGDl7iK1Rh/+kfvfjF
 NKrGmZi8eBVAV3Ih3WBSNncEe/WNFUo2OKWuAE7yFH4A0BRhBW2gN4hV1Cu4MbcJA/
 2d9YQ4bZ8MzjuXjmFApDeSxeF8ib/L9/u8XdF0mc6o2CuVjaC/0+kgoY7isFlde50q
 4JHuvwH/i7Ib0VGXEJKraD3PcIV5UbWsRW5W9/UG49k1WJQEGdMpSI6DJSu3bpRM6E
 QEOBc0llbf92q3LxkV8blmb2bPKQ1WrghBS9PdMgZ3i4wCs9qKwd7nzkz9oFxcNePS
 RBtNppG7n6Kew==
Date: Thu, 16 Jan 2025 09:42:03 -1000
From: Tejun Heo <tj@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <dev@lankhorst.se>,
 Friedrich Vock <friedrich.vock@gmx.de>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] cgroup/rdma: Drop bogus PAGE_COUNTER select
Message-ID: <Z4lhC8DUFdLc4A3d@slm.duckdns.org>
References: <b4d462f038a2f895f30ae759928397c8183f6f7e.1737020925.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4d462f038a2f895f30ae759928397c8183f6f7e.1737020925.git.geert+renesas@glider.be>
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

On Thu, Jan 16, 2025 at 10:56:35AM +0100, Geert Uytterhoeven wrote:
> When adding the Device memory controller (DMEM), "select PAGE_COUNTER"
> was added to CGROUP_RDMA, presumably instead of CGROUP_DMEM.
> While commit e33b51499a0a6bca ("cgroup/dmem: Select PAGE_COUNTER") added
> the missing select to CGROUP_DMEM, the bogus select is still there.
> Remove it.
> 
> Fixes: b168ed458ddecc17 ("kernel/cgroup: Add "dmem" memory accounting cgroup")
> Closes: https://lore.kernel.org/CAMuHMdUmPfahsnZwx2iB5yfh8rjjW25LNcnYujNBgcKotUXBNg@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
