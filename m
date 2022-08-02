Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D766958758B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 04:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D84910F0D8;
	Tue,  2 Aug 2022 02:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269FE112FE4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 02:29:53 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b16so8429284edd.4
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 19:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Saw05UbzeLU4x42pdH6Ov1+fGLmaoiI2fVR2aA4FGOI=;
 b=PuWABKd9mqgWfOp3GFE6NSnZwEdPEog9wdEbqUKAbcfJgAT5VVgPyUkUhkZ5akacVt
 pzc7EY+92Mp8v4kT0hDpUhWsy/bfeqeseMPsaCqgLFsHfHWWqf77H7jrG+8foGShZDn7
 BrlHtFb1POlCymwP5emBo6OPa0Qo0qFYHetX9oup9YlBQaYhP6YcaPJf8aVG8QxzeRfT
 vZpvqfF4r+V75F/uQ4b7j/2ApDv5c+9DY9fzZZkywjp6zH8fTjxSVkAu0tNyBOSUegeM
 sGF6IoQUSWdcTBI2inVPRxSID2rKZVXPhw1LYzlHywbUQhx6CZ+yOzWDU7I7fzY5VEsP
 5ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Saw05UbzeLU4x42pdH6Ov1+fGLmaoiI2fVR2aA4FGOI=;
 b=qT9ZWzKPctycedSW1kHC156KlFGtXhgAdWAN/A02I6wCCu/sKYUWWaZdEcz1419UMs
 lxeQcebcyTYuwGHNWG2UvnxLVi3WsVsuNag+MneqWpqFxs0dIRLOrvLi6Soqa3pTqyZe
 cOqGsHPAWMDXO262Hrf3QLc4+uwYIW0nfbo4SrDuxRU2vxzRh0eaP0uVQC/lr7rVRiuj
 XgAJAQiTa2O3lyjyVDoC1tKgudp7x7BAaqNh/z4Gr59Ozvy1nxcQqQLu2SvzJTXO3wAg
 5Tb/ReGpG//FcVxgY/MyJedmZRWwr86WSRERsoKsIia5D8KtzCWfN3RUz1Rqd7qX5SN5
 +XIg==
X-Gm-Message-State: ACgBeo0t88u7u7dzbJnauWB3NHvYx6/kf+GYevW6SdzDSODxec7i+cyO
 kecO4nRZiMlSj6GCsKJTCsRA5KfoAAruhTL0bAY=
X-Google-Smtp-Source: AA6agR7UrWWcdefjI5jUoxo77LkjqTPIhxNnO4p1T26x2Mt+qW+0cnDlhMncW2H1YORPKYARPrDRD0mMizgKXkCDXao=
X-Received: by 2002:a05:6402:1e8c:b0:43d:db52:78a8 with SMTP id
 f12-20020a0564021e8c00b0043ddb5278a8mr3233023edf.324.1659407391399; Mon, 01
 Aug 2022 19:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com>
 <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
 <20220801225538.qtdb5zd66g6ipewz@pengutronix.de>
 <CAOMZO5DUTxQKbpTVOgaVC0V7hPqJG77sgmkW8p=aNpG8th-aLw@mail.gmail.com>
 <CAHCN7xL2w7a=SeXbwcNNxqb3kpRV9Bs0AbK0Nmjbj+dm0NDaVA@mail.gmail.com>
 <CAOMZO5BQWnUj4Ouq3=vhqq55zN8otO_9vPX8ht+muFM_5pg9Fg@mail.gmail.com>
In-Reply-To: <CAOMZO5BQWnUj4Ouq3=vhqq55zN8otO_9vPX8ht+muFM_5pg9Fg@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 1 Aug 2022 21:29:40 -0500
Message-ID: <CAHCN7xJy6X5733m3zwcFMuWM9oGHJEmKrs2KUNhzMzNVggRx0g@mail.gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, robert.chiras@nxp.com,
 laurentiu.palcu@nxp.com, NXP Linux Team <linux-imx@nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 1, 2022 at 8:53 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Mon, Aug 1, 2022 at 10:39 PM Adam Ford <aford173@gmail.com> wrote:
>
> > I managed to get my HDMI output working. I had the lanes set to 2
> > instead of 4.  Once I switched to 4-lanes, the monitor came up in
> > 1080p.  I haven't yet been able to get other modes to work.
>
> Ok, good. On another thread, you mentioned that you were also trying
> to get LVDS to work via SN65DSI83.
>
> Does LVDS work for you on this branch?

I haven't tried with Marek's latest suggestion.  In the other thread
he mentioned a burst mode and setting the DSI speeds to higher
frequencies, but the patch he had didn't look like it would apply
cleanly, so I will need to dig into that a bit further.  Since my
company doesn't really ship the LVDS displays with the kits, the HDMI
is the default video, so I've been focusing on it.

To answer Marco's question, I was able to revert "MLK-21958-13:
drm/bridge: adv7511: Limit supported clocks" and still get a display
at 1080p, but all the other resolutions I tried appear to come up
blank.  I didn't try every one.  With that revert, more options come
available, but 1440x900 and 800x600 were options I tried
unsuccessfullyl.

adam
