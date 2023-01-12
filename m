Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D673668161
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 21:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6972010E350;
	Thu, 12 Jan 2023 20:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B529710E350
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 20:01:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4C397CE1F92;
 Thu, 12 Jan 2023 20:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28061C433D2;
 Thu, 12 Jan 2023 20:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673553688;
 bh=DjplknG/Og42vIVzT/q7FbntQdQMbrnKJqFFsTyhjNM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EUafdQGi6kPVntwFcsX8dQ++eMfDpAt4hRufXGYp4rn3498p9O5an8Dtzb32f8VZO
 /0dwxqLx9EiZWyrofGYjXdGydKTREAjzdQvusJ0Ow7D4V0fv83WO6VIMOVK93JIW2S
 WKNFKVIBv7VwC+kTD5h1WgF5etFBp2YPn8S3ZXmT1Seav9nsmaQ1vhNBslaNNmcYRn
 zsCLB4TmasZgZxWFa1UpanGfaUnDdJStrP+pk1HardQUH3NiBxgoCCXTezH0ic2ZBw
 6otuSPV9m9aONvZu3dzL7IfHqeZgMZCL4VALktP1HibdXNi78cOSWjN0jogQQsvptF
 31XhLFJQie5QQ==
From: Mark Brown <broonie@kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20230105134622.254560-1-arnd@kernel.org>
References: <20230105134622.254560-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH v2 00/27] ARM: pxa: remove all unused
 boards&drivers
Message-Id: <167355367885.2500964.3629822486060649314.b4-ty@kernel.org>
Date: Thu, 12 Jan 2023 20:01:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
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
Cc: alexandre.belloni@bootlin.com, linux-usb@vger.kernel.org, vigneshr@ti.com,
 lgirdwood@gmail.com, viresh.kumar@linaro.org, ulf.hansson@linaro.org,
 linux@dominikbrodowski.net, perex@perex.cz, wsa+renesas@sang-engineering.com,
 patches@opensource.cirrus.com, linux-mtd@lists.infradead.org,
 philipp.zabel@gmail.com, miquel.raynal@bootlin.com,
 damien.lemoal@opensource.wdc.com, kernel@wantstofly.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org, brgl@bgdev.pl,
 lee@kernel.org, linux@armlinux.org.uk, marek.vasut@gmail.com,
 stern@rowland.harvard.edu, lost.distance@yahoo.com, slapin@ossfans.org,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-gpio@vger.kernel.org, sre@kernel.org, linux-fbdev@vger.kernel.org,
 tiwai@suse.com, linux-arm-kernel@lists.infradead.org, balbi@kernel.org,
 mkpetch@internode.on.net, s.shtylyov@omp.ru, linux-ide@vger.kernel.org,
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
 dmitry.torokhov@gmail.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, sudipm.mukherjee@gmail.com,
 linux-renesas-soc@vger.kernel.org, gregkh@linuxfoundation.org,
 alsa-devel@alsa-project.org, deller@gmx.de, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 Jan 2023 14:45:55 +0100, Arnd Bergmann wrote:
> Most of the legacy PXA board files were marked as unused in linux-5.19 and
> can get removed in linux-6.3. There is support for pxa250/pxa270/pxa300
> using devicetree already, which supports a number of boards, but progress
> on converting the remaining ones has stalled over the past few years.
> 
> The two boards that are left in the tree for now are the three 'sharpsl'
> variants (spitz/akita/borzoi) and the 'gumstix' family of machines.
> Both of these are supported by qemu, which can be helpful for completing
> the DT conversion.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[14/27] ASoC: PXA: make SND_PXA2XX_SOC_AC97 user-selectable
        commit: 5eab9265759e2fb042aa452931c3d06ab7ab8dae
[15/27] ASoC: pxa: remove unused board support
        (no commit info)

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
