Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8212656AD5B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 23:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2558710F577;
	Thu,  7 Jul 2022 21:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAED10F681
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 21:21:21 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s204so3401592oif.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 14:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=XuQp9w2Vs1aOFFH2QgkEWHPslvL9Ld8qwnD4BupNY0w=;
 b=SXzFCD6PiakxSAJDlRX45oXMcaTKoAYue/mlyleZo0TLGj9D1x5FZiOFOc1bW5MMxm
 zMeQR1uETxWfCgYwRwvbM/aZQlHNFz3jwfNhmuBK0Tl46qx6avBJt0Vj5QJf9fSg63nT
 Laq+DqlvwhqfjZOD9GmtHldsC/NJuFdb8LnFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=XuQp9w2Vs1aOFFH2QgkEWHPslvL9Ld8qwnD4BupNY0w=;
 b=dc06lCBKs7o5szQPMrxp5XAyMWOCa2THkf5JAndXG1VfFqaPZGf34OSHPUDaijJ0Sm
 6PUSojs3hRTn1sugiXz6TH97lXM70I2AFvcpQ9tz+pfke9vgJIf59PCGAtl47QzINSwF
 /O4XHuFzKH3eSwxlnvBXtxdYSYYnCTLYh1FXt6uDjX7vnaspv8eiFkcJ7mrDO9QtuW1P
 Ms41lu1DPk+87aScLbQxUv6nbK8Hr9hH3hfLDYaLh17lFVSJsh470f1Xgx6aH9d5u5wl
 dluaQjJeWnQxAf15nxqpSsIyO31JL6OS2TO/iPn+tT+00kwYV0mmAJaezn7epxNwaRLJ
 AWuA==
X-Gm-Message-State: AJIora89pRMsF2knhJmAviOKcu1baux+yYHr2Sl3Lj2ChRFoRA994kl4
 b/12bIC+CdjtEBBSPwRhZisdVJjenhB1OhnJ9i6/vA==
X-Google-Smtp-Source: AGRyM1u86hlfujAKJCwkQGNNNhGQ5OK4EZsg7vgXL8Rcuq1ObSFJPCM5Km3thPxlp2kWX7YX6S9fOpbX+fbPsKGN5IA=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr4885oib.63.1657228880881; Thu, 07 Jul
 2022 14:21:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 14:21:20 -0700
MIME-Version: 1.0
In-Reply-To: <40b6a28c-0237-55d7-2f5d-1c571f27e7d6@quicinc.com>
References: <20220706191442.1150634-1-swboyd@chromium.org>
 <40b6a28c-0237-55d7-2f5d-1c571f27e7d6@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 14:21:20 -0700
Message-ID: <CAE-0n51KOMLP4XJHw2CPNikzfhY0xdjeCScYwvCZ7gAYJM+8Fw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Set panel orientation when directly connected
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>
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
Cc: Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Hsin-Yi Wang <hsinyi@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-07-07 14:11:08)
>
>
> On 7/6/2022 12:14 PM, Stephen Boyd wrote:
> > Set the panel orientation in drm when the panel is directly connected,
> > i.e. we're not using an external bridge. The external bridge case is
> > already handled by the panel bridge code, so we only update the path we
> > take when the panel is directly connected/internal. This silences a
> > warning splat coming from __drm_mode_object_add() on Wormdingler boards.
> >
> > Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >
> > This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
> > to set orientation from panel") which is in drm-misc
> >
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index cb84d185d73a..9333f7095acd 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -268,6 +268,8 @@ static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
> >               return PTR_ERR(panel);
> >       }
> >
> > +     drm_connector_set_orientation_from_panel(conn, panel);
> > +
>
> This should be moved below the !panel check since you are passing panel
> as one of the params.

drm_connector_set_orientation_from_panel() checks for a NULL panel
pointer and sets to UNKNOWN. If I moved this below the !panel check then
I'd have to split that condition for !IS_BONDED_DSI() which was more
diff.

>
> I looked up the doc and it says that for unknown(default cases) this is
> a no-op so I think this change is fine otherwise.
>
> "It is allowed to call this function with a panel_orientation of
> DRM_MODE_PANEL_ORIENTATION_UNKNOWN, in which case it is a no-op."

Ok, so you're fine with this patch?

>
>
> >       if (!panel || !IS_BONDED_DSI())
> >               goto out;
> >
> >
> > base-commit: 15b9ca1641f0c3cd74885280331e9172c62a125e
