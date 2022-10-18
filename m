Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EA1603266
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 20:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEC010EFD9;
	Tue, 18 Oct 2022 18:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA4510EFD7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 18:26:27 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id h18so7915797ilh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RTmzq7eoqYW6NBc3Vsko4U0xjZphvkiO+FIl89OP+4g=;
 b=KAEU2iVH6lvM1Vadrgtxn8/Ndza1LhSV1UA/xU5Cb4JE6wwmI7gzeJFoYih/YCwK5S
 786yGxRpOOesWqPk0wkYuMgol6ThR+tJLe+h4KqiG0Q91wemNG0ssmKeUN+Df26cnL9d
 rrlQcBy4e7Yl0rwWEeLx54JAAS8j92neXQVB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RTmzq7eoqYW6NBc3Vsko4U0xjZphvkiO+FIl89OP+4g=;
 b=gp6oYLDrw1T3XsJi/BrcN8tYIP2f/P0E5XQI1gyGothTEBrV+7mEzSRO255gUsxmnJ
 t8rq4UJwx6MijqzZOOOFIwxrBI7KQECT4FzKN/euPjcpecl+Y7135N88U1RwkZimlGJB
 wa46ZeGdMIUzubmPhDcAPH43hBcvVUPUM3R6ZVdrTRxdkD0poDtU60D4BlYhl50Qje2X
 3XpFlfnHDRvGsurG4uEGF4rFUGvba2h/v8t3UrmmR9smjh6eQr3iRpz6zV2qji7SCWrx
 OnFLEx2F55RhoM59wHQ6Kb+kUwbArBnmSsrQq0Wqt6ORvYQvMdz6mi2LTYbKJUIXAfFb
 /oXQ==
X-Gm-Message-State: ACrzQf2Yx7wbG4di9AGjUhPJFRb6r9D9in3fX65cdUdEppwyn/Iqmhfi
 RoCRQTWcF01IPOxkZf7iXsjArGxAwKuYpA==
X-Google-Smtp-Source: AMsMyM7zda4t/dqkG6Gf/kPf4y/g1xvD+VSM8RYORdCwJwKznuUJb3TECqLo0tcVH+I5GpXNxVOsQA==
X-Received: by 2002:a05:6e02:156a:b0:2fc:4266:f56 with SMTP id
 k10-20020a056e02156a00b002fc42660f56mr2654017ilu.140.1666117585457; 
 Tue, 18 Oct 2022 11:26:25 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45]) by smtp.gmail.com with ESMTPSA id
 t9-20020a92c0c9000000b002f9b3aab4b9sm1182424ilf.83.2022.10.18.11.26.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 11:26:21 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id y80so12481209iof.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 11:26:21 -0700 (PDT)
X-Received: by 2002:a05:6602:125d:b0:6bc:61ec:29c0 with SMTP id
 o29-20020a056602125d00b006bc61ec29c0mr2464726iou.81.1666117580728; Tue, 18
 Oct 2022 11:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221012042030.573466-1-hsinyi@chromium.org>
 <CAJMQK-i1GFP_5NsH7MLYS17xacrYZf1u6bjVYBkW-qHMbuh2_w@mail.gmail.com>
In-Reply-To: <CAJMQK-i1GFP_5NsH7MLYS17xacrYZf1u6bjVYBkW-qHMbuh2_w@mail.gmail.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Tue, 18 Oct 2022 14:25:41 -0400
X-Gmail-Original-Message-ID: <CAOw6vbLPUkwoaSHyWARZnkcsacf9rsmB6M=97z1-98kgM7BNEQ@mail.gmail.com>
Message-ID: <CAOw6vbLPUkwoaSHyWARZnkcsacf9rsmB6M=97z1-98kgM7BNEQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm_bridge: register content protect property
To: Hsin-Yi Wang <hsinyi@chromium.org>
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

On Mon, Oct 17, 2022 at 9:49 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Wed, Oct 12, 2022 at 12:20 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Some bridges are able to update HDCP status from userspace request if
> > they support HDCP.
> >
> > HDCP property is the same as other connector properties that need to be
> > created after the connecter is initialized and before the connector is
> > registered.
> >
> anx7625 is a user for this.

I feel like we should not unconditionally attach this property for
bridges, this should be done in the driver which supports it IMO.

Sean

>
>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> > v2: Fix compile error when config is not set.
> > ---
> >  drivers/gpu/drm/drm_bridge_connector.c | 3 +++
> >  include/drm/display/drm_hdcp_helper.h  | 8 ++++++++
> >  2 files changed, 11 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> > index 1c7d936523df5..a3b9ef8dc3f0b 100644
> > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/module.h>
> >  #include <linux/slab.h>
> >
> > +#include <drm/display/drm_hdcp_helper.h>
> >  #include <drm/drm_atomic_state_helper.h>
> >  #include <drm/drm_bridge.h>
> >  #include <drm/drm_bridge_connector.h>
> > @@ -398,6 +399,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >         if (panel_bridge)
> >                 drm_panel_bridge_set_orientation(connector, panel_bridge);
> >
> > +       drm_connector_attach_content_protection_property(connector, true);
> > +
> >         return connector;
> >  }
> >  EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
> > diff --git a/include/drm/display/drm_hdcp_helper.h b/include/drm/display/drm_hdcp_helper.h
> > index 8aaf87bf27351..c65d9f06a2532 100644
> > --- a/include/drm/display/drm_hdcp_helper.h
> > +++ b/include/drm/display/drm_hdcp_helper.h
> > @@ -15,8 +15,16 @@ struct drm_device;
> >  struct drm_connector;
> >
> >  int drm_hdcp_check_ksvs_revoked(struct drm_device *dev, u8 *ksvs, u32 ksv_count);
> > +#if defined(CONFIG_DRM_DISPLAY_HDCP_HELPER)
> >  int drm_connector_attach_content_protection_property(struct drm_connector *connector,
> >                                                      bool hdcp_content_type);
> > +#else
> > +static inline int drm_connector_attach_content_protection_property(struct drm_connector *connector,
> > +                                                                  bool hdcp_content_type)
> > +{
> > +       return 0;
> > +}
> > +#endif
> >  void drm_hdcp_update_content_protection(struct drm_connector *connector, u64 val);
> >
> >  #endif
> > --
> > 2.38.0.rc1.362.ged0d419d3c-goog
> >
