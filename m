Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5857DA213AD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 22:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A11110E02E;
	Tue, 28 Jan 2025 21:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sj/R0GKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B500A10E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 21:47:47 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e4a6b978283so222975276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 13:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738100866; x=1738705666; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zn+DqKP4PqxYmNm18V5XDkXaiOImU9Wxv+z627K+dB8=;
 b=Sj/R0GKujjefjWpA3Xmjn2wujLGGa94eBtg8y09U19KemyRQABmMZObWvlNzBjVYdA
 unICmjJR0JFw0gxwJ4LDPuu78YacLhuUmjzLsqYIcdlozHPd05muNhkcLB0P7KrSopOf
 pze+GPdeJlWRcNFG2LP+jvWjorB6JU316FkUbiE8bGZwD7fRLrvHgq++fXC+yX6Aiv/S
 hUpYQ+rMfLSOpAcCjg6rlP3Qoy9gUe/bYYDv8Zzr0WttFIHiNxuUFahkyNyC1hfJUED4
 Wmi3gZb3cMfhrInExFkyfc4NVgiHIUAEDFlNtcPNpMq09uFo8KpcUv90Q/1HvhcTt2fe
 H+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738100866; x=1738705666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zn+DqKP4PqxYmNm18V5XDkXaiOImU9Wxv+z627K+dB8=;
 b=dVLWvUjsWodSXOvrgoUSKz36JvGViHTBhS9Nay1Qe9ozz2cFP2T0eH7OZw8ck1vaBD
 v1mUPUDoHiw5QjmSSdovl6clCU+/Cdq8B9rx40QxX6r/epx/xg+TDst8vJ3whG323ouB
 9/61aQGsNultnWGmL0QurGpVdUqhlo7FUgbbO9iq6IRl4sTuHes8vlLYpzjILHpSUhsi
 rHgpvthA4rLCABgFr4f0nnLl3dKuzsUwABqOMR+KgUqSDWw4shyf7JNcnY2Ow0mH0UQ0
 NypPhlsdXbUNRkWJ1gtD1BHhRgvOL/BE/4UmrSzWAiHiBu5/tpUZx90+RSXy3Kw4et+0
 +dKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBvvFZcxbL9m1AVkDswfplt92tihe18JornVhQhru7s2UCoLz5i05HGA5zu9X43Qu7sUnstp/D15Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLwv8Z9MALCsbqH1wNm3yvuTdzO9JvF+RQIyDkMzSZs3cZSE8c
 j56UWQ5BdenaRRZ3CHoEFraQ8kisVG/w4wbB3Gb3NeZiy9k01NPLlWBLZNb0hxTXduBL5QJpbbn
 OtfYXXXmyLtbwKK+hYWMYGD6v3L0KKnuvoHiavQ==
X-Gm-Gg: ASbGncvpNM6mjUfrEuUtoFonSYQbCOXQgN8SuETYncpmZAp3vyuAh4zX2fdOfgHGRyv
 icJJqF3kYmfmGw45jV3vp+3bQg3eq72fr7vSyVFZVs7M94DlZlCHoUst55/DJ4cAjtdwSo8Lv/2
 luVW83OizQfNWt7Euep/rJpXxwaVYT7Q==
X-Google-Smtp-Source: AGHT+IEsReWyhqQ6ql9ccWt4eIj2dVvKfCJjrPrZJXAVKevC+b1Jl3BnGoWCpIZI0MTHnefam8NOnM7m7AG9gK5eIJM=
X-Received: by 2002:a05:690c:6285:b0:6dd:b8ff:c29c with SMTP id
 00721157ae682-6f797730641mr43058997b3.17.1738100866577; Tue, 28 Jan 2025
 13:47:46 -0800 (PST)
MIME-Version: 1.0
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-5-5b5b2d4956da@linaro.org>
 <jesawkrivnr2seor37i324zxzntt7zqvlwfdg37shfykl2e3q2@strwurvshn22>
In-Reply-To: <jesawkrivnr2seor37i324zxzntt7zqvlwfdg37shfykl2e3q2@strwurvshn22>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Jan 2025 23:47:35 +0200
X-Gm-Features: AWEUYZkem7YdjFk3hwIW-iXA-gezJrEqFDsNNdUkpKGwbLi83cws2gLFXum-H_w
Message-ID: <CAA8EJppvnsYc0Ri_3=GGkR6vgFPQt14m56E1kTNhiSf8HU4e8g@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] drm/display: bridge-connector: hook in CEC
 notifier support
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, 28 Jan 2025 at 18:15, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Sun, Jan 26, 2025 at 03:29:10PM +0200, Dmitry Baryshkov wrote:
> > Allow HDMI DRM bridges to create CEC notifier. Physical address is
> > handled automatically by drm_atomic_helper_connector_hdmi_hotplug()
> > being called from .detect() path.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt9611.c        |  2 +-
> >  drivers/gpu/drm/display/Kconfig                |  1 +
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 11 ++++++++++-
> >  include/drm/drm_bridge.h                       |  9 +++++++--
> >  4 files changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > index 0df2c68e45897f2f2eed10a56dd670582526180b..158a4966ac00657074b11e93dc9bcab41c16db18 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > @@ -1252,7 +1252,7 @@ static int lt9611_probe(struct i2c_client *client)
> >       lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> >       lt9611->bridge.vendor = "Lontium";
> >       lt9611->bridge.product = "LT9611";
> > -     lt9611->bridge.hdmi_audio_dev = dev;
> > +     lt9611->bridge.hdmi_dev = dev;
> >       lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
> >       lt9611->bridge.hdmi_audio_dai_port = 2;
>
> This looks unrleated?

No, it is related. Initially it was the 'hdmi_audio_dev' field (when
there was just audio), now it was renamed to 'hdmi_dev', as it's
common to both audio and CEC.

-- 
With best wishes
Dmitry
