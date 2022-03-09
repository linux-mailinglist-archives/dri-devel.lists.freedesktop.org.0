Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968C04D2FBA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729FF10EA23;
	Wed,  9 Mar 2022 13:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E25710EA23
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:11:52 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d187so2238757pfa.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9k5ASJ+8ZwpoiVsY+cd28Kwawdvc5Dokf8I22Nf6p8I=;
 b=lmlcLNySJRwwAdyMM0kUOmPqt2QWeDfkjqv+aXCn2rZMDT9CzciavDhBp7tZUYm7Jj
 prwcU800WohbtViLYYMo+sUyXDhtC+PtIGLSsOquAX9MDwgdiwbV7nLgjziSj/sEEeCb
 AxGlx4gwYnHjTuupqg3Mne5YjIIzmmELU9kS7+NvvYCYG6/KQQd+BiZEERCH3snb87AJ
 OsU7D/y/Eks4BjRZQVJY2LcxzsbKv8jZxkXIK2nnmUpfzPvmlEKSv+GbzFeqsxBZAIK4
 1DPVY846LTA+vzKyY08LKAF6yCpnAjfpHMD6F7aEat6MNsS/3e8SAG4lzbxoeLSGh+wo
 CvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9k5ASJ+8ZwpoiVsY+cd28Kwawdvc5Dokf8I22Nf6p8I=;
 b=09vTR4A+2rgbz7wGgQmnfR/OZNtY0IrqAUCrieITZpbvndOPem5R6o5zuA9Mkxk+i2
 sq71rcrsCPUJ4vy9YwLGAIOKwUXRFttgqBkgDf5i1qWo3IbD/0gCE9WlrdXsH/+at2oT
 fidgrr/8L7tIHgoYPFoIWa4bXmtmI/zPK2wk0ourh7HYdX0GuJGBgdhOIBJbdFeQQ1us
 XxtpmKNtgEj8R3pi9uwNhFuYLYLv0gXaJCW9LAHMRRD3312TbOoS7D0CWi0fR+2zAMon
 DIS0ciCARIzcqCq5zXLGhqzON5qiczrJP6LRFDMKf+oKX6q2bqKBI5TL0v+EhwfnvQty
 ofyg==
X-Gm-Message-State: AOAM530xe7k0hnY27dpg6eWYHBzP126wHRV8iL/+O1nLxQQ7WvaGUMNL
 acyvitEeWnm8fYF7pwyFmddYRtMrqn1agHhwoHn0Jw==
X-Google-Smtp-Source: ABdhPJzJoBIea+ONqm7kG9R7LfL08H6VWsuonLa9GEaUO3s9YMjVHyIroXpOU2frJd/1BU5OWyZkaQgl8T1hFZEM6qg=
X-Received: by 2002:a63:105f:0:b0:37f:f637:7adb with SMTP id
 31-20020a63105f000000b0037ff6377adbmr18085281pgq.201.1646831511832; Wed, 09
 Mar 2022 05:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
 <9fb21623-60e1-fe35-b740-9577f096f84e@baylibre.com>
In-Reply-To: <9fb21623-60e1-fe35-b740-9577f096f84e@baylibre.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 9 Mar 2022 14:11:40 +0100
Message-ID: <CAG3jFyvS_bRNs1tBxbEyH6VDP4OoitoyAeOusUqEckT6LRxuUw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: Add MAINTAINERS entry for DRM drivers for
 bridge chip bindings
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Mar 2022 at 09:04, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 08/03/2022 20:06, Douglas Anderson wrote:
> > The bindings for bridge chips should also get the same maintainers
> > entry so the right people get notified about bindings changes.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >   MAINTAINERS | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0216d2ffe728..a73179d55d00 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6403,6 +6403,7 @@ R:      Jonas Karlman <jonas@kwiboo.se>
> >   R:  Jernej Skrabec <jernej.skrabec@gmail.com>
> >   S:  Maintained
> >   T:  git git://anongit.freedesktop.org/drm/drm-misc
> > +F:   Documentation/devicetree/bindings/display/bridge/
> >   F:  drivers/gpu/drm/bridge/
> >
> >   DRM DRIVERS FOR EXYNOS
>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Acked-by: Robert Foss <robert.foss@linaro.org>
