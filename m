Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24E7B176F0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 22:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE5210E0A1;
	Thu, 31 Jul 2025 20:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FqFjGvTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5659010E0A1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 20:10:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D3C15C6299;
 Thu, 31 Jul 2025 20:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32469C4CEEF;
 Thu, 31 Jul 2025 20:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753992642;
 bh=9U2uUlJsgZQb8PnOGpghq8IKlvSCiqX1yAsveCq9xjQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FqFjGvTWoOpjS9KvsDirQk907SkyQnBTWfn3nbr+zeVZ7RmjjK+zt51CCLLOarUZR
 QdTVu2kVsivyUJw/4Ec/Bv9yU+QPSSy77l9rnv///1HzWpe/bIVZ+DewNCYeP75Yfy
 lu6MLpqEpmNuPnVGXO32n0cYmY5lPzTs1sHkda3sbquTFVz6Cao5RjKJIZnzU64QzD
 oDcX4vo8Vjxg3Q/R2C3vp5jj08gQi3tbYlGEJ3ZHksTIOsb6endBQ/IjSPrwIPiOHp
 gz3nHv7R1XhaXCqCt1clofxPVCkd6R+9iCE0kj6r32n4Ktjwlrb9BsAWgS9HZzC2v1
 0PSSWb6D1MHVQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: pr-tracker-bot@kernel.org,
	torvalds@linux-foundation.org
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, simona@ffwll.ch,
 Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [git pull] drm for 6.17-rc1
Date: Thu, 31 Jul 2025 22:09:52 +0200
Message-ID: <20250731200952.307037-1-ojeda@kernel.org>
In-Reply-To: <175393147528.2597948.6255690700279027909.pr-tracker-bot@kernel.org>
References: <175393147528.2597948.6255690700279027909.pr-tracker-bot@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Thu, 31 Jul 2025 03:11:15 +0000 pr-tracker-bot@kernel.org wrote:
>
> The pull request you sent on Wed, 30 Jul 2025 07:05:51 +1000:
>
> > https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-07-30
>
> has been merged into torvalds/linux.git:
> https://git.kernel.org/torvalds/c/260f6f4fda93c8485c8037865c941b42b9cba5d2

I know you are particularly busy this merge window, but if this diff
could be applied between merges at some point, it would be nice.

I put it below in the form of a patch with similar wording to another
one you did in case it saves you time.

Thanks!

Cheers,
Miguel

From: Miguel Ojeda <ojeda@kernel.org>
Date: Thu, 31 Jul 2025 21:41:37 +0200
Subject: [PATCH] gpu: nova-core: fix up formatting after merge

In the merge 260f6f4fda93 ("Merge tag 'drm-next-2025-07-30' of
https://gitlab.freedesktop.org/drm/kernel"), the formatting in the
conflict resolution doesn't match what `make rustfmt` wants to make it.

Fix it up appropriately.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/gpu/nova-core/driver.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index cb68d0bc1e63..5749bad9c285 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0

-use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sync::Arc, sizes::SZ_16M};
+use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sizes::SZ_16M, sync::Arc};

 use crate::gpu::Gpu;


base-commit: 831462ff3ec61fd2e6726b534a351a1a722bf2ab
--
2.50.1
