Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1838B50A30F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 16:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1907210E21E;
	Thu, 21 Apr 2022 14:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F5E10E21E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 14:46:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 652C1B82570
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 14:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122C4C385AC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650552395;
 bh=i0HMWq1JRa0F0CeO2hnG9SF3TuKwCFJPlYUxv+11vSY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KYNnxH1/6h4JHSpiitspdSKkTEwWa1tJBCwmto9ZMzu31V+JKmKgI743LDv+s34bq
 QmSRKC+hHoCyn8rQMCoQYbCY9I4u1HRgIOm+Pz2OmA5gNIE7rXJyrAZQqUv9oA3TUQ
 CVuRa/VFqB7epVLHtpWWZFuEw4IysfFmBo/cCYj+4wtcdzx74jW2LjnvsN+imBPGkx
 NUHT9J1SbF8LbbqYNTV0fbd7NyddYgpQP9JQyBAmIQiZB0mHJDNoZgZMT3gNF6FO91
 4nSd3Odf/kHuZoRH+pZi1kgbPYDKmWC6TMUEyESfHfKmh/QjbWYzrE2aZ/dN2sYGsU
 NUgA5p8ikcvFQ==
Received: by mail-wr1-f51.google.com with SMTP id x18so7062527wrc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 07:46:34 -0700 (PDT)
X-Gm-Message-State: AOAM532wZDqQT/KW+cwuso7xodH9ypZ+S5UDQ+hrk7xtIUEqkhCKn763
 Xc+7d61IjPC3AUUZcnppRpA3+PQihexIKek9OME=
X-Google-Smtp-Source: ABdhPJwYkraliZNB9aswBiexBZv/yC4YtGe2R9rvi1KW9m/P8YE/IbH0HzS9xhCUm+8mp8SN41/aSdFZNG1cTJqd71I=
X-Received: by 2002:a5d:6da5:0:b0:20a:8805:6988 with SMTP id
 u5-20020a5d6da5000000b0020a88056988mr48774wrs.317.1650552393282; Thu, 21 Apr
 2022 07:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220420170836.GB1947@darkstar.musicnaut.iki.fi>
 <CAK8P3a1+sOrn8BWPVc7f+QFZ5=7fE6=MLsMYV9t+HJcG2aRCXA@mail.gmail.com>
 <20220421133431.GE1947@darkstar.musicnaut.iki.fi>
In-Reply-To: <20220421133431.GE1947@darkstar.musicnaut.iki.fi>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 21 Apr 2022 16:46:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0LkJ5EvJ13xtAhWzCKnnvYhYgKpPsphr1T-FGg6bzDuw@mail.gmail.com>
Message-ID: <CAK8P3a0LkJ5EvJ13xtAhWzCKnnvYhYgKpPsphr1T-FGg6bzDuw@mail.gmail.com>
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

On Thu, Apr 21, 2022 at 3:34 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
>
> Hi,
>
> On Wed, Apr 20, 2022 at 10:00:13PM +0200, Arnd Bergmann wrote:
> > On Wed, Apr 20, 2022 at 7:08 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> > > On Tue, Apr 19, 2022 at 03:36:42PM +0200, Arnd Bergmann wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > This is the full series for converting OMAP1 to multiplatform, rebased
> > > > from my 2019 attempt to do the same thing. The soc tree contains simpler
> > > > patches to do the same for iop32x, ixp4xx, ep93xx and s3c24xx, which
> > > > means we are getting closer to completing this for all ARMv5 platforms
> > > > (I have patches for PXA, which is the last one remaining).
> > > >
> > > > Janusz already tested the branch separately and did the missing work
> > > > for the common-clk conversion after my previous approach was broken.
> > >
> > > I tested the full series on the following OMAP1 boards: ams-delta,
> > > nokia770, osk, palmte and sx1 (QEMU only).
> > >
> > > Apart from the earlyprintk breakage, everything seemed to work OK.
> >
> > Nice, thanks a lot for testing!
>
> With the updated patch 26 also earlyprintk now works, so if you still
> update the patches, feel free to add for the whole series:
>
> Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

I was just doing the merge, so I added the tag to the commit now.

There is now an "omap1/multiplatform-prep" branch that is part of
arm/multiplatform, and I hope to not have to rebase that. I also
have an arm/multiplatform-late branch with the remaining contents.

       Arnd
