Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E900751A23
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACEE10E617;
	Thu, 13 Jul 2023 07:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192AD10E604;
 Thu, 13 Jul 2023 06:58:46 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-76714d3c3a7so41755885a.3; 
 Wed, 12 Jul 2023 23:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689231525; x=1691823525;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+0qanWxODhzgXHCXIxDgPeQhxCw3xhLkeN7rWN/J3A=;
 b=OZkoB0XuuZNBcs1eiHH+R1EBjJg7Hgd8tRQTF5KozGOS2u+iSbUl6iqnyv1500iBDv
 +hctRnzV6fUhjeSFHBx+nkNSTH2dtVKjDQlrV0A9M4tJSKsHzGPEPmeKwOJx/WVV91Ly
 SoP22nMcs/kdg9ulOa26hnfEc+VyfppO1mJ5pbLwn5oSKC6DKQTXylRv1fuZK+RcsOFi
 UE8DRHCjnrqycJ8iXFKgtcE2kZg3+ui8copkwraV1r3su4n4GsAbRJPqQJnNqcVyHXhD
 631fBZdi8SMQF6VRNTC2GLIaYFvxgwqKseSvoOcx6tfz4IAT6Lzhr5s1SOuhFYw+RlAL
 P8uA==
X-Gm-Message-State: ABy/qLaf42tZWkIY5R4492cNfeRL2hSq0j1es4x1f8NSWIHx4kzC17jc
 0aLYZ/nwOOPGbhYKk2eGOz6q8Xgo+1xyXTd8
X-Google-Smtp-Source: APBJJlFf5y35+LpnsIiabmDwHotcvJqe2NwGvNB5awGxgt7IfpI6mW0L19550Yyv69ZGYfukbK8SnQ==
X-Received: by 2002:a05:620a:2687:b0:765:449d:1391 with SMTP id
 c7-20020a05620a268700b00765449d1391mr868033qkp.19.1689231525294; 
 Wed, 12 Jul 2023 23:58:45 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com.
 [209.85.222.170]) by smtp.gmail.com with ESMTPSA id
 y9-20020a37e309000000b00767d47eb29bsm2671592qki.119.2023.07.12.23.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 23:58:45 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-76772fde287so41593185a.2; 
 Wed, 12 Jul 2023 23:58:45 -0700 (PDT)
X-Received: by 2002:a0d:e208:0:b0:56d:9e2:7d9e with SMTP id
 l8-20020a0de208000000b0056d09e27d9emr931586ywe.21.1689231149403; Wed, 12 Jul
 2023 23:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com> <20230712161025.22op3gtzgujrhytb@pengutronix.de>
In-Reply-To: <20230712161025.22op3gtzgujrhytb@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jul 2023 08:52:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuvkxcj05OTfEn5f2p-6e71QEHVjSLWwNFRnR_=WEJVQ@mail.gmail.com>
Message-ID: <CAMuHMdWuvkxcj05OTfEn5f2p-6e71QEHVjSLWwNFRnR_=WEJVQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 13 Jul 2023 07:44:19 +0000
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
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
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
 =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 Dave Airlie <airlied@redhat.com>, linux-mips@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
 Russell King <linux@armlinux.org.uk>, Jani Nikula <jani.nikula@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Mika Kahola <mika.kahola@intel.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 linux-tegra@vger.kernel.org,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
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

Hi Uwe,

Let's add some fuel to keep the thread alive ;-)

On Wed, Jul 12, 2023 at 6:13=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Wed, Jul 12, 2023 at 05:34:28PM +0300, Jani Nikula wrote:
> > On Wed, 12 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix=
.de> wrote:
> > > Hello,
> > >
> > > while I debugged an issue in the imx-lcdc driver I was constantly
> > > irritated about struct drm_device pointer variables being named "dev"
> > > because with that name I usually expect a struct device pointer.
> > >
> > > I think there is a big benefit when these are all renamed to "drm_dev=
".
> > > I have no strong preference here though, so "drmdev" or "drm" are fin=
e
> > > for me, too. Let the bikesheding begin!
> > >
> > > Some statistics:
> > >
> > > $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort | =
uniq -c | sort -n
> > >       1 struct drm_device *adev_to_drm
> > >       1 struct drm_device *drm_
> > >       1 struct drm_device          *drm_dev
> > >       1 struct drm_device        *drm_dev
> > >       1 struct drm_device *pdev
> > >       1 struct drm_device *rdev
> > >       1 struct drm_device *vdev
> > >       2 struct drm_device *dcss_drv_dev_to_drm
> > >       2 struct drm_device **ddev
> > >       2 struct drm_device *drm_dev_alloc
> > >       2 struct drm_device *mock
> > >       2 struct drm_device *p_ddev
> > >       5 struct drm_device *device
> > >       9 struct drm_device * dev
> > >      25 struct drm_device *d
> > >      95 struct drm_device *
> > >     216 struct drm_device *ddev
> > >     234 struct drm_device *drm_dev
> > >     611 struct drm_device *drm
> > >    4190 struct drm_device *dev
> > >
> > > This series starts with renaming struct drm_crtc::dev to drm_dev. If
> > > it's not only me and others like the result of this effort it should =
be
> > > followed up by adapting the other structs and the individual usages i=
n
> > > the different drivers.
> >
> > I think this is an unnecessary change. In drm, a dev is usually a drm
> > device, i.e. struct drm_device *.
>
> Well, unless it's not. Prominently there is
>
>         struct drm_device {
>                 ...
>                 struct device *dev;
>                 ...
>         };
>
> which yields quite a few code locations using dev->dev which is
> IMHO unnecessary irritating:
>
>         $ git grep '\<dev->dev' v6.5-rc1 drivers/gpu/drm | wc -l
>         1633

I find that irritating as well...

Same for e.g. crtc->crtc.

Hence that's why I had sent patches to rename the base members in the
shmob_drm-specific subclasses of drm_{crtc,connector,plane} to "base".
https://lore.kernel.org/dri-devel/b3daca80f82625ba14e3aeaf2fca6dcefa056e47.=
1687423204.git.geert+renesas@glider.be

> Also the functions that deal with both a struct device and a struct
> drm_device often use "dev" for the struct device and then "ddev" for
> the drm_device (see for example amdgpu_device_get_pcie_replay_count()).

I guess you considered "drm_dev", because it is still a short name?
Code dealing with platform devices usually uses "pdev" and "dev".
Same for PCI drivers (despite "pci_dev" being a short name).

So my personal preference goes to "ddev".

EOF (End-of-Fuel ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
