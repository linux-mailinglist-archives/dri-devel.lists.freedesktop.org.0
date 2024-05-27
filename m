Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CF48CF7E2
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 05:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0848A10F7ED;
	Mon, 27 May 2024 03:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sTlhTC7O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCA210F7ED
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 03:07:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 515EBCE0DA0;
 Mon, 27 May 2024 03:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3F93C4AF08;
 Mon, 27 May 2024 03:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716779226;
 bh=V0pcoxiScDQe0zi5pcugxdyFa3kNMUT0YjglHWD7vvA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=sTlhTC7OsK22UDnsIs9n0/tAU9EjpKKUDsg8PQl7qbEvR41N1JDkNDDxYEEcR2nJ0
 BQveAiPLIg59AY9GnhoZy1Wdwgc8aEv+8BGhDv18l45JgLlySi2VgHp9pAr8CRqDBh
 9mktd0xh8O4m/02wsj11btazwYnZCMkPdtTFjrXI75ocBslFULWD3D59vy5XTNrS4K
 LVWI5xacBLKo7TkFc0wdSnaCcYac8N/SQFaiVZacJNohMkb2OchAU1J8l/wIDUmU2m
 k7fVoEsdOpVnnfouWqnPEH/4WcQEcW93l5cyciuGGHti0vfBqwYy0huealRqI4L672
 kL4iz1cyMR9vg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E35A3DE4000; Mon, 27 May 2024 03:07:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <171677922592.1901.1875168136657939730.git-patchwork-notify@kernel.org>
Date: Mon, 27 May 2024 03:07:05 +0000
References: <20240417103819.990512-1-wmacek@chromium.org>
In-Reply-To: <20240417103819.990512-1-wmacek@chromium.org>
To: Wojciech Macek <wmacek@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
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

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Chun-Kuang Hu <chunkuang.hu@kernel.org>:

On Wed, 17 Apr 2024 10:38:19 +0000 you wrote:
> In case there is no DP device attached to the port the
> transfer function should return IO error, similar to what
> other drivers do.
> In case EAGAIN is returned then any read from /dev/drm_dp_aux
> device ends up in an infinite loop as the upper layers
> constantly repeats the transfer request.
> 
> [...]

Here is the summary with links:
  - [v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
    https://git.kernel.org/chrome-platform/c/8431fff9e0f3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


