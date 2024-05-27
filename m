Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1AB8CF780
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 04:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA6D10E166;
	Mon, 27 May 2024 02:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q0dezIaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E8C10E166
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 02:55:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1DABCCE0D55;
 Mon, 27 May 2024 02:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 297E9C32789;
 Mon, 27 May 2024 02:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716778511;
 bh=39qO4ArV4WMkI/+MoaGYnazaqANez7q1UTHks9np4s8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Q0dezIaZxlrFzGX+kwhj2Y2qgdgxgguKN499Jh6AowH8IHeJppEuw4g7xqZYAYgo4
 G6jUAAyLWCEVkfsD1mDJANpVjyLnmRrtZ1eU3E9kpfsI0eX1WgAGhz3mESO/wstYxW
 KlXPs9J3jsrQJzoXpOpH/QHieyH1dbeIGfY1v333StXkq31ugdlHGSzYvAQAkP4yg4
 RFj9WNzlbshlmUt3F7cb2b24HyGrIagt7+DfXiVHUgmWb5CUxpW9qjgd4L1Gb/FQo6
 z6/h2XYMLL8Ql4Xq45fK8WJpGmfFeZVXW/qU8OADaNbi7VhNG/thDKBeU77W2mZxyF
 PJefczsOXHIPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 13421CF21F9; Mon, 27 May 2024 02:55:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <171677851107.1901.3212994325646956148.git-patchwork-notify@kernel.org>
Date: Mon, 27 May 2024 02:55:11 +0000
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

This patch was applied to chrome-platform/linux.git (for-kernelci)
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


