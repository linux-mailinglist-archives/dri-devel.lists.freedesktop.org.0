Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1432360C2B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 16:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D0E6EA54;
	Thu, 15 Apr 2021 14:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334A46EA54
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 14:48:41 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id 130so11209312qkm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eQFFIM7pSZ3rNVADx3v3MXfqo0UYnXyfAUTQM2K5W9I=;
 b=YqgXOwr2Mt6Lvo/hqtmAeXPCGz6u5wu+SrcecmjKDQyC9GQaTDWQnPOyH2k0mtcoYP
 SASBrNZwIWRJ+0dEC/2PIl51tsk9Y5EvAh5TCAuBRYYfg+qfJ3ESXVTDrCbNGPaJAIXd
 G+E8vdMCY9dWUF8rh+b/jhgukZDc3iNNEg/+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eQFFIM7pSZ3rNVADx3v3MXfqo0UYnXyfAUTQM2K5W9I=;
 b=d9+LEYRisUuql/N4gIbnpCo7wuXaQCr9e9TGaTK61O+B+LQ5Gj/b81FBjkdw1t7+1H
 VQroq83W2HSA3uvKQYwXLqvh09uzKoY37dTDYXyIBn2FmVerZ1NeV3Hu85mwRDayvHq8
 U7rjzJBv3bMT0COjrO0MAffj0TbJSvBE6C8yloUcGuGuO6rW5LIl8L9e7UTSZ9vcglWg
 AWP5BDY+UjHWLUkmYOj7pXvz+eYvtekAp6dPZT9AL9H2/yogAqQrOofPAjgfxR+SsYgt
 oAwZnsFeFWnyNdwLxjeXYo0jZ/xpa/CHanODBFqz9Smti5naueY4YisEgy9CC+j3lnZg
 Om7Q==
X-Gm-Message-State: AOAM532nn2eYbUqXrcxRR5YTG1DhMsO0fdOUrJSnIUL/Sb6OftZi/ZtA
 iCXk6upBwG8K33xBTYq+ZXMbbTnGBriBkQ==
X-Google-Smtp-Source: ABdhPJyonv2JgwcWLqsnU44ztMLwByQ5JvlTEi88rrpBG/aQJZI6mP9rDlnG6h0CjgByK880sxdxqA==
X-Received: by 2002:a37:bb02:: with SMTP id l2mr3766885qkf.391.1618498120079; 
 Thu, 15 Apr 2021 07:48:40 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
 by smtp.gmail.com with ESMTPSA id z124sm2143952qke.36.2021.04.15.07.48.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 07:48:38 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id c195so26416716ybf.9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 07:48:38 -0700 (PDT)
X-Received: by 2002:a25:d847:: with SMTP id p68mr4882363ybg.345.1618498117948; 
 Thu, 15 Apr 2021 07:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
 <YGpeo9LV4uAh1B7u@pendragon.ideasonboard.com>
 <CAD=FV=UN38EiYMiwNjysBS6dReKDaf+g2GcgaVt9iF1mTRKg7A@mail.gmail.com>
 <YHedYnUrcnhRDnie@pendragon.ideasonboard.com>
In-Reply-To: <YHedYnUrcnhRDnie@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Apr 2021 07:48:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UhqCe1r1kqVdmYOmy75j_v73RSjP0d0MX0q5zq2GVJoQ@mail.gmail.com>
Message-ID: <CAD=FV=UhqCe1r1kqVdmYOmy75j_v73RSjP0d0MX0q5zq2GVJoQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] drm/bridge: Fix the stop condition of
 drm_bridge_chain_pre_enable()
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Apr 14, 2021 at 6:56 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> On Wed, Apr 14, 2021 at 06:19:13PM -0700, Doug Anderson wrote:
> > On Sun, Apr 4, 2021 at 5:50 PM Laurent Pinchart wrote:
> > > On Fri, Apr 02, 2021 at 03:28:35PM -0700, Douglas Anderson wrote:
> > > > The drm_bridge_chain_pre_enable() is not the proper opposite of
> > > > drm_bridge_chain_post_disable(). It continues along the chain to
> > > > _before_ the starting bridge. Let's fix that.
> > > >
> > > > Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> > > > ---
> > > >
> > > > (no changes since v1)
> > > >
> > > >  drivers/gpu/drm/drm_bridge.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > > > index 64f0effb52ac..044acd07c153 100644
> > > > --- a/drivers/gpu/drm/drm_bridge.c
> > > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > > @@ -522,6 +522,9 @@ void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
> > > >       list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> > > >               if (iter->funcs->pre_enable)
> > > >                       iter->funcs->pre_enable(iter);
> > > > +
> > > > +             if (iter == bridge)
> > > > +                     break;
> > >
> > > This looks good as it matches drm_atomic_bridge_chain_disable().
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Thanks for your review here and several of the other patches. Can you
> > suggest any plan for getting them landed? It would at least be nice to
> > get the non-controversial ones landed.
>
> Do you have commit access to drm-misc ? If not, given your
> contributions, I think you qualify for it.

No, I don't have access. I searched for how to get it and read through
the qualifications and, you're right, I think I do. I've hopefully
followed the right flow and created an issue to give me ssh access:

https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/348

Is that something you (or someone else on this CC list) approves?


> > > I'm curious though, given that the bridge passed to the function should
> > > be the one closest to the encoder, does this make a difference ?
> >
> > Yes, that's how I discovered it originally. Let's see. So if I don't
> > have this patch but have the rest of the series then I get a splat at
> > bootup. This shows that dsi_mgr_bridge_pre_enable() must be "earlier"
> > in the chain than my bridge chip. Here's the splat:
>
> Right, I think it's caused by a later patch in the series calling this
> function with a different bridge than the one closest to the encoder.

Yup! I still wanted this patch to be first in the series, though,
since it's a bugfix that we'd want to land even if the later patches
changed in some way.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
