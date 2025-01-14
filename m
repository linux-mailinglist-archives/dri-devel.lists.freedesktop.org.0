Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F82A0FE43
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 02:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2419E10E827;
	Tue, 14 Jan 2025 01:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TLCysGkb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EDA10E827
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 01:46:26 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e3c8ae3a3b2so6920724276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736819126; x=1737423926; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N+8EgI35uv9hF/0OPf+vuhBaBLFzRkr/a46A2Dy1sAk=;
 b=TLCysGkbvHouDCdV7jKaRi4LKZ+Zpk3xsAZ9XJAwV5YXErAA46xr8/8UAZbHJuU2z/
 y9Amu5jaOUhrK38W9uldB5DESZVsDF0z9bb2ROBwsKGIorAeJEPkB8oeW6G/FVD1jbV/
 E6KdONUl243PaC62OUmdiiFR7TqeSMccQAaQs0f2AwCCGDswFQgR3J4W0Yp/PkfROiqZ
 +AisFRmvxeBog+Vreu8kEV1Qnk1wb/adowHLP2/7tk+tvNRTgBBwP4rUoPxFZVGWCWnW
 6GQr7K7JZxYW6xM/kpQG+Q1Jqijl5B48XG7UHN2+wwC/SU5juteQvKNRsboQFuJ8jPqh
 FANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736819126; x=1737423926;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N+8EgI35uv9hF/0OPf+vuhBaBLFzRkr/a46A2Dy1sAk=;
 b=jY6bjwxcy3qjRD2ghobI94+sFHtPx95M09sA7k5gf8lupWhGBaW2QDPE8tB/Kdrr+O
 X0dbnzeTzZJIA2Jco2AIJ0V+WfMiNXMxPCo3HnyBrrXVl+9uId2bR33g2dUHP7w5f7e3
 8rXXBBVjeSSHxiDUym2ONLRLu3FFbwd3Tg7V80g6+idpbYdUoW0LjQWREXv7XjUy5TwZ
 saldB40R/UvvO7DvvTCxIJu3EytWgqqLZ0CHRute/Cou5xzubOlwshu2Jtcq/taUAIvI
 e1fmORsPuqY8JZ+b3lBidKoBc9Mlt3mTU9fwr169MrRNvprH7ZwbpFS+Mr9rsob68XEp
 6Zxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoYzEKonjfVyZbEuKb8W0rUZe/FLINYG6KU5cuSa5fj7gI0FhUGq2PuuSNDVAgPBh45fMx5104xo4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yztrfo3vQ02/LsC3I+knlflBVKpUrE3nLpnXxtBdKP83tIGlv9C
 r6VR1ipdfWjhrzqN3MEaqMOcWiGAG5tn4C8VWfsoiJ2GMY+oWZDqNnYcg+q7sWaWYb2oKbw9ueK
 0OmiJV3LFjv6GXWW5mOS41gM0hpojbgIxUQSx5Q==
X-Gm-Gg: ASbGncurW0BTUkpcd+AHMZb3Bvl/XqG/JiF8EPKjnv2ybE1z3jVjqan2qd7+pqVRPZv
 lBTgSSE4MPpz593lyFMAlvEXGsX9BZbwux520Z4uC8f/I6sVFTOyE+U6DEnpPDIN6tr8qAg==
X-Google-Smtp-Source: AGHT+IFw+8EJH3+sYLytBcSM829UVF01V8OV1UAI+CzwsaCh0PJQpMGC1iXxd5V1WhnvSyXdw+9iFPxRIV5QmN5E1YE=
X-Received: by 2002:a25:2055:0:b0:e39:8482:5d5f with SMTP id
 3f1490d57ef6-e54ee2026femr12527255276.46.1736819125705; Mon, 13 Jan 2025
 17:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
 <173680655387.149204.17517246537828613856.b4-ty@kernel.org>
In-Reply-To: <173680655387.149204.17517246537828613856.b4-ty@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Jan 2025 03:45:15 +0200
X-Gm-Features: AbW1kvZk-xrGSPiMdguMFD_hc9SYyHKa4i2bZt-kcCNVjxqbFCr5K6kr1tPBECs
Message-ID: <CAA8EJprDaOTEOYf5JHC7UYwqRn2vXUH9FT==HjZg1QNfDMmBcA@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 00/10] drm: add DRM HDMI Codec framework
To: Mark Brown <broonie@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Russell King <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
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

On Tue, 14 Jan 2025 at 00:16, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, 24 Dec 2024 03:47:52 +0200, Dmitry Baryshkov wrote:
> > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > there was no simple way to get the drm_connector that stayed at the end
> > of the bridge chain. At the same point the drm_hdmi_connector functions
> > expected to get drm_connector instance.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [01/10] ASoC: hdmi-codec: pass data to get_dai_id too
>         commit: a8e792d3f0bbecb87ab05e9592cadf0b178ab952
> [02/10] ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
>         commit: 5b0779ae13de345b405a67c71cbb63705cadb295

Mark, they had your Acks, so they were picked into drm-misc-next.
Would that be a problem?

>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>


-- 
With best wishes
Dmitry
