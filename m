Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9315B64B82E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 16:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF07810E32C;
	Tue, 13 Dec 2022 15:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517FC10E32C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 15:15:55 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id f16so3590253ljc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 07:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eMo/49SaZCr5bY5dEy1V4XeV7XVkvCkFy4zJplu4KmI=;
 b=GWMJw2jrBIUWpPIP2C5YC8s1Pj9Z3MsJTgkY8oE1wXhdtpDJ9SUeOBmQpxOFk2xxwp
 FHJ4IEvhvtiXtWqzuhdBWQsodg4pMGJLAcpwbqwyhmP+iEzr26bfFluMT0wJXQimgrHD
 Vzya6ns+X0DWRao2LFTMUc4wT4x81aOusOr6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eMo/49SaZCr5bY5dEy1V4XeV7XVkvCkFy4zJplu4KmI=;
 b=2MsxrKUeTVyzLWjibICfFLLwpD/iV6pws7AyxcD+hycQJldl8s+7uBnSIavxZsP75p
 A/p/TvTUnsiVUm0HQG5Ixa2eRCvs1JmXm4Q2qrD1muTlkIe01G3l2ig1wNlKx/3lknig
 5z+yZh8QiNmZouvrE5qOeWv1kkCHgOAXS8DMHuQdjDLN5eiENULluOVEysOK21ZDKUc6
 ye3SeKQl5+4pZAXM+zeteVDqC2rZt54JBD0ya6cFzIn//s4ThkcTfUiJC47d9uErHm+P
 DE20qQx3/tZX5ccTF7ew1IbYr2NIADGy2XvquX9Qo5jq8n4zUq0b3TxrA3LHd3Kq6V3v
 7GYA==
X-Gm-Message-State: ANoB5pmACXCTkt8Of3CFW0sM97mmUkUAYysKf7KuColH+99LqNlhTa6U
 Jm1ZViqxsxPuMlHxle/buCIcsezQFFpdFu0LfiUkhA==
X-Google-Smtp-Source: AA0mqf6sHXgEoTuAsRthwAxlg4MSMhUio2oflqDXTzWyrxlaai0+sp1MFV/prm/ixCz18HowH3Sm15guTn2/euSw1IY=
X-Received: by 2002:a2e:b5d5:0:b0:27a:37c:cd59 with SMTP id
 g21-20020a2eb5d5000000b0027a037ccd59mr6235606ljn.157.1670944553315; Tue, 13
 Dec 2022 07:15:53 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com>
 <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com>
 <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
 <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
 <395a4762-70fe-1caf-579f-2b5952232470@samsung.com>
 <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
 <c3f0c5c2-aae8-dc39-be02-dc4dfd0e7073@samsung.com>
 <3ce9def4-9fdf-0bde-fd2c-3a8755ebdf9d@samsung.com>
 <CAMty3ZAqfhV4b69GthcEzBOgpYSJ0yziZcpFC2oGyySWOu-tkA@mail.gmail.com>
 <17f7772b-ca46-53b8-5bf9-98d3242fa703@samsung.com>
In-Reply-To: <17f7772b-ca46-53b8-5bf9-98d3242fa703@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 13 Dec 2022 20:45:40 +0530
Message-ID: <CAMty3ZC0Ca5yt4jFHi0KtcEszzRs1KrUTF2SqYizMF+1NYPAUQ@mail.gmail.com>
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
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
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 13, 2022 at 8:24 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 13.12.2022 15:18, Jagan Teki wrote:
> > On Tue, Dec 13, 2022 at 7:31 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 13.12.2022 13:20, Marek Szyprowski wrote:
> >>> On 13.12.2022 11:40, Jagan Teki wrote:
> >>>> On Tue, Dec 13, 2022 at 2:28 PM Marek Szyprowski
> >>>> <m.szyprowski@samsung.com> wrote:
> >>>>> On 12.12.2022 16:33, Jagan Teki wrote:
> >>>>>
> >>>>> On Mon, Dec 12, 2022 at 8:52 PM Marek Szyprowski
> >>>>> <m.szyprowski@samsung.com> wrote:
> >>>>>
> >>>>> On 12.12.2022 09:43, Marek Szyprowski wrote:
> >>>>>
> >>>>> On 12.12.2022 09:32, Jagan Teki wrote:
> >>>>>
> >>>>> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
> >>>>> <m.szyprowski@samsung.com> wrote:
> >>>>>
> >>>>> Hi Jagan,
> >>>>>
> >>>>> On 09.12.2022 16:23, Jagan Teki wrote:
> >>>>>
> >>>>> The existing drm panels and bridges in Exynos required host
> >>>>> initialization during the first DSI command transfer even though
> >>>>> the initialization was done before.
> >>>>>
> >>>>> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
> >>>>> flag and triggers from host transfer.
> >>>>>
> >>>>> Do this exclusively for Exynos.
> >>>>>
> >>>>> Initial logic is derived from Marek Szyprowski changes.
> >>>>>
> >>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>>>> ---
> >>>>> Changes from v9:
> >>>>> - derived from v8
> >>>>> - added comments
> >>>>>
> >>>>>      drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
> >>>>>      include/drm/bridge/samsung-dsim.h     |  5 +++--
> >>>>>      2 files changed, 17 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> The following chunk is missing compared to v8:
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> index 6e9ad955ebd3..6a9403cb92ae 100644
> >>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
> >>>>> *dsi, unsigned int flag)
> >>>>>                     return 0;
> >>>>>
> >>>>>             samsung_dsim_reset(dsi);
> >>>>> -       samsung_dsim_enable_irq(dsi);
> >>>>> +
> >>>>> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
> >>>>> +               samsung_dsim_enable_irq(dsi);
> >>>>>
> >>>>> Is this really required? does it make sure that the IRQ does not
> >>>>> enable twice?
> >>>>>
> >>>>> That's what that check does. Without the 'if (!(dsi->state &
> >>>>> DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first
> >>>>> from pre_enable, then from the first transfer), what leads to a
> >>>>> warning from irq core.
> >>>>>
> >>>>> I've just noticed that we also would need to clear the
> >>>>> DSIM_STATE_REINITIALIZED flag in dsim_suspend.
> >>>>>
> >>>>> However I've found that a bit simpler patch would keep the current code
> >>>>> flow for Exynos instead of this reinitialization hack. This can be
> >>>>> applied on the "[PATCH v9 09/18] drm: bridge: samsung-dsim: Add host
> >>>>> init in pre_enable" patch:
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> index 0b2e52585485..acc95c61ae45 100644
> >>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>> @@ -1291,9 +1291,11 @@ static void
> >>>>> samsung_dsim_atomic_pre_enable(struct
> >>>>> drm_bridge *bridge,
> >>>>>
> >>>>>            dsi->state |= DSIM_STATE_ENABLED;
> >>>>>
> >>>>> -       ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> >>>>> -       if (ret)
> >>>>> -               return;
> >>>>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> >>>>> +               ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> >>>>> +               if (ret)
> >>>>> +                       return;
> >>>>> +       }
> >>>>>
> >>>>> Sorry, I don't understand this. Does it mean Exynos doesn't need to
> >>>>> init host in pre_enable? If I remember correctly even though the host
> >>>>> is initialized it has to reinitialize during the first transfer - This
> >>>>> is what the Exynos requirement is. Please correct or explain here.
> >>>>>
> >>>>> This is a matter of enabling power regulator(s) in the right order
> >>>>> and doing the host initialization in the right moment. It was never
> >>>>> a matter of re-initialization. See the current code for the
> >>>>> reference (it uses the same approach as my above change). I've
> >>>>> already explained that here:
> >>>>>
> >>>>> https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com/
> >>>>>
> >>>>>
> >>>>> If you would like to see the exact proper moment of the dsi host
> >>>>> initialization on the Exynos see the code here:
> >>>>>
> >>>>> https://protect2.fireeye.com/v1/url?k=5dc33900-0258001f-5dc2b24f-000babdfecba-f7c1a2a1905c83ca&q=1&e=f086bfdb-9055-48bd-b9c2-5dffb6c0d558&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv5.18-next-20220511-dsi-rework
> >>>>> and patches adding mipi_dsi_host_init() to panel/bridge drivers.
> >>>> As I said before, the downstream bridge needs an explicit call to host
> >>>> init via mipi_dsi_host_init - this is indeed not a usual use-case
> >>>> scenario. Let's handle this with a REINIT fix and see if we can update
> >>>> this later to handle both scenarios.
> >>>>
> >>>> Would you please test this repo, I have included all.
> >>>>
> >>>> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
> >>> This doesn't work on TM2e board. Give me some time to find why...
> >>>
> >> The following change is missing in "drm: bridge: Generalize Exynos-DSI
> >> driver into a Samsung DSIM bridge" patch:
> >>
> >> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >> index 1dbff2bee93f..81828b5ee0ac 100644
> >> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >> @@ -1745,6 +1745,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
> >>           dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
> >>           dsi->bridge.of_node = dev->of_node;
> >>           dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> >> +       dsi->bridge.pre_enable_prev_first = true;
> > Can you check this and confirm, I keep this in exynos side.
> > https://gitlab.com/openedev/kernel/-/commit/ccb02df7a313fdf91d8e116b0ec3d6c945fbb6fd#c93f0ce4d81b854fbde970e341fb307f1be78c16_1865_189
>
> This one is fine!
>
> >>           /* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts
> >> HS/VS/DE */
> >>           if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
> >>
> >>
> >> After adding the above, all my test platform works fine.
> >>
> >> BTW, I still think that it is worth replacing the "drm: exynos: dsi: Add
> >> host initialization in pre_enable" patch with the following simple
> >> change and propagate it to bridge/samsung-dsim.c:
> >>
> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >> index fdaf514b39f2..071b74d60dcb 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >> @@ -254,6 +254,9 @@ struct exynos_dsi_transfer {
> >>    #define DSIM_STATE_CMD_LPM             BIT(2)
> >>    #define DSIM_STATE_VIDOUT_AVAILABLE    BIT(3)
> >>
> >> +#define exynos_dsi_hw_is_exynos(hw) \
> >> +       ((hw) >= DSIM_TYPE_EXYNOS3250 && (hw) <= DSIM_TYPE_EXYNOS5433)
> >> +
> >>    enum exynos_dsi_type {
> >>           DSIM_TYPE_EXYNOS3250,
> >>           DSIM_TYPE_EXYNOS4210,
> >> @@ -1344,6 +1347,9 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
> >>    {
> >>           const struct exynos_dsi_driver_data *driver_data =
> >> dsi->driver_data;
> >>
> >> +       if (dsi->state & DSIM_STATE_INITIALIZED)
> >> +               return 0;
> >> +
> >>           exynos_dsi_reset(dsi);
> >>           exynos_dsi_enable_irq(dsi);
> >>
> >> @@ -1356,6 +1362,8 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
> >>           exynos_dsi_set_phy_ctrl(dsi);
> >>           exynos_dsi_init_link(dsi);
> >>
> >> +       dsi->state |= DSIM_STATE_INITIALIZED;
> >> +
> >>           return 0;
> >>    }
> >>
> >> @@ -1411,6 +1419,12 @@ static void exynos_dsi_atomic_pre_enable(struct
> >> drm_bridge *bridge,
> >>           }
> >>
> >>           dsi->state |= DSIM_STATE_ENABLED;
> >> +
> >> +       if (!exynos_dsi_hw_is_exynos(dsi->plat_data->hw_type)) {
> >> +               ret = exynos_dsi_init(dsi);
> >> +               if (ret)
> >> +                       return;
> >> +       }
> >>    }
> >>
> >>    static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
> >> @@ -1557,12 +1571,9 @@ static ssize_t exynos_dsi_host_transfer(struct
> >> mipi_dsi_host *host,
> >>           if (!(dsi->state & DSIM_STATE_ENABLED))
> >>                   return -EINVAL;
> >>
> >> -       if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
> >> -               ret = exynos_dsi_init(dsi);
> >> -               if (ret)
> >> -                       return ret;
> >> -               dsi->state |= DSIM_STATE_INITIALIZED;
> >> -       }
> >> +       ret = exynos_dsi_init(dsi);
> >> +       if (ret)
> >> +               return ret;
> > Below patch handling similar behavior by checking exynos hw_type at
> > exynos_dsi_init, isn't it? Please check and let me know if I missing
> > anything.
> >
> > https://gitlab.com/openedev/kernel/-/commit/d19d491eef92b92e12a26265697274ce666eddb5
>
> You don't miss anything. Your version also works, but I just proposed a
> bit simpler code.

Do your changes don't need a DSIM_STATE_REINITIALIZED flag? would you
please share the change on top of this commit?
https://gitlab.com/openedev/kernel/-/commit/d19d491eef92b92e12a26265697274ce666eddb5

Jagan.
