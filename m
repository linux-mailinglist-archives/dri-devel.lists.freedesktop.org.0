Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B47A044AC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 16:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184C610E722;
	Tue,  7 Jan 2025 15:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r0ULUda/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B242F10E722
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 15:35:24 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e46c6547266so19982606276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 07:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736264064; x=1736868864; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EwSHHGV+yMbNN0CAZFD1sqOQkvyybxDlUBqZuqbI15Y=;
 b=r0ULUda/YKzw2H8poH5uw5e9LOyM0DoBF5tEP1xKK5lDCBnqr98mrHoUp7lT4Pn2bG
 CaxUyikNuatR29ujn7DwIBn6MhdN8qFnoUbM5Zvj88eJkKp3bBrUMILxdedwM2bBynQR
 kixgIMwvDCEp+m9t98eMpiF0NTSgkU3FQrJ0SdhG+spV8yGHPhA84AkiZjota1UVDPmZ
 kziJ9NpK/0F+aZHpR2edXCVhy1ndOCOvwbeBajavCRWPy7smz2IZ/i/A1q3v9A+1oj1/
 y01EGkMB7VUA4fQxKLC2ztxL+3LqxnCBdgMVBwowdD9unGPJIw5DwQL46vkBeyp5Q7yS
 v4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736264064; x=1736868864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EwSHHGV+yMbNN0CAZFD1sqOQkvyybxDlUBqZuqbI15Y=;
 b=ZaO60a0e6oFbP5mTN49X8U+skMj2Tm82tDV8Z23ZibLNCJet/SXt1WDJS522+pwtWz
 ao2OPanSql86ALooYe6KCw6/88jylTTWd1llHfI9L0mJDWLa4v2Afk2jtsQJB5NxE7gt
 Is4+lsFQa6ZVNc68T6k7Vy3jPgSelML5Vjj4ek0H4wop7/R+1BywGLnoGu8AmHxKfwCD
 S60Daopd7aa9bg9+Vo8t6cG+7p9mGl5ui2KdQdD8HLa3fHPMf6RaN1pG5D4fGoowkzVd
 verA/zecKCeeG7TFFl1xvyi71cSZUINGMLGd6wRkBWbBLUy4+NUUzqHp1467HCws0tSV
 AAhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPRodL9jS8E3gEpCBLyyA86DOZ27wcSblpUl+h2eo6sT/Cv3ovCwqg83KI5NfaTChC7H7+/Vt4Psw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIuRdYKRYvb9wShpga25o0Dds6LeM0xEMCeP7ju5OGC67Em1rG
 o/McdcWczrGgQ2LoDGG9ILDfLPl/Oa6glzf9yOGmrKQ4K1YdLZKC/8ROUVUR2agUarX92Aqmjp0
 4XIZyTnrmFWPsN0p7XkTvbUz5lUdAcYjPgcUFiw==
X-Gm-Gg: ASbGncvZwj4OHl5/UShlewnGbW9dpUmQLSBLwfdgY1IjDsoq7ASJcGOBeHVqUX9SWB1
 vLCdmSATdSla+VshGXkZklu0u4Xaq4Ar49vHThG9Kf6GeSY/APAer4NearMy8Xstx74txxg==
X-Google-Smtp-Source: AGHT+IF1+mL2THvwj22ACUAWtNf98oQfiIirJgNfcKLzNWVizxMOLtya1+zu2z5b/1XLjpuhMMehKuh7YQTVZH+1XWk=
X-Received: by 2002:a05:690c:360c:b0:6ef:91a0:dd25 with SMTP id
 00721157ae682-6f3f8125bbcmr524789587b3.17.1736264063808; Tue, 07 Jan 2025
 07:34:23 -0800 (PST)
MIME-Version: 1.0
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
 <20241225-drm-hdmi-connector-cec-v1-1-b80380c67221@linaro.org>
 <20250107-amiable-poetic-rook-17da6e@houat>
In-Reply-To: <20250107-amiable-poetic-rook-17da6e@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Jan 2025 17:34:13 +0200
Message-ID: <CAA8EJpoaEuDu7_84Ce1=XoMgf+GZzTueZNKLR51Nd1-8Z82SsQ@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 1/9] drm/connector: add CEC-related fields
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

On Tue, 7 Jan 2025 at 16:27, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> Thanks a lot for working on this.
>
> On Wed, Dec 25, 2024 at 01:10:09AM +0200, Dmitry Baryshkov wrote:
> > As a preparation to adding HDMI CEC helper code, add CEC-related fields
> > to the struct drm_connector. Include both cec_adapter and cec_notifier,
> > allowing drivers to select which one to use. The unregister callback
> > is provided to let drivers unregister CEC-related data in a generic way
> > without polluting drm_connector.c with dependencies on the CEC
> > functions.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_connector.c | 23 ++++++++++++++++++++++
> >  include/drm/drm_connector.h     | 43 +++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 66 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 1383fa9fff9bcf31488453e209a36c6fe97be2f1..ef299733041e2c64bebd73c3fe21d4492bc07d3a 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -279,6 +279,7 @@ static int drm_connector_init_only(struct drm_device *dev,
> >       INIT_LIST_HEAD(&connector->probed_modes);
> >       INIT_LIST_HEAD(&connector->modes);
> >       mutex_init(&connector->mutex);
> > +     mutex_init(&connector->cec.mutex);
> >       mutex_init(&connector->eld_mutex);
> >       mutex_init(&connector->edid_override_mutex);
> >       mutex_init(&connector->hdmi.infoframes.lock);
> > @@ -698,6 +699,26 @@ static void drm_mode_remove(struct drm_connector *connector,
> >       drm_mode_destroy(connector->dev, mode);
> >  }
> >
> > +/**
> > + * drm_connector_cec_unregister - clean up CEC registration
> > + * @connector: connector to cleanup
> > + *
> > + * Reverse corresponding CEC registration. This function is supposed to be
> > + * called only by bridge drivers which need to handle CEC manually. Normally
> > + * CEC adapter or notifier are automatically unregistered during drm_connector
> > + * teardown.
> > + */
> > +void drm_connector_cec_unregister(struct drm_connector *connector)
> > +{
> > +     mutex_lock(&connector->cec.mutex);
> > +
> > +     if (connector->cec.unregister)
> > +             connector->cec.unregister(connector);
> > +
> > +     mutex_unlock(&connector->cec.mutex);
> > +}
> > +EXPORT_SYMBOL(drm_connector_cec_unregister);
>
> Why do we need to have that function public?

It is being used by drivers during conversion.

>
> >  /**
> >   * drm_connector_cleanup - cleans up an initialised connector
> >   * @connector: connector to cleanup
> > @@ -718,6 +739,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
> >
> >       platform_device_unregister(connector->hdmi_audio.codec_pdev);
> >
> > +     drm_connector_cec_unregister(connector);
> > +
> >       if (connector->privacy_screen) {
> >               drm_privacy_screen_put(connector->privacy_screen);
> >               connector->privacy_screen = NULL;
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index f13d597370a30dc1b14c630ee00145256052ba56..feecd02e7c698cc0c553b79048c9130f69121012 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -46,6 +46,7 @@ struct drm_property_blob;
> >  struct drm_printer;
> >  struct drm_privacy_screen;
> >  struct drm_edid;
> > +struct cec_adapter;
> >  struct edid;
> >  struct hdmi_codec_daifmt;
> >  struct hdmi_codec_params;
> > @@ -1832,6 +1833,41 @@ struct drm_connector_hdmi {
> >       } infoframes;
> >  };
> >
> > +/**
> > + * struct drm_connector_cec - DRM Connector CEC-related structure
> > + */
> > +struct drm_connector_cec {
> > +     /**
> > +      * @mutex: protects all CEC-related fields
> > +      */
> > +     struct mutex mutex;
> > +
> > +     /**
> > +      * @adap: CEC adapter corresponding to the DRM connector.
> > +      */
> > +     struct cec_adapter *adapter;
> > +
> > +     /**
> > +      * @notifier: CEC notifier corresponding to the DRM connector.
> > +      */
> > +     struct cec_notifier *notifier;
> > +
> > +     /**
> > +      * @adap_unregister: unregister CEC adapter / notifier.
> > +      *
> > +      * The callback to unregister CEC adapter or notifier, so that the core
> > +      * DRM layer doesn't depend on the CEC_CORE.
> > +      */
> > +     void (*unregister)(struct drm_connector *connector);
> > +
> > +     /**
> > +      * @uninit_cec_cb: teardown CEC adapter
> > +      *
> > +      * Perform additional tasks to teardown the CEC adapter.
> > +      */
> > +     void (*uninit_cec)(struct drm_connector *connector);
> > +};
>
> I'd rather stay consistent with the video and audio support and have the
> functions in a separate structure.

Ack. And also fix one of the linuxdoc comments.

-- 
With best wishes
Dmitry
