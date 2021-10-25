Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2C343A419
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 22:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BCB6E223;
	Mon, 25 Oct 2021 20:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB026E231
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 20:10:02 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id r6so17228982oiw.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 13:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=XpWOcugTG74fbWN1bpzK+xM/2QXAORc3DyN8mZ3TGcc=;
 b=cWYlranl+VvYT6cGBkvRituonRCQ8xo287DlQ3TggtEV9MT0Lui36QoBArMMef4wI8
 6URDG2bbYFXmfYDDkM92TSLP7m4YETsbeGB9ODSAuYkzqyg9BamcV26fwufYD6NwPm/T
 GgxP/KhyGvLPGqbR1/eJfIhZjkL20fH1Gq4M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=XpWOcugTG74fbWN1bpzK+xM/2QXAORc3DyN8mZ3TGcc=;
 b=GHY2MPTzrOf0d3KAab9cJu2OJ5n5aoAOrNqiNLPrdhVLlagYdG65shihz13fhBp1iK
 ytLo5NIi6lPZf9b08FiP8E6nYQ6F8Q2M0GPA8kWbNmhlVKf/NsK7v09hvuzdoplY6n4K
 SkVlcj1kBmp44IEHObynijTtjUHF0n+RSrDdTXSXX1w2YdXX0bUU5AlllZqXeFlNqIZq
 UEexREuDj0MTm5wHEmGJW/dRTFqFgoc+i5fRPkTuuiHFperNUHXCxCOoBL8VA1iSMvZP
 pZpUn9cSELJrWexC8vqBEblsfUyrfp3pWC295ta/SJNPgWBQr4CrK9SyuyQrOllPLAKW
 nUyw==
X-Gm-Message-State: AOAM533epfEW/NDP5D3AAFXm34QaKcD1VzQme5HBywfpygYtgIrft4ZY
 6VHm6y2fFNqe0NDaN347OHZ4ouNGJy+1A05hKM6lFGxqf1I=
X-Google-Smtp-Source: ABdhPJwVCoH6cJbBQw7TBTQyxYfFW8TBVTgn8/Ih2eZq4+BNrwx1P+AnmpfMimTUQg0ThRRoDX003B02GnzQXa2j/W8=
X-Received: by 2002:a05:6808:1d9:: with SMTP id
 x25mr12883185oic.64.1635192601567; 
 Mon, 25 Oct 2021 13:10:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Oct 2021 13:10:01 -0700
MIME-Version: 1.0
In-Reply-To: <20211021140552.v2.2.I3ed2a84c58d9e81965f497d587f735eea56c1684@changeid>
References: <20211021140552.v2.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
 <20211021140552.v2.2.I3ed2a84c58d9e81965f497d587f735eea56c1684@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 25 Oct 2021 13:10:01 -0700
Message-ID: <CAE-0n52UdhHwM0rViVdyE4wO3sw8DzU5fEFp_aKTQBwLfR-qgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: parade-ps8640: Populate devices on
 aux-bus
To: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>
Cc: dianders@chromium.org, Andrzej Hajda <a.hajda@samsung.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org
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

Quoting Philip Chen (2021-10-21 14:06:00)
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 220ca3b03d24..f99a2e0808b7 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -149,6 +150,23 @@ static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
>         return container_of(aux, struct ps8640, aux);
>  }
>
> +static bool ps8640_of_panel_on_aux_bus(struct device *dev)
> +{
> +       struct device_node *bus, *panel;
> +
> +       bus = of_get_child_by_name(dev->of_node, "aux-bus");
> +       if (!bus)
> +               return false;
> +       of_node_put(bus);

This should come after the next line...

> +
> +       panel = of_get_child_by_name(bus, "panel");

here, so that 'bus' can't go away before getting children nodes. It
doesn't actually matter in this case because 'device' holds the aux-bus,
but we shouldn't add anti-patterns to the code lest someone copies it
where it actually matters.

> +       if (!panel)
> +               return false;
> +       of_node_put(panel);
> +
> +       return true;
> +}
> +
>  static void ps8640_ensure_hpd(struct ps8640 *ps_bridge)
>  {
>         struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
