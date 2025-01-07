Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01FDA0480C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 18:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B5910E756;
	Tue,  7 Jan 2025 17:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sh91AJv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7235910E756
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 17:19:03 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3eb880e5ac2so8033407b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 09:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736270283; x=1736875083; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uq6tMuRVkGjsfQ0vrMjG0uZg7FQW6JHc3gZ//LGtKFk=;
 b=sh91AJv3bV6CigpAykG0ExsPKBEHoegG315Gzj+Z19BgpfhAWP6b3bezOy+m7GQqIP
 XtnnFP/TJTNm7vPvN8BX0L6hhNI3WPlhF7RSxz6cK+egW+yjUTC0deZO4i9Dav9l3qoB
 Rp/AwshwNokRD4+ufkibEAzmgrdbvuxzu/usBf7PgylIrUO0hg0AaCfHYCHOSxOSHKtk
 JY26eAPaUqnQe5jRTRrKHwe7ivf+SvbDTrxIFuR9fJyta2naQ9Za16DUgms5xhmB9JxZ
 R/pcNNyOxX8HLO/E6LgMNQSxR5Xsgs6cdjXsBSqvMXhEMHc4nDiCJas5gLmQZPTTZKTq
 D6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736270283; x=1736875083;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uq6tMuRVkGjsfQ0vrMjG0uZg7FQW6JHc3gZ//LGtKFk=;
 b=WjtNacNxAr2gwAtaMAuWxHtWwszpeqwjAUA1P3lvu5sXVaZvZXgblXDl5PXdLKWPm1
 khyJJw0FiGzL2UI2A/yZr9dqQ/wIF5tiT0lHQSBFAUflDKWTrFAM0R9tNJftK6kFeesW
 7YegKwmqTs7QeDddBhRkha3gEWJrVd8526V17hmet73CRnTDOqk2H7+Oel6YxkEhP8Wb
 lZf/2pjzL3YJJV6JY3mlADbwQHCFcdKItuEsriEAueb4hXgpvu/GZxh5fnS8b/mI5zkN
 oRqE1WiBEEQM0pZcvEzPmq7uxP/CgLKI0MB07tw7U2tgOOHF7u9ec5SVvrHwuI7/sdsP
 V3Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhKVEw+sZz5o84dWWMDWmKVQ/2Btb8pOh2U1OJAAjGi9bAkgxMGDqU4Q7CyCTT63Y7A8Cb9wOFWvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6f/bPi6GkejBkiDAGjfFMaGmT2TuKpMvVB80zMnsLfjSAYmEo
 K90qB0YLr9/VYdWnPj0G6FW2PH/CM8Z5uI4fLsDLAAb3TtzpsSkMkp1dS1sblMELmgiNRkhvfcq
 ZyYw4tv9Q1+ykD/lF/aFO8RW2j8U+6AmsHmERLdew+Mdn4g+p
X-Gm-Gg: ASbGncsxk2OUjEo7Y7hHDI49rcwE6lZwrVfDzjMOz7l/72k1xUt9S8fcm4njyV9ApFR
 yFA01vFA1gdB7IbXo9NkMCNvmUQ0dOsJjPi/AAeNLfqt3xmXFMUlPJ7oxYV1CIqxXQTaADA==
X-Google-Smtp-Source: AGHT+IFBvBDRBIJsfXdu3nf+s3R+CscHOAnAvFKpn3WAAGQfNrYgDKAoEYvY7KnDUb92a80kM+ETST24mj64IVwF7v8=
X-Received: by 2002:a05:690c:23c4:b0:6ef:57ad:9d91 with SMTP id
 00721157ae682-6f3f814163fmr483537197b3.24.1736266697982; Tue, 07 Jan 2025
 08:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
 <20241225-drm-hdmi-connector-cec-v1-2-b80380c67221@linaro.org>
 <20250107-psychedelic-earthworm-of-action-cf5ceb@houat>
In-Reply-To: <20250107-psychedelic-earthworm-of-action-cf5ceb@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Jan 2025 18:18:07 +0200
Message-ID: <CAA8EJppxnVuVL9LH1Ars0=SKBM1L05Z5KwA_z1_+=dBugfrL-g@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 2/9] drm/display: add CEC helpers code
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
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

On Tue, 7 Jan 2025 at 16:32, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Wed, Dec 25, 2024 at 01:10:10AM +0200, Dmitry Baryshkov wrote:
> > Add generic CEC helpers to be used by HDMI drivers. Both notifier and
> > and adapter are supported for registration. Once registered, the driver
> > can call common set of functions to update physical address, to
> > invalidate it or to unregister CEC data.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/Kconfig               |   5 +
> >  drivers/gpu/drm/display/Makefile              |   2 +
> >  drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 145 ++++++++++++++++++++++++++
> >  include/drm/display/drm_hdmi_cec_helper.h     |  38 +++++++
> >  4 files changed, 190 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> > index 8d22b7627d41f7bc015decf24ae02a05bc00f055..49da9b768acf3e5f84f2cefae4bb042cfd57a50c 100644
> > --- a/drivers/gpu/drm/display/Kconfig
> > +++ b/drivers/gpu/drm/display/Kconfig
> > @@ -82,6 +82,11 @@ config DRM_DISPLAY_HDMI_AUDIO_HELPER
> >         DRM display helpers for HDMI Audio functionality (generic HDMI Codec
> >         implementation).
> >
> > +config DRM_DISPLAY_HDMI_CEC_HELPER
> > +     bool
> > +     help
> > +       DRM display helpers for HDMI CEC implementation.
> > +
> >  config DRM_DISPLAY_HDMI_HELPER
> >       bool
> >       help
> > diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> > index b17879b957d5401721396e247fa346387cf6c48a..2cd078e2b81c1a9e6b336c4187b444bcb8a50e51 100644
> > --- a/drivers/gpu/drm/display/Makefile
> > +++ b/drivers/gpu/drm/display/Makefile
> > @@ -16,6 +16,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
> >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
> >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER) += \
> >       drm_hdmi_audio_helper.o
> > +drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_CEC_HELPER) += \
> > +     drm_hdmi_cec_helper.o
> >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
> >       drm_hdmi_helper.o \
> >       drm_scdc_helper.o
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..2a3832e68232fa3b839a3c7457b2013779cada86
> > --- /dev/null
> > +++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
> > @@ -0,0 +1,145 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright (c) 2024 Linaro Ltd
> > + */
> > +
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/display/drm_hdmi_cec_helper.h>
> > +
> > +#include <linux/mutex.h>
> > +
> > +#include <media/cec.h>
> > +#include <media/cec-notifier.h>
> > +
> > +static void drm_connector_hdmi_cec_adapter_unregister(struct drm_connector *connector)
> > +{
> > +     cec_unregister_adapter(connector->cec.adapter);
> > +     connector->cec.adapter = NULL;
> > +     connector->cec.unregister = NULL;
> > +}
> > +
> > +int drm_connector_hdmi_cec_adapter_register(struct drm_connector *connector,
> > +                                         const struct cec_adap_ops *ops,
> > +                                         const char *name,
> > +                                         u8 available_las,
> > +                                         int (*init_cec)(struct drm_connector *connector),
> > +                                         void (*uninit_cec)(struct drm_connector *connector),
> > +                                         struct device *dev)
>
> We're missing a documentation here. Why do we need drivers to pass both
> a set of cec_adap_ops and a bunch of extra functions? Shouldn't we make
> this a single structure like we did for audio?

Also might be an option, I didn't want to add extra wrappers in the
first place, but I can add them.

>
> Also, to remain consistent, we should call that function drm_connector_hdmi_cec_register

I wanted to point out the _adapter_ part, because we also have
whatever_cec_notifier_register() and at some point we might also get
whatever_cec_pin_register() if we wrap sun4i implementation too.

-- 
With best wishes
Dmitry
