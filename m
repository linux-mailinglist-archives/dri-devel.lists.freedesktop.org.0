Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6439F51C349
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 17:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE0310E5A1;
	Thu,  5 May 2022 15:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4FD10E5A1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 15:04:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0AE19B82DB0;
 Thu,  5 May 2022 15:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F33FC385A8;
 Thu,  5 May 2022 15:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651763061;
 bh=ndNt7BUf9dTGF9Boc0sHL0QvCjcViApZ2+jdoiRYFyE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qsTwJOAmbU9NAcodvY8Up4PoNuEDRZy5qxSFcdI0VmbgNmn3/5x71X8ojXxDFeNvv
 wY4qvOjbwdrz7Yr75u2sbhbjskoI/sZWGz4PEQP/S+I8xtRFCkH1Moav6HaNLEeEMO
 WD9CFgJXtdTh9DLKCtyGpxZcPAVjEnkCl68AjKWpRBt4xYlkTr26FWjmXq6vdFHjfo
 1JagmTiGO1QdyMD0R232U+yffpnEC/3hGsGQpybLdnELbR+ZACe8+oOYvvWsaDz2qx
 oHX9cN4PzhibRt823eQYXukpGaPOEOOiwDBSuJUdGm0u9JKoMHgHhPlLEhO0XHJKCM
 raFIKJWwjP1BA==
Date: Thu, 5 May 2022 16:04:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 18/48] ARM: pxa: hx4700: use gpio descriptors for audio
Message-ID: <YnPna0pW9csiFkHK@sirena.org.uk>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
 <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
 <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com>
 <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
 <CACRpkdaNRX0RDYJd_uaGo5jtiXu_qGHmEDGniaCmR=TZvcHH8A@mail.gmail.com>
 <YnPhna5h1+kQGFLa@sirena.org.uk>
 <CAK8P3a2cYUYMKSMo3VOLVTO0=LWc0sHf72Eph8t_es9axo_eeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZLP2bC8awi6xddl+"
Content-Disposition: inline
In-Reply-To: <CAK8P3a2cYUYMKSMo3VOLVTO0=LWc0sHf72Eph8t_es9axo_eeA@mail.gmail.com>
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
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Tomas Cech <sleep_walker@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Michael Turquette <mturquette@baylibre.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ZLP2bC8awi6xddl+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 05, 2022 at 04:59:35PM +0200, Arnd Bergmann wrote:
> On Thu, May 5, 2022 at 4:39 PM Mark Brown <broonie@kernel.org> wrote:
> > On Thu, May 05, 2022 at 04:33:06PM +0200, Linus Walleij wrote:
> > > On Thu, May 5, 2022 at 8:04 AM Arnd Bergmann <arnd@kernel.org> wrote:

> > > > static struct snd_soc_jack_pin hs_jack_pin[] = {
> > > >         {
> > > >                 .pin    = "Headphone Jack",
> > > >                 .mask   = SND_JACK_HEADPHONE,
> > > >         },
> > > >         {
> > > >                 .pin    = "Speaker",
> > > >                 /* disable speaker when hp jack is inserted */
> > > >                 .mask   = SND_JACK_HEADPHONE,
> > > >                 .invert = 1,
> > > >         },

> > > Hm some ASoC thingie. No idea what that is, but I suppose another
> > > place where a subsystem for legacy reasons try to do the gpiolib
> > > inversion on it's own accord. That one isn't flagged as active low in the
> > > descriptor so it's fine I guess.

> > It's saying that when the headphone is inserted the headphone output
> > should be enabled and the speaker output should be disabled, and vice
> > versa.

> Ok, that sounds like I should remove the flag here if I declare the
> GPIO line as GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH, right?

If you change the sense of the GPIO you'll need to flip the invert to
the headphone instead of the speaker - whichever way round the GPIO
sense is each of the pins should be taking the opposite sense from the
GPIO state to the other.

--ZLP2bC8awi6xddl+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJz52oACgkQJNaLcl1U
h9CbVgf+IcoNpQ7Zg0fdYkNEqwa7HwKX/Qt0QGkD2AOfzxG/HwCNSJGjXbLRoDSG
LZDrxzKVzeoyjgCVaof252MDqttrmcheVCIAEBBJloJwRZ09bHBdKRPPZhbkgcTz
jtkkGnEzXjRjYMDG6uc2pcooFw43TvoeGlypGRIHfw7iuVsLV9p49OqDnjO4jGer
JBdqJjiSsBVptiZvzaVRbk7kjilcUyKIlQWL83na306uUWq3kMe8gOEw2S5VTvqd
iQ7h7SpGvhyYN6hKCklertmWbnGLlgzT0PXgO8R3thr5L4UiST7AH2vQijgqPoJx
UGG0jN4gSGc0pHUx7zh4kY6kWXN/Sg==
=5RUB
-----END PGP SIGNATURE-----

--ZLP2bC8awi6xddl+--
