Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270216039BF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 08:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74A610F151;
	Wed, 19 Oct 2022 06:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE1C10F14F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 06:25:46 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id gf8so16167261pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 23:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0YvuV0EJzgx/CzKHyzjlvPWkSLLbFliwl9A6z1/O4hM=;
 b=Z7PHOUxVbmdPt6GSMk5/jEhKoitcqAZUH6zUw3AIgXq9hVqibAj5b9PWxv3q2sp+tV
 ZpN8E/OYeZgwVo0fPvdwjebOeM7XnFsqB9znTtGuv5N2MyM5/NH03ktlIs7MVks2/8/u
 YvU7qaxh5xUkyLtOSQv+vX++vSPJiRWYx9JtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0YvuV0EJzgx/CzKHyzjlvPWkSLLbFliwl9A6z1/O4hM=;
 b=C4LHnyH6sERou8K9hs5zPfIJ7he+oTYlk0Jb2VxIX122qqBHT5A7LyhyL/2P0TVtOI
 XDIjJId4rwDu0YesGtQJOkgs8PIP3mEAIC4PNOMymxSe5qWOl35VgjcUCfx5eSVM2MB+
 i8BX3t6CqoK+4MdcSrw5SL92CZN2S0SzRx2+mAijQSWjnfzynRmxqWLgMoP7fnYe7mMM
 /dVUlzXagruoj7IHIHBDBpCVauIIsgX9htLwrT2qoVPdYQP2fj3gJ1hz/6nroLgrXR1G
 MWwEcuvMwhJjfeWiu+Rvq1h/IEw6sSRc1He3jGV3cQ7+CUBQ+QGSPbRZtBCPy5UDwcgE
 5Sfw==
X-Gm-Message-State: ACrzQf2u+kjWIZ5Jf6EjcvWpLrhz/UWgpsUqzZ+gsBm9dQD5r+T4u5yR
 m+C6AiIzMV0DQSVCdJTn+MnHO3x+6/cCrj/rCX8xGQ==
X-Google-Smtp-Source: AMsMyM66bYdplNyAXUIbc8nQgt/ursH7ZfCQxsQJMwBPV3sgOhHoXsgNF5pcCI5Xpcet9Zb7lIUBkLeWZYoRPoO/lTo=
X-Received: by 2002:a17:90b:4f4a:b0:20c:64e2:2bf1 with SMTP id
 pj10-20020a17090b4f4a00b0020c64e22bf1mr8263564pjb.30.1666160745922; Tue, 18
 Oct 2022 23:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221012042030.573466-1-hsinyi@chromium.org>
 <CAJMQK-i1GFP_5NsH7MLYS17xacrYZf1u6bjVYBkW-qHMbuh2_w@mail.gmail.com>
 <CAOw6vbLPUkwoaSHyWARZnkcsacf9rsmB6M=97z1-98kgM7BNEQ@mail.gmail.com>
In-Reply-To: <CAOw6vbLPUkwoaSHyWARZnkcsacf9rsmB6M=97z1-98kgM7BNEQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 19 Oct 2022 14:25:19 +0800
Message-ID: <CAJMQK-joM-bZvYydDKAYs7o6KBd+74mZrNBHWybdibWXv3okLg@mail.gmail.com>
Subject: Re: [PATCH v2] drm_bridge: register content protect property
To: Sean Paul <seanpaul@chromium.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 2:26 AM Sean Paul <seanpaul@chromium.org> wrote:
>
> On Mon, Oct 17, 2022 at 9:49 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > On Wed, Oct 12, 2022 at 12:20 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > Some bridges are able to update HDCP status from userspace request if
> > > they support HDCP.
> > >
> > > HDCP property is the same as other connector properties that need to be
> > > created after the connecter is initialized and before the connector is
> > > registered.
> > >
> > anx7625 is a user for this.
>
> I feel like we should not unconditionally attach this property for
> bridges, this should be done in the driver which supports it IMO.
>
I sent another version to register the property in drm driver:
https://lore.kernel.org/lkml/20221019061936.3599965-1-hsinyi@chromium.org/T/#u

Ideally it should be registered by the bridge driver. But some bridge
drivers have already changed to DRM_BRIDGE_ATTACH_NO_CONNECTOR, so
they can't get a connector during the attach stage (or any time before
the connector is registered). Is it acceptable that drm driver help
register the property if CONFIG_DRM_DISPLAY_HDCP_HELPER is defined?

Thanks

> Sean
>
> >
> >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > ---
> > > v2: Fix compile error when config is not set.
> > > ---
> > >  drivers/gpu/drm/drm_bridge_connector.c | 3 +++
> > >  include/drm/display/drm_hdcp_helper.h  | 8 ++++++++
> > >  2 files changed, 11 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> > > index 1c7d936523df5..a3b9ef8dc3f0b 100644
> > > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > > @@ -7,6 +7,7 @@
> > >  #include <linux/module.h>
> > >  #include <linux/slab.h>
> > >
> > > +#include <drm/display/drm_hdcp_helper.h>
> > >  #include <drm/drm_atomic_state_helper.h>
> > >  #include <drm/drm_bridge.h>
> > >  #include <drm/drm_bridge_connector.h>
> > > @@ -398,6 +399,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >         if (panel_bridge)
> > >                 drm_panel_bridge_set_orientation(connector, panel_bridge);
> > >
> > > +       drm_connector_attach_content_protection_property(connector, true);
> > > +
> > >         return connector;
> > >  }
> > >  EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
> > > diff --git a/include/drm/display/drm_hdcp_helper.h b/include/drm/display/drm_hdcp_helper.h
> > > index 8aaf87bf27351..c65d9f06a2532 100644
> > > --- a/include/drm/display/drm_hdcp_helper.h
> > > +++ b/include/drm/display/drm_hdcp_helper.h
> > > @@ -15,8 +15,16 @@ struct drm_device;
> > >  struct drm_connector;
> > >
> > >  int drm_hdcp_check_ksvs_revoked(struct drm_device *dev, u8 *ksvs, u32 ksv_count);
> > > +#if defined(CONFIG_DRM_DISPLAY_HDCP_HELPER)
> > >  int drm_connector_attach_content_protection_property(struct drm_connector *connector,
> > >                                                      bool hdcp_content_type);
> > > +#else
> > > +static inline int drm_connector_attach_content_protection_property(struct drm_connector *connector,
> > > +                                                                  bool hdcp_content_type)
> > > +{
> > > +       return 0;
> > > +}
> > > +#endif
> > >  void drm_hdcp_update_content_protection(struct drm_connector *connector, u64 val);
> > >
> > >  #endif
> > > --
> > > 2.38.0.rc1.362.ged0d419d3c-goog
> > >
