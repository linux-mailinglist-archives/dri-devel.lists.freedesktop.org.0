Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B75CB207751
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808146E0EC;
	Wed, 24 Jun 2020 15:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56386E0EC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:24:20 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j4so213564wrp.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 08:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8RW6xMuNqonc9o+6sGZMq3yrKDuW2zFZ61r+fXzAtZw=;
 b=QSUyXuv4ANHusxM4s+cHxNora9hpwMi7RaAiXxztnO+HT4SgdMuqJ+SNZDCpCq1q6j
 IA9QuiHgApMkFPASOL47dm7lxV1bzRSBRHNGK7SViNgZTDWwXKybjRwrkMerA2m+ym2p
 HmQYUOT78LgsHiLls3rjWmJf+VGI0Ied2YUsRk6a4vqgvlVNLqiQMLgL62aOd52nhUY9
 sOmF/kVrrnlhektLAV3ELtw9bRsTrYsqy5doBImnF3LxVE49cSOhYUMn5LTw3bGTWb5i
 61RFBrTs3CUrJf+aS9jSitaxeTnPqnG/F1BM+j70cs46X7k0TZxCROz/KXPDANMD+SZg
 Dgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8RW6xMuNqonc9o+6sGZMq3yrKDuW2zFZ61r+fXzAtZw=;
 b=QI1iDcduUj0TBsaUdGGk+IrH4i3E12FZ/1Q7xe/qCrXwmO4OwdLo70Dp5PJKYY6SsM
 cAnhrAIwvRlHlkFPgsZOfUn51/iNq+qwC4eYMOY2/OD4MnmfjTwWChUpxqExO7Z77vgh
 /pD2uS6gyWp0o9EdUU8T1/2hd/H/61xefGrdooYBNF7VSNXoHTnUj9bzWNAUwAZzsue6
 l7bKRULGxydKE6YlBGLB/oZzQAdOsgMW90JgzFHoqpeU48gGNCX5Rgc4vR6lm7ukf6tA
 kMpa/8A+mz2fMtppuRI5XXttmFqCJy2x+CuPod5TnQWI8gKG/oVottVlm+rJTCaRndRG
 ggbg==
X-Gm-Message-State: AOAM531fO3KJC+q3i/Q1DSNXZxW3UXCb8QG87nNlBDb4dSRiP6uUf9nY
 4tx3wHrL/tVQIELjV2h8FGsScjwyKAAQPnZduHI=
X-Google-Smtp-Source: ABdhPJxLceYmEYUlekOp3d7GqC+rxzHyQplsSwS25SH1p/7FEMRIWchNwCuVh/oNoDGEqvrCXLFaAi2XFss0ImiH6Jg=
X-Received: by 2002:adf:ef89:: with SMTP id d9mr18037365wro.124.1593012259425; 
 Wed, 24 Jun 2020 08:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org>
 <20200624011209.GU5870@pendragon.ideasonboard.com>
 <20200624072304.GT20149@phenom.ffwll.local>
In-Reply-To: <20200624072304.GT20149@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Jun 2020 11:24:08 -0400
Message-ID: <CADnq5_PidPnShdxNwCN4v++CirpKvPiY4yuN5eyK-R5+FcQV4A@mail.gmail.com>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown
 state
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 3:23 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jun 24, 2020 at 04:12:09AM +0300, Laurent Pinchart wrote:
> > Hi Sam,
> >
> > On Sun, Jun 21, 2020 at 10:40:00AM +0200, Sam Ravnborg wrote:
> > > On Tue, May 26, 2020 at 04:15:05AM +0300, Laurent Pinchart wrote:
> > > > The DRM CRTC helpers add default modes to connectors in the connected
> > > > state if no mode can be retrieved from the connector. This behaviour is
> > > > useful for VGA or DVI outputs that have no connected DDC bus. However,
> > > > in such cases, the status of the output usually can't be retrieved and
> > > > is reported as connector_status_unknown.
> > > >
> > > > Extend the addition of default modes to connectors in an unknown state
> > > > to support outputs that can retrieve neither the modes nor the
> > > > connection status.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >
> > > From your description sounds like an OK approach.
> > > But this is not something I feel too familiar with.
> > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> >
> > Thanks for the ack. I'd like to have Daniel's (CC'ed) feedback on this
> > too.
>
> Makes sense, and at least pre-coffee me can't immediately think of a
> scenario where we're going to regret this. _unknown status is pretty much
> limited to old VGA and similar things where load detect somehow isn't well
> supported by the hw.
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> >
> > > > ---
> > > >  drivers/gpu/drm/drm_probe_helper.c       | 3 ++-
> > > >  include/drm/drm_modeset_helper_vtables.h | 8 +++++++-
> > > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> > > > index f5d141e0400f..9055d9573c90 100644
> > > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > > @@ -491,7 +491,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
> > > >   if (count == 0 && connector->status == connector_status_connected)
> > > >           count = drm_add_override_edid_modes(connector);
> > > >
> > > > - if (count == 0 && connector->status == connector_status_connected)
> > > > + if (count == 0 && (connector->status == connector_status_connected ||
> > > > +                    connector->status == connector_status_unknown))
> > > >           count = drm_add_modes_noedid(connector, 1024, 768);
> > > >   count += drm_helper_probe_add_cmdline_mode(connector);
> > > >   if (count == 0)
> > > > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > > > index 421a30f08463..afe55e2e93d2 100644
> > > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > > @@ -876,13 +876,19 @@ struct drm_connector_helper_funcs {
> > > >    * The usual way to implement this is to cache the EDID retrieved in the
> > > >    * probe callback somewhere in the driver-private connector structure.
> > > >    * In this function drivers then parse the modes in the EDID and add
> > > > -  * them by calling drm_add_edid_modes(). But connectors that driver a
> > > > +  * them by calling drm_add_edid_modes(). But connectors that drive a
> > > >    * fixed panel can also manually add specific modes using
> > > >    * drm_mode_probed_add(). Drivers which manually add modes should also
> > > >    * make sure that the &drm_connector.display_info,
> > > >    * &drm_connector.width_mm and &drm_connector.height_mm fields are
> > > >    * filled in.
> > > >    *
> > > > +  * Note that the caller function will automatically add standard VESA
> > > > +  * DMT modes up to 1024x768 if the .get_modes() helper operation returns
> > > > +  * no mode and if the connector status is connector_status_connected or
> > > > +  * connector_status_unknown. There is no need to call
> > > > +  * drm_add_edid_modes() manually in that case.
>
> Hm calling drm_add_edid_modes if you have no edid is a bit a funny idea
> ... Personally I'd just leave out the last sentence, I think that only
> confuses readers. Or I'm not grasphing what you're trying to tell here.

IIRC, some drivers used and desktop environments expected unknown
rather than off for LVDS/eDP panels when the lid was shut or if the
mux was switched to another device in the case of hybrid laptops.

Alex


>
> r-b with or without this change since imo super tiny nit.
>
> Cheers, Daniel
>
> > > > +  *
> > > >    * Virtual drivers that just want some standard VESA mode with a given
> > > >    * resolution can call drm_add_modes_noedid(), and mark the preferred
> > > >    * one using drm_set_preferred_mode().
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
