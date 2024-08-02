Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2889A9458A2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 09:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AB210E995;
	Fri,  2 Aug 2024 07:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RCOxLVqj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2060210E995
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 07:26:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 88A43629BF;
 Fri,  2 Aug 2024 07:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E26C32782;
 Fri,  2 Aug 2024 07:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722583566;
 bh=JmmWvnwqANpjD7zenAwzgobilGTCqW4hUqWf0Y4gTcw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RCOxLVqjoESIY3msSSmwrf+BM6XoLl+m0jNp3auyHRObohtFmjbChjTK3k8DdH3wk
 FNhmSXhBHwAG/M+vOM6i3MJI9yMu5D0IsfEqB261F7qXhAeh+H93odQ58YCZwIecUp
 7PfuDRBFkMszleoXLXAfxyDJi2B4zr2Mk1zWxofJPuM9npEEVZYGQRK0O/ahd+z/Vz
 iRGQIO1cL4kDHBuXHXcU9ch2i1zgNZ/V7owq7UV8dJCeaMS30yysXOhraeFZkb1IdG
 3TSXu4wjHpqBzvbiNFTtWMlqueUvuGag5EY0uxTaWUjLi1HMD0tcdc5HuRBfQodyQj
 pvpmtmzbm5mFQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org,
	Dave Airlie <airlied@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/test: fix the gem shmem test to map the sg table.
Date: Fri,  2 Aug 2024 09:26:01 +0200
Message-ID: <172258355597.939825.13392218787757829731.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715083551.777807-1-airlied@gmail.com>
References: <20240715083551.777807-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Mon, 15 Jul 2024 18:35:51 +1000, Dave Airlie wrote:
> The test here creates an sg table, but never maps it, when
> we get to drm_gem_shmem_free, the helper tries to unmap and this
> causes warnings on some platforms and debug kernels.
> 
> This also sets a 64-bit dma mask, as I see an swiotlb warning if I
> stick with the default 32-bit one.
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
