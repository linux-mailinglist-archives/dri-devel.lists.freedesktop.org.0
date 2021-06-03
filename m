Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AEB39A279
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 15:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B412882C2;
	Thu,  3 Jun 2021 13:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540B46E19B;
 Thu,  3 Jun 2021 13:48:18 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id x8so3014614vso.5;
 Thu, 03 Jun 2021 06:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jNZvxv+I2PzQHifv6u1OBX2ue0p+ew/tzlxcfO5rbjI=;
 b=iHUO5szO77JtMpqC1Dhq85KKhjrGh3glW8bfrqBRoPQb5UE5BHvQNB7bl3+6OmxbwK
 fhlb9WvHFUmBpvb7OMYiU86OuId41LRNUleq/sdooTfg4LRVmKe98Ywm1m9BY2T+A1sc
 QdXDRMO+P4aN2yWQMZZTd+cQxhvuNjuTMdepqi1LWl5KYJqbGN6CglqJUGh5TelsrQrk
 ZJPRXCq9PhKeIXgEtClxaJCjqwkAMhhuqcVrDt69gRXON8Q+DuZVOc3TGfJ2qvQ7Ncsy
 ONjCbnxqqscWpGVk/Rl9f3lzfzs6kE/bu66i+cdke4nVL2aPx+fzMqDhMjXVOc44NbMI
 V2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jNZvxv+I2PzQHifv6u1OBX2ue0p+ew/tzlxcfO5rbjI=;
 b=Duo00SruHUT7A67sGDgA2jGyv8hwlxt6RRxQ1+mMEZM1/ppOREOOXQWs33c3Iav1Sk
 2kOqISfkw4ZF9Hj6ck7XMrzCOfcSDMo5bMbP4wPo5DujvPSTIEfiynseYqo70xMfisOU
 capS6ezNpPJzgnBIFQe0xeHydhO4Hxvf1iDrs8F63G1gLxJ7HeizAep4dvoSLznTGaA3
 GFaRWhH+M1T5a4ss8iPEi8gi+pjPueIZspvQpon/QCTC/jonc86DbQqlmnsmCh2vTGH0
 H30AwWrhVUYlnmI5LsGzKfPZEq3PJPoJ+gOGcWM7ePLO0n6dli4/dtoDr17mKIisIB3E
 RyvQ==
X-Gm-Message-State: AOAM533aceOVavKGW4eiNW2DMOWI0RwC3FKIMa8HQLfonNavtLfYCEtD
 0thCfKvA5LeATUDanwXQhv6GR9DC/wy6ZK3mdWU=
X-Google-Smtp-Source: ABdhPJzYrWD71I21OfyloD9YwGdEuAKXxBlGu/xu/qy6WOi34HAMSD7H/J1gMvf40mkqigTejZiWC6qKZ7EpghQvrKQ=
X-Received: by 2002:a67:878a:: with SMTP id j132mr28254065vsd.18.1622728097504; 
 Thu, 03 Jun 2021 06:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210421204804.589962-1-hdegoede@redhat.com>
 <20210421204804.589962-3-hdegoede@redhat.com>
 <CACvgo50onXuRvtXySYNHJZshSkmX8ukcMitNJAKC4dEMPTyXYw@mail.gmail.com>
 <fb2209f1-a6d8-4a1e-de58-00ee788aa6c2@redhat.com>
In-Reply-To: <fb2209f1-a6d8-4a1e-de58-00ee788aa6c2@redhat.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 3 Jun 2021 14:48:05 +0100
Message-ID: <CACvgo5352Oc=Re4pATi3oQ-RHBm3OTaaLouvfCPqewW+weUh1g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/9] drm: Add privacy-screen class (v2)
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Mark Gross <mgross@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sebastien Bacher <seb128@ubuntu.com>, David Airlie <airlied@linux.ie>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mark Pearson <markpearson@lenovo.com>, Rajat Jain <rajatja@google.com>,
 Andy Shevchenko <andy@infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Jun 2021 at 12:59, Hans de Goede <hdegoede@redhat.com> wrote:

> >
> >> +#include "drm_internal.h"
> >
> > I think we don't need this include, do we?
>
> The drm_privacy_screen device registered by a provider
> uses /sys/class/drm as its class, quoting from
> drm_privacy_screen.c drm_privacy_screen_register():
>
>         priv->dev.class = drm_class;
>         priv->dev.type = &drm_privacy_screen_type;
>         priv->dev.parent = parent;
>         priv->dev.release = drm_privacy_screen_device_release;
>         dev_set_name(&priv->dev, "privacy_screen-%s", dev_name(parent));
>         priv->ops = ops;
>
>         priv->ops->get_hw_state(priv);
>
>         ret = device_register(&priv->dev);
>
> Notice the "priv->dev.class = drm_class", the drm_class
> variable is declared in "drm_internal.h".
>
I have been looking at v1 while replying here, oopsie.

> >> --- /dev/null
> >> +++ b/include/drm/drm_privacy_screen_consumer.h
> >
> >> +#include <drm/drm_connector.h>
> >
> > Ditto
>
> The "enum drm_privacy_screen_status" used in various places
> comes from drm/drm_connector.h (it is the same enum which is
> used for the possible values of the drm-connector properties).
>
Hmm indeed.

If really needed one could move/duplicate/duplicate-and-namespace the
enum. If duplicating, cross references would be great and with
namespacing BUILD_BUG_ON(drm_privacy_screen_status::foo !=
custom-enum::foo) to enforce consistency.

Each feels dirty and I'm not sure if it's worth it -  just a silly
idea, don't read too much into it.

>
> >> --- /dev/null
> >> +++ b/include/drm/drm_privacy_screen_driver.h
> >
> >> +#include <drm/drm_connector.h>
> >
> > Ditto
> >
> > I like how you avoided leaking any DRM details within the new code,
> > modulo the includes above.
>
> I'm glad you like it. I did indeed try to make the code mostly
> independent, but as you can see above there are still some
> inter-dependencies.
>
> Because of this, the CONFIG_DRM_PRIVACY_SCREEN option also does
> not control building this into a separate module. Like many other
> DRM Kconfig options, this controls if the privacy-screen code will
> be added to drm.ko or not.
>
> Despite being 99% independent, the 2 are still intertwined at such
> a level that this is necessary. Specifically drm_core_init() calls
> drm_privacy_screen_lookup_init() to initialize the static lookup
> table which is used to see if there is a privacy-screen (and to which
> GPU,output combo it should be mapped). So if CONFIG_DRM_PRIVACY_SCREEN
> is enabled and drm.ko is builtin then it must be builtin too, at which
> point it is easiest to just make it part of drm.ko .
>
Yes, the initialisation is called from core drm - it has to happen somewhere.

What I was thinking of, is that we can reuse it (with minor tweaks) if
vendors deploy the privacy screen principle for audio, camera, etc.
Kind of crazy examples, but who knows.

> > With above tweaks, the series is:
> > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> As I've tried to explain, the includes are necessary, does your
> Reviewed-by still stands when I keep the includes ?
>
Yes, r-b it stands.

Thanks for the in the detailed reply and drm_class pointer :-P
-Emil
