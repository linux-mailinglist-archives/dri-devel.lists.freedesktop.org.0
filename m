Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9417F704781
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 10:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ED410E31D;
	Tue, 16 May 2023 08:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9901A10E31E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:12:53 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-ba80dc46972so1094588276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684224772; x=1686816772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1ULeDlfF3bB4/JvhssCpCXX49AnxmO1x+nqNlT3Fo8=;
 b=m5AHQIqyYETEuCvwr17zmguBH+u63g0sDgFxbGlyx82a4IyczAme3grdtQDiuqxewb
 wbsSDnlIxhlRgfvhczRNi/mGzYxMC7mjJpZsfPH+oWDEhemHSzEv1LS7vhFElD7bCCrx
 aFCECZWAxmsEUlKic0iefv5yac5nS0xRYZNQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684224772; x=1686816772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n1ULeDlfF3bB4/JvhssCpCXX49AnxmO1x+nqNlT3Fo8=;
 b=HFhb0AjfXvVseAPLosQx8Yr91X8veRfowZ+zdtYGwwQBU1Uz6sDsW9bs/3w7NLaT9L
 5oD9R3xCYGoiUlXeXZmepWJSAEhzsZOWl8+kkkTk//THb6cZzyeovXBxgyq1BKuAzmiU
 blnblGbS3QdDiC9euecFY5flY4g7Hv0qpC1WnI6BGbx9IRdv1UfbfEZCdWGSueUVBkBS
 TTEr0TtbUv4texACRGo4QXP4GjVnnjQjPVw4PMOphiEomHnnkelL4vSLA43uR5O/LexA
 Z7e0ZyBfQgWLxmMHjLzeCjXApIV2w/ir4P7i5CYR814NH9Gwk9CH4RwnEQuMFbHhh5Yt
 8rAA==
X-Gm-Message-State: AC+VfDx6pG/Z6QsbKSB5jM8bTG9vj4on2XTEaXmug4R30TsB+D2+bEGA
 Ds6ln7n0w3eoTWAt2QYpmfYsnJWmnUs2zJe/hB3YkQ==
X-Google-Smtp-Source: ACHHUZ7SVusFL6o+PwfQF6Afk/2s5CuenAVMfcaoNt5ZnlH2eq6BbHi8U51X+Pior0NM6weltRL02UM9SzXrmQt9VPA=
X-Received: by 2002:a0d:c641:0:b0:556:ceb2:c462 with SMTP id
 i62-20020a0dc641000000b00556ceb2c462mr32133859ywd.2.1684224772352; Tue, 16
 May 2023 01:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230513201030.514861-1-marex@denx.de>
In-Reply-To: <20230513201030.514861-1-marex@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 16 May 2023 13:42:39 +0530
Message-ID: <CAMty3ZCYCzawWuEGUWhsxSmuMORoeij=VEGGhn0-yRaQ7_1_uA@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: dw-mipi-dsi: Drop panel_bridge post_disable
 call
To: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: Antonio Borneo <antonio.borneo@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek and Neil,

On Sun, May 14, 2023 at 1:40=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> This panel_bridge post_disable callback is called from the bridge chain n=
ow,
> so drop the explicit call here. This fixes call imbalance, where this dri=
ver
> does not call ->pre_enable, but does call ->post_disable . In case either=
 of
> the two callbacks implemented in one of the panel or bridge drivers conta=
ins
> any operation with refcounted object, like regulator, this would make ker=
nel
> complain about the imbalance.
>
> This can be triggered e.g. with ST7701 driver, which operates on regulato=
rs
> in its prepare/unprepare callbacks, which are called from pre_enable/post=
_disable
> callbacks respectively. The former is called once, the later twice, durin=
g
> entry to suspend.
>
> Drop the post_disable call to fix the imbalance.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/=
drm/bridge/synopsys/dw-mipi-dsi.c
> index b2efecf7d1603..63ac972547361 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -859,15 +859,6 @@ static void dw_mipi_dsi_bridge_post_atomic_disable(s=
truct drm_bridge *bridge,
>          */
>         dw_mipi_dsi_set_mode(dsi, 0);
>
> -       /*
> -        * TODO Only way found to call panel-bridge post_disable &
> -        * panel unprepare before the dsi "final" disable...
> -        * This needs to be fixed in the drm_bridge framework and the API
> -        * needs to be updated to manage our own call chains...
> -        */
> -       if (dsi->panel_bridge->funcs->post_disable)
> -               dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge)=
;
> -

If my understanding was correct, the controller set the low-speed DCS
in pre_enable and high-speed DCS in enable. So I'm thinking this
explicit post_disable still needs to revert the operation within the
bridge chain. I didn't test this but trying to understand how the
existing behaviour is satisfied if we drop this.

Thanks,
Jagan.
