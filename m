Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B80E7248C28
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 18:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591FF898F5;
	Tue, 18 Aug 2020 16:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD29898F5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 16:57:30 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8965920829;
 Tue, 18 Aug 2020 16:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769850;
 bh=XwMbwS6E/T6es+7pPWexpipw53A2pwAgEeRJQNhrN4Q=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=WJKV1xF6KmWs46VgxZNR341Gyjci4Egs4cEywN7AAIl9fW9UuntljGuzDYb/QYHKJ
 WgTEmJQK0AnlLpMe2AWWZ3yji4HgMsaKLYfnOldwZxgn5qb+ZIz6QyTpJu94pq/Out
 ZH1Bv+Q1nuF3dgaV+9Mhjn0S835iPQ0HRpZXymXs=
Date: Tue, 18 Aug 2020 17:56:59 +0100
From: Mark Brown <broonie@kernel.org>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
In-Reply-To: <20200809105938.6388-1-marex@denx.de>
References: <20200809105938.6388-1-marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: Add DT bindings for RaspberryPi 7"
 display ATTINY88-based regulator/backlight controller
Message-Id: <159776976827.56451.3322395405929688936.b4-ty@kernel.org>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 9 Aug 2020 12:59:37 +0200, Marek Vasut wrote:
> Add DT bindings for RaspberryPi 7" display ATTINY88-based
> regulator/backlight controller, this one is used in the
> Raspberry Pi 7" touchscreen display unit.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: Add DT bindings for RaspberryPi 7" display ATTINY88-based regulator/backlight controller
      commit: 9c535960891470eaec5664eed2a56dbb2b6a205b
[2/2] regulator: rpi-panel: Add regulator/backlight driver for RPi panel
      commit: 38573472278da49e2ab588062d88bc2f0c11a325

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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
