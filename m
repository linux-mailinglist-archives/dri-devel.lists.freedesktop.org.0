Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22DDADA874
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 08:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3157C10E2AD;
	Mon, 16 Jun 2025 06:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F1IZ2xsO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CFA10E2AD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 06:43:10 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so2899239f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 23:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750056189; x=1750660989; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UxVFKfNvM2BqAgB6j79WL0EsmcX/ySBTZGTfRt9FrXo=;
 b=F1IZ2xsO5Dcsoqfd7Tb1LX683+XQhekflF3cceri1nIA9oucWspdMyOhh48LPFatQH
 bGaX3KlI+foHkc/cn5hkI3nfdW070Opklp7pYpPaSAUk2OQI/HftAXNsUt2g07c0U8mz
 f4TzgHJlsj4XVqVHOwksAeD1FVmlttMyUezTdruqNSHHSpGlOisBbcTe9SMvCHxmiAOK
 mc1658ezeFIg42T8MwFnEJJUgZw72XyFfA19Pz8wYzae3GA7nzrQ7CGoBtNvtk9+xBtN
 m3C+JeprL/NjzjPJYS+VNKr/z8qeJPF+GAk7HszjSnl0ByQ5p6FuCfOf7LOe+GE43Eqv
 bNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750056189; x=1750660989;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UxVFKfNvM2BqAgB6j79WL0EsmcX/ySBTZGTfRt9FrXo=;
 b=KWqFkAgtFGSfkdyqEWa+uxwXGVpPKweYo5owizrNxpnL3AJP/JErS2mZbKimmvvubA
 RpWxQG9X3KgqOb616kDNPEQ1l7DdFQc11uqJIPdIE0NmwcaUvB1iOP/jxTkMEyFnRlFG
 VXovoj1i5IoIlqumHEgglZWCrRHwGCExGqjiAIK7wRZ4IZ7XeDA24nwgyH6REGl8LizV
 euZKqfh2xH7lNJOqtMz4+0LppHElFH2R8+iJdnPXlGvA0etBisN2pfvLtAMp2ws/qe5D
 s3x2Inxm9u1CJ9sh1lXedYp9I7gB2duKMuuBpjmVSR0qZ5cBUeDcf/MeZ/WFdNE6ZP4c
 BP2A==
X-Gm-Message-State: AOJu0Yy5Re1FFGa2Or+FMq6zIzdzFg+ZiTBbgxE0/mr7vYOBudfdSRur
 mTE2AvLndF8t7EZf/yosKvdNIWTLHzFMZ5L2SiWOB/3CqLFdIszJaQIFQMnVkeHU+V++6qiZncY
 24bcE8tm8pveebSBpFrgsVkdsjW4/qhM=
X-Gm-Gg: ASbGncs5HTxRm/aBpImVvUeMkqesphRAhcC6ZW0DgYWr1BJ1qT/b10Jy5YKqCCosEtY
 gSzLk9zT4T3ez3OBZotzzQovgjgQIdk4MNFEn8jfUMbLkDYVI8hwM8ECRTM1o9KJ1la7ebsjmbJ
 1HZ82+6KMC7mu6AweQdV6PwtZW+4k/49HnVaC9CfmwFCT1
X-Google-Smtp-Source: AGHT+IEwlB4QUQeFMOPwl01laMzufAmY822smlnWFy3hy01YA2cBmDYgFTBipsnFP9vE8aGnDCq2ZR+CAREFF5BJtDM=
X-Received: by 2002:a05:6000:2010:b0:3a4:f70d:8673 with SMTP id
 ffacd0b85a97d-3a57237dc6cmr6965969f8f.25.1750056188970; Sun, 15 Jun 2025
 23:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250303120455.90156-1-clamor95@gmail.com>
 <CAPVz0n0XSzxzkPocRVx6QF7xwmA4otSeSEiRZgJQ3oStyUBrLA@mail.gmail.com>
In-Reply-To: <CAPVz0n0XSzxzkPocRVx6QF7xwmA4otSeSEiRZgJQ3oStyUBrLA@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Jun 2025 09:42:56 +0300
X-Gm-Features: AX0GCFuN9A6nBmialOiDeiAg-dzMMc_1kxFppc1ouGvrqvHbGHQHd0TyVB9y9Jk
Message-ID: <CAPVz0n2MLmHfVNb25=o1_woE7v16hoamwFbbT3ecE+BP1Bn9aw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm: bridge: add support for Triple 10-BIT
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

=D1=81=D0=B1, 3 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 12:50=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D0=BD, 3 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 14:05 Svy=
atoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Triple 10-BIT LVDS Transmitter is used in Microsoft Surface RT and
> > MStar TSUMU88ADT3-LF-1 HDMI bridge is used in ASUS Transformer AiO
> > P1801-T.
> >
> > ---
> > Changes on switching from v2 to v3:
> > - place mstar,tsumu88adt3-lf-1 alphabetically
> > - fix typos
> >
> > Changes on switching from v1 to v2:
> > - sort compatible alphabetically in schema
> > ---
> >
> > David Heidelberg (1):
> >   dt-bindings: display: extend the LVDS codec with Triple 10-BIT LVDS
> >     Transmitter
> >
> > Maxim Schwalm (1):
> >   drm/bridge: simple-bridge: Add support for MStar TSUMU88ADT3-LF-1
> >
> > Svyatoslav Ryhel (1):
> >   dt-bindings: display: extend the simple bridge with MStar
> >     TSUMU88ADT3-LF-1
> >
> >  .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
> >  .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
> >  drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +++++
> >  3 files changed, 7 insertions(+)
> >
> > --
> > 2.43.0
> >
>
> These patches had no activity/feedback from maintainers for a while,
> so, in case they got lost in the depths of email box, this is a
> friendly reminder that they are still relevant and I would like them
> to move on.
>
> Best regards,
> Svyatoslav R.

These patches had no activity/feedback from maintainers for a while,
so, in case they got lost in the depths of email box, this is a
friendly reminder that they are still relevant and I would like them
to move on.

Best regards,
Svyatoslav R.
