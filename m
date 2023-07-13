Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CD07521E5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 14:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96DB10E681;
	Thu, 13 Jul 2023 12:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFE910E008;
 Thu, 13 Jul 2023 09:30:14 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-57a8080e4a7so4387507b3.0; 
 Thu, 13 Jul 2023 02:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689240613; x=1691832613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LHmbzhpkJKMYjCs3rLqCEOJxasGkKa4brFmr33oqUxc=;
 b=PbYiOdQqLZ3j4+7dFe+P9YrVjGthohHtnqXYstD6aZXl8dZ7FlJq7lt12kNZq4GUgb
 +3ORzrdDXkDXX8Ig0N9vJlnPJ1HH3Q+PAcTROvVnxbwKuqEX1ziaPwYi4FevPjiviraw
 TzVo6TZpe335q4wzcGyLvPa5S8jT1oSk6qgox5dbThwGq/Bdw6bUmuoeNL+NOZlTKhfE
 VWiF9nUWpWkcqPTQiYIkd0mr6mByRsz8fXsORNvFjnjiHIksIlw74SyjkKH0CNgBO8hZ
 AarQRhRoG3kGwQLFNSm9plmdUKy8pSutpqSrw2YatiCAELNDlbBH6eLB7oK9WymKjl5z
 k/ng==
X-Gm-Message-State: ABy/qLb8+XFKbAI5UMUl402qpsCEeSKCHwxM/ovMvZcgZ2UIrrcrS+gD
 SXCOY+jKPsrmtA5CffE/x+Mr17VBZm+4jALI
X-Google-Smtp-Source: APBJJlHJB5nKRmpRQf1wy06DAHhKrjFe+fy76oeXPoVy1ckSHMOjEV6H7RmFMctufHxNmKGjvZ665w==
X-Received: by 2002:a0d:ca0b:0:b0:577:2340:605f with SMTP id
 m11-20020a0dca0b000000b005772340605fmr1207009ywd.2.1689240613131; 
 Thu, 13 Jul 2023 02:30:13 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 b62-20020a816741000000b0054f56baf3f2sm1668378ywc.122.2023.07.13.02.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 02:30:11 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-c4cb4919bb9so450880276.3; 
 Thu, 13 Jul 2023 02:30:11 -0700 (PDT)
X-Received: by 2002:a0d:ef46:0:b0:56e:1df1:dc58 with SMTP id
 y67-20020a0def46000000b0056e1df1dc58mr1228415ywe.45.1689240610993; Thu, 13
 Jul 2023 02:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com> <20230712161025.22op3gtzgujrhytb@pengutronix.de>
 <878rbkgp4m.fsf@intel.com>
In-Reply-To: <878rbkgp4m.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jul 2023 11:29:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_CvSyF-dFpZwOkQ8PWXWphWxCm2Lwpx8ZXAfWDBafcQ@mail.gmail.com>
Message-ID: <CAMuHMdV_CvSyF-dFpZwOkQ8PWXWphWxCm2Lwpx8ZXAfWDBafcQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
To: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-sunxi@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>, Stylon Wang <stylon.wang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Leo Li <sunpeng.li@amd.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
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
 =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
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
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org,
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

Hi Jani,

On Thu, Jul 13, 2023 at 11:03=E2=80=AFAM Jani Nikula <jani.nikula@intel.com=
> wrote:
> On Wed, 12 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e> wrote:
> > On Wed, Jul 12, 2023 at 05:34:28PM +0300, Jani Nikula wrote:
> >> On Wed, 12 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutroni=
x.de> wrote:
> >> > while I debugged an issue in the imx-lcdc driver I was constantly
> >> > irritated about struct drm_device pointer variables being named "dev=
"
> >> > because with that name I usually expect a struct device pointer.
> >> >
> >> > I think there is a big benefit when these are all renamed to "drm_de=
v".
> >> > I have no strong preference here though, so "drmdev" or "drm" are fi=
ne
> >> > for me, too. Let the bikesheding begin!
> >> >
> >> > Some statistics:
> >> >
> >> > $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort |=
 uniq -c | sort -n
> >> >       1 struct drm_device *adev_to_drm
> >> >       1 struct drm_device *drm_
> >> >       1 struct drm_device          *drm_dev
> >> >       1 struct drm_device        *drm_dev
> >> >       1 struct drm_device *pdev
> >> >       1 struct drm_device *rdev
> >> >       1 struct drm_device *vdev
> >> >       2 struct drm_device *dcss_drv_dev_to_drm
> >> >       2 struct drm_device **ddev
> >> >       2 struct drm_device *drm_dev_alloc
> >> >       2 struct drm_device *mock
> >> >       2 struct drm_device *p_ddev
> >> >       5 struct drm_device *device
> >> >       9 struct drm_device * dev
> >> >      25 struct drm_device *d
> >> >      95 struct drm_device *
> >> >     216 struct drm_device *ddev
> >> >     234 struct drm_device *drm_dev
> >> >     611 struct drm_device *drm
> >> >    4190 struct drm_device *dev
> >> >
> >> > This series starts with renaming struct drm_crtc::dev to drm_dev. If
> >> > it's not only me and others like the result of this effort it should=
 be
> >> > followed up by adapting the other structs and the individual usages =
in
> >> > the different drivers.
> >>
> >> I think this is an unnecessary change. In drm, a dev is usually a drm
> >> device, i.e. struct drm_device *.
> >
> > Well, unless it's not. Prominently there is
> >
> >       struct drm_device {
> >               ...
> >               struct device *dev;
> >               ...
> >       };
> >
> > which yields quite a few code locations using dev->dev which is
> > IMHO unnecessary irritating:
> >
> >       $ git grep '\<dev->dev' v6.5-rc1 drivers/gpu/drm | wc -l
> >       1633
> >
> > Also the functions that deal with both a struct device and a struct
> > drm_device often use "dev" for the struct device and then "ddev" for
> > the drm_device (see for example amdgpu_device_get_pcie_replay_count()).
>
> Why is specifically struct drm_device *dev so irritating to you?
>
> You lead us to believe it's an outlier in kernel, something that goes
> against common kernel style, but it's really not:
>
> $ git grep -how "struct [A-Za-z0-9_]\+ \*dev" | sort | uniq -c | sort -rn=
 | head -20
>   38494 struct device *dev
>   16388 struct net_device *dev
>    4184 struct drm_device *dev
>    2780 struct pci_dev *dev
>    1916 struct comedi_device *dev
>    1510 struct mlx5_core_dev *dev
>    1057 struct mlx4_dev *dev
>     894 struct b43_wldev *dev
>     762 struct input_dev *dev
>     623 struct usbnet *dev
>     561 struct mlx5_ib_dev *dev
>     525 struct mt76_dev *dev
>     465 struct mt76x02_dev *dev
>     435 struct platform_device *dev
>     431 struct usb_device *dev
>     411 struct mt7915_dev *dev
>     398 struct cx231xx *dev
>     378 struct mei_device *dev
>     363 struct ksz_device *dev
>     359 struct mthca_dev *dev
>
> A good portion of the above also have a dev member.

Not all of them access both the foo_device and the device pointers.

Let's put the number of 435 platform_device pointers named "dev"
into perspective:

    10095 struct platform_device *pdev

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
