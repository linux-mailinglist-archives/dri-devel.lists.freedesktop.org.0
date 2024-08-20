Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5B9958CA9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 19:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0460010E465;
	Tue, 20 Aug 2024 17:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="W9jxjhd+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39A410E465
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 17:01:09 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7a1d3e93cceso635288885a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 10:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724173269; x=1724778069;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=JCcO6kIoHTHBJk3fFwoj4wvVEMn4emufplXdO/fW0XM=;
 b=W9jxjhd+40W6xQSxkheVgUkctFRGdL6YSh1xD0RI1pu5MUP8W+1sGmpCL0ucqAkk1E
 Q5gGM4PFjqGBet368wenz0k3+WU/AfZs7dUFrz99R5r+4RxjmOXItzMLiaPHk3IoAITu
 0l0BHfzfbeZrMR/tAJ8cKByXwbVHfJ/EZybg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724173269; x=1724778069;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JCcO6kIoHTHBJk3fFwoj4wvVEMn4emufplXdO/fW0XM=;
 b=OXG6vWDlEvswz6nYf8YtmPaPpDBXyzv+5ciwmxzxhkij+vbmL9D6/Q361Qv65k1SDE
 ItdZa0CD4S6qykOxu/XZ7lCury1XQlANH5NSQAdBNTmcMr5Dp5ysmzT+/gTANCKRZojl
 N6ujwNwDqwezvOgLSjq0YsbaZWkPHtqs52RPj4pP9YFp7VeW/3SaRjKrogsFWCnZDzRH
 8wRsLJU24u9mgQBc9q4Sf7OocRSIrnQwRkGWzxzBuimQNOGsNm3W4fGysrNKrRGBJ4Cu
 qd8T6TX4JMkOQXj1Qg1ZcIzmyAQsvCoir5tl2uo2eyaCGC6jpBnGuFjB9A700sB+V/lH
 Trew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwsbFLNmkDUg3I6f5mItheKRf7c6v4EHlyhQyq9fspasErKIhqACvv2Jh8vlHae9xxGYfmW8HCSZc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZc3cd9Yti82Wsv14xXZPYcq8D8az97INjq4/MBu0OLe1k30Jc
 wpCQDw4oQhgHxai3KG9yPrsPRQqUkc/JhrCNAHS2P0wIR6h0lQFiRkobwU/h3X5Z+hF6ZMQHIpw
 gXNE5bPHu3qjSXUpZmjCo0dGAk3xFpBgQxVZ8
X-Google-Smtp-Source: AGHT+IExsG5zHtAEYfaM6InbVgUuGomzcusJF6tz1OfpCX6Xn6bckfcEN/xUs+8krdfm3hDwFaOzE5atXUvwN9QFkzg=
X-Received: by 2002:a05:620a:3942:b0:7a5:1e9:7ff6 with SMTP id
 af79cd13be357-7a667c53799mr601135385a.34.1724173268451; Tue, 20 Aug 2024
 10:01:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Aug 2024 10:01:07 -0700
MIME-Version: 1.0
In-Reply-To: <ZsRs6d6uOMb4DqQQ@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-6-swboyd@chromium.org>
 <ZsRs6d6uOMb4DqQQ@smile.fi.intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 20 Aug 2024 10:01:07 -0700
Message-ID: <CAE-0n52O01UgrDT2=-JJpZj39BOJNyyQC4w_pgDUmKDmcN=8Yw@mail.gmail.com>
Subject: Re: [PATCH v3 05/17] usb: typec: Add device managed
 typec_switch_register()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Scally <djrscally@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, 
 linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
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

Quoting Andy Shevchenko (2024-08-20 03:16:09)
> On Mon, Aug 19, 2024 at 03:38:19PM -0700, Stephen Boyd wrote:
> > +     ptr = devres_alloc(devm_typec_switch_unregister, sizeof(*ptr), GFP_KERNEL);
> > +     if (!ptr)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     switch_dev = typec_switch_register(parent ,desc);
> > +     if (!IS_ERR(switch_dev)) {
> > +             *ptr = switch_dev;
> > +             devres_add(parent, ptr);
> > +     } else {
> > +             devres_free(ptr);
> > +     }
>
> devm_add_action_or_reset() ?
>

No. We don't want to call the 'action' devm_typec_switch_unregister()
when it fails because that would unregister a switch that has never been
registered.
