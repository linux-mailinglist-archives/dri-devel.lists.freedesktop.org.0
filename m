Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 454F26AC9E4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 18:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D1010E2EF;
	Mon,  6 Mar 2023 17:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15DE10E2BC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 17:24:25 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id n18so8910703ybm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 09:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678123465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VLf0GM/zB1BCP+zFJSVCu7zgZJrdW9kyzCRHpCeB9cc=;
 b=Crw/174Qdb+vOS7V4/S0vHSfUGwwcMWip7NU22oi8WQKwKtPjhBrZH9RIf4+RX/8ib
 q4rdXXshtLlFEiTR+1Zv82cZTGW+EtYRyJoE85nZ3wy5Mn55xfgNc8TgW350FylSosS2
 9H0UwLBCD+tu1izzsu+4rvkjcMrAO/PG1xPus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678123465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLf0GM/zB1BCP+zFJSVCu7zgZJrdW9kyzCRHpCeB9cc=;
 b=4CfPHAzVTrFNOyUIzcLidjnuC3In9CJvPRziId2xJBeKcVDVPaeBdKopG610qdibrl
 eaZxJSJqrft1SauBwh03yzkfgubFIFEi0P0YVmTTrMo8bBqQN+dB2+K0w8nuGwwZv3t5
 +xEi/a5NqHujrccyDCXwHiB+oXoxPgsoIWU90tWA9hNrOsD3LzrjKVdknuA55ZB4/k6Y
 vTnYYldqNULfST2JJjcwDq879DRGEJ2h9zh4+s3civPf5nAo/+xj0xjVC5zCsmvxiUPU
 uRl0pGOPUs3ejAlmvOqkv+jei4XpB8RekVtGAPcRRpfvwQBXsZHTyehRjNByjqX6bOYS
 iyZw==
X-Gm-Message-State: AO0yUKU1xv8aQ/LN8YtYdpft6xW0XrnXvZ7oq37gMt70BfpwIlwnJD8j
 ycItZwGTG3zC4BbcwhFLldkF/cInGe5QTBtdAy+k6Q==
X-Google-Smtp-Source: AK7set8TsU9xvfr6PQsCevTseZydSOkH/AgeTwrsBLD7Q6/7WzAw6UaZp6GL1E1/ZyxaWECiNOWpuWv2JW3g3jNhlLE=
X-Received: by 2002:a05:6902:cf:b0:a02:a44e:585c with SMTP id
 i15-20020a05690200cf00b00a02a44e585cmr6999792ybs.1.1678123464769; Mon, 06 Mar
 2023 09:24:24 -0800 (PST)
MIME-Version: 1.0
References: <CGME20230303145219eucas1p218c2e302e41464432627c8ac074302f8@eucas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com>
 <79c2e5cc-a488-09ae-dc68-18dbc47d963a@samsung.com>
 <CAMty3ZC1U3eDmtWa_sx0Sop_V1vU3fSM=r21U9qPf0UmCYTOkA@mail.gmail.com>
 <4b2624f6-b904-4daa-29ca-380cc7dbfc45@samsung.com>
In-Reply-To: <4b2624f6-b904-4daa-29ca-380cc7dbfc45@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 6 Mar 2023 22:54:13 +0530
Message-ID: <CAMty3ZDiBERymX=jgM_dtDBbd_rvw9E4Q05ECy+dtpnZa2nkJw@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
To: Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Mon, Mar 6, 2023 at 4:32=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 04.03.2023 19:59, Jagan Teki wrote:
> > On Sat, Mar 4, 2023 at 3:56=E2=80=AFAM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 03.03.2023 15:51, Jagan Teki wrote:
> >>> This series supports common bridge support for Samsung MIPI DSIM
> >>> which is used in Exynos and i.MX8MM SoC's.
> >>>
> >>> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> >>>
> >>> Inki Dae: please note that this series added on top of exynos-drm-nex=
t
> >>> since few exynos dsi changes are not been part of drm-misc-next.
> >>> Request you to pick these via exynos-drm-next, or let me know if you
> >>> have any comments?
> >> I gave it a try on Exynos TM2e and unfortunately it nukes again:
> >>
> >> exynos-drm exynos-drm: bound 13970000.hdmi (ops hdmi_component_ops)
> >> Unable to handle kernel paging request at virtual address 003d454d414e=
5675
> >> ...
> >> [003d454d414e5675] address between user and kernel address ranges
> >> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> >> Modules linked in:
> >> CPU: 4 PID: 9 Comm: kworker/u16:0 Not tainted 6.2.0-next-20230303+ #13=
341
> >> Hardware name: Samsung TM2E board (DT)
> >> Workqueue: events_unbound deferred_probe_work_func
> >> pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> >> pc : drm_connector_list_iter_next+0x58/0x100
> >> lr : drm_connector_list_iter_next+0x2c/0x100
> >> sp : ffff80000bbab910
> >> ...
> >> Call trace:
> >>    drm_connector_list_iter_next+0x58/0x100
> >>    drm_mode_config_reset+0xfc/0x144
> >>    exynos_drm_bind+0x160/0x1b8
> >>    try_to_bring_up_aggregate_device+0x168/0x1d4
> >>    __component_add+0xa8/0x170
> >>    component_add+0x14/0x20
> >>    hdmi_probe+0x3fc/0x6d4
> >>    platform_probe+0x68/0xd8
> >>    really_probe+0x148/0x2b4
> >>    __driver_probe_device+0x78/0xe0
> >>    driver_probe_device+0xd8/0x160
> >>    __device_attach_driver+0xb8/0x138
> >>    bus_for_each_drv+0x84/0xe0
> >>    __device_attach+0xa8/0x1b0
> >>    device_initial_probe+0x14/0x20
> >>    bus_probe_device+0xb0/0xb4
> >>    deferred_probe_work_func+0x8c/0xc8
> >>    process_one_work+0x288/0x6c8
> >>    worker_thread+0x24c/0x450
> >>    kthread+0x118/0x11c
> >>    ret_from_fork+0x10/0x20
> > This looks not related to dsi to me since there is no exynos_drm_dsi
> > call in the trace. look hdmi related. Moreover, I think the exynos dsi
> > worked well on v10 and I couldn't find any potential differences in
> > terms of call flow change.
> > https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>
> Well, the issue is definitely related to this patchset. On Friday, due
> to other kernel messages, I missed the most important part of the log:
>
> [drm] Exynos DRM: using 13800000.decon device for DMA mapping operations
> exynos-drm exynos-drm: bound 13800000.decon (ops decon_component_ops)
> exynos-drm exynos-drm: bound 13880000.decon (ops decon_component_ops)
> exynos-dsi 13900000.dsi: [drm:samsung_dsim_host_attach] Attached s6e3hf2
> device
> exynos-dsi 13900000.dsi: request interrupt failed with -22
> panel-samsung-s6e3ha2: probe of 13900000.dsi.0 failed with error -22
> exynos-drm exynos-drm: bound 13900000.dsi (ops exynos_dsi_component_ops)
> exynos-drm exynos-drm: bound 13930000.mic (ops exynos_mic_component_ops)
>
> It looks that the are at least 2 issues. The first one related to TE
> interrupt registration, the second is broken error path, which should
> free allocated resources and stop DRM from binding/initialization.
>
> This patch fixes the issue (TE gpio/interrupt is optional!):
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c
> index b4a5348b763c..ed83495fe105 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1518,7 +1518,9 @@ static int samsung_dsim_register_te_irq(struct
> samsung_dsim *dsi, struct device
>          int ret;
>
>          dsi->te_gpio =3D devm_gpiod_get_optional(dev, "te", GPIOD_IN);
> -       if (IS_ERR(dsi->te_gpio))
> +       if (!dsi->te_gpio)
> +               return 0;
> +       else if (IS_ERR(dsi->te_gpio))

I think I missed this change from v10 where Marek V commented to move
this in dsim instead of in Exynos. anyway, I will correct this.

>                  return dev_err_probe(dev, PTR_ERR(dsi->te_gpio),
> "failed to get te GPIO\n");
>
>          te_gpio_irq =3D gpiod_to_irq(dsi->te_gpio);
>
>
> The error path in samsung_dsim_host_attach() after
> samsung_dsim_register_te_irq() failure is wrong. It lacks cleaning up
> the allocated resources (removing the bridge, detaing the dsi device).

This is because of the same discussion of moving TE GPIO in dsim instead ex=
ynos.

How about register TE GPIO before calling host attach like this,

--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1598,9 +1598,6 @@ static int samsung_dsim_host_attach(struct
mipi_dsi_host *host,

        drm_bridge_add(&dsi->bridge);

-       if (pdata->host_ops && pdata->host_ops->attach)
-               pdata->host_ops->attach(dsi, device);
-
        /*
         * This is a temporary solution and should be made by more generic =
way.
         *
@@ -1613,6 +1610,9 @@ static int samsung_dsim_host_attach(struct
mipi_dsi_host *host,
                        return ret;
        }

+       if (pdata->host_ops && pdata->host_ops->attach)
+               pdata->host_ops->attach(dsi, device);
+
        dsi->lanes =3D device->lanes;
        dsi->format =3D device->format;
        dsi->mode_flags =3D device->mode_flags;

Would you please check this?

Thanks,
Jagan.
