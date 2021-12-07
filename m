Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2E646C106
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 17:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61836EBEB0;
	Tue,  7 Dec 2021 16:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D443CEBEB0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 16:52:39 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id g17so42423349ybe.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 08:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LC8TQ58A6yrTmrin8RsMj+8+QtQUOswv6bH5qV0Utbo=;
 b=UZRValTXKR/oc2THTvTEl40AaZoZmmF1VJugCglgWkrEypPrLDI0WtDzKEuUloiA29
 puTXN4rluBzoT0/W3YiedwfQ2Gl7dhjeWPifCPF6TFLwnbc0enFpAyINl8ZPo6w5e0Va
 +7y/GVTWdHENc7oSdN5ODZNZrr22oq3zw4gzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LC8TQ58A6yrTmrin8RsMj+8+QtQUOswv6bH5qV0Utbo=;
 b=grCpBKZC/biKTJOaE5NkOS0xc0T1y2PbFxCrkM4rLJNA29I5QpC2gpisI5pL0D4Mvx
 4rXsHKShPkOKN3vMTyRTWYwRGnyqltKKKDP/3sUnA91ahd/BDwkTkqLMzB6SyN8fmCwt
 EROG5xxMqvy0VjDZaptBFm2koYOt/K+/DZyLiALjljhjxkBUjn6DVPFgEqMd7+PiMC77
 ykLoi1egoKmpb0l6s6CsheBHV9Iu3bGx3YlTszDjqxTLSb/FR25/r8kzYQ8MB0HF7FVk
 yL7SaHhAfKy6901d8y23W12GF2y2xXFBTGJCpO4LVgJ53j3CV/YNlYOWtaAlraEdvImp
 KBcQ==
X-Gm-Message-State: AOAM530l23FZMS3tocJsmTIUDsCeSGQXH0Yp4EgjeDGbc2n1Xl3EEgV3
 mxkElpDqcfgs516DeINIUqdr57Ry7Rzs5wRNkeMd9A==
X-Google-Smtp-Source: ABdhPJyEAPgMDBe6t6R0ogoPTPcmgRwjajGVsulJ6aI3aPgJSiokY9OsP1tpA3DsY3UKYVeJEf46azeAAOh7+sfnc/o=
X-Received: by 2002:a25:aea4:: with SMTP id b36mr54177634ybj.182.1638895958905; 
 Tue, 07 Dec 2021 08:52:38 -0800 (PST)
MIME-Version: 1.0
References: <20211206162907.1.I1f5d1eba741e4663050ec1b8e39a753f6e42e38b@changeid>
 <CA+cxXhkmsUMCCJrvbz76nx-ctzSZhg0BFb50qD3nzUon3-Gp+w@mail.gmail.com>
 <CAD=FV=Wr1oai4-oBSJDiuMEV=KYZjW815jL1kh+yuiGdkK3ZbQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Wr1oai4-oBSJDiuMEV=KYZjW815jL1kh+yuiGdkK3ZbQ@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Tue, 7 Dec 2021 08:52:28 -0800
Message-ID: <CA+cxXhmFp31g+_hqj12FVy8Qu7xgssw3aA23OyEBrmTEys9B_w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Add backpointer to drm_device
 in drm_dp_aux
To: Doug Anderson <dianders@chromium.org>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Tue, Dec 7, 2021 at 8:13 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Dec 6, 2021 at 5:44 PM Philip Chen <philipchen@chromium.org> wrote:
> >
> > Hi
> >
> > On Mon, Dec 6, 2021 at 4:29 PM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > When we added the support for the AUX channel in commit 13afcdd7277e
> > > ("drm/bridge: parade-ps8640: Add support for AUX channel") we forgot
> > > to set "drm_dev" to avoid the warning splat at the beginning of
> > > drm_dp_aux_register(). Since everything was working I guess I never
> > > noticed the splat when testing against mainline. In any case, it's
> > > easy to fix. This is basically just like commit 6cba3fe43341 ("drm/dp:
> > > Add backpointer to drm_device in drm_dp_aux") but just for the
> > > parade-ps8640.
> > >
> > > Fixes: 13afcdd7277e ("drm/bridge: parade-ps8640: Add support for AUX channel")
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  drivers/gpu/drm/bridge/parade-ps8640.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > index 26898042ba3d..818704bf5e86 100644
> > > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > @@ -449,6 +449,7 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
> > >         if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> > >                 return -EINVAL;
> > >
> > > +       ps_bridge->aux.drm_dev = bridge->dev;
> > >         ret = drm_dp_aux_register(&ps_bridge->aux);
> > >         if (ret) {
> > >                 dev_err(dev, "failed to register DP AUX channel: %d\n", ret);
> > > --
> > > 2.34.1.400.ga245620fadb-goog
> > >
> >
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
>
> That's probably not quite the right tag. I'm going to assume you meant
> Reviewed-by? Usually Signed-off-by is added if you were one of the
> authors of the patch or you were a maintainer that "touched" the patch
> on its way to landing upstream...
>
> -Doug

Sorry for the mistake.
You're right - I meant to:

Reviewed-by: Philip Chen <philipchen@chromium.org>
