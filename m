Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C281C8D852A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 16:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABD810E00B;
	Mon,  3 Jun 2024 14:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JFJgDOtS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C3910E00B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 14:35:19 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso1995366b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717425318; x=1718030118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IjiZy0A+IiOg0NID/3j9joaAnDhVLRbkPfAL2w/lRx8=;
 b=JFJgDOtSbw41uk1sRbxwUse1y+sN0QLt+BDcpSyrux5YScjSDFimzVm100mmwLopAp
 CAD+TaO5LbgFzDlhYnz3rA5+G9bd1/Zf5fkEeud3OA35V1L7VkDY6Kw5WyQQdBFD1cJg
 cDBc7vaFl9g6xN6dwiXUBp0b/yfQvVol2Zb2bYekF/LS0/7efKLF+/QCExpHBSF1stjm
 ZACAwLg0JOqlZaVIF/JXtcGOq/9hgv/EtVrD50fxw9Tp3q+lKOkBRNCOrHxWJ/SGvFYl
 J3MGpSe40q8Uua/GqOz+VftaNIETkw7tbq3UUFQDnS0z5Vf8N/Yl88F1zFa1+J0U36z0
 fsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717425318; x=1718030118;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IjiZy0A+IiOg0NID/3j9joaAnDhVLRbkPfAL2w/lRx8=;
 b=oGUe+jmO216FazSuAK470x3XQ6Avj7vQLkHMQ3KSqfoIjvG+Fs0Hn+IJJh23/bKoUP
 3K0mcUEtLeRuxq2NaRO/FfJ+u7br4Hx+5wZlV9axqQ9BcxUvufCumEOajyPSqNA+cvKC
 7cLakh2PYv+lBeUNH4lXrpWoe56C64xnmbQHx3z02BnaKgW7Oo6LSO+W0z2sYGo6XKz7
 ArxlMqUPymV3qTT5armrnMRBTk1JGkbhZ9rIyVUOSllkQ/7vDD2MtXjWiUFupCIFjsKZ
 u0orpDQkluKnjHNjIebPg0ChiFWWWMAARZ+Smqo7RnvalzAfYXbNUkuYa8ZBN9MFBSbY
 exFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqnzCOCI7s9fyjO9Y8VSdzbVH+qlchh9Vtnvs4ZAS2nlCsByEGQR7vpCPpZCzgiUblNqnrJbOavOQ99UM3yK9NzbsBybUz/+OZGzijFcOt
X-Gm-Message-State: AOJu0YyjgyRPTKIuYxQ3le7BBWAm4ThWNGHuHzA2cT2ftsP5oz0okRm+
 37gqy9NO3lygpZ/QJ9iKWxNpQHTwKoVlj9v0KbygKFiqP79yUwwKfJ7r9xqCf7Ah7gyUsVMW+ud
 JthHi2yszGX3U+u1h7Gugg6aaOQQ=
X-Google-Smtp-Source: AGHT+IEIGX63vWeSUePEEOMqz83AeDn2dYDIwBDPg554yoYAyS7l6TvEu4gk8wRL60IRlOIma/nsoc48LqIb6U3NYYU=
X-Received: by 2002:a17:906:7c8d:b0:a61:4224:c998 with SMTP id
 a640c23a62f3a-a6821d64674mr683493366b.54.1717425317733; Mon, 03 Jun 2024
 07:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
 <CAFXsbZo3miDMQ7SDktRP_DOzMy2JTFz4AsuMp78jLQGauTNsmA@mail.gmail.com>
 <qcbh6pltjsetikped3ioihwmiow5ngstimgebplnl6ckqkkl63@z5xd64qbsbga>
In-Reply-To: <qcbh6pltjsetikped3ioihwmiow5ngstimgebplnl6ckqkkl63@z5xd64qbsbga>
From: Chris Healy <cphealy@gmail.com>
Date: Mon, 3 Jun 2024 07:35:05 -0700
Message-ID: <CAFXsbZqdna4S6t7UgRDacSb3WcC_21KDkh5pDyD4LCHgYsPang@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On Mon, Jun 3, 2024 at 3:12=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sun, Jun 02, 2024 at 08:25:39PM -0700, Chris Healy wrote:
> > On an i.MX53 QSB with HDMI daughter board, this patch series is:
> >
> > Tested-by: Chris Healy <cphealy@gmail.com>
>
> Thank you! I assume this is imx53-qsrb-hdmi ?

Yes
>
> >
> > HDMI output still works correctly and the bridges file reflects the cha=
nges:
> >
> > Before:
> >
> > root:/sys/kernel/debug/dri/display-subsystem/encoder-0 cat bridges
> > bridge[0]: 0xc0fa76d8
> >         type: [0] Unknown
> >         ops: [0x0]
> > bridge[1]: 0xc0fba03c
> >         type: [0] Unknown
> >         OF: /soc/bus@60000000/i2c@63fc4000/bridge-hdmi@39:sil,sii9022
> >         ops: [0x7] detect edid hpd
> >
> >
> > After:
> >
> > root:/sys/kernel/debug/dri/display-subsystem/encoder-0 cat bridges
> > bridge[0]: 0xc0fa76d8
> >         type: [0] Unknown
> >         ops: [0x0]
> > bridge[1]: 0xc0fb9f5c
> >         type: [0] Unknown
> >         OF: /soc/bus@60000000/i2c@63fc4000/bridge-hdmi@39:sil,sii9022
> >         ops: [0x7] detect edid hpd
> > bridge[2]: 0xc0fb9794
> >         type: [11] HDMI-A
> >         OF: /connector-hdmi:hdmi-connector
> >         ops: [0x0]
> >
> > On Sun, Jun 2, 2024 at 5:04=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > The IPUv3 DRM i.MX driver contains several codepaths for different
> > > usescases: both LDB and paralllel-display drivers handle next-bridge,
> > > panel and the legacy display-timings DT node on their own.
> > >
> > > Drop unused ddc-i2c-bus and edid handling (none of the DT files merge=
d
> > > upstream ever used these features), switch to panel-bridge driver,
> > > removing the need to handle drm_panel codepaths separately and finall=
y
> > > switch to drm_bridge_connector, removing requirement for the downstre=
am
> > > bridges to create drm_connector on their own.
> > >
> > > This has been tested on the iMX53 with the DPI panel attached to LDB =
via
> > > LVDS decoder, using all possible usecases (lvds-codec + panel, panel
> > > linked directly to LDB node and the display-timings node).
> > >
> > > To be able to test on the iMX53 QSRB with the HDMI cape apply [1], [2=
]
> > >
> > > [1] https://lore.kernel.org/all/20240514030718.533169-1-victor.liu@nx=
p.com/
> > > [2] https://lore.kernel.org/all/20240602-imx-sii902x-defconfig-v1-1-7=
1a6c382b422@linaro.org/
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > > Changes in v3:
> > > - Notice (soft) dependencies in the cover letter (Chris)
> > > - Select DRM_BRIDGE instead of depending on it (Philipp)
> > > - Dropped unused selection of DRM_PANEL (Philipp)
> > > - Added missing include of <drm/bridge/imx.h> to parallel-display.c
> > >   (Philipp)
> > > - Link to v2: https://lore.kernel.org/r/20240331-drm-imx-cleanup-v2-0=
-d81c1d1c1026@linaro.org
> > >
> > > Changes in v2:
> > > - Fixed drm_bridge_attach flags in imx/parallel-display driver.
> > > - Moved the legacy bridge to drivers/gpu/drm/bridge
> > > - Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
> > > - Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0=
-e104f05caa51@linaro.org
> > >
> > > ---
> > > Dmitry Baryshkov (12):
> > >       dt-bindings: display: fsl-imx-drm: drop edid property support
> > >       dt-bindings: display: imx/ldb: drop ddc-i2c-bus property
> > >       drm/imx: cleanup the imx-drm header
> > >       drm/imx: parallel-display: drop edid override support
> > >       drm/imx: ldb: drop custom EDID support
> > >       drm/imx: ldb: drop custom DDC bus support
> > >       drm/imx: ldb: switch to drm_panel_bridge
> > >       drm/imx: parallel-display: switch to drm_panel_bridge
> > >       drm/imx: add internal bridge handling display-timings DT node
> > >       drm/imx: ldb: switch to imx_legacy_bridge / drm_bridge_connecto=
r
> > >       drm/imx: parallel-display: switch to imx_legacy_bridge / drm_br=
idge_connector
> > >       drm/imx: move imx_drm_connector_destroy to imx-tve
> > >
> > >  .../bindings/display/imx/fsl-imx-drm.txt           |   2 -
> > >  .../devicetree/bindings/display/imx/ldb.txt        |   1 -
> > >  drivers/gpu/drm/bridge/imx/Kconfig                 |  10 +
> > >  drivers/gpu/drm/bridge/imx/Makefile                |   1 +
> > >  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |  85 +++++++++
> > >  drivers/gpu/drm/imx/ipuv3/Kconfig                  |  10 +-
> > >  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   7 -
> > >  drivers/gpu/drm/imx/ipuv3/imx-drm.h                |  14 --
> > >  drivers/gpu/drm/imx/ipuv3/imx-ldb.c                | 203 +++++------=
----------
> > >  drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   8 +-
> > >  drivers/gpu/drm/imx/ipuv3/parallel-display.c       | 139 +++--------=
---
> > >  include/drm/bridge/imx.h                           |  13 ++
> > >  12 files changed, 187 insertions(+), 306 deletions(-)
> > > ---
> > > base-commit: 850ca533e572247b6f71dafcbf7feb0359350963
> > > change-id: 20240310-drm-imx-cleanup-10746a9b71f5
> > >
> > > Best regards,
> > > --
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
>
> --
> With best wishes
> Dmitry
