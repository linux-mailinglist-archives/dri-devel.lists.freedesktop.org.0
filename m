Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0533467DD3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 20:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0077B960;
	Fri,  3 Dec 2021 19:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47527B960;
 Fri,  3 Dec 2021 19:10:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E95E1B826A6;
 Fri,  3 Dec 2021 19:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A3E2C53FCE;
 Fri,  3 Dec 2021 19:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638558609;
 bh=60mi6p08U2wbwvB97Xgf4RVXwcC9c+P0q4JsuFDiPOI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uQZ/0KBBwOlmv3heoNYQUyaiMcNeBzGSS7RGwLrUa1wvnnZZQ6T1aiotEpZc9+H1z
 suTSmGKxpgS0c6XVGVxaalBJmrlSSeOStYBqFjdMzEM6uEaV7mDiaiERaCljh6lClu
 y4ZeXl8bU86S0Tlh1qM71hMLRLoJ42fEBPac2QnYi8LwMmxeQwBlOG69sUpBZ0dwu6
 xIWcpHtOouVmuoukYE96Ve65pWnv8OAvBZnBZ7lis61qy71Izg3SQMHOwLTAYKOLk2
 iFIkS8YvN30sqDOF+sQImtsnqnMxvHc1VQ8rHRM/6ZRUBTOBloBH7A1DsAO4wP+3JL
 fMwQadF7d2iGQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 76F2C60A95;
 Fri,  3 Dec 2021 19:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf v2] treewide: add missing includes masked by cgroup ->
 bpf dependency
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163855860948.24022.9001786774413649159.git-patchwork-notify@kernel.org>
Date: Fri, 03 Dec 2021 19:10:09 +0000
References: <20211202203400.1208663-1-kuba@kernel.org>
In-Reply-To: <20211202203400.1208663-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
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
Cc: kw@linux.com, songliubraving@fb.com, kafai@fb.com, airlied@linux.ie,
 linux-pci@vger.kernel.org, ast@kernel.org, dri-devel@lists.freedesktop.org,
 andrii@kernel.org, a-govindraju@ti.com, ray.huang@amd.com, sbhatta@marvell.com,
 lorenzo.pieralisi@arm.com, daniel@iogearbox.net,
 krzysztof.kozlowski@canonical.com, john.fastabend@gmail.com,
 hkelam@marvell.com, geert@linux-m68k.org, matthew.auld@intel.com, yhs@fb.com,
 sgoutham@marvell.com, thomas.hellstrom@linux.intel.com, pawell@cadence.com,
 tzimmermann@suse.de, mani@kernel.org, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 kpsingh@kernel.org, rogerq@kernel.org, linux-samsung-soc@vger.kernel.org,
 rodrigo.vivi@intel.com, bhelgaas@google.com, sean@poorly.run,
 akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 axboe@kernel.dk, linux-block@vger.kernel.org, sj@kernel.org,
 lima@lists.freedesktop.org, linux-mm@kvack.org, jingoohan1@gmail.com,
 peter.chen@kernel.org, linux-usb@vger.kernel.org, christian.koenig@amd.com,
 yuq825@gmail.com, gregkh@linuxfoundation.org, bpf@vger.kernel.org,
 colin.king@intel.com, freedreno@lists.freedesktop.org, gakula@marvell.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello:

This patch was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Thu,  2 Dec 2021 12:34:00 -0800 you wrote:
> cgroup.h (therefore swap.h, therefore half of the universe)
> includes bpf.h which in turn includes module.h and slab.h.
> Since we're about to get rid of that dependency we need
> to clean things up.
> 
> v2: drop the cpu.h include from cacheinfo.h, it's not necessary
> and it makes riscv sensitive to ordering of include files.
> 
> [...]

Here is the summary with links:
  - [bpf,v2] treewide: add missing includes masked by cgroup -> bpf dependency
    https://git.kernel.org/bpf/bpf/c/8581fd402a0c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


