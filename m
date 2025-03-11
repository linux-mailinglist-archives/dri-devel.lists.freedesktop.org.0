Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897DCA5D156
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 22:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CAC10E27A;
	Tue, 11 Mar 2025 21:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Pz04Z1fv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE37E10E27A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 21:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=8cQ/NQPSdJvXIo45BwmVpV7YAKqa0qFriHj8RB6qbiE=; b=Pz04Z1fvHkkbn+am
 bDaVD+7ggiir2qFZ2Iqkr7OXYGTOz8FuXkQ2AP4fsFAAgsWetrP6mohkF0dCc9GMbLL9M8VmTztz4
 msU/eXqHFhgCyS3670Sj3w1LlpeJnRr7fTL26B8NOwlW1jSckvtiDi+6PrZvycwDhznZLa8N4az8D
 oc5MOLb6mleltSBbkpodGkqU71/JhnLe+f9SC2ZjKp0A1C8sDMcW9sUMyRgCCoMVkzNU3I3uGOTzW
 8TTrrk+vMkCdGnYb5dww4Cbeln3tIOs8l8/Qx8jom91OlYW2NjXW1s2qfM+4dmTo3hWQ9qCLfk3aL
 rxKKxORjsRATavJ46w==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1ts6nV-004Gh7-2p;
 Tue, 11 Mar 2025 21:05:57 +0000
Date: Tue, 11 Mar 2025 21:05:57 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Mark Brown <broonie@kernel.org>
Cc: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com,
 sre@kernel.org, lgirdwood@gmail.com, alexandre.belloni@bootlin.com,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linus.walleij@linaro.org, brgl@bgdev.pl, tsbogend@alpha.franken.de,
 linux-mips@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/9] Remove pcf50633
Message-ID: <Z9CltdJsg_qaTKzQ@gallifrey>
References: <20250309193612.251929-1-linux@treblig.org>
 <174172393659.371198.1480937233663952854.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <174172393659.371198.1480937233663952854.b4-ty@kernel.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 21:05:11 up 307 days,  8:19,  1 user,  load average: 0.00, 0.01, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* Mark Brown (broonie@kernel.org) wrote:
> On Sun, 09 Mar 2025 19:36:03 +0000, linux@treblig.org wrote:
> > The pcf50633 was used as part of the OpenMoko devices but
> > the support for its main chip was recently removed in:
> > commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> > 
> > See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/
> > 
> > Remove it.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
> 
> Thanks!
> 
> [6/9] regulator: pcf50633-regulator: Remove
>       commit: 248bc01138b11ff3af38c3b4a39cb8db7aae6eb6

Thanks!
Although....I'd only tested this as part of the series and assumed
someone (Lee?) would pick the lot up in one go.

Dave

> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
