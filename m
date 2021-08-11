Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8C03E9B04
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 00:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4167E6E1F2;
	Wed, 11 Aug 2021 22:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9476E1F2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 22:43:27 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 y23-20020a4a62570000b029028727ffa408so1183658oog.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 15:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=04cS4A0eo56m0oGnqXAn6XieM9vnDgHVg0ePStjOpRE=;
 b=Ny9jH+ZqN70nJmx35HOVsWRmUNHLTcIMbQ4OPBPxuVKg1AXmmD/J3JYkA8clW6Fu1S
 AK1RB1feliPJZzwB/Fmg/QX9YE6IPSMl1qQDZSOKssPiRCEha+1pTe3RahhLJCFXvA8x
 CNOvChGVdULSIY3++xOU1GoO5GVwzPcJ2C2ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=04cS4A0eo56m0oGnqXAn6XieM9vnDgHVg0ePStjOpRE=;
 b=cJcvPXoRwU/5fkNFD9NiJdPTecrFWEWSwjGse40OeS0P26FJFS2kNJZGvTvDsTWfjU
 5dgW3KY29EuyOJ1f2DpHyVY+COePQDPYb84euxpchyhqmRPE9I+wRuTmhnicXT3LhpIi
 2BxTiVmLST2eMMYfGcnzKPaaN+24hZKuVBcS6l0aTbNaq1MbMhNTkOZUPhaqptpGVcf+
 gbW79RfjzG4KxYbbItndwQNHjfvwA3eBvSbVXH+538V8/8lHiYh8oiX7bmuPqCT6GV+O
 yDE9CGFNmSsAJ2gbTrHRE7NhpXA9xWvLEIqRCeYRAz6IaPghCsy/s3L4YsyuNMHyKu/0
 pzqA==
X-Gm-Message-State: AOAM532gVQblSYti0OASiMjue+nwqOO+pBpPyuA4mWg43GshAkS+Zwk6
 quFOP9j2cne8gaa9CVIrJlvWmDP4+WkNu2TTcIaH7A==
X-Google-Smtp-Source: ABdhPJwDBd0j6rLWyuqknaqcd4wiONq8hvPaCYnmxA5iAPWlPegrYBqNU5bWVcEIXniwp0iJ+ZQkovWKiVqeqpoxBcc=
X-Received: by 2002:a4a:3651:: with SMTP id p17mr773111ooe.92.1628721806915;
 Wed, 11 Aug 2021 15:43:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 15:43:26 -0700
MIME-Version: 1.0
In-Reply-To: <YRRR2BWZP8SlskW/@pendragon.ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAE-0n52Mw-ZzdqwKeEX2-WP6NyqdXvfzq=KeZJug9A-NiVo8aw@mail.gmail.com>
 <YRO/W8ZAuYEVs2MF@pendragon.ideasonboard.com>
 <CAF6AEGttQ6iiXSG78fksDo6utfa3VFwFG5yXkk9XEr=+aEL95Q@mail.gmail.com>
 <CAE-0n53Cc3iPvnnzDs8bV=7DrQro4NYYyzuD_9kHg+-o33u0SA@mail.gmail.com>
 <CAF6AEGs=uOC7Fb0sHJG+iR=d7ORnRhRn-K_ogrKDwzuN=9qAhA@mail.gmail.com>
 <YRRR2BWZP8SlskW/@pendragon.ideasonboard.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 11 Aug 2021 15:43:26 -0700
Message-ID: <CAE-0n53MW+_nmBcNbTVU-5LQj+a2zOFUCFCC2OAMXWTGfQP7xg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/bridge: ti-sn65dsi86: Wrap panel with
 panel-bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Douglas Anderson <dianders@chromium.org>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, linux-renesas-soc@vger.kernel.org
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

Quoting Laurent Pinchart (2021-08-11 15:40:24)
> On Wed, Aug 11, 2021 at 01:51:28PM -0700, Rob Clark wrote:
> >
> > I kinda think *all* bridges that create a connector (whether optional
> > or not) should OR in NO_CONNECTOR when attaching the next downstream
> > bridge.. since you never want multiple connectors
>
> Yes, that sounds reasonable to me. Stephen, would you like to set a
> patch ?
>

Sure I'll send a proper patch for this bridge driver.
