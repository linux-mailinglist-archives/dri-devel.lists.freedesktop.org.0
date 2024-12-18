Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 509EB9F6917
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 15:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E0D10EBD1;
	Wed, 18 Dec 2024 14:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bblH6obs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5156810EBD1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 14:52:23 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-6f14626c5d3so51854937b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 06:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734533542; x=1735138342;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jikMDVImI7Pf9+NM113vi4yTRoWYSpkiHuuI1ghgiGU=;
 b=bblH6obs/sM6swIDM1syDwRedokH4zw2SHDZvd4ABzlO23votCFxNXZ0eOmHMR9EU+
 ujreDyjlBuJs0350ZgktC4iLhTYCzuYp91TLe785cfPzyUtWevGxuKXFpRpnQF4JGkjF
 OT+uS8EzwnVHcVu678Em8llideaXS/AvhBh7z7AtT2l9nbE7Aq9bp8fKU+oQVGjN585i
 NXQpA0ZfiUIyK3VRtFDhcEX3RHrblBUBHCLeNS4F5xrHFdTIUF07iXtk2Pd7IETNlXRL
 /3zrVssmhjlLmHaAi98extfpRblVnLGL6qPAh2fQopitIzJwgDzo/+b219rFmjwNBMPG
 143Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734533542; x=1735138342;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jikMDVImI7Pf9+NM113vi4yTRoWYSpkiHuuI1ghgiGU=;
 b=osXAL5hPL7tBSor0aShAMVoaVrCzANmPdcSvzirjts6OzXz5TqEZTTJXf2cgmc35VD
 lEutU3pJAB0q3uI6K5d3l0RqPP0g5vaN2GL++s/PjP6LInPxLnS/DJWSbWyqloO7gDDw
 k9eQ+GD4xatQTCVaZv8EVDbol3eMpqyfdcgj1Vc3uG0mcNzaft23EV/CAq5/kV6RFpa5
 YuPZxp1hkos1JNlm66Ng6k5V9DOBGgVZaMpb3tym3Uii/T1TIplBOsySHUsMt2xAdP6T
 WcUiRsnXEEN1cBpBpZxdqlUO60hZiKdR6YmK8eFDZYD3yasD8oEIp+EzD/Qs1nyy89df
 Lhtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTujd/j4FcAtsrkf67jXXAbr6FXnDYe4sOTcsnV3/dj/CLtvY8JIz+nbFDOUG+joRaieBUN3+7l8w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNmR1ZKMxzSbotHxrTEwb96+6zo/qNUGxK+FR3huhXf/9YBff0
 d6ta0UbQHaEtAxQTOjCB5t89iM7ZtSIibN5TyPialXydS0drBnTXSzay/viNSUspx/HIXYINHOU
 OmxZZolCp3W1M45Zs+8EoGXNjvvWXzh5UT1R2gg==
X-Gm-Gg: ASbGncumKTlzuXVR7AgdB3LwasTxCUMnQvnuuNdB7Ybd5EgweVdVP8Z5/p7rfmANVll
 MjLEScHAACY1kbzeWfQX7b6Gl2qmcbXytVtn2rA==
X-Google-Smtp-Source: AGHT+IFROOIaavezTSB4qbIDqYTANawNmOriE8EjpWA/iXMqK2VjNXjnSwbVB0kRn8qDDZTN6lGUdQkOSisxyeutzXQ=
X-Received: by 2002:a05:690c:6c91:b0:6ef:a4bc:8bc9 with SMTP id
 00721157ae682-6f3d22573a0mr22613297b3.21.1734533540880; Wed, 18 Dec 2024
 06:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat>
 <CAA8EJprjCyWBNkRrc4W24uCwPtf_kxZLqNeNP8EJffbutYQ21w@mail.gmail.com>
 <20241218-wild-red-manatee-bb2a34@houat>
In-Reply-To: <20241218-wild-red-manatee-bb2a34@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 18 Dec 2024 14:52:04 +0000
Message-ID: <CAPY8ntDdcOXuWVgx6+cbgX5ct_-MXcE7CWDKgGP57EX6bvBLaw@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
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

Hi Maxime & Dmitry

On Wed, 18 Dec 2024 at 07:59, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Wed, Dec 18, 2024 at 07:24:23AM +0200, Dmitry Baryshkov wrote:
> > On Tue, 17 Dec 2024 at 19:21, Maxime Ripard <mripard@kernel.org> wrote:
> > > On Tue, Dec 17, 2024 at 02:40:22AM +0200, Dmitry Baryshkov wrote:
> > > > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > > > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > > > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > > > there was no simple way to get the drm_connector that stayed at the end
> > > > of the bridge chain. At the same point the drm_hdmi_connector functions
> > > > expected to get drm_connector instance.
> > > >
> > > > While looking for a way to solve the issue, I stumbled upon several
> > > > deficiencies in existing hdmi_codec_ops implementations. Only few of the
> > > > implementations were able to handle codec's 'plugged' callback. One
> > > > third of the drivers didn't implement the get_eld() callback.
> > > >
> > > > Most of the issues can be solved if drm_connector handles
> > > > hdmi-audio-codec on its own, delegating functionality to the actual
> > > > implementation, be it a driver that implements drm_connector or
> > > > drm_bridge.
> > > >
> > > > Implement such high-level framework, adding proper support for Audio
> > > > InfoFrame generation to the LT9611 driver.
> > > >
> > > > Several design decisions to be kept in mind:
> > > >
> > > > - drm_connector_hdmi_codec is kept as simple as possible. It implements
> > > >   generic functionality (ELD, hotplug, registration).
> > > >
> > > > - drm_hdmi_connector sets up HDMI codec device if the connector
> > > >   is setup correspondingly (either I2S or S/PDIF is marked as
> > > >   supported).
> > > >
> > > > - drm_bridge_connector provides a way to link HDMI audio codec
> > > >   funcionality in the drm_bridge with the drm_connector_hdmi_codec
> > > >   framework.
> > > >
> > > > - It might be worth reverting the no_i2s_capture / no_spdif_capture
> > > >   bits. Only TDA889x driver sets them, while it's safe to assume that
> > > >   most of HDMI / DP devices do not support ARC / capture. I think the
> > > >   drivers should opt-in capture support rather than having to opt-out of
> > > >   it.
> > >
> > > Sorry if this isn't clear to me and I'm quite late to the party, but did
> > > you test this on vc4 with both a pi3 and pi4, or was it just compile
> > > tested?
> >
> > LT9611 is actually tested, VC4 is only compile-tested. Should I put an RFT tag?
>
> Yeah, we definitely need to test it on the pi3 (polling-based) and the
> pi4 (irq-based) at least.
>
> Dave, Maira, could you give it a try?

I'm on it.

  Dave

> Maxime
