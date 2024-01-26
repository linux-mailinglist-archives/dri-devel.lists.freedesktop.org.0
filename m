Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF6E83DFFB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 18:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B273610FC89;
	Fri, 26 Jan 2024 17:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E130710FB9A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 17:12:03 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rTPjB-0003h4-L9; Fri, 26 Jan 2024 18:10:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rTPiw-002YFi-JY; Fri, 26 Jan 2024 18:10:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rTPiw-008oFN-1F;
 Fri, 26 Jan 2024 18:10:38 +0100
Date: Fri, 26 Jan 2024 18:10:38 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alex Elder <elder@ieee.org>
Subject: Re: [PATCH v5 040/111] pwm: Provide devm_pwmchip_alloc() function
Message-ID: <zjt3r6z5ilpffh26qidwp3axpnvfkwcrwanrtjjm2kscpdovuz@ppcrdlhmqiqq>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <f59b1a4a8d6fba65e4d3e8698310c9cb1d4c43ce.1706182805.git.u.kleine-koenig@pengutronix.de>
 <db05fb6a-2ea5-4e00-ac03-adc1897d96de@ieee.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b26sjadvk3fz44v6"
Content-Disposition: inline
In-Reply-To: <db05fb6a-2ea5-4e00-ac03-adc1897d96de@ieee.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 26 Jan 2024 17:26:23 +0000
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
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Kevin Hilman <khilman@baylibre.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@pengutronix.de,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-doc@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 James Clark <james.clark@arm.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andi Shyti <andi.shyti@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-rpi-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, greybus-dev@lists.linaro.org,
 Hector Martin <marcan@marcan.st>, Douglas Anderson <dianders@chromium.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Alexander Shiyan <shc_work@mail.ru>,
 Jonathan Corbet <corbet@lwn.net>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Weiss <luca@z3ntu.xyz>,
 Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 linux-pwm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Ray Jui <rjui@broadcom.com>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Orson Zhai <orsonzhai@gmail.com>, Benson Leung <bleung@chromium.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, asahi@lists.linux.dev,
 Shawn Guo <shawnguo@kernel.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-riscv@lists.infradead.org,
 David Airlie <airlied@gmail.com>, linux-leds@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sven Peter <sven@svenpeter.dev>,
 Johan Hovold <johan@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Lu Hongfei <luhongfei@vivo.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--b26sjadvk3fz44v6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alex,

On Fri, Jan 26, 2024 at 08:56:33AM -0600, Alex Elder wrote:
> On 1/25/24 6:09 AM, Uwe Kleine-K=F6nig wrote:
> > This function allocates a struct pwm_chip and driver data. Compared to
> > the status quo the split into pwm_chip and driver data is new, otherwise
> > it doesn't change anything relevant (yet).
> >=20
> > The intention is that after all drivers are switched to use this
> > allocation function, its possible to add a struct device to struct
> > pwm_chip to properly track the latter's lifetime without touching all
> > drivers again. Proper lifetime tracking is a necessary precondition to
> > introduce character device support for PWMs (that implements atomic
> > setting and doesn't suffer from the sysfs overhead of the /sys/class/pwm
> > userspace support).
> >=20
> > The new function pwmchip_priv() (obviously?) only works for chips
> > allocated with devm_pwmchip_alloc().
>=20
> I think this looks good.  Two questions:
> - Should you explicitly align the private data?  Or do you believe
>   the default alignment (currently pointer size aligned) is adequate?

I'm not aware of a requirement for a higher order alignment (but I might
well miss something). I did my tests on arm, nothing exploded there.
Maybe the conservative approach of asserting the same alignment as
kmalloc would be a good idea. I'll think and research about that.

iio uses ARCH_DMA_MINALIGN, net uses 32 (NETDEV_ALIGN).

> - Is there a non-devres version of the allocation function?

Patch #109 introduces a non-devres variant. As it's not used it's a
static function though. Can easily be changed is a use case pops up.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--b26sjadvk3fz44v6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWz540ACgkQj4D7WH0S
/k4oQwf+Nnq9bGZWZrbCQsHJYB54zfZt1whu2kQgdRMIQzT8HP7NadKhFCqs3Ob6
5xwIwbIpdczrpzHM25+5ZrTBiH5oSQ/Si0YMzglndL8Tm59GEJxcKoorYpDNplJR
xHL2owB7VgG87fFIvSCe163biS2vI/gIjAGvL9bpzcSH62Eq7EO3APk7Hx+h7d9e
QHLzzUmpN9JlrzYOhKE7Pu7/iVFPNqNb7FQtAOnamXe0kRLs05649mgdJ9q30gS8
imf9reDedsSG7sHM5NjtZpBQpF9H3vulzuGbH2MH2jNDLjtcpvUXUZpfijLN69iQ
GqSwNOqcwcXljLsP1A1wM8snNwzi/A==
=cXfD
-----END PGP SIGNATURE-----

--b26sjadvk3fz44v6--
