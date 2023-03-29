Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4A6CECD8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 17:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5D310E544;
	Wed, 29 Mar 2023 15:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545C710E544
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 15:26:42 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id e65so19749434ybh.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 08:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680103601;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jV2lyvl8ub+2VPRjeHlb+sHmzhDe5z+36U7u39h187Y=;
 b=koSCDXLrsYInsfC1e0e5FcEjzTsnis9tfFB1SzdjyHQMOpeNNAOVeSjuT0ne4OK/TV
 qMcGvU5Gyrtt+ebsaKD9jX74i1kdtld413I9Dr3TcitiHoDN/lRfAMYjFubAAx9LKkhK
 PcTCqvadVbXLItVKNU2nu7tyQRa+LNpEB+5d4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680103601;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jV2lyvl8ub+2VPRjeHlb+sHmzhDe5z+36U7u39h187Y=;
 b=WL8egvgeZ7V51eAZ7x6RJeHxfvwTjGNcUij476bGQ8sZtaoTjUBxuQBvyj30I/YnpN
 amLgc8ugcqxfoWbOlLAiR53oF7qlCECyGzFGUj91036/lykwdaPLKY+TZj/mt8/X4gKy
 Oz23XWJNnYVxjfDEyibAkIOWNG9oc/+Johxn2J70kKevJQ9up4uHPZAKxnPgEFHcwHdJ
 9KVQRFxyqr9qvHUC0XBPAnHuOQ/VCmvZfLNCPh7ZUADw+s2oL+WeKSIjidFPqkeNilHk
 jRqrW2XBjSy7RnBcyH+/lkrMU5Rx+n7tahlFHH0Njo/spZU4G9bAgEVPNixsZfGQ3NKV
 pXjA==
X-Gm-Message-State: AAQBX9e12RgBCxxmXLdklkNYKTlkKT7yHhI0mTP5rGfe9yFcDBh63K3y
 UzVDOr5pL9PQ4B3rVA7F8csC61RHwiSGnvRM+2CNzQ==
X-Google-Smtp-Source: AKy350YMi/rjLaY2uUQ+82h4Hy78c0V90uLZLhiQBJOJ1GZntnfQTG+thdjlp3NT14dkSuRr6AAWA3nZWRje990ICFg=
X-Received: by 2002:a05:6902:1204:b0:b3b:fb47:8534 with SMTP id
 s4-20020a056902120400b00b3bfb478534mr10616056ybu.5.1680103601331; Wed, 29 Mar
 2023 08:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
 <20230329131615.1328366-3-jagan@amarulasolutions.com>
 <20230329150337.ua6qz7rvupk6vizl@penduick>
In-Reply-To: <20230329150337.ua6qz7rvupk6vizl@penduick>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 29 Mar 2023 20:56:29 +0530
Message-ID: <CAMty3ZAEb+ws_9jbdSM1ngfk=N7tePw_pEcALDAMNwzoNvbW3g@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] drm: bridge: panel: Implement
 drmm_of_dsi_get_bridge helper
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 8:33=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> w=
rote:
>
> On Wed, Mar 29, 2023 at 06:46:08PM +0530, Jagan Teki wrote:
> > Implement a DRM-managed action helper that returns the next DSI bridge
> > in the chain.
> >
> > Unlike general bridge return helper drmm_of_get_bridge, this helper
> > uses the dsi specific panel_or_bridge helper to find the next DSI
> > device in the pipeline.
> >
> > Helper lookup a given downstream DSI device that has been added via
> > child or OF-graph port or ports node.
> >
> > Upstream DSI looks for downstream devices using drm pointer, port and
> > endpoint number. Downstream devices added via child node don't affect
> > the port and endpoint number arguments.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> If you intend to use it with the sun4i driver, then don't. The sun4i
> driver is barely using drm-managed resources, so chances are all its
> resources will be freed by the time this action will run.

Any idea how to check all resources will be freed before this
DRM-managed action helper runs? I did test the panel insertion and
removal at runtime and I can see that the action helper
(drmm_drm_panel_bridge_release) is triggered at removal time.

Here is the log for it.
# insmod panel-bananapi-s070wv20-icn6211.ko
[   11.411894] sun4i-drm display-engine: bound
1e00000.display-frontend (ops 0xc0951eb4)
[   11.420253] sun4i-drm display-engine: bound 1e60000.display-backend
(ops 0xc0951620)
[   11.428128] sun4i-drm display-engine: bound 1e70000.drc (ops 0xc0951150)
[   11.435574] sun4i-drm display-engine: No panel or bridge found...
RGB output disabled
[   11.443484] sun4i-drm display-engine: bound 1c0c000.lcd-controller
(ops 0xc094fdb0)
[   11.451264] sun4i-drm display-engine: bound 1ca0000.dsi (ops 0xc0952f04)
[   11.462479] [drm] Initialized sun4i-drm 1.0.0 20150629 for
display-engine on minor 1
[   11.963246] Console: switching to colour frame buffer device 100x30
[   12.046329] sun4i-drm display-engine: [drm] fb0: sun4i-drmdrmfb
frame buffer device
[   12.082641] sun6i-mipi-dsi 1ca0000.dsi: Attached device s070wv20-ct16-ic=
n62
# rmmod panel-bananapi-s070wv20-icn6211.ko
[   16.306388] Console: switching to colour dummy device 80x30
[   16.466963] drmm_drm_panel_bridge_release: In

Thanks,
Jagan.
