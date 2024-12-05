Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302699E55E6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 13:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A204010E16F;
	Thu,  5 Dec 2024 12:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kejQ0OWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAD910E16F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 12:57:01 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53de771c5ebso895165e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 04:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733403419; x=1734008219; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=s2Jxa49+lF4JxHiGnW6UzqLVnsE/QayBWcQoJh8S91E=;
 b=kejQ0OWIF09Xw+MnwvdI6yV0OzvwDXArI+W9Oo7j3Gn31ds/DgBjHltp39i6dABZre
 mEgYUMQGpkbJigMWBfzgKd8JVd3UGQg5v2VvO1bR25KbIepK3b2TloP6CA+zgI1qu4AW
 I3bVuCPoZwQxlDXHBW6Fu0T0s4jALscWailvwclI4SnXbcTfJ7R9sL4rguIFCskpBOq4
 DIUra0deZd76+10N58k9KnNBsTzfNtUwgZpdaqEv1lH5ssV/nXKN52EojpHsADk6pGEe
 KiWX+3rzPdbniwz8Rrla8mOz9HjEVBDR4SCc7jcWuNYklSr8lD7N3VtzIs+66swdYh9O
 g5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733403419; x=1734008219;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s2Jxa49+lF4JxHiGnW6UzqLVnsE/QayBWcQoJh8S91E=;
 b=naowWBXNjAWR6fteOMwB31ffw2XL5YBy6l0Xo+/heXgJAppPpsdNqYfBj0A7Intoo6
 ROe7+/T2HiedIgrsPj/JvNukTLVycDkcjPBnLT7l0TvTF229F/TjcFLXOjvEZU6HUQ+U
 Nrrvu/wFtozCWZRdFaRtpJEGYt2oeUZ6SNJV8yKH8jwZER4g5iNsL64X1ZgORxGcykFs
 HVMosQSP7dka5uWYdxzsX3Lo/9klu+Ws6lkVj4Kpd0t4FxAMm9QgZ1VByAbqgDiq/ZL2
 h//2CEP6+5To4sJkRsydoj0KCgdEu6Fi1u7s8wURE1eBqBCHnS9XXkQPzjFZEMYtWTzo
 gxKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXu8d761nR7gdNNmq9RW+8Pk8TMpVTJTQbzbGfdHD+x06EJU9QQIJqEKnKZvdRuZ8uihmT7NnHHsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoaWo5xcHyV7wlG5SJsSX+xlrt9TBf1PViN1LlsGxSuSqiY/5d
 /4x83Kkgy2KTFfc+uL1c1/VhnLDXaFwL71rjK+ESiewsHy4HlRX+6cAC4xPyYi0=
X-Gm-Gg: ASbGncu1RylnGy/SvGsnDK2k1QWRT10wQfYNzNUCg2J5sM9jKCm9vxdA9EJyroMAb8a
 hn7s+o+YQCVrY0SFIM7Q35EDWtL8Ll0jqHS/WvEmBu+ZA0am61594DDx1Uoukpsdjt+W09vI/E+
 5BzvhO+zUS0zyS+liHFexSWh9UVdrJTka6g0CJB0mc3H9g1EV0QyBPVDka64cTviUA93Bzy6PAa
 U3xja+uMJvrfdRt29LgIpGx+kC1anMTwRkd3ux/5h7ZO7kxetLpaFkhhZD22d6gpbbR42+mLwSk
 JWji2XufoSJQJUC9XRElG3SbREXQ0A==
X-Google-Smtp-Source: AGHT+IFxozV5yADLSZdT2aZmMAmC3YLc8oyR/mmxvGNOEAUjKfoe1x86CuOyh23J/0TyZbHiXn/ilw==
X-Received: by 2002:ac2:51d3:0:b0:53e:1c3d:d0c5 with SMTP id
 2adb3069b0e04-53e1c3dd10cmr3218316e87.28.1733403419364; 
 Thu, 05 Dec 2024 04:56:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229751fcsm237413e87.87.2024.12.05.04.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 04:56:58 -0800 (PST)
Date: Thu, 5 Dec 2024 14:56:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, 
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Message-ID: <uhcl2ypz3xmari73xl3l4klu2ucfkfkuj7bt3dz35hfmuzvvkj@5odvmmhivl54>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
 <olxtqto5mbgofxg4iqjvsmpxxzz6zoj7pbwmoeklhfjiavqfvv@dyveek7hgtki>
 <f2862790-f613-4583-bec5-302e06c77d8d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2862790-f613-4583-bec5-302e06c77d8d@collabora.com>
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

On Thu, Dec 05, 2024 at 01:36:18PM +0100, AngeloGioacchino Del Regno wrote:
> Il 05/12/24 13:29, Dmitry Baryshkov ha scritto:
> > On Thu, Dec 05, 2024 at 12:45:14PM +0100, AngeloGioacchino Del Regno wrote:
> > > In preparation for adding a new driver for the HDMI TX v2 IP,
> > > split out the functions that will be common between the already
> > > present mtk_hdmi (v1) driver and the new one.
> > > 
> > > Since the probe flow for both drivers is 90% similar, add a common
> > > probe function that will be called from each driver's .probe()
> > > callback, avoiding lots of code duplication.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/gpu/drm/mediatek/Kconfig           |  11 +-
> > >   drivers/gpu/drm/mediatek/Makefile          |   1 +
> > >   drivers/gpu/drm/mediatek/mtk_hdmi.c        | 724 +++------------------
> > >   drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 425 ++++++++++++
> > >   drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 203 ++++++
> > >   5 files changed, 729 insertions(+), 635 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > >   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> > > 
> > > @@ -1026,19 +812,12 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
> > >   	return 0;
> > >   }
> > > -static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
> > > +static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz_spd,
> > > +				    u8 *buffer_avi, size_t bufsz_avi,
> > > +				    struct drm_display_mode *mode)
> > >   {
> > > -	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
> > > -
> > > -	hdmi->csp = HDMI_COLORSPACE_RGB;
> > > -	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
> > > -	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
> > > -	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
> > > -	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
> > > -	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
> > > -	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
> > > -
> > > -	return 0;
> > > +	mtk_hdmi_setup_avi_infoframe(hdmi, buffer_avi, bufsz_avi, mode);
> > > +	mtk_hdmi_setup_spd_infoframe(hdmi, buffer_spd, bufsz_spd, "mediatek", "On-chip HDMI");
> > 
> > Please use the HDMI Connector framework instead of handling everything
> > on your own.
> > 
> 
> Dmitry, my plan is to get the MediaTek HDMIv2 driver upstreamed *with* using
> the HDMI helpers - this commit is only splitting the old HDMI v1 driver in
> common parts and v1 handling.
> 
> This "handling everything on my own" is something that was already present
> into the old v1 driver, I am *not adding* this code, but *moving it around*.
> 
> I cannot migrate the v1 driver to the HDMI helpers right now because in this
> moment I have no way to test that and I don't want to break any functionality.
> 
> If you check patch 15, you'll see that I am indeed using all of the helper
> goodies - but for now only on the new driver, and not on the old one.
> 
> I do plan to migrate the v1 driver to the new helpers as well, but I would
> (please) really prefer to do that only after the v2 driver is upstreamed.
> 
> Is that okay for you?

Yes, I've sent this comment before seeing the last patches.

> 
> Cheers,
> Angelo
> 
> > >   }
> > >   static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
> > 
> 
> 
> 

-- 
With best wishes
Dmitry
