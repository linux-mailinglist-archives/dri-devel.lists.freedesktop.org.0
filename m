Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669A86A495F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 19:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A85510E1DC;
	Mon, 27 Feb 2023 18:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816D510E1DC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 18:14:57 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-536bbef1c5eso199767807b3.9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 10:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Rxy+Y2Y6v6pAxsX4M9bmO7HAq+Wtxptg2XOED5qngyE=;
 b=FqHD6yYPFLP+OMan9DhJ4cnOGUTo5PonZon88QuK3w5/o+shEDd0oIvGKRDxaP9lv+
 +ZTOK3gQgJ5qN5JJ1HROQgVjOXMsxv+2/hOo2H4Rss9WwrMUkcpO36KvhZMs9sxY9onz
 O8kknlZvw1YB20b6BI1yaiHRi1GJaOas0csgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rxy+Y2Y6v6pAxsX4M9bmO7HAq+Wtxptg2XOED5qngyE=;
 b=AIMDhnxOC8046et8X2+PRe5BQTFd1td12zv42LhpE/8yuqOFiRGhD+WumGATcDEf/4
 DDREmnFOAwH+tDZYXhLGqshnbYj30IXyZTJKRwvA6OEte0p9fVsb5G/VFdz2/fVCptTg
 Vr/uP2jqZDaJ/HGFKI89oXQdr98ab4SfmMHN0yI4DivtV9sI/B60VZ3iQUzRfn4LqGtF
 fKh8LvyKCioHiMqN9AqgyD46ptThAKxIkzCeFzRYpbIUwAWOv8thyyqD6aPlZ0aWJLB/
 VxPFoIzCvZmW2ES2b5uyGTDCyqMl5jIim2S1N44pi9vQd+ddwXSGaaKi9GeWsNVBceLL
 h+PQ==
X-Gm-Message-State: AO0yUKUz4OvqSZ4evCA94S2WCyyx0FeuUou/rijATryJ8rYWAT5WcyX3
 S4zbvN3ydG6t60PyNT8X8ylRb/0DVZRvryDArrQoSg==
X-Google-Smtp-Source: AK7set9Kgihi89E2kvY1iYb634VX+GAD9mflwu83cKqJpuK8Jp471A46IgTuNE7qr3UI421J2WIaCdIfoWIaiOhvYDg=
X-Received: by 2002:a05:6902:4d4:b0:91d:d6ed:6bd2 with SMTP id
 v20-20020a05690204d400b0091dd6ed6bd2mr10115318ybs.1.1677521696576; Mon, 27
 Feb 2023 10:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20230227173231.950107-1-jagan@amarulasolutions.com>
 <20230227173231.950107-2-jagan@amarulasolutions.com>
 <20230227174727.7by2awmz6pdbffo6@houat>
In-Reply-To: <20230227174727.7by2awmz6pdbffo6@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 27 Feb 2023 23:44:44 +0530
Message-ID: <CAMty3ZB+d24DPJTqds9s=0EYBggZZX_9SMwtPfgw0vF0N-m4KA@mail.gmail.com>
Subject: Re: [PATCH v14 2/3] drm: bridge: panel: Add
 drmm_panel_bridge_add_nodrm
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 11:17 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Feb 27, 2023 at 11:02:30PM +0530, Jagan Teki wrote:
> > drmm_panel_bridge_add_nodrm is an another type of DRM-managed action
> > helper with nodrm pointer.
> >
> > DRM pointer is required to perform DRM-managed action,
> > - The conventional component-based drm bridges, the DRM pointer can
> >   access in component ops bind API.
> > - The non-component-based bridges (like host DSI bridges), the DRM
> >   pointer can access only when a specific bridge has been found
> >   via bridge->dev.
> >
> > This drmm_panel_bridge_add_nodrm helper exclusively for the
> > non-component-based bridges.
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> It's the third or fourth time I'm telling you this, and second time
> today.

Apologies for this.

>
> You keep respinning that patch, but the issue lies in the samsung
> driver. Fix it and you won't need that helper.

This is where all get' stuck. You mentioned in a previous e-mail was,

"I'm not quite sure what you mean. You shouldn't retrieve the bridge from
the attach hook but from the probe / bind ones. If that's not working
for you, this is a bug in the documentation we should address."

If I understand correctly this would be the third case from the bridge
documentation
https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#special-care-with-mipi-dsi-bridges

"The upstream driver uses the component framework and is a MIPI-DSI
host. The bridge device uses the MIPI-DCS commands to be controlled.
This is the same situation as above, and can run
mipi_dsi_host_register() in either its probe or bind hooks."

But the problem here, The samsung-dsim bridge common bridge across
Exynos and i.MX8MM.
So, the
- Upstream Exynos is component-based and
- Upstream i.MX8MM is non-component-based

With this dual scenario, retrieving the bridge pointer in a bind will
work for the Exynos case, and retrieving the bridge pointer in bridge.
attach will work for i.MX8MM. This is what I mentioned deadlock
scenario in a previous e-mail.

Hope you clear the real issue now.

Thanks,
Jagan.
