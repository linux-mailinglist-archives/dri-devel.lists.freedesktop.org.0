Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDAB4D4990
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 15:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A85D10E23E;
	Thu, 10 Mar 2022 14:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C522610E23E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 14:44:53 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a8so12578512ejc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 06:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lyJ8K0Z8v0ylejCiK6GPtbAsL2ts5My3FPwBQpZAY0U=;
 b=Bnhq8fAqIddoSbfo50FDK69lba+a1Awliu1kV/ZAiWIejTswDtoOgge+HBYtwIVsIf
 9pe9O3vNnwKBjY6NhCEgPgvy9Mn5+xqoRWLKA4vO7EBKn9irvjtOkc4C/RQDV1ydcXih
 hZuMpq0hKluouylLopa9f2WfYp24HkzDofWKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lyJ8K0Z8v0ylejCiK6GPtbAsL2ts5My3FPwBQpZAY0U=;
 b=SodRINGgz0cZwzRtAoeGFS0S6buJNo8fhf+AfFh2yKnBoMRGWsk44Q76/Kr2nJ/PqL
 8hD48F3jHSRdDkBPI5rDsAENeqlRwk14I/1APDzf8pEOBX+rdd/Lb3sIRz0S1WPUZq1k
 dCJe+goYSIDTPObbDDGWlfFmoWG6KkzowdnkIOCRbTjm4UfPSTtOs1CvrdRyIYs0QV+H
 BSuAWSIV5zuaA7Rlt/ynbMWVvnBEw8LYK7k18r5BCmJb42OREGXpbyJ+DdBqQlCmGsEn
 hUohdM/y/dqU5Lvmt94ND6aq74Vn6BhDRGlMam2KI5yhoL1aHk40AdTvDwwzwe6TmrBP
 Puug==
X-Gm-Message-State: AOAM533UtrxqFY2KIgyPEShN4bzq97cTrVyVUZG6UBQfLNU/LcFv7jgb
 3ZU5Ojhg3NkCuplDYG9jExYTodzFzKRyZc0l
X-Google-Smtp-Source: ABdhPJxxLzs4b2kyMwq2/mn6ocuFdly3Vq1v1TxwoxI9Q03eq7yx3bR0zSXNlBCvIjsaS3IVjAdSZA==
X-Received: by 2002:a17:906:dc10:b0:6da:f383:86ed with SMTP id
 yy16-20020a170906dc1000b006daf38386edmr4465511ejb.391.1646923491987; 
 Thu, 10 Mar 2022 06:44:51 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 u24-20020a1709064ad800b006d70e40bd9esm1884435ejt.15.2022.03.10.06.44.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 06:44:50 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id r6so7899597wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 06:44:50 -0800 (PST)
X-Received: by 2002:a5d:5232:0:b0:1f7:7c4c:e48 with SMTP id
 i18-20020a5d5232000000b001f77c4c0e48mr3662274wra.679.1646923489694; Thu, 10
 Mar 2022 06:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
 <20220307175955.363057-2-kieran.bingham+renesas@ideasonboard.com>
 <CAD=FV=VAwCzQvCPzAOk9i8u7-pfbO3cGVa8nqj6V1eQc8mRwFA@mail.gmail.com>
 <164691261863.11309.15102491071451078046@Monstersaurus>
In-Reply-To: <164691261863.11309.15102491071451078046@Monstersaurus>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Mar 2022 06:44:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WXtJcVBp7wb2pDfnZpyZyAHJ57Uxt0+kGS5_pqB4jijw@mail.gmail.com>
Message-ID: <CAD=FV=WXtJcVBp7wb2pDfnZpyZyAHJ57Uxt0+kGS5_pqB4jijw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 10, 2022 at 3:43 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> Hi Doug,
>
> Quoting Doug Anderson (2022-03-07 19:52:08)
> > Hi,
> >
> > On Mon, Mar 7, 2022 at 10:00 AM Kieran Bingham
> > <kieran.bingham+renesas@ideasonboard.com> wrote:
> > >
> > > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >
> > > Implement the bridge connector-related .get_edid() operation, and report
> > > the related bridge capabilities and type.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > ---
> > > Changes since v1:
> > >
> > > - The connector .get_modes() operation doesn't rely on EDID anymore,
> > >   __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
> > >   together
> > >
> > > Notes from Kieran:
> > >
> > > RB Tags collected from:
> > >  https://lore.kernel.org/all/20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com/
> > >
> > > However this was over a year ago, so let me know if other patches now
> > > superceed this one or otherwise invalidate this update.
> > >
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > index c55848588123..ffb6c04f6c46 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > @@ -1154,6 +1154,19 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> > >         pm_runtime_put_sync(pdata->dev);
> > >  }
> > >
> > > +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> > > +                                         struct drm_connector *connector)
> > > +{
> > > +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > > +       struct edid *edid;
> > > +
> > > +       pm_runtime_get_sync(pdata->dev);
> > > +       edid = drm_get_edid(connector, &pdata->aux.ddc);
> > > +       pm_runtime_put_autosuspend(pdata->dev);
> > > +
> > > +       return edid;
> > > +}
> > > +
> > >  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> > >         .attach = ti_sn_bridge_attach,
> > >         .detach = ti_sn_bridge_detach,
> > > @@ -1162,6 +1175,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> > >         .enable = ti_sn_bridge_enable,
> > >         .disable = ti_sn_bridge_disable,
> > >         .post_disable = ti_sn_bridge_post_disable,
> > > +       .get_edid = ti_sn_bridge_get_edid,
> > >  };
> > >
> > >  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> > > @@ -1248,6 +1262,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
> > >
> > >         pdata->bridge.funcs = &ti_sn_bridge_funcs;
> > >         pdata->bridge.of_node = np;
> > > +       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> > > +       pdata->bridge.type = DRM_MODE_CONNECTOR_eDP;
> >
> > This doesn't look right to me. In the eDP case the EDID reading is
> > driven by the panel.
>
> Now that I have the optional connector working based on Sam's series I
> think this is the last issue to solve before reposting the DP/HPD
> support.
>
> Are you saying that the bridge.ops should only set DRM_BRIDGE_OP_EDID
> when pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort?

Yes.

-Doug
