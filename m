Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6675648C053
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF79112E70;
	Wed, 12 Jan 2022 08:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DD810F2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 19:12:59 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z22so12572917edd.12
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 11:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=tP1DYjTazDNhmeXD8dNs23ff5eYfzUdaz2RizxuPk+g=;
 b=jmZ6ew2muTWHayV8vBZloY72n7uiUNgy5h0ju4ySco7V1KIFwY6w5rI88LjoO9gKYm
 kYPwiYhhDjYd4V3TUTEktX8SY/qLjoJfx6yXZ3zhZ9oW7OJeyls74b0REMgRMTlivIwf
 yPNxjcF9BcPUW18HnuffsyiTl8MyYE7xF8pygl91nOGNDQJMndhuqiApmDGUyK9NiWDg
 E6WFzI6vKyfvdj3w+KKlz5XnOk0mHWrViftN8oIVrtufFe5Km6zGETZ45mitDaebSTnw
 nIJPZYfeEK+wtXehcvp5yskvbMlF8VmMBCEUceMiHdt6E7gAYp5GCXcJEr7YKMiPy+ps
 Xr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=tP1DYjTazDNhmeXD8dNs23ff5eYfzUdaz2RizxuPk+g=;
 b=jqWM8T7/vbiK0iQQH8ofGfc2rMfBPnA437N0yKPPD5w/XktHmM/4nrW3y/s7KYbt2c
 88o3EcoZoEfwFkqX4e8TvFy6I8hHY81wj0TigJCQeMobcAeQgkebeQXbV1u9jYuO03a3
 FGptBodENGrbS78CreIS4+rAyaDuZQ4o+p7bxXOuCGcECi105nTZjB/lRT02VWcd1cQB
 07zzZneTLQTqrkrZb1w+9AWI7AWJgEbky7AsbFt2x3ETYMBQ2e+ejI6cdA2t2+2/vER8
 JMpsq69FZQN4ts/qJV23f33BCkkgcZVOVt5Dc04GBQWQRtP9gV6qv4xdcQQE5fTRaEvl
 vWKw==
X-Gm-Message-State: AOAM531LKvb+IvRLgLllbKclSK4qytuxRpqbnoFnLoavpFjM2Poy1MEM
 2zxi2OAatI9f7nopzTSoE1ML5AuJoKeLzEov7M8=
X-Google-Smtp-Source: ABdhPJxeyS/zQUQAjbwRj8OtDYsQaTcKmu9d212+t8YlQYcqRtYq2Q+lGd6EOtx6DxwZ3Axc/jd2CLW6nMMfiSX+Nj8=
X-Received: by 2002:a05:6402:424c:: with SMTP id
 g12mr646441edb.4.1641841978110; 
 Mon, 10 Jan 2022 11:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20220107190208.95479-1-rajatja@google.com>
 <4ef79dee-b9d5-ee0c-56c5-0b3058b49ad5@redhat.com>
In-Reply-To: <4ef79dee-b9d5-ee0c-56c5-0b3058b49ad5@redhat.com>
From: Rajat Jain <rajatxjain@gmail.com>
Date: Mon, 10 Jan 2022 11:12:46 -0800
Message-ID: <CAA93t1rPSN482KnDj2tmEztu=yzrDO=1pWh7o7cG_Jr_gM=Nsw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] drm/privacy_screen: Add drvdata in
 drm_privacy_screen
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 12 Jan 2022 08:51:42 +0000
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
Reply-To: rajatxjain@gmail.com
Cc: Gwendal Grignou <gwendal@google.com>, marcheu@google.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@google.com>,
 David Airlie <airlied@linux.ie>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Mark Gross <markgross@kernel.org>, ibm-acpi-devel@lists.sourceforge.net,
 Dmitry Torokhov <dtor@google.com>, dri-devel@lists.freedesktop.org,
 Benson Leung <bleung@google.com>, Rajat Jain <rajatja@google.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 10, 2022 at 3:24 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> On 1/7/22 20:02, Rajat Jain wrote:
> > Allow a privacy screen provider to stash its private data pointer in the
> > drm_privacy_screen, and update the drm_privacy_screen_register() call to
> > accept that. Also introduce a *_get_drvdata() so that it can retrieved
> > back when needed.
> >
> > This also touches the IBM Thinkpad platform driver, the only user of
> > privacy screen today, to pass NULL for now to the updated API.
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> I've pushed this series to drm-misc-next now.

Thank you so much. I see it.

Thanks & Best Regards,

Rajat


>
> Regards,
>
> Hans
>
>
>
> > ---
> > v5: Same as v4
> > v4: Added "Reviewed-by" from Hans
> > v3: Initial version. Came up due to review comments on v2 of other patches.
> > v2: No v2
> > v1: No v1
> >
> >  drivers/gpu/drm/drm_privacy_screen.c    |  5 ++++-
> >  drivers/platform/x86/thinkpad_acpi.c    |  2 +-
> >  include/drm/drm_privacy_screen_driver.h | 13 ++++++++++++-
> >  3 files changed, 17 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
> > index beaf99e9120a..03b149cc455b 100644
> > --- a/drivers/gpu/drm/drm_privacy_screen.c
> > +++ b/drivers/gpu/drm/drm_privacy_screen.c
> > @@ -387,7 +387,8 @@ static void drm_privacy_screen_device_release(struct device *dev)
> >   * * An ERR_PTR(errno) on failure.
> >   */
> >  struct drm_privacy_screen *drm_privacy_screen_register(
> > -     struct device *parent, const struct drm_privacy_screen_ops *ops)
> > +     struct device *parent, const struct drm_privacy_screen_ops *ops,
> > +     void *data)
> >  {
> >       struct drm_privacy_screen *priv;
> >       int ret;
> > @@ -404,6 +405,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
> >       priv->dev.parent = parent;
> >       priv->dev.release = drm_privacy_screen_device_release;
> >       dev_set_name(&priv->dev, "privacy_screen-%s", dev_name(parent));
> > +     priv->drvdata = data;
> >       priv->ops = ops;
> >
> >       priv->ops->get_hw_state(priv);
> > @@ -439,6 +441,7 @@ void drm_privacy_screen_unregister(struct drm_privacy_screen *priv)
> >       mutex_unlock(&drm_privacy_screen_devs_lock);
> >
> >       mutex_lock(&priv->lock);
> > +     priv->drvdata = NULL;
> >       priv->ops = NULL;
> >       mutex_unlock(&priv->lock);
> >
> > diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> > index 341655d711ce..ccbfda2b0095 100644
> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -9782,7 +9782,7 @@ static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
> >               return 0;
> >
> >       lcdshadow_dev = drm_privacy_screen_register(&tpacpi_pdev->dev,
> > -                                                 &lcdshadow_ops);
> > +                                                 &lcdshadow_ops, NULL);
> >       if (IS_ERR(lcdshadow_dev))
> >               return PTR_ERR(lcdshadow_dev);
> >
> > diff --git a/include/drm/drm_privacy_screen_driver.h b/include/drm/drm_privacy_screen_driver.h
> > index 24591b607675..4ef246d5706f 100644
> > --- a/include/drm/drm_privacy_screen_driver.h
> > +++ b/include/drm/drm_privacy_screen_driver.h
> > @@ -73,10 +73,21 @@ struct drm_privacy_screen {
> >        * for more info.
> >        */
> >       enum drm_privacy_screen_status hw_state;
> > +     /**
> > +      * @drvdata: Private data owned by the privacy screen provider
> > +      */
> > +     void *drvdata;
> >  };
> >
> > +static inline
> > +void *drm_privacy_screen_get_drvdata(struct drm_privacy_screen *priv)
> > +{
> > +     return priv->drvdata;
> > +}
> > +
> >  struct drm_privacy_screen *drm_privacy_screen_register(
> > -     struct device *parent, const struct drm_privacy_screen_ops *ops);
> > +     struct device *parent, const struct drm_privacy_screen_ops *ops,
> > +     void *data);
> >  void drm_privacy_screen_unregister(struct drm_privacy_screen *priv);
> >
> >  void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen *priv);
> >
>
