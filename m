Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8661A903A04
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 13:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E555E10E5B9;
	Tue, 11 Jun 2024 11:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uVVIy+xk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB5C10E5BB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 11:26:25 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dfb05bcc50dso809036276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 04:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718105184; x=1718709984; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nbepqfHXX8/ebWOQDHLQgzSo88cywSIGNBywsOUNYMQ=;
 b=uVVIy+xk+hmjmL77RlEE/6i3ejLNItdga8bdBsG/ODMjfXYpJ23LdiINy9nGp1twV0
 5i9pStsW7tkTgAuKXH2/uJv9xvx8XbJecfEIY/D8yKi8yWrard3XblWi10Wp7Y0PLjCB
 WjiQlaaMOKevsyVV+63PpDU2OCkl9Soo4LdzfK4YyxvnhRgesLQxqgOEDrJfXgB+rJ8P
 iWD/HsjnA6xdg1xF4ciWu3+HnDyordLFs3NDzd+Tq8eAym5H2sFA2ahVwBxfbXb7h00s
 eX08tnReA2j+MLcBnYqoG0Cy5YpKgnZ5B9fep40Al+zW0R7jWELBOeL/jK6LOc7XJ3uN
 ZZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718105184; x=1718709984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nbepqfHXX8/ebWOQDHLQgzSo88cywSIGNBywsOUNYMQ=;
 b=fTWo+wIv4z1s0gxlrxwswIgsNmLQQGhB/mOdhpSxtfuSjkyrGig1T8bTA+DcK6bFD8
 40RCPjP/JN9a+Q2jxP4GqP5Ik1+cP+2T7JFuHL6ea3ScWb4ed/F6thE6G9ldEWBQrQmI
 NcYwCOGH6Ms2rv81zE/kkfhpCSnGd6Mje8lsOI5V+EyEeKD5PQl58Cxvz3MxbYeRYLFL
 p28Ny4u87J7U2XJZFHPCiYHk+coGG2QrBim4/8PIfuyezEuVni5Ks4L9nHiboFb8N+bT
 rHiouCY+TNzThWJKZw3cF+sbyPtSM+RX1c4g2gLNnZgkIvKA94Z5cAf2GQJQvsICmc8F
 uIXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr9OZWy4W3ZGJiUbFRJ0PuxZL2TyE/UDUzXm7n0LhpdyZNWUoKlFSubzphz3Ohy1GfLKnFf97raSatN0spBkbFOAX90O+oOJxw5Nz81rCg
X-Gm-Message-State: AOJu0YzucgVoCb24/dqNrGDyXSTDpxjaR5AjkFBV5/1D4TQ5oEuGSx2C
 3q+cW9xSxP1PHiKIt0AvPr7/48CVHeeQ006tpP+yTyMtuCboi+FQhzYEhQSD/LS6f3Bdi9iA4id
 EGlugk5XiuNyqtJyS0pMWw9SeR4pspKFRpXK64w==
X-Google-Smtp-Source: AGHT+IHPQBOTA1l+9Q6Mt11B/7brXJx2+reHInxEahmPdyYeu/oGfCOgbBJHGoEyCZWwwwFiHs2jDWDlq4TplfBFJxM=
X-Received: by 2002:a25:b11e:0:b0:dfa:fe33:713f with SMTP id
 3f1490d57ef6-dfafe337732mr10791981276.31.1718105183996; Tue, 11 Jun 2024
 04:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-2-ab384e6021af@linaro.org>
 <20240610-secret-rottweiler-from-asgard-132f75@houat>
 <CAA8EJpogi2qm0bhCwumY4zj-xMUkF4zbK-NAPqCeDbLcybFciw@mail.gmail.com>
 <20240610-smooth-liberal-guan-59853e@houat>
 <t5pav3up5r6ezs4q37lc7jqlv55ftta7fnntp75b4pjboycwsm@uvs7q6frrzf5>
 <20240611-zippy-pragmatic-catfish-cceee5@houat>
In-Reply-To: <20240611-zippy-pragmatic-catfish-cceee5@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 11 Jun 2024 14:26:12 +0300
Message-ID: <CAA8EJppcqLm7UbW9n2Y_4mfJv4JFWDkPXJ8=TBL53LiFPADzpQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] drm/bridge-connector: switch to using drmm
 allocations
To: Maxime Ripard <mripard@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Jun 2024 at 11:54, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Mon, Jun 10, 2024 at 08:54:09PM GMT, Dmitry Baryshkov wrote:
> > On Mon, Jun 10, 2024 at 02:07:06PM +0200, Maxime Ripard wrote:
> > > Hi,
> > >
> > > +Hans
> > >
> > > On Mon, Jun 10, 2024 at 02:46:03PM GMT, Dmitry Baryshkov wrote:
> > > > On Mon, 10 Jun 2024 at 11:04, Maxime Ripard <mripard@kernel.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Fri, Jun 07, 2024 at 04:22:59PM GMT, Dmitry Baryshkov wrote:
> > > > > > Turn drm_bridge_connector to using drmm_kzalloc() and
> > > > > > drmm_connector_init() and drop the custom destroy function. The
> > > > > > drm_connector_unregister() and fwnode_handle_put() are already handled
> > > > > > by the drm_connector_cleanup() and so are safe to be dropped.
> > > > > >
> > > > > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/drm_bridge_connector.c | 23 +++++------------------
> > > > > >  1 file changed, 5 insertions(+), 18 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> > > > > > index 982552c9f92c..e093fc8928dc 100644
> > > > > > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > > > > > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > > > > > @@ -15,6 +15,7 @@
> > > > > >  #include <drm/drm_connector.h>
> > > > > >  #include <drm/drm_device.h>
> > > > > >  #include <drm/drm_edid.h>
> > > > > > +#include <drm/drm_managed.h>
> > > > > >  #include <drm/drm_modeset_helper_vtables.h>
> > > > > >  #include <drm/drm_probe_helper.h>
> > > > > >
> > > > > > @@ -193,19 +194,6 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
> > > > > >       return status;
> > > > > >  }
> > > > > >
> > > > > > -static void drm_bridge_connector_destroy(struct drm_connector *connector)
> > > > > > -{
> > > > > > -     struct drm_bridge_connector *bridge_connector =
> > > > > > -             to_drm_bridge_connector(connector);
> > > > > > -
> > > > > > -     drm_connector_unregister(connector);
> > > > > > -     drm_connector_cleanup(connector);
> > > > > > -
> > > > > > -     fwnode_handle_put(connector->fwnode);
> > > > > > -
> > > > > > -     kfree(bridge_connector);
> > > > > > -}
> > > > > > -
> > > > > >  static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
> > > > > >                                             struct dentry *root)
> > > > > >  {
> > > > > > @@ -224,7 +212,6 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
> > > > > >       .reset = drm_atomic_helper_connector_reset,
> > > > > >       .detect = drm_bridge_connector_detect,
> > > > > >       .fill_modes = drm_helper_probe_single_connector_modes,
> > > > > > -     .destroy = drm_bridge_connector_destroy,
> > > > > >       .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> > > > > >       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > > > > >       .debugfs_init = drm_bridge_connector_debugfs_init,
> > > > > > @@ -328,7 +315,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > > > >       int connector_type;
> > > > > >       int ret;
> > > > > >
> > > > > > -     bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
> > > > > > +     bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
> > > > >
> > > > > So you make destroy's kfree call unnecessary here ...
> > > > >
> > > > > >       if (!bridge_connector)
> > > > > >               return ERR_PTR(-ENOMEM);
> > > > > >
> > > > > > @@ -383,9 +370,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > > > >               return ERR_PTR(-EINVAL);
> > > > > >       }
> > > > > >
> > > > > > -     ret = drm_connector_init_with_ddc(drm, connector,
> > > > > > -                                       &drm_bridge_connector_funcs,
> > > > > > -                                       connector_type, ddc);
> > > > > > +     ret = drmm_connector_init(drm, connector,
> > > > > > +                               &drm_bridge_connector_funcs,
> > > > > > +                               connector_type, ddc);
> > > > >
> > > > > ... and here of drm_connector_cleanup.
> > > > >
> > > > > drm_connector_unregister wasn't needed, so can ignore it, but you leak a reference to
> > > > > connector->fwnode since you don't call fwnode_handle_put anymore.
> > > > >
> > > > > We should register a drmm action right below the call to fwnode_handle_get too.
> > > >
> > > > But drm_connector_cleanup() already contains
> > > > fwnode_handle_put(connector->fwnode). Isn't that enough?
> > >
> > > It does, but now I'm confused.
> > >
> > > drm_bridge_connector_init takes a reference, drm_connector_init doesn't.
> > > It will call drm_bridge_connector_destroy() that gives back its
> > > reference (which makes sense to me), but then why do
> > > drm_connector_cleanup() does? None of the drm_connector code even took
> > > that reference, and we end up with a double-put.
> > >
> > > It looks like it was introduced by commit 48c429c6d18d ("drm/connector:
> > > Add a fwnode pointer to drm_connector and register with ACPI (v2)") from
> > > Hans, which does call put, but never gets that reference.
> >
> > The mentioned patch documents that pretty clearly:
> >
> > * Drivers can set this to associate a fwnode with a connector, drivers
> > * are expected to get a reference on the fwnode when setting this.
> > * drm_connector_cleanup() will call fwnode_handle_put() on this.
> >
> > This is logical. Whoever sets the drm_connector::fwnode pointer, should
> > get reference. This way drm_connector_init() doesn't need to play with
> > the reference counting. The cleanup code drops the reference (so the
> > driver doesn't need to), because cleanup might be assynchronous..
>
> Right, but it's the cleanup part that isn't logical. It makes total
> sense to have the connector that sets connector->fwnode get the
> reference itself. It doesn't make sense to have the core give that
> reference instead of the driver.
>
> It's confusing, because if the driver is supposed to handle its
> reference itself, then it should handle all of it itself. This bug is
> the testament for that: the natural approach is buggy.

I'd say this is the 'transfer of the ownership'. The base driver gets
the reference, and then gives it away to the drm_connecter. But indeed
this is not very intuitive.

I have looked at the original series by Hans/Heikky, but I don't seem
to be able to find a good way to solve that. The fwnode can be set
after initialising the drm_connector. And at the same time it doesn't
make so much sense to put that burden onto the driver. One option
might be to add drm_connector_set_fwnode() that will get the reference
internally, but that looks a bit like an overkill.

>
> > The drm_bridge_connector follows this approach: it sets
> > drm_connector->fwnode, so it gets the reference. It uses
> > drm_connector_cleanup(), so it doesn't need to put it.
>
> Yet, it calls fwnode_handle_put in its destroy path, because it grabbed
> a reference before.
>
> Maxime



-- 
With best wishes
Dmitry
