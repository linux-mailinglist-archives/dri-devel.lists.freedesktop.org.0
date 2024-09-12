Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55952976007
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 06:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9313C10E721;
	Thu, 12 Sep 2024 04:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f9a/ZSq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D65A10E721
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 04:40:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 545835C4CBB;
 Thu, 12 Sep 2024 04:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621D0C4CEC3;
 Thu, 12 Sep 2024 04:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726116039;
 bh=atZ4KPNKSjb83Uge3zpflsYcUJEL/us60I8XWzukpe0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=f9a/ZSq5MjAJpdiUDHoVavctM5HOoilo2YhcN45JiEfgJYuD+evoGy3GTwFy3dWNK
 MCcZexV/mRsbKVhAIikQXE7layOfhJ3sIvPU5XZi6xuLqnLkHkdE/Qx+MQdf+g1ZYB
 gce1dGWnviJLx6aL4O8iqydw5+DCEJVlzFx2Q4DVfqfcYtCglZ0a3zjxo4FLA5531c
 BDOtc/uZ1bzZ/QMAIY/iMLCh/H1rCZm7mMteXHfen+24mVBLqbsIC2bNyatAA+Kt/j
 RB4GjdEViDywOWSDVtOg00irITukuSvO9eccISaYhdBZr0Vmo/BFTcf9+Idkdg7vhE
 pfG55SGZsz4KA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE1073806656; Thu, 12 Sep 2024 04:40:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v26 00/13] Device Memory TCP
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172611604053.1162260.14936560637203902304.git-patchwork-notify@kernel.org>
Date: Thu, 12 Sep 2024 04:40:40 +0000
References: <20240910171458.219195-1-almasrymina@google.com>
In-Reply-To: <20240910171458.219195-1-almasrymina@google.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com, corbet@lwn.net,
 richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 deller@gmx.de, andreas@gaisler.com, hawk@kernel.org,
 ilias.apalodimas@linaro.org, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, arnd@arndb.de, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, dsahern@kernel.org,
 willemdebruijn.kernel@gmail.com, bjorn@kernel.org, magnus.karlsson@intel.com, 
 maciej.fijalkowski@intel.com, jonathan.lemon@gmail.com, shuah@kernel.org,
 ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com, asml.silence@gmail.com,
 dw@davidwei.uk, jgg@ziepe.ca, linyunsheng@huawei.com, shailend@google.com,
 hramamurthy@google.com, shakeel.butt@linux.dev, jeroendb@google.com,
 pkaligineedi@google.com, bagasdotme@gmail.com, hch@infradead.org,
 razor@blackwall.org, ap420073@gmail.com
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

On Tue, 10 Sep 2024 17:14:44 +0000 you wrote:
> v26: https://patchwork.kernel.org/project/netdevbpf/list/?series=888227&state=*
> ====
> 
> No major changes. Only applied Reviewed-by tags from Jakub and addressed
> reported nits.
> 
> v25: https://patchwork.kernel.org/project/netdevbpf/list/?series=885396&state=*
> ===
> 
> [...]

Here is the summary with links:
  - [net-next,v26,01/13] netdev: add netdev_rx_queue_restart()
    https://git.kernel.org/netdev/net-next/c/7c88f86576f3
  - [net-next,v26,02/13] net: netdev netlink api to bind dma-buf to a net device
    https://git.kernel.org/netdev/net-next/c/3efd7ab46d0a
  - [net-next,v26,03/13] netdev: support binding dma-buf to netdevice
    https://git.kernel.org/netdev/net-next/c/170aafe35cb9
  - [net-next,v26,04/13] netdev: netdevice devmem allocator
    https://git.kernel.org/netdev/net-next/c/28c5c74eeaa0
  - [net-next,v26,05/13] page_pool: devmem support
    https://git.kernel.org/netdev/net-next/c/8ab79ed50cf1
  - [net-next,v26,06/13] memory-provider: dmabuf devmem memory provider
    https://git.kernel.org/netdev/net-next/c/0f9214046893
  - [net-next,v26,07/13] net: support non paged skb frags
    https://git.kernel.org/netdev/net-next/c/9f6b619edf2e
  - [net-next,v26,08/13] net: add support for skbs with unreadable frags
    https://git.kernel.org/netdev/net-next/c/65249feb6b3d
  - [net-next,v26,09/13] tcp: RX path for devmem TCP
    https://git.kernel.org/netdev/net-next/c/8f0b3cc9a4c1
  - [net-next,v26,10/13] net: add SO_DEVMEM_DONTNEED setsockopt to release RX frags
    https://git.kernel.org/netdev/net-next/c/678f6e28b5f6
  - [net-next,v26,11/13] net: add devmem TCP documentation
    https://git.kernel.org/netdev/net-next/c/09d1db26b5e5
  - [net-next,v26,12/13] selftests: add ncdevmem, netcat for devmem TCP
    https://git.kernel.org/netdev/net-next/c/85585b4bc8d8
  - [net-next,v26,13/13] netdev: add dmabuf introspection
    https://git.kernel.org/netdev/net-next/c/d0caf9876a1c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


