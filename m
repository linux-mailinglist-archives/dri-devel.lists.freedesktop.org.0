Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69111346D9C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 23:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90DC89C1C;
	Tue, 23 Mar 2021 22:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB06F89C1C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 22:55:18 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id g15so16253708qkl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LvU9YixOg9nG0JyAgipWS5BaDSSltUCSNOb0sRibXqk=;
 b=NzgtPq2QsAv7BhUS8h+F4Wk+wXsV0d0QLjKZAeel9RRSIJJqGu1FTYaKsaXndisD1l
 t/ik7aRfvYrXBNEIAw+uwZ/Rai7OXqKb7YevAxlQa6/T6v81CB6EgaaBH1eyNvdywvxP
 KlgjFE84KaUlyrpWo/2tyfVm4uPQK1pIj/FT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LvU9YixOg9nG0JyAgipWS5BaDSSltUCSNOb0sRibXqk=;
 b=BfZ7zADnwj+CVrT+xgjLlvZJAd0QZueI6FzNeyN8wj0xFu0H3/xkUrxAEV2rh4LarN
 6tj1K+7F7fcvnydH8iqrx46nn44Ju1gw7m+TqxvI0XiODwRw5K6O1ZcXn5GWlIpqRBT/
 Woa+tDG+q6xqc8FxgrNEUn1FN3NRfx/269Z70nAbku8Cek71bNvEWzF0Y6HjWkus+x4+
 1AsVpVHmA8r1feb5cnHSo4/EiZRECl/KFw0KEKJdkggVFkYefzcFXTv+zwRYNx2MvrCX
 6qoW3VI4uEPYeYNcJ0EFWuroNHsIgDso7khgZu8Wb5XFUF1VHuYYR3Rf2aMABnkIx/6Q
 n1tA==
X-Gm-Message-State: AOAM533BUQe5ETOllekv5R+8c8+wJZdoVgvsJPdczs+G8QDZjElr4fWf
 GUABFtTKBWYqsZaqajZIvAwyGVtG0Tg9Rg==
X-Google-Smtp-Source: ABdhPJyr2FI2ZMgCGJshvxy8Pa4Uq7XTzqLns7yNjDYm5RBBqahoed/slhGpR838NyFqXEAeVFa0uQ==
X-Received: by 2002:a05:620a:11a4:: with SMTP id
 c4mr350700qkk.313.1616540117777; 
 Tue, 23 Mar 2021 15:55:17 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181])
 by smtp.gmail.com with ESMTPSA id v7sm280290qkv.86.2021.03.23.15.55.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 15:55:17 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id g12so12105177ybh.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:55:17 -0700 (PDT)
X-Received: by 2002:a25:2f4b:: with SMTP id v72mr706447ybv.79.1616540116568;
 Tue, 23 Mar 2021 15:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=W-+aS25wtnSmF8tWSDHTdNCjbFj0x02-1iqZ2p5qYzyA@mail.gmail.com>
 <YFpgfBW+U5R6urk0@pendragon.ideasonboard.com>
In-Reply-To: <YFpgfBW+U5R6urk0@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Mar 2021 15:55:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W76DXDsy_Ug5cQUVUfz18MzYp92hPKOiRm3Hf1jknPgQ@mail.gmail.com>
Message-ID: <CAD=FV=W76DXDsy_Ug5cQUVUfz18MzYp92hPKOiRm3Hf1jknPgQ@mail.gmail.com>
Subject: Re: [RFC PATCH 03/11] drm/bridge: ti-sn65dsi86: Unregister AUX
 adapter in remove()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Mar 23, 2021 at 2:42 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> On Tue, Mar 23, 2021 at 02:08:42PM -0700, Doug Anderson wrote:
> > On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> > >
> > > The AUX adapter registered in probe() need to be unregistered in
> > > remove(). Do so.
> > >
> > > Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > index da78a12e58b5..c45420a50e73 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > @@ -1307,6 +1307,9 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
> > >                 return -EINVAL;
> > >
> > >         kfree(pdata->edid);
> > > +
> > > +       drm_dp_aux_unregister(&pdata->aux);
> > > +
> > >         ti_sn_debugfs_remove(pdata);
> > >
> > >         of_node_put(pdata->host_node);
> >
> > Good catch. One question, though. I know DRM sometimes has different
> > conventions than the rest of the kernel, but I always look for the
> > "remove" to be backwards of probe. That means that your code (and
> > probably most of the remove function) should come _after_ the
> > drm_bridge_remove(), right?  ...since drm_bridge_add() was the last
> > thing in probe then drm_bridge_remove() should be the first thing in
> > remove?
>
> I agree in theory, yes. However, in practice, if you remove a bridge
> that is currently in use, all hell will break lose. And if the bridge
> isn't being used, it makes no difference. Still, it's worth changing the
> order of operations to move drm_bridge_remove() first, as it won't hurt
> in any case and is logically better. It's not an issue introduced by
> this series though, so how how about it on top, or in parallel ?

Sure, it can be a separate patch. I'd kinda prefer it be a patch
_before_ ${SUBJECT} patch, though. Specifically it's harder for me to
reason about whether your new function call is in the right place and
won't cause any problems with the order being all jumbled. If we fix
the order first then it's easy to reason about your patch.

> You can
> even submit a patch if you want :-)

Happy to post it up if it won't cause more confusion w/ you posting
your next version and trying to figure out what to base it on (since
it will definitely conflict with your series).

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
