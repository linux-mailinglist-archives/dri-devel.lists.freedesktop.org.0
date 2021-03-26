Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B74349E31
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 01:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319C56EE6B;
	Fri, 26 Mar 2021 00:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334C26EE6B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 00:43:37 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id 1so2538752qtb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 17:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6l8qPlBwWGhFEr62tjoDbv6LpnDOpMR2bfxtHw91Jxs=;
 b=ZkdIaBz9YBB7X2wWeZDzOdwadwUmFCH5Zo/DN26SAAz9fLSNhRvK7G6ENjEtbI+hLW
 aH5yh0pa2ahVbOdqnqFh0kwTbUEXt0FwzOrI5aeGZWl252m2AxWpmGQNGKOSTpQ2ybNS
 uoUXKTOHOsUmRVgciH7rLfSudEqhFJYvGHljU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6l8qPlBwWGhFEr62tjoDbv6LpnDOpMR2bfxtHw91Jxs=;
 b=CPUcz+YQHYjUc5R2RXpx9WEMP8uF8a1gUY4QyUj1iuNeiMufBxXmdy+X5Epr7vAwvO
 y6ZRzF3pzTeDTHx5bSpfbrfWeN8L13hmJji605Ho+DGbeT+8obwDfrOlejhiQHU8X34l
 N5WMEW7aS7Qj2pnHHlATmQT8qGW7MNf4UgMw6zCVo1yosWGOiptiQnSG6Zz8YhaCVySC
 8K72zcFNwwrgNrEv8VUPXDRzjRAeOAEWqQB0yTzDwejUvSj9xSH6FzIXWtY7PUNVekEU
 SFrP9n/oQAXop14ZNTxBTgBqyNnR8EeY+MdLnrsg3plGOdJaoSG9fHWmLEt7BwfvPKzh
 B6nQ==
X-Gm-Message-State: AOAM531yTD1FCWKKuSjj3lhmidFXuvZAOWDc8VHBXWRJW/uX3RRgQruz
 lTaGud82ddrCAeXcp7/lBRCj/FGLPrSe8A==
X-Google-Smtp-Source: ABdhPJyENQ9a+tO06KN2Mjb94uumj2QEJ7r71AyMcTTnHZMGLb6eowOjgUO7s2Oc6FIHnio2GakAlA==
X-Received: by 2002:aed:2981:: with SMTP id o1mr10039523qtd.386.1616719416004; 
 Thu, 25 Mar 2021 17:43:36 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id j24sm5509146qka.67.2021.03.25.17.43.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 17:43:35 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id a143so4179498ybg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 17:43:34 -0700 (PDT)
X-Received: by 2002:a25:69c1:: with SMTP id
 e184mr16137873ybc.345.1616719414494; 
 Thu, 25 Mar 2021 17:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=W-+aS25wtnSmF8tWSDHTdNCjbFj0x02-1iqZ2p5qYzyA@mail.gmail.com>
 <YFpgfBW+U5R6urk0@pendragon.ideasonboard.com>
 <CAD=FV=W76DXDsy_Ug5cQUVUfz18MzYp92hPKOiRm3Hf1jknPgQ@mail.gmail.com>
 <YFpznvA/m3KfEEqz@pendragon.ideasonboard.com>
In-Reply-To: <YFpznvA/m3KfEEqz@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 Mar 2021 17:43:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WoivERNCXtCa6UFix6e+K5JZpXca_ipnEwtA4rkSLgZA@mail.gmail.com>
Message-ID: <CAD=FV=WoivERNCXtCa6UFix6e+K5JZpXca_ipnEwtA4rkSLgZA@mail.gmail.com>
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

On Tue, Mar 23, 2021 at 4:03 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> On Tue, Mar 23, 2021 at 03:55:05PM -0700, Doug Anderson wrote:
> > On Tue, Mar 23, 2021 at 2:42 PM Laurent Pinchart wrote:
> > > On Tue, Mar 23, 2021 at 02:08:42PM -0700, Doug Anderson wrote:
> > > > On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> > > > >
> > > > > The AUX adapter registered in probe() need to be unregistered in
> > > > > remove(). Do so.
> > > > >
> > > > > Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > ---
> > > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > index da78a12e58b5..c45420a50e73 100644
> > > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > @@ -1307,6 +1307,9 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
> > > > >                 return -EINVAL;
> > > > >
> > > > >         kfree(pdata->edid);
> > > > > +
> > > > > +       drm_dp_aux_unregister(&pdata->aux);
> > > > > +
> > > > >         ti_sn_debugfs_remove(pdata);
> > > > >
> > > > >         of_node_put(pdata->host_node);
> > > >
> > > > Good catch. One question, though. I know DRM sometimes has different
> > > > conventions than the rest of the kernel, but I always look for the
> > > > "remove" to be backwards of probe. That means that your code (and
> > > > probably most of the remove function) should come _after_ the
> > > > drm_bridge_remove(), right?  ...since drm_bridge_add() was the last
> > > > thing in probe then drm_bridge_remove() should be the first thing in
> > > > remove?
> > >
> > > I agree in theory, yes. However, in practice, if you remove a bridge
> > > that is currently in use, all hell will break lose. And if the bridge
> > > isn't being used, it makes no difference. Still, it's worth changing the
> > > order of operations to move drm_bridge_remove() first, as it won't hurt
> > > in any case and is logically better. It's not an issue introduced by
> > > this series though, so how how about it on top, or in parallel ?
> >
> > Sure, it can be a separate patch. I'd kinda prefer it be a patch
> > _before_ ${SUBJECT} patch, though. Specifically it's harder for me to
> > reason about whether your new function call is in the right place and
> > won't cause any problems with the order being all jumbled. If we fix
> > the order first then it's easy to reason about your patch.
> >
> > > You can
> > > even submit a patch if you want :-)
> >
> > Happy to post it up if it won't cause more confusion w/ you posting
> > your next version and trying to figure out what to base it on (since
> > it will definitely conflict with your series).
>
> I'll need quite a bit of time before v2, as I'd like to test it, and
> that requires finishing support for the DSI bridge and the display
> controller :-) Please feel free to post a patch if you have time, I
> think it could get merged in drm-misc quite quickly.

I haven't forgotten about this and I've got it written, but I'm trying
to put it together with the work I'm doing to fix EDID reading and
that's still going to take me a while longer. I'm out tomorrow but
_hoping_ that I'll be able to at least get a new patch series (at
least RFC quality) next week...

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
