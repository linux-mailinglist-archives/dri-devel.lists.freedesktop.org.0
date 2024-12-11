Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D029ED831
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 22:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DC410E626;
	Wed, 11 Dec 2024 21:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KE+PA0/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D30710E626
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 21:11:16 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e387ad7abdaso6084105276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 13:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733951475; x=1734556275;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=fL4AZO7DuUqncD1hviX7Ju8fEoY0KFiDTXpqXPG3i0I=;
 b=KE+PA0/k8tgD3ZvDfILANjaFrqvcQ5PNhBojqj20BC7Uz73CFC8NJ1t/n/nn6sC9XU
 MjaokakvW7hlV6wdROJGm+6t2+JQmY9jYvFTQUwYcvhpfGfQxHqVlVAh5oXp4mdBSvGH
 tNgk3NEmA5oc6Z2ShO2GWTZup6r/zfegaMDQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733951475; x=1734556275;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fL4AZO7DuUqncD1hviX7Ju8fEoY0KFiDTXpqXPG3i0I=;
 b=BNmydyTViuNwyBwFOV4pGqK50yg3zNOeC5L9Il9B5KsKEpkLAcB0hXaReii7Gkfib3
 Uood8KUhTPTsA8KCs0bNyHNOxLkLwdPXzW0YJJGbEuUBRevGb+T8wxRGMZV2JpNE3odv
 WtnSsqSoDXDTmqD/xMd/ADxUqYjDeY4u0AeOWydbt2V5Sbr40DVDyyHzYBTEj6p5s7dX
 7RYiPLwd3fjNoEy7/icqUTJurkPpk6ogLkzfhpDAIeSDN9WH9sG0CVMjPb6baWkOEYcU
 rTzFfhF9wn3cykq5hhNGJrZXVNiQjolovhWfBsPKT2A5Kf66hKIRD+l5dy245xexgNeG
 sw3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOO+Pecv27USGf7Kt7VFWUebDoL0DtHGmEUxbjleW/TbvurlYZVGSrJApwZjESG9hriZXQ62/WcWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUiF2wYNUrda8ZOnu08yV2heIWNDuOjZJv2QfwrbZrdFMjd6HN
 a4o3W3DHSCRtvanhSIrOgYPRpQqhGXvApojgRl2lXmac00MrWoWfNUb20sKF/MFf0DAV/l0ja6L
 T3T+RVILD7j3hbH3dcZ5uz2Z628eOW6YIXqF2
X-Gm-Gg: ASbGncuCl9YzVAzTGVjUzE9clWCaUioICtUrybWm60OC7qUbSReag1QHOseg/BQVs/3
 Qs9J9TsVbpbq4SljXHl1/yWU97X7kk8QL8j2D5jxnuRhEs2rDh44shOIXBCQPQmk=
X-Google-Smtp-Source: AGHT+IGR6ED4gGgHGmi77s2dwB+gnLghGdTv2zo6xXg1u+pxnZVS/4VVQlWKhmq+504JY9ZZ4GSEuX2qWpyqxoxUo7A=
X-Received: by 2002:a05:6902:1b87:b0:e39:7a24:a5c3 with SMTP id
 3f1490d57ef6-e3da1eed190mr753786276.32.1733951475289; Wed, 11 Dec 2024
 13:11:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:11:14 -0800
MIME-Version: 1.0
In-Reply-To: <kidsjzklpxvvamct3glvoawavoi5mjuyh3on5kbtfp6gavwxxn@eack224zuqa3>
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
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:11:14 -0800
Message-ID: <CAE-0n52F+cvVyXm8g8idN2eMfx4bpaEpWQRchr8=AO87N7E3fg@mail.gmail.com>
Subject: Re: [PATCH v4 15/18] dt-bindings: usb: Add ports to
 google,cros-ec-typec for DP altmode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Quoting Dmitry Baryshkov (2024-12-05 10:47:08)
> On Tue, Dec 03, 2024 at 03:50:58PM -0800, Stephen Boyd wrote:
> >
> > The easiest way to imagine this is that we took the usb-c-connector and
> > jammed an HDMI dongle in there with some glue so that it can never be
> > removed. There isn't any USB going there either because it can't be
> > used. I suppose we can continue to describe this with an
> > altmodes/displayport node but then add some compatible like
> > "usb-c-hdmi-connector" or another property to the altmodes/displayport
> > node like "type = hdmi" that signifies this is a connector that only
> > outputs HDMI.
>
> Does that DP-to-HDMI bridge talk USB-C or just pure DP? In other words,
> will it be properly discovered and handled if we just leave it as a
> weird usb-c-connector (maybe with an additional annotation, we have
> USB_PORT_CONNECT_TYPE_HARD_WIRED for USB ports, we might have something
> similar for Type-C connectors).

It is pure DP. Maybe we can have a google,cros-ec-usbc-hdmi compatible
string here because this is a weird design.
