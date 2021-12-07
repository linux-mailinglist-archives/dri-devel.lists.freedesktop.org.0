Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECE246C173
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 18:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C8A73F85;
	Tue,  7 Dec 2021 17:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF7C73F6C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 17:14:07 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id m5so14487095ilh.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 09:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iKXAfXf4jawMz0DDlq0/fhYvrtfDoveHg4joGIV1tHc=;
 b=HHBRg//NtTWRHhc7T2JTj+UEO6h8PdNWedTWAD4U85T0W79dQF95pQPl+9SD824n9D
 v6GQDFcSUs2t91zLJpA4vMlg4JnH0NXEeYEHBqmL9jd5COtKdvzZoxu8ht1tXMiGdP/q
 rQktpiAq8aSBhBZzc1+zVqmnx+ymGtMv0eDmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKXAfXf4jawMz0DDlq0/fhYvrtfDoveHg4joGIV1tHc=;
 b=wYUZYNsQk7QqPKSZda3v6WtZHtli8kBTEFq20UayPNoqdFdeDXkLBuBjSPc2GqsoSm
 pmvfMgBA5Kq6vMNrNhVyUb2R/G4168uoxB53ZuHhxavIhfCo55yqWmVVgF4wan1WVTNH
 RTuBCZoZP+qA4G7Aae+XxJd/P8PyvhzZYKEsyP8M5B/EU63y+pZKRS8jn1YZFSiVzOFQ
 zvLhu1OExTxyYWszAjqU3OUOtBRODx5Ie51SAmsXHf8fNDzIPhere1YTiKTyB4c5Hqkj
 OVJx5/v0PT1dPiaUlbqShlmKkuI3uSi/blxPqYqd4ceJvCpZAV/294EYqVQUt4OAT7iN
 HpiA==
X-Gm-Message-State: AOAM532GU817vJuzUPSSf6+ThgHudZYBcwHoRZgKAMl39GsBLhvxBv1o
 TAyVHJSPDGGkove6A86DxMGtMZ9xTZsVmw==
X-Google-Smtp-Source: ABdhPJyNTbIMAjSBGn906Xz6Es02eadGTgAs2+2+AUo6hCNWL9Brs+AV+L6gcRS7+sgHVc6EwDiXiw==
X-Received: by 2002:a05:6e02:1be5:: with SMTP id y5mr616592ilv.8.1638897245904; 
 Tue, 07 Dec 2021 09:14:05 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id s9sm184138ild.14.2021.12.07.09.14.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 09:14:05 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id k21so18046381ioh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 09:14:05 -0800 (PST)
X-Received: by 2002:a05:6638:190f:: with SMTP id
 p15mr52681316jal.82.1638897244878; 
 Tue, 07 Dec 2021 09:14:04 -0800 (PST)
MIME-Version: 1.0
References: <20211206162907.1.I1f5d1eba741e4663050ec1b8e39a753f6e42e38b@changeid>
 <CA+cxXhkmsUMCCJrvbz76nx-ctzSZhg0BFb50qD3nzUon3-Gp+w@mail.gmail.com>
 <CAD=FV=Wr1oai4-oBSJDiuMEV=KYZjW815jL1kh+yuiGdkK3ZbQ@mail.gmail.com>
 <CA+cxXhmFp31g+_hqj12FVy8Qu7xgssw3aA23OyEBrmTEys9B_w@mail.gmail.com>
In-Reply-To: <CA+cxXhmFp31g+_hqj12FVy8Qu7xgssw3aA23OyEBrmTEys9B_w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Dec 2021 09:13:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wu6ouGBrjVRqLY42RxrAxMPWZuyY7PZuSAE3VoVM92Rg@mail.gmail.com>
Message-ID: <CAD=FV=Wu6ouGBrjVRqLY42RxrAxMPWZuyY7PZuSAE3VoVM92Rg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Add backpointer to drm_device
 in drm_dp_aux
To: Philip Chen <philipchen@chromium.org>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 7, 2021 at 8:52 AM Philip Chen <philipchen@chromium.org> wrote:
>
> Hi
>
> On Tue, Dec 7, 2021 at 8:13 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Mon, Dec 6, 2021 at 5:44 PM Philip Chen <philipchen@chromium.org> wrote:
> > >
> > > Hi
> > >
> > > On Mon, Dec 6, 2021 at 4:29 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > When we added the support for the AUX channel in commit 13afcdd7277e
> > > > ("drm/bridge: parade-ps8640: Add support for AUX channel") we forgot
> > > > to set "drm_dev" to avoid the warning splat at the beginning of
> > > > drm_dp_aux_register(). Since everything was working I guess I never
> > > > noticed the splat when testing against mainline. In any case, it's
> > > > easy to fix. This is basically just like commit 6cba3fe43341 ("drm/dp:
> > > > Add backpointer to drm_device in drm_dp_aux") but just for the
> > > > parade-ps8640.
> > > >
> > > > Fixes: 13afcdd7277e ("drm/bridge: parade-ps8640: Add support for AUX channel")
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > >  drivers/gpu/drm/bridge/parade-ps8640.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > > index 26898042ba3d..818704bf5e86 100644
> > > > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > > > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > > @@ -449,6 +449,7 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
> > > >         if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> > > >                 return -EINVAL;
> > > >
> > > > +       ps_bridge->aux.drm_dev = bridge->dev;
> > > >         ret = drm_dp_aux_register(&ps_bridge->aux);
> > > >         if (ret) {
> > > >                 dev_err(dev, "failed to register DP AUX channel: %d\n", ret);
> > > > --
> > > > 2.34.1.400.ga245620fadb-goog
> > > >
> > >
> > > Signed-off-by: Philip Chen <philipchen@chromium.org>
> >
> > That's probably not quite the right tag. I'm going to assume you meant
> > Reviewed-by? Usually Signed-off-by is added if you were one of the
> > authors of the patch or you were a maintainer that "touched" the patch
> > on its way to landing upstream...
> >
> > -Doug
>
> Sorry for the mistake.
> You're right - I meant to:
>
> Reviewed-by: Philip Chen <philipchen@chromium.org>

Thanks! Since this is pretty trivial/straightforward, I've pushed it.
I ended up pushing it to drm-misc-next instead of drm-misc-fixes to
avoid a merge conflict and because this doesn't seem urgent enough to
justify having to deal with the merge conflict. Please yell if I
should make a different choice in instances like this in the future.

f8378c040381 drm/bridge: parade-ps8640: Add backpointer to drm_device
in drm_dp_aux

-Doug
