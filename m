Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3390C51C2C4
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 16:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF89110E26A;
	Thu,  5 May 2022 14:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3575110E26A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 14:39:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 73ACEB82D82;
 Thu,  5 May 2022 14:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCC8C385A4;
 Thu,  5 May 2022 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651761575;
 bh=g1QQljRmgGmXNfn7Y2eEY8r+LEwnNx4UeO2ISPOT2Do=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L0vPd9KPowSZpVQBjF8sXiij5yDMPUr5RFtZooPJOYwEr7f6V9sJ5RjdYt4+teXw4
 HX+3Lsvh/tUnu66swbaUJEf3iEzikdlXlrH/m21+aBGkI74L4jL0vHXMlDW2xju7TQ
 qSgqS/SB6NAeJ6q+4V1081PhxiZSp+u2jJAGBT16clcxiZwyFhsilN3AcPaFw3uQOl
 /U3Lqtt3KoGY9ElusVTjM9Ji1vjNy9BzO+uo7E5TbFnGSS0gc/3PaPsgM4L70/AnXp
 acSYOAdCd/x5HGwT2qAZRb1IU7d68EXwD6NGQwfP8HuCcvQadOu/ksUTWE8VfWWXKG
 AY97ayhF9stoQ==
Date: Thu, 5 May 2022 15:39:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 18/48] ARM: pxa: hx4700: use gpio descriptors for audio
Message-ID: <YnPhna5h1+kQGFLa@sirena.org.uk>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
 <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
 <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com>
 <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
 <CACRpkdaNRX0RDYJd_uaGo5jtiXu_qGHmEDGniaCmR=TZvcHH8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cOFcvF3tCFvqoEy/"
Content-Disposition: inline
In-Reply-To: <CACRpkdaNRX0RDYJd_uaGo5jtiXu_qGHmEDGniaCmR=TZvcHH8A@mail.gmail.com>
X-Cookie: Real programs don't eat cache.
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Tomas Cech <sleep_walker@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cOFcvF3tCFvqoEy/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 05, 2022 at 04:33:06PM +0200, Linus Walleij wrote:
> On Thu, May 5, 2022 at 8:04 AM Arnd Bergmann <arnd@kernel.org> wrote:

> > /* Headphones jack detection DAPM pin */
> > static struct snd_soc_jack_pin hs_jack_pin[] = {
> >         {
> >                 .pin    = "Headphone Jack",
> >                 .mask   = SND_JACK_HEADPHONE,
> >         },
> >         {
> >                 .pin    = "Speaker",
> >                 /* disable speaker when hp jack is inserted */
> >                 .mask   = SND_JACK_HEADPHONE,
> >                 .invert = 1,
> >         },

> Hm some ASoC thingie. No idea what that is, but I suppose another
> place where a subsystem for legacy reasons try to do the gpiolib
> inversion on it's own accord. That one isn't flagged as active low in the
> descriptor so it's fine I guess.

It's saying that when the headphone is inserted the headphone output
should be enabled and the speaker output should be disabled, and vice
versa.

> Possible this should be fixed in ASoC to rely on gpiolib but we can't
> fix the entire world.

I don't think so.

--cOFcvF3tCFvqoEy/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJz4ZwACgkQJNaLcl1U
h9DWzgf+L3LZ6AC+cLFicMlKK60/cMgGMGUBo/mfgAk+G01MppBCzVUBD0sq8yoB
9txZAIQeRSHcBJAs2/cp0Tpn6boCF1wwEkW/cP1ENkWFbTpUHpJPKzOmHOfhghTa
W6pokDB6BExE10l8bgrjirSCGKpy9eLTzWkqpq1cb3h9AnaGWqnCakvf0Y33LB8E
xodrQYiRtjGx7sN+iSb0DKzd1aX8MYFAdWN6MIJ/aengJTm1bHbRANMavfvPerE/
REKky9u/NLWP2TXqYfbQaQNkefLK91ezapwt6UYh1K9FxtBd8UNRkkYnbauU+0qP
XzqnZicyIPtB3pQ7IofAi3yQRgjPew==
=dH+z
-----END PGP SIGNATURE-----

--cOFcvF3tCFvqoEy/--
