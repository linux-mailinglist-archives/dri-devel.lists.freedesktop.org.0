Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BAA95D805
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 22:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A469E10E072;
	Fri, 23 Aug 2024 20:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TwraJNs8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C3110E072
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 20:47:56 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-26fde6117cfso1836717fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 13:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724446076; x=1725050876;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=id4PXH6g6b5ygcEfz+3/ImyFmiTcss8b3qGEx/u76XI=;
 b=TwraJNs8TSGcs8v6PFwm35V9r8rN7FV46aNKynFt58MMI06b4IqpU1WrSLTJYWPuQw
 NC0tmFlvzjliR6/ToUnnkD2QB1yTIcGj5Rgm2FXfJmswAPhDUIn+hE4SLWP3dIbST22M
 gOf7rgCEIPbH8qTMsKtGsnZ7MPhqegg2czsXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724446076; x=1725050876;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=id4PXH6g6b5ygcEfz+3/ImyFmiTcss8b3qGEx/u76XI=;
 b=cK4gcXDhOj79kBXXdJDsr0q5InFNLGfCb8/0TavnNFX2t/ud0rGgFVky5hV5u1OiXf
 ONF6R2LytEBHA2q8Jijf0nZeXkDpKM2pzMp1G1heSdKezUYEfka8Kt6c9OmhYFjx0Mgy
 k3OqXFUV/Fub04eb+ge3zz5WTv0WITyVgrPVKRE6Be7xjlWX3C8FDnUpFGqYbuohPitm
 VaZrZj/x3CyzDuvfoqn78/K6v8eT9onpIkow+UZC10Jx/uWEKTUn1C6cs5FS2+0QX27F
 eSoZk5eEoS0qOK/DFnDdY46aw61JeCj7khWi9nK47VkMTxDttO56bAHzjimv6KZM6FoI
 F5sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWhOUM3sVQzBrmi1GQ5LOdHFYqAhAboQqbSB5uiVJba7DOCenZzGJK0gE+FAbRip3zdVzYXoWZyy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk2hMxj6wAqS4wR9gKSHqTuuJ3Sea5qpM+lV68JZ/tpnXYry2c
 h2u+wH9ywwyuGSpkpUSxkv0HHYBPOZ6kj2Qk0kBaLJxh/15FjWnWdJa34yar+Nw3BFensU2sp1B
 4KaCtMkIEt3o07J+Xr1VGwv8EFxiomwEvD1PL
X-Google-Smtp-Source: AGHT+IFTlK1vgqPsQn2j9voF5J39I5gTTTzWpu4wouRlEDJLxZNqlw4ZgBfIqTn3IqcZNBM8n7tlqF0zt3kueWkW4Ac=
X-Received: by 2002:a05:687c:2be9:b0:265:b32b:c45f with SMTP id
 586e51a60fabf-273e60835d0mr3142337fac.0.1724446075865; Fri, 23 Aug 2024
 13:47:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Aug 2024 13:47:55 -0700
MIME-Version: 1.0
In-Reply-To: <ZsdMd7Ywa2b-GDT6@tzungbi-laptop>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-14-swboyd@chromium.org>
 <ZsdMd7Ywa2b-GDT6@tzungbi-laptop>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 23 Aug 2024 13:47:55 -0700
Message-ID: <CAE-0n53zPV8QHf7DxSDO8E4-kvsP=unFvevjo7i1ZjE1v6UgAA@mail.gmail.com>
Subject: Re: [PATCH v3 13/17] dt-bindings: Move google,cros-ec-typec binding
 to usb
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, devicetree@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, 
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
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
 Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Quoting Tzung-Bi Shih (2024-08-22 07:34:31)
> On Mon, Aug 19, 2024 at 03:38:27PM -0700, Stephen Boyd wrote:
> > -title: Google Chrome OS EC(Embedded Controller) Type C port driver.
> > +title: Google Chrome OS Embedded Controller (EC) USB type-c port driver
>
> Given that it gets chance to modify, how about s/Chrome OS/ChromeOS/?

Sure!
