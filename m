Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E367E933E12
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 15:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011A610E1B4;
	Wed, 17 Jul 2024 13:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EsuHxOIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3F410E0EF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 13:57:31 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ebe3fb5d4dso8604501fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721224650; x=1721829450; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mHJbV+bzx4RI8mDOQI+N5X7vHq/DAFW5fyNCzOVzMjI=;
 b=EsuHxOIHOl3bmAbc2wORAjAxqQEUxQO9aBbJTnDnAhxCi+mqGPOOw73VyJH+rX13uE
 oJ7oFUB3QV8EOpapAkwAScMhQKAPTqkdzy4msIc1k23EXVrxHwpQ7fWxtVqmAwJGICcr
 b1IyFQQegsYI9T8NSf/beIh50gLUJVS7Il48sTjAanghYNEGxKXvwcUB5x3DMCFFDmhy
 fKA6L4oTgcxOByYne+xYpLhYEQj30eYkIXDiLvnU2znlZiV91+jeGcTbhThOjjrEie7i
 aHIvOoCH9A1PuQ5+Ztw/DKzyaPKVwZqe4z19HWHjfccB6+5dfLNC1JHuORREjFsSdQeu
 amiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721224650; x=1721829450;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mHJbV+bzx4RI8mDOQI+N5X7vHq/DAFW5fyNCzOVzMjI=;
 b=NcC/QH6wbNBpYT1ftRiDD+mtmj/vAW1xl/e4KIUtz91ny4T+v6mdsp70ohJMmevZNT
 0sY0UyJaBYGOi/qsTcJ9rAsJjbPJPlbW10fLvwjIB5YeUT2oNB66xN/RpqjZ7J73PzHZ
 Llma8dTubQjjRxyoHQFbXQdcSNhuIL1DVxdwqa61W60HehKJebeqnKqR/Dfu3nCMc+FD
 8duXGSukI9ERVVUFaxiBsxe4VbU48ZQemmHbFZp6gmbUS6Kdd2HGtFICFmSCK5i50lTe
 /xJ7s1dlw32GoOpYLCKs/SrrPwK0i7o4Ka1O6DtbvLjDaCs+0ebNdp232dJ+ieOEiwVQ
 LJyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX99orapVmI6gb1pcSMbQ4zvpmue6T8Dy7DxPWiy6RP0u72TnK2t3WXxx+/L86Ou/gvpS9bwi3ghOL2koa67V2M2HCoNoiz4+/omVItIGgz
X-Gm-Message-State: AOJu0YzgDb3cmWfwqLHPPl8qDy3SuWydMna0numWO5HapuVGDe1emPGM
 g37xEqTv9/fwQJx8a5MBQQDfU7k3D3ascwr5R+v9eukg8Xh3FrKIdte2t2U96rQ=
X-Google-Smtp-Source: AGHT+IG7iDrtCuBBKWvQaoQQbv/0kaeeUtziuz9N7l7vX5y+JvpROqU3u5NL1wFj8j7PpznoM4x7Ww==
X-Received: by 2002:a05:651c:2213:b0:2ec:1df4:589b with SMTP id
 38308e7fff4ca-2eefcd61dd7mr7308201fa.1.1721224648985; 
 Wed, 17 Jul 2024 06:57:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2eee19148adsm14501371fa.100.2024.07.17.06.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 06:57:28 -0700 (PDT)
Date: Wed, 17 Jul 2024 16:57:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/5] drm/drm_property: require DRM_MODE_PROP_IMMUTABLE
 for single-value props
Message-ID: <gbcunf7zmafn5z76mrlgldmsy74s7e6jacv53mgpym2l75uq6h@talxrisbufsw>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
 <20240715-drm-bridge-connector-fix-hdmi-reset-v4-2-61e6417cfd99@linaro.org>
 <20240717-bouncy-horned-mamba-5691b8@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717-bouncy-horned-mamba-5691b8@houat>
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

On Wed, Jul 17, 2024 at 03:42:46PM GMT, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jul 15, 2024 at 09:33:02AM GMT, Dmitry Baryshkov wrote:
> > Document that DRM_MODE_PROP_IMMUTABLE must be set for the properties
> > that are immutable by definition - e.g. ranges with min == max or enums
> > with a single value. This matches the behaviour of the IGT tests, see
> > kms_properties.c / validate_range_prop(), validate_enum_prop(),
> > validate_bitmask_prop().
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> We had a discussion yesterday about it on IRC with Sima, Simon and
> Xaver.
> 
> https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622;
> 
> The conclusion was that it would create an inconsistency between drivers
> on whether a given property is immutable or not, which will lead to more
> troubles for userspace.
> 
> It's not clear why Ville added that check in the first place, so the
> best course of action is to remove the IGT test and get the discussion
> started there.

Ack, I'll work on removing those tests later today.

-- 
With best wishes
Dmitry
