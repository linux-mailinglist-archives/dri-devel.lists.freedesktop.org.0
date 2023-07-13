Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4197532CE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A3510E7D8;
	Fri, 14 Jul 2023 07:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5448610E6FC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 15:43:08 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJyQC-00033b-T0; Thu, 13 Jul 2023 17:40:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJyPp-00E9Ib-Gt; Thu, 13 Jul 2023 17:39:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJyPo-004aZX-PQ; Thu, 13 Jul 2023 17:39:36 +0200
Date: Thu, 13 Jul 2023 17:39:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Paul <seanpaul@chromium.org>
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
Message-ID: <20230713153936.k2m6aj34vptj5vf7@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
 <20230713130337.fd2l67r23g2irifx@pengutronix.de>
 <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mnk65dkcvejfh2ja"
Content-Disposition: inline
In-Reply-To: <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 14 Jul 2023 07:14:54 +0000
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Jerome Brunet <jbrunet@baylibre.com>, Liu Shixin <liushixin2@huawei.com>,
 linux-samsung-soc@vger.kernel.org, Drew Davenport <ddavenport@chromium.org>,
 Samuel Holland <samuel@sholland.org>, Matt Roper <matthew.d.roper@intel.com>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 linux-sunxi@lists.linux.dev, Stylon Wang <stylon.wang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 amd-gfx@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, David Francis <David.Francis@amd.com>,
 Aaron Liu <aaron.liu@amd.com>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 linux-rockchip@lists.infradead.org, Fangzhi Zuo <jerry.zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>,
 Dave Airlie <airlied@redhat.com>, linux-mips@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Evan Quan <evan.quan@amd.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Sandy Huang <hjc@rock-chips.com>, Swati Sharma <swati2.sharma@intel.com>,
 linux-renesas-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, linux-hyperv@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Alan Liu <haoping.liu@amd.com>,
 Philip Yang <Philip.Yang@amd.com>, intel-gfx@lists.freedesktop.org,
 Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Roman Li <roman.li@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Paul Cercueil <paul@crapouillou.net>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Marek Vasut <marex@denx.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Mika Kahola <mika.kahola@intel.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 David Lechner <david@lechnology.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 =?utf-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, John Stultz <jstultz@google.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mnk65dkcvejfh2ja
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 10:41:45AM -0400, Sean Paul wrote:
> On Thu, Jul 13, 2023 at 9:04=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > But even with the one-patch-per-rename approach I'd consider the
> > renaming a net win, because ease of understanding code has a big value.
> > It's value is not so easy measurable as "conflicts when backporting",
> > but it also matters in say two years from now, while backporting
> > shouldn't be an issue then any more.
>=20
> You've rightly identified the conjecture in your statement. I've been
> on both sides of the argument, having written/maintained drm code
> upstream and cherry-picked changes to a downstream kernel. Perhaps
> it's because drm's definition of dev is ingrained in my muscle memory,
> or maybe it's because I don't do a lot of upstream development these
> days, but I just have a hard time seeing the benefit here.

I see that my change doesn't immediately benefit those who are already
at home in drivers/gpu/drm. So it's quite understandable that someone in
a senior role (long time contributor or maintainer) doesn't see a big
upside.

In contrast I think my change (with its indisputable cost) lowers the
bar for new contributors to drm. IMHO that's something a maintainer has
to have on their radar, too, and that's easily undervalued in my
experience.

Of course in the end it's about weighting the ups and downs.=20

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mnk65dkcvejfh2ja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSwGrcACgkQj4D7WH0S
/k5Z8gf+L2DppHWGxGaiKRiYvHQTrpom5T4lLxWIcMzNp/SZXGce+FkxNCXXp4ev
Fm4EE5lHyGkTfeMAeH8KSvtkAT3Lf/Bifz3Ij2fmsLRLCJdOxIA9Zra8u3cWmLdd
JX+wb8zFJARzb/u+kG6ZD4IgJ+39LqIZ9JLUqaV4jyZZps2Vf8cvPDNYp96vAwdB
GUECE+pPcMQvSkBdwy5pCGdEatjq9O12xWwv6uvNcJqbIbToJVVsUHLBjTGEJfGI
PgyrtoM72NQY/p5d9veqBKCQTkKUBW5Ly+HbKzey9Dy/IPWeSU1Q/1WH/hUphbbs
k0+Jh4Ot72m5BF8rwKgRu0NikQcP4A==
=OtIn
-----END PGP SIGNATURE-----

--mnk65dkcvejfh2ja--
