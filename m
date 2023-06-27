Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8930A74017C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 18:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9142E10E313;
	Tue, 27 Jun 2023 16:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9F110E313;
 Tue, 27 Jun 2023 16:40:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC0CE611F2;
 Tue, 27 Jun 2023 16:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D8F0C433C9;
 Tue, 27 Jun 2023 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687884023;
 bh=Mddr9IEnVSSEtvey/EPFRhLi4YnxlTkalZzmHZ6bmJ8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XGRGiORnH0FmaQ+kclMjYIsE8aiZt7Gs4g5WBNw+zT0ASSus8daZkKZirfbcgaoBv
 HsuO0nskJhLaiZxylU7zlINMijGNLl9q7WEg/ms3Lh/IrCmjj2LVp6pXCXh1uqP4W3
 kOcx2VCa4pIOSzcMTF35giAc72J/A42BnFN7K4h/MvLUE7JXaOanngW1cFFib+5J4v
 8N2ABirViOcrN32FYcrvP15sAv/TezaSVGJHU9rgp1d1sCUFbyUbMRRUsWjqDMoEYN
 HlJlhL0V9YgQDqvmqEWLdtvBli6Q5b70JaJ8QNh8cP8DiB/xBCXlUB+GXHpoI+1ee3
 oj4CRUwtvenNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7B046C64458; Tue, 27 Jun 2023 16:40:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/24] use vmalloc_array and vcalloc
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168788402349.21860.17350888958370358926.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jun 2023 16:40:23 +0000
References: <20230627144339.144478-1-Julia.Lawall@inria.fr>
In-Reply-To: <20230627144339.144478-1-Julia.Lawall@inria.fr>
To: Julia Lawall <julia.lawall@inria.fr>
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
Cc: linux-hyperv@vger.kernel.org, dave.hansen@linux.intel.com,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, jstultz@google.com, hpa@zytor.com,
 linux-sgx@vger.kernel.org, xuanzhuo@linux.alibaba.com,
 benjamin.gaignard@collabora.com, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, kasan-dev@googlegroups.com, iommu@lists.linux.dev,
 kuba@kernel.org, labbott@redhat.com, linux-media@vger.kernel.org,
 keescook@chromium.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 vdumpa@nvidia.com, shailend@google.com, christophe.jaillet@wanadoo.fr,
 linux-tegra@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 dvyukov@google.com, andreyknvl@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, lmark@codeaurora.org, mhi@lists.linux.dev,
 robin.murphy@arm.com, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 27 Jun 2023 16:43:15 +0200 you wrote:
> The functions vmalloc_array and vcalloc were introduced in
> 
> commit a8749a35c399 ("mm: vmalloc: introduce array allocation functions")
> 
> but are not used much yet.  This series introduces uses of
> these functions, to protect against multiplication overflows.
> 
> [...]

Here is the summary with links:
  - [v2,02/24] octeon_ep: use vmalloc_array and vcalloc
    https://git.kernel.org/netdev/net-next/c/32d462a5c3e5
  - [v2,04/24] gve: use vmalloc_array and vcalloc
    https://git.kernel.org/netdev/net-next/c/a13de901e8d5
  - [v2,09/24] pds_core: use vmalloc_array and vcalloc
    https://git.kernel.org/netdev/net-next/c/906a76cc7645
  - [v2,11/24] ionic: use vmalloc_array and vcalloc
    https://git.kernel.org/netdev/net-next/c/f712c8297e0a
  - [v2,18/24] net: enetc: use vmalloc_array and vcalloc
    https://git.kernel.org/netdev/net-next/c/fa87c54693ae
  - [v2,22/24] net: mana: use vmalloc_array and vcalloc
    https://git.kernel.org/netdev/net-next/c/e9c74f8b8a31

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


