Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9027A9F4AF6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 13:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7419A10E458;
	Tue, 17 Dec 2024 12:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uaHWtLpL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D347B10E458
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 12:31:52 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso5687691e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 04:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734438711; x=1735043511; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OD2airYmXEIM5XCQfXb6/TEVO/ZX203WR6AY+SunHbs=;
 b=uaHWtLpLp02uSLldNsvnFok/nmEmc4fQpKkiFXWbPY1494EkiArJzdYt3gw3NdPaHS
 A7M2LALGmoCz5WlW4v6MQAgG4vs9mHGuIdAx5ArTpnJbqbEF+2KKzLvpkQ8j0apLl/cY
 vhHEPyghKgU49LPWCI+rGRetrF9v52GV5FBTgdkrb5hYq5CqpvRS9iU9IWnRRsnY8UKr
 hpQHA2P0lFkdVEK1/fK+tccnLYKbl/nJXaOD+WNwcQyVzqrLrKlmUSt2df6blWTUKjmn
 toeO2hoBmRD4y9T80tnsLUX7g3pi64i+ONBJNT2FCa+CJim2jvJi96UXne5/uFzjRV+L
 y8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734438711; x=1735043511;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OD2airYmXEIM5XCQfXb6/TEVO/ZX203WR6AY+SunHbs=;
 b=Zmu1xdnxsLBVjM3Bs8JO1L6HW+7W0HODVKijNtYpES7R5LZohDwR59Frw77uewU6Ei
 MvMFGqVOV7Jz7GJVajdH3vWUyICqQU+P6FzR7cqVXKxRq2tjjoXTZn79T6AhswytFb4Q
 UCBC5xDsVYuIJwCQ8SNVkN92PYhkbGS9P9c+ROU5JCxMrXYWnk8YfnVq1eb31tofqHC6
 mtIlc5Y1fW7da2vyxlKN6BxGt5U8XVGYpUhVbwbHcqE/TwXRxv+zFn/aYt1B4j5EahNx
 1NOYjejCYJt7uD0wc6+aq/kcT3OSO4xjeNfrwRJQ6/RbVTh3ZTnT0Rw4uI1h2XtZ2HAY
 W29Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAApvcUyMCTgdOs5Hhl8n9wNTdpiNueRvUi28d2U6CQOQE408V+g0ZOHtIhaf3savkTARs5OYC4s8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO+6fhyD8cqj+ymzFwv+mRBoAhRc7H+ttrRMEuCiWuhZIhJWd5
 wfLQ73Mf/nvQTAUMFv4aPvhHiqUlNorAE1BzAk4XFHaSHRduW8v1KyauJZyTXg4=
X-Gm-Gg: ASbGncsbx3itNjFpjP0KJ/j+WBC5ZkqIRPgOdPAqruo/tWNmlSdSD6eYpHqVbeZ+XYa
 AfTptr1wPm81vm12TW+CNNGTBOyFrdAcHo+8rifIN7EspA0UPDsnElnrfn/CJEVzBwOy2GtOZSh
 p7QzWC+9Bw672gPC+KEUL0NRqzBF212ZSF+f4rUdSJxNiFQhYnIAk1fBCgB+RNVYlKCT3k+lXIu
 +EpxnfkGEsjvvjGqWxYpFJ/pP+8CWFInkgB46HJwJJ07+SKaRIvtFYprI0dLFmAZWps5baD7LPy
 IZYQ3tEXcJDKfZNSwrgi+C4eyPDoygphtwE5
X-Google-Smtp-Source: AGHT+IGLqNfuo6dVnZwB0IG9CYkUL75QpM9W/HERVzyQaVYoG4TeHcNOZSSbW2843k7yE5uyrSEtJA==
X-Received: by 2002:a05:6512:3e0c:b0:540:1fec:f331 with SMTP id
 2adb3069b0e04-541315ac7a5mr947299e87.27.1734438711130; 
 Tue, 17 Dec 2024 04:31:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120b9f3d0sm1145293e87.30.2024.12.17.04.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 04:31:49 -0800 (PST)
Date: Tue, 17 Dec 2024 14:31:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
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
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 03/10] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <buem3nnscnyh7latovvnsbhp2ci6pbjpckfmrft2267afzwdwq@2roahluiow7t>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-3-50dc145a9c06@linaro.org>
 <20241216-heretic-mackerel-of-wholeness-fcfed7@houat>
 <exocd3b65cy6cy5w47cwx3ykn54ncf34hwyj7ffihs5jjzean5@y677uywnlah2>
 <20241217-heretic-hopeful-jaguar-aeabec@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-heretic-hopeful-jaguar-aeabec@houat>
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

On Tue, Dec 17, 2024 at 08:43:10AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Dec 16, 2024 at 07:47:32PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Dec 16, 2024 at 06:04:41PM +0100, Maxime Ripard wrote:
> > > > +struct drm_connector_hdmi_codec_funcs {
> > > > +	/**
> > > > +	 * @audio_startup:
> > > > +	 *
> > > > +	 * Called when ASoC starts an audio stream setup. The
> > > > +	 * @hdmi_audio_startup is optional.
> > > > +	 *
> > > > +	 * Returns:
> > > > +	 * 0 on success, a negative error code otherwise
> > > > +	 */
> > > > +	int (*audio_startup)(struct drm_connector *connector);
> > > > +
> > > > +	/**
> > > > +	 * @prepare:
> > > > +	 * Configures HDMI-encoder for audio stream. Can be called
> > > > +	 * multiple times for each setup. Mandatory.
> > > > +	 *
> > > > +	 * Returns:
> > > > +	 * 0 on success, a negative error code otherwise
> > > > +	 */
> > > > +	int (*prepare)(struct drm_connector *connector,
> > > > +		       struct hdmi_codec_daifmt *fmt,
> > > > +		       struct hdmi_codec_params *hparms);
> > > 
> > > Missing newline
> > > 
> > > > +	/**
> > > > +	 * @audio_shutdown:
> > > > +	 *
> > > > +	 * Shut down the audio stream. Mandatory.
> > > > +	 *
> > > > +	 * Returns:
> > > > +	 * 0 on success, a negative error code otherwise
> > > > +	 */
> > > > +	void (*audio_shutdown)(struct drm_connector *connector);
> > > 
> > > And thus we can probably just call that one shutdown?
> > 
> > It should be called automatically by the sound system. I'd rather not
> > call items directly that we are not supposed to call.
> 
> I meant that with my suggestion to call the function
> drm_connector_hdmi_audio_init, that structure would be called
> drm_connector_hdmi_audio_funcs, and thus the audio prefix in
> audio_shutdown is redundant.

I see. I posted the next iteration already, but I'll try to remember
this change for the next iteration.

-- 
With best wishes
Dmitry
