Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A89107521EC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 14:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C5710E693;
	Thu, 13 Jul 2023 12:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AEA10E5F9;
 Thu, 13 Jul 2023 07:47:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 125AC1F890;
 Thu, 13 Jul 2023 07:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689234477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fTLCbBj1jIj95Vk3OEVFypBv7EXItxDal76mePPiA+8=;
 b=bfKVW45oDZYCmhcGzUIgQZ+XM2O+7qHiV9WC/mFCAEv40Hwgoiqqb7QSWK+9AKuXsYXNhb
 od858kfvxXxuDodtErQhUaoiXGVvC9/MboortVZngZd62zSh1gqDEHN6Lb+y1Fx0oVo2UN
 oE/CQhTubIOIM9rOtPUUjyLNImD3nNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689234477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fTLCbBj1jIj95Vk3OEVFypBv7EXItxDal76mePPiA+8=;
 b=MPED7mOOf308DxNlQAQz9alnKoic0rEySaUqggFL2dp8f6pCIMJ2vQ6x0QJzdoYH0chOHe
 a0OZOdOtxBOs2mBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E78B1133D6;
 Thu, 13 Jul 2023 07:47:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id T3mGNyisr2TfFwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 07:47:52 +0000
Message-ID: <955528fe-fd45-b8c1-8458-b3a7cd3dfbbb@suse.de>
Date: Thu, 13 Jul 2023 09:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@intel.com>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com> <20230712161025.22op3gtzgujrhytb@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230712161025.22op3gtzgujrhytb@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kFtFEiqeMKJZ4HgZ6qn0z8X0"
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
 Xinliang Liu <xinliang.liu@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Liu Shixin <liushixin2@huawei.com>, linux-samsung-soc@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Matt Roper <matthew.d.roper@intel.com>,
 Wenjing Liu <wenjing.liu@amd.com>,
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
 Lucas De Marchi <lucas.demarchi@intel.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
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
 =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 Dave Airlie <airlied@redhat.com>, linux-mips@vger.kernel.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Evan Quan <evan.quan@amd.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Sandy Huang <hjc@rock-chips.com>,
 Swati Sharma <swati2.sharma@intel.com>, John Stultz <jstultz@google.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Drew Davenport <ddavenport@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, linux-hyperv@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
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
 Xinhui" <Xinhui.Pan@amd.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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
 Russell King <linux@armlinux.org.uk>, Uma Shankar <uma.shankar@intel.com>,
 Mika Kahola <mika.kahola@intel.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 linux-tegra@vger.kernel.org,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, amd-gfx@lists.freedesktop.org,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kFtFEiqeMKJZ4HgZ6qn0z8X0
Content-Type: multipart/mixed; boundary="------------hX0Y0L30m6F5STQTlkmw5Rlm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Guchun Chen <guchun.chen@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Evan Quan <evan.quan@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 David Francis <David.Francis@amd.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 Philip Yang <Philip.Yang@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Zack Rusin <zackr@vmware.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu
 <hersenxs.wu@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 Melissa Wen <mwen@igalia.com>, Bhawanpreet Lakha
 <Bhawanpreet.Lakha@amd.com>, David Tadokoro <davidbtadokoro@usp.br>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, Roman Li <roman.li@amd.com>,
 =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Liviu Dudau <liviu.dudau@arm.com>, Joel Stanley <joel@jms.id.au>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Danilo Krummrich <dakr@redhat.com>, Deepak Rawat <drawat.floss@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Luca Coelho <luciano.coelho@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Imre Deak <imre.deak@intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Fei Yang <fei.yang@intel.com>, Animesh Manna <animesh.manna@intel.com>,
 Deepak R Varma <drv@mailo.com>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Drew Davenport <ddavenport@chromium.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Dan Carpenter <error27@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Liu Shixin
 <liushixin2@huawei.com>, Marek Vasut <marex@denx.de>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Tomi Valkeinen <tomba@kernel.org>,
 Emma Anholt <emma@anholt.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Lechner <david@lechnology.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Michal Simek <michal.simek@amd.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, linux-hyperv@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Yongqin Liu <yongqin.liu@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Fabio Estevam <festevam@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, spice-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-mips@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>, linux-renesas-soc@vger.kernel.org,
 kernel@pengutronix.de, John Stultz <jstultz@google.com>,
 freedreno@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>
Message-ID: <955528fe-fd45-b8c1-8458-b3a7cd3dfbbb@suse.de>
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com> <20230712161025.22op3gtzgujrhytb@pengutronix.de>
In-Reply-To: <20230712161025.22op3gtzgujrhytb@pengutronix.de>

--------------hX0Y0L30m6F5STQTlkmw5Rlm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDcuMjMgdW0gMTg6MTAgc2NocmllYiBVd2UgS2xlaW5lLUvDtm5pZzoN
Cj4gSGVsbG8gSmFuaSwNCj4gDQo+IE9uIFdlZCwgSnVsIDEyLCAyMDIzIGF0IDA1OjM0OjI4
UE0gKzAzMDAsIEphbmkgTmlrdWxhIHdyb3RlOg0KPj4gT24gV2VkLCAxMiBKdWwgMjAyMywg
VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3Jv
dGU6DQo+Pj4gSGVsbG8sDQo+Pj4NCj4+PiB3aGlsZSBJIGRlYnVnZ2VkIGFuIGlzc3VlIGlu
IHRoZSBpbXgtbGNkYyBkcml2ZXIgSSB3YXMgY29uc3RhbnRseQ0KPj4+IGlycml0YXRlZCBh
Ym91dCBzdHJ1Y3QgZHJtX2RldmljZSBwb2ludGVyIHZhcmlhYmxlcyBiZWluZyBuYW1lZCAi
ZGV2Ig0KPj4+IGJlY2F1c2Ugd2l0aCB0aGF0IG5hbWUgSSB1c3VhbGx5IGV4cGVjdCBhIHN0
cnVjdCBkZXZpY2UgcG9pbnRlci4NCj4+Pg0KPj4+IEkgdGhpbmsgdGhlcmUgaXMgYSBiaWcg
YmVuZWZpdCB3aGVuIHRoZXNlIGFyZSBhbGwgcmVuYW1lZCB0byAiZHJtX2RldiIuDQo+Pj4g
SSBoYXZlIG5vIHN0cm9uZyBwcmVmZXJlbmNlIGhlcmUgdGhvdWdoLCBzbyAiZHJtZGV2IiBv
ciAiZHJtIiBhcmUgZmluZQ0KPj4+IGZvciBtZSwgdG9vLiBMZXQgdGhlIGJpa2VzaGVkaW5n
IGJlZ2luIQ0KPj4+DQo+Pj4gU29tZSBzdGF0aXN0aWNzOg0KPj4+DQo+Pj4gJCBnaXQgZ3Jl
cCAtb2hFICdzdHJ1Y3QgZHJtX2RldmljZSAqXCogKlteICgpLDtdKicgdjYuNS1yYzEgfCBz
b3J0IHwgdW5pcSAtYyB8IHNvcnQgLW4NCj4+PiAgICAgICAgMSBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqYWRldl90b19kcm0NCj4+PiAgICAgICAgMSBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtXw0K
Pj4+ICAgICAgICAxIHN0cnVjdCBkcm1fZGV2aWNlICAgICAgICAgICpkcm1fZGV2DQo+Pj4g
ICAgICAgIDEgc3RydWN0IGRybV9kZXZpY2UgICAgICAgICpkcm1fZGV2DQo+Pj4gICAgICAg
IDEgc3RydWN0IGRybV9kZXZpY2UgKnBkZXYNCj4+PiAgICAgICAgMSBzdHJ1Y3QgZHJtX2Rl
dmljZSAqcmRldg0KPj4+ICAgICAgICAxIHN0cnVjdCBkcm1fZGV2aWNlICp2ZGV2DQo+Pj4g
ICAgICAgIDIgc3RydWN0IGRybV9kZXZpY2UgKmRjc3NfZHJ2X2Rldl90b19kcm0NCj4+PiAg
ICAgICAgMiBzdHJ1Y3QgZHJtX2RldmljZSAqKmRkZXYNCj4+PiAgICAgICAgMiBzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtX2Rldl9hbGxvYw0KPj4+ICAgICAgICAyIHN0cnVjdCBkcm1fZGV2
aWNlICptb2NrDQo+Pj4gICAgICAgIDIgc3RydWN0IGRybV9kZXZpY2UgKnBfZGRldg0KPj4+
ICAgICAgICA1IHN0cnVjdCBkcm1fZGV2aWNlICpkZXZpY2UNCj4+PiAgICAgICAgOSBzdHJ1
Y3QgZHJtX2RldmljZSAqIGRldg0KPj4+ICAgICAgIDI1IHN0cnVjdCBkcm1fZGV2aWNlICpk
DQo+Pj4gICAgICAgOTUgc3RydWN0IGRybV9kZXZpY2UgKg0KPj4+ICAgICAgMjE2IHN0cnVj
dCBkcm1fZGV2aWNlICpkZGV2DQo+Pj4gICAgICAyMzQgc3RydWN0IGRybV9kZXZpY2UgKmRy
bV9kZXYNCj4+PiAgICAgIDYxMSBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtDQo+Pj4gICAgIDQx
OTAgc3RydWN0IGRybV9kZXZpY2UgKmRldg0KPj4+DQo+Pj4gVGhpcyBzZXJpZXMgc3RhcnRz
IHdpdGggcmVuYW1pbmcgc3RydWN0IGRybV9jcnRjOjpkZXYgdG8gZHJtX2Rldi4gSWYNCj4+
PiBpdCdzIG5vdCBvbmx5IG1lIGFuZCBvdGhlcnMgbGlrZSB0aGUgcmVzdWx0IG9mIHRoaXMg
ZWZmb3J0IGl0IHNob3VsZCBiZQ0KPj4+IGZvbGxvd2VkIHVwIGJ5IGFkYXB0aW5nIHRoZSBv
dGhlciBzdHJ1Y3RzIGFuZCB0aGUgaW5kaXZpZHVhbCB1c2FnZXMgaW4NCj4+PiB0aGUgZGlm
ZmVyZW50IGRyaXZlcnMuDQo+Pg0KPj4gSSB0aGluayB0aGlzIGlzIGFuIHVubmVjZXNzYXJ5
IGNoYW5nZS4gSW4gZHJtLCBhIGRldiBpcyB1c3VhbGx5IGEgZHJtDQo+PiBkZXZpY2UsIGku
ZS4gc3RydWN0IGRybV9kZXZpY2UgKi4NCj4gDQo+IFdlbGwsIHVubGVzcyBpdCdzIG5vdC4g
UHJvbWluZW50bHkgdGhlcmUgaXMNCj4gDQo+IAlzdHJ1Y3QgZHJtX2RldmljZSB7DQo+IAkJ
Li4uDQo+IAkJc3RydWN0IGRldmljZSAqZGV2Ow0KPiAJCS4uLg0KPiAJfTsNCg0KSmFuaSdz
IHBvaW50IGlzIHRoYXQgaXQncyBvbmx5IGluY29udmVuaWVudCBhdCB0aGUgZmlyc3QgdGlt
ZS4gRXZlcnlvbmUgDQpnZXRzIHVzZSB0byBpdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiANCj4gd2hpY2ggeWllbGRzIHF1aXRlIGEgZmV3IGNvZGUgbG9jYXRpb25zIHVzaW5n
IGRldi0+ZGV2IHdoaWNoIGlzDQo+IElNSE8gdW5uZWNlc3NhcnkgaXJyaXRhdGluZzoNCj4g
DQo+IAkkIGdpdCBncmVwICdcPGRldi0+ZGV2JyB2Ni41LXJjMSBkcml2ZXJzL2dwdS9kcm0g
fCB3YyAtbA0KPiAJMTYzMw0KPiANCj4gQWxzbyB0aGUgZnVuY3Rpb25zIHRoYXQgZGVhbCB3
aXRoIGJvdGggYSBzdHJ1Y3QgZGV2aWNlIGFuZCBhIHN0cnVjdA0KPiBkcm1fZGV2aWNlIG9m
dGVuIHVzZSAiZGV2IiBmb3IgdGhlIHN0cnVjdCBkZXZpY2UgYW5kIHRoZW4gImRkZXYiIGZv
cg0KPiB0aGUgZHJtX2RldmljZSAoc2VlIGZvciBleGFtcGxlIGFtZGdwdV9kZXZpY2VfZ2V0
X3BjaWVfcmVwbGF5X2NvdW50KCkpLg0KPiANCj4+IElmIGZvbGtzIGluc2lzdCBvbiBmb2xs
b3dpbmcgdGhyb3VnaCB3aXRoIHRoaXMgYW55d2F5LCBJJ20gZmlybWx5IGluIHRoZQ0KPj4g
Y2FtcCB0aGUgbmFtZSBzaG91bGQgYmUgImRybSIgYW5kIG5vdGhpbmcgZWxzZS4NCj4gDQo+
IFVwIHRvIG5vdyBwb3NpdGl2ZSBmZWVkYmFjayBpcyBpbiB0aGUgbWFqb3JpdHkuDQo+IA0K
PiBCZXN0IHJlZ2FyZHMNCj4gVXdlDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55
DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGll
biBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------hX0Y0L30m6F5STQTlkmw5Rlm--

--------------kFtFEiqeMKJZ4HgZ6qn0z8X0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSvrCcFAwAAAAAACgkQlh/E3EQov+DJ
PhAAr98ggA96Z2w3wyv8ofgp+UF6w/zMt4QW5UGdlEVnsbSsMsZvzn6wF08HFKbQtN5a9iBBnt+f
5/tIfU2f76afG8WDSbUKW61ZnEu2EwZxLY207Vbeo7SD6US8W3NgaA+cs6nEccA1AHKPOU/uTPY5
gRTqzdtti6+N+iz/aj5bcKRfBe5zkJj2TDVOg4VM2nMcOcnqdlBG6zxcOd0/7f822X2h5FHYvBcw
WUfoBgp4CFBkpWLyeqVk9jQiMCZrwXiYsPo5X/YIqG46xhIfOvWDnjz8oaDzoT/gK/vXmAwUmqf8
vHkvk7fn09fN0tUL4ErUqunJZ3PbPA20sm3kPFUp9/46XcnGYjD8HkdeV6c71IprSuqW8nPRKQ5a
i41BoLZQ9LL7bPhGplpNEiUIMARvShWvgE7VmkSC8B1qDnKabHCwlbDmvBk7bpHG9RsvQWi24ubI
DyVUFa2lyRHB7jA8y0aspgqorAzQ0EcrZMCJVXMkUg0NRU/uRqxFstG04a7HT872oOIEv6NmcHnK
hSfYDTA6iDuTxmmErZ8/111b0zHL3jzBuYFuk7yCILHUrU7mIVpyoWBF8ANEOixG5oDraOC5T2D7
CMTZtgFjeJ8M3Vw3T5cSe0q7eW4ZxS1m/qYVeVvZoYBwBXs/sQWTyQZe17comjBkKzAvWT/5rS/u
eL0=
=Tts0
-----END PGP SIGNATURE-----

--------------kFtFEiqeMKJZ4HgZ6qn0z8X0--
