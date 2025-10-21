Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9942BF5237
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F401510E2D6;
	Tue, 21 Oct 2025 08:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Gg+R8CFC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CDF10E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:03:41 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so892001266b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 01:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761033820; x=1761638620; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1eZOCk0G+WIeYYVlPWpiKCZVOUjneoPQzsl6dTiB4tA=;
 b=Gg+R8CFCOlYSKd2DitS40RGIjj7Cv4lQZ0g53tLjZI93UHdfQPMDgo8gybkHI/cQWE
 kzDte5DGFfkWEOEK3TF/EtlIGXtoJb0ArlaqtpOOX+NfxKj85bl4upqO5nwNgYd18F00
 sdz/5PvWgjG5bnPoY1KIia0H2Sys+/aQfunkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761033820; x=1761638620;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1eZOCk0G+WIeYYVlPWpiKCZVOUjneoPQzsl6dTiB4tA=;
 b=ZGknjMFootx5cWmojsQrTkI6Tmkuv1s44vt8Btom0M8/muA8obic34miVpV7gUi37P
 mOOprNdJPQoIgMu6kPYOvp/NFxD7sC2Kf2GKlSkgIjE0rzOmNKKSu408IfT5+kIUYQA0
 llPKu4llejib7EnxVc20irF97xRGFxvgsG13tHhxuqK3U1J6LC2dI9mOPfCSiMcvz594
 leYPvTtij99pPokRdq2yFjtRSWnp4957rMQwDurbekwncYmhpxw/8gn4+H4HI1p8kPit
 wYIln08AmcWVSSWtQbPNgtg8yBxSPonVBFnE4meEeT5WUF3pig7rWecfl0w16iR2XBNe
 Dz0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOi6+wyA7HXyJel/3OPpMjH5FnXL4S63nYL0YqLICK2aZBtOyzVNN5/OBwSmumqartvuTyYc6d92k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJkzARqGrZfdiwHo6XRUPqZIuOiTw0RqiFZ+TAFoF/AFyDYFDB
 1ELj01CDKob9CuwbNQp/3v64GvqKGHAXqqV/uZq5INNIsIKfnEgtpde0JvEHk5a3hPE=
X-Gm-Gg: ASbGncvijmF3b8IIBBz6VRbNEphrS2tdrpaWVybEduhGyxHmH0GFGf+JuTUB11e8Hjz
 gl4/FDsrosSbrqKi6Zt4ccfMthzGncgRd6UGBWHmQGKLygb6Q9GNI79B1xYc3ueMHOJzaFqN0ZP
 xVAjP/7EAnElARz39smjCGhwuwfE75y+vc6o++WEfHFLnaymj8bz8N/RULAPylOHj3vWQAT4Uks
 SH2jNAtOcDn2ax185drYJl/M3ndssKPzQLriYl3TMI2nojAxFJNNdl6MV9eVr3DFTJPRAG89f8D
 sJenkSRUn1ZaduEsse4QTwy2DzSdiJa+6Q/GTpWaaQmUUW2QkPedy6iLVNSM7H0oMqhAAN/rDpj
 p8nwdg9QTUB2U0lfh1F85P7YqiKo2vUL5Z94UluMHANhnppFlmr1wJeAP0/8LyWwtuV+F98fsjQ
 D7OgwFdmNej0w=
X-Google-Smtp-Source: AGHT+IEbmSLB+yRFZ86qxeD7wG4TxM9uG6ayZpPpFTz88clAHcJph5RIG47VQ/I34aUFg3RPcxflIg==
X-Received: by 2002:a17:906:fe41:b0:b04:aadd:b8d7 with SMTP id
 a640c23a62f3a-b6471d48347mr1967108166b.13.1761033819926; 
 Tue, 21 Oct 2025 01:03:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e8581780sm992513566b.31.2025.10.21.01.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 01:03:39 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:03:37 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 2/7] ALSA: Add definitions for the bits in IEC958
 subframe
Message-ID: <aPc-Wad85lQWbqfa@phenom.ffwll.local>
Mail-Followup-To: Shengjiu Wang <shengjiu.wang@nxp.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-3-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923053001.2678596-3-shengjiu.wang@nxp.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Tue, Sep 23, 2025 at 01:29:56PM +0800, Shengjiu Wang wrote:
> The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
> in HDMI and DisplayPort to describe the audio stream, but hardware device
> may need to reorder the IEC958 bits for internal transmission, so need
> these standard bits definitions for IEC958 subframe format.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Would be good to get a formal ack from alsa maintainers before merging
through drm, just to be sure.

Thanks, Sima

> ---
>  include/sound/asoundef.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> index 09b2c3dffb30..c4a929d4fd51 100644
> --- a/include/sound/asoundef.h
> +++ b/include/sound/asoundef.h
> @@ -12,6 +12,15 @@
>   *        Digital audio interface					    *
>   *                                                                          *
>   ****************************************************************************/
> +/* IEC958 subframe format */
> +#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xfU)
> +#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xfU << 4)
> +#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffffU << 4)
> +#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffffU << 8)
> +#define IEC958_SUBFRAME_VALIDITY	(0x1U << 28)
> +#define IEC958_SUBFRAME_USER_DATA	(0x1U << 29)
> +#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1U << 30)
> +#define IEC958_SUBFRAME_PARITY		(0x1U << 31)
>  
>  /* AES/IEC958 channel status bits */
>  #define IEC958_AES0_PROFESSIONAL	(1<<0)	/* 0 = consumer, 1 = professional */
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
