Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC8A6C0FC5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72DC10E343;
	Mon, 20 Mar 2023 10:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9686110E343
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 10:54:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 o40-20020a05600c512800b003eddedc47aeso1789369wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679309654;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTz7t82VqGt16dngnh8jIgK9f8kyvRtdJKL5oVcNYog=;
 b=iqj9jppyEzS+XpBADTxreuxUozOqUdYwgalUxommnqNxkvH+5pJuKHBmhPMiZsqW7C
 HBzywrCrBx8UozYYCK+rUI8pVYAY6R3GlOW8hG1G4sy0/KBWPuaNZ09EuZ7jSjdtnfAL
 OlNkDnaxsDqs2A8N4VjYeTvqjosZFAUQh7aVwXT2etLitYJEa9/xAc9GPoRdLKxQlZal
 KcR+jrsUoiEo2CcCqYDkX6GQKRXvXJ44fFxumJbsMsPrvD24pxLuLatkeLxbtx81u4s5
 9IksZ0+M+hAUZQJ9fUXPjWGpuYf4/x1ZsCeb0pcPhO/DZeDqWEhGMnjOsBnAPtcYZnje
 jdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679309654;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTz7t82VqGt16dngnh8jIgK9f8kyvRtdJKL5oVcNYog=;
 b=k1CuadNRgiJBzLeOlViS2KdPNEkEBu22SFqhuDv40tmWc8nEtCbdTsB3CyRtNDiJlp
 +7su/Zibpqspx2moJDccLLHgnslLRBy1Q6jeD82WbEiBaj3RBwheEcQr88wOPr7GVQ1G
 2GWBY7RZw3Aq8aDmht96Rf9eMy8G8M+XTceub07zPh4bEl9LOAfT+kbl00NLGJqlvB8U
 NX1kXlZxXRgxrrjyeNSHI81Fe34IJV+Df+bq0VM3eoB3FuhcBDGHVyPR5xNzxS1gXMwQ
 gvAM4JsVjJl5eqC6vg2Op6OBlBUW3AL4GMFj5/5+zc8qma7oZ4g/xdN14xwCODJcVlgj
 0MpQ==
X-Gm-Message-State: AO0yUKVxkj1ssdUpaD0pWFNLANgpbXPKOGjKTMkqbPUu1GCn9d1huosY
 8rElxh5yBvugeeGeSJwcgLAidg==
X-Google-Smtp-Source: AK7set8KDoUuuaQmFBOsklgLnTId9XPsQFNfe8k2wAecETOtG3W+AMtcmKVPI+8cHjjChhEKaw0wsg==
X-Received: by 2002:a05:600c:3ca2:b0:3eb:3104:efec with SMTP id
 bg34-20020a05600c3ca200b003eb3104efecmr33230220wmb.16.1679309653891; 
 Mon, 20 Mar 2023 03:54:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003ed793d9de0sm13444474wmn.1.2023.03.20.03.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:54:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@intel.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Rahul T R <r-ravikumar@ti.com>, Jayshri Pawar <jpawar@cadence.com>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Minghao Chi <chi.minghao@zte.com.cn>, 
 Sandor Yu <Sandor.yu@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH 00/19] drm/bridge: Convert to platform remove
 callback returning void
Message-Id: <167930965268.2514063.17744962269901362155.b4-ty@linaro.org>
Date: Mon, 20 Mar 2023 11:54:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.1
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, 18 Mar 2023 20:07:45 +0100, Uwe Kleine-König wrote:
> this series adapts the platform drivers below drivers/gpu/drm/bridge to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[02/19] drm/bridge: cdns-dsi: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d5701d8f5210f8c70ffd1b51283b2373573e7b5a
[04/19] drm/bridge: display-connector: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d1837136d184dda0585a687c614a9117cc87ad27
[05/19] drm/bridge: fsl-ldb: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=be5c6b177229c5cb40f3fef785250afbfd669175
[06/19] drm/bridge: imx8qm-ldb: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=04751a061ea055c4fa264f20f4558073c3d8fb2e
[07/19] drm/bridge: imx8qxp-ldb: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3a39841322be5502f5355a558617f0a56b2b3ad2
[08/19] drm/bridge: imx8qxp-pixel-combiner: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b931c166c47207c8c7bc7eda6c8881dfe0241389
[09/19] drm/bridge: imx8qxp-pixel-link: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2b438065c3e538844a3b2b56f567303020bf97de
[10/19] drm/bridge: imx8qxp-pxl2dpi: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=23a92abbf3ad44058b5d3cf57937cfb9de972c05
[11/19] drm/bridge: lvds-codec: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f328e96b764a603b3b70f0e9ef6ee052a78ed2ad
[12/19] drm/bridge: nwl-dsi: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6780b94d8ed37a0f453a5bc90821ea669ac3c0d2
[13/19] drm/bridge: simple-bridg: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3fce4c948e2b73ba6f6f2aa7e1c2f101b997e192
[14/19] drm/bridge: dw-hdmi-ahb-audio: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e85f436824f2e2e067c0a151e954cb403b483234
[15/19] drm/bridge: dw-hdmi-cec: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8891698273b125e57d0d2b6a91451bac06e968be
[16/19] drm/bridge: dw-hdmi-gp-audio: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2b9efaed4e4045a40944265f99f52b232df3347f
[17/19] drm/bridge: dw-hdmi-i2s-audio: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ed58ee126c4da81af79ab40b7c6508a7100c7eac
[18/19] drm/bridge: thc63lvd1024: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5e3ea76492265fdbadd7a58963ff2a3a2e2e8be4
[19/19] drm/bridge: ti-tfp410: Convert to platform remove callback returning void
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=67fcd5d2f3ec364cb7af2c307ed1999bedebb606

-- 
Neil

