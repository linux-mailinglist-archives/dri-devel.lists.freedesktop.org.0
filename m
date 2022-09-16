Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152815BAA2B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 12:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFD910E24E;
	Fri, 16 Sep 2022 10:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40CB10E24E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 10:21:28 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a26so19667486ejc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=bgyTfSPs15BYOFctsAEjk6GBf6vA5wztTclONn8BlTQ=;
 b=FTLAsVNRDiN86VLt6pJsc2RLppFeS/Y4bAKORl3pNOLjVUaaoHSVGcy6s+V9Fi3tCX
 e93Q9dDSCEmmxPrHwVRetk0NwNDA4lHJZu/pp0o20QuvLsLfvPZty70AiHDPAR2QxFqV
 QfvVCYQx//6E9j4xbTuQd0gNnGSLYQ10sR31E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=bgyTfSPs15BYOFctsAEjk6GBf6vA5wztTclONn8BlTQ=;
 b=VMRlw1/B2SMnDTgPZ12F6V9yLzprl4Ld6aOJJkmYnB103gwjplbWAPrdqvn3V0ZExa
 vnvEVD/1ISRkF+sMeR2xlOPGrSs14mVV6AFYXKMl7Fd7xptF0Y6VGyofMHdn0LbJB05a
 C4f1/6tOT7Epr/Phpx/Lwy/0OjHs1jtZWtoWjbtIzqUECSfhv2ap7rAvUW2Zg9eY1QA0
 QnLJa2HOB3q+OgRzAXuOYg5VxGQNM0eCT4aMiBpLswY5taM8lC4Q/0nlFhhQm3z8wVKX
 gA5WrwSrmlQpd4NfNTA0NV+y4z/kcWuBRyaeXnQf5zxA1XmyrqBS2MIRl0KwHis2k1U4
 yGJg==
X-Gm-Message-State: ACrzQf32EawXiY27+NeP1G7fcxz6R3E54CAKXEuPOEydQluIIMd5G/IW
 9fCP6fOX66hWYvUS06tT52mnUfI99rDo19HpxFAObQ==
X-Google-Smtp-Source: AMsMyM5xQmkpki7GOio2ZftaWm3321RUeznt1y3SLQ4TMb11r9B/b+KoDCzqORKnGSyq3gCrqLILVRDMVvkKiKpdCF0=
X-Received: by 2002:a17:907:7ea6:b0:77a:c72a:b851 with SMTP id
 qb38-20020a1709077ea600b0077ac72ab851mr3216253ejc.220.1663323687253; Fri, 16
 Sep 2022 03:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
 <CGME20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180@eucas1p2.samsung.com>
 <20220829184031.1863663-3-jagan@amarulasolutions.com>
 <7511aa28-a944-d241-5bea-8404008e7dce@samsung.com>
 <d750a140-c87e-16af-7683-22d48f68305a@samsung.com>
 <CAMty3ZBVrRa9VHDpGBM_r9gdU=Ex4iwpSHjzcOdxSBrwRrHF2A@mail.gmail.com>
 <473e88ee-1866-49ca-4a43-17a378e6fe47@samsung.com>
 <CAMty3ZAVV_dLnkBsgBCYgNbVNE-hMFiORqv7AxkDpwciJawtzw@mail.gmail.com>
 <92cfa300-0cf8-0040-f99b-59b3d9a1c2be@samsung.com>
 <CAMty3ZA7T2KiRpK_yWHOR57=T3UthNJxx=VyiHVep+sQVcCjvQ@mail.gmail.com>
 <988875db-c777-d93b-fdc7-780fa0cb31fe@samsung.com>
In-Reply-To: <988875db-c777-d93b-fdc7-780fa0cb31fe@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 16 Sep 2022 15:51:16 +0530
Message-ID: <CAMty3ZB8Nt6Q5nDJQEj33YouyWZqVA9jB=9JA0usLt+c-+0SQg@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] drm: bridge: Add Samsung DSIM bridge driver
To: Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Matteo Lisi <matteo.lisi@engicam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 16, 2022 at 1:58 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 14.09.2022 11:39, Jagan Teki wrote:
> > On Wed, Sep 14, 2022 at 2:51 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 13.09.2022 19:29, Jagan Teki wrote:
> >>> On Wed, Sep 7, 2022 at 3:34 PM Marek Szyprowski
> >>> <m.szyprowski@samsung.com> wrote:
> >>>> On 06.09.2022 21:07, Jagan Teki wrote:
> >>>>> On Mon, Sep 5, 2022 at 4:54 PM Marek Szyprowski
> >>>>> <m.szyprowski@samsung.com> wrote:
> >>>>>> On 02.09.2022 12:47, Marek Szyprowski wrote:
> >>>>>>> On 29.08.2022 20:40, Jagan Teki wrote:
> >>>>>>>> Samsung MIPI DSIM controller is common DSI IP that can be used in
> >>>>>>>> various
> >>>>>>>> SoCs like Exynos, i.MX8M Mini/Nano.
> >>>>>>>>
> >>>>>>>> In order to access this DSI controller between various platform SoCs,
> >>>>>>>> the ideal way to incorporate this in the drm stack is via the drm bridge
> >>>>>>>> driver.
> >>>>>>>>
> >>>>>>>> This patch is trying to differentiate platform-specific and bridge
> >>>>>>>> driver
> >>>>>>>> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
> >>>>>>>> glue code and samsung-dsim.c as a common bridge driver code.
> >>>>>>>>
> >>>>>>>> - Exynos specific glue code is exynos specific te_irq, host_attach, and
> >>>>>>>>       detach code along with conventional component_ops.
> >>>>>>>>
> >>>>>>>> - Samsung DSIM is a bridge driver which is common across all
> >>>>>>>> platforms and
> >>>>>>>>       the respective platform-specific glue will initialize at the end
> >>>>>>>> of the
> >>>>>>>>       probe. The platform-specific operations and other glue calls will
> >>>>>>>> invoke
> >>>>>>>>       on associate code areas.
> >>>>>>>>
> >>>>>>>> v4:
> >>>>>>>> * include Inki Dae in MAINTAINERS
> >>>>>>>> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> >>>>>>> This breaks Exynos DRM completely as the Exynos DRM driver is not able
> >>>>>>> to wait until the DSI driver is probed and registered as component.
> >>>>>>>
> >>>>>>> I will show how to rework this the way it is done in
> >>>>>>> drivers/gpu/drm/exynos/exynos_dp.c and
> >>>>>>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c soon...
> >>>>>> I've finally had some time to implement such approach, see
> >>>>>> https://protect2.fireeye.com/v1/url?k=c5d024d9-a4ab8e4e-c5d1af96-74fe4860001d-625a8324a9797375&q=1&e=489b94d4-84fb-408e-b679-a8d27acf2930&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv6.0-dsi-v4-reworked
> >>>>>>
> >>>>>> If you want me to send the patches against your v4 patchset, let me
> >>>>>> know, but imho my changes are much more readable after squashing to the
> >>>>>> original patches.
> >>>>>>
> >>>>>> Now the driver is fully multi-arch safe and ready for further
> >>>>>> extensions. I've removed the weak functions, reworked the way the
> >>>>>> plat_data is used (dropped the patch related to it) and restored
> >>>>>> exynos-dsi driver as a part of the Exynos DRM drivers/subsystem. Feel
> >>>>>> free to resend the above as v5 after testing on your hardware. At least
> >>>>>> it properly works now on all Exynos boards I have, both compiled into
> >>>>>> the kernel or as modules.
> >>>>> Thanks. I've seen the repo added on top of Dave patches - does it mean
> >>>>> these depends on Dave changes as well?
> >>>> Yes and no. My rework doesn't change anything with this dependency. It
> >>>> comes from my patch "drm: exynos: dsi: Restore proper bridge chain
> >>>> order" already included in your series (patch #1). Without it exynos-dsi
> >>>> driver hacks the list of bridges to ensure the order of pre_enable calls
> >>>> needed for proper operation. This works somehow with DSI panels on my
> >>>> test systems, but it has been reported that it doesn't work with a bit
> >>>> more complex display pipelines. Only that patch depends on the Dave's
> >>>> patches. If you remove it, you would need to adjust the code in the
> >>>> exynos_drm_dsi.c and samsung-dsim.c respectively. imho it would be
> >>>> better to keep it and merge Dave's patches together with dsi changes, as
> >>>> they are the first real client of it.
> >>> I think the Dave patches especially "drm/bridge: Introduce
> >>> pre_enable_upstream_first to alter bridge init order" seems not 100%
> >>> relevant to this series as they affect bridge chain call flow
> >>> globally. Having a separate series for that makes sense to me. I'm
> >>> sending v5 by excluding those parts.
> >> If so then drop the "drm: exynos: dsi: Restore proper bridge chain
> >> order" patch and adjust code respectively in samsung-dsim.c. Without the
> >> Dave's patches, that one doesn't make sense.
> > Doesn't it break Exynos?
>
> No it won't. Lack of the "drm: exynos: dsi: Restore proper bridge chain
> order" patch doesn't change much against the current state of the driver.
>
> Here is my rework of your v4 patchset without the mentioned patch and
> Dave's patches:
>
> https://github.com/mszyprow/linux/tree/v6.0-dsi-v4-reworked-minimal

We have one problem with getting bus format from previous bridge if we
pass NULL in bridge_func.attach()
https://github.com/mszyprow/linux/commit/0fa57e33b3bf866efc4c17ab20eec28d6e07b3e9#diff-3fe873f1ada5f1dfcf2a50ac114bdab3ea7b026d12278648ca40809d3fa1a331R1321

Booting the video as it assigns default bus format if the previous bus
format is unknown.

[    1.635984] samsung-dsim 32e10000.dsi:
[drm:samsung_dsim_host_attach] Attached sn65dsi83 device
[    1.648067] [drm] Initialized mxsfb-drm 1.0.0 20160824 for
32e00000.lcdif on minor 0
[    1.658726] mmc0: SDHCI controller on 30b40000.mmc [30b40000.mmc]
using ADMA
[    1.681893] sn65dsi83 3-002c: Unsupported LVDS bus format 0x100a,
please check output bridge driver. Falling back to SPWG24.

Does passing the bridge to drm_bridge_attach is working on your platform?
return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge, flags);

Thanks,
Jagan.
