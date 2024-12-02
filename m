Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEFE9E05BE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC4210E77A;
	Mon,  2 Dec 2024 14:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YpxYFMj6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE8E10E77A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 14:59:11 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53dd2fdcebcso4923071e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 06:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733151549; x=1733756349; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Rju8sEpE6sdROgx04VbEZEe0Z4Dqml8d9fp2hAHZz1Q=;
 b=YpxYFMj6iylklz/89cibRzC/9t/f2gMHeiQWcoEY1WGcNihtqVU8a2r0EnZ7jnekVJ
 Nt2QBmMlvTfAqzFe0odxBG5zYpf1Pbcg6i88HdzaSKxZp7A3Drbq3Tq3pHRc++rvak3i
 fyxK6vNhrkEPBY7IpqbjD4bTNQbAdOUrw24uAbprweIF6/Pp5D4GV8bGHAxJ8yxZ1+t8
 jF0FSwbnbFX5VrorWh4DXTeF2OfJr36DRP0QfkDSuSu8WNrfts2p/b19ygGmh4E7qxaE
 Q0MsnEs6UOtWHl7yg4cysZWzU0/cBF7mcPrqp3Bu/gSoJAPzX7pml7y1FA2WVWrNvr2y
 wyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733151549; x=1733756349;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rju8sEpE6sdROgx04VbEZEe0Z4Dqml8d9fp2hAHZz1Q=;
 b=JrRAuLN5zJM8bUzPg7Jupv26mftlLdT59kETTcGYL0mL92aAclRBfRjjtFx1Mt4MGl
 yJYwxSCxYApQQYEWKaf4p0of0VlnkJxiVarguGB4Z3/ALNFdQ/nnm+QUn2VrK5MOUd25
 HZ1NCWzBymopckfxTKicy981PpHkYJ29xQxBg/J7jDnUyM20q6TwZa1pi8bWdbo1XgWj
 FnidPwbtgdY/bd81YQfIbuswOxV0Dv3vUiqOrx1PTbTYm1kcd2U/QrzNusKmskzeb88n
 dibMRs9kEpEJLm52mEBS2eh9swuYfJ89Pda0OiMhUMSVrJbYbb1NBsVPDZQv/tdmOUtQ
 31XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO/sANN6ZcgaK4WgdTbf6HdtG/Qll5tjqaOBFpWLmzzGP54wRDY9yOum9Qc0GL4CBybROnxWWhm4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5m+peXephrgLQoiTuu4/E6Zkl7f5vaLTslYaFMSj2wgKpk/mp
 hcpUcC3zL3vRQLgJmuM5QK8LzVT2kNfm9aHUYZM1Qb5kfV+0B1nTEUh9ebCH8+s=
X-Gm-Gg: ASbGncupomQryxxsNb99EHNRX26URaZKsP4Pc1z5G/B+zTL5KdIXfuYD1DoggN4aIDl
 Y/wk6YrblqIz6QFB208BpGx5k7Qoz14EWwpsWqNqdTuZMXycnUfwpxyKl6pLUWvXiQ8/swmMX7A
 3phaQkzNS6DnyUbnd/Iouxlk5SqUGDpueso4J/emg+94ErEMN8pgABKXGwLwqSg6mmnmuUs433K
 2nn9uZ94o7bwrnfugWUVT0l24/keLBvlDPhTkO/LcoheQdi9tMS2REdaaXuPxSm5nSs0EQXxNcO
 09oywwDO234ynA0EayYprZ90EpUKuw==
X-Google-Smtp-Source: AGHT+IFqUZg6UxbmPBpmmNDChC/PhM5ksog1SlPE5I3zx5OIy0xNoMEVpgKx1uItUxOnsjp3icE8UQ==
X-Received: by 2002:a05:6512:b26:b0:53d:edba:d40b with SMTP id
 2adb3069b0e04-53df00dc8d7mr12039335e87.33.1733151549347; 
 Mon, 02 Dec 2024 06:59:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f2c3sm1480384e87.126.2024.12.02.06.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 06:59:07 -0800 (PST)
Date: Mon, 2 Dec 2024 16:59:06 +0200
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
Subject: Re: [PATCH v5 2/9] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
Message-ID: <onq2djvtvxvr3a52s6sin3dstwdctyyz2lxpx47lk7ndxtza33@odldgvhryw4d>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-2-b5316e82f61a@linaro.org>
 <20241202-bald-just-guan-c5d41b@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-bald-just-guan-c5d41b@houat>
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

On Mon, Dec 02, 2024 at 01:06:09PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Sun, Dec 01, 2024 at 02:44:06AM +0200, Dmitry Baryshkov wrote:
> > The no_capture_mute flag might differ from platform to platform,
> > especially in the case of the wrapping implementations, like the
> > upcoming DRM HDMI Codec framework. Move the flag next to all other flags
> > in struct hdmi_codec_pdata.
> > 
> > Acked-by: Mark Brown <broonie@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I appreciate it might be a dumb question, but I never really understood
> what no_capture_mute was all about. And in that context, why some
> drivers would need / use it, and some won't.

Some platforms can not mute the HDMI capture (ARC?) path. See the
following patches:
- https://lore.kernel.org/all/1606372608-2329-1-git-send-email-shengjiu.wang@nxp.com/
- https://lore.kernel.org/all/1606372608-2329-1-git-send-email-shengjiu.wang@nxp.com/

Russell added a way to disable capture / playback support, but only TDA
driver uses those. I think generally we should change those flags to be
opt-in for capture, but that requires carefully reviewing all the
platforms (and is a separate topic anyway).

-- 
With best wishes
Dmitry
