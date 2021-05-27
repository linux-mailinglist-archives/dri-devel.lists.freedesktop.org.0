Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3164C3924FC
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 04:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AF96E8B4;
	Thu, 27 May 2021 02:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30056E8B4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 02:45:01 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id l15so2808317ilh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 19:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=79GtT8rnNPPx0pHBJOo16yJtfQiu1KLMcfnDrjvCZWY=;
 b=lu5YRC5srVXbMxH7PTXy7we9KNLMo+gFsuK7dIJCLwP9vwGcEhpL4Y+HmpTKd1Ht/q
 +UHY5mAo20c8vooI1eUbn+sKHePP8dOK/18ovmnIF0LJoShNvTgqcDB1evrd/aSUs/YX
 vVjhkcdndvsWjsyi04H7Mk0R8i/kKzMASz5tuF3BjSxLW/UmojGzZNqPsKfYUJBSMb19
 JuXwpcNZ6uWs7Z6rp3OEgxF3Rng9Eu26AlVLqXLaMhJDP3dcCZ9eJvUvKun4bx2WLPYB
 5SkDJ5gGvIePMLytGhFa0ZmPoX1CXusxtLelAcVG0CDhTljvklNWmcEZLPUHNgSZnbPp
 5f9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=79GtT8rnNPPx0pHBJOo16yJtfQiu1KLMcfnDrjvCZWY=;
 b=h4xhiEfx23uq9U7niC5PO8A3LR9+6aABuCQ00AnxSdx1M5mLsA9Wb0FiIcPY4QJIBf
 FX5jtHWPf+gjXuh7iuoUKvW5aj1nYSCa11u9JATCeQq33GAeTdIUE3pzthFuch4c3+Eq
 gtFqWip3lZefFjNYra+TdP8cCaIF/K6tUQNaELDUPd3MJBsdhgx5ixbwf2glM/tqsPJp
 hJ0gJNaxGKK7U12HFuNj0ATcBsDqv91XDeOZhyPCZ/4U9U1xDRXA0k7ooo5t89KURZkT
 xasyFsVmYhdPD4NvZcWbkEagoQDUXjpw62ck6Hu+c8yLzkCLxfhJfmyHgHiVZHt3Fa6n
 wQLA==
X-Gm-Message-State: AOAM531NeB4QNn/lbwbgpWTz14N4LBS8kHKM/XIUSx6fH45drNmFap1b
 8JX3jmNBx98oY0rxbYK4egp7OeassecMf2UsqrY=
X-Google-Smtp-Source: ABdhPJzvV0tgur2zaQyJ+Xads+XV8KyonsJ/s9v8wVnjnaeHVSYsS9dtdLwoPvEG5JTkftBwH8aTgNurhVr8xpNRtBI=
X-Received: by 2002:a92:1a52:: with SMTP id z18mr1122800ill.41.1622083501307; 
 Wed, 26 May 2021 19:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210526111515.40015-1-ainux.wang@gmail.com>
 <899588fd-1387-9afd-c34b-95e8a9126612@suse.de>
In-Reply-To: <899588fd-1387-9afd-c34b-95e8a9126612@suse.de>
From: Ainux Wang <ainux.wang@gmail.com>
Date: Thu, 27 May 2021 10:44:49 +0800
Message-ID: <CAPWE4_zt8XnFdpM7kSfc=H_Q=PN1-6vwa7vfrSRKvD-yZq_4BQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/ast: Add detect function support
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: airlied@linux.ie, teng sterling <sterlingteng@gmail.com>,
 chenhuacai@kernel.org, dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

You're welcome!

Best regards
Ainux Wang


Thomas Zimmermann <tzimmermann@suse.de> =E4=BA=8E2021=E5=B9=B45=E6=9C=8827=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=883:15=E5=86=99=E9=81=93=EF=BC=
=9A
>
> Hi
>
> Am 26.05.21 um 13:15 schrieb ainux.wang@gmail.com:
> > From: Ainux <ainux.wang@gmail.com>
> >
> > The existence of the connector cannot be detected,
> > so add the detect function to support.
> >
> > Signed-off-by: Ainux <ainux.wang@gmail.com>
>
> Looks good. If no one else comments, I'll merge the patch soon. Thanks a
> lot.
>
> Best regards
> Thomas
>
> > ---
> >   drivers/gpu/drm/ast/ast_mode.c | 18 +++++++++++++++++-
> >   1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> > index 36d9575aa27b..e5996ae03c49 100644
> > --- a/drivers/gpu/drm/ast/ast_mode.c
> > +++ b/drivers/gpu/drm/ast/ast_mode.c
> > @@ -1293,6 +1293,18 @@ static enum drm_mode_status ast_mode_valid(struc=
t drm_connector *connector,
> >       return flags;
> >   }
> >
> > +static enum drm_connector_status ast_connector_detect(struct drm_conne=
ctor
> > +                                                *connector, bool force=
)
> > +{
> > +     int r;
> > +
> > +     r =3D ast_get_modes(connector);
> > +     if (r < 0)
> > +             return connector_status_disconnected;
> > +
> > +     return connector_status_connected;
> > +}
> > +
> >   static void ast_connector_destroy(struct drm_connector *connector)
> >   {
> >       struct ast_connector *ast_connector =3D to_ast_connector(connecto=
r);
> > @@ -1307,6 +1319,7 @@ static const struct drm_connector_helper_funcs as=
t_connector_helper_funcs =3D {
> >
> >   static const struct drm_connector_funcs ast_connector_funcs =3D {
> >       .reset =3D drm_atomic_helper_connector_reset,
> > +     .detect =3D ast_connector_detect,
> >       .fill_modes =3D drm_helper_probe_single_connector_modes,
> >       .destroy =3D ast_connector_destroy,
> >       .atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate=
_state,
> > @@ -1334,7 +1347,8 @@ static int ast_connector_init(struct drm_device *=
dev)
> >       connector->interlace_allowed =3D 0;
> >       connector->doublescan_allowed =3D 0;
> >
> > -     connector->polled =3D DRM_CONNECTOR_POLL_CONNECT;
> > +     connector->polled =3D DRM_CONNECTOR_POLL_CONNECT |
> > +                                             DRM_CONNECTOR_POLL_DISCON=
NECT;
> >
> >       drm_connector_attach_encoder(connector, encoder);
> >
> > @@ -1403,6 +1417,8 @@ int ast_mode_config_init(struct ast_private *ast)
> >
> >       drm_mode_config_reset(dev);
> >
> > +     drm_kms_helper_poll_init(dev);
> > +
> >       return 0;
> >   }
> >
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>
