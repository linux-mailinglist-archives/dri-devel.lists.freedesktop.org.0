Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60711ACA57
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 17:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F299A6E2F8;
	Thu, 16 Apr 2020 15:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5A96E2F8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:34:16 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66B0521927;
 Thu, 16 Apr 2020 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587051256;
 bh=uDzDRO2ytFQpd/vpRcyE5E3H4we81F4KkMdHp4892QQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=0jVthHTM4Q1PC0DLm4/7zyTFyXkXqQ9oURTeu65LFK32h6apzQp5OQe8r6spQYx7D
 exZpNA3pKIzfLh7hh8kejYoTzVqXPDKsYcg29n6M2YxH+7RRMC3sWtLlJAyWAISZo2
 htCo+NO3nQTw1x39+HMbBBGG53gyiwWUjlaVmdNU=
Date: Thu, 16 Apr 2020 16:34:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>, Michael Hennerich <Michael.Hennerich@analog.com>, Stefan Popa <stefan.popa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Nuno Sá <nuno.sa@analog.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Jiri Kosina <trivial@kernel.org>
In-Reply-To: <20200416103058.15269-1-geert+renesas@glider.be>
References: <20200416103058.15269-1-geert+renesas@glider.be>
Subject: Re: [PATCH trivial 0/6] Fix misspellings of "Analog Devices"
Message-Id: <158705078452.48712.14851203073650565435.b4-ty@kernel.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Apr 2020 12:30:52 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> In several files the company also known as ADI is spelled as "Analog
> Device".  However, according to https://www.analog.com/, the company
> name is spelled "Analog Devices".
> 
> Hence this patch series, one per subsystem, fixes these misspellings.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: Fix misspellings of "Analog Devices"
      (not applied)
[2/6] dma: Fix misspelling of "Analog Devices"
      (not applied)
[3/6] drm: Fix misspellings of "Analog Devices"
      (not applied)
[4/6] iio: Fix misspellings of "Analog Devices"
      (not applied)
[5/6] ALSA: Fix misspellings of "Analog Devices"
      (not applied)
[6/6] ASoC: Fix misspellings of "Analog Devices"
      commit: b938b25f49cdb47397b0215b69cdd5251b4b2f8b

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
