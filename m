Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28358A4ECD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0671124F7;
	Mon, 15 Apr 2024 12:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hIkhGTKU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2706B1124F7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:20:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 53F9260C4E;
 Mon, 15 Apr 2024 12:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9473C2BD10;
 Mon, 15 Apr 2024 12:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713183628;
 bh=NBLdQ6XHX+11K1mLdHEWYrHqv/ezuPgqZrayiybzpQs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hIkhGTKUtioBSKnvXCwWJ171ZA9euy19Gg4PTb6Qd9ML6JlPtDCKW1A0VjrHZ2Zhu
 Ds2PEui9OPeIFSkjCMDknnW+LPiowhJHWW3jFo8m0kAG2ei1IuLJT0kYYAMr8KcjXp
 v4iCAqx9R9YW91vXPk2bYydjFL9EEWWiYi+tbEKjUgXCSUDjBHe5MwLrWERarW0AfI
 lVsne17u1ThxkpsKXCl2kdcucdEpiX3cMy4rcqwf/A9u7fv/vqiDuppYSvhVY3Guuc
 frmyBT7BTFywXdQQiYrkzUliTAv6Baw5LOKWJ41OdmrCupYLmii7V3+/vA/2ac18QZ
 2riyRSvUuUvpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D2442C43140; Mon, 15 Apr 2024 12:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v9 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171318362785.9918.8890821177952945239.git-patchwork-notify@kernel.org>
Date: Mon, 15 Apr 2024 12:20:27 +0000
References: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
To: Julien Panis <jpanis@baylibre.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com, horms@kernel.org,
 andrew@lunn.ch, rkannoth@marvell.com, naveenm@marvell.com,
 jacob.e.keller@intel.com, danishanwar@ti.com, yuehaibing@huawei.com,
 rogerq@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
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
by David S. Miller <davem@davemloft.net>:

On Fri, 12 Apr 2024 17:38:31 +0200 you wrote:
> This patch adds XDP support to TI AM65 CPSW Ethernet driver.
> 
> The following features are implemented: NETDEV_XDP_ACT_BASIC,
> NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.
> 
> Zero-copy and non-linear XDP buffer supports are NOT implemented.
> 
> [...]

Here is the summary with links:
  - [net-next,v9,1/3] net: ethernet: ti: Add accessors for struct k3_cppi_desc_pool members
    https://git.kernel.org/netdev/net-next/c/cd8ff81f747f
  - [net-next,v9,2/3] net: ethernet: ti: Add desc_infos member to struct k3_cppi_desc_pool
    https://git.kernel.org/netdev/net-next/c/84d767a3c0b5
  - [net-next,v9,3/3] net: ethernet: ti: am65-cpsw: Add minimal XDP support
    https://git.kernel.org/netdev/net-next/c/8acacc40f733

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


