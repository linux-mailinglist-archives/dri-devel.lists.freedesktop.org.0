Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5E0704650
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26F910E308;
	Tue, 16 May 2023 07:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA6D10E178
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 09:23:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pyUNq-0004G7-84; Mon, 15 May 2023 11:20:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pyUNQ-000KQl-8J; Mon, 15 May 2023 11:20:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pyUNP-004cYH-B9; Mon, 15 May 2023 11:20:19 +0200
Date: Mon, 15 May 2023 11:20:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback returning
 void
Message-ID: <20230515092019.a3uwmofkkujo772g@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <CAAQKjZP5jhwFg9sNndpa6_7G6HoV76heQbt=knoOEZZskexrhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="suzv37z45wvm64m4"
Content-Disposition: inline
In-Reply-To: <CAAQKjZP5jhwFg9sNndpa6_7G6HoV76heQbt=knoOEZZskexrhg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Tue, 16 May 2023 07:27:39 +0000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Rahul T R <r-ravikumar@ti.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Miaoqian Lin <linmq006@gmail.com>, linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Yuan Can <yuancan@huawei.com>, Michal Simek <michal.simek@xilinx.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, Joel Stanley <joel@jms.id.au>,
 nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Guo Zhengkui <guozhengkui@vivo.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomba@kernel.org>,
 Deepak R Varma <drv@mailo.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, John Stultz <jstultz@google.com>,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sandy Huang <hjc@rock-chips.com>, Liu Shixin <liushixin2@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org,
 Jayshri Pawar <jpawar@cadence.com>, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <linux@armlinux.org.uk>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Liu Ying <victor.liu@nxp.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--suzv37z45wvm64m4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 04:50:57PM +0900, Inki Dae wrote:
> Hi,
>=20
> 2023=EB=85=84 5=EC=9B=94 8=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 1:32, =
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>=EB=8B=98=EC=9D=B4 =
=EC=9E=91=EC=84=B1:
> >
> > Hello,
> >
> > this patch series adapts the platform drivers below drivers/gpu/drm
> > to use the .remove_new() callback. Compared to the traditional .remove()
> > callback .remove_new() returns no value. This is a good thing because
>=20
> First of all, I apologize for the delay in providing my review comments.
>=20
> Not related to this patch but seems that the "remove_new" callback
> naming implicitly implies that there is no need to return anything
> since its return type is void. To help users understand the intended
> behavior based on the callback name, how about considering a modified
> naming convention like "remove_no_return" or something similar?
>=20
> The relevant patch has already been merged as outlined below,
> author Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> 2022-12-09
> 16:09:14 +0100
> committer Greg Kroah-Hartman <gregkh@linuxfoundation.org> 2023-01-17
> 19:04:17 +0100
> commit 5c5a7680e67ba6fbbb5f4d79fa41485450c1985c (patch)
> tree 0b6dbc003a6bb4a3f7fb084d31326bbfa3ba3f7c
> parent 7bbb89b420d9e290cb34864832de8fcdf2c140dc (diff)
> download linux-5c5a7680e67ba6fbbb5f4d79fa41485450c1985c.tar.gz
> platform: Provide a remove callback that returns no value
>=20
> Maybe a trivial thing but how about renaming it? I think the postfix,
> 'new', is a very generic word. I think you could introduce another
> patch for it if you think it's reasonable.

=2Eremove_new is only a temporary name. Once all drivers are converted,
=2Eremove is changed to return void and then all drivers are converted
back. While "remove_new" might not be a brilliant name choice, touching
all already converted drivers again just to improve the temporary
measures doesn't sound right.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--suzv37z45wvm64m4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRh+VIACgkQj4D7WH0S
/k7epggAlsMX1TbSjMAIV+LPNrZU/ErXl1QWJt2/nA/iQmxppFkkR19U334HeeZf
VXsu0FwIvUZpfndnO3hCw3pvEa4gQiTo7reQsd28ECZaLwTVQYvp6o/LceTtaOJ2
5+FeefPV0mHxQ6SiXZ7g7aA4gkkw2iJY9s7LaPHHXw0jpyOpcZHlNzJioLe4RHdT
eFYzR99DVhYH81tw8szT4fpAS3Vw2Eqq5PyQHDRT12PrJdM0Ig+3ei53DU4adRWh
w/kH6vGx2XBIbqNrXq5AcSjVnMvrKq7iKPRxMCz58JC4oCirfqT+7tGWbOgJLLEx
BCbOuZXZE9d8Thjrbo3cXVRujnhsLg==
=GMrP
-----END PGP SIGNATURE-----

--suzv37z45wvm64m4--
