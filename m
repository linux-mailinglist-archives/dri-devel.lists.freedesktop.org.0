Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A5C9ED841
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 22:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99AC10E62E;
	Wed, 11 Dec 2024 21:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ikT9O01w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FF310E62E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 21:17:08 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-6eeca160f14so61661827b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 13:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733951827; x=1734556627; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vbOAZlNnNpVSTQN+1o758lLTB1uimwZrSwxfkYzKt/0=;
 b=ikT9O01wA9fv5thzjQ2GgzSkvAktqxbLSenlbiSSWX09/Sc00kmplDcH4M1Pfp7Zoo
 YRCBXW9CshhzCnU1fgZvcF5Ag1AFa0nL7FI+JRCvRC6Y5G4272u1NFxHenSI4EwOoDtY
 fmqapGhFnu5+TbIOLvEK6vEmwZzmb+14gZVn0E/YM2N4B9Whs0E8ye/fmDnl+QSZPT5p
 PgHK6fVHxMmEAh2nhfe3jX19BJ1VSBE8e8Z9SJd9pZqZUEcKEikcB2Fl/qdFg72/50AG
 RKnQQsQu7lkgkOYe2tE3n5/VYqt3Gfp57XZ4t1889J36rXqwxcRty2NDaLbh5uLFewEQ
 B1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733951827; x=1734556627;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vbOAZlNnNpVSTQN+1o758lLTB1uimwZrSwxfkYzKt/0=;
 b=RJHfrqsOSjg4K415uLd+Dbrp/ThxEgWDzdwKoEBwfH9avBocTRjD8h4bxFfbHJ5o2u
 Z7YIXJUnYg3CYi6oz859zvWTuardbWju0oylhNq7pJ5CIe1eUpRNmggTEwvXAbVhLWp4
 /KSX8knP/hq5cZxZJMkgFhGO24WWfnaRWFaqzfKIPb/l2tifBjJVUh8CVRJH9mBDjHLU
 XG8wFVI51KCekY1oeFYFgR3rgpGkDVfaCwSIDJNgnXRiCsr4R1Kcmr5tPBjotrSxTMm1
 l6wxvZsIHQg3XSN5O6bidVYhSvPwjOIgPtMQ253VaaqdY2jSoINdBzMBfR/wnqP9Z445
 V8FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX5dxVFfw8mQ+FHmt1Z//sxHZIVvmd/VWQT8tNDt5LXf8YLuJEJUSpa8vlGCpbTOAEdg6vgQmrqh4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1bcZUaxRxu17Gn7fxGOrksLwUQD20BmgoSHALPs1+tvxU+lrv
 JsybdGkvzavTI3sHCysJCkTaFfGR8jsTytfmqJON6frH5cKFyekj69AlkECydMVjVuIOeOi8F8D
 cSaZVFcYqNuQ1FezYf1+BpJjoRgP5/95ZcEiXOw==
X-Gm-Gg: ASbGncskN5+xGFMjR4aOGKRI2OQzqeQtV+UmfhfztCpzQPks4LTDfJlw5ZWqdM1Nnoy
 n+QSYAXeakE7ZDEE+zTpXn4a7C3V1JM77L3RG
X-Google-Smtp-Source: AGHT+IFfEcADkSKdG/yxS4NVADevkh5d06VtG5D2MymFrYSLQArMJkdl7zeaP7DPQ5MsRfbOG1YaN86DJzP4pureEqE=
X-Received: by 2002:a05:690c:6f10:b0:6ee:a89e:af3b with SMTP id
 00721157ae682-6f198a3ce6amr10757187b3.9.1733951827476; Wed, 11 Dec 2024
 13:17:07 -0800 (PST)
MIME-Version: 1.0
References: <yk3xidaisbd56yndaucax7otijjauqmm7lqm6q4q633kdawlqo@qaq27lwxmvwd>
 <gstohhcdnmnkszk4l2ikd5xiewtotgo5okia62paauj6zpaw7y@4wchyvoynm2p>
 <CAE-0n50z6MNa7WOsg-NU7k8BpFeJJyYfHX3ov6DsthLWauSNpA@mail.gmail.com>
 <hqmx7jtkvrwvb27n56hw7rpefhp37lhr3a5fawz7gsl76uuj5s@h7m6wpdhibkk>
 <CAE-0n50y1O2C47zOGJPmMjKXK_m6a=jhpEAP4nW+RymZbo2xyg@mail.gmail.com>
 <5kisfv22tgqwzjpxqrbx56ywr7l4r7pny3pl2r7crv4rijqbwk@azricdasttg7>
 <CAE-0n50Bxi2GfnxOmMwe-F+k5jMSiyAVPDb6K8pYm-i6hpJTOA@mail.gmail.com>
 <cartdeijkv6z23dgm7uif4lti3lahfqmuyxcmruzqbefhsp6yk@m6ocjhncs2ko>
 <CAE-0n51-QLLje0f7T4p3xK6Q-FRk4K0NUrVVm4cxkKoevuzktw@mail.gmail.com>
 <kidsjzklpxvvamct3glvoawavoi5mjuyh3on5kbtfp6gavwxxn@eack224zuqa3>
 <CAE-0n52F+cvVyXm8g8idN2eMfx4bpaEpWQRchr8=AO87N7E3fg@mail.gmail.com>
In-Reply-To: <CAE-0n52F+cvVyXm8g8idN2eMfx4bpaEpWQRchr8=AO87N7E3fg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 Dec 2024 23:16:56 +0200
Message-ID: <CAA8EJppVgw1Qb4kGY1Y-A3-KrinKfX2zGUuwMCY_-gG96fgocA@mail.gmail.com>
Subject: Re: [PATCH v4 15/18] dt-bindings: usb: Add ports to
 google,cros-ec-typec for DP altmode
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, devicetree@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, 
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, 
 linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
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

On Wed, 11 Dec 2024 at 23:11, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2024-12-05 10:47:08)
> > On Tue, Dec 03, 2024 at 03:50:58PM -0800, Stephen Boyd wrote:
> > >
> > > The easiest way to imagine this is that we took the usb-c-connector and
> > > jammed an HDMI dongle in there with some glue so that it can never be
> > > removed. There isn't any USB going there either because it can't be
> > > used. I suppose we can continue to describe this with an
> > > altmodes/displayport node but then add some compatible like
> > > "usb-c-hdmi-connector" or another property to the altmodes/displayport
> > > node like "type = hdmi" that signifies this is a connector that only
> > > outputs HDMI.
> >
> > Does that DP-to-HDMI bridge talk USB-C or just pure DP? In other words,
> > will it be properly discovered and handled if we just leave it as a
> > weird usb-c-connector (maybe with an additional annotation, we have
> > USB_PORT_CONNECT_TYPE_HARD_WIRED for USB ports, we might have something
> > similar for Type-C connectors).
>
> It is pure DP. Maybe we can have a google,cros-ec-usbc-hdmi compatible
> string here because this is a weird design.

Just google,cros-ec-hdmi for the corresponding connector?

-- 
With best wishes
Dmitry
