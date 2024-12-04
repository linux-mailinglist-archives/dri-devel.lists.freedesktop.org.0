Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372C09E4882
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 00:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A508F10E359;
	Wed,  4 Dec 2024 23:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rA5qoLMK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E8D10E359
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 23:17:45 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53e0844ee50so355578e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 15:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733354264; x=1733959064; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R+qyWMAaxSXjS/GuoQtdsJ9zo8e90abOj5J8SrRL65M=;
 b=rA5qoLMKQH8z1velee5QOMKd1VFfwCWRpvDmg11NvorDPDRZ/9L3Az/o3PfiySRQLt
 wuSXnyyXYHFSmEDVgE+GPy8veIEnEprexfjv/Ka0R9WD40dse8mNK58clAiWFqKvFqnY
 TTT2yLGVruu5FaUUd3koM9x2CWIkNTpti4WBf1DHSHsKbcpeHiZij/FeLU/8t3ADduKu
 OaRSAK3cPo2hwHVgZaD21HP9bnO5zkDq90J8Iaft3JiCQbAs168olptl6irkGnustc4K
 GyvorEha2Ys6HNnUeFsroidjQaov37kMeJQRijcmeikoKeYgBuBWGElU8OafjyaqtRbO
 Pmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733354264; x=1733959064;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+qyWMAaxSXjS/GuoQtdsJ9zo8e90abOj5J8SrRL65M=;
 b=kcIXmze2pVp3IQFx7kvf6mljcg4OeJw+tgAU3/K2jlLoX9h8eVDNkG45OaGNj6J00f
 h5r6oHKcqmR8DItyY1lONhsiYwajud1KuDM57f8kR9egIkGQqVXia1ZMHVLQX5tNOSOE
 JY+Ybg5AazRj3fdVDG4Ea3f2WF2Bi7CxE9FSr9Zhdf/kwV9c5TVx5mywGHp3EO8EpIQ4
 lHAsrxJYzDnTcN1muctwL+Pr1x2V+pPRCnDEgvCFVbKHaBQclUtX8GhSGLXVka/AWtOG
 pH5cgvRypHRojJZb589AkZ5GbTBNzWPT4ot03Tt/EOnukmuSVfiXaXGKuK6nCYNbNi22
 5Cgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQeWXHoF6EdnljqbfWW3GmYdfKgv6P2VXSTUfPbC4l1IohErzKd1Xr1u16me2TzcyRvVM00Df8aFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBwEloUw5g55dG2sO4T4oxZj8AC4my96iVG3CKVc4yHWXS7sg5
 ni2trwDdggfcmjzFIVWocMl5PhlUeAoqL+Pq1YtgdFEuVtpiRqEyN+gRiqCrm0M=
X-Gm-Gg: ASbGnctZLL9yEtPXURrUunka/rJ9FdI5myohV4ofNe/utz+SIOQ8JnDVZjDYHnY92b8
 glgkgD/Na4vpp25DdlVmwJ2cJwUvuaWMPy3Yshjjj4qnYaSn7XefQDpEhKowWMJYbHjxNdWSzg3
 B44wX49YQEbHivjtY+Un5xtMjzQ9NSEdxRnq+SNkZaiOFvutc2dNES2D0CCd49WN6zsChqRj9b5
 x+xtKlQKIADV4xP9J/RKN+7e3rjx/hCHTwzyOJqBqQJJz/Ahjscs8lGqSVukfJ74ryHk5f9ASOE
 LodBWnBAG+pTqmfbzMUeouxmQM09lg==
X-Google-Smtp-Source: AGHT+IG2aNoUrJvkerXSq3eWJ+qwjRlvZ17m+biwTB/m1eLy8NPmwfbxly/t8CsrnbMCJEk1wfQi/Q==
X-Received: by 2002:a05:6512:3f16:b0:53d:dd09:124a with SMTP id
 2adb3069b0e04-53e129ed245mr3412222e87.8.1733354263629; 
 Wed, 04 Dec 2024 15:17:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229ca4c2sm31823e87.269.2024.12.04.15.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 15:17:42 -0800 (PST)
Date: Thu, 5 Dec 2024 01:17:39 +0200
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
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 7/9] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
Message-ID: <3oz2k3ywwdkxhi4t4setfqjl54yzxg3nxe7upxwl4syyyygf42@3ynkabu2bmvs>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
 <87a5dc4zd5.fsf@intel.com>
 <txzri7x4pdeakx4juandk3hfhsbx3dhlulxfuehqlmrr7b3wpw@jaunqktsro6x>
 <87v7vz3ne4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7vz3ne4.fsf@intel.com>
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

On Wed, Dec 04, 2024 at 09:42:11AM +0200, Jani Nikula wrote:
> On Wed, 04 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Tue, Dec 03, 2024 at 04:25:58PM +0200, Jani Nikula wrote:
> >> On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >> > +	drm_edid = drm_bridge_edid_read(bridge, connector);
> >> > +	if (!drm_edid_valid(drm_edid)) {
> >> 
> >> What's the case this check is for?
> >> 
> >> My preference would be that bridge->funcs->edid_read() uses
> >> drm_edid_read*() family of functions that do the checks and return the
> >> EDID.
> >> 
> >> There are some cases that just allocate a blob and return it. Would be
> >> nice if they could be converted, but in the mean time could use
> >> drm_edid_valid() right there. Additional validity checks are redundant.
> >
> > This was c&p from drm_bridge_connector_get_modes_edid(). If you think
> > that the check is redundant, could you please send a patch dropping the
> > check?
> 
> Mmmh. It's just scary to *remove* them, and that's the reason I didn't
> want you to add one in the first place! :)

Ack

-- 
With best wishes
Dmitry
