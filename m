Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C58E943CBFD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 16:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5C089F75;
	Wed, 27 Oct 2021 14:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A4089F75
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 14:21:33 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDBB760D42;
 Wed, 27 Oct 2021 14:21:32 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mfjo2-001vW7-MU; Wed, 27 Oct 2021 15:21:30 +0100
Date: Wed, 27 Oct 2021 15:21:28 +0100
Message-ID: <874k92blav.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, <joe@perches.com>,
 Rob Herring <robh+dt@kernel.org>, maxime coquelin
 <mcoquelin.stm32@gmail.com>,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 michael turquette <mturquette@baylibre.com>,
 stephen boyd <sboyd@kernel.org>, herbert xu <herbert@gondor.apana.org.au>,
 "david s . miller" <davem@davemloft.net>, david airlie <airlied@linux.ie>,
 daniel vetter <daniel@ffwll.ch>, thierry reding <thierry.reding@gmail.com>,
 sam ravnborg <sam@ravnborg.org>,
 yannick fertre <yannick.fertre@foss.st.com>, "philippe\
 cornu" <philippe.cornu@foss.st.com>, benjamin gaignard
 <benjamin.gaignard@linaro.org>, vinod koul <vkoul@kernel.org>,
 ohad ben-cohen <ohad@wizery.com>,
 bjorn andersson <bjorn.andersson@linaro.org>, baolin wang
 <baolin.wang7@gmail.com>, jonathan cameron <jic23@kernel.org>, "lars-peter\
 clausen" <lars@metafoo.de>, olivier moysan <olivier.moysan@foss.st.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>, Thomas Gleixner
 <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>,
 "Mauro Carvalho\ Chehab" <mchehab@kernel.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones
 <lee.jones@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "Richard\ Weinberger" <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Jakub\ Kicinski" <kuba@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Matt Mackall <mpm@selenic.com>, "Alessandro\
 Zummo" <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Viresh Kumar <viresh.kumar@linaro.org>, "Ahmad\
 Fatoum" <a.fatoum@pengutronix.de>, Jagan Teki <jagan@amarulasolutions.com>,
 dillon min <dillon.minfei@gmail.com>, Marek Vasut <marex@denx.de>,
 "Laurent\ Pinchart" <laurent.pinchart@ideasonboard.com>, Sebastian Reichel
 <sre@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>, Pierre-Yves MORDRET
 <pierre-yves.mordret@foss.st.com>,
 Ludovic Barre <ludovic.barre@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, pascal Paillet
 <p.paillet@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "Jose\ Abreu" <joabreu@synopsys.com>, Le Ray <erwan.leray@foss.st.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dmaengine@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
Subject: Re: dt-bindings: treewide: Update @st.com email address to
 @foss.st.com
In-Reply-To: <865a4055-5c2f-0793-bdce-9f04eac167d2@foss.st.com>
References: <20211020065000.21312-1-patrice.chotard@foss.st.com>
 <22fb6f19-21eb-dcb5-fa31-bb243d4a7eaf@canonical.com>
 <878ryoc4dc.wl-maz@kernel.org>
 <82492eb2-5a5e-39a2-a058-5e2ba75323e0@foss.st.com>
 <865a4055-5c2f-0793-bdce-9f04eac167d2@foss.st.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: patrice.chotard@foss.st.com,
 krzysztof.kozlowski@canonical.com, joe@perches.com, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, herbert@gondor.apana.org.au,
 davem@davemloft.net, airlied@linux.ie, daniel@ffwll.ch,
 thierry.reding@gmail.com, sam@ravnborg.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, benjamin.gaignard@linaro.org, vkoul@kernel.org,
 ohad@wizery.com, bjorn.andersson@linaro.org, baolin.wang7@gmail.com,
 jic23@kernel.org, lars@metafoo.de, olivier.moysan@foss.st.com,
 arnaud.pouliquen@foss.st.com, tglx@linutronix.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, hugues.fruchet@foss.st.com, fabrice.gasnier@foss.st.com,
 lee.jones@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, kuba@kernel.org, srinivas.kandagatla@linaro.org,
 kishon@ti.com, linus.walleij@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, mathieu.poirier@linaro.org, mpm@selenic.com, a.
 zummo@towertech.it, alexandre.belloni@bootlin.com, gregkh@linuxfoundation.org,
 rafael@kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org,
 rui.zhang@intel.com, wim@linux-watchdog.org, linux@roeck-us.net,
 geert+renesas@glider.be, viresh.kumar@linaro.org, a.fatoum@pengutronix.de,
 jagan@amarulasolutions.com, dillon.minfei@gmail.com, marex@denx.de,
 laurent.pinchart@ideasonboard.com, sre@kernel.org, dmitry.torokhov@gmail.com,
 paul@crapouillou.net, fabien.dessenne@foss.st.com,
 christophe.roullier@foss.st.com, gabriel.fernandez@foss.st.com,
 lionel.debieve@foss.st.com, amelie.delaunay@foss.st.com,
 pierre-yves.mordret@foss.st.com, ludovic.barre@foss.st.com,
 christophe.kerello@foss.st.com, p.paillet@foss.st.com, peppe.cavallaro@st.com,
 joabreu@synopsys.com, erwan.leray@foss.st.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, dri-devel@lists
 .freedesktop.org, dmaengine@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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

On Wed, 27 Oct 2021 14:56:35 +0100,
Patrice CHOTARD <patrice.chotard@foss.st.com> wrote:
>=20
> Hi Marc
>=20
> +Joe Perches
>=20
> On 10/27/21 8:11 AM, Patrice CHOTARD wrote:
> > Hi Marc
> >=20
> > On 10/20/21 1:39 PM, Marc Zyngier wrote:
> >> On Wed, 20 Oct 2021 08:45:02 +0100,
> >> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> >>>
> >>> On 20/10/2021 08:50, patrice.chotard@foss.st.com wrote:
> >>>> From: Patrice Chotard <patrice.chotard@foss.st.com>
> >>>>
> >>>> Not all @st.com email address are concerned, only people who have
> >>>> a specific @foss.st.com email will see their entry updated.
> >>>> For some people, who left the company, remove their email.
> >>>>
> >>>
> >>> Please split simple address change from maintainer updates (removal,
> >>> addition).
> >>>
> >>> Also would be nice to see here explained *why* are you doing this.
> >>
> >> And why this can't be done with a single update to .mailmap, like
> >> anyone else does.
> >=20
> > Thanks for the tips, yes, it will be simpler.
> >=20
> > Thanks
> > Patrice
> >=20
> >>
> >> 	M.
> >>
>=20
> I made a try by updating .mailmap with adding a new entry with my @foss.s=
t.com email :
>=20
>  Pali Roh=C3=A1r <pali@kernel.org> <pali.rohar@gmail.com>
>  Paolo 'Blaisorblade' Giarrusso <blaisorblade@yahoo.it>
> +Patrice Chotard <patrice.chotard@foss.st.com> <patrice.chotard@st.com>
>  Patrick Mochel <mochel@digitalimplant.org>
>  Paul Burton <paulburton@kernel.org> <paul.burton@imgtec.com>
>=20
> But when running ./scripts/get_maintainer.pl Documentation/devicetree/bin=
dings/arm/sti.yaml, by old email is still displayed
>=20
> Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED =
DEVICE TREE BINDINGS)
> Patrice Chotard <patrice.chotard@st.com> (in file)
> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE =
TREE BINDINGS)
> linux-kernel@vger.kernel.org (open list)
>=20
> By default, the get_maintainer.pl script is using .mailmap file
> ($email_use_mailmap =3D 1).
>=20
> It seems there is an issue with get_maintainer.pl and maintainer
> name/e-mail found in yaml file ?

Try this (warning though: my Perl-foo is non-existent).

	M.

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 2075db0c08b8..2a84a3fb0130 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -986,6 +986,7 @@ sub get_maintainers {
 	    my ($name, $address) =3D parse_email($email);
=20
 	    my $tmp_email =3D format_email($name, $address, $email_usename);
+	    $tmp_email =3D mailmap_email($tmp_email);
 	    push_email_address($tmp_email, '');
 	    add_role($tmp_email, 'in file');
 	}

--=20
Without deviation from the norm, progress is not possible.
