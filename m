Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119A04E97FD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 15:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B9610EAE8;
	Mon, 28 Mar 2022 13:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25B310EAE9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 13:24:16 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id m22so14063025pja.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 06:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k900ko74APDJL4JS5btQb2Wg1Egu6wfcKSVm5IbK2EA=;
 b=rsvGCdQblbOi9loD5mWsZDLJ4r3zmPAD7vHlyAMcMYsegyeasWQrNaR7wJTFA7gJ12
 IPDPPIfzhslRgyFkhMQmfNip/+tOL+lj9AibCS4mU2P041Dd9D4ZlxXaYr4Twm7le6rX
 fcdPIDgNLid+O/idfK/mojljObclRdUp9xRvehJ5EJQYjaCJCOv7kRl+HMfX6FJOEsb3
 ms72DLYYSgHYnrYsizR16FwF58lkjdzll7VTkJ02YFkGq2uGnusUE500nIU07qQmhQW3
 pJCY2oYVgKOD7cbBL1f40WPajZ3RObnH57ZJqoM2rJ7PcSytOSHwO1f0G0Jm7HDumEPD
 U9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k900ko74APDJL4JS5btQb2Wg1Egu6wfcKSVm5IbK2EA=;
 b=fm7aXLL/6ocWiqZEZ7ADt880mFc3hV2ZSkyyybSZ1o4frli7AhrpNZNzS7Ctg3fCmF
 lK4vCSKmH1V6ybH5o3ba+tAYMwznJVpSnFSEwEulK/RbhrPrkR4M8tZCsWg8lpf/++ip
 R/mcipuauiZVHKfnyMIFK9Y9XtcysivDay3FTdEREVnusJN/kE4tKfwUegDC8rkuBqkB
 KPKqyqlhiJhH9i1a0fBp7ninq26cHXzyEWeIiVakv88/98Wck2El29kNVgnmVf3XEvFe
 5fX6eQKYWZxdEiaFNEeM6P43mU6Qd/CHKPW0j70tLsD3n5FV8iJz+ly5H3VgEfv9OzB5
 qH5w==
X-Gm-Message-State: AOAM531N2VAf/Cc5eNUadiuzLpDwPovFkRjym67RQmDti1vSVx2Df8bZ
 7rMqW4WoozCb3wSeQOM7Pl76cd4daFRZnYParWUUrg==
X-Google-Smtp-Source: ABdhPJwaF0wKQv33ANB5bA5bv4gTewTbmKGymsUnbTOlgelkOBHzHnvY0GanmDJKGKE2vLrSA5BhQg/dZPp1c4z2LGg=
X-Received: by 2002:a17:90b:3e85:b0:1c7:7eab:2649 with SMTP id
 rj5-20020a17090b3e8500b001c77eab2649mr29250564pjb.232.1648473856349; Mon, 28
 Mar 2022 06:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220317175852.799432-1-jose.exposito89@gmail.com>
 <4bd97d512e95845d7dd5a44d7713c59832676ada.camel@oss.nxp.com>
In-Reply-To: <4bd97d512e95845d7dd5a44d7713c59832676ada.camel@oss.nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 28 Mar 2022 15:24:05 +0200
Message-ID: <CAG3jFysp1xas4eVcRh5rysbgrhLAEJvsfYjHU=gHDT_JECaEUg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: nwl-dsi: switch to devm_drm_of_get_bridge
To: Liu Ying <victor.liu@oss.nxp.com>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Mar 2022 at 10:25, Liu Ying <victor.liu@oss.nxp.com> wrote:
>
> On Thu, 2022-03-17 at 18:58 +0100, Jos=C3=A9 Exp=C3=B3sito wrote:
> > The function "drm_of_find_panel_or_bridge" has been deprecated in
> > favor of "devm_drm_of_get_bridge".
> >
> > Switch to the new function and reduce boilerplate.
> >
> > Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> >
> > ---
> >
> > v2: (Thanks to Liu Ying)
> >
> >  - Rebase on top of drm-misc-next
> >  - Remove drm_of_panel_bridge_remove
> > ---
> >  drivers/gpu/drm/bridge/nwl-dsi.c | 23 ++++-------------------
> >  1 file changed, 4 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c
> > b/drivers/gpu/drm/bridge/nwl-dsi.c
> > index e34fb09b90b9..de62e3fc6a59 100644
> > --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> > +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> > @@ -912,19 +912,11 @@ static int nwl_dsi_bridge_attach(struct
> > drm_bridge *bridge,
> >  {
> >       struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
> >       struct drm_bridge *panel_bridge;
> > -     struct drm_panel *panel;
> > -     int ret;
> > -
> > -     ret =3D drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0,
> > &panel,
> > -                                       &panel_bridge);
> > -     if (ret)
> > -             return ret;
> >
> > -     if (panel) {
> > -             panel_bridge =3D drm_panel_bridge_add(panel);
> > -             if (IS_ERR(panel_bridge))
> > -                     return PTR_ERR(panel_bridge);
> > -     }
> > +     panel_bridge =3D devm_drm_of_get_bridge(dsi->dev, dsi->dev-
> > >of_node,
> > +                                           1, 0);
> > +     if (IS_ERR(panel_bridge))
> > +             return PTR_ERR(panel_bridge);
> >
> >       if (!panel_bridge)
> >               return -EPROBE_DEFER;
>
> I don't think panel_bridge can be NULL here, so this check can be
> removed.  However, even if this patch is not applied, the check is not
> necessary.  I think it can be removed with a separate patch.

Jos=C3=A9, do you mind clearing up if this check is needed, and then
spinning a v3 removing this snippet if it is needed?

Rob.
