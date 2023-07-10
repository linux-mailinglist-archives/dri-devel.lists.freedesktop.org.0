Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A207174CC6D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 07:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E32010E1A6;
	Mon, 10 Jul 2023 05:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C865010E12C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 05:53:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD14760E73;
 Mon, 10 Jul 2023 05:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3390CC433C9;
 Mon, 10 Jul 2023 05:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688968399;
 bh=vSHUlZF1cMasn9YRdu77gltzVthY/lO7Soqy2M2BCbo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=fgwuJQTMYvxVcvwuRkl9FdjB8DuXSIfnERjeVQPzNMvTHWGDy0KSITDFp9vZZSVWt
 BT5d7U9DCHpzW20CplUiGePRbY/SJj2ZS6Wxro2pc9BRmUETT8rKT7m2+gDYE6jdip
 yHi2ahZMt4qDeSRuoeDaNyFQ7KY3RPNuEgoWEz++4LgAoPP95Inj+/zxGHUUtWNO8V
 RFRu44iA2kCumq1jXXly5EW/rJNxbOE3pESRGjYct89WpOiwnGEBO4HGCjEh7nKb5k
 MEcMxeVU8CpG/uCKIO0RpnuVR1jqpcKQEF7BiyBK5nJnBZc+SLn0uO0J6kZessZSLJ
 g7fDSMZvkaxIQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 13126F8370C; Mon, 10 Jul 2023 05:53:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] drm: Switch i2c drivers back to use .probe()
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <168896839907.3413.13132149372624191704.git-patchwork-notify@kernel.org>
Date: Mon, 10 Jul 2023 05:53:19 +0000
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

This patch was applied to chrome-platform/linux.git (for-next)
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


