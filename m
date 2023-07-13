Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBCF7532D5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC27210E7EC;
	Fri, 14 Jul 2023 07:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B8310E6FC;
 Thu, 13 Jul 2023 15:09:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 77B671F45E;
 Thu, 13 Jul 2023 15:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689260947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MS6Q/88TMXWzZPXfu/PTu2qDJkEKMqR1diKbb8wT1eU=;
 b=cEBc0UcNtLsv9/np6kbLs/An3rRHlzzg4WKB1vazu2CrpKaBj2wmoM6mOu0B48lqik2WZU
 s0jUIKNWNSsjxwILxBM98lddtS+cUFtia+65jXw7n0fBK7Q5iNfwmfJLNnBLiP47Upwn23
 PHKmf1yem40W1KFSIQvAVq4ArQzWMuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689260947;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MS6Q/88TMXWzZPXfu/PTu2qDJkEKMqR1diKbb8wT1eU=;
 b=Vl/f6Y8CEHJhBZGlsg6hVEEwlwTtg+HhIYHsDOu10IZWCZUdlBGSixnruIlV04LbwCBXFV
 h0UKbVbUcp8wDlBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4808133D6;
 Thu, 13 Jul 2023 15:09:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 08LHMo8TsGTCBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 15:09:03 +0000
Message-ID: <78be52b8-5ffb-601a-84b2-ead2894973a6@suse.de>
Date: Thu, 13 Jul 2023 17:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
Content-Language: en-US
To: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
 <20230713130337.fd2l67r23g2irifx@pengutronix.de>
 <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UZzIExM15Kv5h8d3TfG92PJg"
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
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Leo Li <sunpeng.li@amd.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
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
 =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
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
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Sam Ravnborg <sam@ravnborg.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Liu Shixin <liushixin2@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Marek Vasut <marex@denx.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Russell King <linux@armlinux.org.uk>, Jani Nikula <jani.nikula@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 David Lechner <david@lechnology.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 amd-gfx@lists.freedesktop.org, Lang Yu <Lang.Yu@amd.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Drew Davenport <ddavenport@chromium.org>, Nirmoy Das <nirmoy.das@intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UZzIExM15Kv5h8d3TfG92PJg
Content-Type: multipart/mixed; boundary="------------MlAYonS9DhZc9LUjMUrylqL8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jani Nikula <jani.nikula@intel.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
 dri-devel@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Liu Shixin <liushixin2@huawei.com>,
 linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Matt Roper <matthew.d.roper@intel.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 linux-sunxi@lists.linux.dev, Stylon Wang <stylon.wang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Zack Rusin
 <zackr@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang
 <fei.yang@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, David Lechner <david@lechnology.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 David Francis <David.Francis@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 linux-rockchip@lists.infradead.org, Fangzhi Zuo <jerry.zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, =?UTF-8?Q?Jouni_H=c3=b6gander?=
 <jouni.hogander@intel.com>, Dave Airlie <airlied@redhat.com>,
 linux-mips@vger.kernel.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Evan Quan <evan.quan@amd.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Chunyan Zhang
 <zhang.lyra@gmail.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Sandy Huang <hjc@rock-chips.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Stultz <jstultz@google.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Drew Davenport <ddavenport@chromium.org>, Kevin Hilman
 <khilman@baylibre.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Dan Carpenter <error27@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mairacanal@riseup.net>, Luca Coelho <luciano.coelho@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Alan Liu <haoping.liu@amd.com>,
 Philip Yang <Philip.Yang@amd.com>, Lyude Paul <lyude@redhat.com>,
 intel-gfx@lists.freedesktop.org, Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Chia-I Wu <olvaffe@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Imre Deak <imre.deak@intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Roman Li
 <roman.li@amd.com>, Paul Cercueil <paul@crapouillou.net>,
 Rob Clark <robdclark@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Russell King <linux@armlinux.org.uk>, Uma Shankar <uma.shankar@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 linux-tegra@vger.kernel.org, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Orson Zhai <orsonzhai@gmail.com>, amd-gfx@lists.freedesktop.org,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Daniel Vetter
 <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Message-ID: <78be52b8-5ffb-601a-84b2-ead2894973a6@suse.de>
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
 <20230713130337.fd2l67r23g2irifx@pengutronix.de>
 <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
In-Reply-To: <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>

--------------MlAYonS9DhZc9LUjMUrylqL8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDcuMjMgdW0gMTY6NDEgc2NocmllYiBTZWFuIFBhdWw6DQo+IE9uIFRo
dSwgSnVsIDEzLCAyMDIzIGF0IDk6MDTigK9BTSBVd2UgS2xlaW5lLUvDtm5pZw0KPiA8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToNCj4+DQo+PiBoZWxsbyBTZWFu
LA0KPj4NCj4+IE9uIFdlZCwgSnVsIDEyLCAyMDIzIGF0IDAyOjMxOjAyUE0gLTA0MDAsIFNl
YW4gUGF1bCB3cm90ZToNCj4+PiBJJ2QgcmVhbGx5IHByZWZlciB0aGlzIHBhdGNoIChzZXJp
ZXMgb3Igc2luZ2xlKSBpcyBub3QgYWNjZXB0ZWQuIFRoaXMNCj4+PiB3aWxsIGNhdXNlIHBy
b2JsZW1zIGZvciBldmVyeW9uZSBjaGVycnktcGlja2luZyBwYXRjaGVzIHRvIGENCj4+PiBk
b3duc3RyZWFtIGtlcm5lbCAoTFRTIG9yIGRpc3RybyB0cmVlKS4gSSB1c3VhbGx5IHdvdWxk
bid0IGV4cGVjdA0KPj4+IHN5bXBhdGh5IGhlcmUsIGJ1dCB0aGUgcXVlc3Rpb25hYmxlIGJl
bmVmaXQgZG9lcyBub3Qgb3V0d2VpZ2ggdGhlIGNvc3QNCj4+PiBJTVtiaWFzZWRdTy4NCj4+
DQo+PiBJIGFncmVlIHRoYXQgZm9yIGJhY2twb3J0cyB0aGlzIGlzbid0IHNvIG5pY2UuIEhv
d2V2ZXIgd2l0aCB0aGUgc3BsaXQNCj4+IGFwcHJvYWNoICh0aGF0IHdhcyBhcmd1bWVudGVk
IGFnYWluc3QgaGVyZSkgaXQncyBub3Qgc29vIGJhZC4gUGF0Y2ggIzENCj4+IChhbmQgc2lt
aWxhciBjaGFuZ2VzIGZvciB0aGUgb3RoZXIgYWZmZWN0ZWQgc3RydWN0dXJlcykgY291bGQg
YmUNCj4+IHRyaXZpYWxseSBiYWNrcG9ydGVkIGFuZCB3aXRoIHRoYXQgaXQgZG9lc24ndCBt
YXR0ZXIgaWYgeW91IHdyaXRlIGRldiBvcg0KPj4gZHJtIChvciB3aGF0ZXZlciBuYW1lIGlz
IGNob3NlbiBpbiB0aGUgZW5kKTsgYm90aCB3b3JrIGluIHRoZSBzYW1lIHdheS4NCj4gDQo+
IFBhdGNoICMxIGF2b2lkcyB0aGUgbmVlZCB0byBiYWNrcG9ydCB0aGUgZW50aXJlIHNldCwg
aG93ZXZlciBldmVyeQ0KPiBjaGFuZ2Ugb2NjdXJpbmcgYWZ0ZXIgdGhlIHJlbmFtZSBwYXRj
aGVzIHdpbGwgY2F1c2UgY29uZmxpY3RzIG9uDQo+IGZ1dHVyZSBjaGVycnktcGlja3MuIERv
d25zdHJlYW0ga2VybmVscyB3aWxsIGhhdmUgdG8gYmFja3BvcnQgdGhlDQo+IHdob2xlIHNl
dC4gQmFja3BvcnRpbmcgdGhlIGVudGlyZSBzZXQgd2lsbCBjcmVhdGUgYW4gZXBvY2ggaW4N
Cj4gZG93bnN0cmVhbSBrZXJuZWxzIHdoZXJlIGNoZXJyeS1waWNraW5nIHBhdGNoZXMgcHJl
Y2VkaW5nIHRoaXMgc2V0DQo+IHdpbGwgbmVlZCB0byB1bmRlcmdvIGNvbmZsaWN0IHJlc29s
dXRpb24gYXMgd2VsbC4gQXMgbWVudGlvbmVkIGluIG15DQo+IHByZXZpb3VzIGVtYWlsLCBJ
IGRvbid0IGV4cGVjdCBzeW1wYXRoeSBoZXJlLCBpdCdzIHBhcnQgb2YgbWFpbnRhaW5pbmcN
Cj4gYSBkb3duc3RyZWFtIGtlcm5lbCwgYnV0IHRoZXJlIGlzIGEgcmVhbCBjb3N0IHRvIGtl
cm5lbCBjb25zdW1lcnMuDQo+IA0KPj4NCj4+IEJ1dCBldmVuIHdpdGggdGhlIG9uZS1wYXRj
aC1wZXItcmVuYW1lIGFwcHJvYWNoIEknZCBjb25zaWRlciB0aGUNCj4+IHJlbmFtaW5nIGEg
bmV0IHdpbiwgYmVjYXVzZSBlYXNlIG9mIHVuZGVyc3RhbmRpbmcgY29kZSBoYXMgYSBiaWcg
dmFsdWUuDQo+PiBJdCdzIHZhbHVlIGlzIG5vdCBzbyBlYXN5IG1lYXN1cmFibGUgYXMgImNv
bmZsaWN0cyB3aGVuIGJhY2twb3J0aW5nIiwNCj4+IGJ1dCBpdCBhbHNvIG1hdHRlcnMgaW4g
c2F5IHR3byB5ZWFycyBmcm9tIG5vdywgd2hpbGUgYmFja3BvcnRpbmcNCj4+IHNob3VsZG4n
dCBiZSBhbiBpc3N1ZSB0aGVuIGFueSBtb3JlLg0KPiANCj4gWW91J3ZlIHJpZ2h0bHkgaWRl
bnRpZmllZCB0aGUgY29uamVjdHVyZSBpbiB5b3VyIHN0YXRlbWVudC4gSSd2ZSBiZWVuDQo+
IG9uIGJvdGggc2lkZXMgb2YgdGhlIGFyZ3VtZW50LCBoYXZpbmcgd3JpdHRlbi9tYWludGFp
bmVkIGRybSBjb2RlDQo+IHVwc3RyZWFtIGFuZCBjaGVycnktcGlja2VkIGNoYW5nZXMgdG8g
YSBkb3duc3RyZWFtIGtlcm5lbC4gUGVyaGFwcw0KPiBpdCdzIGJlY2F1c2UgZHJtJ3MgZGVm
aW5pdGlvbiBvZiBkZXYgaXMgaW5ncmFpbmVkIGluIG15IG11c2NsZSBtZW1vcnksDQo+IG9y
IG1heWJlIGl0J3MgYmVjYXVzZSBJIGRvbid0IGRvIGEgbG90IG9mIHVwc3RyZWFtIGRldmVs
b3BtZW50IHRoZXNlDQo+IGRheXMsIGJ1dCBJIGp1c3QgaGF2ZSBhIGhhcmQgdGltZSBzZWVp
bmcgdGhlIGJlbmVmaXQgaGVyZS4NCg0KSSBjYW4gb25seSBzZWNvbmQgd2hhdCBTZWFuIHdy
aXRlcy4gSSd2ZSBkb25lIHF1aXRlIGEgYml0IG9mIGJhY2twb3J0aW5nIA0Kb2YgRFJNIGNv
ZGUuIEl0J3MgaGFyZCBhbHJlYWR5LiBBbmQgdGhpcyBraW5kIG9mIGNoYW5nZSBpcyBnb2lu
ZyB0byB0byANCmFmZmVjdCBhbG1vc3QgZXZlcnkgYmFja3BvcnRlZCBEUk0gcGF0Y2ggaW4g
dGhlIGNvbWluZyB5ZWFycy4gTm90IGp1c3QgDQpmb3IgZGlzdHJpYnV0aW9uIGtlcm5lbHMs
IGJ1dCBhbHNvIGZvciB1cHN0cmVhbSdzIHN0YWJsZSBzZXJpZXMuIEl0J3MgDQpyZWFsbHkg
b25seSBwb3NzaWJsZSB0byBkbyB0aGlzIGNoYW5nZSBvdmVyIG1hbnkgcmVsZWFzZXMgd2hp
bGUga2VlcGluZyANCmNvbXBhdGlibGUgd2l0aCB0aGUgb2xkIG5hbWUuIFNvIHRoZSBtb3Jl
IEkgdGhpbmsgYWJvdXQgaXQsIHRoZSBsZXNzIEkgDQpsaWtlIHRoaXMgY2hhbmdlLg0KDQpC
ZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBJIGFwcHJlY2lhdGUgeW91ciBlbmdhZ2Vt
ZW50IG9uIHRoZSB0b3BpYywgdGhhbmsgeW91IQ0KPiANCj4gU2Vhbg0KPiANCj4+DQo+PiBU
aGFua3MgZm9yIHlvdXIgaW5wdXQsIGJlc3QgcmVnYXJkcw0KPj4gVXdlDQo+Pg0KPj4gLS0N
Cj4+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBL
bGVpbmUtS8O2bmlnICAgICAgICAgICAgfA0KPj4gSW5kdXN0cmlhbCBMaW51eCBTb2x1dGlv
bnMgICAgICAgICAgICAgICAgIHwgaHR0cHM6Ly93d3cucGVuZ3V0cm9uaXguZGUvIHwNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYs
IDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJz
LCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVy
bmJlcmcpDQo=

--------------MlAYonS9DhZc9LUjMUrylqL8--

--------------UZzIExM15Kv5h8d3TfG92PJg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSwE44FAwAAAAAACgkQlh/E3EQov+CI
yQ//aZHYhcxB037tgGfzs4wCdHrFdvhb5Mqh5H9F2uMCAuLkMCZZ6zMzqlDeOTNynCNJ8xBXx/tY
Z9jdNWdNGgTZE4GyX63pd3sAgBDtmj62p2x5eeBhve2bM01a7BvueZoqQ7bKedRwl7xyVPZYM11a
zBT+/iz7U+E/+N5J66ZaUOVWiIW1CAo+Z+zxewzXD+pjA/earmoHjIu+01QUsUyUQ9OX9cQpJOPv
/J0bNuItNGvILSLV7rR70FF55hJ/DbyvlCgOmrbhFRsVX4uuuuCAW3gAoTu/UFq+ZWhUDV0Td3Bg
jb/adYZH7VmxHTv6LOheoWTgj3K8qjK+fgbTIZy/Llzenh1R+b8cf5hbIMirI2i1BdNLqiRZggWK
cuEA8icsjxmmXDpLK1+bRk5L5Jh0oKmI3AJztXIFAQIC/KiC4S2a2onb7toJyFvoeEzbIdpR5xXw
a7NhaDkGwksRiHgQv1BMO4GIZtkzMqxja6qqac1CQxnU3nyBH3rBjSiT36K7+uyMQkw/11rNweNU
Bp/pM3ZcHIUoyP6oJTuIYWZm7drTbfstCMjAuQGT+EY1V/vHJifdtruW29QM9DsXPz09pkFR0REk
f/Xbx4gNiXjL6H17xkRd1v/NJ/NTJXoxF1Oc9H46yvUMX4Vj8klQKGqEcnUzYWmAQB8VdfHTff1e
ztc=
=359C
-----END PGP SIGNATURE-----

--------------UZzIExM15Kv5h8d3TfG92PJg--
