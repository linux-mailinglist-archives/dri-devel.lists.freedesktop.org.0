Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA28750C18
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4455288A3E;
	Wed, 12 Jul 2023 15:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCEB10E4CD;
 Wed, 12 Jul 2023 10:21:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id DCF28D083E;
 Wed, 12 Jul 2023 10:14:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A814DFF813;
 Wed, 12 Jul 2023 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689156863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pUZeSfojSh8tyQKh/pCOiQO/bJAvUa3k92qKX0dswKM=;
 b=hdRvXwWhgslDICiCkZwZGbTfJKrpN1Anr48dpccrbV0vvt/TF1dEOrGo3SIhj0snd8e3kY
 SrnIYyH49q2K5lQliRUQOpmQ10mxhIc5ivNuAnsUWBZQzqqXMrVjZ8gNBWVgkiYBLwYe9e
 UxXPiD0+6i5/bzsvWCZ9UvPlHqvqryHi0UdAMHhHoe0qTkixfzoYvl5aqHYWfpTI211Xuy
 aIgQBAcuoODejw5o2Z0fqZqIS0RzaKDcpWC15Bz+qrNSkoLKb3cjtnwZaBcDMH108gSwR2
 0qBheI52LJU215IQjQt4e4UxQ7sTp4VA1J0YxEXMmm0nY+tY0d2ZBoBosk6F2g==
Date: Wed, 12 Jul 2023 12:13:38 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
Message-ID: <ZK580kHQrDp_JNCH@aptenodytes>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DbTmTNcmEZJ3sxG3"
Content-Disposition: inline
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-Mailman-Approved-At: Wed, 12 Jul 2023 15:14:33 +0000
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
 Marian Cichy <m.cichy@pengutronix.de>, Xinliang Liu <xinliang.liu@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Liu Shixin <liushixin2@huawei.com>, linux-samsung-soc@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
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
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>,
 David Lechner <david@lechnology.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 David Francis <David.Francis@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-rockchip@lists.infradead.org,
 Fangzhi Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>,
 Dave Airlie <airlied@redhat.com>, linux-mips@vger.kernel.org,
 Graham Sider <Graham.Sider@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 linux-amlogic@lists.infradead.org, Evan Quan <evan.quan@amd.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Sandy Huang <hjc@rock-chips.com>,
 Swati Sharma <swati2.sharma@intel.com>, John Stultz <jstultz@google.com>,
 linux-renesas-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Drew Davenport <ddavenport@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, linux-hyperv@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, xurui <xurui@kylinos.cn>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Alan Liu <haoping.liu@amd.com>,
 Philip Yang <Philip.Yang@amd.com>, intel-gfx@lists.freedesktop.org,
 Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Roman Li <roman.li@amd.com>,
 Paul Cercueil <paul@crapouillou.net>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Marek Vasut <marex@denx.de>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Russell King <linux@armlinux.org.uk>, Leo Li <sunpeng.li@amd.com>,
 Uma Shankar <uma.shankar@intel.com>, Mika Kahola <mika.kahola@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 linux-tegra@vger.kernel.org,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 =?utf-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Orson Zhai <orsonzhai@gmail.com>, amd-gfx@lists.freedesktop.org,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--DbTmTNcmEZJ3sxG3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Wed 12 Jul 23, 11:46, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> while I debugged an issue in the imx-lcdc driver I was constantly
> irritated about struct drm_device pointer variables being named "dev"
> because with that name I usually expect a struct device pointer.

Well personally I usually expect that the "dev" member of a subsystem-speci=
fic
struct refers to a device of that subsystem, so for me having "dev" refer to
a drm_device for e.g. drm_crtc makes good sense.

I would only expect dev to refer to a struct device in the subsystem-specif=
ic
device structure (drm_device). I don't think it makes much sense to carry
the struct device in any other subsystem-specific structure anyway.

So IMO things are fine as-is but this is not a very strong opinion either.

> I think there is a big benefit when these are all renamed to "drm_dev".
> I have no strong preference here though, so "drmdev" or "drm" are fine
> for me, too. Let the bikesheding begin!

I would definitely prefer "drm_dev" over "drmdev" (hard to read, feels like
aborted camelcase, pretty ugly) or "drm" (too vague).

Cheers,

Paul

> Some statistics:
>=20
> $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort | uniq=
 -c | sort -n
>       1 struct drm_device *adev_to_drm
>       1 struct drm_device *drm_
>       1 struct drm_device          *drm_dev
>       1 struct drm_device        *drm_dev
>       1 struct drm_device *pdev
>       1 struct drm_device *rdev
>       1 struct drm_device *vdev
>       2 struct drm_device *dcss_drv_dev_to_drm
>       2 struct drm_device **ddev
>       2 struct drm_device *drm_dev_alloc
>       2 struct drm_device *mock
>       2 struct drm_device *p_ddev
>       5 struct drm_device *device
>       9 struct drm_device * dev
>      25 struct drm_device *d
>      95 struct drm_device *
>     216 struct drm_device *ddev
>     234 struct drm_device *drm_dev
>     611 struct drm_device *drm
>    4190 struct drm_device *dev
>=20
> This series starts with renaming struct drm_crtc::dev to drm_dev. If
> it's not only me and others like the result of this effort it should be
> followed up by adapting the other structs and the individual usages in
> the different drivers.
>=20
> To make this series a bit easier handleable, I first added an alias for
> drm_crtc::dev, then converted the drivers one after another and the last
> patch drops the "dev" name. This has the advantage of being easier to
> review, and if I should have missed an instance only the last patch must
> be dropped/reverted. Also this series might conflict with other patches,
> in this case the remaining patches can still go in (apart from the last
> one of course). Maybe it also makes sense to delay applying the last
> patch by one development cycle?
>=20
> The series was compile tested for arm, arm64, powerpc and amd64 using an
> allmodconfig (though I only build drivers/gpu/).
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=C3=B6nig (52):
>   drm/crtc: Start renaming struct drm_crtc::dev to drm_dev
>   drm/core: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/amd: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/armada: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/arm: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/aspeed: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/ast: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/atmel-hlcdc: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/exynos: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/fsl-dcu: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/gma500: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/gud: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/hisilicon: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/hyperv: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/i915: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/imx: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/ingenic: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/kmb: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/logicvc: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/mcde: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/mediatek: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/meson: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/mgag200: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/msm: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/mxsfb: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/nouveau: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/omapdrm: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/panel-ili9341: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/pl111: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/qxl: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/radeon: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/renesas: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/rockchip: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/solomon: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/sprd: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/sti: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/stm: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/sun4i: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/tegra: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/tidss: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/tilcdc: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/tiny: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/tve200: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/udl: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/vboxvideo: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/vc4: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/virtio: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/vkms: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/vmwgfx: Use struct drm_crtc::drm_dev instead of struct
>     drm_crtc::dev
>   drm/xen: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/xlnx: Use struct drm_crtc::drm_dev instead of struct drm_crtc::dev
>   drm/crtc: Complete renaming struct drm_crtc::dev to drm_dev
>=20
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  18 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c       |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |   8 +-
>  drivers/gpu/drm/amd/amdgpu/atombios_crtc.c    |  22 +--
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  26 +--
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  28 ++--
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  26 +--
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  26 +--
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  29 ++--
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  20 +--
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   8 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  22 +--
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   2 +-
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  24 +--
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   |   2 +-
>  drivers/gpu/drm/arm/hdlcd_crtc.c              |   4 +-
>  drivers/gpu/drm/arm/malidp_crtc.c             |   7 +-
>  drivers/gpu/drm/armada/armada_crtc.c          |  10 +-
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |   6 +-
>  drivers/gpu/drm/ast/ast_dp.c                  |   2 +-
>  drivers/gpu/drm/ast/ast_mode.c                |  26 +--
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  10 +-
>  drivers/gpu/drm/drm_atomic.c                  |  22 +--
>  drivers/gpu/drm/drm_atomic_helper.c           |  20 ++-
>  drivers/gpu/drm/drm_atomic_state_helper.c     |   2 +-
>  drivers/gpu/drm/drm_atomic_uapi.c             |  22 +--
>  drivers/gpu/drm/drm_blend.c                   |   2 +-
>  drivers/gpu/drm/drm_color_mgmt.c              |  10 +-
>  drivers/gpu/drm/drm_crtc.c                    |  19 ++-
>  drivers/gpu/drm/drm_crtc_helper.c             |  10 +-
>  drivers/gpu/drm/drm_debugfs.c                 |   2 +-
>  drivers/gpu/drm/drm_debugfs_crc.c             |   2 +-
>  drivers/gpu/drm/drm_fb_helper.c               |   6 +-
>  drivers/gpu/drm/drm_mipi_dbi.c                |   4 +-
>  drivers/gpu/drm/drm_plane.c                   |   2 +-
>  drivers/gpu/drm/drm_plane_helper.c            |   2 +-
>  drivers/gpu/drm/drm_self_refresh_helper.c     |   2 +-
>  drivers/gpu/drm/drm_vblank.c                  |  40 ++---
>  drivers/gpu/drm/drm_vblank_work.c             |   2 +-
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c      |   8 +-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c     |   4 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c    |  16 +-
>  drivers/gpu/drm/gma500/cdv_intel_display.c    |   2 +-
>  drivers/gpu/drm/gma500/cdv_intel_dp.c         |   2 +-
>  drivers/gpu/drm/gma500/gma_display.c          |  20 +--
>  drivers/gpu/drm/gma500/oaktrail_crtc.c        |   8 +-
>  drivers/gpu/drm/gma500/oaktrail_hdmi.c        |   4 +-
>  drivers/gpu/drm/gma500/psb_intel_display.c    |   2 +-
>  drivers/gpu/drm/gma500/psb_irq.c              |   6 +-
>  drivers/gpu/drm/gud/gud_pipe.c                |   6 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  20 +--
>  .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |   4 +-
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   6 +-
>  drivers/gpu/drm/i915/display/g4x_dp.c         |   4 +-
>  drivers/gpu/drm/i915/display/hsw_ips.c        |  16 +-
>  drivers/gpu/drm/i915/display/i9xx_plane.c     |   4 +-
>  drivers/gpu/drm/i915/display/i9xx_wm.c        |  40 ++---
>  drivers/gpu/drm/i915/display/icl_dsi.c        |   2 +-
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +-
>  .../gpu/drm/i915/display/intel_atomic_plane.c |   4 +-
>  drivers/gpu/drm/i915/display/intel_audio.c    |   2 +-
>  drivers/gpu/drm/i915/display/intel_bw.c       |  10 +-
>  drivers/gpu/drm/i915/display/intel_cdclk.c    |   6 +-
>  drivers/gpu/drm/i915/display/intel_color.c    | 124 +++++++-------
>  drivers/gpu/drm/i915/display/intel_crtc.c     |  20 +--
>  .../drm/i915/display/intel_crtc_state_dump.c  |   4 +-
>  drivers/gpu/drm/i915/display/intel_cursor.c   |   2 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c      |  28 ++--
>  drivers/gpu/drm/i915/display/intel_display.c  | 154 +++++++++---------
>  .../gpu/drm/i915/display/intel_display_irq.c  |  22 +--
>  .../gpu/drm/i915/display/intel_display_rps.c  |   2 +-
>  .../drm/i915/display/intel_display_trace.h    |  12 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       |   2 +-
>  drivers/gpu/drm/i915/display/intel_dpll.c     |  38 ++---
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  44 ++---
>  drivers/gpu/drm/i915/display/intel_dpt.c      |   2 +-
>  drivers/gpu/drm/i915/display/intel_drrs.c     |  10 +-
>  drivers/gpu/drm/i915/display/intel_dsb.c      |   8 +-
>  drivers/gpu/drm/i915/display/intel_fbc.c      |   2 +-
>  drivers/gpu/drm/i915/display/intel_fdi.c      |  22 +--
>  .../drm/i915/display/intel_fifo_underrun.c    |   6 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |   2 +-
>  .../drm/i915/display/intel_modeset_setup.c    |  22 +--
>  .../drm/i915/display/intel_modeset_verify.c   |   2 +-
>  drivers/gpu/drm/i915/display/intel_panel.c    |   4 +-
>  .../gpu/drm/i915/display/intel_pch_display.c  |  32 ++--
>  .../gpu/drm/i915/display/intel_pch_refclk.c   |   2 +-
>  drivers/gpu/drm/i915/display/intel_pipe_crc.c |  10 +-
>  .../drm/i915/display/intel_plane_initial.c    |   6 +-
>  drivers/gpu/drm/i915/display/intel_psr.c      |  14 +-
>  drivers/gpu/drm/i915/display/intel_sdvo.c     |   2 +-
>  drivers/gpu/drm/i915/display/intel_vblank.c   |  24 +--
>  drivers/gpu/drm/i915/display/intel_vdsc.c     |  18 +-
>  drivers/gpu/drm/i915/display/intel_vrr.c      |  18 +-
>  drivers/gpu/drm/i915/display/skl_scaler.c     |  10 +-
>  .../drm/i915/display/skl_universal_plane.c    |   6 +-
>  drivers/gpu/drm/i915/display/skl_watermark.c  |  42 ++---
>  drivers/gpu/drm/i915/display/vlv_dsi.c        |   2 +-
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c          |  20 +--
>  drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c        |  15 +-
>  drivers/gpu/drm/imx/lcdc/imx-lcdc.c           |  16 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   4 +-
>  drivers/gpu/drm/kmb/kmb_crtc.c                |  16 +-
>  drivers/gpu/drm/logicvc/logicvc_crtc.c        |  14 +-
>  drivers/gpu/drm/mcde/mcde_display.c           |  18 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  22 +--
>  drivers/gpu/drm/meson/meson_crtc.c            |  12 +-
>  drivers/gpu/drm/mgag200/mgag200_g200.c        |   4 +-
>  drivers/gpu/drm/mgag200/mgag200_g200eh.c      |   2 +-
>  drivers/gpu/drm/mgag200/mgag200_g200er.c      |   4 +-
>  drivers/gpu/drm/mgag200/mgag200_g200ev.c      |   4 +-
>  drivers/gpu/drm/mgag200/mgag200_g200se.c      |   6 +-
>  drivers/gpu/drm/mgag200/mgag200_g200wb.c      |   2 +-
>  drivers/gpu/drm/mgag200/mgag200_mode.c        |  10 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |   6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  70 ++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  12 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  20 +--
>  drivers/gpu/drm/msm/msm_drv.c                 |   4 +-
>  drivers/gpu/drm/mxsfb/lcdif_kms.c             |  18 +-
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  16 +-
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  58 +++----
>  drivers/gpu/drm/nouveau/dispnv04/cursor.c     |  10 +-
>  drivers/gpu/drm/nouveau/dispnv50/atom.h       |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/crc.c        |  30 ++--
>  drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |   5 +-
>  drivers/gpu/drm/nouveau/dispnv50/head.c       |   4 +-
>  drivers/gpu/drm/nouveau/dispnv50/head507d.c   |  26 +--
>  drivers/gpu/drm/nouveau/dispnv50/head827d.c   |  10 +-
>  drivers/gpu/drm/nouveau/dispnv50/head907d.c   |  26 +--
>  drivers/gpu/drm/nouveau/dispnv50/head917d.c   |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/headc37d.c   |  18 +-
>  drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  10 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.h   |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c     |   2 +-
>  drivers/gpu/drm/omapdrm/omap_crtc.c           |  56 +++----
>  drivers/gpu/drm/omapdrm/omap_irq.c            |   6 +-
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c  |   4 +-
>  drivers/gpu/drm/pl111/pl111_display.c         |  16 +-
>  drivers/gpu/drm/qxl/qxl_display.c             |   2 +-
>  drivers/gpu/drm/radeon/atombios_crtc.c        |  54 +++---
>  drivers/gpu/drm/radeon/radeon_cursor.c        |  14 +-
>  drivers/gpu/drm/radeon/radeon_display.c       |  28 ++--
>  drivers/gpu/drm/radeon/radeon_kms.c           |   6 +-
>  drivers/gpu/drm/radeon/radeon_legacy_crtc.c   |  16 +-
>  .../gpu/drm/renesas/rcar-du/rcar_du_crtc.c    |  14 +-
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c |  20 +--
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |   8 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  |  15 +-
>  drivers/gpu/drm/solomon/ssd130x.c             |   2 +-
>  drivers/gpu/drm/sprd/sprd_dpu.c               |   6 +-
>  drivers/gpu/drm/sti/sti_crtc.c                |  14 +-
>  drivers/gpu/drm/stm/ltdc.c                    |  12 +-
>  drivers/gpu/drm/sun4i/sun4i_crtc.c            |  12 +-
>  drivers/gpu/drm/tegra/dc.c                    |  12 +-
>  drivers/gpu/drm/tidss/tidss_crtc.c            |  19 ++-
>  drivers/gpu/drm/tidss/tidss_irq.c             |   4 +-
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |  43 ++---
>  drivers/gpu/drm/tiny/bochs.c                  |   6 +-
>  drivers/gpu/drm/tiny/cirrus.c                 |   2 +-
>  drivers/gpu/drm/tiny/gm12u320.c               |   4 +-
>  drivers/gpu/drm/tiny/hx8357d.c                |   4 +-
>  drivers/gpu/drm/tiny/ili9163.c                |   4 +-
>  drivers/gpu/drm/tiny/ili9225.c                |   8 +-
>  drivers/gpu/drm/tiny/ili9341.c                |   4 +-
>  drivers/gpu/drm/tiny/ili9486.c                |   4 +-
>  drivers/gpu/drm/tiny/mi0283qt.c               |   4 +-
>  drivers/gpu/drm/tiny/ofdrm.c                  |   8 +-
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c         |   6 +-
>  drivers/gpu/drm/tiny/repaper.c                |   8 +-
>  drivers/gpu/drm/tiny/simpledrm.c              |   2 +-
>  drivers/gpu/drm/tiny/st7586.c                 |   6 +-
>  drivers/gpu/drm/tiny/st7735r.c                |   4 +-
>  drivers/gpu/drm/tve200/tve200_display.c       |  14 +-
>  drivers/gpu/drm/udl/udl_modeset.c             |   4 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c         |   6 +-
>  drivers/gpu/drm/vc4/vc4_crtc.c                |  38 ++---
>  drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
>  drivers/gpu/drm/vc4/vc4_hvs.c                 |  12 +-
>  drivers/gpu/drm/vc4/vc4_txp.c                 |   2 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c      |   4 +-
>  drivers/gpu/drm/vkms/vkms_crtc.c              |  12 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |   4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |   8 +-
>  drivers/gpu/drm/xen/xen_drm_front_kms.c       |  10 +-
>  drivers/gpu/drm/xlnx/zynqmp_kms.c             |   8 +-
>  include/drm/drm_atomic_helper.h               |   2 +-
>  include/drm/drm_crtc.h                        |   4 +-
>  194 files changed, 1296 insertions(+), 1264 deletions(-)
>=20
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> --=20
> 2.39.2
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--DbTmTNcmEZJ3sxG3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmSufNEACgkQ3cLmz3+f
v9FSMgf+JV6Salw2w4GLv+9asbGD6ik0oblmM2PMKoiE0lr5WJxx13dzR24bybN+
/yLeBZDoIu/s7Q6LeqGCsxmFbec13qKaZGYBYkJLv+OMHbyh4REeRiAcb8UmsooR
a6BhJiU9HH2PH5snsQ9nH1H5grb3DPvwgaqO2yXIOYSlF70H8t7zyD8zjlPAywwZ
0xBkR+4qw63MDKu5RWTeaIjIpjKpEUFfhA323992hjshPmtNphRHKAw0w0jGQ33u
yscku+iOuCxxEek3Mvf0VIc9wrVwGstUzFgAyNde+Hw9qWoe8r9L1igpwudGKgSK
2EbKtFUVm+TGcuoAh1GijOyj9Fgf9A==
=F3Xd
-----END PGP SIGNATURE-----

--DbTmTNcmEZJ3sxG3--
