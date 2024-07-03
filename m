Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFED925197
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 06:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C779B10E043;
	Wed,  3 Jul 2024 04:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cUBrMKDu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C5010E043
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 04:20:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8D7D9CE28AD;
 Wed,  3 Jul 2024 04:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB42BC4AF07;
 Wed,  3 Jul 2024 04:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719980429;
 bh=7tQ5DdUsAmsK80QqEziD7LvBBaCh71k7AGhTaH0Y/38=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=cUBrMKDudMtKU7fLylCIzX419wYJo1pg5HK6TOjByeXAaK+Iu9MB36YZ/JOwT9btt
 TW7uzotImCielBB9ZnjBfupBNdVNyd7Or8vKHUkKdIFgGxYzZPQ7dk0qjdjSxwb4Rp
 F/rMa7aLBslRu+qPTQ8XJDbadjFZxXq4OgWd9JMrq8WJzwiZVFYD/vVvbFwe+xy565
 Vz+M5IbfIIdgKv/Xn4OTGbQzcrwDFQfWNBk+vfQsUkHdumQ29dKV4EmtbBcNf/dbqG
 c42fYAdxunJw+w6thOmBVcroXRlFUa5+niTYgcDUeg0q0PWoqoNHEXFH28n9hMe0k2
 8XqAG78rRlr5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 945A6C54BB7; Wed,  3 Jul 2024 04:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v15 00/14] Device Memory TCP
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171998042959.21654.14959154340779220111.git-patchwork-notify@kernel.org>
Date: Wed, 03 Jul 2024 04:20:29 +0000
References: <20240628003253.1694510-1-almasrymina@google.com>
In-Reply-To: <20240628003253.1694510-1-almasrymina@google.com>
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
 mathieu.desnoyers@efficios.com, arnd@arndb.de, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, dsahern@kernel.org,
 willemdebruijn.kernel@gmail.com, shuah@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, bagasdotme@gmail.com, hch@infradead.org,
 razor@blackwall.org, asml.silence@gmail.com, dw@davidwei.uk, jgg@ziepe.ca,
 linyunsheng@huawei.com, shailend@google.com, hramamurthy@google.com,
 shakeel.butt@linux.dev, jeroendb@google.com, pkaligineedi@google.com
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

On Fri, 28 Jun 2024 00:32:37 +0000 you wrote:
> v15: https://patchwork.kernel.org/project/netdevbpf/list/?series=865481&state=*
> ====
> 
> No material changes in this version, only a fix to linking against
> libynl.a from the last version. Per Jakub's instructions I've pulled one
> of his patches into this series, and now use the new libynl.a correctly,
> I hope.
> 
> [...]

Here is the summary with links:
  - [net-next,v15,01/14] netdev: add netdev_rx_queue_restart()
    (no matching commit)
  - [net-next,v15,02/14] net: netdev netlink api to bind dma-buf to a net device
    (no matching commit)
  - [net-next,v15,03/14] netdev: support binding dma-buf to netdevice
    (no matching commit)
  - [net-next,v15,04/14] netdev: netdevice devmem allocator
    (no matching commit)
  - [net-next,v15,05/14] page_pool: convert to use netmem
    https://git.kernel.org/netdev/net-next/c/4dec64c52e24
  - [net-next,v15,06/14] page_pool: devmem support
    (no matching commit)
  - [net-next,v15,07/14] memory-provider: dmabuf devmem memory provider
    (no matching commit)
  - [net-next,v15,08/14] net: support non paged skb frags
    (no matching commit)
  - [net-next,v15,09/14] net: add support for skbs with unreadable frags
    (no matching commit)
  - [net-next,v15,10/14] tcp: RX path for devmem TCP
    (no matching commit)
  - [net-next,v15,11/14] net: add SO_DEVMEM_DONTNEED setsockopt to release RX frags
    (no matching commit)
  - [net-next,v15,12/14] net: add devmem TCP documentation
    (no matching commit)
  - [net-next,v15,13/14] tools: net: package libynl for use in selftests
    https://git.kernel.org/netdev/net-next/c/07c3cc51a085
  - [net-next,v15,14/14] selftests: add ncdevmem, netcat for devmem TCP
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


