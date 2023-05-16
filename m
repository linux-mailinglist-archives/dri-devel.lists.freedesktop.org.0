Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDF1704915
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE1C10E335;
	Tue, 16 May 2023 09:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EAD10E244
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:23:57 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-55a20a56a01so239834477b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 02:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684229036; x=1686821036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E9QIEVyzfEnmGCjgJeMU+9Mq4ElKiwoe4HCcb7tU/dU=;
 b=TbuEICEEtykacq9ty+EN5Tfi8vrFL/wH5gZjncP7Of/Yebk0v38Q58vuBx7P1Ng837
 ggm81ghcyi2A/77F+qLUqkTQ/pg38tlqZRicraBPEXOciL9G9ig26zEs8gEahg0JzO6s
 ZBqwyHHx4fFlsZI5XzjAsjttm7GBHULvMsWnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684229036; x=1686821036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E9QIEVyzfEnmGCjgJeMU+9Mq4ElKiwoe4HCcb7tU/dU=;
 b=LqfKyB5tJrJ0ApvsmJrarR4/hoctQYB2U69s6J1fV/ROgjRboVmlgItVMOYKXjHxuT
 iqsuA1ySCiprtBmdft9ozAYOWjieFVtG7cZCHPLzzdEd/QtEjbzX9/MkK8eTikgQUMH+
 H6A+cE7XxeSilz7L9Nk2caniRbF0AwfO0cW4MHMRb7g39+rwaQKadnN6Tw5z8Y0cymEQ
 JWBSdd0ei/23Sa8OOGp+cxx4cx/zgmstrWjbaMCNRVvvsrGsOKKG5LQdZQg+oWigqIze
 oHH/UUA6mtYQi2oZ3RG6v9qr1VsCaWd7fzNhwmlauvAqiNQOi3MuAiXRQzn8BWqiyhsn
 RXbA==
X-Gm-Message-State: AC+VfDwXPynCA6VyMwQp9oq1un5mt1E9VK563xvoZt9IuevDsOr5gXxq
 QiXf4o48KPtqLclnoJNAlfLLNLs8KynPd1ohsoBbFw==
X-Google-Smtp-Source: ACHHUZ7CxfOBQoERAkZEWyXusXbylIEGLc1jbNHgjbq5rJVrxBRixhb9FbCYV348QiyhsSdjqdQ2E3/d1WhIFITZi88=
X-Received: by 2002:a0d:e002:0:b0:561:179b:1276 with SMTP id
 j2-20020a0de002000000b00561179b1276mr11264666ywe.26.1684229036042; Tue, 16
 May 2023 02:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230513201030.514861-1-marex@denx.de>
 <CAMty3ZCYCzawWuEGUWhsxSmuMORoeij=VEGGhn0-yRaQ7_1_uA@mail.gmail.com>
 <62a849cf-46f4-b01b-15b7-6b2bafe2972f@denx.de>
 <CAMty3ZC76XV-WP4w9CxOZ5KE3w9_FVMXTdqkfi0JJ0FsLQr3gQ@mail.gmail.com>
 <a235a4e1-9562-6694-ee09-110d3eb92380@denx.de>
In-Reply-To: <a235a4e1-9562-6694-ee09-110d3eb92380@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 16 May 2023 14:53:44 +0530
Message-ID: <CAMty3ZAsSyxmWGg4UHMqGoWdweLVKHAdvr2-7wXhm2AsTgiFJA@mail.gmail.com>
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

On Tue, May 16, 2023 at 2:04=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 5/16/23 10:25, Jagan Teki wrote:
> > On Tue, May 16, 2023 at 1:47=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
> >>
> >> On 5/16/23 10:12, Jagan Teki wrote:
> >>> Hi Marek and Neil,
> >>>
> >>> On Sun, May 14, 2023 at 1:40=E2=80=AFAM Marek Vasut <marex@denx.de> w=
rote:
> >>>>
> >>>> This panel_bridge post_disable callback is called from the bridge ch=
ain now,
> >>>> so drop the explicit call here. This fixes call imbalance, where thi=
s driver
> >>>> does not call ->pre_enable, but does call ->post_disable . In case e=
ither of
> >>>> the two callbacks implemented in one of the panel or bridge drivers =
contains
> >>>> any operation with refcounted object, like regulator, this would mak=
e kernel
> >>>> complain about the imbalance.
> >>>>
> >>>> This can be triggered e.g. with ST7701 driver, which operates on reg=
ulators
> >>>> in its prepare/unprepare callbacks, which are called from pre_enable=
/post_disable
> >>>> callbacks respectively. The former is called once, the later twice, =
during
> >>>> entry to suspend.
> >>>>
> >>>> Drop the post_disable call to fix the imbalance.
> >>>>
> >>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>> ---
> >>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> >>>> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
> >>>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>>> Cc: David Airlie <airlied@gmail.com>
> >>>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> >>>> Cc: Jonas Karlman <jonas@kwiboo.se>
> >>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> >>>> Cc: Marek Vasut <marex@denx.de>
> >>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> >>>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> >>>> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> >>>> Cc: Robert Foss <robert.foss@linaro.org>
> >>>> Cc: Vincent Abriou <vincent.abriou@st.com>
> >>>> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> >>>> Cc: dri-devel@lists.freedesktop.org
> >>>> ---
> >>>>    drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 9 ---------
> >>>>    1 file changed, 9 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers=
/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> >>>> index b2efecf7d1603..63ac972547361 100644
> >>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> >>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> >>>> @@ -859,15 +859,6 @@ static void dw_mipi_dsi_bridge_post_atomic_disa=
ble(struct drm_bridge *bridge,
> >>>>            */
> >>>>           dw_mipi_dsi_set_mode(dsi, 0);
> >>>>
> >>>> -       /*
> >>>> -        * TODO Only way found to call panel-bridge post_disable &
> >>>> -        * panel unprepare before the dsi "final" disable...
> >>>> -        * This needs to be fixed in the drm_bridge framework and th=
e API
> >>>> -        * needs to be updated to manage our own call chains...
> >>>> -        */
> >>>> -       if (dsi->panel_bridge->funcs->post_disable)
> >>>> -               dsi->panel_bridge->funcs->post_disable(dsi->panel_br=
idge);
> >>>> -
> >>>
> >>> If my understanding was correct, the controller set the low-speed DCS
> >>> in pre_enable and high-speed DCS in enable. So I'm thinking this
> >>> explicit post_disable still needs to revert the operation within the
> >>> bridge chain. I didn't test this but trying to understand how the
> >>> existing behaviour is satisfied if we drop this.
> >>
> >> Did I miss a panel_bridge pre_enable call somewhere in the driver ?
> >> Where is it ?
> >
> > Haa, sorry the next bridge pre_enable.  driver setting the
> > command-mode (low-speed) in mode_set so when the next bridge
> > pre_enable is called, low-speed DCS can be sent, then the bridge
> > enable() sets video mode (high-speed). This is where an explicit
> > post_disable would be required, this is what I understood so far.
>
> So, in the end, all is good with this patch or is there anything missing =
?

It is not good, explicit post_disable would required for graceful
speed change as it is done in mode_set and enable.

Jagan.
