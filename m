Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482E755C76
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 09:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF0410E1E9;
	Mon, 17 Jul 2023 07:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C85910E1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 07:10:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16B9360F90;
 Mon, 17 Jul 2023 07:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 630E6C43391;
 Mon, 17 Jul 2023 07:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689577823;
 bh=kvQ4q466Bpj6b6ubZR8+sRx3jIO1KBUpvlufwnQcgfU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VqNtVmevieTksEJLCI1ucCRZ5wR5oQ7LZObSp49ZaP/tUW6nhJXgvMoeiyvReazaA
 I6cpZsDfZ0Yh7RFF62LXzZ03M8UjpoRgH29vtXhBGm3XXvlCgEfQkpR7VqGv7GceoL
 WuLWajg7sU2SeUV8HNjz/RW1je0DekG7D136S7o50eMK+UYx7G2NySrr3V1ghaIQPN
 /KDkA67CS5QCE5CKb24dY824TKTLMveJibcINdj5yUaz/ZsPZQi62eW6Xs1UXEH5Gm
 7b+IWTVGxYrYHaGQtMq5B8sS2eE9F8Db7MjmMrq5voOSvABX/FVNXm4YL4y3mJhq5b
 vZ2+wRoL3yCEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 367D2E270F6; Mon, 17 Jul 2023 07:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next v9 00/11] Brcm ASP 2.0 Ethernet Controller
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168957782321.7157.4637717042830143680.git-patchwork-notify@kernel.org>
Date: Mon, 17 Jul 2023 07:10:23 +0000
References: <1689286746-43609-1-git-send-email-justin.chen@broadcom.com>
In-Reply-To: <1689286746-43609-1-git-send-email-justin.chen@broadcom.com>
To: Justin Chen <justin.chen@broadcom.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, opendmb@gmail.com,
 florian.fainelli@broadcom.com, andrew@lunn.ch, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, edumazet@google.com,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 krzysztof.kozlowski+dt@linaro.org, simon.horman@corigine.com, kuba@kernel.org,
 christian.koenig@amd.com, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 13 Jul 2023 15:18:55 -0700 you wrote:
> Add support for the Broadcom ASP 2.0 Ethernet controller which is first
> introduced with 72165.
> 
> Florian Fainelli (2):
>   dt-bindings: net: Brcm ASP 2.0 Ethernet controller
>   net: phy: bcm7xxx: Add EPHY entry for 74165
> 
> [...]

Here is the summary with links:
  - [net-next,v9,01/11] dt-bindings: net: brcm,unimac-mdio: Add asp-v2.0
    https://git.kernel.org/netdev/net-next/c/27312c43472b
  - [net-next,v9,02/11] dt-bindings: net: Brcm ASP 2.0 Ethernet controller
    https://git.kernel.org/netdev/net-next/c/a29401be8c69
  - [net-next,v9,03/11] net: bcmasp: Add support for ASP2.0 Ethernet controller
    https://git.kernel.org/netdev/net-next/c/490cb412007d
  - [net-next,v9,04/11] net: bcmasp: Add support for WoL magic packet
    https://git.kernel.org/netdev/net-next/c/a2f0751206b0
  - [net-next,v9,05/11] net: bcmasp: Add support for wake on net filters
    https://git.kernel.org/netdev/net-next/c/c5d511c49587
  - [net-next,v9,06/11] net: bcmasp: Add support for eee mode
    https://git.kernel.org/netdev/net-next/c/550e6f345687
  - [net-next,v9,07/11] net: bcmasp: Add support for ethtool standard stats
    https://git.kernel.org/netdev/net-next/c/649315346729
  - [net-next,v9,08/11] net: bcmasp: Add support for ethtool driver stats
    https://git.kernel.org/netdev/net-next/c/7c10691e1f5e
  - [net-next,v9,09/11] net: phy: mdio-bcm-unimac: Add asp v2.0 support
    https://git.kernel.org/netdev/net-next/c/9de2b402d818
  - [net-next,v9,10/11] net: phy: bcm7xxx: Add EPHY entry for 74165
    https://git.kernel.org/netdev/net-next/c/9fa0bba012c2
  - [net-next,v9,11/11] MAINTAINERS: ASP 2.0 Ethernet driver maintainers
    https://git.kernel.org/netdev/net-next/c/3abf3d15ffff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


