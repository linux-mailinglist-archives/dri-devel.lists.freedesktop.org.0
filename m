Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B55441CB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 05:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADDE1129DD;
	Thu,  9 Jun 2022 03:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DBE1122AF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 03:13:47 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id d19so12240881lji.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 20:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WAB02C3ZkH9VbHetvGWn5Py2rhK3DERsYsHyjK16wTE=;
 b=XbRWmIGGGenwao2Tk7wJ1Mr9i3hHZQHKx9STxE+UuTq7k04t4aXKpWuKhPOVswBUD9
 pEO8M6LEtGpJhPGuBYJYojpVZpAFGHKwRBoxKbKnWUiFKJmi1gd9o0k/2AjheVs6HNgB
 3035f8G9eiId/7FVig6JqCQvOd+JSX9dxM+eE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WAB02C3ZkH9VbHetvGWn5Py2rhK3DERsYsHyjK16wTE=;
 b=lyp/D0xOKhSgbacBe930VPaZeoxpyVes3u21LC0B1g0uwEfQLZg5KCy9svNSUy2BOy
 eNtn/RPOgVES7wJgojTq/cbl+nh4yBiwXFbLjL6sG4ittvzW65B5GrEGrKAj37stPPIF
 R0b6ArftGnra3z5P1PFe8V89CUGY887Dz0CMyTlz7K3+Qr53PUYlXy0ELLpKG+U5NqpI
 jWaLT5/sL0fX/BUStqOpv5f5hullVPwEpiXWbR2RU3Aaiq2xS2OOAQAELIHxp7ZmSjj4
 8d/to5tUMmGAMJYP7BRNUmafdLBRUhtkp8zck8tJ1VPidlopxjFXpl/cu7fd+qU6XOv2
 s5/w==
X-Gm-Message-State: AOAM530PIlSSv2tiMshh1dsakOCGK1Fk2MllyrcQ2YEXsal1jRkRdniK
 0DQ4UgXIUS/NEd0Zdg3LFnUF15ahHqgWUwzs7PzOU4Vuk1o=
X-Google-Smtp-Source: ABdhPJyVjcaUH2c41gSc30QMinoAfJYAtQr3o/n0OUHhR0BwgrviMwb7SQgNmDG5Qp0lzNm1q2HT77RONbvJMun3cA4=
X-Received: by 2002:a05:6402:149:b0:431:7dde:9b59 with SMTP id
 s9-20020a056402014900b004317dde9b59mr15089962edu.339.1654744414987; Wed, 08
 Jun 2022 20:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220608094816.2898692-1-hsinyi@chromium.org>
 <20220608094816.2898692-9-hsinyi@chromium.org>
 <CAD=FV=VShXpy+6ESXGKhw5Z9o3hfXNV2_HvdOAPM3YN2qSA9Sg@mail.gmail.com>
In-Reply-To: <CAD=FV=VShXpy+6ESXGKhw5Z9o3hfXNV2_HvdOAPM3YN2qSA9Sg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 9 Jun 2022 11:13:09 +0800
Message-ID: <CAJMQK-hoecGwz3AmN7qdRhYCOzDXbaHZ2Fa2UCmWMFO7ouFGUg@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] drm: Config orientation property if panel provides
 it
To: Doug Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 8, 2022 at 10:17 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Jun 8, 2022 at 2:48 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > @@ -269,6 +280,31 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
> >  }
> >  EXPORT_SYMBOL(drm_panel_bridge_remove);
> >
> > +/**
> > + * drm_panel_bridge_set_orientation - Set the connector's panel orientation
> > + * if the bridge is a panel bridge.
> > + *
> > + * @connector: The connector to be set panel orientation.
> > + * @bridge: The drm_bridge to be transformed to panel bridge.
>
> Ideally you should have a kernel doc to describe what you're returning.
>
>
> > + */
> > +int drm_panel_bridge_set_orientation(struct drm_connector *connector,
> > +                                    struct drm_bridge *bridge)
> > +{
> > +       struct panel_bridge *panel_bridge;
> > +
> > +       if (!bridge)
> > +               return 0;
> > +
> > +       if (bridge->funcs != &panel_bridge_bridge_funcs)
> > +               return 0;
>
> nit: Why do you need to handle NULL bridge and the case that someone
> calls you with something other than a panel-bridge? I'm not convinced
> that's useful. In general kernel style doesn't do massive validation
> of parameters unless there's a reason for it. ...if we do need to
> handle them then it feels like they should be returning -EINVAL or
> something, not 0.

The only caller had checked it. I can remove the check here.

>
>
> > @@ -917,10 +917,13 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
> >                            enum drm_connector_status status);
> >
> >  #ifdef CONFIG_DRM_PANEL_BRIDGE
> > +bool drm_bridge_is_panel(const struct drm_bridge *bridge);
> >  struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
> >  struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
> >                                               u32 connector_type);
> >  void drm_panel_bridge_remove(struct drm_bridge *bridge);
> > +int drm_panel_bridge_set_orientation(struct drm_connector *connector,
> > +                                     struct drm_bridge *bridge);
>
> I suspect that you need some dummy versions of your new functions
> defined if "CONFIG_DRM_PANEL_BRIDGE" is not defined. Otherwise we're
> going to be yelled at by the kernel robot eventually.
>
> -Doug
