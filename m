Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 553028127E5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 07:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9D910E2F3;
	Thu, 14 Dec 2023 06:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA25E10E8DA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 06:20:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 70000CE231B;
 Thu, 14 Dec 2023 06:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0B1EC433CC;
 Thu, 14 Dec 2023 06:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702534828;
 bh=+vkxHeCGMNypV4HTfFOZ2Yy/60cFLbQw3F9hivio95U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XCwoc/9WTOKFFdAICIMqPHMjv6oeO4Pp+v7+7n/BcwEpfIUwCaQGC1TyO90tc3s+F
 4iMuFSonb7td1SNtF1ARcta6HO3szQxo/eTWA3PWgh1n9ndKRu3EGh+nxdxwJCDwEF
 C5wbcDdHDR9kDvws7qfFo2ZK3IFMZukwcHNhYfnGRauUxTzKDGsAZUwkEJjVzYYniB
 rd8UTiTCDeYkElN+6hTQ17XC95nHuKkDorHWKjNxvgot4aPi0xBRyLLQeDnMf+uifL
 xSTQdlfLVS9vWPcdZDdUGFtsUGZzqb7Z5spstpB1oT9YsbKWHGPQUAatOOPdI3jqXx
 PsahGbgOBc0ag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D40E9DD4EFB; Thu, 14 Dec 2023 06:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next v1 00/16] Device Memory TCP
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170253482786.28524.10625748175644260187.git-patchwork-notify@kernel.org>
Date: Thu, 14 Dec 2023 06:20:27 +0000
References: <20231208005250.2910004-1-almasrymina@google.com>
In-Reply-To: <20231208005250.2910004-1-almasrymina@google.com>
To: Mina Almasry <almasrymina@google.com>
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 edumazet@google.com, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 sumit.semwal@linaro.org, linux-arch@vger.kernel.org,
 willemdebruijn.kernel@gmail.com, jeroendb@google.com, corbet@lwn.net,
 kuba@kernel.org, pabeni@redhat.com, linux-media@vger.kernel.org,
 hawk@kernel.org, arnd@arndb.de, shailend@google.com, shakeelb@google.com,
 hramamurthy@google.com, netdev@vger.kernel.org, dsahern@kernel.org,
 ilias.apalodimas@linaro.org, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, linyunsheng@huawei.com, pkaligineedi@google.com,
 bpf@vger.kernel.org, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  7 Dec 2023 16:52:31 -0800 you wrote:
> Major changes in v1:
> --------------
> 
> 1. Implemented MVP queue API ndos to remove the userspace-visible
>    driver reset.
> 
> 2. Fixed issues in the napi_pp_put_page() devmem frag unref path.
> 
> [...]

Here is the summary with links:
  - [net-next,v1,01/16] net: page_pool: factor out releasing DMA from releasing the page
    https://git.kernel.org/netdev/net-next/c/c3f687d8dfeb
  - [net-next,v1,02/16] net: page_pool: create hooks for custom page providers
    (no matching commit)
  - [net-next,v1,03/16] queue_api: define queue api
    (no matching commit)
  - [net-next,v1,04/16] gve: implement queue api
    (no matching commit)
  - [net-next,v1,05/16] net: netdev netlink api to bind dma-buf to a net device
    (no matching commit)
  - [net-next,v1,06/16] netdev: support binding dma-buf to netdevice
    (no matching commit)
  - [net-next,v1,07/16] netdev: netdevice devmem allocator
    (no matching commit)
  - [net-next,v1,08/16] memory-provider: dmabuf devmem memory provider
    (no matching commit)
  - [net-next,v1,09/16] page_pool: device memory support
    (no matching commit)
  - [net-next,v1,10/16] page_pool: don't release iov on elevanted refcount
    (no matching commit)
  - [net-next,v1,11/16] net: support non paged skb frags
    (no matching commit)
  - [net-next,v1,12/16] net: add support for skbs with unreadable frags
    (no matching commit)
  - [net-next,v1,13/16] tcp: RX path for devmem TCP
    (no matching commit)
  - [net-next,v1,14/16] net: add SO_DEVMEM_DONTNEED setsockopt to release RX frags
    (no matching commit)
  - [net-next,v1,15/16] net: add devmem TCP documentation
    (no matching commit)
  - [net-next,v1,16/16] selftests: add ncdevmem, netcat for devmem TCP
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


