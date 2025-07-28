Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C234DB1349A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 08:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379F010E332;
	Mon, 28 Jul 2025 06:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QxuP2LW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D3D10E332
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 06:05:24 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45600581226so41064085e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 23:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753682723; x=1754287523; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tQXF3uhUpKed79enyV2WSAsZRiLGa5m0jySlxIYlh2M=;
 b=QxuP2LW8ZvfyJWa/m17dPti6wGv83sS2o0shzXAq5eCv/GTI+lO93oII9c/hzrOQzs
 vX+ZwqM66aAA0uFIcI7JKEALEab7SqC2IcjenHJZmi7TRwsAiIUWbyO8sK+7/1lt2JNP
 M0WPb1VmS+Lty+79KfwVpzqQ5qLIDFjIrga8I/Q7cGVr97PMtDXHuEa0a9iBhMwruGCb
 Ji2noyW3jZf8dVPfqyb/C07Wd2+MrBDHxALeryAiPDOa8zZCR8mPTWUDHi6XgI9ZvtqH
 n+677BB9haiJXc9vXIqaBmJfxu5UHyLLoRqBbRwSKahxFV1+MSER2zlNKKGhNLGe3pL/
 pl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753682723; x=1754287523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tQXF3uhUpKed79enyV2WSAsZRiLGa5m0jySlxIYlh2M=;
 b=pVnyE///MNW7Qcf8VlXQhMRMY+ldBCaGVx/cfjcFnv4/gahqx6KRGZxxvHlbCHFxMp
 VS1M0QRqRQVwutt+XPiI2ISQ42rleoolwvIgupZ8b8+x8NvE9+Rh12INfSv/poIl6Rsh
 HGZq4tk7jYZYVCYE4u/6gIvCFnoLIkbY13b1tx/kEIoCgKvpey7o71kpxl96h3VDyC+S
 lMS0vRWkSwP+ZQ+DrZWA5ZAT1bBr0vNvIY2ILYs71nfSgcBXFhhVcGwpXkM+i1CPljO1
 zEgrI60Wn5qbF84NInv+Nd0lJMBf6CVoRTpGdDkCSGYd4dHLyDg2SuRwpuFQ0U0mFu9e
 Z9zQ==
X-Gm-Message-State: AOJu0YwjpkjueAd86a2od2AM93AJKwcJoauetoG9PKaQHRRk9gqTdwI6
 IU2PBC6ugRXWc85PhJTUg59/RdttOgEF9Sl/bnJBTGDcEaz0UDLdw8REa3kd4Ea3+dzMKsbu4gK
 S0Ci6M4aqY6Hai0/oX2/fGN+FrPWdQ0w=
X-Gm-Gg: ASbGncvjxIm7jEwvCbHcklgkKm81DW6c3w+y7oDRHA/E22aJOgXJott+BvY3K7pAJAl
 idIcClSoF1sO1BxvCUkONfrxQSKUrVOK0MF27d7NnfjT/W5AjwUiKp5OF+4g62D0R/Q/Mp7bKY6
 pYF73SQj2RI/G37DA5omGD+fnkvPZs1YdGjTgcz7CGWkGLTtswPa2zyJ05aB6kwaObs4Z4kDH3v
 yv/0O3m
X-Google-Smtp-Source: AGHT+IGbQly/khf35EnzlRO7ObYBo3BJlziBpv1lPzLbWO+xhKZeTjbakTyAb7qcQM/u3YZ/g+3x0BcnqrQrhaC7WKs=
X-Received: by 2002:a05:600c:6748:b0:456:eab:633e with SMTP id
 5b1f17b1804b1-4587dd0db72mr59731935e9.17.1753682722442; Sun, 27 Jul 2025
 23:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250623081504.58622-1-clamor95@gmail.com>
 <CAPVz0n38N32HobYshtS9cLBJqWGPA1MZjMr0HH3C4UqGcFaFVA@mail.gmail.com>
In-Reply-To: <CAPVz0n38N32HobYshtS9cLBJqWGPA1MZjMr0HH3C4UqGcFaFVA@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 28 Jul 2025 09:05:11 +0300
X-Gm-Features: Ac12FXx4CN1mT0Dh6FdAxwgNHcr1BsYAY3RYhstMmFIeWt6bQ2yxBdsgzEZ5FqU
Message-ID: <CAPVz0n0nwnVyVP2V4Oswhhrz=gwMpv_-f2xJfBO2N44GRNjaKQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Svyatoslav Ryhel <clamor95@gmail.com>
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

=D0=BF=D0=BD, 21 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 19:38 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D0=BD, 23 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 11=
:15 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
> > and LG Optimus Vu P895
> >
> > ---
> > Changes on switching from v6 to v7:
> > - removed enabled checks
> > - configuration complete quirk moved from host_transfer to
> >   atomic_enable
> > - switched to devm_drm_bridge_alloc
> > - removed redundant dev_set_drvdata use
> >
> > Changes on switching from v5 to v6:
> > - set correct module name in Kconfig help
> > - return error if spi sync failed for reading
> >
> > Changes on switching from v4 to v5:
> > - rebased on top of drm-misc-next with adjustments to fit
> >
> > Changes on switching from v3 to v4:
> > - no changes, resend
> >
> > Changes on switching from v2 to v3:
> > - added mutex guard
> > - configuration register flags parametrized using panel flags
> > - removed unneded debug messages
> > - removed unimplemented modes checks
> > - added check for maximum pixel row length
> > - use types header
> > - remove ssd2825_to_ns
> > - shift bridge setup into atomic pre-enable
> > - cleaned default values of hzd and hpd
> >
> > Changes on switching from v1 to v2:
> > - added description for clock
> > - removed clock-names
> > - added boundries for hs-zero-delay-ns and hs-prep-delay-ns
> > - added mutex lock for host transfers
> > - converted to atomic ops
> > - get drm_display_mode mode with atomic helpers
> > - parameterized INTERFACE_CTRL_REG_6 configuration
> > - added video mode validation and fixup
> > - removed clock name
> > - switched to devm_regulator_bulk_get_const
> > - added default timings
> > ---
> >
> > Svyatoslav Ryhel (2):
> >   dt-bindings: display: bridge: Document Solomon SSD2825
> >   drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge
> >
> >  .../display/bridge/solomon,ssd2825.yaml       | 141 ++++
> >  drivers/gpu/drm/bridge/Kconfig                |  13 +
> >  drivers/gpu/drm/bridge/Makefile               |   1 +
> >  drivers/gpu/drm/bridge/ssd2825.c              | 775 ++++++++++++++++++
> >  4 files changed, 930 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/so=
lomon,ssd2825.yaml
> >  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
> >
> > --
> > 2.48.1
> >
>
> Greetings!
>
> These patches had no activity/feedback from maintainers for almost a
> month, so, in case they got lost in the depths of email box, this is a
> friendly reminder that they are still relevant and I would like them
> to move on.
>
> Best regards,
> Svyatoslav R.

Hello there!

This is a friendly reminder that they are still relevant and I would
like them to move on. Should I resent them?

Best regards,
Svyatoslav R.
