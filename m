Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDEA89244F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 20:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE2810EF87;
	Fri, 29 Mar 2024 19:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IVV3npmS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7124310EF87
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 19:31:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BC73F619E6;
 Fri, 29 Mar 2024 19:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 293A4C43390;
 Fri, 29 Mar 2024 19:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711740633;
 bh=kASKGM3dFtExpzEE03kTs35TIgPe+csliIufLHzIK04=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IVV3npmSePL8advnxP77niTJn9r5VWn3Rp+dlR8NGJ9lX2oLIqkoGV+xDPWNxKxDQ
 Vy1L2g8YCGgRSXrLc/sQkv/2M4J9jxdAA8SAbhGR8ajFTlmfsqHLf0fvOTAPm2dcKv
 R1fVsKFXQ0PjDCVdjZFjTagXNRerIfdbo2okMOvrjklmOXE9qqZC9SCAN3EPi44fip
 ZCq07ahttvJ9JoOo07ITMoNBIgDCC6Y+Xv77EcLFfSARbiSqQFxIHg2hw6SwpkmRbP
 ts7yiXSanAtz/RnbfgXbCMeoFa7uggmPCtKepIwsnK9u0syfJQLIrvmxPSuoFye3BV
 B+EvADBhn/jTg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0FC90D2D0EE; Fri, 29 Mar 2024 19:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/9] enabled -Wformat-truncation for clang
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171174063305.18563.745216419087873927.git-patchwork-notify@kernel.org>
Date: Fri, 29 Mar 2024 19:30:33 +0000
References: <20240326223825.4084412-1-arnd@kernel.org>
In-Reply-To: <20240326223825.4084412-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: llvm@lists.linux.dev, arnd@arndb.de, dmitry.torokhov@gmail.com,
 claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, kuba@kernel.org,
 saeedm@nvidia.com, leon@kernel.org, aelior@marvell.com, manishc@marvell.com,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, luzmaximilian@gmail.com,
 hare@kernel.org, martin.petersen@oracle.com, deller@gmx.de,
 masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
 johannes@sipsolutions.net, perex@perex.cz, tiwai@suse.com,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 26 Mar 2024 23:37:59 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With randconfig build testing, I found only eight files that produce
> warnings with clang when -Wformat-truncation is enabled. This means
> we can just turn it on by default rather than only enabling it for
> "make W=1".
> 
> [...]

Here is the summary with links:
  - [2/9] enetc: avoid truncating error message
    https://git.kernel.org/netdev/net-next/c/9046d581ed58
  - [3/9] qed: avoid truncating work queue length
    https://git.kernel.org/netdev/net-next/c/954fd908f177
  - [4/9] mlx5: avoid truncating error message
    https://git.kernel.org/netdev/net-next/c/b324a960354b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


