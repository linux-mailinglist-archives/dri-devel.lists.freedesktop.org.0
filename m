Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA26DAC0F90
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EC410E044;
	Thu, 22 May 2025 15:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JuHO7+K1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B0410E044;
 Thu, 22 May 2025 15:12:03 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6f8d663fa22so69100866d6.0; 
 Thu, 22 May 2025 08:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747926722; x=1748531522; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zBpkT+X12qTj4ZXFWwDHYvuVR5JkpgqcjljjqtTRTxw=;
 b=JuHO7+K1E33Sn9W3xtCFfX+RxKTg+R2C9tTjGN2ntFXEB/MgvgGLfzO5JwV5tv0iTl
 RAE19GeZ7F4BW+yE+B/zmpLw35l3lXFhxgdSdgWgBT2WFSWjFNZu30dIChtA8FU45vBJ
 A+xlp/7fdEwAqxC6LUI3gljPg5VA0MY+MMucmBaS2QQUVW/J1ahtL5d2WvikI8J1mrh2
 zftIlLzSWkjvgCdBR6iZDypTwnlR9H4zX8/0QPs28P4kl7L3ixE7OoTGXF+1G1seWZL1
 NQjKNSgydObEIOUNZMuOinKfZZZc8tFJSeQc6IBm1zy0zwRD23JJ/EmXq4UOoohU7THu
 fAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747926722; x=1748531522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zBpkT+X12qTj4ZXFWwDHYvuVR5JkpgqcjljjqtTRTxw=;
 b=dtc7U4kPDQmE1QFGt09HNIS5mb2tL2othC1uAot89iSDrzKIFnF8lusY7V+sxsP6iR
 niD0IGsvPQLm4yJcaypOsKzJsO5NSI3pE4jhpyNXVPA7i/RtV0bCiuntgVQEomo0yZce
 a7jnRlx/PkTX+sBJNwt6gWGi6fbgAI9XiJfIEw5RnsBXxL6FLF97bn2diQNMvHylf8aw
 TVxfQ+WjO5U35zwMPlLBN0jdAqR3rALq6AHpOX8QDFgHeYayOx6o2AZbQvXh/kGHzjC4
 7+K1rBJB3XZM7T9xmBDVyuNU0FPRPTgFbRbiOSQZUBCOOJxV/XKlIHoEnsRiVhEfWZy+
 n6Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDlqXXb28THlp639cb6hDLoGU1dk/x01hPDzZowLvUpCytO0KTS1LsLCv1wIJdDOTnh5r5MD5oi+qC@lists.freedesktop.org,
 AJvYcCX70YHxHW7TScu0FKgtYF97AnFDYSTDXIqyxNOHLdpbLXmrrAxwKPxx9eLHEKDh4+/Ei7uDIzpWZtM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQaWzt/vBWV5Ddkm+Rt5HMFIid6Qf4Vt0s5rnTk7mQNScljDTG
 8BJ5UYhulAD2rXgbseN6QpBiy8ZK+kYe7zH78MfEn52I19dKesHCLBlRchqqEjmN7vsjZRXOamO
 GqeJUR/SBzkJ/7oqnEc2B2XnAaFzytPc=
X-Gm-Gg: ASbGncuG2FaxiqQ8c/9gEDHw7/ar2Gn776gsdg7/yUG6UstELp8iHm26ShL9crtme5H
 lqyvxc5KOzXA3P/WjqVxpj2IaVahScusmaWnxW5NEF+rV3q8Awf5ZE42AaqDTSJX4efxWPMsIwJ
 x75ZHV8jAmGbM+9edFX6MMNE3/L2tzpno=
X-Google-Smtp-Source: AGHT+IFlBlVnRPEejI7uEQI0m4iJ7XD5elQtat++i3WnHxfOw553GLb37rOpDc90WmrXZut9Lu8B9Qiwq9FX49Bc1Ek=
X-Received: by 2002:a05:6214:f0c:b0:6eb:28e4:8519 with SMTP id
 6a1803df08f44-6f8b2c7b1d5mr412061496d6.21.1747926722029; Thu, 22 May 2025
 08:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250521162216.79dd3290@booty>
In-Reply-To: <20250521162216.79dd3290@booty>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 23 May 2025 00:11:24 +0900
X-Gm-Features: AX0GCFtvRxj4ujyC4Z2jHUwkVIe890MFPlPN-fSj8wgEwb2IYi_zfj6mGd98q30
Message-ID: <CAAQKjZPX3iQgNhEydDZXMyC9BRuep7kL-XYEsjnkCxSt_1UsQg@mail.gmail.com>
Subject: Re: [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Adam Ford <aford173@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>,
 Aleksandr Mishin <amishin@t-argos.ru>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Christoph Fritz <chf.fritz@googlemail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Guenter Roeck <groeck@chromium.org>, 
 Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>,
 Janne Grunau <j@jannau.net>, 
 Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Vitalii Mordan <mordan@ispras.ru>, 
 "Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Helge Deller <deller@gmx.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Michal Simek <michal.simek@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Luca Ceresoli,

2025=EB=85=84 5=EC=9B=94 21=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 11:23, =
Luca Ceresoli <luca.ceresoli@bootlin.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> Hello Maxime, Shawn, Liu, all,
>
> On Fri, 09 May 2025 15:53:26 +0200
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> > devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a=
 DRM
> > bridge, and the only one supported from now on. It is the first milesto=
ne
> > towards removal of bridges from a still existing DRM pipeline without
> > use-after-free.
>
> I applied on drm-misc-next patches 3-17,20-21 as they match all the
> criteria:
>  - At least a Acked-by (or R-by maintainers)
>  - patch is for drm-misc
>
> Being my very first commits to drm-misc, I tried to be careful, and
> double checked all the patches with Louis (thanks!).
>
> Here are the pending questions and plan for the remaining patches.
>
> >       Revert "drm/exynos: mic: convert to devm_drm_bridge_alloc() API"
>
> This reverts the commit applied my mistake:
> https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/91c5c7b5bb2dd09b4=
3b025bce6d790d3c79f4518
>
> Neither the  original patch nor the revert has been reviewed/acked.
>
> As the commit was a mistake, I'm applying the revert by the end of this
> week (i.e. on Friday) unless there are better instructions.

Really sorry for late. I was made aware of it later through a
colleague's remark. There is no need to proceed with the revert.
Acked-by : Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae


>
> >       drm: convert many bridge drivers from devm_kzalloc() to devm_drm_=
bridge_alloc() API
>
> This patch affects multiple drivers. Running get_maintainers.pl
> points at Shawn Guo's repository. After reviewing the MAINTAINERS file,
> this looks like due to the 'N:' line in:
>
> ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> M:      Shawn Guo <shawnguo@kernel.org>
> M:      Sascha Hauer <s.hauer@pengutronix.de>
> R:      Pengutronix Kernel Team <kernel@pengutronix.de>
> ...
> T:      git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.=
git
> N:      imx
> ...
>
> (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAIN=
TAINERS?ref_type=3Dheads#L2511-2528)
>
> Here 'imx' matches the 'drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c'
> file that is touched by the patch. That regexp appears overly generic to =
me.
>
> Shawn, can it be fixed by making it less generic?
>
> If not, can we at least add a band-aid 'X:' entry for
> drivers/gpu/drm/bridge/imx?
>
> I think the other matching entry is the one to consider:
>
> DRM DRIVERS FOR FREESCALE IMX BRIDGE
> M:      Liu Ying <victor.liu@nxp.com>
> L:      dri-devel@lists.freedesktop.org
> S:      Maintained
> F:      Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.=
yaml
> F:      Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixe=
l-combiner.yaml
> F:      Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixe=
l-link.yaml
> F:      Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2=
dpi.yaml
> F:      drivers/gpu/drm/bridge/imx/
>
> (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAIN=
TAINERS?ref_type=3Dheads#L7940-7948)
>
> However it does not list any trees. I _guess_ drm-misc applies here as
> a fallback as well as common sense.
>
> Liu, should this entry have a 'T:' line for drm/misc?
>
> >       drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_al=
loc() API
>
> Not acked/reviewed, some discussion happened. I am resending it in v4,
> possibly with updates based on the discussion.
>
> But it has the same issue discussed above, with get_maintiners.pl
> pointing at Shawn Guo's tree, so in the future I'm assuming this goes
> to drm-misc unless there are news about that.
>
> >       drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
>
> No feedback, resending in v4.
>
> >       drm/todo: add entry to remove devm_drm_put_bridge()
>
> This involves documentation maintained on another tree. Where should it
> be applied? There are two matching entries in MAINTAINERS:
>
>  * DRM DRIVERS -> the drm tree
>  * DRM DRIVERS AND MISC GPU PATCHES -> the drm-misc tree
>
> To me it looks like the second is obviously the closest match as we are
> dealing with DRM bridges, so I'm applying this as well on Friday unless
> there are better instructions.
>
> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
