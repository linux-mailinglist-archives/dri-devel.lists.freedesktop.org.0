Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F625090F1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 22:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F63810E829;
	Wed, 20 Apr 2022 20:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4633310E829
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 20:00:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 900D961770
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 20:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B7FC385A8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 20:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650484831;
 bh=6LaU3F/jCQfZw6zxuK9X0ySvN6qUfHqEJ6lGydnop44=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tTTSInI8F99rxgu1B0qJWLeIul55SHmcfk2XoOQ90GefTf3tYCCewlSGv0XDMfDh7
 Z0gfO8BUWwpRe7vFNr0stA2fvpU+veeqGj8X4dtAAMP+71o6mJUg/sPSqUxlu+ULuo
 oT0S6xjq4cbwogY8eYCb+x8No/lm+/RcuSLbCGjk19uugO+JINpbLTFeEWyaEopW/x
 lweTuMOOUBVuFVg4/k2kXIP8mpZn+WouT6CWBwWGzqmjZqAjIfMK2WcT4xN9+P5OGu
 53fTbKDiRNLPpY+ZJg9cT17Ibl1y8hQ/1xJAqK44EW7UAoTFJbIP4klfgcYI29A7th
 eAbyB39usRP9w==
Received: by mail-wr1-f51.google.com with SMTP id c10so3746768wrb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:00:30 -0700 (PDT)
X-Gm-Message-State: AOAM5320L5xk+WI39i7njUgXybvK0r/3QDle5jYNZWUrj7IhSdsKl5hH
 sFsfAFqbYo0MSKmIqTPYo6/tBU9XYDsx3XdWBBA=
X-Google-Smtp-Source: ABdhPJwLyvz/ceR9rvvT4XHyqR02gbMMBhrAsRpzGtmhlle4bD/ec4+YXpGg4bc2rqdxlPo8PGopdbH+2zzsbpztAUk=
X-Received: by 2002:a5d:6da5:0:b0:20a:8805:6988 with SMTP id
 u5-20020a5d6da5000000b0020a88056988mr15481338wrs.317.1650484829308; Wed, 20
 Apr 2022 13:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220420170836.GB1947@darkstar.musicnaut.iki.fi>
In-Reply-To: <20220420170836.GB1947@darkstar.musicnaut.iki.fi>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 20 Apr 2022 22:00:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1+sOrn8BWPVc7f+QFZ5=7fE6=MLsMYV9t+HJcG2aRCXA@mail.gmail.com>
Message-ID: <CAK8P3a1+sOrn8BWPVc7f+QFZ5=7fE6=MLsMYV9t+HJcG2aRCXA@mail.gmail.com>
Subject: Re: [PATCH 00/41] OMAP1 full multiplatform conversion
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 7:08 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> On Tue, Apr 19, 2022 at 03:36:42PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > This is the full series for converting OMAP1 to multiplatform, rebased
> > from my 2019 attempt to do the same thing. The soc tree contains simpler
> > patches to do the same for iop32x, ixp4xx, ep93xx and s3c24xx, which
> > means we are getting closer to completing this for all ARMv5 platforms
> > (I have patches for PXA, which is the last one remaining).
> >
> > Janusz already tested the branch separately and did the missing work
> > for the common-clk conversion after my previous approach was broken.
>
> I tested the full series on the following OMAP1 boards: ams-delta,
> nokia770, osk, palmte and sx1 (QEMU only).
>
> Apart from the earlyprintk breakage, everything seemed to work OK.

Nice, thanks a lot for testing!

> A minor note, zImage grows about 50 KB with a minimal kernel config. This
> is not yet critical, there's still about 7% headroom on 770 to the 2 MB
> bootloader limit on my setup. Also the decompression time is approaching
> the hardcoded watchdog timeout...

I suspect that most of this is for the added devicetree code, and some
more for the common-clk layer. For the omap1_defconfig, there is some
hope to get part of the overhead back eventually by replacing board files
with dts descriptions that are not part of the zImage itself, but it's unlikely
to ever get smaller than it was.

       Arnd
