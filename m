Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D39D64B639
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 14:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEACB10E313;
	Tue, 13 Dec 2022 13:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AB910E313
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 13:31:30 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3b56782b3f6so190986497b3.13
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 05:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hxHqQaQZ5w2vv77RAQDRtZk1hHRxs4xh8uv5mFHlHKk=;
 b=T1BLMYiZLAsBmIdUnQNHie+D8kICgNfUgtv/P0inTXR7TxzJr1vAyTFCE2xPfWtwOJ
 FrYKNnvU8N+dLp6Scf/6xU2+z9AUh0ppzKOfuYD05R1m16z0Kel+9WZL/ShWCn7Qsafq
 4tB6WHTNVBfFZ4POmGPn9Trdu4gtzYTMiEVr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hxHqQaQZ5w2vv77RAQDRtZk1hHRxs4xh8uv5mFHlHKk=;
 b=e3Bz9bC5+5gvU05aqJa3i7e02l+iCfdp77Ek3ugILBz4f/Fat1EHfIBgPPsglSmbf0
 cEW87MVWruIR6QqbTlYPO7T+EA9ukHYg7u6LhZfZlPkxNtQEs+UgJw9c8xIDHIuiMJph
 LqgBHE6Af0EMknWeGpgqzcTXYH1HmrHtfYYU5PacLWB/p0D/tlfrXikd9VXBOuiTP5p3
 Tq48VTFS1/1LwL0HUI8P9M1r4Tx6mI/cPY533XQWYZzyxNAGvt6ibtYVb2SghLg48uNk
 w1eWaKFk3ej1ASEXB2GeFc3Wnl+lHnxqaz50UXxmTRQRhRIIH0dq5Zy6JmvfGLbf6Rdl
 75XQ==
X-Gm-Message-State: ANoB5pkIxiF0N9i11QK+WXYXRuG0WnJ1T9oXmOj0ItRvvrbXIpSqBbPf
 ejEwHjR+UL3QnQVhQW+H86hc6Ms2Dc835eXEUHlWYA==
X-Google-Smtp-Source: AA0mqf6f7vunebOO8FhwJEuAHaYwQnNN8qZJWeONm2RwxXRLUJekqkeh3ysVt10MrzDoKGkFqEkvQTiX2TEB9N7sHT0=
X-Received: by 2002:a81:9a13:0:b0:398:ab7a:aba9 with SMTP id
 r19-20020a819a13000000b00398ab7aaba9mr21081470ywg.106.1670938289746; Tue, 13
 Dec 2022 05:31:29 -0800 (PST)
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
In-Reply-To: <c3f0c5c2-aae8-dc39-be02-dc4dfd0e7073@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 13 Dec 2022 19:01:18 +0530
Message-ID: <CAMty3ZBjW=tdd9_zTAAwVmh0vD4oAwSnngJNkFz7F2ns9XtJNA@mail.gmail.com>
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
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

On Tue, Dec 13, 2022 at 5:50 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi,
>
> On 13.12.2022 11:40, Jagan Teki wrote:
> > On Tue, Dec 13, 2022 at 2:28 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 12.12.2022 16:33, Jagan Teki wrote:
> >>
> >> On Mon, Dec 12, 2022 at 8:52 PM Marek Szyprowski
> >> <m.szyprowski@samsung.com> wrote:
> >>
> >> On 12.12.2022 09:43, Marek Szyprowski wrote:
> >>
> >> On 12.12.2022 09:32, Jagan Teki wrote:
> >>
> >> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
> >> <m.szyprowski@samsung.com> wrote:
> >>
> >> Hi Jagan,
> >>
> >> On 09.12.2022 16:23, Jagan Teki wrote:
> >>
> >> The existing drm panels and bridges in Exynos required host
> >> initialization during the first DSI command transfer even though
> >> the initialization was done before.
> >>
> >> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
> >> flag and triggers from host transfer.
> >>
> >> Do this exclusively for Exynos.
> >>
> >> Initial logic is derived from Marek Szyprowski changes.
> >>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >> ---
> >> Changes from v9:
> >> - derived from v8
> >> - added comments
> >>
> >>     drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
> >>     include/drm/bridge/samsung-dsim.h     |  5 +++--
> >>     2 files changed, 17 insertions(+), 3 deletions(-)
> >>
> >> The following chunk is missing compared to v8:
> >>
> >> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >> index 6e9ad955ebd3..6a9403cb92ae 100644
> >> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
> >> *dsi, unsigned int flag)
> >>                    return 0;
> >>
> >>            samsung_dsim_reset(dsi);
> >> -       samsung_dsim_enable_irq(dsi);
> >> +
> >> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
> >> +               samsung_dsim_enable_irq(dsi);
> >>
> >> Is this really required? does it make sure that the IRQ does not
> >> enable twice?
> >>
> >> That's what that check does. Without the 'if (!(dsi->state &
> >> DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first
> >> from pre_enable, then from the first transfer), what leads to a
> >> warning from irq core.
> >>
> >> I've just noticed that we also would need to clear the
> >> DSIM_STATE_REINITIALIZED flag in dsim_suspend.
> >>
> >> However I've found that a bit simpler patch would keep the current cod=
e
> >> flow for Exynos instead of this reinitialization hack. This can be
> >> applied on the "[PATCH v9 09/18] drm: bridge: samsung-dsim: Add host
> >> init in pre_enable" patch:
> >>
> >> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >> index 0b2e52585485..acc95c61ae45 100644
> >> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >> @@ -1291,9 +1291,11 @@ static void samsung_dsim_atomic_pre_enable(stru=
ct
> >> drm_bridge *bridge,
> >>
> >>           dsi->state |=3D DSIM_STATE_ENABLED;
> >>
> >> -       ret =3D samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> >> -       if (ret)
> >> -               return;
> >> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> >> +               ret =3D samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED)=
;
> >> +               if (ret)
> >> +                       return;
> >> +       }
> >>
> >> Sorry, I don't understand this. Does it mean Exynos doesn't need to
> >> init host in pre_enable? If I remember correctly even though the host
> >> is initialized it has to reinitialize during the first transfer - This
> >> is what the Exynos requirement is. Please correct or explain here.
> >>
> >> This is a matter of enabling power regulator(s) in the right order and=
 doing the host initialization in the right moment. It was never a matter o=
f re-initialization. See the current code for the reference (it uses the sa=
me approach as my above change). I've already explained that here:
> >>
> >> https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsu=
ng.com/
> >>
> >> If you would like to see the exact proper moment of the dsi host initi=
alization on the Exynos see the code here:
> >>
> >> https://protect2.fireeye.com/v1/url?k=3D5dc33900-0258001f-5dc2b24f-000=
babdfecba-f7c1a2a1905c83ca&q=3D1&e=3Df086bfdb-9055-48bd-b9c2-5dffb6c0d558&u=
=3Dhttps%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv5.18-next-20220511=
-dsi-rework and patches adding mipi_dsi_host_init() to panel/bridge drivers=
.
> > As I said before, the downstream bridge needs an explicit call to host
> > init via mipi_dsi_host_init - this is indeed not a usual use-case
> > scenario. Let's handle this with a REINIT fix and see if we can update
> > this later to handle both scenarios.
> >
> > Would you please test this repo, I have included all.
> >
> > https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>
> This doesn't work on TM2e board. Give me some time to find why...

May be some mode_flags changes in the panel driver.

Jagan.
