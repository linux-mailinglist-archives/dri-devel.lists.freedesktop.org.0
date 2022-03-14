Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221CD4D8E2E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 21:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F40210E057;
	Mon, 14 Mar 2022 20:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD1D10E057;
 Mon, 14 Mar 2022 20:30:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8B156125A;
 Mon, 14 Mar 2022 20:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 395EAC340EE;
 Mon, 14 Mar 2022 20:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647289811;
 bh=5slkzW/wYFCAJdfNlCFTBba0nZcr16X7BRShsWGs8e4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=leggAOjDGLqu5Y16iRzmCapGpn9MgtEwT4CrU4eyl+t2E31oSfK39qKDLg3AehmbU
 40wH8plobcUAZegoJFqfw9/xkqsBBPmZP9vZVSFOcI/Xp23ZGUf+pgmWTjQguJdafL
 aR+7p6LxqiE9iThzqyS8jQ9G6EB+4tZZi+yCfGQiapJJIo9jcBYm9fR9I2LX08BkN2
 bFDWmepy5ZVI6q23q7h6GXJ7SL0Svf5wH1oJCuTgacReCjqPgety1pGCFxOBEiOwa4
 z9SA1gQwBNf2EwKLfJ+KdExejyFckwalTlOP/U5FXz63cZ94Vo7u6CrKogKN+nyC4B
 +CVXdED/jOy7Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0DC0AE6D3DE; Mon, 14 Mar 2022 20:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/30] fix typos in comments
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164728981105.21494.10764025984714254687.git-patchwork-notify@kernel.org>
Date: Mon, 14 Mar 2022 20:30:11 +0000
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
In-Reply-To: <20220314115354.144023-1-Julia.Lawall@inria.fr>
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
Cc: mark.rutland@arm.com, jernej.skrabec@gmail.com, rafael@kernel.org,
 alexander.shishkin@linux.intel.com, matti.vaittinen@fi.rohmeurope.com,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Laurent.pinchart@ideasonboard.com,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, borntraeger@linux.ibm.com,
 linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org, jonas@kwiboo.se,
 linux-arm-msm@vger.kernel.org, sean.wang@mediatek.com,
 linux-can@vger.kernel.org, linux-mediatek@lists.infradead.org,
 namhyung@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-perf-users@vger.kernel.org, svens@linux.ibm.com, jolsa@kernel.org,
 linux-power@fi.rohmeurope.com, shayne.chen@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 14 Mar 2022 12:53:24 +0100 you wrote:
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
> 
> ---
> 
>  drivers/base/devres.c                               |    4 ++--
>  drivers/clk/qcom/gcc-sm6125.c                       |    2 +-
>  drivers/clk/ti/clkctrl.c                            |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c              |    4 ++--
>  drivers/gpu/drm/amd/display/dc/bios/command_table.c |    6 +++---
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c                  |    2 +-
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  |    4 ++--
>  drivers/gpu/drm/sti/sti_gdp.c                       |    2 +-
>  drivers/infiniband/hw/qib/qib_iba7220.c             |    4 ++--
>  drivers/leds/leds-pca963x.c                         |    2 +-
>  drivers/media/i2c/ov5695.c                          |    2 +-
>  drivers/mfd/rohm-bd9576.c                           |    2 +-
>  drivers/mtd/ubi/block.c                             |    2 +-
>  drivers/net/can/usb/ucan.c                          |    4 ++--
>  drivers/net/ethernet/packetengines/yellowfin.c      |    2 +-
>  drivers/net/wireless/ath/ath6kl/htc_mbox.c          |    2 +-
>  drivers/net/wireless/cisco/airo.c                   |    2 +-
>  drivers/net/wireless/mediatek/mt76/mt7915/init.c    |    2 +-
>  drivers/net/wireless/realtek/rtlwifi/rtl8821ae/dm.c |    6 +++---
>  drivers/platform/x86/uv_sysfs.c                     |    2 +-
>  drivers/s390/crypto/pkey_api.c                      |    2 +-
>  drivers/scsi/aic7xxx/aicasm/aicasm.c                |    2 +-
>  drivers/scsi/elx/libefc_sli/sli4.c                  |    2 +-
>  drivers/scsi/lpfc/lpfc_mbox.c                       |    2 +-
>  drivers/scsi/qla2xxx/qla_gs.c                       |    2 +-
>  drivers/spi/spi-sun4i.c                             |    2 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c           |    2 +-
>  drivers/usb/gadget/udc/snps_udc_core.c              |    2 +-
>  fs/kernfs/file.c                                    |    2 +-
>  kernel/events/core.c                                |    2 +-
>  30 files changed, 39 insertions(+), 39 deletions(-)

Here is the summary with links:
  - [03/30] ath6kl: fix typos in comments
    (no matching commit)
  - [10/30] mt76: mt7915: fix typos in comments
    (no matching commit)
  - [12/30] drivers: net: packetengines: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/ebc0b8b5374e
  - [19/30] rtlwifi: rtl8821ae: fix typos in comments
    (no matching commit)
  - [20/30] airo: fix typos in comments
    (no matching commit)
  - [27/30] can: ucan: fix typos in comments
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


