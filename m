Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479897047B4
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 10:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCFD10E320;
	Tue, 16 May 2023 08:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122E810E320
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:25:21 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-55a20a56a01so239119497b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 01:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684225520; x=1686817520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Xo3t6EtqmIthrprYRpSgcUeeyfiYcd11CO7AIyEdOM=;
 b=JUUbr9NEB4qwoLKBk5/71k/n13gkgHLV6DwoKB/PT7PLX0ceLnDFeZsnvBB8ftUt9m
 HXcvvLJhadir0Up20KLdn7y5EfFtFZLzqdCF0h+t5MDb+hX8YaOMnLPyTM4kdCDLYZC6
 ce8zkT4za3RA8dAwDQzu0sUCBZyiguT2LQ9Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684225520; x=1686817520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Xo3t6EtqmIthrprYRpSgcUeeyfiYcd11CO7AIyEdOM=;
 b=F+9p6dNari8DRz2In5GassnarXkaAtcFMxGsCel7YGTn7bqRDheGz2r+BPoRPbQBJV
 oWq3PxSb3COyzh7Jhs5xC9cke0/2FEFhM02krg62zdevuk0NA2RgotiHU+aS4IXi+rzh
 An89Cna3pIPEcNAdWG8XzjzVpaw83/leFc9H2I8kv6G7pC15opG5xJ7VWmkI4BZCP5rq
 RYa7NJpkv5e8q9HnMyGI2U0iGX4iqmdffflfm5vy0bnUx7YN3zI0bs/6yPEMR9py7lig
 bgY6xIJ0QZAdw+zJgRFTk2xLmk8e1MfalekgfoLJa40ePrXX1/Uk/TmqMAaOicJwA+41
 B8Dg==
X-Gm-Message-State: AC+VfDw38Iv2mX6l8+PJlCSj56k5/gOPrBESaFie2dc9108bvab2ZIqX
 MSV5ofKVeRUtkE3ZYU+4hr2Z9lmcw8EBfaqzaO7yNg==
X-Google-Smtp-Source: ACHHUZ4J6iP0LN5Jw0VmSCf8vyYacYGKM2I0zqVv1whEfPCs4wGS+PuzyoQ0UKJgVXQjyEmV1Vt+rAP+tBZL0pXnqrY=
X-Received: by 2002:a0d:ea06:0:b0:55a:e109:89b8 with SMTP id
 t6-20020a0dea06000000b0055ae10989b8mr30640059ywe.24.1684225520537; Tue, 16
 May 2023 01:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230513201030.514861-1-marex@denx.de>
 <CAMty3ZCYCzawWuEGUWhsxSmuMORoeij=VEGGhn0-yRaQ7_1_uA@mail.gmail.com>
 <62a849cf-46f4-b01b-15b7-6b2bafe2972f@denx.de>
In-Reply-To: <62a849cf-46f4-b01b-15b7-6b2bafe2972f@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 16 May 2023 13:55:09 +0530
Message-ID: <CAMty3ZC76XV-WP4w9CxOZ5KE3w9_FVMXTdqkfi0JJ0FsLQr3gQ@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: dw-mipi-dsi: Drop panel_bridge post_disable
 call
To: Marek Vasut <marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 1:47=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 5/16/23 10:12, Jagan Teki wrote:
> > Hi Marek and Neil,
> >
> > On Sun, May 14, 2023 at 1:40=E2=80=AFAM Marek Vasut <marex@denx.de> wro=
te:
> >>
> >> This panel_bridge post_disable callback is called from the bridge chai=
n now,
> >> so drop the explicit call here. This fixes call imbalance, where this =
driver
> >> does not call ->pre_enable, but does call ->post_disable . In case eit=
her of
> >> the two callbacks implemented in one of the panel or bridge drivers co=
ntains
> >> any operation with refcounted object, like regulator, this would make =
kernel
> >> complain about the imbalance.
> >>
> >> This can be triggered e.g. with ST7701 driver, which operates on regul=
ators
> >> in its prepare/unprepare callbacks, which are called from pre_enable/p=
ost_disable
> >> callbacks respectively. The former is called once, the later twice, du=
ring
> >> entry to suspend.
> >>
> >> Drop the post_disable call to fix the imbalance.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> ---
> >> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> >> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> >> Cc: Jonas Karlman <jonas@kwiboo.se>
> >> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> >> Cc: Marek Vasut <marex@denx.de>
> >> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> >> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> >> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> >> Cc: Robert Foss <robert.foss@linaro.org>
> >> Cc: Vincent Abriou <vincent.abriou@st.com>
> >> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> >> Cc: dri-devel@lists.freedesktop.org
> >> ---
> >>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 9 ---------
> >>   1 file changed, 9 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/g=
pu/drm/bridge/synopsys/dw-mipi-dsi.c
> >> index b2efecf7d1603..63ac972547361 100644
> >> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> >> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> >> @@ -859,15 +859,6 @@ static void dw_mipi_dsi_bridge_post_atomic_disabl=
e(struct drm_bridge *bridge,
> >>           */
> >>          dw_mipi_dsi_set_mode(dsi, 0);
> >>
> >> -       /*
> >> -        * TODO Only way found to call panel-bridge post_disable &
> >> -        * panel unprepare before the dsi "final" disable...
> >> -        * This needs to be fixed in the drm_bridge framework and the =
API
> >> -        * needs to be updated to manage our own call chains...
> >> -        */
> >> -       if (dsi->panel_bridge->funcs->post_disable)
> >> -               dsi->panel_bridge->funcs->post_disable(dsi->panel_brid=
ge);
> >> -
> >
> > If my understanding was correct, the controller set the low-speed DCS
> > in pre_enable and high-speed DCS in enable. So I'm thinking this
> > explicit post_disable still needs to revert the operation within the
> > bridge chain. I didn't test this but trying to understand how the
> > existing behaviour is satisfied if we drop this.
>
> Did I miss a panel_bridge pre_enable call somewhere in the driver ?
> Where is it ?

Haa, sorry the next bridge pre_enable.  driver setting the
command-mode (low-speed) in mode_set so when the next bridge
pre_enable is called, low-speed DCS can be sent, then the bridge
enable() sets video mode (high-speed). This is where an explicit
post_disable would be required, this is what I understood so far.

Jagan.
