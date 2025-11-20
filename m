Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2F1C74903
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AA810E765;
	Thu, 20 Nov 2025 14:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BY9YcLo9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33EF10E76C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:30:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BE20D60131;
 Thu, 20 Nov 2025 14:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D225C4CEF1;
 Thu, 20 Nov 2025 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763649050;
 bh=G0UVsRqQ7j8J9S16cmfX+j6Xm8Cx7ey9TFc+hgOvBdc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BY9YcLo9PfgLCtt2rd0kgNyiwsySVweY8KcCyA6BZwyH6QSGzWolRG59qQBleVOdV
 2YPw73f5oaRWHYMp8PsWt758sIPRvImjds+2QvxjNT3pk8FpD2uAENbsyJmyTcmAko
 K4Wc5H8igZzgX7q8zgD+GXWCcXiKU69+OnaDj0cUCcVtMqR6Ln8u+cpMdxpjs1DkLs
 Vz0b8JopsN8zGBq7Ln7dQ2vhkJy4GWNtl0fKvy+i5uXY5FB8T7eu3rMobUPWuwSwx0
 kSia1/X5hInvUYSppwsSJLpqago3Xi67ZiQLZarj/c/x/AGqDoRprp63jB4vlrxvEJ
 7Rim3ehM+vlsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAF1739FEB77; Thu, 20 Nov 2025 14:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6 0/6] Add AF_XDP zero copy support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176364901575.1647241.5550367394642830810.git-patchwork-notify@kernel.org>
Date: Thu, 20 Nov 2025 14:30:15 +0000
References: <20251118135542.380574-1-m-malladi@ti.com>
In-Reply-To: <20251118135542.380574-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: horms@kernel.org, namcao@linutronix.de, vadim.fedorenko@linux.dev,
 jacob.e.keller@intel.com, christian.koenig@amd.com, sumit.semwal@linaro.org,
 sdf@fomichev.me, john.fastabend@gmail.com, hawk@kernel.org,
 daniel@iogearbox.net, ast@kernel.org, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
 rogerq@kernel.org, danishanwar@ti.com
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 18 Nov 2025 19:25:36 +0530 you wrote:
> This series adds AF_XDP zero coppy support to icssg driver.
> 
> Tests were performed on AM64x-EVM with xdpsock application [1].
> 
> A clear improvement is seen Transmit (txonly) and receive (rxdrop)
> for 64 byte packets. 1500 byte test seems to be limited by line
> rate (1G link) so no improvement seen there in packet rate
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/6] net: ti: icssg-prueth: Add functions to create and destroy Rx/Tx queues
    https://git.kernel.org/netdev/net-next/c/41dde7f1d013
  - [net-next,v6,2/6] net: ti: icssg-prueth: Add XSK pool helpers
    https://git.kernel.org/netdev/net-next/c/7dfd7597911f
  - [net-next,v6,3/6] net: ti: icssg-prueth: Add AF_XDP zero copy for TX
    https://git.kernel.org/netdev/net-next/c/8756ef2eb078
  - [net-next,v6,4/6] net: ti: icssg-prueth: Make emac_run_xdp function independent of page
    https://git.kernel.org/netdev/net-next/c/121133163c9f
  - [net-next,v6,5/6] net: ti: icssg-prueth: Add AF_XDP zero copy for RX
    https://git.kernel.org/netdev/net-next/c/7a64bb388df3
  - [net-next,v6,6/6] net: ti: icssg-prueth: Enable zero copy in XDP features
    https://git.kernel.org/netdev/net-next/c/c6a1ec1870e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


