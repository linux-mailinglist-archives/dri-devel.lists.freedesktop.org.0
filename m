Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2D046C07A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 17:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC0DEADB4;
	Tue,  7 Dec 2021 16:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DB9EAD90
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 16:13:50 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id e128so17818853iof.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 08:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kzGboToRcV0ILOazZeGz7y2npnpA2DxrrdkkmwY41hM=;
 b=JriXVx9KiAH7TFoDJ2n7F6ZdaBtzxmBEHQ80eMzObRJ6M89o2rLqEBAs1WSa54Z0NW
 6JzbJjafp01F7Kmt+FE9HVqsjp5cyOTm0WDQgoFdt56u0/GKDol2IjWW/RPWXfMl2qAx
 uDP6L7d9bTe4VxDPPlvA3dZ7ltDLg4My5F4r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kzGboToRcV0ILOazZeGz7y2npnpA2DxrrdkkmwY41hM=;
 b=kzz0T8/LOpvrge61SZwKPQ1AbZDnFp00FPSq8PR2M6NeEtfrPoFVz1hLNSMN9Qy3da
 LD3MB4h1bTq3x5LMDdpKXef6boZB9PkgDjA0A8ipaJwQp+6cORavRCdkqk0LqXe6Jlaz
 EZoCHNjGvecwiIAZGIaeWiI9cwsvIbuiTlnY8IUqrnsugBtoi8UAu/7F3orjEJnjxmkO
 k6tXtmDY5Nca1CnkDKuEUce3PES+UBAI5VWChhKnyGS3Z9WGswoi+EYL1lucOGpeMhuk
 KMGD0lgtFXCQ/EFE5wmjgIg80dtjfryy+DW87nrtQoTQ6hUpbr3gy0p+c9fKcxpzLNYh
 Y8GA==
X-Gm-Message-State: AOAM532/kD2zgk0FXnZPiHF1gMCGVict1D9fJn3IxubXp69RVKcQQ6Ml
 8p8RQuZD4rlpFWQUY1vr7AwCuJl2sD4crw==
X-Google-Smtp-Source: ABdhPJw6XEWEh9ID/g60kOiNobWLFZI32jO1CRgDB2AesTmZuAKKe2ehkHqd2nwYPpoQvdF3sC6Bbw==
X-Received: by 2002:a6b:2ccf:: with SMTP id s198mr285414ios.101.1638893629103; 
 Tue, 07 Dec 2021 08:13:49 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com.
 [209.85.166.176])
 by smtp.gmail.com with ESMTPSA id h14sm79902ild.16.2021.12.07.08.13.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 08:13:48 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id r2so14325112ilb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 08:13:48 -0800 (PST)
X-Received: by 2002:a05:6e02:144f:: with SMTP id
 p15mr329453ilo.180.1638893627637; 
 Tue, 07 Dec 2021 08:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20211206162907.1.I1f5d1eba741e4663050ec1b8e39a753f6e42e38b@changeid>
 <CA+cxXhkmsUMCCJrvbz76nx-ctzSZhg0BFb50qD3nzUon3-Gp+w@mail.gmail.com>
In-Reply-To: <CA+cxXhkmsUMCCJrvbz76nx-ctzSZhg0BFb50qD3nzUon3-Gp+w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Dec 2021 08:13:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wr1oai4-oBSJDiuMEV=KYZjW815jL1kh+yuiGdkK3ZbQ@mail.gmail.com>
Message-ID: <CAD=FV=Wr1oai4-oBSJDiuMEV=KYZjW815jL1kh+yuiGdkK3ZbQ@mail.gmail.com>
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

On Mon, Dec 6, 2021 at 5:44 PM Philip Chen <philipchen@chromium.org> wrote:
>
> Hi
>
> On Mon, Dec 6, 2021 at 4:29 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > When we added the support for the AUX channel in commit 13afcdd7277e
> > ("drm/bridge: parade-ps8640: Add support for AUX channel") we forgot
> > to set "drm_dev" to avoid the warning splat at the beginning of
> > drm_dp_aux_register(). Since everything was working I guess I never
> > noticed the splat when testing against mainline. In any case, it's
> > easy to fix. This is basically just like commit 6cba3fe43341 ("drm/dp:
> > Add backpointer to drm_device in drm_dp_aux") but just for the
> > parade-ps8640.
> >
> > Fixes: 13afcdd7277e ("drm/bridge: parade-ps8640: Add support for AUX channel")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > index 26898042ba3d..818704bf5e86 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -449,6 +449,7 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
> >         if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> >                 return -EINVAL;
> >
> > +       ps_bridge->aux.drm_dev = bridge->dev;
> >         ret = drm_dp_aux_register(&ps_bridge->aux);
> >         if (ret) {
> >                 dev_err(dev, "failed to register DP AUX channel: %d\n", ret);
> > --
> > 2.34.1.400.ga245620fadb-goog
> >
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>

That's probably not quite the right tag. I'm going to assume you meant
Reviewed-by? Usually Signed-off-by is added if you were one of the
authors of the patch or you were a maintainer that "touched" the patch
on its way to landing upstream...

-Doug
