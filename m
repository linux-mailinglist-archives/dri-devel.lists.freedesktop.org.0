Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2420FA329A8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 16:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECCC10E27D;
	Wed, 12 Feb 2025 15:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eU4oun02";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9A910E27D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 15:15:10 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54505191cdcso4616190e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 07:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739373309; x=1739978109;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbeFhgjlAz4HP0qajS/kFL0VJiSyjCShat9G6ecggLw=;
 b=eU4oun02JSh+hUgQhMHN+MCcoO9EEljciQIWO4XMIKJayaVSse998bxNkx3AB02dSr
 tERrzSSiIZsQo8j+8LXMmT2lUXkslBuZKk5eya1ARb/K9vF52wr/8LeppmtOs6NbmDAF
 PhMzQ3T+B9XskKHwJh04ZgijmjldM3JvGF7kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739373309; x=1739978109;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbeFhgjlAz4HP0qajS/kFL0VJiSyjCShat9G6ecggLw=;
 b=Cw19/gIG1HdvSgLAFzBmKgVBCzsJuTslKRjsQbbhwZkZzYnp7dyLpYMPzMMriUHlTW
 MqnF4V/bT9ATypSdG6F8+tIKTXSvCfKnb723MGnl6qmDv5MEb17I7LhmXbtXFzNsvP0b
 /YD4pHjT+wwk7t7EgbDL8jqUksvo0T3maL0pgvSHFF3+zM1CLc2YO/9zItgcm3mj5xJD
 /Q1iBlt470a53VlvEYS+vkph1XLtVQOSf+pyJXSKCbLmGxsqOJAa9S5AnTAXL95VmYSQ
 5VvN9v2OJKgb5ekVmqH7iHsKdMkqlj1Gk/6SmkpUjyGf7N/EpM6oq/eKu9GPfzVoNclB
 69Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzbtKU23NDkGH4exqk51sELZA0gnCfuxiNMfwBLKfLMf6gCk7kgvr4gIPMsXEz0I3z9eih/P1qzCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywfNYuNx4Ta2HMvixTy5L+GyNYJkUY5I9zhYw5EcmXievJujrC
 xY9d00+0okLBHxdVHxeLICUtJ2g/EjT3YFLHGWeozt1Kp0nhR+ZYKXepKdIho6iYCBvOTDuzyjy
 t/F8Z
X-Gm-Gg: ASbGncsrzU4Ofl5fy0dghPO5t0lCED9XTAC+u+9IU4daejuUHBiXv3JmFJxMn9P/W0D
 ID5mrB5mY6zGPqUETVfRj99QJMR8ARTABgCoghXq9GosO+RuGlivGHYuItQG6sGzUX0YJ8jnBWr
 M04pCPaZKc5/803fH2Fc6RxVnbTzZIES1QBDSiF3q0yiv+MKKumUbttIkhMWLvHwDPgMyJMFmjJ
 dJ/zcar77KgAJ0+OQWlElY20eMqPGzol9ic2N9MBCm8Birm6788mpjEFQRbLn0GnmE0XkOUil2b
 BUVUvcg7gs35n9w+rtCcDeGZMTO9EG3/RPcjdfOJK6KADND5ORzstlA=
X-Google-Smtp-Source: AGHT+IHvBlod1pkJw10aQHQrG86Fi2EEBp6YSNzxpf9e12mSMr5JonSFKJnSWwwtonYNgmz9E9B6Zw==
X-Received: by 2002:a05:6512:238e:b0:544:10c7:2458 with SMTP id
 2adb3069b0e04-54518168e47mr1269966e87.44.1739373308593; 
 Wed, 12 Feb 2025 07:15:08 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450c721612sm1037578e87.216.2025.02.12.07.15.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 07:15:04 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-545064389d3so4493439e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 07:15:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWp+phF56TiIFz3eAO+4bjCmsQ6lTo237TNqMAV66FDfPDQ4FCWG5KL3N9Ksj6uL2bo0bSy7KIN6ao=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3a82:b0:545:191:81db with SMTP id
 2adb3069b0e04-5451816b6f5mr1124828e87.50.1739373303596; Wed, 12 Feb 2025
 07:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-35-35dd6c834e08@kernel.org>
 <CAD=FV=WXkqfWoAiqbsfWiJo259oQxMV0UrQsX=qD5nVH=Dmaqg@mail.gmail.com>
In-Reply-To: <CAD=FV=WXkqfWoAiqbsfWiJo259oQxMV0UrQsX=qD5nVH=Dmaqg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Feb 2025 07:14:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UpiZxbeu9kF=bRfC=+YZmDj3qM+kSo5c7oRxaXTPDi6A@mail.gmail.com>
X-Gm-Features: AWEUYZmCbXkwQXYOuxiuptXgxJouhwsR1MuVeaed67REZjmWnZsAiLDy0PQkoNY
Message-ID: <CAD=FV=UpiZxbeu9kF=bRfC=+YZmDj3qM+kSo5c7oRxaXTPDi6A@mail.gmail.com>
Subject: Re: [PATCH v2 35/35] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Boyd <swboyd@chromium.org>
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

Hi,

On Tue, Feb 11, 2025 at 2:16=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Feb 4, 2025 at 7:01=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> >
> > @@ -374,12 +377,15 @@ static int __maybe_unused ti_sn65dsi86_resume(str=
uct device *dev)
> >          * panel (including the aux channel) w/out any need for an inpu=
t clock
> >          * so we can do it in resume which lets us read the EDID before
> >          * pre_enable(). Without a reference clock we need the MIPI ref=
erence
> >          * clock so reading early doesn't work.
> >          */
> > -       if (pdata->refclk)
> > -               ti_sn65dsi86_enable_comms(pdata);
> > +       if (pdata->refclk) {
> > +               drm_modeset_lock(&pdata->bridge.base.lock, NULL);
> > +               ti_sn65dsi86_enable_comms(pdata, drm_bridge_get_current=
_state(&pdata->bridge));
> > +               drm_modeset_unlock(&pdata->bridge.base.lock);
>
> Oh. I haven't tested yet (my device is at home, but I think there is
> an easy solution to my deadlock problems. Drop the modeset locks here
> and just pass NULL for the state. We only end up here if
> "pdata->refclk" is not NULL. Then we only use the passed state if
> "pdata->refclk" _is_ NULL.

I can confirm this works. At the very least I was able to boot up both
with a hardcoded panel and with "edp-panel" and both worked. Seems
like a good solution for your patch.

Long term we should probably get rid of the support for working
without a "refclk". It's theoretically possible to use the hardware
that way and some super early prototypes I worked on used that. ...but
it's a bad idea and I'm fairly certain nobody is _actually_ using it.
That means that the code for handling it is likely not tested and may
have bugs.

-Doug
