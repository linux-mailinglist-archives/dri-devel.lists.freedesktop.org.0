Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2D04BF3E4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEED10F664;
	Tue, 22 Feb 2022 08:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0467410F674
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:43:49 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id c6so32262374edk.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 00:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qqfYQHAPVcgxACaE9jZawYGV9u1KIP97hurfRmVCgFM=;
 b=QqlIE3zChvCmLWQuD0piYsNsmCxf1ptWHWGoCGyJYMuTquUUb43kiZ4uz8gueEs4E+
 YhFp6wd8M2/ZZHzwx5t9qHQnpfeimjirgROsvppu6b6+Jpc/DXx2Wz/I+ruMCc6lOM9C
 3De6Jds0UAo3YERSb1LzPmWgKoos2x/QPsKEYTHYY5NzjXZKpSijocgecG4YdOcoK02w
 23gKwnrZwi8AqVkhQrkcWnKkNtriXhaEXjfbqzX99aYY1RM5CoKX+rT97K1f5aZIhCB4
 ZFwzmZnNlRVRoeDeDwvWGXh/dHoWmRGxFqXzWWhu6ljwU1yhPgqmmisMg2X8GH1hNp40
 MrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qqfYQHAPVcgxACaE9jZawYGV9u1KIP97hurfRmVCgFM=;
 b=nhNQMTxJhARmhE4nzgHbBQBD5PaEeZOeOKa1RG7pU/xrePkYwp3pJMzxJLscXoKOJI
 in0lb7u1qf5gbA/IPLqX4iAR0CRU17LU4WPL3F90lxAIGhS66KQBYKP0Q0Lkaxs5NvOA
 CQZL7qI7YC3Pn5Y1Fat+J4+qHKNPyr5FwagTa1RwfBaFI1HJzoUWt7UMphN8vPHbpMiF
 kQlxdsKFqUlplKySVB8p+t3LXdPYWPH/VjS7yBOtsPabGiEKH4h/GARSzmnUHN0iw2SU
 eAaGKh+CwC0boLTpdlvUY5cwPp0TRBc8nyXkfHd3XNPBXJ+QVwbKV9Mc8jM7vIq/cyDu
 fWqg==
X-Gm-Message-State: AOAM530YtMjCw3f8s9sUTVi8oeV7kYXekaHfsyUGQoExrXxA2RjZCHYi
 lOL9QzDlvz2GSRGnfQ0tpBFKbxaSjwE9McTpxYtLng==
X-Google-Smtp-Source: ABdhPJwuxXwwMQLWT1LAejeWkpF3s9Pbs3CEt9phP7SCqGSwS1dqMZ28yfZbxP/q1WvD7+NeKeXTJmN7zhCE0SBjRIo=
X-Received: by 2002:a05:6402:1cc1:b0:413:2b12:fc49 with SMTP id
 ds1-20020a0564021cc100b004132b12fc49mr623983edb.118.1645519428387; Tue, 22
 Feb 2022 00:43:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
 <4c6511bd7f4ce52aa3323141b6f0a68ae2773787.1645029005.git.dave.stevenson@raspberrypi.com>
 <YhSD1zHxaOeCitgz@pendragon.ideasonboard.com>
In-Reply-To: <YhSD1zHxaOeCitgz@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 22 Feb 2022 08:43:32 +0000
Message-ID: <CAPY8ntA=1ZD2kgFy=deuV4FWetT7wq3s_=eKH6kJwOx6CBLTkw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Introduce DRM_BRIDGE_OP_UPSTREAM_FIRST to alter
 bridge init order
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

Thanks for the review.

On Tue, 22 Feb 2022 at 06:34, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Thank you for the patch.
>
> On Wed, Feb 16, 2022 at 04:59:43PM +0000, Dave Stevenson wrote:
> > DSI sink devices typically want the DSI host powered up and configured
> > before they are powered up. pre_enable is the place this would normally
> > happen, but they are called in reverse order from panel/connector towards
> > the encoder, which is the "wrong" order.
> >
> > Add a new flag DRM_BRIDGE_OP_UPSTREAM_FIRST that any bridge can set
> > to swap the order of pre_enable (and post_disable) so that any upstream
> > bridges are called first to create the desired state.
> >
> > eg:
> > - Panel
> > - Bridge 1
> > - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
> > - Bridge 3
> > - Encoder
> > Would result in pre_enable's being called as Panel, Bridge 1, Bridge 3,
> > Bridge 2.
>
> If there was a Bridge 4 between Bridge 3 and Encoder, would it be
>
> Panel, Bridge 1, Bridge 3, Bridge 4, Bridge 2
>
> ? I'd capture that here, to be explicit.

No.
 - Panel
 - Bridge 1
 - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
 - Bridge 3
 - Bridge 4
  - Encoder
Would result in pre_enable's being called as Panel, Bridge 1, Bridge
3, Bridge 2, Bridge 4, Encoder.
ie it only swaps the order of bridges 2 & 3.

 - Panel
 - Bridge 1
 - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
 - Bridge 3 DRM_BRIDGE_OP_UPSTREAM_FIRST
 - Bridge 4
 - Encoder
Would result in pre_enable's being called as Panel, Bridge 1, Bridge
4, Bridge 3, Bridge 2, Encoder.
(Bridge 2&3 have asked for upstream to be enabled first, which means
bridge 4. Bridge 2 wants upstream enabled first, which means bridge
3).

 - Panel
 - Bridge 1
 - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
 - Bridge 3
 - Bridge 4 DRM_BRIDGE_OP_UPSTREAM_FIRST
 - Bridge 5
 - Encoder
Would result in Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 5, Bridge
4, Encoder.

So we only reverse the order whilst the bridges request that they want
upstream enabled first, but we can do that multiple times within the
chain. I hope that makes sense.

> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 197 +++++++++++++++++++++++++++++++++++++------
> >  include/drm/drm_bridge.h     |   8 ++
> >  2 files changed, 180 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index c96847fc0ebc..7c24e8340efa 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -522,21 +522,58 @@ EXPORT_SYMBOL(drm_bridge_chain_disable);
> >   * Calls &drm_bridge_funcs.post_disable op for all the bridges in the
> >   * encoder chain, starting from the first bridge to the last. These are called
> >   * after completing the encoder's prepare op.
>
> Missing blank line, as well as in three locations below.
>
> > + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the post_disable for
> > + * that bridge will be called before the previous one to reverse the pre_enable
> > + * calling direction.
> >   *
> >   * Note: the bridge passed should be the one closest to the encoder
> >   */
> >  void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
> >  {
> >       struct drm_encoder *encoder;
> > +     struct drm_bridge *next, *limit;
> >
> >       if (!bridge)
> >               return;
> >
> >       encoder = bridge->encoder;
> >       list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> > +             limit = NULL;
> > +
> > +             if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
> > +                     next = list_next_entry(bridge, chain_node);
> > +
> > +                     if (next->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
> > +                             limit = next;
> > +
> > +                             list_for_each_entry_from(next, &encoder->bridge_chain,
> > +                                                      chain_node) {
> > +                                     if (!(next->ops &
> > +                                             DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
> > +                                             next = list_prev_entry(next, chain_node);
> > +                                             limit = next;
> > +                                             break;
> > +                                     }
> > +                             }
> > +
> > +                             list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
> > +                                                              chain_node) {
> > +                                     if (next == bridge)
> > +                                             break;
> > +
> > +                                     if (next->funcs->post_disable)
> > +                                             next->funcs->post_disable(next);
> > +                             }
> > +                     }
> > +             }
> > +
> >               if (bridge->funcs->post_disable)
> >                       bridge->funcs->post_disable(bridge);
> > +
> > +             if (limit)
> > +                     bridge = limit;
> >       }
> > +
> >  }
> >  EXPORT_SYMBOL(drm_bridge_chain_post_disable);
> >
> > @@ -577,22 +614,53 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
> >   * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
> >   * chain, starting from the last bridge to the first. These are called
> >   * before calling the encoder's commit op.
> > + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the pre_enable for
> > + * the previous bridge will be called before pre_enable of this bridge.
> >   *
> >   * Note: the bridge passed should be the one closest to the encoder
> >   */
> >  void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
> >  {
> >       struct drm_encoder *encoder;
> > -     struct drm_bridge *iter;
> > +     struct drm_bridge *iter, *next, *limit;
> >
> >       if (!bridge)
> >               return;
> >
> >       encoder = bridge->encoder;
> > +
> >       list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> > +             if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
> > +                     next = iter;
> > +                     limit = bridge;
> > +                     list_for_each_entry_from_reverse(next,
> > +                                                      &encoder->bridge_chain,
> > +                                                      chain_node) {
> > +                             if (next == bridge)
> > +                                     break;
> > +
> > +                             if (!(next->ops &
> > +                                     DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
> > +                                     limit = list_prev_entry(next, chain_node);
> > +                                     break;
> > +                             }
> > +                     }
> > +
> > +                     list_for_each_entry_from(next, &encoder->bridge_chain, chain_node) {
> > +                             if (next == iter)
> > +                                     break;
> > +
> > +                             if (next->funcs->pre_enable)
> > +                                     next->funcs->pre_enable(next);
> > +                     }
> > +             }
> > +
> >               if (iter->funcs->pre_enable)
> >                       iter->funcs->pre_enable(iter);
> >
> > +             if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST)
> > +                     iter = limit;
> > +
> >               if (iter == bridge)
> >                       break;
> >       }
> > @@ -667,6 +735,25 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
> >  }
> >  EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
> >
> > +static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
> > +                                             struct drm_atomic_state *old_state)
> > +{
> > +     if (bridge->funcs->atomic_post_disable) {
> > +             struct drm_bridge_state *old_bridge_state;
> > +
> > +             old_bridge_state =
> > +                     drm_atomic_get_old_bridge_state(old_state,
> > +                                                     bridge);
> > +             if (WARN_ON(!old_bridge_state))
> > +                     return;
> > +
> > +             bridge->funcs->atomic_post_disable(bridge,
> > +                                                old_bridge_state);
> > +     } else if (bridge->funcs->post_disable) {
> > +             bridge->funcs->post_disable(bridge);
> > +     }
> > +}
> > +
> >  /**
> >   * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
> >   *                                     in the encoder chain
> > @@ -677,6 +764,9 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
> >   * &drm_bridge_funcs.post_disable) op for all the bridges in the encoder chain,
> >   * starting from the first bridge to the last. These are called after completing
> >   * &drm_encoder_helper_funcs.atomic_disable
> > + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the post_disable for
> > + * that bridge will be called before the previous one to reverse the pre_enable
> > + * calling direction.
> >   *
> >   * Note: the bridge passed should be the one closest to the encoder
> >   */
> > @@ -684,30 +774,69 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
> >                                         struct drm_atomic_state *old_state)
> >  {
> >       struct drm_encoder *encoder;
> > +     struct drm_bridge *next, *limit;
> >
> >       if (!bridge)
> >               return;
> >
> >       encoder = bridge->encoder;
> > +
> >       list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> > -             if (bridge->funcs->atomic_post_disable) {
> > -                     struct drm_bridge_state *old_bridge_state;
> > +             limit = NULL;
> > +
> > +             if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
> > +                     next = list_next_entry(bridge, chain_node);
> > +
> > +                     if (next->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
> > +                             limit = next;
> > +
> > +                             list_for_each_entry_from(next, &encoder->bridge_chain,
> > +                                                      chain_node) {
> > +                                     if (!(next->ops &
> > +                                             DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
> > +                                             next = list_prev_entry(next, chain_node);
> > +                                             limit = next;
> > +                                             break;
> > +                                     }
> > +                             }
> > +
> > +                             list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
> > +                                                              chain_node) {
> > +                                     if (next == bridge)
> > +                                             break;
> > +
> > +                                     drm_atomic_bridge_call_post_disable(next,
> > +                                                                         old_state);
> > +                             }
> > +                     }
> > +             }
> >
> > -                     old_bridge_state =
> > -                             drm_atomic_get_old_bridge_state(old_state,
> > -                                                             bridge);
> > -                     if (WARN_ON(!old_bridge_state))
> > -                             return;
> > +             drm_atomic_bridge_call_post_disable(bridge, old_state);
> >
> > -                     bridge->funcs->atomic_post_disable(bridge,
> > -                                                        old_bridge_state);
> > -             } else if (bridge->funcs->post_disable) {
> > -                     bridge->funcs->post_disable(bridge);
> > -             }
> > +             if (limit)
> > +                     bridge = limit;
> >       }
> >  }
> >  EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
> >
> > +static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
> > +                                           struct drm_atomic_state *old_state)
> > +{
> > +     if (bridge->funcs->atomic_pre_enable) {
> > +             struct drm_bridge_state *old_bridge_state;
> > +
> > +             old_bridge_state =
> > +                     drm_atomic_get_old_bridge_state(old_state,
> > +                                                     bridge);
> > +             if (WARN_ON(!old_bridge_state))
> > +                     return;
> > +
> > +             bridge->funcs->atomic_pre_enable(bridge, old_bridge_state);
> > +     } else if (bridge->funcs->pre_enable) {
> > +             bridge->funcs->pre_enable(bridge);
> > +     }
> > +}
> > +
> >  /**
> >   * drm_atomic_bridge_chain_pre_enable - prepares for enabling all bridges in
> >   *                                   the encoder chain
> > @@ -718,6 +847,8 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
> >   * &drm_bridge_funcs.pre_enable) op for all the bridges in the encoder chain,
> >   * starting from the last bridge to the first. These are called before calling
> >   * &drm_encoder_helper_funcs.atomic_enable
> > + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the pre_enable for
> > + * the previous bridge will be called before pre_enable of this bridge.
> >   *
> >   * Note: the bridge passed should be the one closest to the encoder
> >   */
> > @@ -725,26 +856,42 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
> >                                       struct drm_atomic_state *old_state)
> >  {
> >       struct drm_encoder *encoder;
> > -     struct drm_bridge *iter;
> > +     struct drm_bridge *iter, *next, *limit;
> >
> >       if (!bridge)
> >               return;
> >
> >       encoder = bridge->encoder;
> > +
> >       list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> > -             if (iter->funcs->atomic_pre_enable) {
> > -                     struct drm_bridge_state *old_bridge_state;
> > +             if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
> > +                     next = iter;
> > +                     limit = bridge;
> > +                     list_for_each_entry_from_reverse(next,
> > +                                                      &encoder->bridge_chain,
> > +                                                      chain_node) {
> > +                             if (next == bridge)
> > +                                     break;
> > +
> > +                             if (!(next->ops &
> > +                                     DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
> > +                                     limit = list_prev_entry(next, chain_node);
> > +                                     break;
> > +                             }
> > +                     }
> > +
> > +                     list_for_each_entry_from(next, &encoder->bridge_chain, chain_node) {
> > +                             if (next == iter)
> > +                                     break;
> > +
> > +                             drm_atomic_bridge_call_pre_enable(next, old_state);
> > +                     }
> > +             }
>
> This is hard to understand, I have trouble figuring out if it does the
> right thing when multiple bridges set the DRM_BRIDGE_OP_UPSTREAM_FIRST
> flag (or actually even when a single bridge does so). Comments would
> help, but I wonder if it wouldn't be simpler to switch to a recursive
> implementation.

Recursive - such joys!
With the explanation above, I'm not sure that recursive helps, but
certainly can add comments.

> It also seems that merging the legacy and atomic versions of the code
> would be a good idea. They could both call into a shared implementation,
> with the legacy version passing a NULL state, and the atomic op being
> considered only if the state is not NULL.

OK, I'll look into that.

> >
> > -                     old_bridge_state =
> > -                             drm_atomic_get_old_bridge_state(old_state,
> > -                                                             iter);
> > -                     if (WARN_ON(!old_bridge_state))
> > -                             return;
> > +             drm_atomic_bridge_call_pre_enable(iter, old_state);
> >
> > -                     iter->funcs->atomic_pre_enable(iter, old_bridge_state);
> > -             } else if (iter->funcs->pre_enable) {
> > -                     iter->funcs->pre_enable(iter);
> > -             }
> > +             if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST)
> > +                     iter = limit;
> >
> >               if (iter == bridge)
> >                       break;
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index f27b4060faa2..523ec9d8f3f8 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -725,6 +725,14 @@ enum drm_bridge_ops {
> >        * this flag shall implement the &drm_bridge_funcs->get_modes callback.
> >        */
> >       DRM_BRIDGE_OP_MODES = BIT(3),
> > +     /**
> > +      * @DRM_BRIDGE_OP_UPSTREAM_FIRST: The bridge can requires
>
> s/can //
>
> > +      * that the upstream node pre_enable is called before its pre_enable,
>
> s/node/bridge/ ?
>
> > +      * and conversely for post_disables. This is most frequently a
>
> s/post_disables/post_disable/

Ack on this and the other small changes.

> Bonus points if you use the correct markup to link to those operations.

I looked at the markup, but found it so haphazardly used that it sort
of seemed not worth it. Damned if you do, and damned if you don't.

  Dave

> > +      * requirement for DSI devices which need the host to be initialised
> > +      * before them.
> > +      */
> > +     DRM_BRIDGE_OP_UPSTREAM_FIRST = BIT(4),
> >  };
> >
> >  /**
>
> --
> Regards,
>
> Laurent Pinchart
