Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD0C74CC4D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 07:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A5D10E19E;
	Mon, 10 Jul 2023 05:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D1D10E19E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 05:39:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A233960E0A;
 Mon, 10 Jul 2023 05:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00F99C433CB;
 Mon, 10 Jul 2023 05:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688967590;
 bh=O3REscTS4Ua0NMAYuLLm93hDnfz4R6BtMlgAdHbVspU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=I8auQkrUpyL1phFPN143+6nwh5o+00hS/rePp9ZqdVB8qoTzP8cqxcmM/g0Zs1azM
 lc8RYztmnezQk8TYy22daouDLh7GkZDr9b8UMcDQwj1EuShiexwAkySgfK34g2nJY6
 hW+uemNHjarhidBC9gbJvoSZaZMts1V9eFkwGPLR1Nq9zfsMRbpxZRv5Hp1WyKYKIH
 CPDLxhsyIFQk+zXit9nf5WxGsXaOaFIvqpeDG/3ASBU4e9+H1H8CgKPezVPFlDb0GH
 CNLoWNvFvtyCWxAKK5kXsuJdHxkuD7+ZO06vp77kPofWBne6mO/eomOGPelV9Mq1xr
 XvCAaJ7TFb9iw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D6895C73FE1; Mon, 10 Jul 2023 05:39:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] drm: Switch i2c drivers back to use .probe()
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <168896758987.3413.10759631595788168825.git-patchwork-notify@kernel.org>
Date: Mon, 10 Jul 2023 05:39:49 +0000
References: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
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
Cc: antonio.borneo@foss.st.com, heikki.krogerus@linux.intel.com,
 cmo@melexis.com, martyn.welch@collabora.co.uk, peter.senna@gmail.com,
 benjamin.mugnier@foss.st.com, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 groeck@chromium.org, chrome-platform@lists.linux.dev, sam@ravnborg.org,
 kernel@pengutronix.de, kabel@kernel.org, jagan@amarulasolutions.com,
 f.fainelli@gmail.com, rfoss@kernel.org, stefan@olimex.com,
 linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, adrien.grassein@gmail.com,
 ojeda@kernel.org, martin.donnelly@ge.com, tzimmermann@suse.de, jonas@kwiboo.se,
 jiasheng@iscas.ac.cn, quic_abhinavk@quicinc.com,
 linux-rpi-kernel@lists.infradead.org, Jonathan.Cameron@huawei.com,
 a.fatoum@pengutronix.de, hsinyi@chromium.org,
 andriy.shevchenko@linux.intel.com, xji@analogixsemi.com,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 windhl@126.com, dianders@chromium.org, ple@baylibre.com, alsi@bang-olufsen.dk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Douglas Anderson <dianders@chromium.org>:

On Fri, 26 May 2023 11:07:09 +0200 you wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> [...]

Here is the summary with links:
  - [v2] drm: Switch i2c drivers back to use .probe()
    https://git.kernel.org/chrome-platform/c/332af828ce78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


