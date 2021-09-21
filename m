Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1714139CF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 20:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A872E89EA6;
	Tue, 21 Sep 2021 18:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E81189EA6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 18:11:36 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id t4so41986qkb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 11:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p6xJlOV/AA3gdL3eokxN6CeMQ97Om1X9bVexxSR5pYM=;
 b=Fx4246vsEZTjsua7p7npQGuOk52DKDzDn3gUCRyxgSrTQqrX+RlfVeFb7MHPK/dmJB
 X3I+PN8WdN0WAJjUnGQRyFAMZnHj43dRGyg5QWKdt7dqhOd8GrHSpalndKOeffxOlgqA
 NXZWb/Iq/WNjNlG234qEWphLFhaerma8FkKzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p6xJlOV/AA3gdL3eokxN6CeMQ97Om1X9bVexxSR5pYM=;
 b=vUB70Lc7MDr2T3GbpZyHrbK+DhRI8bxwTg3UTq/onDWdmsFc/u0Uio+m3Y2NeNPkyO
 eJQw+PzXsSGn8qlAT6QxvMsHl/+bik7MF8Dl6ndQ/u6YCGRPb7vjCRLyEIlRasNsXkPx
 XLl9zC188X9Gd6y9HXQE41Nt5JsIqFiqMi6hSA9BuqaLZaDKIPP+OKO7ZemsO5CE0G5M
 Bvjfj3FJJvjMnAJ2VILhACMMOxL0aqz2ko41jtF8xpwcABoQZNqo9basnhRyPs4+XzUf
 9WoOW1mzmuUn5awY/s5syLRzpBcHP17X+dsGRA8bSC9DplYtnJUvLCKabquSYExl4bFe
 +HbQ==
X-Gm-Message-State: AOAM530Kyalau46dezuSGeOFAXsgBvpSISKHW4h2zOO/tFNKEAfx6loN
 NQFZVYknUETYbKNNv1o2C5H66C839cc1mkb/9+/Oxw==
X-Google-Smtp-Source: ABdhPJwXR/817dyUOCGNMSSFeEY9wfNynvdXBIQFl53DvGlCHQZlPqmkPYDJy7xHQ7mDvlFG8NCwkcZ8HL15RwK++10=
X-Received: by 2002:a25:6744:: with SMTP id b65mr23138811ybc.100.1632247895000; 
 Tue, 21 Sep 2021 11:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210918102058.v5.1.I2351df94f18d5d8debc22d4d100f36fac560409a@changeid>
 <20210918102058.v5.2.Ifcb5df5de5b1cead7c99e0f37b044ef5cfc69eda@changeid>
 <CAD=FV=VgQWLmPEFBv=Ufnm8Gc4srRUd15GNbSrL-pYBGysCYqw@mail.gmail.com>
In-Reply-To: <CAD=FV=VgQWLmPEFBv=Ufnm8Gc4srRUd15GNbSrL-pYBGysCYqw@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Tue, 21 Sep 2021 11:11:24 -0700
Message-ID: <CA+cxXhky5prd6jpNyE+6OKC2QF+A+9dmi+ijt6-911H9xEkAXQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: Doug Anderson <dianders@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Hi

On Tue, Sep 21, 2021 at 9:02 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sat, Sep 18, 2021 at 10:21 AM Philip Chen <philipchen@chromium.org> wrote:
> >
> > +static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
> > +                                  struct drm_dp_aux_msg *msg)
> > +{
> > +       struct ps8640 *ps_bridge = aux_to_ps8640(aux);
> > +       struct regmap *map = ps_bridge->regmap[PAGE0_DP_CNTL];
> > +       struct device *dev = &ps_bridge->page[PAGE0_DP_CNTL]->dev;
> > +
> > +       unsigned int len = msg->size;
>
> nit: usually no blank lines in the variable definition section.
Fixed in v6.
PTAL.

>
>
> > +       base = PAGE0_SWAUX_ADDR_7_0;
> > +       addr_len[PAGE0_SWAUX_ADDR_7_0 - base] = msg->address;
> > +       addr_len[PAGE0_SWAUX_ADDR_15_8 - base] = msg->address >> 8;
> > +       addr_len[PAGE0_SWAUX_ADDR_23_16 - base] = (msg->address >> 16) &
> > +                                                 SWAUX_ADDR_19_16_MASK;
> > +       addr_len[PAGE0_SWAUX_ADDR_23_16 - base] |= (msg->request << 4) &
> > +                                                  SWAUX_CMD_MASK;
>
> optional nit: Probably you could get rid of the mask for the request.
> After all, you're storing it to a thing that's a byte (so bits above
> bit 7 will implicitly be masked) and you're left shifting by 4 (so
> bits 0-3 will implicitly be masked) so this just makes it uglier. ;-)
>
Fixed in v6.
PTAL.
> optional nit: In theory you could also get rid of the
> SWAUX_ADDR_19_16_MASK and if you really wanted to you could error
> check that the address wasn't bigger than 20-bits since giving an
> error for an invalid address would actually be better than silently
> masking it anyway...
>
Fixed in v6.
PTAL.
>
> > +       if (len && (request == DP_AUX_NATIVE_READ ||
> > +                   request == DP_AUX_I2C_READ)) {
> > +               /* Read from the internal FIFO buffer */
> > +               for (i = 0; i < len; i++) {
> > +                       ret = regmap_read(map, PAGE0_SWAUX_RDATA,
> > +                                         (unsigned int *)(buf + i));
>
> The cast to "unsigned int *" looks wrong to me. You can't just cast
> like this for a number of reasons. Go back to reading into a local
> variable and copy the byte into your buffer.
>
Previously I was not 100% sure about this change either.
Now I'm sure it is bad after some experiments.
In v6, I reverted to how this was handled in v3.
PTAL.

>
> Other than the regmap_read() this looks fine to me. If you send a v6
> with that fixed I'll plan to wait a day or two and then apply it with
> Sam's tags.
>
> -Doug
