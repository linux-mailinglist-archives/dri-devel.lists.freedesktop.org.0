Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195DF9B90EA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 13:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2906B10E10F;
	Fri,  1 Nov 2024 12:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S0KmC51V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EDD10E10F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 12:09:09 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53a007743e7so2153748e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 05:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730462947; x=1731067747; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wAhQCRcMiUmuMbWiOCOKS1oH6Z8vsXpQznKWvE4jlME=;
 b=S0KmC51V2EORutijv8VQam75Rn0DoVTVQK/VPh1Q+Yu+ers8mjqVSIMrTSEKmV/yv6
 mnRG0L+ROkxu2UgGRvsy35k9qiLU9WxIF8YjDv5r4kHQ/RfJGCWhmLX6X6SNNHZu3Ch2
 tKQ/zhNID8y7UYMHk2JUuDz8cFIviDWkyom+BIZ4LZqn3nFdJWJRuJGROZS+iIdLj7oQ
 H4L3CKMW9smKs4hKVl5XWA+0wteMIOYCDFubMwdvNjOoeoj4kIng5a/mvDLSMRb0CcEw
 l9P/AjCp9XfFoDi/OYKFtVN071BQtKq4R5spUW9sXsH4M0azhvhx4UWGarwD4qcbHmjm
 1VvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730462947; x=1731067747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wAhQCRcMiUmuMbWiOCOKS1oH6Z8vsXpQznKWvE4jlME=;
 b=AeUEo+4VFvFoWamvLrXiEVptKGjUsxgiToKAEpjUsXZzv3f1v/wNey7YVeGdXicK6o
 toape+ojFNe2xOVvOJrgajK4GcqTQh7IZXLo2D30q3XyDrD4TemOUl+xWZ6N6DYOMw4/
 7Ko3Tfv8ocG1SXXKkmgpiMd7yaFxy/wLOGNGKeUOw8T7DlWhGhZw4xUM5Html8DP6+5o
 T7AhubjJpZzymu6uxYvyoW+61VryEBq8sO2t7qNrZPLg1CmbSdP9GDgwghyie1dZV8q1
 91iXyPFYAiMMXchaWIuugpltOtfhUJKuLZp2ERnx7OBQtLKGkChCkCOj2iMJ06NGe2Ei
 bhBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoIwPT5b5KVx3pQpn4G5lhLMzSxEbfr5b6VpoG0Zjh7umrsr880Dhd0VgGP5IklJ/wtiRvLNOXz7s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0M2l1EkHMztgmBc6dszjFGp5VCfnTuZBV5MhyGheRRPd7P5OT
 0c6seI70rKaR/twTt9JqlGntankagxdo5TJ1hzcoVYwHHNNRXwibjWHgoThRbY8=
X-Google-Smtp-Source: AGHT+IHyAbSEgE4oV7BsWrSuBbwGPbBwncS1nrZBHG68qMqQ1XtsqRRKKfWPtVih1dkSCYyDRwz/RA==
X-Received: by 2002:a05:6512:ac3:b0:536:56d8:24b4 with SMTP id
 2adb3069b0e04-53c79e15746mr3712339e87.5.1730462947418; 
 Fri, 01 Nov 2024 05:09:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc959casm536926e87.49.2024.11.01.05.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 05:09:05 -0700 (PDT)
Date: Fri, 1 Nov 2024 14:09:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Phong LE <ple@baylibre.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH RFC v2 6/7] drm/display/hdmi: implement connector update
 functions
Message-ID: <26rhzrhn2vjq26foxifsuytby52q5ggxwvhpnozuaschm3iq2g@rimrszg6s526>
References: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
 <20241101-drm-bridge-hdmi-connector-v2-6-739ef9addf9e@linaro.org>
 <871pzvjk2t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871pzvjk2t.fsf@intel.com>
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

On Fri, Nov 01, 2024 at 12:59:38PM +0200, Jani Nikula wrote:
> On Fri, 01 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > The HDMI Connectors need to perform a variety of tasks when the HDMI
> > connector state changes. Such tasks include setting or invalidating CEC
> > address, notifying HDMI codec driver, updating scrambler data, etc.
> >
> > Implementing such tasks in a driver-specific callbacks is error prone.
> > Start implementing the generic helper function (currently handling only
> > the HDMI Codec framework) to be used by driver utilizing HDMI Connector
> > framework.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 56 +++++++++++++++++++++++++
> >  include/drm/display/drm_hdmi_state_helper.h     |  4 ++
> >  2 files changed, 60 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index feb7a3a759811aed70c679be8704072093e2a79b..dc9d0cc162b2197dcbadda26686a9c5652e74107 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -748,3 +748,59 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
> > +
> > +/**
> > + * __drm_atomic_helper_connector_hdmi_update_edid - Update the HDMI Connector basing on passed EDID
> > + * @connector: A pointer to the HDMI connector
> > + * @drm_edid: EDID to process
> > + *
> > + * This function should be called as a part of the .detect() / .detect_ctx()
> > + * and .force() callbacks, updating the HDMI-specific connector's data. The
> > + * function consumes passed EDID, there is no need to free it afterwards. Most
> > + * of the drivers should be able to use
> > + * @drm_atomic_helper_connector_hdmi_update() instead.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int
> > +__drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
> > +					       const struct drm_edid *drm_edid)
> > +{
> > +	drm_edid_connector_update(connector, drm_edid);
> > +	drm_edid_free(drm_edid);
> 
> Not fond of splitting resource management responsibilities
> asymmetrically like this.

Ack, I can remove drm_edid_free() call.

> 
> > +
> > +	if (!drm_edid) {
> > +		drm_connector_hdmi_codec_plugged_notify(connector, false);
> 
> Is it a good idea to tie connection status to EDID presence at the
> helper level? Nearly the same, but still orthogonal.

Yes. We have been discussing this in v1 review. Basically, CEC, HDMI
codec and some other features should be pinged without any userspace
interaction. This means that get_modes / fill_modes is mostly out of
question. The final agreement was that the .detect is the best place to
handle them (BTW: this matches the i915 driver, see
intel_hdmi_detect()).

> 
> > +
> > +		// TODO: also handle CEC and scramber, HDMI sink disconnected.
> > +
> > +		return 0;
> > +	}
> > +
> > +	drm_connector_hdmi_codec_plugged_notify(connector, true);
> > +
> > +	// TODO: also handle CEC and scramber, HDMI sink is now connected.
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_update_edid);
> 
> Feels wrong to export and document double underscored functions to
> actually be used.

We have enough examples of EXPORT_SYMBOL(__drm_foo) in DRM helpers. But
I can drop double-underscore if that's the issue.

> 
> > +
> > +/**
> > + * drm_atomic_helper_connector_hdmi_update - Update the HDMI Connector after reading the EDID
> > + * @connector: A pointer to the HDMI connector
> > + *
> > + * This function should be called as a part of the .detect() / .detect_ctx()
> > + * and .force() callbacks, updating the HDMI-specific connector's data.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int
> > +drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector)
> > +{
> > +	const struct drm_edid *drm_edid = drm_edid_read(connector);
> > +
> > +	return __drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
> > +}
> > +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update);
> > diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
> > index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..ea0980aa25cbbfdd36f44201888c139b0ee943da 100644
> > --- a/include/drm/display/drm_hdmi_state_helper.h
> > +++ b/include/drm/display/drm_hdmi_state_helper.h
> > @@ -20,4 +20,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
> >  int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
> >  						       struct drm_atomic_state *state);
> >  
> > +int __drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
> > +						   const struct drm_edid *drm_edid);
> > +int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
> > +
> >  #endif // DRM_HDMI_STATE_HELPER_H_
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry
