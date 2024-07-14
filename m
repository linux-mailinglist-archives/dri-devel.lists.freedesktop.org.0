Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF75D93082B
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2024 02:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEA110E0F4;
	Sun, 14 Jul 2024 00:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FiG2RHHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F44510E0F4;
 Sun, 14 Jul 2024 00:00:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7588DCE0989;
 Sun, 14 Jul 2024 00:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AEA5C4AF0C;
 Sun, 14 Jul 2024 00:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720915230;
 bh=koxBQfDdErp+l4IfuBnt4utYBLuPlb0fF2ASoCAI0P0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=FiG2RHHlMvcJaZjKCBDpDiMsetCw9E/qUeKLPVU0sXDdFvrB1xY0J0V51Rp8cAq/x
 k2ul5AifAEZFWcQgFQmBAVKoM/JYHzzJONSDQN3hdo0SPW7HpI2bg1uvkd8GCIHhvj
 2TKj4Nq0BptJLHcDmfFSv6legeRA4GYlkvhgDKYTJoF7xIudHFnyeLLMN+Jn3DlStR
 ho9JTKPY942+WdIrl7wgk2K+6mXFAuVuPYaTZTPLjCs04l/MnGOm51tkZSEcUadMGc
 EJbo7gX8SOptQm4vyUBo7M2zGFJQXPt45hxUYi7auiXKCEn0SZk2Kznu3DwM3iq01S
 PZzTAImVTY8ew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6152ADAE961; Sun, 14 Jul 2024 00:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 4/6] sfc: falcon: Make I2C terminology more inclusive
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172091523039.919.13223034713999192575.git-patchwork-notify@kernel.org>
Date: Sun, 14 Jul 2024 00:00:30 +0000
References: <20240711052734.1273652-5-eahariha@linux.microsoft.com>
In-Reply-To: <20240711052734.1273652-5-eahariha@linux.microsoft.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: ecree.xilinx@gmail.com, habetsm.xilinx@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-net-drivers@amd.com,
 linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com,
 andi.shyti@linux.intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-fbdev@vger.kernel.org
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 11 Jul 2024 05:27:32 +0000 you wrote:
> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> with more appropriate terms. Inspired by Wolfram's series to fix drivers/i2c/,
> fix the terminology for users of I2C_ALGOBIT bitbanging interface, now that
> the approved verbiage exists in the specification.
> 
> Reviewed-by: Martin Habets <habetsm.xilinx@gmail.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> 
> [...]

Here is the summary with links:
  - [v4,4/6] sfc: falcon: Make I2C terminology more inclusive
    https://git.kernel.org/netdev/net-next/c/ba88b47816a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


