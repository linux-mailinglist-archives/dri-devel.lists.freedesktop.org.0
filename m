Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4633B96AC7F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 00:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5471C10E618;
	Tue,  3 Sep 2024 22:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BWji1Kgt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7062910E618
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 22:49:24 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-45685a3b1d8so1193571cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 15:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725403763; x=1726008563;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=uhkZOEeJ95CcasGDNkmg/phbGBaUk1oIC37JjrClemw=;
 b=BWji1KgtpkHdsfKx60hBlF2PLv4A61rdPp0hgdyPg0+joxZzT22gf5R/R8zvPU8biK
 863PQ/NSqdO0HfUtxooH9qcVtd72PhUACpkxvdayU3I5ZmVCfCJDuoGXz+/xHtaw9EEh
 rNuYzl35QA60+TF8Bj5eNVhStLBqgdbn4kJhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725403763; x=1726008563;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhkZOEeJ95CcasGDNkmg/phbGBaUk1oIC37JjrClemw=;
 b=pXrY7IQQzy4fzL+byRUmwiewFUEsGCKj1S8A0swlG8c87p5aHmJ+IVSsH4CWqkCMeD
 4/ygrWzYiNL3vX20/dw0AEJmbBED5Q9ZtZw0Qle9tufkiWcDQXIpnXjmFNE0IgEaTz/G
 NMSDwSTZrJfoM5GAhA9qANAi814arrkpwcW1U0GCI238a8UDEGw6rPmyV12SeJnvVOvE
 NaX0hOLVo405JhLhOc41gj1I/nywXF27hJ8HHhhVZsMzO9EkXqEqfrfGkzUtYlNIltR5
 fDcn35ewWtHRFi6ngscpMK/vL2iVBbbqvXp5EfF98U9jNoenoAwEcfDG8ucsKERM/VdI
 olpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc/hLbB2nj/1JA32h7MI/8L6YatSbI3EKtq43g3N9VxqlnRMMDGMxNH0YYiFLayhHJ5K5ICY2cMd4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBFHFqZbyetKHHyWejEjrLj7glPdmvYaYgM5W8Wcw5S+kurGV9
 BL4dmN/YgDQ1JkEVoRYFXiA+DR+6diyYgOjfX8mpk9huteK61Ak/fE227WvxGmYeFO/s8Cu8xWD
 8mbVmxjYphUO5igAT8EC1sBSpi5cxG2BWVA89
X-Google-Smtp-Source: AGHT+IF34ocTupB91QqHAUN7muZ3pQu7SJrIS8QiPpHwQnzTFwdvCLem6xytcCmScWzLqSwtal0se6zIR4RyUsc0prs=
X-Received: by 2002:a05:6214:1c44:b0:6c4:d2f9:644e with SMTP id
 6a1803df08f44-6c518e03025mr2177666d6.12.1725403763196; Tue, 03 Sep 2024
 15:49:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Sep 2024 18:49:22 -0400
MIME-Version: 1.0
In-Reply-To: <ZtWdsZrFxfjYLgaG@smile.fi.intel.com>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <20240901040658.157425-12-swboyd@chromium.org>
 <ZtWdsZrFxfjYLgaG@smile.fi.intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 3 Sep 2024 18:49:22 -0400
Message-ID: <CAE-0n52Hupp-ANE2ggeGCRZSM+xmrJt-Q5+5Cb7=C-mxykbz0g@mail.gmail.com>
Subject: Re: [PATCH v4 11/18] device property: Add remote endpoint to devcon
 matcher
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

Quoting Andy Shevchenko (2024-09-02 04:12:49)
> On Sat, Aug 31, 2024 at 09:06:49PM -0700, Stephen Boyd wrote:
>
> Is it possible to move these Cc:s after --- line below?

Ok.

>
> >  /**
> >   * devcon_match_fn_t - device connection match function
> >   * @fwnode: Remote connection's device node
> > + * @endpoint: Remote connection's endpoint node
> >   * @con_id: Identifier for the connection
> >   * @data: Match function caller specific data
> >   *
> >   * Implement a callback with this function signature to search a fwnode's
> >   * connections for a match with a function like device_connection_find_match().
> >   * This function will be called possibly multiple times, once for each
> > - * connection. The match function should inspect the @fwnode to look for a
> > - * match. The @con_id and @data provided are the same as the @con_id and @data
> > - * arguments passed to the functions that take a devcon_match_fn_t argument.
> > + * connection. The match function should inspect the connection's @fwnode
> > + * and/or @endpoint to look for a match. The @con_id and @data provided are the
> > + * same as the @con_id and @data arguments passed to the functions that take a
> > + * devcon_match_fn_t argument.
>
> So, struct fwnode_handle is a single-linked list. Can we utilise that instead
> of adding a new parameter? I.o.w. do those objects (@fwnode and @endpoint) have
> anything in common and can be chained?

No, we can't use that. We need to know which endpoint in the remote
fwnode is connected to the fwnode we're searching from. This is how we
know which typec mux structure is associated with which type-c port so
we can drive DP there. We might have two endpoints connected to the same
fwnode and then we wouldn't be able to differentiate the endpoint and
the typec mux to configure.

>
> >   * Note: This function can be called multiple times.
>
> What does this mean? Is it idempotent? Or what is the effect of being called
> multiple times?

I've removed this note now.
