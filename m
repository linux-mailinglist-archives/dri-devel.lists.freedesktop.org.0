Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA387521E4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 14:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD1210E129;
	Thu, 13 Jul 2023 12:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6E510E673;
 Thu, 13 Jul 2023 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689239035; x=1720775035;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=wpe6dsOBfDPS7D7Sq/hiKhbMpNSn/Y2A1D02VMmRxgw=;
 b=nCC482jgclH2CTz6+8O714okx2RScR1uZ2aAY20lsHcei7XFzoS0RmBS
 h5N0PTR8+GfYDCWQf5ysPxbzqCQZEFJi+wNxT1glQr5w2aPx5evHTAFAi
 RP0U/ZTxT3zUpjpJFqkl6ovSYirIQDR2Z2Dy1mWNCSsgYgar9gDCOLrRm
 N2wPAmMQsZfWXVQ7+mM0JQDNuoBBznXVebwm+HpNtMBWJ3FTQYzxoNAPS
 /9qVkQNhtHpmq3IXBweM1YUcGUUOC/BwcEG+JrsXnPsakzPsZ2FCuc7un
 YHqhkBTsB3xbg+FQsFEtpiwJPjWLdpdweVtTlmp4v9VEXRnjcnY3iGDNv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="395935058"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="395935058"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 02:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="715882508"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="715882508"
Received: from atadj-mobl1.amr.corp.intel.com (HELO localhost) ([10.252.50.30])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 02:03:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
In-Reply-To: <20230712161025.22op3gtzgujrhytb@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <20230712161025.22op3gtzgujrhytb@pengutronix.de>
Date: Thu, 13 Jul 2023 12:03:05 +0300
Message-ID: <878rbkgp4m.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 13 Jul 2023 12:53:45 +0000
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
 Xinliang Liu <xinliang.liu@linaro.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Matt Roper <matthew.d.roper@intel.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-sunxi@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>, Stylon Wang <stylon.wang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 =?utf-8?Q?A?= =?utf-8?Q?ndr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Leo Li <sunpeng.li@amd.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, David Francis <David.Francis@amd.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Aaron Liu <aaron.liu@amd.com>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 linux-rockchip@lists.infradead.org, Fangzhi Zuo <jerry.zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Tian Tao <tiantao6@hisilicon.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-amlogic@lists.infradead.org, Evan Quan <evan.quan@amd.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Sandy Huang <hjc@rock-chips.com>,
 Swati Sharma <swati2.sharma@intel.com>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, linux-hyperv@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, Emma Anholt <emma@anholt.net>,
 Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Alan Liu <haoping.liu@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 intel-gfx@lists.freedesktop.org, Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, "Pan, 
 Xinhui" <Xinhui.Pan@amd.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 John Stultz <jstultz@google.com>, Roman Li <roman.li@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Sam Ravnborg <sam@ravnborg.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Liu Shixin <liushixin2@huawei.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Russell King <linux@armlinux.org.uk>, Uma Shankar <uma.shankar@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 David Lechner <david@lechnology.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 =?utf-8?Q?Joaqu=C3=ADn?= Ignacio =?utf-8?Q?Aramend=C3=ADa?=
 <samsagax@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 amd-gfx@lists.freedesktop.org, Lang Yu <Lang.Yu@amd.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Wayne Lin <Wayne.Lin@amd.com>,
 Drew Davenport <ddavenport@chromium.org>, Nirmoy Das <nirmoy.das@intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>=
 wrote:
> Hello Jani,
>
> On Wed, Jul 12, 2023 at 05:34:28PM +0300, Jani Nikula wrote:
>> On Wed, 12 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.=
de> wrote:
>> > Hello,
>> >
>> > while I debugged an issue in the imx-lcdc driver I was constantly
>> > irritated about struct drm_device pointer variables being named "dev"
>> > because with that name I usually expect a struct device pointer.
>> >
>> > I think there is a big benefit when these are all renamed to "drm_dev".
>> > I have no strong preference here though, so "drmdev" or "drm" are fine
>> > for me, too. Let the bikesheding begin!
>> >
>> > Some statistics:
>> >
>> > $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort | u=
niq -c | sort -n
>> >       1 struct drm_device *adev_to_drm
>> >       1 struct drm_device *drm_
>> >       1 struct drm_device          *drm_dev
>> >       1 struct drm_device        *drm_dev
>> >       1 struct drm_device *pdev
>> >       1 struct drm_device *rdev
>> >       1 struct drm_device *vdev
>> >       2 struct drm_device *dcss_drv_dev_to_drm
>> >       2 struct drm_device **ddev
>> >       2 struct drm_device *drm_dev_alloc
>> >       2 struct drm_device *mock
>> >       2 struct drm_device *p_ddev
>> >       5 struct drm_device *device
>> >       9 struct drm_device * dev
>> >      25 struct drm_device *d
>> >      95 struct drm_device *
>> >     216 struct drm_device *ddev
>> >     234 struct drm_device *drm_dev
>> >     611 struct drm_device *drm
>> >    4190 struct drm_device *dev
>> >
>> > This series starts with renaming struct drm_crtc::dev to drm_dev. If
>> > it's not only me and others like the result of this effort it should be
>> > followed up by adapting the other structs and the individual usages in
>> > the different drivers.
>>=20
>> I think this is an unnecessary change. In drm, a dev is usually a drm
>> device, i.e. struct drm_device *.
>
> Well, unless it's not. Prominently there is
>
> 	struct drm_device {
> 		...
> 		struct device *dev;
> 		...
> 	};
>
> which yields quite a few code locations using dev->dev which is
> IMHO unnecessary irritating:
>
> 	$ git grep '\<dev->dev' v6.5-rc1 drivers/gpu/drm | wc -l
> 	1633
>
> Also the functions that deal with both a struct device and a struct
> drm_device often use "dev" for the struct device and then "ddev" for
> the drm_device (see for example amdgpu_device_get_pcie_replay_count()).

Why is specifically struct drm_device *dev so irritating to you?

You lead us to believe it's an outlier in kernel, something that goes
against common kernel style, but it's really not:

$ git grep -how "struct [A-Za-z0-9_]\+ \*dev" | sort | uniq -c | sort -rn |=
 head -20
  38494 struct device *dev
  16388 struct net_device *dev
   4184 struct drm_device *dev
   2780 struct pci_dev *dev
   1916 struct comedi_device *dev
   1510 struct mlx5_core_dev *dev
   1057 struct mlx4_dev *dev
    894 struct b43_wldev *dev
    762 struct input_dev *dev
    623 struct usbnet *dev
    561 struct mlx5_ib_dev *dev
    525 struct mt76_dev *dev
    465 struct mt76x02_dev *dev
    435 struct platform_device *dev
    431 struct usb_device *dev
    411 struct mt7915_dev *dev
    398 struct cx231xx *dev
    378 struct mei_device *dev
    363 struct ksz_device *dev
    359 struct mthca_dev *dev

A good portion of the above also have a dev member.

Are you planning on changing all of the above too, or are you only
annoyed by drm?

I'm really not convinced at all.


BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
