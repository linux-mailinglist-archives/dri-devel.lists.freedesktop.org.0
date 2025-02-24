Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B332A42148
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CD310E47A;
	Mon, 24 Feb 2025 13:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="swEjHk0l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1698E10E10B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 03:15:28 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30a28bf1baaso35017381fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 19:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740366926; x=1740971726; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=60oW0NE+5WvAkx2Mu3B4WEX9+Sk/VuCzxW52FoixHDs=;
 b=swEjHk0lGOWyIJQI7ZMHmW1ule090Z0U3H7Bv2fvbKcZlJ8yhC8vVxGAswYtGuDzda
 KkmAQsHxodQErU6rI8Z1gWw+IlFwVHoQ9re/6kjInhB+YmBVKi77IqwKZXPA+/KjKSjO
 TzBQwUf4ygFFRELWm66kayUZbZQ3/UsjfJQXkPJHMCf2vU3KHAS2JFUcFRDHO8gfZcyE
 wzEdSe6Et05ZHHV7V+lEnRzydvhPm5e1SR98yOHYPwh1BvBzHtQ/08ssZ1uah8tJok2H
 gnpSzoQpKARt+9OUQK6bKYV2d7D+gkB2P9iPy1DokEfMYo7WzhGPMcM2xPdu12QZmBnD
 fmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740366926; x=1740971726;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60oW0NE+5WvAkx2Mu3B4WEX9+Sk/VuCzxW52FoixHDs=;
 b=ZtSsxonG4uHHZs84kDbFICtsKAbQ71BdhQ5pW9MLFmjIJ0YjuXEbnLIt4SMXvY/SM1
 S70Ds02GAIc+3ZA45ynCBVDuFzMWxyF3IWxD0TMqLXw20rj3fcsTnbVkoi0d9v2+bAIa
 4i9b++0K18JCCvIJAdtnvGOtKSdJ9wrCPpzhDXY2gbIE+UNQlHIJDPvVyvqakFfPxHS8
 HWkec7ZQaYYt7usYFgSoiVHz9diPm10iKB9IZ5fKvI//S4HSzl2BbmkxUo5bJOYmj+M9
 JZhfJxyItXvnwjIIM2BMpcvByTi9qeoYA0mSWfhgIW1BMS6fsrgpPujLTuk8GSysZ3QS
 YybA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLkiTTToht+KJgD+btxsQ7s0+H23KCxX342JdCkq0sB0dkrPwbbWSQ7T7qpXrJHdYkWqj9u67oOMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6602xvW2YvmwhAGyfL76+3qeFrsrP7iXgNRNwJJq+oFGyaIjI
 ni0+70B5alzr3aL3wpW+esa07XYu2ozjZ9AUHK4J+FYntd2T81bV3WToGjppsBY=
X-Gm-Gg: ASbGncuXvuYpOZxnA6y2eCIITSP8/sEhWDss5VUdeMLi+s9Q8S2VlnixyjkJqdP7LmF
 jX7xb4eSjA63Tk6t+VaGnNfdKbRBVHLhnY91ZQ/Uus8MLrkHRTl6N1h7DYCbv54gQrrDaXJGjGB
 KjrWGQkpqtgxWGVZAgdtDQpckyHJ+fFWdg/JWjCh9VnpepK3svimnaplzp1D4p5QKuTFuiTm3SR
 ZrqfrOTxb1qLr3yed+R+K9DcP2ZAJGw9gcbdeVgTHhqGoM8CHi1e1plVUT5STCkflmGg2Le63LE
 6OGnXpKoev38Bj2K74gUNrzvNl0lffjpCAuAaM1E9HFnPaeWg9kqHquUEZ7uOw4TDAUqp7eHolv
 6B1nPEg==
X-Google-Smtp-Source: AGHT+IHhiKmfrH5ka4uDKdUNP+Kqb6vQhRfA/nDzn2mvuW92iiRvCMWFslhv/a7ivXaSSdw6dmkihQ==
X-Received: by 2002:a2e:9f06:0:b0:308:eabd:297f with SMTP id
 38308e7fff4ca-30a5b182b9cmr32215911fa.14.1740366926080; 
 Sun, 23 Feb 2025 19:15:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a23dddef9sm28895541fa.37.2025.02.23.19.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 19:15:24 -0800 (PST)
Date: Mon, 24 Feb 2025 05:15:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 kernel-list@raspberrypi.com, linux-sound@vger.kernel.org, 
 David Turner <david.turner@raspberrypi.com>
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Add jack detection to HDMI audio driver
Message-ID: <3jyp24gystyet326exnbudsprwlpswacmcnvllumgapxlzz7n3@toysyujvsqwq>
References: <20250222102921.75496-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222102921.75496-1-wahrenst@gmx.net>
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

On Sat, Feb 22, 2025 at 11:29:21AM +0100, Stefan Wahren wrote:
> From: David Turner <david.turner@raspberrypi.com>
> 
> Add ALSA jack detection to the vc4-hdmi audio driver so userspace knows
> when to add/remove HDMI audio devices.
> 
> Signed-off-by: David Turner <david.turner@raspberrypi.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 26 ++++++++++++++++++++++++--
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
>  2 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 47d9ada98430..d24ae86d799e 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -51,6 +51,7 @@
>  #include <linux/reset.h>
>  #include <sound/dmaengine_pcm.h>
>  #include <sound/hdmi-codec.h>
> +#include <sound/jack.h>
>  #include <sound/pcm_drm_eld.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -386,6 +387,12 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
>  	struct drm_connector *connector = &vc4_hdmi->connector;
>  	int ret;
> 
> +	/*
> +	 * Needs to be called for both connects and disconnects for HDMI
> +	 * audio hotplug to work correctly.
> +	 */
> +	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> +
>  	/*
>  	 * NOTE: This function should really be called with vc4_hdmi->mutex
>  	 * held, but doing so results in reentrancy issues since
> @@ -405,8 +412,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
>  		return;
>  	}
> 
> -	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> -
>  	cec_s_phys_addr(vc4_hdmi->cec_adap,
>  			connector->display_info.source_physical_address, false);
> 
> @@ -2203,6 +2208,22 @@ static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs = {
>  	.shutdown = vc4_hdmi_audio_shutdown,
>  };
> 
> +static int vc4_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct vc4_hdmi *vc4_hdmi = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
> +	int ret;
> +
> +	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
> +				    &vc4_hdmi->hdmi_jack);
> +	if (ret) {
> +		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return snd_soc_component_set_jack(component, &vc4_hdmi->hdmi_jack, NULL);

PLease excuse my ignorance, but dows this work. In other words, how is
the driver exporting the plugged state through this jack?


> +}
> +
>  static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
>  {
>  	const struct vc4_hdmi_register *mai_data =
> @@ -2316,6 +2337,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
>  	dai_link->cpus->dai_name = dev_name(dev);
>  	dai_link->codecs->name = dev_name(&vc4_hdmi->connector.hdmi_audio.codec_pdev->dev);
>  	dai_link->platforms->name = dev_name(dev);
> +	dai_link->init = vc4_hdmi_codec_init;
> 
>  	card->dai_link = dai_link;
>  	card->num_links = 1;
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index e3d989ca302b..a31157c99bee 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -4,6 +4,7 @@
>  #include <drm/drm_connector.h>
>  #include <media/cec.h>
>  #include <sound/dmaengine_pcm.h>
> +#include <sound/hdmi-codec.h>
>  #include <sound/soc.h>
> 
>  #include "vc4_drv.h"
> @@ -211,6 +212,12 @@ struct vc4_hdmi {
>  	 * KMS hooks. Protected by @mutex.
>  	 */
>  	enum hdmi_colorspace output_format;
> +
> +	/**
> +	 * @hdmi_jack: Represents the connection state of the HDMI plug, for
> +	 * ALSA jack detection.
> +	 */
> +	struct snd_soc_jack hdmi_jack;
>  };
> 
>  #define connector_to_vc4_hdmi(_connector)				\
> --
> 2.34.1
> 

-- 
With best wishes
Dmitry
