Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FDE876272
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 11:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5179D113849;
	Fri,  8 Mar 2024 10:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sznDCpVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E046113849
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 10:52:17 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-607c5679842so19440297b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Mar 2024 02:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709895136; x=1710499936; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=osicK+Lc37n5xGtCEzMFa5fG9t5AvZEPqN0hs8cNnSc=;
 b=sznDCpVznWZQToStZZcEMc2uc+LPoTYQ5qgW08QwWH1AB5y3EU0X+yykF+pgB5Hwvr
 jhmty1fzXaaTPgyLbXKDlwKxEOVE/nYaqA06W1zb1CdhFuZrlhBjxbeZ5wdlholJKJON
 UwKEQIuSFbPeeAA7ps7V3I+MNd0eJ7D/87B5dg9xJVYoD8iJQ/PDa0egvvMhpSkbQP9e
 jNlxV/6P6ADwgvBk9UmAEH9aWwNYvqEEsq55JNGsVSlynujA70pd9RPFExpgSVMseRqI
 aMQ9+WIY/vlSaEisL/RXlt6lQaw44rbmF2jG/SpvfjLZGvL3JSSKi1nSgAqILVEM2pr+
 zbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709895136; x=1710499936;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=osicK+Lc37n5xGtCEzMFa5fG9t5AvZEPqN0hs8cNnSc=;
 b=eJfOxiwLzGU2n2Lx7Es8bBBdgw0M3i63IBMt1zl1uMK5XAz31RH69hKoLWuXXPYII+
 UtXxSQpr4fVBnu0X7G6CnGCI0IdnFhm7m9Cu1JgppYl69+VWM8nXhB7RI5RiD+fAVwkC
 Dvw8G7zqCEMjbMpKkzTiuC0o2Jsp97gm1+q8mNUE++P48hTAm32R6xCnlGX1wEN7y017
 auvhnpBtVyECbSVZtz5UV5rO3X4+G8G9mPkYt1VAyLGwFSeyS9NUr11WxDWfq45s+PIV
 5UiAgCi0OXWusfjvYeByhwaDHV/09zXRtna0vJIIQATXN65g88c+b19iFE99Kd7PFoel
 pYsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC8kViF55SmXEfiN39k7EwbJiaqJWDOctMrM4Vq45V6kTfBNiFH5ckRm/Bqh2JaEXPws+pdfDer4V/AGzovecq7pQW+KU/7dQEArkla5sU
X-Gm-Message-State: AOJu0Yz/w5ivmaegPICfTLm/8yWCsNzmBMgf/BUZt66bJcQF+F4K9659
 PWSdo+g+xxnE2KEmIqWjmmpr/8OpSrS9uIOzssKjaAm02sPIdkYBiJlk0Zb2h0s9nZkJFXfaUvU
 3aZOMvyDpskajaivkztM7gN9IjX4lwYGbkud54Q==
X-Google-Smtp-Source: AGHT+IEpvSnPWvbgQcOAWWbL40tauyfSYiTiSr3NsbMugXhUOm7Sk754wH8CBuh/OC/BMReLxH0Hf5sL6vDR6tJG6Ro=
X-Received: by 2002:a05:690c:ed4:b0:607:ca2e:f23e with SMTP id
 cs20-20020a05690c0ed400b00607ca2ef23emr29080999ywb.30.1709895135715; Fri, 08
 Mar 2024 02:52:15 -0800 (PST)
MIME-Version: 1.0
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
 <20240308-bridge-hdmi-connector-v1-3-90b693550260@linaro.org>
 <20240308-provocative-pumpkin-hoatzin-f9f31e@houat>
In-Reply-To: <20240308-provocative-pumpkin-hoatzin-f9f31e@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Mar 2024 12:52:04 +0200
Message-ID: <CAA8EJpp2XwZfG4SuNFqVMmr5hvWZoOq+zCutpgzdNpZM3EwjBA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/6] drm/connector: hdmi: split setup code of the HDMI
 connector
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Fri, 8 Mar 2024 at 11:44, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi Dmitry,
>
> Thanks a lot for working on that, it's greatly appreciated :)
>
> On Fri, Mar 08, 2024 at 01:57:02AM +0200, Dmitry Baryshkov wrote:
> > In order to use HDMI connector extensions from the bridge drivers, carve
> > out the drm_connector_hdmi_setup() from drmm_connector_hdmi_init(). This
> > way the drm_bridge drivers can call new function from their
> > setup_connector callbacks.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_connector.c | 67 ++++++++++++++++++++++++++++++-----------
> >  include/drm/drm_connector.h     |  5 +++
> >  2 files changed, 54 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 427816239038..ba953eb45557 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -454,15 +454,11 @@ int drmm_connector_init(struct drm_device *dev,
> >  EXPORT_SYMBOL(drmm_connector_init);
> >
> >  /**
> > - * drmm_connector_hdmi_init - Init a preallocated HDMI connector
> > - * @dev: DRM device
> > + * drm_connector_hdmi_setup - Init a preallocated HDMI connector
> >   * @connector: A pointer to the HDMI connector to init
> >   * @vendor: HDMI Controller Vendor name
> >   * @product: HDMI Controller Product name
> > - * @funcs: callbacks for this connector
> >   * @hdmi_funcs: HDMI-related callbacks for this connector
> > - * @connector_type: user visible type of the connector
> > - * @ddc: optional pointer to the associated ddc adapter
> >   * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
> >   * @max_bpc: Maximum bits per char the HDMI connector supports
> >   *
> > @@ -477,18 +473,12 @@ EXPORT_SYMBOL(drmm_connector_init);
> >   * Returns:
> >   * Zero on success, error code on failure.
> >   */
> > -int drmm_connector_hdmi_init(struct drm_device *dev,
> > -                          struct drm_connector *connector,
> > +int drm_connector_hdmi_setup(struct drm_connector *connector,
> >                            const char *vendor, const char *product,
> > -                          const struct drm_connector_funcs *funcs,
> >                            const struct drm_connector_hdmi_funcs *hdmi_funcs,
> > -                          int connector_type,
> > -                          struct i2c_adapter *ddc,
> >                            unsigned long supported_formats,
> >                            unsigned int max_bpc)
> >  {
> > -     int ret;
> > -
> >       if (!vendor || !product)
> >               return -EINVAL;
> >
> > @@ -496,8 +486,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> >           (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
> >               return -EINVAL;
> >
> > -     if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> > -           connector_type == DRM_MODE_CONNECTOR_HDMIB))
> > +     if (connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
> > +         connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
> >               return -EINVAL;
> >
> >       if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
> > @@ -506,10 +496,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> >       if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
> >               return -EINVAL;
> >
> > -     ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
> > -     if (ret)
> > -             return ret;
> > -
> >       connector->hdmi.supported_formats = supported_formats;
> >       strtomem_pad(connector->hdmi.vendor, vendor, 0);
> >       strtomem_pad(connector->hdmi.product, product, 0);
> > @@ -531,6 +517,51 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> >
> >       return 0;
> >  }
> > +EXPORT_SYMBOL(drm_connector_hdmi_setup);
>
> I guess it's more of a general comment on the whole design of things,
> but this is the starting point I think.
>
> None of the other DRM entities have the split between init and setup,
> connectors included. So this creates a bit of oddity in the API which I
> think we should avoid at all cost. API consistency is the most
> important.
>
> If I got the rest of your series properly, this all stems from the fact
> that since connectors are disconnected from bridges nowadays, there's no
> way to implement drm_connector_hdmi_funcs on an HDMI bridge, and
> especially to get those hooks called with some sort of pointer to the
> bridge private instance.
>
> And so I assume this is why you split init in two here, and added a data
> field to the HDMI part of drm_connector, so that you can init the
> connector in drm_bridge_connector, and then call setup with your
> drm_connector_hdmi_funcs and the private data pointer in setup so it all
> works out. Right?

Yes.

>
> If so, I believe this doesn't only create an inconsistency at the KMS
> core API level, but also in the bridge API. To me, bridges are meant to
> fill the encoder gap, so we shouldn't special-case the core API to
> accomodate the bridge design. And the bridge framework has been designed
> that way too.

My feeling about the drm_connector_hdmi was closer to helpers, rather
than just init. In case of helpers we set them after initializing the
object rather than setting them at the init time.

>
> If you look at the way EDID or HPD handling, we fundamentally have the
> same problem: the connector is supposed to implement it, but it really
> is handled by the bridge driver that wants to operate with its private
> instance data.

Yes.

>
> So I think we should go for a similar approach:
>
>   - We keep the drm_hdmi_connector_init function only
>
>   - If the drm_bridge_connector has an HDMI type, we can
>     drm_hdmi_connector_init and call
>     drm_atomic_helper_connector_hdmi_check() at atomic_check time.

This is slightly problematic. First of all, it breaks layering. What
if the HDMI stream gets wrapped? E.g. into the MyDP (think of
anx7808)? Then the drm_bridge_connector will have connector_type field
equal to DRM_CONNECTOR_DisplayPort (MyDP). I have not looked into the
dual-mode DP connectors or USB-C MHL mode, but they might also cause
some wraparounds. Or changes to the connector_type.

So, I think it is incorrect to call
drm_atomic_helper_connector_hdmi_check() from the drm_bridge_connector
itself.

Likewise, to setup HDMI connector parts from drm_bridge_connector we
will have to pass vendor/product/max_bpc/formats between layers.
Setting up HDMI connector from the bridge itself saves us from such
issues.

The only possible case I have in my mind is that setting up HDMI
connector from the end of the chain would allow us to override some of
the properties. E.g. I can think of hdmi-connector overriding vendor /
product strings.

>
>   - We create a drm_bridge_* set of functions and associated hooks to
>     handle HDMI TMDS char rate filtering and infoframes setup that gets
>     called by drm_bridge_connector, and pass the bridge, connector and
>     all the extra arguments we need.
>
> Once we've done that, we're probably in a good position to support what
> we want to support. The drm_connector_state is passed to the atomic set
> of bridges hooks so they can just read the content from there and we
> should be good?

This might save us from the drm_connector.hdmi.data hassle.

Last, but not least. Your proposal means that we have to use
drm_bridge_connector. Some platforms still use bridge-created
connector. What is the status of the migration? Should we start
pushing drivers towards drm_bridge_connector in a more aggressive way?

-- 
With best wishes
Dmitry
