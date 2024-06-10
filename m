Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2126090280F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 19:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8635C10E3BC;
	Mon, 10 Jun 2024 17:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Uncy+odr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ED110E3F9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 17:54:13 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52c4b92c09bso265587e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 10:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718042051; x=1718646851; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WF40KLAkximrjsTW3ssqoGFaQBR69JrpW4FxsMvcSc4=;
 b=Uncy+odrK6HLiOc3mLVoF56i8mi1XSY/qI3jV5iTS4uvfhzX81+r7nr7kzpInxDiYI
 nMU2kuEGz79tjqkt+44epZqoJaSNJhlbFj6rf5zgd5Q01ckS0ak+EW0LOUchxLom3XrJ
 TyPclpXaWSl8n9UiP0SxUavRtdCesvuw3qNjfoKJUNfzrTuB0FZ5z2oct2qmp3kfzZOZ
 5ZOrqZDk46whbHAdgjUgipbjK0iN9lE/NseArgEMbPGmJmJW2nVvk08rljfSdURryp5g
 od/VgsgqJYSkn26Q+GV1ruDsFCdo7THcdpmKcy+PdJY+C81kT0CrMD+b1BRABTyF2J3n
 SkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718042051; x=1718646851;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WF40KLAkximrjsTW3ssqoGFaQBR69JrpW4FxsMvcSc4=;
 b=WOKzzTIXBwk2l01HmPmEiM1VcbOlJGd+Mk7bQ0D1Z14QbsocpWVzUu9+6//zWAhHiJ
 E9H2YricNq5jMmIHOMjiszGQebrdru7HS4lWznV346R/P4eNjJFZsYIqNdL7if5g+sfQ
 U2/9M7zd6whdIHtdNxY+aWtUGY7kiato89HTFBBjHo/YNFeDr9XRiQbqV+fXcceEEOdn
 kcfBifyJDJSEbzwUZ/aBpmClXThyIVgdWLw1jZ/+7jDRC0bvU7vSJSDVeJ/KcvSSk1kn
 aYgZ2MuxZ6kLNYJR0F4f6hv3toemFkFB0qycWYB9W3ggFcDmFnXHKv4dsQiGea80Cyk6
 E03Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOHcvcfTOC+P6CFI57Uc1bY0PmEJ3CmUmLcQm1354lAiK1IK5U5ajOL+2uUKpRVCZQE1hKcUrzY57b6iE8ueU/aWshosGkjnq+PIFP2uDP
X-Gm-Message-State: AOJu0YwNZp/8FIrrO5YrW9qLbKFXC+zFJ8bHUnIhOvLLZulrzPgs4MB8
 TSeD2UGdT/yf2vgOn6oLNHYgcahoSY8XIwdrIruku8uNx3UFwB2/iTZ87O9FrjQ=
X-Google-Smtp-Source: AGHT+IEmuXhTm5mdM3lvjSvOFZmrX8S9MxFYd5t2YIYtjO2PNmSKP1Vp9kngKdCZNYrU6DsbsjCmsA==
X-Received: by 2002:ac2:490b:0:b0:52c:8079:b264 with SMTP id
 2adb3069b0e04-52c8079b896mr4288403e87.9.1718042051388; 
 Mon, 10 Jun 2024 10:54:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c8f4f52c1sm431573e87.266.2024.06.10.10.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 10:54:10 -0700 (PDT)
Date: Mon, 10 Jun 2024 20:54:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/9] drm/bridge-connector: switch to using drmm
 allocations
Message-ID: <t5pav3up5r6ezs4q37lc7jqlv55ftta7fnntp75b4pjboycwsm@uvs7q6frrzf5>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-2-ab384e6021af@linaro.org>
 <20240610-secret-rottweiler-from-asgard-132f75@houat>
 <CAA8EJpogi2qm0bhCwumY4zj-xMUkF4zbK-NAPqCeDbLcybFciw@mail.gmail.com>
 <20240610-smooth-liberal-guan-59853e@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610-smooth-liberal-guan-59853e@houat>
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

On Mon, Jun 10, 2024 at 02:07:06PM +0200, Maxime Ripard wrote:
> Hi,
> 
> +Hans
> 
> On Mon, Jun 10, 2024 at 02:46:03PM GMT, Dmitry Baryshkov wrote:
> > On Mon, 10 Jun 2024 at 11:04, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > On Fri, Jun 07, 2024 at 04:22:59PM GMT, Dmitry Baryshkov wrote:
> > > > Turn drm_bridge_connector to using drmm_kzalloc() and
> > > > drmm_connector_init() and drop the custom destroy function. The
> > > > drm_connector_unregister() and fwnode_handle_put() are already handled
> > > > by the drm_connector_cleanup() and so are safe to be dropped.
> > > >
> > > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_bridge_connector.c | 23 +++++------------------
> > > >  1 file changed, 5 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> > > > index 982552c9f92c..e093fc8928dc 100644
> > > > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > > > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > > > @@ -15,6 +15,7 @@
> > > >  #include <drm/drm_connector.h>
> > > >  #include <drm/drm_device.h>
> > > >  #include <drm/drm_edid.h>
> > > > +#include <drm/drm_managed.h>
> > > >  #include <drm/drm_modeset_helper_vtables.h>
> > > >  #include <drm/drm_probe_helper.h>
> > > >
> > > > @@ -193,19 +194,6 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
> > > >       return status;
> > > >  }
> > > >
> > > > -static void drm_bridge_connector_destroy(struct drm_connector *connector)
> > > > -{
> > > > -     struct drm_bridge_connector *bridge_connector =
> > > > -             to_drm_bridge_connector(connector);
> > > > -
> > > > -     drm_connector_unregister(connector);
> > > > -     drm_connector_cleanup(connector);
> > > > -
> > > > -     fwnode_handle_put(connector->fwnode);
> > > > -
> > > > -     kfree(bridge_connector);
> > > > -}
> > > > -
> > > >  static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
> > > >                                             struct dentry *root)
> > > >  {
> > > > @@ -224,7 +212,6 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
> > > >       .reset = drm_atomic_helper_connector_reset,
> > > >       .detect = drm_bridge_connector_detect,
> > > >       .fill_modes = drm_helper_probe_single_connector_modes,
> > > > -     .destroy = drm_bridge_connector_destroy,
> > > >       .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> > > >       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > > >       .debugfs_init = drm_bridge_connector_debugfs_init,
> > > > @@ -328,7 +315,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > >       int connector_type;
> > > >       int ret;
> > > >
> > > > -     bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
> > > > +     bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
> > >
> > > So you make destroy's kfree call unnecessary here ...
> > >
> > > >       if (!bridge_connector)
> > > >               return ERR_PTR(-ENOMEM);
> > > >
> > > > @@ -383,9 +370,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > >               return ERR_PTR(-EINVAL);
> > > >       }
> > > >
> > > > -     ret = drm_connector_init_with_ddc(drm, connector,
> > > > -                                       &drm_bridge_connector_funcs,
> > > > -                                       connector_type, ddc);
> > > > +     ret = drmm_connector_init(drm, connector,
> > > > +                               &drm_bridge_connector_funcs,
> > > > +                               connector_type, ddc);
> > >
> > > ... and here of drm_connector_cleanup.
> > >
> > > drm_connector_unregister wasn't needed, so can ignore it, but you leak a reference to
> > > connector->fwnode since you don't call fwnode_handle_put anymore.
> > >
> > > We should register a drmm action right below the call to fwnode_handle_get too.
> > 
> > But drm_connector_cleanup() already contains
> > fwnode_handle_put(connector->fwnode). Isn't that enough?
> 
> It does, but now I'm confused.
> 
> drm_bridge_connector_init takes a reference, drm_connector_init doesn't.
> It will call drm_bridge_connector_destroy() that gives back its
> reference (which makes sense to me), but then why do
> drm_connector_cleanup() does? None of the drm_connector code even took
> that reference, and we end up with a double-put.
> 
> It looks like it was introduced by commit 48c429c6d18d ("drm/connector:
> Add a fwnode pointer to drm_connector and register with ACPI (v2)") from
> Hans, which does call put, but never gets that reference.

The mentioned patch documents that pretty clearly:

* Drivers can set this to associate a fwnode with a connector, drivers
* are expected to get a reference on the fwnode when setting this.
* drm_connector_cleanup() will call fwnode_handle_put() on this.

This is logical. Whoever sets the drm_connector::fwnode pointer, should
get reference. This way drm_connector_init() doesn't need to play with
the reference counting. The cleanup code drops the reference (so the
driver doesn't need to), because cleanup might be assynchronous..

The drm_bridge_connector follows this approach: it sets
drm_connector->fwnode, so it gets the reference. It uses
drm_connector_cleanup(), so it doesn't need to put it.

> 
> It has nothing to do with this series anymore, but that's super fishy to
> me, and the source of bugs as we can see here.

-- 
With best wishes
Dmitry
