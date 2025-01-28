Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3199A20B03
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 14:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2313F10E040;
	Tue, 28 Jan 2025 13:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PiiKLAqb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEFA10E040
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 13:12:47 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-303548a933aso51569051fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 05:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738069965; x=1738674765; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+PHbuWb2poWXKCjmCpK/Mq08UrHjo5E/quYXR/Ycg3U=;
 b=PiiKLAqbDKX5m3gVSpz5exIMaY26uGqFyVga8c7FJwqxYr6Iqzkp/NulXfIhOUKyWd
 iF0puKNSUzFDRyuAt/8zBZ/S9O6muSHp5ZD6OrbAa8UxQNaNjrFFmkV/TwoAu6rPKHlR
 2HhEeKHBoVOU2cfMyoIDYPCrk23UiRLLtx40W9BlB/Ou/Uus6t/ZNb4JdZtD4KszRaJd
 cdDZvoGOqjd2ZeqvfB4/NtG1MksmQeBLXU8TWgX2ebJxVdFoNXvMndVNvyw9di8aOiCb
 ui3bTP+rnZCCuMa9VcYbkX7r6L4LYsZSeMyqepJQnwCvRxC7KW30/FdLSxD99cE7bTIf
 GoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738069965; x=1738674765;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+PHbuWb2poWXKCjmCpK/Mq08UrHjo5E/quYXR/Ycg3U=;
 b=r5mCGUe2rsKDcu70lvJYnmwrIvQXCfQKtQ+kPqgT+KAhX7xthA4jYOGmvxLw9vxJnU
 8+6Qn9hEJHaeTYW9zkLCmmjtXZD/sYkPgzoALHc/271YyDygPZeSLcxeWjKWZ525dC1z
 6brWc94euxIhg8bhqGXnDj0M6q1UKb8r8v8DftownSX9XwqqL373P/xHTfyn14kOpIK+
 r20J9gJ0X3aH3N26tUvrWGPuf4+poq5bhZ/idOSWzSZ+eCZ0l50lw0VHcckD5ggOxgip
 bmogzCBB1DJ40eVa6uLtI9m9oCNl2chLdwOOZW8hi5HGBfnfnrhDlANYa26jUXEuhjhw
 ED3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4nEqWBEh0W/4Q+zeW5mS6s4i58fpqkwvq5dPAbJO6foVOKhEWN3GpgeAnqCjezKg9jeQgYqLw7hs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4WN6/MgMcshA6cNLP0tdAVoRR5UCkARUTs2rACde8z7yGH4XQ
 XV9CY6OWwA0d2LNoTGjzUgFT+rZmG9ko4NqT/iOmT0Gl5XJT1jJAR5wLoTiHQks=
X-Gm-Gg: ASbGncvsAGyc/2MSJCPh7zNTJGaMqxtB4Mz/eZtwDpw2n9e192Vo+fTn6TxoG5talnZ
 S4RI9eKUot6s7kXn52AIDfeo8kWJwXVBREbTk3xuX/s7W0ghAVGJ+qCk0eIemM3Azux5fZzr3kk
 xTHTMkCVH3pOPXnhziImLHR9vYxgP5GDZP/8U8XQzlrnn2Q7YSWgkhptbCNJdHCGaxwBNpo46/t
 BmQWFLjKtCxL2YsnKz5U17pXWEGMRQNTMUrxAkSv3BZYIhvBisFuClNrWC2po4BjBfi7ct42nmb
 PcnjuO2VO9ButPorVNiM/vEfugPBSxdRDcREScTYpkdR2F3FNNkcXCH8+V2Z6z73zdJu5r8=
X-Google-Smtp-Source: AGHT+IFmgfnBqCL28QhlbcvZBvZtsSTOCmP0MfeMbkpRL14lGaE73CXWdZ6aVvdA1AHgu0++wgfYxQ==
X-Received: by 2002:a05:651c:154b:b0:2ff:bd92:1d7d with SMTP id
 38308e7fff4ca-3072cb1f7ccmr187877591fa.23.1738069965402; 
 Tue, 28 Jan 2025 05:12:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076ba67d21sm18582261fa.23.2025.01.28.05.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 05:12:44 -0800 (PST)
Date: Tue, 28 Jan 2025 15:12:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/10] drm/connector: add CEC-related fields
Message-ID: <mtzfnr53hug7ina7hf3s6ihzkdl7xswz6ibf46dgei73khj4ms@cfrxg32vdrbw>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-1-5b5b2d4956da@linaro.org>
 <wchzy3tnppv5ql7k2juhynqz7kwjjsod3taykw3znxrzoomqdw@fudbksambvat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wchzy3tnppv5ql7k2juhynqz7kwjjsod3taykw3znxrzoomqdw@fudbksambvat>
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

On Tue, Jan 28, 2025 at 11:33:05AM +0100, Maxime Ripard wrote:
> On Sun, Jan 26, 2025 at 03:29:06PM +0200, Dmitry Baryshkov wrote:
> > As a preparation to adding HDMI CEC helper code, add CEC-related fields
> > to the struct drm_connector. Include both cec_adapter and cec_notifier,
> > allowing drivers to select which one to use. The unregister callback
> > is provided to let drivers unregister CEC-related data in a generic way
> > without polluting drm_connector.c with dependencies on the CEC
> > functions.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_connector.c | 13 ++++++++++++
> >  include/drm/drm_connector.h     | 44 +++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 57 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 1383fa9fff9bcf31488453e209a36c6fe97be2f1..fffb718b09eaaac200e6abc7524bbfe98c4741f4 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -279,6 +279,7 @@ static int drm_connector_init_only(struct drm_device *dev,
> >  	INIT_LIST_HEAD(&connector->probed_modes);
> >  	INIT_LIST_HEAD(&connector->modes);
> >  	mutex_init(&connector->mutex);
> > +	mutex_init(&connector->cec.mutex);
> >  	mutex_init(&connector->eld_mutex);
> >  	mutex_init(&connector->edid_override_mutex);
> >  	mutex_init(&connector->hdmi.infoframes.lock);
> > @@ -698,6 +699,16 @@ static void drm_mode_remove(struct drm_connector *connector,
> >  	drm_mode_destroy(connector->dev, mode);
> >  }
> >  
> > +static void drm_connector_cec_unregister(struct drm_connector *connector)
> > +{
> > +	mutex_lock(&connector->cec.mutex);
> > +
> > +	if (connector->cec.funcs->unregister)
> > +		connector->cec.funcs->unregister(connector);
> > +
> > +	mutex_unlock(&connector->cec.mutex);
> > +}
> > +
> >  /**
> >   * drm_connector_cleanup - cleans up an initialised connector
> >   * @connector: connector to cleanup
> > @@ -718,6 +729,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
> >  
> >  	platform_device_unregister(connector->hdmi_audio.codec_pdev);
> >  
> > +	drm_connector_cec_unregister(connector);
> > +
> 
> This should either be in a separate patch, or mentioned in the commit title/log

I'll mention it in the commit message.

> 
> >  	if (connector->privacy_screen) {
> >  		drm_privacy_screen_put(connector->privacy_screen);
> >  		connector->privacy_screen = NULL;
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index f13d597370a30dc1b14c630ee00145256052ba56..6da840673b1209c84bbc396643c6033679a7ec74 100644
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
> > @@ -1191,6 +1192,19 @@ struct drm_connector_hdmi_audio_funcs {
> >  			   bool enable, int direction);
> >  };
> >  
> > +/**
> > + * struct drm_connector_cec_funcs - drm_hdmi_connector control functions
> > + */
> > +struct drm_connector_cec_funcs {
> > +	/**
> > +	 * @adap_unregister: unregister CEC adapter / notifier.
> > +	 *
> > +	 * The callback to unregister CEC adapter or notifier, so that the core
> > +	 * DRM layer doesn't depend on the CEC_CORE.
> > +	 */
> > +	void (*unregister)(struct drm_connector *connector);
> > +};
> > +
> >  /**
> >   * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
> >   */
> > @@ -1832,6 +1846,31 @@ struct drm_connector_hdmi {
> >  	} infoframes;
> >  };
> >  
> > +/**
> > + * struct drm_connector_cec - DRM Connector CEC-related structure
> > + */
> > +struct drm_connector_cec {
> > +	/**
> > +	 * @mutex: protects all CEC-related fields
> > +	 */
> 
> All fields? Which fields require to be protected by a specific mutex
> here?

Yes, all the fields. adapter, notifier and funcs are all protected by
the mutex. See the drm_connector_cec_unregister() implementation (and
corresponding unregister() callbacks implementations.

-- 
With best wishes
Dmitry
