Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ABE46EF7D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309F910EB95;
	Thu,  9 Dec 2021 16:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5AE10E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 16:10:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 08D7ECE2223;
 Thu,  9 Dec 2021 16:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06E19C341D0;
 Thu,  9 Dec 2021 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639066210;
 bh=zXPRW+vBKvZ6RvimQyuamzBt3dWqn9UHC6LIrTaukrs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XxQcIzkEADviCjv+oUBm3rcJMNLeStm0f5LC9AZxOHwQQt/d8gNOQkoZfQMEDmhOv
 FyWuXMho1L03eNNSzsZ/TuEcjlOA81tDXVKRGS69PIGum/g9xfeQlsxmGqwmZRE3nI
 K0ybR/6YS0oT2JEzWqIcMZwREmQZfMar12rFw7z9CELIbxaowCSq4JNDjbCdOQ91Hs
 8+vH8jNbUi7U/RN2HCUR6eCWm+ZLcu/hvHuqAonz4B62oPVfEyp/cTKBSte3VD1jUC
 yvgLbqufra1rKld43e5TMgwqX2maBOEUtv8jEKJK94TUMDjn7xtq5J1Va+WqeI4RiZ
 viNhcIkpTpEDw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D7EB560BE3;
 Thu,  9 Dec 2021 16:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: mana: Fix memory leak in mana_hwc_create_wq
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163906620987.18129.15445565524915485016.git-patchwork-notify@kernel.org>
Date: Thu, 09 Dec 2021 16:10:09 +0000
References: <20211208223723.18520-1-jose.exposito89@gmail.com>
In-Reply-To: <20211208223723.18520-1-jose.exposito89@gmail.com>
To: =?utf-8?b?Sm9zw6kgRXhww7NzaXRvIDxqb3NlLmV4cG9zaXRvODlAZ21haWwuY29tPg==?=@ci.codeaurora.org
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
Cc: wei.liu@kernel.org, sthemmin@microsoft.com, christian.koenig@amd.com,
 netdev@vger.kernel.org, haiyangz@microsoft.com, decui@microsoft.com,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kys@microsoft.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  8 Dec 2021 23:37:23 +0100 you wrote:
> If allocating the DMA buffer fails, mana_hwc_destroy_wq was called
> without previously storing the pointer to the queue.
> 
> In order to avoid leaking the pointer to the queue, store it as soon as
> it is allocated.
> 
> Addresses-Coverity-ID: 1484720 ("Resource leak")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> [...]

Here is the summary with links:
  - net: mana: Fix memory leak in mana_hwc_create_wq
    https://git.kernel.org/netdev/net/c/9acfc57fa2b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


