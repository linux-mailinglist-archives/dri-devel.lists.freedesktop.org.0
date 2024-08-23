Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C44495D7FC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 22:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F80410E06F;
	Fri, 23 Aug 2024 20:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="O1R23ACm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0D710E06F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 20:47:25 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-27032e6dbf2so1584688fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 13:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724446044; x=1725050844;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=qZiKFaKcOy5uMCUP9iI4bnV8rWlMx58uhQ+Bp65JxBY=;
 b=O1R23ACmltVpOsof6CRsAk4l4BNX8yOVs2D6r6L9s/QQ6J8zUlspUk2ZrRR7QM20B7
 BVOMpf5wBPAHXmn+Ygp7YJh6+qCDktpeevxBCeVb4NSg9LqRlf5yYgbIF+BHpWWAZ7h+
 8LJZwhu7TsfPEEmoncVOajQVckhZnId3WDvmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724446044; x=1725050844;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qZiKFaKcOy5uMCUP9iI4bnV8rWlMx58uhQ+Bp65JxBY=;
 b=Z/9zlDtCw4hErfKK5gUUgMrjUa5TsJAD9kkdlIft72i/RM3ZM7swxI94+Wm0GiOiIN
 wIjhRqnN/p/CsWQ65wiTgoeVAahhPvU4FFWhJK1ha+AXVPhIqDxX9FMnuMHgC3wp8Q9B
 5nrVmjd5phJmjq4d4zMkrBMJmQUSEqbJVrD6d2M8IeA+8ELZ35PtyVV0Wr3uhxJSXc9T
 FyuYakUNSINRLG9fADm+S6TnDO/BO80EYkDcwbKSRQiu3OUpfV4EMQIAFdjD6z67aq/W
 F6nKYNjMz1muG1NMgrUm112evcWj7TrmsfHHvOzUGF+bkxCd+nDiusYAgLrFeiXDEaoB
 /BMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnJLkj2otESSpRBmb6M3fAXS3aV0rCRNfe8LA2o7XafpeJrWjjvLa4zCPgXjOvm4s2Au5r/Fk+NLc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUYFt+JaYGKY/U1ZC6MSs/cwPTbKLze0J3ibyI+0KFPvK7Vfhn
 xz49ZIsJIa6LrrHM3RVDGhwawrSIpZgEXEZnaIZj6nHVKwtp7l5x2iaDOzY/jzBqxvLKc6CQYgF
 xeFszki69R+f5IVhkuaDbaOjG9bmL0OuGMh1A
X-Google-Smtp-Source: AGHT+IGtmJ+gyuELHaRH+RZ4qvsU8Rp6JLHoxTqxGD2FO8wzaNQZtxGnVU0BhE1HT6iEWRSosj9gW6Yp+4g8GcNpGbY=
X-Received: by 2002:a05:6358:248b:b0:1b1:aca7:dad6 with SMTP id
 e5c5f4694b2df-1b5c3a4e8abmr336937055d.11.1724446044234; Fri, 23 Aug 2024
 13:47:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Aug 2024 13:47:23 -0700
MIME-Version: 1.0
In-Reply-To: <ZsdMoRpwv5twOwqx@tzungbi-laptop>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-16-swboyd@chromium.org>
 <ZsdMoRpwv5twOwqx@tzungbi-laptop>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 23 Aug 2024 13:47:23 -0700
Message-ID: <CAE-0n50MVaU2dmRLdLVFWT9KWPO_BK-L7eEqGRSb8TKm1KtPNQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/17] platform/chrome: cros_ec_typec: Add support for
 signaling DP HPD via drm_bridge
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

Quoting Tzung-Bi Shih (2024-08-22 07:35:13)
> On Mon, Aug 19, 2024 at 03:38:29PM -0700, Stephen Boyd wrote:
> > +struct cros_typec_dp_bridge {
> > +     struct cros_typec_data *typec_data;
> > +     struct drm_dp_typec_bridge_dev *dev;
> > +};
>
> It looks like structs are all defined in cros_ec_typec.h.  I think this struct
> definition can be also moved there.

I put it here because it wasn't used by any other driver. Maybe I can
skip the entire struct though and add what I need directly to 'struct
cros_typec_data'.

>
> > diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
> > index deda180a646f..73d300427140 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.h
> > +++ b/drivers/platform/chrome/cros_ec_typec.h
> > @@ -27,6 +27,8 @@ struct cros_typec_altmode_node {
> >       struct list_head list;
> >  };
> >
> > +struct cros_typec_dp_bridge;
>
> If the struct definition moves here, it doesn't need to declare forward.

But then we have to forward declare 'struct cros_typec_data'? There's no
escape.
