Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E634161619E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 12:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E015210E490;
	Wed,  2 Nov 2022 11:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DD310E47C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 11:19:48 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id y4so16281542plb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 04:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E6zXVLa2IfbM1r+MEEESAo6MxuWborMv3NhXwQXwvRI=;
 b=aCNh6nz86M3/6f5x/ME9zAV12Z2u5FFjpSBpm6E1cuUKpVNEdpPEniMlj0ukTn2OaJ
 qjTaXQ9VcLxVduu16SVXHKd5UheZHordc6PPutfbjkmtgurj2fXU+HPpdRs+a/xqErBR
 xuIl2WWa0niyQDpt+dlZLY1xjBRVu1X+iFBrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E6zXVLa2IfbM1r+MEEESAo6MxuWborMv3NhXwQXwvRI=;
 b=lXXSnd3EiRg1zSMbArLZzGCGe+g/zTfnMWG9bRF1JinA2nQMv5InE+6bCdbTao+Qrn
 vVilrXrY99edMI9fjIqOHH+vc8N0ygaqs9wZhwBlYdq15rfBqWw1TcYY6J8z+YJCe90e
 v619kTsUdg1uyL5O5PbBE6XRkYOGMRBSIA6YRKNgBfXlDd4WYtr4zzwWFNdd1hHqyMq5
 9vfOIhXej7e0soiyjchbmscSIii2KlIZZghKxnLpElvRfsk4JeNS5UDa2sO3Eet7JGSa
 WXqwlkpdXaqL5a50HkxCrQnkpF6QlkMELfzxrj+9mBLcqdnyNWtUyGMCII6lSsWZNYqu
 3jcg==
X-Gm-Message-State: ACrzQf1gUMJnufTKRnHQIB5t0PK37D51n5KRokw/epmSHCL4Epo4hqlE
 BWnTbssInabH69FcFrWJp5pysMvVlYuGQA0DEt1fHw==
X-Google-Smtp-Source: AMsMyM7UmtML6gy6indouX9gsyoixVXVkU7RHJ3Y3MBtWpcQLl5OJpKkBUeR/lNxWvoXkCGywmxZIzcLXiIxBLbmGJc=
X-Received: by 2002:a17:902:820b:b0:185:b9a:8ac1 with SMTP id
 x11-20020a170902820b00b001850b9a8ac1mr24802014pln.111.1667387987592; Wed, 02
 Nov 2022 04:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221012042030.573466-1-hsinyi@chromium.org>
 <CAJMQK-i1GFP_5NsH7MLYS17xacrYZf1u6bjVYBkW-qHMbuh2_w@mail.gmail.com>
 <CAOw6vbLPUkwoaSHyWARZnkcsacf9rsmB6M=97z1-98kgM7BNEQ@mail.gmail.com>
In-Reply-To: <CAOw6vbLPUkwoaSHyWARZnkcsacf9rsmB6M=97z1-98kgM7BNEQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 2 Nov 2022 19:19:21 +0800
Message-ID: <CAJMQK-inch8he3_LEAAe4y-y+18cak6PS83TByvO47tFMBceiQ@mail.gmail.com>
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
> Sean
>

hi Sean,

v3 is sent: connector will check if any bridge in that chain supports
hdcp by looking up a variable in the bridge:
https://patchwork.kernel.org/project/dri-devel/patch/20221102111148.1810314-1-hsinyi@chromium.org/



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
