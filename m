Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4216B1C4E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 08:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4617A10E7A2;
	Thu,  9 Mar 2023 07:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA99510E7A2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 07:30:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42862B81E91;
 Thu,  9 Mar 2023 07:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFAE8C433AA;
 Thu,  9 Mar 2023 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678347019;
 bh=pLu2EUjm0EUWWJ8Bq7EHf6FFQCmBn3/LFHoWP+HFOaM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TRQuKn87mlc14w2ao4dBhX1cwTkgy+XNoKUXHEVGLpkVkwA961dPU03wWDtoaRCoA
 KyBg+99tIz4BIEUt4yRJjLm4kakaKOhBW2bABom535uQzWsAYQzIuv2b1wGgbxVv1I
 h99HVGsJH5XnneOV/MClhLyGOSNsyynn8EROjm+3GxkFpvcDqjJgsJvhOCzKNNWsad
 T7AURXwMYPT/hjEhGGqeiGj61NUZLPgN9CxIxpcYVno1yA6HaIr2DDe7b/W8+MxBYs
 sw45PH57JbFR6WTsYZyqATB+g1nHYdBuBvdZyVhillv7JBDYRYVwybV3DK0ya5tBtz
 fVjbtpLQp/f2A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CB1B0E61B60; Thu,  9 Mar 2023 07:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/11] tree-wide: remove support for Renesas R-Car H3 ES1
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167834701982.22182.9521763384207545073.git-patchwork-notify@kernel.org>
Date: Thu, 09 Mar 2023 07:30:19 +0000
References: <20230307163041.3815-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230307163041.3815-1-wsa+renesas@sang-engineering.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
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
Cc: linux-pm@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  7 Mar 2023 17:30:28 +0100 you wrote:
> Because H3 ES1 becomes an increasing maintenance burden and was only available
> to a development group, we decided to remove upstream support for it. Here are
> the patches to remove driver changes. Review tags have been gathered before
> during an internal discussion. Only change since the internal version is a
> plain rebase to v6.3-rc1. A branch with all removals is here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/h3es1-removal
> 
> [...]

Here is the summary with links:
  - [07/11] ravb: remove R-Car H3 ES1.* handling
    https://git.kernel.org/netdev/net-next/c/6bf0ad7f2917

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


