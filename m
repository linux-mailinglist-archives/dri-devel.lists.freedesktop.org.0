Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8811978E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB6A6E99A;
	Tue, 10 Dec 2019 21:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84B86E992
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:34:00 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z17so21518382ljk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 13:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sfwPNW+0w7SYOVN5vzqnBaCzSrm1enkZiO9HCQzgqjc=;
 b=ELDYffyPwLTppPAGsVU3YxNSQOLOcATsg+IC8f7KpshW1lI8HVOS/LPhBAsT3ufSID
 fT8v7xNJc4kv0wTGrieBMQqsRE05FMAqAlQlWeqPYjlA6ow0ox6lVlQeD3a0gHQCNpvO
 UQuarskxChn5qju4s1+DdsIwkp9B7GHuVeF6VYnrRLMyisteUJaHFhFjU/S8KbDGs+wP
 PxqBkBxPJ4ttyp+Sef34gOKwQPC9beuKUBnoGOn5XjUWMEO9A2EEJEl1u9PnSr5O44Lx
 VMiuT+azPKHva2915rPrbzbWb1+RwsYjjYQJPUWnIZz+Df5kMzfE10XKxc8RFFUbhxa5
 icmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sfwPNW+0w7SYOVN5vzqnBaCzSrm1enkZiO9HCQzgqjc=;
 b=rn3V/1yTICZwTGsJkFDWqowXDINcIxNmCINXwTY+59+1PdFfz8MFZQgBYkJ88mWj7R
 4rCXFkedL5oydx0E7NOdXX+HxXd4KGyxNlsfLZJC6azVU2CCEIv1nX9OZnTqB6R8bP/b
 TgYUXeYTB4+UMgFx1bqoLdxv+vycXPHRqIBHZqlJrS5PY/obyRThWBjhbGgb515Jve3n
 2G74oDbDhfrkLKBeCs/60DDFkw1ViCdllH6VOG/4RTVppwkXDow2jiOgE2rRPCPEtOA7
 UM+tL/6OwTN/Lw59qUkK4971vsmDDcnnk6C9rbzMkr3/HQXrnImLwNh2p3P8e90nIrjq
 WXYg==
X-Gm-Message-State: APjAAAXR88S8K/cmE6jc7ovmi3RsHzLEqMB6WgRIsGiX25H3TdA0uZN0
 8xkngCKAQIjifKmhJwypl+5vDW4mhd2oj2Sd66AuMQ==
X-Google-Smtp-Source: APXvYqxlNtTXCGGpW9eRPgRQxUIXYH1CqIcL6wpo3KqsA4rHt7y1htGJhYXnIDuRbtBsJbNT4EJP7YmxbMU5QzD97u0=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr21298405ljh.42.1576013639357; 
 Tue, 10 Dec 2019 13:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-8-sam@ravnborg.org>
 <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
 <CACRpkdZrReQs08+bXS7s7eJ-K76nMGvRgQ-L-1-baunEtiF40g@mail.gmail.com>
 <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
In-Reply-To: <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Dec 2019 22:33:48 +0100
Message-ID: <CACRpkdZ7jg7JwNk12m9pGXOVBxHRta8nBWmpdqFvfQHB=8LptA@mail.gmail.com>
Subject: Re: [PATCH v1 07/26] drm/panel: remove get_timings
To: Maxime Ripard <mripard@kernel.org>
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
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 4, 2019 at 9:16 AM Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Dec 03, 2019 at 04:20:24PM +0100, Linus Walleij wrote:

> > On the DSI displays in video mode there is also this EOL area
> > which seems to be where the logic is normally just idling for a
> > while, that can be adjusted on some hardware as well, but
> > I don't quite understand it admittedly. Sometimes I wonder if
> > anyone really understands DSI... :/
>
> I'm not aware of any EOL area in MIPI-DSI that would make the hardware
> idle, don't you mean LP-11?

I think in the spec the bubble used for this is tagged "BLLP"
Blanking-Line-Low-Power or something.

IIUC it is possible for displays to either receive continuous NULL
packets or blanking packets or go to LP mode in this area.

And since that is not there for e.g. DPI displays I feel it adds
another layer of confusion to timings.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
